// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// Add here your custom routines & vars

// Custom routines for Ramiro 4

// bit 0 = which set.
// bit 1 = killing eye.
// bit 2 = trap!
unsigned char map_behaviours [] = {
	0, 0, 0, 5, 0,
	0, 0, 0, 3, 1,
	0, 0, 3, 3, 5,
	5, 1, 1, 1, 1, 
	5, 1, 1, 1, 1 
}; 

// Evil eye things

#define EYE_X VIEWPORT_X+7*2
#define EYE_Y VIEWPORT_Y+2*2

unsigned char evil_eye_state;
unsigned char evil_eye_counter;

unsigned char evil_eye_state_cts [] = { 30, 30, 60, 5, 5 };
unsigned char evil_eye_state_tiles [] = { 29, 30, 31, 30, 29 };

unsigned char evil_eye_screen;

// Blocks trap

#define MAX_TRAP_BLOCKS	3
#define TRAP_CHANCE 	7 		// Power of two minus one!
#define BLOCK_HIT 		5

unsigned char trap_active;
unsigned char trap_bx [MAX_TRAP_BLOCKS];
unsigned char trap_by [MAX_TRAP_BLOCKS];
unsigned char trap_bt [MAX_TRAP_BLOCKS];

unsigned char trap_screen;
unsigned char _trap_bx;
unsigned char _trap_by;
unsigned char rda;

#ifdef ENABLE_CODE_HOOKS

	void hook_mainloop (void) {

		// Eye of horus

		if (evil_eye_screen) {
			if (evil_eye_counter) {
				evil_eye_counter --;
			} else {
				evil_eye_state ++; if (evil_eye_state == 5) evil_eye_state = 0;
				evil_eye_counter = evil_eye_state_cts [evil_eye_state];
				draw_coloured_tile (EYE_X, EYE_Y, evil_eye_state_tiles [evil_eye_state]);
				scenery_info.evil_zone_active = (evil_eye_state == 2);
			}
			sp_Border (evil_eye_state == 2 ? 2 : 0);
		} else sp_Border (0);

		// Block trap

		// To make trap active, we detect the player got a new obj.
		if (trap_screen && player.objs != objs_old) {
			trap_active = 1;
			scenery_info.allow_type_6 = 1;
			#asm
					ld  hl, _trap_by
					ld  de, _trap_by + 1
					ld  bc, MAX_TRAP_BLOCKS - 1
					xor a
					ld  (hl), a
					ldir
			#endasm
		}

		if (trap_active) {
			
			// throw a new block
			if ((rand () & TRAP_CHANCE) == 1) { 
				#asm
						ld  bc, MAX_TRAP_BLOCKS
					.trap_block_find_loop
						dec c
						ld  hl, _trap_by
						add hl, bc
						ld  a, (hl)
						or  a
						jr  z, trap_block_create_new

						xor a
						or  c
						jr  z, trap_block_find_done
						jr  trap_block_find_loop

					.trap_block_create_new
						ld  (hl), 1

						push bc
					.trap_block_select_x
						call _rand

						ld  a, l
						and 0xf
						jr  z, trap_block_select_x
						cp  15
						jr  nc, trap_block_select_x
						pop bc

						ld  hl, _trap_bx
						add hl, bc
						ld  (hl), a

						push bc
						call _rand
						pop bc
						
						ld  a, l
						and 1
						add 6
						ld  hl, _trap_bt
						add hl, bc
						ld  (hl), a

					.trap_block_find_done
				#endasm
			}

			// Animate
			if (half_life) {
				for (gpit = 0; gpit < MAX_TRAP_BLOCKS; gpit ++) {
					_trap_by = trap_by [gpit];
					
					if (_trap_by) {
						_trap_bx = trap_bx [gpit];

						rda = _trap_bx + (_trap_by << 4) - _trap_by;

						// Make fall?

						if (map_attr [rda + 15]) {
							// Set
							map_buff [rda] = trap_bt [gpit];
							_trap_by = 0;
						} else {
							map_attr [rda] = 0;
							// Add 32 because this is tileset 2
							draw_coloured_tile (VIEWPORT_X + (_trap_bx << 1), VIEWPORT_Y + (_trap_by << 1), 32 + map_buff [rda]);
							_trap_by ++; rda += 15;

							map_attr [rda] = 8;
							draw_coloured_tile (VIEWPORT_X + (_trap_bx << 1), VIEWPORT_Y + (_trap_by << 1), trap_bt [gpit]);

							// Collision
							if (player.estado != EST_PARP && attr ((gpx+4) >> 4, (gpy+4) >> 4) == 8) {
								// Crushed!
								sp_UpdateNow ();
								peta_el_beeper (10);
								player.life -= BLOCK_HIT; 
								player.estado = EST_PARP;
								player.ct_estado = 50;

								// Reenter & reset
								hotspots [n_pant].act = 1;
								player.objs --;
								draw_scr ();
								break;
							}
						}

						trap_by [gpit] = _trap_by;
					}
				}
			}
		}
	}

	void hook_entering (void) {
		evil_eye_screen = map_behaviours [n_pant] & 2;
		trap_screen = map_behaviours [n_pant] & 4;

		scenery_info.evil_zone_active = 0;
		scenery_info.allow_type_6 = 0;

		if (map_behaviours [n_pant] & 2) {
			draw_coloured_tile (EYE_X-2, EYE_Y, 28);
			draw_coloured_tile (EYE_X, EYE_Y, 29);
		}

		evil_eye_state = 2;
		evil_eye_counter = 0;

		trap_active = 0;
	}
#endif
