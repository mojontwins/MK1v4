// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

unsigned char rand (void);
void before_vsync (void) {
	// Run every game loop right before vsync.
	if (wyz_signal) {
		wyz_stop_sound ();
		wyz_play_music (1 + (rand () & 1));
	}
}

#ifdef PLAYER_CUSTOM_VENG
	void player_custom_veng (void) {
		// Modify vy as needed
	}
#endif

#ifdef PLAYER_CUSTOM_HENG
	void player_custom_heng (void) {
		// Modify vx as needed
	}
#endif

#ifdef PLAYER_CUSTOM_FRAME
	unsigned char player_custom_frame (void) {
		#asm
				ld  c, 1 					// AIRBORNE
				
				// if player.possee == 0 && player.gotten == 0
				ld  a, (_player + 26) 		// player.possee 
				ld  b, a 
				ld  a, (_player + 25) 		// player.gotten 
				or  b
				jr  z, m_frame_set

			.m_frame_on_something

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_still 		// Not thrusting -> still

				ld  hl, (_player + 6) 		// player.vx
				ld  a, h 
				or  l 
				jr  z, m_frame_still 		// Not moving -> still

				ld  a, (_gpx)
				srl a 
				srl a 
				srl a 

				// Cycle cells 1 2 3 1 2 3 ...

				// de / hl, module in de 
				ld  d, 0 
				ld  e, a 
				ld  hl, 3 
				call l_div_u
				ld  c, e 					// (_gpx >> 3) % 3
				inc c 						// + 1

				jr  m_frame_set

			.m_frame_still
				ld  c, 0 					(// IDLE))

			.m_frame_set
				ld  a, (_player + 22) 		// player.facing
				add c

				ld  h, 0
				ld  l, a 					// Return value
		#endasm 
	}
#endif

#ifdef PLAYER_CUSTOM_BG_HIT
	unsigned char custom_bg_hit (void) {
		// check hit_v, hit_h and modify player.x / player.y as you need
		// Return 1 if hit registered
	}
#endif

#ifdef ENABLE_CUSTOM_ENEMS

	// Enemy type 'guard' has states

	#define Z_PURSUING 		0
	#define Z_FALLING 		2
	#define Z_JUMPING 		4

	// And needs some vars

	unsigned char en_an_ct_j [MAX_ENEMS];
	unsigned char _en_an_facing;
	unsigned char _en_an_state;
	unsigned char _en_an_feet;
	unsigned char _en_an_lfoot;
	unsigned char _en_an_rfoot;

	// And needs custom subroutines

	// Aux

	void my_shr4 (void) {
		#asm
			.shr4
				srl a
				srl a
				srl a
				srl a
				ret
		#endasm
	}

	void pop_and_pursue (void) {
		_en_y &= 0xf0; en_an_y [enit] = _en_y << 6;
		_en_an_state = Z_PURSUING;
	}

	void check_feet (void) {
		// Set a flag if there's ground under feet
		#asm
				// Left foot
				ld  a, (__en_x)
				add 4
				call shr4
				ld  c, a
				ld  a, (__en_y)
				add 16
				call shr4
				call _attr_enems
				ld  a, l
				and 12
				ld  (__en_an_lfoot), a

				// Right foot
				ld  a, (__en_x)
				add 11
				call shr4
				ld  c, a
				ld  a, (__en_y)
				add 16
				call shr4
				call _attr_enems
				ld  a, l
				and 12
				ld  (__en_an_rfoot), a

				// Both feet
				ld  c, a
				ld  a, (__en_an_lfoot)
				or  c
				ld  (__en_an_feet), a
		#endasm
	}

	void add_to_en_an_vy (void) {
		// Add BC (signed) to _en_an_vy [enit]
		#asm
				ld  hl, (_enit)
				ld  h, 0
				add hl, hl
				ld  de, _en_an_vy
				add hl, de 
				push hl
				ld  a, (hl)
				inc hl
				ld  h, (hl)
				ld  l, a
				add hl, bc
				pop de
				ld  a, l
				ld  (de), a
				inc de
				ld  a, h
				ld  (de), a
		#endasm
	}

	void add_vy_to_y_and_cnv (void) {
		#asm
			// en_an_y [enit] += en_an_vy [enit];
				ld  hl, (_enit)
				ld  h, 0
				add hl, hl
				ld  de, _en_an_y
				add hl, de 
				push hl

				ld  hl, (_enit)
				ld  h, 0
				add hl, hl
				ld  de, _en_an_vy
				add hl, de 
				ld  a, (hl)
				inc hl
				ld  h, (hl)
				ld  l, a

				pop de
				ld  a, (de)
				ld  c, a
				inc de
				ld  a, (de)
				ld  b, a
				
				add hl, bc

				ld  a, h
				ld  (de), a
				dec de
				ld  a, l
				ld  (de), a

			// _en_y = en_an_y [enit] >> 6;
				ex  de, hl
				ld  l, 6
				call l_asr
				ld  a, l
				ld  (__en_y), a
		#endasm
	}

	// And...

	void extra_enems_init (void) {
		// Runs for each enemy when entering a new screen. You should check _en_t
		// Current malote is malotes [enoffsmasi], iterator is enit

		if (_en_t == 15) {
			malotes [enoffsmasi].x = malotes [enoffsmasi].xy1 & 0xf0;
			malotes [enoffsmasi].y = malotes [enoffsmasi].xy1 << 4;			
			en_an_vy [enit] = 0;
			// en_an_state [enit] is already set to 0 (Z_PURSUING).
		}
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame

		// Guard

		if (_en_t == 15) {
			
			#asm
		
				// State handy
				//_en_an_state = en_an_state [enit];
		
					ld  bc, (_enit)
					ld  b, 0
					ld  hl, _en_an_state
					add hl, bc
					ld  a, (hl)
					ld  (__en_an_state), a	
			
					call _check_feet

				// if (_en_an_state & Z_PURSUING) {				
					ld  a, (__en_an_state)
					and Z_PURSUING
					jp  z, z_pursuing_done

				// Horizontal movement
				// Make jump?
				// Calculate l/r collision
				
					ld  a, (__en_an_facing)
					or  a
					ld  a, (__en_x)
					jr  z, z_pursuing_c_facing_right

				.z_pursuing_c_facing_left						
					add 4
					jr  z_pursuing_c_facing_done

				.z_pursuing_c_facing_right
					add 11

				.z_pursuing_c_facing_done
					call shr4
					ld  (_rdd), a
					ld  c, a

					ld  a, (__en_y)
					call shr4
					call _attr_enems
					ld  a, l
					ld  (_rdi), a

					ld  a, (_rdd)
					ld  c, a
					ld  a, (__en_y)
					add 15
					call shr4
					call _attr_enems

					ld  a, (_rdi)
					or  l
					and 8

					ld  (_rdd), a 			; rdd set -> horizontal collision
				
				// if ((_en_an_state & Z_JUMPING) == 0) {
					ld  a, (__en_an_state)
					and Z_JUMPING
					jp  nz, z_pursing_jump_fall_done

				/*
					if (
						(gpy < _en_y && 
							(_en_an_facing && _en_an_lfoot == 0) ||
							(_en_an_facing == 0 && _en_an_rfoot == 0)
						) ||
						rdd
					) {
				*/

				.z_pursuing_jfc1
					ld  a, (__en_y)
					ld  c, a
					ld  a, (_gpy)
					cp  c
					jr  nc, z_pursuing_jfc2

				.z_pursuing_jfc11
					ld  a, (__en_an_facing) 
					or a 
					jr  z, z_pursuing_jfc12

					ld  a, (__en_an_lfoot)
					or a
					jr  z, z_pursuing_jump_start

				.z_pursuing_jfc12
					ld  a, (__en_an_facing)
					or  a
					jr  nz, z_pursuing_jfc2

					ld  a, (__en_an_rfoot)
					or  a
					jr  z, z_pursuing_jump_start

				.z_pursuing_jfc2
					ld  a, (_rdd)
					or  a
					jr  z, z_pursuing_jump_start_done

				// Also both feet on the ground

					ld  a, (__en_an_lfoot)
					or  a
					jr  z, z_pop_and_fall

					ld  a, (__en_an_rfoot)
					or  a
					jr  z, z_pop_and_fall

				.z_pursuing_jump_start
				
				// Jump!
				
				// _en_an_state |= Z_JUMPING;
					ld  a, (__en_an_state)
					or  Z_JUMPING
					ld  (__en_an_state), a

				// en_an_ct_j [enit] = 8;
					ld  bc, (_enit)
					ld  b, 0
					ld  hl, _en_an_ct_j
					add hl, bc
					ld  a, 8
					ld  (hl), a

				// en_an_vy [enit] = -128; // -128 16 bit => FF80
					ld  hl, (_enit)
					ld  h, 0
					add hl, hl
					ld  bc, _en_an_vy
					add hl, bc
					ld  a, 0x80
					ld  (hl), a
					inc hl
					ld  a, 0xff
					ld  (hl), a

				// _en_y2 = _en_y;
					ld  a, (__en_y)
					ld  (__en_y2), a

					jp en_zombie_continue
				
				.z_pursuing_jump_start_done

				// Make fall?
					
				// if (_en_an_feet == 0) {				
					ld  a, (__en_an_feet)
					or  a
					jr  nz, z_pursuing_fall_start_done
				
				.z_pursuing_fall_start_do
				// _en_an_state = Z_FALLING;
					ld  a, Z_FALLING
					ld  (__en_an_state), a

				// en_an_vy [enit] = 0;
					ld  hl, (_enit)
					ld  h, 0
					add hl, hl
					ld  bc, _en_an_vy
					add hl, bc
					xor a
					ld  (hl), a
					inc hl
					ld  (hl), a
						
					jp en_zombie_continue

				.z_pop_and_fall
					ld  hl, __en_x
					ld  a, (__en_an_facing) 	// 0 = right
					or  a
					jr  z, z_pop_right

				.z_pop_left
					inc (hl)
					jr  z_pursuing_fall_start_do

				.z_pop_right 
					dec (hl)
					jr  z_pursuing_fall_start_do
					
				.z_pursuing_fall_start_done
				
				.z_pursing_jump_fall_done

				// Move
				// if (!rdd) {
					ld  a, (_rdd)
					or  a
					jr  nz, z_pursuing_move_done
					
				// if (gpx < _en_x) _en_x --; else if (gpx > _en_x) _en_x ++;
				.z_pursuing_check_move_left

					ld  a, (__en_x)
					ld  c, a
					ld  a, (_gpx)
					cp  c
					jr  nc, z_pursuing_check_move_right

					ld  a, c
					dec a
					ld  (__en_x), a
					jr  z_pursuing_move_done

				.z_pursuing_check_move_right
					ld  a, (_gpx)
					ld  c, a
					ld  a, (__en_x)
					cp  c
					jr  nc, z_pursuing_move_done

					inc a
					ld  (__en_x), a
				.z_pursuing_move_done
			
				.z_pursuing_done

					call _check_feet

				// Jump
				// if (_en_an_state & Z_JUMPING) {
					ld  a, (__en_an_state)
					and Z_JUMPING
					jr  z, z_jumping_done

				.z_jumping
				// if (en_an_ct_j [enit]) {
				.z_jump_ct_check
					ld  bc, (_enit)
					ld  b, 0
					ld  hl, _en_an_ct_j
					add hl, bc
					ld  a, (hl)
					or  a
					jr  z, z_jump_ct_zero

				// en_an_ct_j [enit] --;
					dec (hl)

				// en_an_vy [enit] += (PLAYER_G/8);
					ld  bc, #(PLAYER_G/8)
					call _add_to_en_an_vy
					
					jr  z_jump_ct_done

				// } else {
				.z_jump_ct_zero
						
				// en_an_vy [enit] += (PLAYER_G);
					ld  bc, #(PLAYER_G)
					call _add_to_en_an_vy

				// if (_en_an_feet) {
					ld  a, (__en_an_feet)
					or  a
					jr  z, z_jump_ct_done

					call _pop_and_pursue
					jr en_zombie_continue			
				
				.z_jump_ct_done

					call _add_vy_to_y_and_cnv
									
				.z_jumping_done

				// Fall

				// if (_en_an_state & Z_FALLING) {
					ld  a, (__en_an_state)
					and Z_FALLING
					jr  z, z_falling_done

				.z_falling
					// if (_en_an_feet) {
					ld  a, (__en_an_feet)
					or  a
					jr  z, z_falling_feet_check_done

					call _pop_and_pursue
					jr en_zombie_continue
				.z_falling_feet_check_done

				// en_an_vy [enit] += PLAYER_G;
					ld  bc, #(PLAYER_G)
					call _add_to_en_an_vy
					call _add_vy_to_y_and_cnv
					
				.z_falling_done

				.en_zombie_continue
			#endasm

			en_an_state [enit] = _en_an_state;
			en_an_next_frame [enit] = sprite_cells [14 + ((maincounter >> 3) & 1)];
		}	
	}

	void extra_enems_checks (void) {
		// This is called at the end of the enems update loop, after collisions
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// with player or bullets have been tested.
	}

	void extra_enems_killed (void) {
		// This is called after enem number enit is killed.
		// _en_t has been already "marked as dead" (OR 128)
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
	}

	unsigned char this_enemy_kills (void) {
		// return 0 for enemies which shouldn't collide.
		// Collide means they will kill the player or get squashed.

		// Viejo no mata.
		if (_en_t == 1) return 0;

		return 1;
	}

#endif

#ifdef ENABLE_CUSTOM_HOTSPOTS
	unsigned char custom_hotspots() {
		// hotspot type is hotspot_t.
		// set rdi to prevent clearing the hotspot.
	}
#endif
