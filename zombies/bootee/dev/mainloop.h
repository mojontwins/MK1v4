// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// mainloop.h
// Churrera copyleft 2011 by The Mojon Twins.

// Special keys

void main (void) {
	#ifndef CPC
		#asm
				ld  sp, STACK_ADDR
		#endasm
	#endif

	cortina ();
	system_init ();

	while (1) {
		// Here the title screen
		sp_UpdateNow();
		blackout ();

		#ifdef MODE_128K
			// Resource 0 = title.bin
			get_resource (0, 16384);
		#else		
			unpack_screen ((unsigned char *) (s_title));
		#endif

		#ifdef MODE_128K
			//wyz_play_music (0);
		#endif

		select_joyfunc ();

		#ifdef MODE_128K
			//wyz_stop_sound ();
		#endif

		#ifdef ENABLE_CHECKPOINTS
			sg_submenu ();
		#endif

		mlplaying = 1;
		#ifdef COMPRESSED_LEVELS
			#ifdef ENABLE_CHECKPOINTS
				if (sg_do_load) level = sg_level; else level = 0;
			#else
				level = 0;
			#endif				

			#ifndef REFILL_ME
				player.life = PLAYER_LIFE;
			#endif
		#endif

		while (mlplaying) {
			#ifndef COMPRESSED_LEVELS
				mlplaying = 0;
			#else
				prepare_level (level);			
				clear_gamearea_tiles ();

				level_str [7] = 49 + level;
				print_str (12, 12, 71, level_str);
				sp_UpdateNow ();
				
				#ifdef MODE_128K
					wyz_play_sound (3);
				#else			
					peta_el_beeper (1);
				#endif

				espera_activa (100);
			#endif
			
			#ifndef DIRECT_TO_PLAY
				// Clear screen and show game frame
				cortina ();
				sp_UpdateNow();
				
				#ifdef MODE_128K
					// Resource 1 = marco.bin
					get_resource (1, 16384);
				#else			
					unpack_screen ((unsigned int) (s_marco));
				#endif
			#endif

			// Let's do it.

			playing = 1;
			init_player ();

			#ifndef COMPRESSED_LEVELS		
				init_hotspots ();
			#endif

			#if !defined COMPRESSED_LEVELS 
				#if !defined DEACTIVATE_KEYS
					init_cerrojos ();
				#endif

				#if defined(PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)
					init_malotes ();
				#endif

				n_pant = SCR_INICIO;
			#endif		

			#ifdef PLAYER_CAN_FIRE
				init_bullets ();
			#endif	

			maincounter = 0;

			#ifdef ACTIVATE_SCRIPTING		
				script_result = 0;
				msc_init_all ();
			
				// Entering game
				script = e_scripts [MAP_W * MAP_H];
				run_script ();
			#endif
		
			#ifdef PLAYER_KILLS_ENEMIES 	
				#ifdef SHOW_TOTAL
						// Show total of enemies next to the killed amount.

						sp_PrintAtInv (KILLED_Y, 2 + KILLED_X, 71, 15);
						sp_PrintAtInv (KILLED_Y, 3 + KILLED_X, 71, 16 + BADDIES_COUNT / 10);
						sp_PrintAtInv (KILLED_Y, 4 + KILLED_X, 71, 16 + BADDIES_COUNT % 10);
				#endif
			#endif

			half_life = 0;
			
			objs_old = keys_old = life_old = killed_old = 0xff;
			
			#ifdef MAX_AMMO 	
				ammo_old = 0xff;
			#endif

			#if defined(TIMER_ENABLE) && defined(PLAYER_SHOW_TIMER)
				timer_old = 0;
			#endif

			#ifdef PLAYER_CHECK_MAP_BOUNDARIES		
				#ifdef MODE_128K
					x_pant = n_pant % level_data->map_w;
					y_pant = n_pant / level_data->map_w;
				#else
					x_pant = n_pant % MAP_W; y_pant = n_pant / MAP_W;
				#endif
			#endif

			#ifdef ENABLE_CHECKPOINTS
				if (sg_do_load) {
					mem_load ();
				}
			#endif		

			#ifdef MODE_128K
				// Play music
				#ifdef COMPRESSED_LEVELS		
					//wyz_play_music (levels [level].music_id);
				#else
					//wyz_play_music (1);
				#endif		
			#endif

			#ifdef MSC_MAXITEMS
				display_items ();
			#endif
		
			success = 0;

			while (playing) {
				if (o_pant != n_pant) {
					draw_scr ();
					o_pant = n_pant;
				}
			
				#ifdef TIMER_ENABLE
					// Timer
					if (ctimer.on) {
						ctimer.count ++;
						if (ctimer.count == ctimer.frames) {
							ctimer.count = 0;
							ctimer.t --;
							if (ctimer.t == 0) ctimer.zero = 1;
						}
					}

					#if defined(TIMER_SCRIPT_0) && defined(ACTIVATE_SCRIPTING)
						if (ctimer.zero) {
							ctimer.zero = 0;
							#ifdef SHOW_TIMER_OVER
								saca_a_todo_el_mundo_de_aqui ();
								time_over ();
							#endif
							script = e_scripts [MAP_W * MAP_H + 2];
							run_script ();	
						}	
					#endif

					#ifdef TIMER_KILL_0
						if (ctimer.zero) {
							#ifdef SHOW_TIMER_OVER
								#ifndef TIMER_SCRIPT_0
									saca_a_todo_el_mundo_de_aqui ();
									time_over ();
								#endif
							#endif				
							
							ctimer.zero = 0;
							
							#ifdef TIMER_AUTO_RESET 			
								ctimer.t = TIMER_INITIAL;
							#endif
				
							#ifdef MODE_128K
								kill_player (7);
							#else
								kill_player (4);
							#endif

							#ifdef PLAYER_FLICKERS
								player.estado = EST_PARP;
								player.ct_estado = 50;
							#endif

							#if defined(TIMER_WARP_TO_X) && defined(TIMER_WARP_TO_Y)
								set_player_at (TIMER_WARP_TO_X << 4, TIMER_WARP_TO_Y << 4);
							#endif

							#ifdef TIMER_WARP_TO
								n_pant = TIMER_WARP_TO;
								draw_scr ();
							#endif
						}
					#endif
				#endif

				#ifndef DEACTIVATE_OBJECTS
					if (player.objs != objs_old) {
						draw_objs ();
						objs_old = player.objs;
					}
				#endif
			
				if (player.life != life_old) {
					print_number2 (LIFE_X, LIFE_Y, player.life);
					life_old = player.life;
				}
			
				#ifndef DEACTIVATE_KEYS
					if (player.keys != keys_old) {
						print_number2 (KEYS_X, KEYS_Y, player.keys);
						keys_old = player.keys;
					}
				#endif

				#if (defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)) && defined PLAYER_SHOW_KILLS
					if (player.killed != killed_old) {
						print_number2 (KILLED_X, KILLED_Y, player.killed);
						killed_old = player.killed; 
					}
				#endif

				#ifdef MAX_AMMO 	
					if (player.ammo != ammo_old) {
						print_number2 (AMMO_X, AMMO_Y, player.ammo);
						ammo_old = player.ammo;
					}
				#endif

				#if defined(TIMER_ENABLE) && defined(PLAYER_SHOW_TIMER)
					if (ctimer.t != timer_old) {
						print_number2 (TIMER_X, TIMER_Y, ctimer.t);
						timer_old = ctimer.t;
					}
				#endif

				maincounter ++;
				half_life = !half_life;
			
				// Move player
				move ();
				
				// Move enemies
				mueve_bicharracos ();

				#ifdef PLAYER_CAN_FIRE
					// Move bullets 			
					mueve_bullets ();
				#endif

				#ifdef ENABLE_TILANIMS
					do_tilanims ();
				#endif

				render_sprites ();
	
				#if defined ACTIVATE_SCRIPTING && defined ENABLE_FIRE_ZONE
					if (f_zone_ac == 1) {
						if (gpx >= fzx1 && gpx <= fzx2 && gpy >= fzy1 && gpy <= fzy2) {
							run_fire_script ();
						}	
					}
				#endif			

				// Update to screen
				sp_UpdateNow();
			
				#ifdef PLAYER_CAN_FIRE
					for (gpit = 0; gpit < 3; gpit ++) {
						if (en_an_morido [gpit] == 1) {
							#ifdef MODE_128K
								wyz_play_sound (7);
							#else
								peta_el_beeper (1);
							#endif
							en_an_morido [gpit] = 0;
						}	
					}
				#endif

				#ifdef PLAYER_FLICKERS
					// Flickering
					if (player.estado == EST_PARP) {
						player.ct_estado --;
						if (player.ct_estado == 0)
							player.estado = EST_NORMAL; 
					}
				#endif			
			
				// Hotspot interaction.

				do_hotspots ();

				// Flick screen checks and scripting related stuff
				gpit = (joyfunc) (&keys);
				
				// Select object
				#if defined ACTIVATE_SCRIPTING 

					#if defined MSC_MAXITEMS
						if (sp_KeyPressed (KEY_Z)) {
							if (!key_z_pressed) {
								#ifdef MODE_128K
									wyz_play_sound (0);
								#else
									peta_el_beeper (2);
								#endif
								flags [FLAG_SLOT_SELECTED] = (flags [FLAG_SLOT_SELECTED] + 1) % MSC_MAXITEMS;
								display_items ();
							}
							key_z_pressed = 1;
						} else {
							key_z_pressed = 0;
						}
					#endif			

					if (
						#if defined SCRIPTING_KEY_M			
							sp_KeyPressed (KEY_M)
						#elif defined SCRIPTING_DOWN
							(gpit & sp_DOWN) == 0
						#else
							(gpit & sp_FIRE) == 0
						#endif
					) {
						// Any scripts to run in this screen?
						run_fire_script ();
					}
				#endif

				#ifdef PAUSE_ABORT
					// Pause/Abort handling
					if (sp_KeyPressed (KEY_H)) {
						sp_WaitForNoKey ();
						#ifdef MODE_128K
							wyz_stop_sound ();
							wyz_play_sound (1);
						#endif				
						saca_a_todo_el_mundo_de_aqui ();
						pause_screen ();
						while (!sp_KeyPressed (key_h));
						sp_WaitForNoKey ();
						draw_scr ();
						
						#ifdef MODE_128K
							#ifdef COMPRESSED_LEVELS
								//wyz_play_music (levels [level].music_id);
							#else
								//wyz_play_music (1);
							#endif
						#endif				
					}			
					if (sp_KeyPressed (KEY_Y)) {
						playing = 0;
					}
				#endif

				// Change screen
				
				{
					if (gpx == 0 && player.vx < 0 
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES	
							&& x_pant > 0
						#endif
					) {
						n_pant --;
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES
							x_pant --;
						#endif
						player.x = 14336; gpx = 224;
					}

					if (
						gpx == 224 && player.vx > 0
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES	
							#if defined (MODE_128K) && defined (COMPRESSED_LEVELS)
								&& x_pant < (level_data->map_w - 1)	
							#else			
								&& x_pant < (MAP_W - 1)	
							#endif
						#endif
					) {
						n_pant ++;
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES
							x_pant ++;
						#endif
						player.x = 0; gpx = 0;
					}

					if (gpy == 0 && player.vy < 0 && n_pant >= MAP_W) {
						#if defined (MODE_128K) && defined (COMPRESSED_LEVELS)
							n_pant -= level_data->map_w;
						#else				
							n_pant -= MAP_W;
						#endif
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES
							y_pant --;
						#endif
						player.y = 9216; gpy = 144;
					}

					if (
						gpy == 144 && player.vy > 0 
						#ifdef PLAYER_CHECK_MAP_BOUNDARIES
						 	#if defined (MODE_128K) && defined (COMPRESSED_LEVELS)
								&& y_pant < (level_data->map_h - 1)
							#else
								&& y_pant < (MAP_H - 1)
							#endif
						#endif
					) {
						#ifdef MAP_BOTTOM_KILLS
							if (n_pant >= MAP_W * MAP_H - MAP_W) {
								player.vy = -PLAYER_MAX_VY_CAYENDO;
								#ifdef MODE_128K
									kill_player (1);
								#else
									kill_player (4);
								#endif
							} else 
						#endif
						{
							#if defined (MODE_128K) && defined (COMPRESSED_LEVELS)
								n_pant += level_data->map_w;
							#else			
								n_pant += MAP_W;
							#endif
							#ifdef PLAYER_CHECK_MAP_BOUNDARIES
								y_pant ++;
							#endif
							player.y = 0; gpy = 0;
							if (player.vy > 256) player.vy = 256;
						}	
					}
				}

				
				// Win game condition
				if (player.objs == PLAYER_NUM_OBJETOS
					#ifdef ACTIVATE_SCRIPTING
						|| script_result == 1
					#endif
				) {
					if (
						pant_final == 99 ||
						(n_pant == pant_final && (gpx >> 4 == PLAYER_FIN_X && gpy >> 4 == PLAYER_FIN_Y))
					) {
						success = 1;
						playing = 0;					
					}
				}
			
				// Game over condition
				if (player.life == 0
					#ifdef ACTIVATE_SCRIPTING
						|| script_result == 2
					#endif
					#if defined(TIMER_ENABLE) && defined(TIMER_GAMEOVER_0)
						|| ctimer.zero
					#endif
				) {
					playing = 0;				
				}
			}
			sp_WaitForNoKey ();
		
			#ifdef MODE_128K		
				wyz_stop_sound ();
			#endif

			saca_a_todo_el_mundo_de_aqui ();
			sp_UpdateNow ();
			
			if (success) {
				#ifdef COMPRESSED_LEVELS
					/*
					wyz_play_music (6);
					print_str (10, 11, 79, spacer);
					print_str (10, 12, 79, " ZONE CLEAR ");
					print_str (10, 13, 79, spacer);
					sp_UpdateNow ();
					sp_WaitForNoKey ();
					espera_activa (250);			
					*/
					level ++;
					if (level == MAX_LEVELS) {
						game_ending ();
						mlplaying = 0;
					}
				#else
					game_ending (); 
				#endif
			} else {
				#ifdef COMPRESSED_LEVELS
					#ifdef MODE_128K
						//wyz_play_music (8);
					#endif

					#if defined(TIMER_ENABLE) && defined(TIMER_GAMEOVER_0) && defined(SHOW_TIMER_OVER)
						if (ctimer.zero) time_over (); else game_over ();
					#else
						game_over ();
					#endif
					mlplaying = 0;
					#ifdef MODE_128K
						wyz_stop_sound ();
					#endif
				#else
					//wyz_play_music (8);
					game_over ();
				#endif
			}
		}
	
		cortina ();
	}
}
