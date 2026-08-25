// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

unsigned char persistence [640];
unsigned char powers [8] = {1, 2, 4, 8, 16, 32, 64, 128};

void do_extern_action (unsigned char n, unsigned char m) {
	switch (n) {
		case 0:

			// Reset persistence

			#asm 
					ld  hl, _persistence
					ld  de, _persistence + 1
					ld  bc, 639
					ldir

					ret
			#endasm

		case 1:

			// Mark tile @ n_pant, tpx, tpy.

			#asm
					// address is (n_pant << 4) + (tpx >> 3) + (tpy << 1)
					
					ld  a, (_tpy)
					sla a 
					ld  c, a
					ld  a, (_tpx) 
					srl a 
					srl a 
					srl a 
					add c 
					ld  c, a 
					ld  b, 0

					ld  hl, (_n_pant)
					ld  h, 0
					add hl, hl
					add hl, hl 
					add hl, hl
					add hl, hl 
					add hl, bc
					ld  bc, _persistence 
					add hl, bc

					push hl 

					// bitmask is 1 << (tpx & 7)
					ld  a, (_tpx)
					and 7 
					ld  d, 0
					ld  e, a 
					ld  hl, _powers
					add hl, de 
					ld  c, (hl) 

					pop hl 

					// Persist
					ld  a, (hl)
					or  c 
					ld  (hl), a 

					ret

			#endasm

		case 2:

			// Read persistence and clear papayas

			#asm
					xor a 
					ld  (_tpy), a
					ld  (_tpx), a 

					ld  hl, (_n_pant)
					ld  h, 0
					add hl, hl
					add hl, hl 
					add hl, hl
					add hl, hl 
					ld  bc, _persistence 
					add hl, bc

					// hl -> persistence for this screen
					// Read 16 bytes
					ld  b, 16
				.clear_papayas_loop
					push bc 

					ld  d, (hl)
					inc hl 
					push hl 

					// D contains a bit mask. For each 1 in the bit mask, clear a papaya

					ld  bc, 0
				.clear_papayas_subloop 
					push bc

					ld  hl, _powers
					add hl, bc

					ld  a, (hl) 		// Bitmask
					and d 
					jr  z, clear_papayas_subloop_cont

					// Coincidence: clear papaya
					push de 

					// Safe...
					ld  a, (_tpx)
					cp  15
					jr  z, skipthis
					
					ld  (__x), a 
					ld  c, a 

					ld  a, 12
					ld  (__t), a 
					xor a 
					ld  (__n), a 
					ld  a, (_tpy)
					ld  (__y), a 
					call set_map_tile_do
				.skipthis
					pop de 

				.clear_papayas_subloop_cont

					// Move cursor

					ld  a, (_tpx)
					inc a 
					cp  16 
					jr  nz, clear_papayas_no_nl
					ld  a, (_tpy)
					inc a 
					ld  (_tpy), a
					xor a 
				.clear_papayas_no_nl
					ld  (_tpx), a 

					// Next
					pop bc 
					inc bc 
					ld  a, c 
					cp  8
					jr  nz, clear_papayas_subloop

					pop hl 
					pop bc
					djnz clear_papayas_loop

					ret
			#endasm 

		case 3:

			// Update papayas
			draw_2_digits (13, 2, flags [1]);
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

	// Text has been decoded in a 256 bytes buffer pointed by ptr.
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

		// Custom : In this game. if `flag [2]` is set, no wait / restore is performed

		if (flags [2] == 0) {
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

			#endasm 
		}

		flags [2] = 0;
	}

	#ifdef ENABLE_DIALOG
		// Options have been decoded in three 32 bytes buffers pointed by ptr.
		unsigned char __FASTCALL__ dialog (unsigned char *ptr) {
			#asm 
					ld (_gp_gen), hl

					// Draw FRAME TOP
					ld  a, 16
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

					ld  b, 1
					ld  a, 17
					ld  (__y), a
				.dialog_show_loop
					push bc 

					// Skip empty option
					ld  hl, (_gp_gen)
					ld  a, (hl)
					or  a 
					jr  z, dialog_show_continue

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

					// Print option number
					pop bc 
					push bc 
				#ifdef CPC
					
					ld  a, 9 
					ld  (__x), a 
					call __tile_address 
					ld  a, b 
					add 16
					ld  (de), a 
				#else
					ld  a, b 
					add 16 
					ld  d, a 
					ld  e, ATTR_TEXTBOX
					ld  c, 9 
					ld  a, (__y)
					call SPPrintAtInv
				#endif

					// Printo option text
					ld  a, 12 
					ld  (__x), a 
					ld  hl, (_gp_gen)

				#ifdef CPC
						call draw_text_pre_loop
				#else 
						ld  a, ATTR_TEXTBOX
						ld  (__n), a 
						call draw_text_loop
				#endif	

					ld  a, (__y)
					inc a
					ld  (__y), a

				.dialog_show_continue
					ld  hl, (_gp_gen)
					ld  bc, 32
					add hl, bc 
					ld  (_gp_gen), hl

					pop bc 
					ld  a, b 
					inc a  
					ld  b, a
					cp  4
					jr  nz, dialog_show_loop

					// Draw FRAME BOTTOM
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

			#endasm 

			// Keys 1-2-3 select option
			// CPC: 
			// KEY_AUX3: 1, KEY_AUX4: 2, KEY_AUX2: 3
			// ZX:
			// key_1, key_2, key_3

			while (1) {
				#ifdef CPC
					if (cpc_TestKey (KEY_AUX3)) return 1;
					if (cpc_TestKey (KEY_AUX4)) return 2;
					if (cpc_TestKey (KEY_AUX2)) return 3;
				#else 
					if (sp_KeyPressed (key_1)) return 1;
					if (sp_KeyPressed (key_2)) return 2;
					if (sp_KeyPressed (key_3)) return 3;
				#endif
			}
		}
	#endif
#endif 
