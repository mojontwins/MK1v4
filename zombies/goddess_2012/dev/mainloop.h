// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// mainloop.h
// Cointains initialization stuff and the main game loop.

unsigned char playing;
unsigned char success;
unsigned char n_pant;
unsigned char maincounter;
unsigned char objs_old, keys_old, life_old, killed_old, item_old;
unsigned char *allpurposepuntero;

#ifdef RANDOM_RESPAWN
	signed int enx, eny;
#else
	unsigned char enx, eny;
#endif

unsigned int key_m;

void do_game () {

	while (1) {
		// Here the title screen
		sp_UpdateNow();
		unpack ((unsigned int) (s_title));
		select_joyfunc ();

		// Custom
		clear_gamearea_tiles ();
		draw_text (4, 4, 71, "PULSA Q PARA VOLAR");
		draw_text (4, 6, 71, "Y SPACE PARA DISPARAR");
		draw_text (4, 8, 71, "PERO ESTO TE RESTARA FUERZA");
		draw_text (4, 10, 71, "AHORRA! NO SEAS BERZA!");
		draw_text (4, 12, 71, "USA LOS PORTALES CORAZON");
		draw_text (4, 14, 71, "RECUPERAN UN MONTON!");
		draw_text (4, 16, 71, "LAS COSAS DE INTERACTUAR");
		draw_text (4, 18, 71, "SE HACEN PULSANDO A");
		draw_text (4, 20, 71, "VENCE A LOS TEMPLOS!");
		sp_UpdateNow ();
		espera_activa (5000);
		// End
		
		#ifndef DIRECT_TO_PLAY
			// Clear screen and show game frame
			cortina ();
			sp_UpdateNow();
			unpack ((unsigned int) (s_marco));
		#endif

		// Let's do it.
		playing = 1;
		init_player ();
		#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
		#else
			init_hotspots ();
		#endif
		#ifndef DEACTIVATE_KEYS
			init_cerrojos ();
		#endif
		#if defined(PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)
			init_malotes ();
		#endif
		#ifdef PLAYER_CAN_FIRE
			init_bullets ();
		#endif	
			
		n_pant = SCR_INICIO;
		maincounter = 0;
			
		#ifdef ACTIVATE_SCRIPTING		
			script_result = 0;
			msc_init_all ();
			
			// Execute "ENTERING GAME" script
			script = e_scripts [MAP_W * MAP_H];
			run_script ();
		#endif
		
		draw_scr (n_pant);
		draw_life ();
		#ifndef	DEACTIVATE_OBJECTS
			draw_objs ();
		#endif
		#ifdef PLAYER_SHOW_ITEM
			draw_item ();
		#endif
		#ifndef DEACTIVATE_KEYS
			draw_keys ();
		#endif

		#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)
			#ifdef SHOW_KILLED
				draw_killed ();
			#endif
			#ifdef SHOW_TOTAL
				// Show total of enemies next to the killed amount.

				sp_PrintAtInv (KILLED_Y, 2 + KILLED_X, 71, 15);
				sp_PrintAtInv (KILLED_Y, 3 + KILLED_X, 71, 16 + BADDIES_COUNT / 10);
				sp_PrintAtInv (KILLED_Y, 4 + KILLED_X, 71, 16 + BADDIES_COUNT % 10);
			#endif
		#endif
		
		half_life = 0;

		while (playing) {
			
			#ifndef DEACTIVATE_OBJECTS			
				if (player.objs != objs_old) {
					draw_objs ();
					objs_old = player.objs;
				}
			#endif
			
			if (player.life != life_old) {
				draw_life ();
				life_old = player.life;
			}

			#ifndef DEACTIVATE_KEYS
				if (player.keys != keys_old) {
					draw_keys ();
					keys_old = player.keys;
				}
			#endif

			#ifdef PLAYER_KILLS_ENEMIES		
				if (player.killed != killed_old) {
					draw_killed ();
					killed_old = player.killed;	
				}
			#endif

			#ifdef PLAYER_SHOW_ITEM
				if (flags [ITEM_IN_FLAG] != item_old) {
					draw_item ();
					item_old = flags [ITEM_IN_FLAG];
				}
			#endif			

			maincounter ++;
			half_life = !half_life;
			
			// Move player
			if ( !(player.estado & EST_MUR) )
				move (n_pant);
			else {
				// WTF?
			}
			
			// Move enemies
			mueve_bicharracos (n_pant);

			#ifdef PLAYER_CAN_FIRE
				// Move bullets				
				mueve_bullets ();
			#endif

			// Render		
			for (gpit = 0; gpit < 3; gpit ++) {
				#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
					#ifdef RANDOM_RESPAWN
						if (en_an [gpit].fanty_activo)
					#else
						if (malotes [enoffs + gpit].t == 6)
					#endif
					{
						enx = en_an [gpit].x >> 6;
						eny = en_an [gpit].y >> 6;
					} else 
				#endif
				{
					enx = malotes [enoffs + gpit].x;
					eny = malotes [enoffs + gpit].y;
				}

				#ifdef CPC
					cpc_MoveSprAbs (SP_ENEMS_BASE + gpit, en_an [gpit].next_frame, enx, eny);
				#else
					sp_MoveSprAbs (sp_moviles [gpit], spritesClip, en_an [gpit].next_frame - en_an [gpit].current_frame, VIEWPORT_Y + (eny >> 3), VIEWPORT_X + (enx >> 3),enx & 7, eny & 7);
					en_an [gpit].current_frame = en_an [gpit].next_frame;
				#endif
			}

			// Precalc this, comes handy:
			_x = player.x >> 6;
			_y = player.y >> 6;
			
			#ifdef CPC
				if (!(player.estado & EST_PARP) || !(half_life)) {
					cpc_MoveSprAbs (0, player.next_frame, _x, _y);
				} else {
					sp_sw [SP_PLAYER].sp0 = (unsigned int) (sprite_18_a);
				}
			#else
				if ( !(player.estado & EST_PARP) || !(half_life) )
					sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, VIEWPORT_Y + (_y >> 3), VIEWPORT_X + (_x >> 3), _x & 7, _y & 7);
				else
					sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, -2, -2, 0, 0);
			#endif

			player.current_frame = player.next_frame;
					
			#ifdef PLAYER_CAN_FIRE
				for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
					#ifdef CPC
						if (bullets [gpit].estado == 1) {
							cpc_MoveSprAbs (SP_BULLETS_BASE + gpit, sprite_19_a, bullets [gpit].x, bullets [gpit].y);
						} else {
							sp_sw [SP_BULLETS_BASE + gpit].sp0 = (unsigned int) (sprite_18_a);
						}
					#else
						if (bullets [gpit].estado == 1) {
							sp_MoveSprAbs (sp_bullets [gpit], spritesClip, 0, VIEWPORT_Y + (bullets [gpit].y >> 3), VIEWPORT_X + (bullets [gpit].x >> 3), bullets [gpit].x & 7, bullets [gpit].y & 7);
						} else {
							sp_MoveSprAbs (sp_bullets [gpit], spritesClip, 0, -2, -2, 0, 0);
						}
					#endif
				}
			#endif			
			
			// Update to screen
			sp_UpdateNow();
			
			#ifdef PLAYER_CAN_FIRE
				for (gpit = 0; gpit < 3; gpit ++)
					if (en_an [gpit].morido == 1) {
						peta_el_beeper (1);
						en_an [gpit].morido = 0;
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
			
			#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
			#else
				// Hotspot interaction.
				if (_x >= hotspot_x - 15 && _x <= hotspot_x + 15 && _y >= hotspot_y - 15 && _y <= hotspot_y + 15) {
					// Deactivate hotspot
					draw_coloured_tile (VIEWPORT_X + (hotspot_x >> 3), VIEWPORT_Y + (hotspot_y >> 3), orig_tile);
					// Was it an object, key or life boost?
					if (hotspots [n_pant].act == 0) {
						player.life += PLAYER_REFILL;
						if (player.life > PLAYER_LIFE)
							player.life = PLAYER_LIFE;
						hotspots [n_pant].act = 2;
						peta_el_beeper (8);
					}

					#ifndef DEACTIVATE_OBJECTS
						else if (hotspots [n_pant].tipo == 1) {
							#ifdef ONLY_ONE_OBJECT
								if (player.objs == 0) {
									gpit = 1;
									player.objs ++;
									hotspots [n_pant].act = 0;
									peta_el_beeper (9);	
								} else {
									gpit = 0;
									peta_el_beeper (4);	
									draw_coloured_tile (VIEWPORT_X + (hotspot_x >> 3), VIEWPORT_Y + (hotspot_y >> 3), 17);
								}
							#else
								player.objs ++;
								hotspots [n_pant].act = 0;
								peta_el_beeper (9);
							#endif
						}
					#endif

					#ifndef DEACTIVATE_KEYS
						else if (hotspots [n_pant].tipo == 2) {
							player.keys ++;
							hotspots [n_pant].act = 0;
							peta_el_beeper (7);
						}
					#endif
				
					// PLOP!!
					hotspot_x = hotspot_y = 240;
				}
			#endif
		
			// Flick screen checks and scripting related stuff
			gpit = pad0;
			
			#ifdef ACTIVATE_SCRIPTING		
				if (
				#ifdef SCRIPTING_KEY_M			
					sp_KeyPressed (key_m)
				#elif defined SCRIPTING_DOWN
					(gpit & sp_DOWN) == 0
				#endif
				) {
					// Any scripts to run in this screen?
					script = f_scripts [n_pant];
					run_script ();
					if (!script_something_done) 
						peta_el_beeper (4);
					#ifdef SCRIPTING_KEY_M			
						while (sp_KeyPressed (key_m));
					#endif
					#ifdef SCRIPTING_DOWN
						do {
							pad_read ();
							gpit = pad0;
						} while ((gpit & sp_DOWN) == 0);
					#endif
				}
			#endif

			#ifdef PLAYER_AUTO_CHANGE_SCREEN
				if (player.x == 0 && player.vx < 0) {
					n_pant --;
					draw_scr (n_pant);
					player.x = 14336;
				}
				if (player.x == 14336 && player.vx > 0) {
					n_pant ++;
					draw_scr (n_pant);
					player.x = 0;
				}
			#else
				if (player.x == 0 && ((gpit & sp_LEFT) == 0)) {
					n_pant --;
					draw_scr (n_pant);	
					player.x = 14336;
				}
				if (player.x == 14336 && ((gpit & sp_RIGHT) == 0)) {		// 14336 = 224 * 64
					n_pant ++;
					draw_scr (n_pant);
					player.x = 0;
				}
			#endif
			if (player.y == 0 && player.vy < 0 && n_pant >= MAP_W) {
				n_pant -= MAP_W;
				draw_scr (n_pant);
				player.y = 9216;	
			}
			if (player.y == 9216 && player.vy > 0) {				// 9216 = 144 * 64
				if (n_pant < MAP_W * MAP_H - MAP_W) {
					n_pant += MAP_W;
					draw_scr (n_pant);
					player.y = 0;
				} else {
					player.vy = -PLAYER_MAX_VY_CAYENDO;	
					if (player.life > 0) {
						peta_el_beeper (4);
						player.life --;	
					}
				}
			}
			
			// Win game condition
			if (player.objs == PLAYER_NUM_OBJETOS || n_pant == SCR_FIN
				#ifdef ACTIVATE_SCRIPTING
					|| script_result == 1 
				#endif
			) {
				success = 0;
				if (n_pant == pant_final) {
					if ((player.x >> 10) == PLAYER_FIN_X && (player.y >> 10) == PLAYER_FIN_Y) 
						success = 1;
				} else if (pant_final == 99) {
					success = 1;
				}
				if (success) {
					cortina ();
					game_ending ();
					playing = 0;
					cortina ();
				}
			}
			
			// Game over condition
			if (player.life == 0
				#ifdef ACTIVATE_SCRIPTING
			 		|| script_result == 2
				#endif
			) {
				// ¡Saca a todo el mundo de aquí!
				#ifdef CPC
				
					cpc_MoveSprAbs (0, sprite_18_a, 0, 0);
					for (gpit = 0; gpit < 3; gpit ++) {
						if (malotes [enoffs + gpit].t != 0) {
							cpc_MoveSprAbs (SP_ENEMS_BASE + gpit, sprite_18_a, 0, 0);
						}
					}
					
				#else
					sp_MoveSprAbs (sp_player, spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);				
					for (gpit = 0; gpit < 3; gpit ++) {
						if (malotes [enoffs + gpit].t != 0)
							sp_MoveSprAbs (sp_moviles [gpit], spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);
					}
				#endif
				
				game_over ();
				playing = 0;
				cortina ();
			}
		}	
	}
}
