// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// Add here your custom routines & vars

// In this game we'll be using different sets of attributes for the main
// tileset, depending on the level. 

// Attribute binaries are created using ts2bin and compressed with aplib.

// Custom tile colour attributes

extern unsigned char ts_attr_0 [0];
extern unsigned char ts_attr_1 [0];

#asm
	._ts_attr_0
		BINARY "ts_attr_0c.bin"
	._ts_attr_1
		BINARY "ts_attr_1c.bin"
#endasm

// Level set

unsigned char scr_ini [] = { 5, 40, 50, 15 };
unsigned char ini_x [] = { 2, 2, 2, 2 };
unsigned char ini_y [] = { 2, 2, 2, 2 };
unsigned char l_crucifixes [] = { 1, 16, 1, 16 };
unsigned char *l_ts_attr [] = {
	ts_attr_0, ts_attr_0, ts_attr_1, ts_attr_1
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

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		new_level = 1;
		level = 2;
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
		// Zombie

		if (_en_t == 15) {
			
			// Calculate facing 0 = right, 2 = left
			_en_an_facing = ((_en_x+8) > gpx) ? 2 : 0;

			// State handy
			_en_an_state = en_an_state [enit];

			if (_en_an_state == Z_APPEARING) {				
				_en_y --;

				// Check if the zombie popped up 
				#asm
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
				#endasm
						
				en_an_y [enit] = _en_y << 6;
				_en_an_state = Z_PURSUING;

				#asm
					.z_appearing_done
				#endasm
			} else {

				check_feet ();

				// Horizontal movement
				if (_en_an_state & Z_PURSUING) {				
					// Make jump?
					// Calculate l/r collision
					#asm
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
					#endasm

					if ((_en_an_state & Z_JUMPING) == 0) {
						if (
							(gpy < _en_y && 
								(_en_an_facing && _en_an_rfoot == 0) ||
								(_en_an_facing == 0 && _en_an_lfoot == 0)
							) ||
							rdd
						) {
							// Jump!
							_en_an_state |= Z_JUMPING;
							en_an_ct_j [enit] = 8;
							en_an_vy [enit] = -128;
							_en_y2 = _en_y;
							goto en_zombie_continue;
						}

						// Make fall?
						
						if (_en_an_feet == 0) {
							_en_an_state = Z_FALLING;
							en_an_vy [enit] = 0;
							goto en_zombie_continue;
						}
					}

					// Move
					if (!rdd) {
						if (gpx < _en_x) _en_x --; else
						if (gpx > _en_x) _en_x ++;
					}
				}

				check_feet ();

				// Jump
				if (_en_an_state & Z_JUMPING) {

					if (en_an_ct_j [enit]) {
						en_an_ct_j [enit] --;
						en_an_vy [enit] += (PLAYER_G/8);
					} else {
						en_an_vy [enit] += (PLAYER_G);
						if (_en_an_feet) {
							pop_and_pursue ();
							goto en_zombie_continue;
						}
						/*
						if (_en_y == _en_y2) {
							_en_an_state = Z_FALLING;
							goto en_zombie_continue;
						}
						*/
					}

					en_an_y [enit] += en_an_vy [enit];
					_en_y = en_an_y [enit] >> 6;
				}

				// Fall
				if (_en_an_state & Z_FALLING) {
					if (_en_an_feet) {
						// POP!
						pop_and_pursue ();
						goto en_zombie_continue;
					}
					en_an_vy [enit] += PLAYER_G;
					en_an_y [enit] += en_an_vy [enit];
					_en_y = en_an_y [enit] >> 6;
					
				}
			
			}

			en_zombie_continue:
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
