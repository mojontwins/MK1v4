// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

#ifdef PLAYER_CUSTOM_VENG

	#define PLAYER_MAX_VSWIM		112
	#define PLAYER_ASWIM			40
	#define PLAYER_AFLOAT 			8

	#define PLAYER_G_JUMPING 		16
	#define PLAYER_VY_JUMP_INITIAL 	384
	#define PLAYER_VY_JUMP_STEPS 	8
	#define PLAYER_VY_JUMP_RELEASE 	192

	void player_custom_veng (void) {
		// Modify vy as needed

		// For this game, we use the normal sideways jumping engine if n_pant < 40,
		// and a new, custom one for 40<=n_pant<60.

		if (n_pant < 40) {
			// Vanilla Nin Nin!

			// Jump down platform

			#asm
					
					ld  a, (_player + 26) 		// player.possee
					or  a
					jr  z, m_vert_jump_down_done

					ld  a, (_pad0)
					and sp_DOWN
					ld  a, 0
					jr  nz, m_vert_jump_down_done

					ld  hl, PLAYER_VY_INICIAL_SALTO*2
					ld  (_player + 8), hl 		// player.vy

					inc a

				.m_vert_jump_down_done
					ld  (_disable_collide_platform), a
			#endasm

			// Gravity is reduced while jumping

			#asm
				.player_veng_gravity

					// player.vy = player.vy + (player.saltando ? PLAYER_G_JUMPING : PLAYER_G);

					ld  hl, (_player + 8)			// player.vy
					ld  de, PLAYER_G

					ld  a, (_player + 19) 			// player.saltando
					or  a 
					jr  z, player_veng_gravity_add

					ld  de, PLAYER_G_JUMPING

				.player_veng_gravity_add
					add hl, de 
					push hl 						// New vy

					// Limit

					// player.vy >= PLAYER_MAX_VY_CAYENDO --->
					// player.vy - PLAYER_MAX_VY_CAYENDO >= 0
					ld  de, -PLAYER_MAX_VY_CAYENDO
					add hl, de 
					bit 7, h 
					pop hl  						// Retrieve vy
					jr  nz, player_veng_gravity_done 

					ld  hl, PLAYER_MAX_VY_CAYENDO

				.player_veng_gravity_done 
					ld  (_player + 8), hl
			#endasm

				// Jumping is a big boost

			#asm
				.player_jump_start
					ld  a, (_pad_this_frame)
					and #(sp_UP | sp_FIRE)
					cp  #(sp_UP | sp_FIRE)
					jr  z, player_jump_start_done

					ld  a, (_player + 19) 			// player.saltando 
					or  a 
					jr  nz, player_jump_start_done

					ld  a, (_player + 26) 			// player.possee 
					or  a 
					jr  nz, player_jump_start_do

					ld  a, (_player + 25) 			// player.gotten
					or  a 
					jr  z, player_jump_start_done

				.player_jump_start_do
					xor a 
					ld  (_player + 14), a			// player.cont_salto
					inc a 
					ld  (_player + 19), a 			// player.saltando;
					ld  (_player + 43), a 			// player.just_jumped;
					ld  hl, -PLAYER_VY_JUMP_INITIAL
					ld  (_player + 8), hl 			// player.vy
			
					ld  l, 3 
					call _peta_el_beeper

				.player_jump_start_done
			#endasm 

			#asm
				.player_jump_pressing
					ld  a, (_pad0) 
					and #(sp_UP | sp_FIRE)
					cp  #(sp_UP | sp_FIRE)
					jr  z, player_jump_not_pressing 

					ld  a, (_player + 19) 			// player.saltando
					or  a 
					jr  z, player_jump_done

					ld  a, (_player + 14)			// player.cont_salto 
					inc a 
					ld  (_player + 14), a 			// player.cont_salto 

					cp PLAYER_VY_JUMP_STEPS 
					jr  nz, player_jump_done

					xor a 
					ld  (_player + 19), a 			// player.saltando
					jr  player_jump_done

				.player_jump_not_pressing
					ld  a, (_player + 19) 			// player.saltando
					or  a 
					jr  z, player_jump_done 

					ld  hl, -PLAYER_VY_JUMP_RELEASE
					ld  (_player + 8), hl 			// player.vy

					xor a 
					ld  (_player + 19), a  			// player.saltando

				.player_jump_done
			#endasm

		} else {
			// DX Swim
			/*
			if ((pad0 & sp_DOWN) && (pad0 & sp_UP)) {
				if(player.y > 512) {
					player.vy -= PLAYER_AFLOAT;
					if (player.vy < (PLAYER_MAX_VSWIM >> 1)) player.vy = -(PLAYER_MAX_VSWIM >> 1);
				}
				thrusting = 0;
			}

			if ((pad0 & sp_DOWN) == 0) {
				if (player.vy < PLAYER_MAX_VSWIM) player.vy += PLAYER_ASWIM;
				thrusting = 1;
			}

			if ((pad0 & sp_UP) == 0) {
				if (player.vy > -PLAYER_MAX_VSWIM) player.vy -= PLAYER_ASWIM;
				thrusting = 1;
			}
			*/
			#asm
				.swim_check_idle
					ld  a, (_pad0)
					and #(sp_DOWN | sp_UP)
					cp  #(sp_DOWN | sp_UP)
					jr  nz, swim_no_idle

					//if(player.y > 512) -> MSB >= 2
					ld  hl, (_player + 2)		// player.y
					ld  a, h 
					cp  2 
					jr  c, swim_float_end

					ld  hl, (_player + 8) 		// player.vy

					ld  de, #(-PLAYER_AFLOAT);
					add hl, de 

					//if (player.vy < (PLAYER_MAX_VSWIM >> 1)) ->
					//if (PLAYER_MAX_VSWIM >> 1) > player.vy
					ld  de, #(PLAYER_MAX_VSWIM * 2)
					call l_gt 						// C if DE > HL
					jr  nc, swim_float_vy_set

					ld  hl, #(-(PLAYER_MAX_VSWIM / 2))

				.swim_float_vy_set
					ld  (_player + 8), hl

				.swim_float_end
					xor a
					ld  (_thrusting), a

				.swim_no_idle

					ld  a, (_pad0)
					and sp_DOWN 
					jr  nz, swim_down_done

				.swim_down
					ld  hl, (_player + 8)
					// if (player.vy < PLAYER_MAX_VSWIM) -> PLAYER_MAX_VSWIM > player.vy)
					ld  de, PLAYER_MAX_VSWIM 
					call l_gt 						// C if DE > HL
					jr  nc, swim_down_done

					ld  de, PLAYER_ASWIM
					add hl, de 
					ld  (_player + 8), hl

				.swim_down_done

					ld  a, (_pad0)
					and sp_UP
					jr  nz, swim_up_done

				.swim_up
					ld  hl, (_player + 8)
					// if (player.vy > -PLAYER_MAX_VSWIM) -> -PLAYER_MAX_VSWIM < player.vy)
					ld  de, #(-PLAYER_MAX_VSWIM)
					call l_lt 						// C if DE < HL
					jr  nc, swim_up_done

					ld  de, #(-PLAYER_ASWIM)
					add hl, de 
					ld  (_player + 8), hl

				.swim_up_done
			#endasm
		}
	}
#endif

#ifdef PLAYER_CUSTOM_HENG
	void player_custom_heng (void) {
		// Modify vx as needed
	}
#endif

#ifdef PLAYER_CUSTOM_FRAME
	unsigned char player_custom_frame (void) {
		// Return a frame NUMBER (0-7)

		#asm 
				ld  a, (_n_pant)
				cp  40 
				jr  nc, _player_custom_frame_swim

			._player_custom_frame_walk
	
				ld  c, 3 
				
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

				and 3 
				ld  h, 0 
				ld  l, a 
				ld  de, _player_walk_cycle 
				add hl, de 
				ld  c, (hl)

				jr  m_frame_set

			.m_frame_still
				ld  c, 1

			.m_frame_set
				ld  a, (_player + 22) 		// player.facing
				add c
				ld  l, a 		
				ld  h, 0
				ret

			._player_custom_frame_swim

				ld  c, 8

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_set 			// Not thrusting -> still

				ld  a, (_maincounter)
				srl a
				srl a
				srl a 
				and 3

				ld  h, 0 
				ld  l, a 
				ld  de, _player_walk_cycle 
				add hl, de 
				ld  a, (hl)
				add c
				ld  c, a 

				jr  m_frame_set
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

	void extra_enems_init (void) {
		// Runs for each enemy when entering a new screen. You should check _en_t
		// Current malote is malotes [enoffsmasi], iterator is enit
		//if (_en_t >= 5  && _en_t < 8)  {
		//	enems_en_an_calc (_en_t - 1);
		//}
		#asm
				ld  a, (__en_t)
				cp  5 
				ret c 
				cp  9
				ret nc 
				ld  h, 0
				ld  l, a 
				dec hl
				jp _enems_en_an_calc
		#endasm
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame
		#asm 
			// if (_en_t >= 5 && _en_t < 8) {

				ld  a, (__en_t)
				cp  5 
				ret c 
				cp  8
				ret nc 

				call en_lineal_do
			
				ld  a, (__en_t)
				cp  7 
				ret nz 

				// if (_en_mx < 0 || _en_my < 0) {
				ld  a, (__en_mx) 
				bit 7, a 
				jr  nz, enm_turn_around 
				ld  a, (__en_my)
				bit 7, a 
				ret z

			.enm_turn_around 
				ld  a, (_enit)
				sla a
				ld  b, 0
				ld  c, a
				ld  hl, _en_an_next_frame
				add hl, bc
			
				push hl 		// en_an_next_frame [enit]
				
				ld  bc, (_enit)
				ld  b, 0
				
				ld  hl, _en_an_frame
				add hl, bc
				ld  a, (hl)

				ld  hl, _en_an_base_frame
				add hl, bc
				add a, (hl)
				add 2 			// + 2

				sla a 			// This will work in 8 bit. Always few frames max.			
				ld  c, a 		// B is already 0
				ld  hl, _sprite_cells

				add hl, bc 		// HL -> sprite_cells [...]
				pop de 			// DE -> en_an_next_frame [enit]

				ldi
				ldi
		#endasm
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

		return 1;
	}

#endif

#ifdef ENABLE_CUSTOM_HOTSPOTS
	unsigned char custom_hotspots() {
		// hotspot type is hotspot_t.
		// set rdi to prevent clearing the hotspot.
	}
#endif
