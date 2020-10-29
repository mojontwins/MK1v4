// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// Add here your custom routines & vars

#ifdef ENABLE_CODE_HOOKS

	// Custom routines for Ramiro 4

	// bit 0 = which set.
	// bit 1 = killing eye.
	// bit 2 = trap!
	// bit 3 = trap but with coins
	unsigned char map_behaviours [] = {
		 0,  0,  0,  5,  0,  0, 
		 0,  0,  0,  3,  1,  0,
		 0,  0,  3,  3,  5,  0,
		 5,  1,  1,  1,  1,  0,
		13,  1,  1,  1,  1,  0
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
	unsigned char trap_coins;
	unsigned char _trap_bx;
	unsigned char _trap_by;
	unsigned char _trap_bt;
	unsigned char rda, rdb;

	void draw_falling_block (void) {
		//draw_coloured_tile (VIEWPORT_X + (_trap_bx << 1), VIEWPORT_Y + (_trap_by << 1), _trap_bt);
		
		#asm
			ld  a, (__trap_bx)
			sla a
			add VIEWPORT_X
			ld  (__x), a

			ld  a, (__trap_by)
			sla a
			add VIEWPORT_Y
			ld  (__y), a
		
			ld  a, (__trap_bt)
			ld  (__t), a

			jp _draw_coloured_tile_do	
		#endasm
	}

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
		}

		sp_Border ((scenery_info.evil_zone_active & half_life) ? 2 : 0);

		// Block trap

		// To make trap active, we detect the player got a new obj.
		if (trap_screen && player.objs != objs_old) {
			trap_active = 1;
			seed = n_pant + 1;
			player.life += BLOCK_HIT;
			scenery_info.allow_type_6 = 1;
			flags [COIN_FLAG] = 0;
			#asm
					ld  hl, _trap_by
					ld  de, _trap_by + 1
					ld  bc, MAX_TRAP_BLOCKS - 1
					ld  a, 0xff
					ld  (hl), a
					ldir
			#endasm
			if (trap_coins) {
				set_map_tile (13, 5, 0, 0);
				sp_UpdateNow ();
				peta_el_beeper (10);
			}
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
						cp  0xff
						jr  z, trap_block_create_new

						xor a
						or  c
						jr  z, trap_block_find_done
						jr  trap_block_find_loop

					.trap_block_create_new
						xor a
						ld  (hl), a

						push bc
					.trap_block_select_x
						call _rand

						ld  a, l
						and 0xf
						jr  z, trap_block_select_x
						cp  14
						jr  nc, trap_block_select_x
						pop bc

						ld  hl, _trap_bx
						add hl, bc
						ld  (hl), a

						ld  a, (_trap_coins)
						or  a
						jr  nz, trap_block_set_coins

						push bc
						call _rand
						pop bc
						
						ld  a, l
						and 1
						add 6
						jr  trap_block_write

					.trap_block_set_coins
						ld  a, 18

					.trap_block_write
						ld  hl, _trap_bt
						add hl, bc
						ld  (hl), a

					.trap_block_find_done
				#endasm
			}

			// Animate
			if (half_life) {
				for (gpit = 0; gpit < MAX_TRAP_BLOCKS; gpit ++) {

					#asm
							ld  bc, (_gpit)
							ld  b, 0

							ld  hl, _trap_by
							add hl, bc
							ld  a, (hl)
							ld  (__trap_by), a

							ld  hl, _trap_bx
							add hl, bc
							ld  a, (hl)
							ld  (__trap_bx), a

							ld  hl, _trap_bt
							add hl, bc
							ld  a, (hl)
							ld  (__trap_bt), a
					#endasm
					
					if (_trap_by != 0xff) {
						rda = _trap_bx + (_trap_by << 4) - _trap_by;

						// Make fall
						if (_trap_by) map_attr [rda] = 0;
						
						set_map_tile (_trap_bx, _trap_by, map_buff [rda], 0);
						_trap_by ++; rda += 15;

						rdx = (gpx + 8) >> 4; rdy = (gpy + 8) >> 4;

						if (rdx == _trap_bx && rdy == _trap_by) {
							if (trap_coins) { 
								flags [COIN_FLAG] ++;
								peta_el_beeper (5);
								player.life += COINS_REFILL;
								_trap_by = 0xff;
							} else {
								draw_falling_block ();
						
								if (player.estado != EST_PARP) {
									// Crushed!
									sp_UpdateNow ();
									peta_el_beeper (10);
									player.life -= BLOCK_HIT; 
									player.estado = EST_PARP;
									player.ct_estado = 50;

									// Reenter & reset
									hotspots [n_pant].act = 1;
									player.objs --;
									//draw_scr ();
									on_pant = 0xff;
									break;
								} else {
									player.y -= 16<<6;
								}
							}
						} else if (map_attr [rda] == 1) {
							_trap_by = 0xff;
						} else {
							draw_falling_block ();
						
							if (map_attr [rda + 15] & 12) {
								map_attr [rda] = comportamiento_tiles [_trap_bt];
								map_buff [rda] = _trap_bt;
								_trap_by = 0xff; 
							}
						}

						trap_by [gpit] = _trap_by;

						// Finally
						if (flags [COIN_FLAG] == 30) {
							// Deativate trap!
							sp_UpdateNow ();
							peta_el_beeper (8);
							on_pant = 0xff;
						} 
					}
				}
			}
		}
	}

	void hook_entering (void) {
		evil_eye_screen = map_behaviours [n_pant] & 2;
		trap_screen = map_behaviours [n_pant] & 4;
		trap_coins = map_behaviours [n_pant] & 8;

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
