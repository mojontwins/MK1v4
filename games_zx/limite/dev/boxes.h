// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

#ifdef PLAYER_PUSH_BOXES
	void __FASTCALL__ move_tile (unsigned char act) {
		/*
		set_map_tile (x0, y0, 0, comportamiento_tiles [0]);
		set_map_tile (x1, y1, 14, comportamiento_tiles [14]);

		// Sound
		if (act) {
			play_sfx (8);
			#ifdef FALLING_BOXES
				// Añadir al buffer de cajas cayentes.
				fall_box ();
			#endif
		}
		*/
		
		// act is in L
		#asm
				xor a
				or l 
				jr z, move_tile_do

				ld  hl, 8
				push hl
				call _play_sfx
				pop bc 

				#ifdef FALLING_BOXES
					call _fall_box
				#endif

			.move_tile_do
				ld  hl, (_x0)
				ld  h, 0
				push hl
				ld  hl, (_y0)
				ld  h, 0
				push hl
				ld  l, 0
				push hl
				ld  hl, (_comportamiento_tiles)
				ld  h, 0
				push hl
				call _set_map_tile
				pop bc
				pop bc
				pop bc
				pop bc

				ld  hl, (_x1)
				ld  h, 0
				push hl
			#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
				ld  hl, (_y0)
			#else
				ld  hl, (_y1)
			#endif
				ld  h, 0
				push hl
				ld  hl, 14
				push hl
				ld  hl, (_comportamiento_tiles+14)
				ld  h, 0
				push hl
				call _set_map_tile
				pop bc
				pop bc
				pop bc
				pop bc

			#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
				// Gotten to this point, we know they can
				// be moved, so...
					ld  hl, _y0
					dec (hl)

					ld  a, (_x0)
					ld  c, a
					ld  a, (_y0)
					call qtile_do

					ld  a, l
					cp  14
					jr  z, move_tile_do
			#endif
		#endasm
	}

	unsigned char can_move_box (void) {
		#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
			if (attr (x1, y0 + 1) < 4) return 0;
			while (1)
		#endif
		{
			#ifdef ENEMIES_BLOCK_BOXES	
				boxx = x1 << 4; 
				#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
					boyy = y0 << 4;
				#else
					boyy = y1 << 4;
				#endif
				rdd = enoffs + MAX_ENEMS;
				for (rdi = enoffs; rdi < rdd; rdi ++) {
					if (malotes [rdi].x >= boxx - 12 && malotes [rdi].x <= boxx + 12 &&
						malotes [rdi].y >= boyy - 12 && malotes [rdi].y <= boyy + 12) {
						play_sfx (9);
						return 0;
					}
				}
			#endif

			#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
				if (attr (x1, y0) & 0xd)
			#else
				if (qtile (x0, y0) != 14 || (attr (x1, y1) & 0xd))
			#endif
				return 0;

			#ifdef PUSH_OVER_FLOOR
				#ifndef PUSH_AND_PULL_PILES
					if (attr (x1, y1 + 1) < 4) return 0;
					if (qtile (x0, y0 - 1) == 14) return 0;
				#endif
			#endif
			
			#if defined PUSH_AND_PULL && defined PUSH_AND_PULL_PILES
				y0 --;
				if (qtile (x0, y0) != 14) return 1;
			#else
				return 1;
			#endif
		}
	}

	#ifdef FALLING_BOXES
		void init_falling_box_buffer () {
			for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++)
				fallingboxbuffer [rdi].act = 0;
		}

		void fall_box () {
			for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++) {
				if (!fallingboxbuffer [rdi].act) {
					fallingboxbuffer [rdi].act = 1;
					fallingboxbuffer [rdi].x = x1;
					fallingboxbuffer [rdi].y = y1;
					break;
				}
			}
		}

		// TODO :: HEAVILY OPTIMIZE / PUT THIS INTO ASM FOR GOD'S SAKE
		void animate_boxes () {
			// Only at the right time...
			fall_frame_counter ++;
			if (fall_frame_counter >= FALLING_BOXES_SPEED) {
				fall_frame_counter = 0;
				for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++) {					
					if (fallingboxbuffer [rdi].act) {
						// Fall this box?
						if (attr (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y + 1) < 4) {
							x0 = fallingboxbuffer [rdi].x; y0 = fallingboxbuffer [rdi].y;
							x1 = x0; y1 = y0 + 1;
							move_tile (0);

							// Check for cascades! (box above?)
							if (qtile (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y - 1) == 14) {
								x1 = fallingboxbuffer [rdi].x; y1 = fallingboxbuffer [rdi].y - 1; 
								fall_box ();
							}
							
							fallingboxbuffer [rdi].y ++;
							
							#if defined (BOXES_KILL_ENEMIES) || defined (BOXES_KILL_PLAYER)
								boxx = fallingboxbuffer [rdi].x << 4;
								boyy = fallingboxbuffer [rdi].y << 4;
							#endif

							#ifdef BOXES_KILL_ENEMIES
								// Check for enemy killed!

								for (enit = 0; enit < MAX_ENEMS; enit ++) {
									enoffsmasi = enoffs + enit;
									_en_t = malotes [enoffsmasi].t;
									en_ccx = malotes [enoffsmasi].x;
									en_ccy = malotes [enoffsmasi].y;
									
									#ifdef BOXES_ONLY_KILL_TYPE
										if (_en_t == BOXES_ONLY_KILL_TYPE)
									#else
										if (_en_t > 0 && _en_t < 16)
									#endif
									{
										if (en_ccx >= boxx - 15 && en_ccx <= boxx + 15 &&
											en_ccy >= boyy - 15 && en_ccy <= boyy + 15) {

											en_an_next_frame [enit] = sprite_17_a;											
											enems_kill ();
										}
									}						

									malotes [enoffsmasi].t = _en_t;						
								}
							#endif

							#ifdef BOXES_KILL_PLAYER
								// Check for player killed!
								if (gpx >= boxx - 15 && gpx <= boxx + 15 && gpy >= boyy - 15 && gpy <= boyy + 15) {
									explode_player ();	
									player.life --;
									player.is_dead = 1;
								}
							#endif
						} else {
							fallingboxbuffer [rdi].act = 0;
						}
					}	
				}	
			}
		}
	#endif
#endif
