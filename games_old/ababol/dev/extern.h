// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

void do_extern_action (unsigned char n, unsigned char m) {
	if (n == 0) player.vy = -PLAYER_MAX_VY_SALTANDO;
}

#ifdef ENABLE_ENCODED_TEXT

	// Text box code by The Mojon Twins (auto-nicked from Hobbit)

	#define ATTR_TEXTBOX   7

	unsigned char top_string []    = "<======================>";
	unsigned char temp_string []   = "#                      $";
	unsigned char bottom_string [] = "'(((((((((((((((((((((()";
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

	void clear_temp_string (void) {
		#asm
				ld  hl, _temp_string+1
				ld  de, _temp_string+2
				ld  bc, 21
				ld  a, 32
				ld  (hl), a
				ldir
		#endasm
	}

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
					jr z, dtcbc_done
					inc hl 
					sub 32 
					halt 
					halt 
					
					jr  z, dtcbc_loop		// Skip spaces.

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
				call _clear_temp_string

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
				ld  hl, _temp_string 
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
				ld  hl, _temp_string 
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

				ld  de, _temp_string + 1 		// Skip frame border
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
				ld  (_gp_gen), hl

				ld  a, 4
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
			wyz_play_sound (7);
		#else
			#asm 
					call SPUpdateNow
			#endasm
			peta_el_beeper (7);
		#endif

		#asm
			// do { pad_read (); } while (0xff == pad_this_frame);
			.stb_waitkey
				call _pad_read 
				ld  a, (_pad_this_frame)
				inc a 
				jr  z, stb_waitkey 			// if pad = 0xff, inc pad = 0, so loop.

				ld  a, (_redraw_after_text)
				or  a 
				jr  z, stb_redraw_done

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

				ld  a, 1 
				ld  (_redraw_after_text), a
		#endasm 
	}

#endif 
