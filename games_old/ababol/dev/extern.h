// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

#ifndef CPC
	void sprite_remove_aid (void) {
		saca_a_todo_el_mundo_de_aqui ();

		// Validate whole screen so sprites stay on next update
		#asm
				LIB SPValidate
				ld  c, VIEWPORT_X
				ld  b, VIEWPORT_Y
				ld  d, VIEWPORT_Y+19
				ld  e, VIEWPORT_X+29
				ld  iy, fsClipStruct
				call SPValidate
		#endasm				
	}
#endif

void recuadrius (void) {
	#ifdef CPC
		for (rdi = 0; rdi < 10; rdi ++) {
			for (rdx = rdi; rdx < 30 - rdi; rdx ++) {
				#asm
						// sp_PrintAtInv (VIEWPORT_Y + rdi, VIEWPORT_X + rdx, 71, 0);
						ld  a, (_rdi)
						add VIEWPORT_Y
						ld  (__y), a
						ld  a, (_rdx)
						add VIEWPORT_X
						ld  (__x), a
						call __tile_address	; DE = buffer address
						xor a
						ld  (de), a
						ld  a, (__x)
						ld  e, a
						ld  a, (__y)
						ld  d, a
						call cpc_UpdTileTable
					
						// sp_PrintAtInv (VIEWPORT_Y + 19 - rdi, VIEWPORT_X + rdx, 71, 0);
						ld  a, (_rdi)
						ld  c, a
						ld  a, #(VIEWPORT_Y+19)
						sub c
						ld  (__y), a
						ld  a, (_rdx)
						add VIEWPORT_X
						ld  (__x), a
						call __tile_address	; DE = buffer address
						xor a
						ld  (de), a
						ld  a, (__x)
						ld  e, a
						ld  a, (__y)
						ld  d, a
						call cpc_UpdTileTable
				#endasm

				if (rdx < 19 - rdi) {
					#asm
							// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + rdi, 71, 0);
							ld  a, (_rdx)
							add VIEWPORT_Y
							ld  (__y), a
							ld  a, (_rdi)
							add VIEWPORT_X
							ld  (__x), a
							call __tile_address	; DE = buffer address
							xor a
							ld  (de), a
							ld  a, (__x)
							ld  e, a
							ld  a, (__y)
							ld  d, a
							call cpc_UpdTileTable

							// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + 29 - rdi, 71, 0);
							ld  a, (_rdx)
							add VIEWPORT_Y
							ld  (__y), a
							ld  a, (_rdi)
							ld  c, a
							ld  a, #(VIEWPORT_X+29)
							sub c						
							ld  (__x), a
							call __tile_address	; DE = buffer address
							xor a
							ld  (de), a
							ld  a, (__x)
							ld  e, a
							ld  a, (__y)
							ld  d, a
							call cpc_UpdTileTable
					#endasm
				}
			}
			
			cpc_UpdateNow (0);
		}
	#else
		sprite_remove_aid ();			
		for (rdi = 0; rdi < 10; rdi ++) {
			for (rdx = rdi; rdx < 30 - rdi; rdx ++) {
				#asm
						// sp_PrintAtInv (VIEWPORT_Y + rdi, VIEWPORT_X + rdx, 71, 0);
						ld  de, 0x4700
						ld  a, (_rdx)
						add VIEWPORT_X
						ld  c, a
						ld  a, (_rdi)
						add VIEWPORT_Y
						call SPPrintAtInv
					
						// sp_PrintAtInv (VIEWPORT_Y + 19 - rdi, VIEWPORT_X + rdx, 71, 0);
						ld  de, 0x4700
						ld  a, (_rdx)
						add VIEWPORT_X
						ld  c, a
						ld  a, (_rdi)
						ld  b, a
						ld  a, VIEWPORT_Y + 19
						sub b
						call SPPrintAtInv
				#endasm

				if (rdx < 19 - rdi) {
					#asm
							// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + rdi, 71, 0);
							ld  de, 0x4700
							ld  a, (_rdi)
							add VIEWPORT_X
							ld  c, a
							ld  a, (_rdx)
							add VIEWPORT_Y
							call SPPrintAtInv

							// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + 29 - rdi, 71, 0);
							ld  de, 0x4700
							ld  a, (_rdi)
							ld  b, a
							ld  a, VIEWPORT_X + 29
							sub b
							ld  c, a
							ld  a, (_rdx)
							add VIEWPORT_Y							
							call SPPrintAtInv
					#endasm
				}
			}
			#asm
				halt
				call SPUpdateNow
			#endasm
		}
	#endif
}

void do_extern_action (unsigned char n, unsigned char m) {
	switch (n) {
		case 0: player.vy = -PLAYER_MAX_VY_SALTANDO; break;
		case 1: 
			#ifdef CPC
				wyz_stop_sound ();
			#endif
			#asm
					ld  a, 1
					call shiruplay
			#endasm
			recuadrius (); 
			#ifdef CPC
				wyz_play_music (1);
			#endif
			break;
		case 2:
			#ifdef CPC
				wyz_stop_sound ();
			#endif
			#asm
					ld  a, 2
					call shiruplay
			#endasm
			#ifdef CPC
				wyz_play_music (1);
			#endif
			break;
	}
}

#ifdef ENABLE_ENCODED_TEXT

	// Text box code by The Mojon Twins (auto-nicked from Hobbit)

	#define ATTR_TEXTBOX   7

	unsigned char top_string []    = "<======================>";
	unsigned char mid_string []    = "#                      $";
	unsigned char bottom_string [] = "'(((((((((((((((((((((()";
	unsigned char temp_string []   = "                      ";
	unsigned char redraw_after_text;

	void redraw_from_buffer (void) {
		#asm
				ld  a, VIEWPORT_X
				ld  (__x), a
				ld  a, VIEWPORT_Y
				ld  (__y), a
				
				xor a
			.redraw_from_buffer_loop
				ld  (_gpit), a

				ld  bc, (_gpit)
				ld  b, 0
				ld  hl, _map_buff
				add hl, bc
				ld  a, (hl)
				cp  16
				jr  nc, redraw_set_tile

			.redraw_set_tile
				ld  (__t), a

				call _draw_coloured_tile_do

				ld  a, (__x)
				add a, 2
				cp  VIEWPORT_X + 30
				jr  nz, redraw_from_buffer_set_x
				ld  a, (__y)
				add a, 2
				ld  (__y), a
				ld  a, VIEWPORT_X
			.redraw_from_buffer_set_x
				ld  (__x), a

				ld  a, (_gpit)
				inc a
				cp  150
				jr  nz, redraw_from_buffer_loop
		#endasm
	}

	#ifdef CPC
		void print_tile_inv () {
			#asm

					// Esto obtiene la direccion del tile en DE
					call __tile_address

					// Escribimos el tile
					ld  a, (__n)
					ld  (de), a

					// Invalidamos el tile
					ld  a, (__x)
					ld  e, a
					ld  a, (__y)
					ld  d, a 

					// Esto invalida el tile en E, D
					call cpc_UpdTileTable 
			#endasm
		}
	#endif

	void draw_text_cbc (void) {
		#ifdef CPC 
			#asm
				// Text to draw in HL, 0 terminated
					
				.dtcbc_loop
					ld  a, (_rdx)
					ld  (__x), a 
					ld  c, a 
					inc a 
					ld  (_rdx), a
					
					ld  a, (hl) 
					or  a 
					jr  z, dtcbc_done		// End of line
					inc hl 
					sub 32 
					jr  z, dtcbc_loop		// Skip spaces.
					
					halt 
					halt 
					
					push hl 

					// Draw inv tile A @ rdx, rdy
					ld  (__n), a
					ld  a, (_rdy) 
					ld  (__y), a 
							
					call _print_tile_inv

			#endasm 
			cpc_UpdateNow (0);
			#asm 	

					pop hl 

					jr  dtcbc_loop

				.dtcbc_done
					xor a 
					ld  (_rdc), a
			#endasm
		#else 
			#asm
					// Text to draw in HL, 0 terminated
				.dtcbc_loop
					ld  a, (_rdx)
					ld  c, a 
					inc a 
					ld  (_rdx), a
					ld  a, (__n)
					ld  d, a 
					ld  a, (hl) 
					or  a 
					jr z, dtcbc_done
					inc hl 
					sub 32 
					halt 
					halt 
					
					jr  z, dtcbc_loop		// Skip spaces.
					
					ld  e, a 
					ld  a, (_rdy)

					push hl 

					call SPPrintAtInv 
					call SPUpdateNow			
					pop hl 

					jr  dtcbc_loop

				.dtcbc_done
					xor a 
					ld  (_rdc), a
			#endasm
		#endif
	}

	void __FASTCALL__ textbox (unsigned char *ptr) {
		#asm
				ld  (_gp_gen), hl
		#endasm

		#ifndef CPC
			sprite_remove_aid ();
		#endif

		// Text renderer will read the string and
		// build substrings for draw_text.

		#asm

			// Draw FRAME TOP
				ld  a, 6
				ld  (__y), a 
				ld  a, 4 
				ld  (__x), a 
				ld  hl, _top_string
			#ifdef CPC
					call draw_text_pre_loop
			#else
					ld  a, ATTR_TEXTBOX
					ld  (__n), a 
					call draw_text_loop
			#endif
		
				ld  a, 7 
				ld  (_rdy), a
		
			// Main loop to output lines of text

			.stb_loop				

			// Clear line above, if rdy > 7
				ld  a, (_rdy)
				cp  8
				jr  c, stb_notop

			.stb_top

			// Draw FRAME INNER
				ld  a, (_rdy)
				dec a 
				ld  (__y), a 
				ld  a, 4
				ld  (__x), a 
				ld  hl, _mid_string 
			#ifdef CPC 
					call draw_text_pre_loop
			#else
					ld  a, ATTR_TEXTBOX
					ld  (__n), a 
					call draw_text_loop
			#endif

			.stb_notop

			// Draw FRAME INNER (text bg)
				ld  a, (_rdy)
				ld  (__y), a 
				ld  a, 4
				ld  (__x), a 
				ld  hl, _mid_string 
			#ifdef CPC
					call draw_text_pre_loop
			#else 
					ld  a, ATTR_TEXTBOX
					ld  (__n), a 
					call draw_text_loop
			#endif

			// Draw FRAME BOTTOM
				ld  a, (_rdy)
				inc a 
				ld  (__y), a 
				ld  a, 4
				ld  (__x), a 
				ld  hl, _bottom_string 
			#ifdef CPC
					call draw_text_pre_loop
			#else 	
					ld  a, ATTR_TEXTBOX
					ld  (__n), a 
					call draw_text_loop
			#endif

			// Fill buffer with the next line of text

				ld  de, _temp_string 	
				ld  hl, (_gp_gen)				// HL -> current text

			.fill_buffer_loop
				ld  a, (hl) 					// Read char from text
				
				or  a
				jr  z, fill_buffer_end 			// 0 -> done filling buffer (string end)
				cp  '%'
				jr  z, fill_buffer_end 			// % -> done filling buffer (new line)

				ld  (de), a 					// Write to buffer
				inc de
				inc hl

				jr  fill_buffer_loop

			.fill_buffer_end
				xor a 
				ld  (de), a 					// String end

				ld  (_gp_gen), hl

				ld  a, 5 						// Left border + 1
				ld  (_rdx), a

			#ifndef CPC 
					ld  a, ATTR_TEXTBOX
					ld  (__n), a 
			#endif
			
				ld  hl, _temp_string
				call dtcbc_loop
			
				ld  a, (_rdy)
				add 2 
				ld  (_rdy), a
		
				// if (*gp_gen == 0) break;	
				ld  hl, (_gp_gen)
				ld  a, (hl) 
				or  a 
				jr  z, stb_exitloop

				// gp_gen ++;
				inc hl 
				ld  (_gp_gen), hl

				jp stb_loop

			.stb_exitloop
		#endasm

		#ifdef CPC 
			cpc_UpdateNow (0);
		#else
			#asm 
					call SPUpdateNow
			#endasm
		#endif
		peta_el_beeper (1);

		#asm
			// do { pad_read (); } while (0xff == pad_this_frame);
			.stb_waitkey
				call _pad_read 
				ld  a, (_pad_this_frame)
				inc a 
				jr  z, stb_waitkey 			// if pad = 0xff, inc pad = 0, so loop.

				call _redraw_from_buffer
				call _hotspot_paint
				call _render_all_sprites

			#ifdef CPC
					ld  hl, 1 
					push hl 
					call _cpc_UpdateNow
					pop hl 
			#else
					call SPUpdateNow
			#endif
			.stb_redraw_done

		#endasm 
	}

#endif 
