// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// mainloop.h
// Cointains initialization stuff and the main game loop.

void main (void) {
	#asm
			di 
			ld  sp, STACK_ADDR

		#ifdef MODE_128K_DUAL
			ld  bc, 0x7ffd
			xor a
			out (c), a
			ld  a, (0x1)
			ld  h, a
			ld  a, 0x10
			out (c), a
			ld  a, (0x1)
			cp  h
			jr  z, no128K

			// 128K mode: set the stack in low RAM
			ld  sp, 24199

			ld  a, 1
			jr  detectionDone

		.no128K
			xor a
		
		.detectionDone
			ld  (_is128k), a

		#endif
	#endasm

	#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
		sp_InitIM2(0xf1f1);
		sp_CreateGenericISR(0xf1f1);
		sp_RegisterHook(255, ISR);
	#endif

	// splib2 initialization
	sp_Initialize (7, 0);
	sp_Border (BLACK);
	sp_AddMemory(0, NUMBLOCKS, 14, AD_FREE);

	#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
		#asm
				ei
		#endasm
	#endif

	// Define keys and default controls
	joyfunc = sp_JoyKeyboard;

	// Load tileset
	#asm
			ld  b, 0
			ld  hl, SPTileArray
			ld  de, _tileset
		.load_tileset_loop
			ld  (hl), e
			inc h
			ld  (hl), d
			dec h
			inc hl
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			djnz load_tileset_loop
	#endasm

	// Clipping rectangle	
	spritesClip = &spritesClipValues;
	
	// Sprite creation
	#ifdef NO_MASKS
		sp_player = sp_CreateSpr (sp_XOR_SPRITE, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_c);
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(sp_XOR_SPRITE, 3, sprite_9_a, 1);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_c);	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#else
		sp_player = sp_CreateSpr (sp_MASK_SPRITE, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_c);
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(sp_MASK_SPRITE, 3, sprite_9_a, 2);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_c);	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#endif

	#ifdef PLAYER_CAN_FIRE
		for (rdi = 0; rdi < MAX_BULLETS; rdi ++) {
			sp_bullets [rdi] = sp_CreateSpr (sp_OR_SPRITE, 2, sprite_19_a, 1);
			sp_AddColSpr (sp_bullets [rdi], sprite_19_b);
		}
	#endif

	#ifdef ENABLE_SWORD
		sp_sword = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_sword, 2);
		sp_AddColSpr (sp_sword, sprite_sword + 32);
		s_current_frame = sprite_sword;
	#endif

	#ifdef ENABLE_CODE_HOOKS
		hook_system_inits ();
	#endif

	while (1) {
		// Here the title screen
		cortina ();
		title_screen ();
		
		#ifndef DIRECT_TO_PLAY
			// Clear screen and show game frame
			cortina ();
			sp_UpdateNow();
			asm_int = (unsigned int) (s_marco); unpack ();
		#endif

		// Let's do it.
		playing = 1;

		#ifndef DEACTIVATE_EVIL_ZONE
			scenery_info.evil_kills_slowly = 0;
		#endif

		#ifdef USE_TYPE_6
			#ifdef MAKE_TYPE_6
				scenery_info.make_type_6 = 0;
			#endif
			scenery_info.allow_type_6 = 1;
		#endif

		init_player ();

		#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
		#else
			init_hotspots ();
		#endif

		#ifndef DEACTIVATE_KEYS
			init_cerrojos ();
		#endif	

		#ifdef ENEMIES_MAY_DIE
			init_malotes ();
		#endif
			
		#ifdef PLAYER_CAN_FIRE
			init_bullets ();
		#endif	

		#ifdef ENABLE_PERSISTENCE
			clear_persistent ();
		#endif

		n_pant = SCR_INICIO;
		on_pant = 0xff;
		maincounter = 0;
		
		#ifdef ACTIVATE_SCRIPTING		
			script_result = 0;
			msc_init_all ();
			#ifdef OBJECT_COUNT
				flags [OBJECT_COUNT] = 0;
			#endif
		
			// Execute "ENTERING GAME" script
			script = e_scripts [max_screens];
			run_script ();
		#endif

		#ifdef ENABLE_CODE_HOOKS
			game_loop_flag = 0;
			hook_init_game ();
		#endif
		
		#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)
			#ifdef SHOW_TOTAL
				// Show total of enemies next to the killed amount.
				sp_PrintAtInv (KILLED_Y, 2 + KILLED_X, 71, 15);
				sp_PrintAtInv (KILLED_Y, 3 + KILLED_X, 71, 16 + BADDIES_COUNT / 10);
				sp_PrintAtInv (KILLED_Y, 4 + KILLED_X, 71, 16 + BADDIES_COUNT % 10);
			#endif
		#endif
				
		#ifdef REENTER_ON_ALL_OBJECTS
			reentered = 0;
		#endif

		half_life = 0;
		
		#if defined(FALLING_BOXES) && defined(PLAYER_PUSH_BOXES)
			fall_frame_counter = 0;
		#endif

		objs_old = life_old = keys_old = killed_old = item_old = ezg_old = coins_old = 0xff;

		while (playing) {
			#ifdef ENABLE_CODE_HOOKS
				hook_init_mainloop ();
			#endif

			// Update SCR

			if (n_pant != on_pant) {
				draw_scr (); on_pant = n_pant;
			}

			// Update  HUD

			#if !defined DEACTIVATE_OBJECTS	&& (defined OBJECTS_ICON_X || defined OBJECTS_X)
				if (player.objs != objs_old) {
					#if defined ONLY_ONE_OBJECT && defined OBJECTS_ICON_X
						if (player.objs) {
							sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X, 135, 132);
							sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X + 1, 135, 133);
							sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X, 135, 134);
							sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X + 1, 135, 135);
						} else {
							draw_coloured_tile (OBJECTS_ICON_X, OBJECTS_ICON_Y, 17);
						}
					#endif
					#ifdef OBJECTS_X
						#ifdef ONLY_ONE_OBJECT
							draw_2_digits (OBJECTS_X, OBJECTS_Y, flags [OBJECT_COUNT]);
						#else
							draw_2_digits (OBJECTS_X, OBJECTS_Y, player.objs);
						#endif
					#endif
					objs_old = player.objs;
				}
			#endif
			
			#ifdef LIFE_X
				if (player.life != life_old) {
					if (player.life > 0) pti = (unsigned char) player.life; else pti = 0;
					#ifdef DRAW_HI_DIGIT
						sp_PrintAtInv (LIFE_H_Y, LIFE_H_X, 71, 16 + pti / 100);
					#endif
					draw_2_digits (LIFE_X, LIFE_Y, pti);
					life_old = player.life;
				}
			#endif

			#if !defined DEACTIVATE_KEYS && defined KEYS_X
				if (player.keys != keys_old) {
					draw_2_digits (KEYS_X, KEYS_Y, player.keys);
					keys_old = player.keys;
				}
			#endif

			#if defined PLAYER_KILLS_ENEMIES && defined KILLED_X	 
				if (player.killed != killed_old) {
					draw_2_digits (KILLED_X, KILLED_Y, player.killed);
					killed_old = player.killed;	
				}
			#endif

			#ifdef PLAYER_SHOW_ITEM
				if (flags [ITEM_IN_FLAG] != item_old) {
					draw_coloured_tile (ITEM_SHOW_X, ITEM_SHOW_Y, ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1);
					item_old = flags [ITEM_IN_FLAG];
				}
			#endif			

			#if !defined DEACTIVATE_EVIL_ZONE && defined EVIL_GAUGE_X
				if (player.killingzone_beepcount != ezg_old) {
					draw_2_digits (EVIL_GAUGE_X, EVIL_GAUGE_Y, EVIL_ZONE_BEEPS_COUNT - player.killingzone_beepcount);
					ezg_old = player.killingzone_beepcount;
				}
			#endif

			#if defined USE_COINS && defined COINS_X
				if (flags [COIN_FLAG] != coins_old) {
					draw_2_digits (COINS_X, COINS_Y, flags [COIN_FLAG]);
					coins_old = flags [COIN_FLAG];
				}
			#endif

			#asm
				// maincounter ++;
				ld  hl, _maincounter
				inc (hl)

				// half_life ^= 1;
				ld  a, (_half_life)
				xor 1
				ld  (_half_life), a
			#endasm
			
			mueve_bicharracos ();
			move ();

			#ifdef PLAYER_CAN_FIRE
				// Move bullets				
				mueve_bullets ();
			#endif

			#ifdef ENABLE_SWORD
				// Swing sword
				swing_sword ();
			#endif

			#ifdef ENABLE_BREAKABLE
				// Update preakables
				if (process_breakable) {
					actualiza_breakables ();
				}
			#endif

			#if defined(FALLING_BOXES) && defined(PLAYER_PUSH_BOXES)
				// Move boxes
				animate_boxes ();
			#endif

			// Render		
			for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
				#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
					#ifdef RANDOM_RESPAWN
						if (en_an_fanty_activo [rdi])
					#else
						if (malotes [enoffs + rdi].t == 6 || malotes [enoffs + rdi].t == 0)
					#endif
					{
						rdx = en_an_x [rdi] >> 6;
						rdy = en_an_y [rdi] >> 6;
					} else 
				#endif
				{
					rdx = malotes [enoffs + rdi].x;
					rdy = malotes [enoffs + rdi].y;
				}
				sp_MoveSprAbs (sp_moviles [rdi], spritesClip, en_an_next_frame [rdi] - en_an_current_frame [rdi], VIEWPORT_Y + (rdy >> 3), VIEWPORT_X + (rdx >> 3),rdx & 7, rdy & 7);
				en_an_current_frame [rdi] = en_an_next_frame [rdi];
			}

			rdy = gpy; if ( 0 == (player.estado & EST_PARP) || half_life ) { rdx = gpx; } else { rdx = 240;	}
			#ifdef BETTER_VERTICAL_CONNECTIONS
				if (rdy >= 248) rdi = VIEWPORT_Y - 1; else rdi = VIEWPORT_Y + (rdy >> 3);
				sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, rdi, VIEWPORT_X + (rdx >> 3), rdx & 7, rdy & 7);
			#else
				sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, VIEWPORT_Y + (rdy >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, rdy & 7);
			#endif
			player.current_frame = player.next_frame;
			
			#ifdef PLAYER_CAN_FIRE
				for (rdi = 0; rdi < MAX_BULLETS; rdi ++) {
					if (bullets [rdi].estado == 1) {
						sp_MoveSprAbs (sp_bullets [rdi], spritesClip, 0, VIEWPORT_Y + (bullets [rdi].y >> 3), VIEWPORT_X + (bullets [rdi].x >> 3), bullets [rdi].x & 7, bullets [rdi].y & 7);
					} else {
						sp_MoveSprAbs (sp_bullets [rdi], spritesClip, 0, -2, -2, 0, 0);
					}
				}
			#endif

			#ifdef ACTIVATE_SCRIPTING
				if (f_zone_ac == 1) {
					if (gpx >= fzx1 && gpx <= fzx2 && gpy >= fzy1 && gpy <= fzy2) {
						script = f_scripts [n_pant];
						run_script ();
					}	
				}
			#endif
			
			#ifdef ENABLE_CODE_HOOKS
				latest_hotspot = 0;
			#endif

			// Hotspot interaction.

			//if (gpx >= hotspot_x - 15 && gpx <= hotspot_x + 15 && gpy >= hotspot_y - 15 && gpy <= hotspot_y + 15) 
			#asm
					// gpx >= hotspot_x - 15 -> gpx + 15 >= hotspot_x
					ld  a, (_hotspot_x)
					ld  c, a
					ld  a, (_gpx) 
					add 12
					cp  c
					jp  c, _hotspots_done

					// gpx <= hotspot_x + 15 -> hotspot_x + 15 >= gpx
					ld  a, (_gpx)
					ld  c, a
					ld  a, (_hotspot_x)
					add 12
					cp  c
					jp  c, _hotspots_done

					// gpy >= hotspot_y - 15 -> gpy + 15 >= hotspot_y
					ld  a, (_hotspot_y)
					ld  c, a
					ld  a, (_gpy)
					add 12
					cp  c 
					jp  c, _hotspots_done

					// gpy <= hotspot_y + 15 -> hotspot_y + 15 >= gpy
					ld  a, (_gpy)
					ld  c, a
					ld  a, (_hotspot_y)
					add 12
					cp  c
					jp  c, _hotspots_done
			#endasm
			{	
				#ifdef ENABLE_CODE_HOOKS
					latest_hotspot = hotspot_t;
				#endif
					
				rdi = 0;
				#if !defined DEACTIVATE_OBJECTS || !defined DEACTIVATE_KEYS
					switch (hotspot_t) {
						#ifndef DEACTIVATE_OBJECTS
							case 1:
								#ifdef ONLY_ONE_OBJECT
									if (player.objs == 0) {
										player.objs ++;
										play_sfx (6);	
									} else {
										rdi = 1;
										play_sfx (1);	
									}
								#else
									player.objs ++;
									play_sfx (6);
									#ifdef OBJECT_COUNT
										flags [OBJECT_COUNT] ++;
									#endif
								#endif
								break;
						#endif
				
						#ifndef DEACTIVATE_KEYS
							case 2:
								player.keys ++;
								play_sfx (6);
								break;
						#endif

						#ifndef DEACTIVATE_REFILLS
							case 3:
								player.life += PLAYER_REFILL;
								if (player.life > 99)
									player.life = 99;
								rdi = 2;
								play_sfx (6);
								break;
						#endif								
					}
				#endif
				
				if (rdi != 1)  {
					draw_coloured_tile (VIEWPORT_X + (hotspot_x >> 3), VIEWPORT_Y + (hotspot_y >> 3), orig_tile);
					hotspot_x = hotspot_y = 240;
					hotspots [n_pant].act = rdi;
				}
			}
			#asm
				._hotspots_done
			#endasm
			
			// Code hooks

			#ifdef ENABLE_CODE_HOOKS
				hook_mainloop ();
			#endif	
			
			// Limit frame rate
			#ifdef MIN_FAPS_PER_FRAME
				while (isrc < MIN_FAPS_PER_FRAME) {
					#asm
						halt
					#endasm
				} isrc = 0;
			#endif

			// Update to screen

			sp_UpdateNow();
			
			// Dead enemies

			#ifdef PLAYER_CAN_FIRE
				for (rdi = 0; rdi < 3; rdi ++)
					if (en_an_morido [rdi] == 1) {
						play_sfx (1);
						en_an_morido [rdi] = 0;
					} 	
			#endif

			#if defined(PLAYER_FLICKERS) || defined (RESPAWN_FLICKER)
				// Flickering
				#asm
					.player_flicker_done_check
						ld  a, (_player + 23)		// player.estado
						and EST_PARP
						jr  z, player_flicker_check_done

						ld  a, (_player + 24) 		// player.ct_estado
						dec a
						jr  nz, player_flicker_ct_write

						xor a
						ld  (_player + 23), a

					.player_flicker_ct_write
						ld  (_player + 24), a

					.player_flicker_check_done
				#endasm
			#endif			
			
			// Flick screen checks and scripting related stuff
		
			#ifdef ACTIVATE_SCRIPTING		
				#ifdef SCRIPTING_KEY_M			
					if (sp_KeyPressed (key_m) || ((pad0 & sp_FIRE) == 0))
				#endif
				#ifdef SCRIPTING_DOWN
					if ((pad0 & sp_DOWN) == 0)
				#endif
				{
					script = f_scripts [max_screens];
					run_script ();
					// Any scripts to run in this screen?
					script = f_scripts [n_pant];
					run_script ();
					//if (!script_something_done) play_sfx (9);
				}
			#endif

			#ifndef FIXED_SCREENS
				#ifndef COLUMN_MAP
					if (gpx == 0 && player.vx < 0) {
						n_pant --;
						gpx = 224; player.x = 224<<6; 
					} else if (gpx == 224 && player.vx > 0) {
						n_pant ++;
						gpx = player.x = 0;
					}
				#endif

				#ifndef ROW_MAP
					#ifdef BETTER_VERTICAL_CONNECTIONS
						if (player.y == -512 && player.vy < 0 && n_pant >= MAP_W) {
							n_pant -= MAP_W;
							gpy = 144; player.y = 144<<6;
							player.vy = -PLAYER_MAX_VY_SALTANDO;
							player.cont_salto = 0;
						}
					#else
						if (gpy == 0 && player.vy < 0 && n_pant >= MAP_W) {
							n_pant -= MAP_W;
							gpy = 144; player.y = 144<<6;
						} 
					#endif
					else if (gpy == 144 && player.vy > 0) {
						n_pant += MAP_W;
						gpy = player.y = 0;
					}
				#endif
			#endif
			
			// Win game condition
			
			#ifdef WIN_ON_SCRIPTING
				if (script_result == 1) {
					saca_a_todo_el_mundo_de_aqui ();
					cortina ();
					game_ending ();
					playing = 0;
				}
			#elif defined ENABLE_CODE_HOOKS
				if (game_loop_flag == 1) {
					saca_a_todo_el_mundo_de_aqui ();
					cortina ();
					game_ending ();
					playing = 0;
				}
			#else			
				#ifdef ACTIVATE_SCRIPTING
					#ifndef REENTER_ON_ALL_OBJECTS
						if (player.objs == PLAYER_NUM_OBJETOS || script_result == 1 
							#ifdef SCR_FIN
								|| n_pant == SCR_FIN
							#endif
						)
					#else
						if (player.objs == PLAYER_NUM_OBJETOS && !reentered) {
							reentered = 1;
							draw_scr ();	
						} 

						if (script_result == 1 
							#ifdef SCR_FIN
								|| n_pant == SCR_FIN
							#endif
						)
					#endif
				#else			
					if (player.objs == PLAYER_NUM_OBJETOS 
						#ifdef SCR_FIN
							|| n_pant == SCR_FIN
							#endif
						)
				#endif

				{
					#ifdef SCR_FIN
						success = 0;
						if (n_pant == pant_final) {
							if ((player.x >> 10) == PLAYER_FIN_X && (player.y >> 10) == PLAYER_FIN_Y) 
								success = 1;
						} else if (pant_final == 99) {
							success = 1;
						}
						if (success) 
					#endif
					{
						saca_a_todo_el_mundo_de_aqui ();
						cortina ();
						game_ending ();
						playing = 0;
					}
				}				
			#endif

			// Dead player
			if (player.is_dead) {
				player.is_dead = 0;
				if (player.life > 0) {
					#ifdef RESPAWN_REENTER
						explode_player ();
						#ifdef RESPAWN_SHOW_LEVEL				
							draw_scr ();
							init_player_values ();
							#ifdef FIXED_SCREENS
								player.killed = 0;
								malotes [enoffs].t = malotes [enoffs].t & 15;
								malotes [enoffs + 1].t = malotes [enoffs + 1].t & 15;
								malotes [enoffs + 2].t = malotes [enoffs + 2].t & 15;
							#endif
						#else	
							draw_scr_background ();
							init_player_values ();
						#endif
					#endif
					#ifdef RESPAWN_FLICKER
						player_flicker ();
					#endif
				}
			}

			// Game over condition

			if (player.life < 0
				#ifdef ACTIVATE_SCRIPTING
					|| script_result == 2
				#endif
				#ifdef ENABLE_CODE_HOOKS
					|| game_loop_flag == 2
				#endif
			) {
				saca_a_todo_el_mundo_de_aqui ();				
				game_over ();
				playing = 0;
			}
			
			#ifdef USE_SUICIDE_KEY
				if (sp_KeyPressed (key_s)) {
					player.is_dead = 1;
					player.life --;
				}
			#endif
		}	
	}
}
