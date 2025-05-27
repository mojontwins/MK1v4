
void main (void) {
	#ifndef CPC
		#asm 
			ld  sp, STACK_ADDR
		#endasm 
	#endif

	system_init ();

	while (1) {
		// Here the title screen
		title_screen ();
	
		#ifndef DIRECT_TO_PLAY
			blackout ();
		#endif
		
		#if defined CPC && defined AUTO_SPLIT && !defined ALWAYS_SPLIT
			do_split = 1;
		#endif

		#ifndef DIRECT_TO_PLAY
			#ifndef CPC
				#asm
					call SPUpdateNow
				#endasm 
			#endif

			#asm
					ld  hl, _s_marco
					call _unpack_screen
			#endasm
			#ifdef CPC
				cpc_ShowTileMap (1);
			#endif
		#endif

		#ifdef ACTIVATE_SCRIPTING
			#asm 
					ld  hl, _flags
					ld  de, _flags + 1
					ld  bc, MAX_FLAGS - 1
					xor a 
					ld  (hl), a 
					ldir
			#endasm
		#endif

		// Let's do it.
		playing = 1;

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

		n_pant = SCR_INICIO;
		
		#ifdef ACTIVATE_SCRIPTING		
			script_result = 0;
			
			// Execute "ENTERING GAME" script
			script (SC_ENTERING_GAME);
		#endif

		#asm
				xor a 
				ld  (_maincounter), a 
				ld  (_half_life), a 
				ld  (_scenery_info + 0), a  	// scenery_info.hide_hotspots
				ld  (_scenery_info + 1), a 		// scenery_info.dont_make_rr

				ld  a, 255
				ld  (_objs_old), a 
				ld  (_life_old), a 
				ld  (_keys_old), a 
				ld  (_killed_old), a 
				ld  (_flag_old), a
				ld  (_on_pant), a
		#endasm

		#ifdef CPC
			AY_PLAY_MUSIC (1);
		#endif

		while (playing) {
			// Change room ?
			#asm
					ld  a, (_n_pant)
					ld  c, a
					ld  a, (_on_pant)
					cp  c
					jr  z, ml_ud_skip

					call _draw_scr 

					ld  a, (_n_pant)
					ld  (_on_pant), a

					ld  a, 1
					ld  (_pant_just_rendered), a

				#if defined MODE_1 && defined AUTO_SPLIT && !defined ALWAYS_SPLIT
						ld  (_do_split), a
				#endif

				.ml_ud_skip
			#endasm

			#if !defined DEACTIVATE_OBJECTS	&& (defined OBJECTS_ICON_X || defined OBJECTS_X)
				if (player.objs != objs_old) {
					#if defined ONLY_ONE_OBJECT 
						#if defined OBJECTS_ICON_X
							draw_coloured_tile (OBJECTS_ICON_X, OBJECTS_ICON_Y, player.objs ? (HOTSPOTS_FIRST_TILE+1) : 47);
						#endif
					#else
						draw_2_digits (OBJECTS_X, OBJECTS_Y, 
							#ifdef REVERSE_OBJECT_COUNT
								PLAYER_NUM_OBJETOS - player.objs
							#else
								player.objs
							#endif
						);
					#endif
					objs_old = player.objs;
				}
			#endif

			#if defined OBJECTS_X && defined OBJECTS_X 
				if (flag_old != flags [OBJECT_COUNT]) {
					draw_2_digits (OBJECTS_X, OBJECTS_Y, flags [OBJECT_COUNT]);
					flag_old = flags [OBJECT_COUNT];
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
					#asm
						ld  a, KEYS_X 
						ld  (__x), a 
						ld  a, KEYS_Y 
						ld  (__y), a 
						ld  a, (_player + 28)		// player.objs
						ld  (_keys_old), a 
						call draw_2_digits_shortcut
					#endasm
				}
			#endif

			#if defined PLAYER_KILLS_ENEMIES && defined KILLED_X	 
				if (player.killed != killed_old) {
					draw_2_digits (KILLED_X, KILLED_Y, player.killed);
					killed_old = player.killed;	
				}
			#endif

			#if defined ACTIVATE_SCRIPTING && defined ITEM_X 
				if (flags [ITEM_FLAG] != flag_old) {
					draw_coloured_tile (ITEM_X, ITEM_Y, flags [ITEM_FLAG]);
					flag_old = flags [ITEM_FLAG];
				}
			#endif

			#asm
				ld  hl, _maincounter
				inc (hl)

				ld  a, (_half_life)
				xor 1
				ld  (_half_life), a
			#endasm
			
			mueve_bicharracos ();
			move ();
				
			#ifdef PLAYER_CAN_FIRE
				mueve_bullets ();
			#endif

			// Render
			render_all_sprites ();

			// Hotspot interaction.

			// Copy stored hotspot for this screen to hotspot_t
			// So hotspot_t can be tinkered with in the hook
			hotspot_t = hotspot_t_r;

			//if (gpx >= hotspot_x - 15 && gpx <= hotspot_x + 15 && gpy >= hotspot_y - 15 && gpy <= hotspot_y + 15) 
			#asm
					// gpx >= hotspot_x - 15 -> gpx + 15 >= hotspot_x
					ld  a, (_hotspot_x)
					ld  c, a
					ld  a, (_gpx) 
					add 12
					cp  c
					jp  c, _hotspots_else

					// gpx <= hotspot_x + 15 -> hotspot_x + 15 >= gpx
					ld  a, (_gpx)
					ld  c, a
					ld  a, (_hotspot_x)
					add 12
					cp  c
					jp  c, _hotspots_else

					// gpy >= hotspot_y - 15 -> gpy + 15 >= hotspot_y
					ld  a, (_hotspot_y)
					ld  c, a
					ld  a, (_gpy)
					add 12
					cp  c 
					jp  c, _hotspots_else

					// gpy <= hotspot_y + 15 -> hotspot_y + 15 >= gpy
					ld  a, (_gpy)
					ld  c, a
					ld  a, (_hotspot_y)
					add 12
					cp  c
					jp  c, _hotspots_else
			#endasm
			{
				if(hotspot_t) {
					rdi = 0;
					#if !defined DEACTIVATE_OBJECTS || !defined DEACTIVATE_KEYS || !defined DEACTIVATE_REFILLS 
						switch (hotspot_t) {
							#ifndef DEACTIVATE_OBJECTS
								case HOTSPOT_TYPE_OBJECT:
									#ifdef ONLY_ONE_OBJECT
										if (player.objs == 0) {
											player.objs ++;
											peta_el_beeper (6);	
										} else {
											rdi = 1;
											peta_el_beeper (1);	
										}
									#else
										player.objs ++;
										peta_el_beeper (7);
									#endif
									break;
							#endif
					
							#ifndef DEACTIVATE_KEYS
								case HOTSPOT_TYPE_KEY:
									player.keys ++;
									peta_el_beeper (8);
									break;
							#endif	

							#ifndef DEACTIVATE_REFILLS
								case HOTSPOT_TYPE_REFILL:
									player.life += PLAYER_REFILL;
									if (player.life > 99)
										player.life = 99;
									rdi = 2;
									peta_el_beeper (9);
									break;
							#endif						
						}
					#endif
					
					if (rdi != 1)  {
						draw_coloured_tile (VIEWPORT_X + (hotspot_x >> 3), VIEWPORT_Y + (hotspot_y >> 3), orig_tile);
						hotspot_y = 240;
						hotspots [n_pant].act = rdi;

						#ifdef ACTIVATE_SCRIPTING
							script (SC_PLAYER_GOT_SOMETHING);
						#endif
					}
				}
			}
			
			#asm
				._hotspots_else
				._hotspots_done
			#endasm
			
			// Render to screen

			#ifdef CPC
				cpc_UpdateNow (1);

			#else
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

						call SPUpdateNow
					.skipupd
				#endasm
			#endif

			#ifdef PLAYER_FLICKERS
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

			// Scripting related stuff
		
			#ifdef ACTIVATE_SCRIPTING		
				if (
					#ifdef SCRIPTING_KEY_M	
						#ifdef CPC	
							cpc_TestKey (KEY_AUX1)
						#else
							sp_KeyPressed (key_m) || ((pad_this_frame & sp_FIRE) == 0)
						#endif
					#endif
					#ifdef SCRIPTING_DOWN
						(pad_this_frame & sp_DOWN) == 0
					#endif
				) {	
					// Any scripts to run in this screen?
					script (SC_PRESS_FIRE_AT_ANY);

					#ifndef NO_INDEXED_SCRIPTING
						script (SC_PRESS_FIRE_AT_SCREEN + (n_pant << 1));
					#endif
				}
			#endif

			// Flick screen

			if (gpx == 0 && player.vx < 0) {
				#asm
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
						ld  hl, _n_pant
						inc (hl)

						xor a
						ld  (_gpx), a

						ld  hl, 0
						ld  (_player), hl 		// player.x = 0

					.flick_right_done
				#endasm
			}

			if (gpy == 0 && player.vy < 0 && n_pant >= MAP_W) {
				#asm
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

			// Win game condition
			
			#if defined ACTIVATE_SCRIPTING || defined PLAYER_NUM_OBJETOS || defined SCR_FIN
				if (
					#ifdef ACTIVATE_SCRIPTING
						script_result == 1
					#else
						#ifdef PLAYER_NUM_OBJETOS
							player.objs == PLAYER_NUM_OBJETOS
						#endif 
						#if defined PLAYER_NUM_OBJETOS && defined SCR_FIN 
							&&
						#endif
						#ifdef SCR_FIN	
							n_pant == pant_final &&
							(gpx >> 4) == PLAYER_FIN_X &&
							(gpy >> 4) == PLAYER_FIN_Y
						#endif
					#endif
				){
					saca_a_todo_el_mundo_de_aqui ();
					cortina ();
					playing = 0;
					game_ending ();
				}
			#endif

			// Dead player

			if (player.is_dead) {
				#asm
					.player_is_dead
				#endasm

				player.is_dead = 0;
				player.life -= player.drain_amount;
				#ifdef PLAYER_FLICKERS
					player_flicker ();
				#endif
			}

			// Game over condition

			if (player.life < 0
				#ifdef ACTIVATE_SCRIPTING
					|| script_result == 2
				#endif
			) {
				saca_a_todo_el_mundo_de_aqui ();				
				game_over ();
				playing = 0;
			}

			#asm
					xor a
					ld  (_pant_just_rendered), a
			#endasm
		}
	}
}
