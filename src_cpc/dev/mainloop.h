// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// mainloop.h
// Cointains initialization stuff and the main game loop.

#ifdef CUSTOM_SCREEN_CONNECTIONS
	#include "custom_screen_connections.h"
#endif

void main (void) {
	// CPC initialization
	
	AY_INIT ();

	#asm
		di

		ld  hl, 0xC000
		xor a
		ld  (hl), a
		ld  de, 0xC001
		ld  bc, 0x3DFF
		ldir

		ld  a, 195
		ld  (0x38), a
		ld  hl, _isr
		ld  (0x39), hl
		jp  isr_done

	._isr
		push af 
		
		ld  a, (isr_c1)
		inc a
		cp  6
		jr  c, _skip_ay_player

		ld  a, (isr_c2)
		inc a
		ld  (isr_c2), a

	#ifdef SOUND_WYZ
			ld  a, (_isr_player_on)
			or  a
			jr  z, _skip_ay_player

			push hl
			push de
			push bc
			push ix
			push iy

			call WYZ_PLAYER_ISR

			pop iy
			pop ix
			pop bc
			pop de 
			pop hl

	#endif

		xor a

	._skip_ay_player 
		ld  (isr_c1), a	
		
		pop af
		ei
		ret

	.isr_c1 
		defb 0
	.isr_c2
		defb 0

	.isr_done
	#endasm
	
	// Border 0

	cpc_Border (0x54);

	// Decompress LUT in place

	//unpack ((unsigned int) (trpixlutc), BASE_LUT);
	#asm
			ld  hl, _trpixlutc
			ld  de, BASE_LUT
			call depack
	#endasm

	blackout ();
	pal_set (my_inks);
	
	// Set mode

	cpc_SetMode (0);

	// Set tweaked mode 
	// (thanks Augusto Ruiz for the code & explanations!)
	
	#asm
		; Horizontal chars (32), CRTC REG #1
		ld    b, 0xbc
		ld    c, 1			; REG = 1
		out   (c), c
		inc   b
		ld    c, 32			; VALUE = 32
		out   (c), c

		; Horizontal pos (42), CRTC REG #2
		ld    b, 0xbc
		ld    c, 2			; REG = 2
		out   (c), c
		inc   b
		ld    c, 42			; VALUE = 42
		out   (c), c

		; Vertical chars (24), CRTC REG #6
		ld    b, 0xbc
		ld    c, 6			; REG = 6
		out   (c), c
		inc   b
		ld    c, 24			; VALUE = 24
		out   (c), c
	#endasm

	// Sprite creation

	// Player 

	// sp_sw struct is 16 bytes wide. This is easy
	// 0   2   4      6   7   8  9  10 11 12      14
	// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc

	/*
	sp_sw [SP_PLAYER].cox = sm_cox [0];
	sp_sw [SP_PLAYER].coy = sm_coy [0];
	sp_sw [SP_PLAYER].invfunc = sm_invfunc [0];
	sp_sw [SP_PLAYER].updfunc = sm_updfunc [0];
	sp_sw [SP_PLAYER].sp0 = sp_sw [SP_PLAYER].sp1 = (unsigned int) (sm_sprptr [0]);
	*/
	#asm
		.sprite_creation

			ld  ix, #(BASE_SPRITES+(SP_PLAYER*16))
			
			ld  a, (_sm_cox) 			// sm_cox [0]
			ld  (ix + 6), a

			ld  a, (_sm_coy) 			// sm_coy [0]
			ld  (ix + 7), a

			ld  hl, (_sm_invfunc)		// sm_invfunc [0]
			ld  (ix + 13), h
			ld  (ix + 12), l

			ld  hl, (_sm_updfunc)		// sm_updfunc [0]
			ld  (ix + 15), h
			ld  (ix + 14), l

			ld  hl, (_sm_sprptr) 		// sm_sprptr [0]
			ld  (ix + 1), h
			ld  (ix + 0), l

			ld  (ix + 3), h
			ld  (ix + 2), l			
	#endasm

	// Enemies 

	/*
	for (gpit = SP_ENEMS_BASE; gpit < SP_ENEMS_BASE + MAX_ENEMS; gpit ++) {
		sp_sw [gpit].invfunc = cpc_PutSpTileMap4x8;
		sp_sw [gpit].updfunc = cpc_PutTrSp4x8TileMap2b;
	}
	*/
	#asm
			ld  ix, #(BASE_SPRITES+(SP_ENEMS_BASE*16))
			ld  de, 16

			ld  b, MAX_ENEMS

		.sp_sw_init_enems_loop
			ld  hl, cpc_PutSpTileMap4x8				// sm_invfunc [0]
			ld  (ix + 13), h
			ld  (ix + 12), l

			ld  hl, cpc_PutTrSp4x8TileMap2b 		// sm_updfunc [0]
			ld  (ix + 15), h
			ld  (ix + 14), l	

			add ix, de
			djnz sp_sw_init_enems_loop		
	#endasm

	// Bullets are 4x8

	#ifdef PLAYER_CAN_FIRE
		/*
		for (gpit = SP_BULLETS_BASE; gpit < SP_BULLETS_BASE + MAX_BULLETS; gpit ++) {
			sp_sw [gpit].cox = 0;
			sp_sw [gpit].coy = 0;
			sp_sw [gpit].invfunc =cpc_PutSpTileMap4x8;
			sp_sw [gpit].updfunc = cpc_PutTrSp4x8TileMap2b;
			sp_sw [gpit].sp0 = sp_sw [gpit].sp1 = (unsigned int) (sprite_19_a);
		}
		*/
		#asm
				ld  ix, #(BASE_SPRITES+(SP_BULLETS_BASE*16))
				ld  de, 16

				ld  b, MAX_BULLETS

			.sp_sw_init_bullets_loop
				xor a
				ld  (ix + 6), a
				ld  (ix + 7), a

				ld  hl, cpc_PutSpTileMap4x8				// sm_invfunc [0]
				ld  (ix + 13), h
				ld  (ix + 12), l

				ld  hl, cpc_PutTrSp4x8TileMap2b 		// sm_updfunc [0]
				ld  (ix + 15), h
				ld  (ix + 14), l	

				ld  hl, _sprite_19_a 					// sm_sprptr [0]
				ld  (ix + 1), h
				ld  (ix + 0), l

				ld  (ix + 3), h
				ld  (ix + 2), l		

				add ix, de
				djnz sp_sw_init_bullets_loop
		#endasm
	#endif

	// Sword is 4x8

	#ifdef ENABLE_SWORD	
		/*
		sp_sw [SP_SWORD_BASE].cox = 0;
		sp_sw [SP_SWORD_BASE].coy = 0;
		sp_sw [SP_SWORD_BASE].invfunc =cpc_PutSpTileMap4x8;
		sp_sw [SP_SWORD_BASE].updfunc = cpc_PutTrSp4x8TileMap2b;
		sp_sw [SP_SWORD_BASE].sp0 = sp_sw [SP_SWORD_BASE].sp1 = (unsigned int) (sprite_19_a);
		*/
		#asm
				ld  ix, #(BASE_SPRITES+(SP_SWORD_BASE*16))

				xor a
				ld  (ix + 6), a
				ld  (ix + 7), a

				ld  hl, cpc_PutSpTileMap4x8				// sm_invfunc [0]
				ld  (ix + 13), h
				ld  (ix + 12), l

				ld  hl, cpc_PutTrSp4x8TileMap2b 		// sm_updfunc [0]
				ld  (ix + 15), h
				ld  (ix + 14), l	

				ld  hl, _sprite_19_a 					// sm_sprptr [0]
				ld  (ix + 1), h
				ld  (ix + 0), l

				ld  (ix + 3), h
				ld  (ix + 2), l				
		#endasm
	#endif

	// Turn off all sprites

	/*
	for (gpit = 0; gpit < SW_SPRITES_ALL; ++ gpit) {
		sp_sw [gpit].ox = (VIEWPORT_X*8) >> 2;
		sp_sw [gpit].oy = VIEWPORT_Y*8;
	}
	*/
	#asm
			ld  ix, BASE_SPRITES
			ld  de, 16
			ld  b, SW_SPRITES_ALL

		.sp_sw_init_turnoff_loop			
			ld  a, #((VIEWPORT_X*8)/4)
			ld  (ix + 10), a
			
			ld  a, #(VIEWPORT_Y*8)
			ld  (ix + 11), a 

			add ix, de
			djnz sp_sw_init_turnoff_loop
	#endasm	
	
	#ifdef ENABLE_CODE_HOOKS
		hook_system_inits ();
	#endif

	#asm
		ei
	#endasm

	while (1) {
		// Here the title screen
		title_screen ();
		
		#ifndef DIRECT_TO_PLAY
			//unpack ((unsigned int) (s_marco), BASE_SUPERBUFF);
			#asm
					ld  hl, _s_marco
					ld  de, BASE_SUPERBUFF
					call depack
			#endasm
			cpc_ShowTileMap (1);
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
				/*
				sp_PrintAtInv (KILLED_Y, 2 + KILLED_X, 71, 15);
				sp_PrintAtInv (KILLED_Y, 3 + KILLED_X, 71, 16 + BADDIES_COUNT / 10);
				sp_PrintAtInv (KILLED_Y, 4 + KILLED_X, 71, 16 + BADDIES_COUNT % 10);
				*/
				// TODO
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

		AY_PLAY_MUSIC (1);

		while (playing) {
			#ifdef ENABLE_CODE_HOOKS
				hook_init_mainloop ();
			#endif

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
							/*
							sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X, 135, 132);
							sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X + 1, 135, 133);
							sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X, 135, 134);
							sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X + 1, 135, 135);
							*/
							#asm
									// Calculate address in the display list

									ld  a, OBJECTS_ICON_X
									ld  (__x), a
									ld  c, a
									ld  a, OBJECTS_ICON_Y
									ld  (__y), a
									
									call __tile_address	; DE = buffer address
									ex de, hl

									// Now write 4 chars.
									ld  a, 132
									
									ld  (hl), a
									inc hl
									inc a
									ld  (hl), a
									ld  bc, 31
									add hl, bc
									inc a
									ld  (hl), a
									inc hl
									inc a
									ld  (hl), a							

									call _invalidate_tile
							#endasm						
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
						xor 0x10 	// Flip bit 4
						ld  (__t), a
						
						ld  de, _comportamiento_tiles
						add hl, de
						ld  a, (hl)
						ld  (__n), a

						call set_map_tile_do
					.animated_tiles_done
				#endasm
			#endif

			// Update to screen

			cpc_UpdateNow (1);
			
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
					if (cpc_TestKey (KEY_AUX1))
				#endif
				#ifdef SCRIPTING_DOWN
					if (cpc_TestKey (KEY_DOWN))
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
					game_ending ();
					playing = 0;
				}
			#elif defined ENABLE_CODE_HOOKS
				if (game_loop_flag == 1) {
					saca_a_todo_el_mundo_de_aqui ();
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
				if (cpc_TestKey (KEY_AUX4)) {
					player.is_dead = 1;
					player.life --;
				}
			#endif
		}	
		AY_STOP_SOUND();
	}
}
