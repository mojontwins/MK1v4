// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// Add here your custom routines & vars

// In this game we'll be using different sets of attributes for the main
// tileset, depending on the level. 

// Attribute binaries are created using ts2bin and compressed with aplib.

// Custom tile colour attributes

extern unsigned char ts_attr_0 [0];
extern unsigned char ts_attr_1 [0];
extern unsigned char ts_attr_2 [0];

#asm
	._ts_attr_0
		BINARY "ts_attr_0c.bin"
	._ts_attr_1
		BINARY "ts_attr_1c.bin"
	._ts_attr_2
		BINARY "ts_attr_2c.bin"
#endasm

// Level set

unsigned char scr_ini [] = { 5, 40, 50, 17 };
unsigned char ini_x [] = { 2, 2, 2, 4 };
unsigned char ini_y [] = { 2, 2, 2, 0 };
unsigned char l_crucifixes [] = { 1, 16, 1, 1 };
unsigned char *l_ts_attr [] = {
	ts_attr_0, ts_attr_0, ts_attr_1, ts_attr_2
};

unsigned char new_level;
unsigned char level;

unsigned char new_level_string [] = "LEVEL 00";

// Enemy type 'zombie'

#define Z_APPEARING 	0
#define Z_PURSUING 		1
#define Z_FALLING 		2
#define Z_JUMPING 		4

unsigned char en_an_ct_j [MAX_ENEMS];
unsigned char _en_an_facing;
unsigned char _en_an_state;
unsigned char _en_an_feet;
unsigned char _en_an_lfoot;
unsigned char _en_an_rfoot;

unsigned char *zombie_cells [] = {
	extra_sprite_17_a, extra_sprite_18_a, extra_sprite_19_a, extra_sprite_20_a
};

// Enemy type 'María'

unsigned char *maria_cells [] = {
	extra_sprite_21_a, extra_sprite_22_a
};

// Keys

unsigned char phaskey;

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

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		new_level = 1;
		level = 3;
		phaskey = 0;
	}

	void hook_init_mainloop (void) {
		// End of level check


		// New level screen 

		if (new_level) {
			new_level = 0;
			sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
			sp_Invalidate (spritesClip, spritesClip);
			new_level_string [7] = level + '1';
			draw_text (12, 11, 71, new_level_string);
			draw_text (12, 13, 71, "_ANDALE!");
			sp_UpdateNow ();
			play_sfx (10);
			espera_activa (150);
			n_pant = scr_ini [level];
			init_player_values ();
			player.objs = 0; 
			enemy_killer = 0xff;
			on_pant = 0xff;

			// Decompress tileset attributes
			asm_int = (unsigned int) (l_ts_attr [level]);
			#asm
				ld hl, (_asm_int)
				ld de, _tileset + 2048
				jp depack
			#endasm
		}
	}

	void hook_mainloop (void) {
		// Revised level boundaries.

		// Bottom two rows can't connect down.
		if (gpy == 144 && (n_pant >= 40)) {
			player.life -= 10;
			player.is_dead = 1;
			player.vy = -PLAYER_MAX_VY_CAYENDO;
			play_sfx (2);
		}

		// Bottom row (level 3) can't connect up
		if (gpy == 0 && (n_pant >= 50)) { player.vy = 0; }

		// Locks in the last level repel if you aren't carrying a key
		if (level == 3) {
			if (qtile ((gpx + 11) >> 4, (gpy + 8) >> 4) == 47) {
				if (phaskey == 0) {
					play_sfx (3);
					player.vx = -256;
				} else {

				}
			}
		} 

		// End of level custom conditions

		if (player.objs == l_crucifixes [level])
			game_loop_flag = 1;
	}

	void hook_entering (void) {		
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		// Zombie 

		if (_en_t == 15) {
			malotes [enoffsmasi].x = malotes [enoffsmasi].x1;
			malotes [enoffsmasi].y = malotes [enoffsmasi].y1;			
			en_an_vy [enit] = 0;
			// en_an_state [enit] is already set to 0 (Z_APPEARING).
		}
	}

	void extra_enems_move (void) {
		// María

		if (_en_t == 14) {
			en_an_next_frame [enit] = maria_cells [gpx >= 112 ? 1 : 0];
		}

		// Zombie

		if (_en_t == 15) {
			
			#asm
				// Calculate facing 0 = right, 2 = left
				// _en_an_facing = ((_en_x+8) > gpx) ? 2 : 0;
					ld  a, (__en_x)
					add 8
					ld  c, a
					ld  a, (_gpx)
					cp  c
					ld  a, 0
					jr  nc, z_set_facing
					ld  a, 2

				.z_set_facing
					ld  (__en_an_facing), a
		
				// State handy
				//_en_an_state = en_an_state [enit];
		
					ld  bc, (_enit)
					ld  b, 0
					ld  hl, _en_an_state
					add hl, bc
					ld  a, (hl)
					ld  (__en_an_state), a	

				// if (_en_an_state == Z_APPEARING) {				
					and a
					jr  nz, z_state_not_appearing

				.z_state_appearing 
				
				// _en_y --;
					ld  hl, __en_y
					dec (hl)

				// Check if the zombie popped up 
				
					ld  a, (__en_x)
					add 8
					call shr4
					ld  c, a
					ld  a, (__en_y)
					add 15
					call shr4
					call _attr_enems
					ld  a, l
					and 12
					jr  nz, z_appearing_done
						
				// en_an_y [enit] = _en_y << 6;
					ld  de, _en_an_y
					ld  hl, (_enit)
					ld  h, 0
					add hl, hl
					add hl, de 
					push hl 

					ld  de, (__en_y)
					ld  d, 0
					ld  l, 6
					call l_asl 		// -> HL

					pop de
					call l_pint 

				// _en_an_state = Z_PURSUING;

					ld  a, Z_PURSUING
					ld  (__en_an_state), a
				
				.z_appearing_done
					jp  en_zombie_continue
				
				.z_state_not_appearing	
			
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
			en_an_next_frame [enit] = zombie_cells [_en_an_facing + ((_en_x >> 3) & 1)];
		}	
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
		// Zombies must respawn forever
		if (enemy_died == 15) {
			_en_t = 15; 
			_en_x = _en_x1; _en_y = _en_y1;
			en_an_state [enit] = Z_APPEARING;
		}
	}
#endif
