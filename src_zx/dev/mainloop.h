// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// mainloop.h
// Cointains initialization stuff and the main game loop.

#ifdef CUSTOM_SCREEN_CONNECTIONS
	#include "custom_screen_connections.h"
#endif

#ifdef TALL_PLAYER
	#define MAIN_SPRITE_HEIGHT 4
#else
	#define MAIN_SPRITE_HEIGHT 3
#endif

void main (void) {
	#asm
			di 
			ld  sp, STACK_ADDR

			call musicstart

		#ifdef MODE_128K_DUAL
				xor a
				ld  (_ay_player_on), a

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

			#ifdef ENABLE_ARKOS
				// We need to page in so make sure this is LOW in RAM
				call arkos_address_call
			#endif

			#ifdef ENABLE_WYZ
				call wyz_address_call
			#endif

				ld  a, 1			
				jr  detectionDone

			.no128K
				xor a
			
			.detectionDone
				ld  (_is128k), a

			#ifdef ENABLE_WYZ
					ld  a, 1
					ld  (_ay_player_on), a
			#endif
		#endif
	#endasm

	#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
		sp_InitIM2 (0xf1f1);
		sp_CreateGenericISR (0xf1f1);
		sp_RegisterHook (255, ISR);
	#endif

	// splib2 initialization
	sp_Initialize (7, 0);
	sp_Border (BLACK);
	sp_AddMemory (0, NUMBLOCKS, 14, AD_FREE);

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
		sp_player = sp_CreateSpr (NO_MASKS, MAIN_SPRITE_HEIGHT, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_b);	// This is a dummy and will be overwritten later
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(NO_MASKS, 3, sprite_9_a, 1);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);	// This is a dummy and will be overwritten later	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#else
		sp_player = sp_CreateSpr (sp_MASK_SPRITE, MAIN_SPRITE_HEIGHT, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_b);	// This is a dummy and will be overwritten later
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(sp_MASK_SPRITE, 3, sprite_9_a, 2);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);	// This is a dummy and will be overwritten later	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#endif

	// Create a virtual, non existent third column for sprites.
	
	#asm
		.fix_sprites
			#ifdef TALL_PLAYER
				ld  b, 8
			#else
				ld  b, 6
			#endif
			ld  hl, (_sp_player) 			// Sprite base pointer
			call _fix_sprites

			ld  de, _sp_moviles
			ld  b, MAX_ENEMS 

		.fix_sprites_rep1
			push bc
			ld  a, (de)
			ld  l, a
			inc de 
			ld  a, (de)
			ld  h, a
			inc de 

			ld  b, 6
			call _fix_sprites

			pop bc 
			djnz fix_sprites_rep1
	#endasm

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
			#asm 
				call SPUpdateNow
			#endasm
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

		init_hotspots ();
		
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
		maincounter = 0;
		
		#ifdef ACTIVATE_SCRIPTING		
			script_result = 0;
			msc_init_all ();
			#ifdef OBJECT_COUNT
				flags [OBJECT_COUNT] = 0;
			#endif
		
			// Execute "ENTERING GAME" script
			script = e_scripts [MAX_SCREENS];
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

		//objs_old = life_old = keys_old = killed_old = item_old = ezg_old = coins_old = 0xff;
		#asm
			ld  a, 255
			ld  (_objs_old), a 
			ld  (_life_old), a 
			ld  (_keys_old), a 
			ld  (_killed_old), a 
			ld  (_item_old), a 
			ld  (_ezg_old), a 
			ld  (_coins_old), a
			ld  (_on_pant), a
		#endasm

		while (playing) {
			#ifdef ENABLE_CODE_HOOKS
				hook_init_mainloop ();
			#endif

			player_just_died = 0;

			// Update SCR

			/*
			if (n_pant != on_pant) {
				draw_scr (); on_pant = n_pant;
			}
			*/
			#asm
					ld  a, (_n_pant)
					ld  c, a
					ld  a, (_on_pant)
					cp  c
					jr  z, ml_ud_skip

					call _draw_scr 

					ld  a, (_n_pant)
					ld  (_on_pant), a
				.ml_ud_skip
			#endasm

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
							draw_2_digits (OBJECTS_X, OBJECTS_Y, 
								#ifdef REVERSE_OBJECT_COUNT
									PLAYER_NUM_OBJETOS - player.objs
								#else
									player.objs
								#endif
							);
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
			render_all_sprites ();	
			
			#if defined ACTIVATE_SCRIPTING && !defined DEACTIVATE_FIRE_ZONE
				/*
				if (f_zone_ac == 1) {
					if (gpx >= fzx1 && gpx <= fzx2 && gpy >= fzy1 && gpy <= fzy2) {
						script = f_scripts [n_pant];
						run_script ();
					}	
				}
				*/
				#asm
						ld  a, (_f_zone_ac)
						dec a
						jr  nz, ml_f_zone_skip

						// gpx >= fzx1
						ld  a, (_fzx1)
						ld  c, a
						ld  a, (_gpx)
						cp  c
						jr  c, ml_f_zone_skip

						// gpx <= fzx2 -> fzx2 >= gpx
						ld  a, (_gpx)
						ld  c, a
						ld  a, (_fzx2)
						cp  c
						jr  c, ml_f_zone_skip

						// gpy >= fzy1
						ld  a, (_fzy1)
						ld  c, a
						ld  a, (_gpy)
						cp  c
						jr  c, ml_f_zone_skip

						// gpy <= fzy2 -> fzy2 >= gpy
						ld  a, (_gpy)
						ld  c, a
						ld  a, (_fzy2)
						cp  c
						jr  c, ml_f_zone_skip

						// script = f_scripts [n_pant];
						ld  a, (_n_pant)
						sla a
						ld  c, a
						ld  b, 0
						ld  hl, _f_scripts
						add hl, bc
						ld  a, (hl)
						inc hl
						ld  h, (hl)
						ld  l, a
						ld  (_script), hl

						call _run_script

					.ml_f_zone_skip
				#endasm
			#endif
			
			// Hotspot interaction.

			#ifdef ENABLE_CODE_HOOKS
				latest_hotspot = 0;
			#endif

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

				#ifdef ENABLE_CODE_HOOKS
					// You may override hotspot_t or whatever:
					hook_hotspots ();
				#endif
					
				rdi = 0;
				#if !defined DEACTIVATE_OBJECTS || !defined DEACTIVATE_KEYS
					switch (hotspot_t) {
						#ifndef DEACTIVATE_OBJECTS
							case HOTSPOT_TYPE_OBJECT:
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
							case HOTSPOT_TYPE_KEY:
								player.keys ++;
								play_sfx (6);
								break;
						#endif

						#ifndef DEACTIVATE_REFILLS
							case HOTSPOT_TYPE_REFILL:
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

			// Animated tiles

			#ifdef ENABLE_ANIMATED_TILES
				#asm
						// Pick one at random and change it.
						// MAX_ANIMATED_TILES must be a power of 2
						call _rand
						ld  a, l
						and MAX_ANIMATED_TILES-1
						ld  e, a
						ld  d, 0
						ld  hl, ANIMATED_BASE
						add hl, de 
						ld  a, (hl)	// YYYYXXXX
						cp  0xff
						jr  z, animated_tiles_done
						ld  b, a

						and 0x0f 	// 0000XXXX
						ld  (__x), a
						ld  c, a
						
						ld  a, b
						srl a
						srl a
						srl a
						srl a 		// 0000YYYY
						ld  (__y), a

						call qtile_do
						ld  a, l 	// HL 
					#ifdef ANIMATED_NEXT
							xor 0x01 	// Flip bit 1
					#else	
							xor 0x10 	// Flip bit 4
					#endif
						ld  (__t), a
						
						ld  de, _comportamiento_tiles
						add hl, de
						ld  a, (hl)
						ld  (__n), a

						call set_map_tile_do
					.animated_tiles_done
				#endasm
			#endif
			
			// Limit frame rate
			
			#ifdef MIN_FAPS_PER_FRAME
				/*
				while (isrc < MIN_FAPS_PER_FRAME) {
					#asm
						halt
					#endasm
				} isrc = 0;
				*/
				#asm
					.ml_min_faps_loop
						ld  a, (_isrc)
						cp  MIN_FAPS_PER_FRAME
						jr  nc, ml_min_faps_loop_end
						halt
						jr  ml_min_faps_loop

					.ml_min_faps_loop_end
						xor a
						ld  (_isrc), a
				#endasm
			#endif

			// Update to screen

			#asm 
					ld  a, (_n_pant)
					ld  c, a
					ld  a, (_on_pant)
					cp  c
					jr  nz, skipupd
				call SPUpdateNow
				.skipupd
			#endasm
			
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
					if (sp_KeyPressed (key_m) || ((pad_this_frame & sp_FIRE) == 0))
				#endif
				#ifdef SCRIPTING_DOWN
					if ((pad_this_frame & sp_DOWN) == 0)
				#endif
				{
					
					script = f_scripts [MAX_SCREENS];
					run_script ();
					// Any scripts to run in this screen?
					script = f_scripts [n_pant];
					run_script ();
					//if (!script_something_done) play_sfx (9);
					
				}
			#endif

			// Flick screen

			#ifndef FIXED_SCREENS
				#ifndef COLUMN_MAP
					if (gpx == 0 && player.vx < 0) {
						#asm
							#ifdef CUSTOM_SCREEN_CONNECTIONS
									call _override_flick_left
									xor a
									or  l
									jr  nz, flick_left_done
							#endif

								ld  hl, _n_pant
								dec (hl)

								ld  a, 224
								ld  (_gpx), a

								ld  hl, #(224*64)
								ld  (_player), hl 		// player.x = 224<<6
							.flick_left_done
						#endasm

					} else if (gpx == 224 && player.vx > 0) {
						#asm
							#ifdef CUSTOM_SCREEN_CONNECTIONS
									call _override_flick_right
									xor a
									or  l
									jr  nz, flick_right_done
							#endif

								ld  hl, _n_pant
								inc (hl)

								xor a
								ld  (_gpx), a

								ld  hl, 0
								ld  (_player), hl 		// player.x = 0

							.flick_right_done
						#endasm
					}
				#endif

				#ifndef ROW_MAP
					#ifdef BETTER_VERTICAL_CONNECTIONS
						if (player.y == -512 && player.vy < 0 && n_pant >= MAP_W) 
					#else
						if (gpy == 0 && player.vy < 0 && n_pant >= MAP_W) 
					#endif
					{

						#ifdef BETTER_VERTICAL_CONNECTIONS
							player.vy = -PLAYER_MAX_VY_SALTANDO;
							player.cont_salto = 0;
						#endif

						#asm
							#ifdef CUSTOM_SCREEN_CONNECTIONS
									call _override_flick_up
									xor a
									or  l
									jr  nz, flick_up_done
							#endif
								ld  a, (_n_pant)
								sub MAP_W
								ld  (_n_pant), a 

								ld  a, 144
								ld  (_gpy), a 

								ld  hl, #(144*64)
								ld  (_player+2), hl 		// player.y = 144 << 6

							.flick_up_done
						#endasm				
					} else if (gpy == 144 && player.vy > 0) {
						#asm
							#ifdef CUSTOM_SCREEN_CONNECTIONS
									call _override_flick_down
									xor a 
									or  l
									jr  nz, flick_down_done
							#endif
								ld  a, (_n_pant)
								add MAP_W
								ld  (_n_pant), a 

								xor a 
								ld  (_gpy), a

								ld  hl, 0
								ld  (_player+2),hl 			// player.y = 0
							.flick_down_done
						#endasm
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
							#ifdef FIXED_SCREENS
								player.killed = 0;
								malotes [enoffs].t = malotes [enoffs].t & 15;
								malotes [enoffs + 1].t = malotes [enoffs + 1].t & 15;
								malotes [enoffs + 2].t = malotes [enoffs + 2].t & 15;
							#endif
							draw_scr ();
							init_player_values ();
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
