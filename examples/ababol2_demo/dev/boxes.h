// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

#ifdef PLAYER_PUSH_BOXES
	unsigned char boxx, boyy;

	unsigned char can_move_box (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
		#ifdef ENEMIES_BLOCK_BOXES	
			boxx = x1 << 4; boyy = y1 << 4;
			rdd = enoffs + MAX_ENEMS;
			for (rdi = enoffs; rdi < rdd; rdi ++) {
				if (malotes [rdi].x >= boxx - 12 && malotes [rdi].x <= boxx + 12 &&
					malotes [rdi].y >= boyy - 12 && malotes [rdi].y <= boyy + 12) {
					play_sfx (9);
					return 0;
				}
			}
		#endif

		if (qtile (x0, y0) != 14 || attr (x1, y1) >= 4)
			return 0;
			
		return 1;
	}

	#ifdef FALLING_BOXES
		void init_falling_box_buffer () {
			for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++)
				fallingboxbuffer [rdi].act = 0;
		}

		void fall_box (unsigned char x, unsigned char y) {
			for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++) {
				if (!fallingboxbuffer [rdi].act) {
					fallingboxbuffer [rdi].act = 1;
					fallingboxbuffer [rdi].x = x;
					fallingboxbuffer [rdi].y = y;
					break;
				}
			}
		}

		void animate_boxes () {
			// Only at the right time...
			fall_frame_counter ++;
			if (fall_frame_counter >= FALLING_BOXES_SPEED) {
				fall_frame_counter = 0;
				for (rdi = 0; rdi < MAX_FALLING_BOXES; rdi ++) {					
					if (fallingboxbuffer [rdi].act) {
						// Fall this box?
						if (attr (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y + 1) < 4) {
							move_tile (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y, fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y + 1, 0);
							// Check for cascades! (box beneath?)
							if (qtile (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y - 1) == 14)
								fall_box (fallingboxbuffer [rdi].x, fallingboxbuffer [rdi].y - 1);
							fallingboxbuffer [rdi].y ++;
							#if defined (BOXES_KILL_ENEMIES) || defined (BOXES_KILL_PLAYER)
								boxx = fallingboxbuffer [rdi].x << 4;
								boyy = fallingboxbuffer [rdi].y << 4;
							#endif

							#ifdef BOXES_KILL_ENEMIES
								// Check for enemy killed!

								for (enit = 0; enit < MAX_ENEMS; enit ++) {
									enoffsmasi = enoffs + enit;
									
									#ifdef BOXES_ONLY_KILL_TYPE
										if (malotes [enoffsmasi].t == BOXES_ONLY_KILL_TYPE)
									#else
										if (malotes [enoffsmasi].t > 0 && malotes [enoffsmasi].t < 16)
									#endif
									{
										if (malotes [enoffsmasi].x >= boxx - 15 && malotes [enoffsmasi].x <= boxx + 15 &&
											malotes [enoffsmasi].y >= boyy - 15 && malotes [enoffsmasi].y <= boyy + 15) {
											
											#ifdef ENABLE_CODE_HOOKS
												enemy_died = malotes [enoffsmasi].t;
											#endif

											en_an_next_frame [enit] = sprite_17_a;											
											sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an_next_frame [enit] - en_an_current_frame [enit], VIEWPORT_Y + (malotes [enoffsmasi].y >> 3), VIEWPORT_X + (malotes [enoffsmasi].x >> 3), malotes [enoffsmasi].x & 7, malotes [enoffsmasi].y & 7);
											en_an_current_frame [enit] = en_an_next_frame [enit];
											sp_UpdateNow ();
											play_sfx (10);
											en_an_next_frame [enit] = sprite_18_a;
											malotes [enoffsmasi].t |= 16;			// Marked as "dead"

											// Count it
											player.killed ++;

											#ifdef ACTIVATE_SCRIPTING
												script = f_scripts [max_screens + 2];
												run_script ();
											#endif

											break;
										}
									}						
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