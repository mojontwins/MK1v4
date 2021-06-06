// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).

void draw_rectangle (void) {	
	#asm
			ld  a, (__x)
			ld  c, a

			ld  a, (__y)
			ld  b, a
			
			ld  a, (__x2)
			ld  e, a

			ld  a, (__y2)
			ld  d, a
			
			ld  iy, fsClipStruct
			call SPInvalidate	

		.dr_outter_loop
			ld  a, (__y)
			ld  b, a

			ld  a, (__y2)
			cp  b
			ret c

			ld  a, (__x)
			ld  c, a
			ld  a, (__y)
			call SPCompDListAddr 	// Won't destroy c!

			ld  a, (__x)
			ld  b, a
			ld  a, (__x2)
			inc a 
			sub b
			ld  b, a
			
		.dr_inner_loop
			ld  a, (__t)
			ld  (hl), a
			inc hl
			
			xor a
			ld  (hl), a
			inc hl
			inc hl 
			inc hl			

			djnz dr_inner_loop

		.dr_outter_loop_continue
			ld  hl, __y
			inc (hl)
			jr  dr_outter_loop
	#endasm
}

void attr (char x, char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x

			dec hl
			dec hl
			ld  a, (hl) 	// y
			
			// If you put x in C and y in A you can call here
			
		._attr_2
			// A = y, C = x
			cp  10
			jr  c, _attr_1

		#ifdef BETTER_VERTICAL_CONNECTIONS
				cp  11
				jr  nc, _attr3
				ld  hl, 0
				ret
				
			._attr3
				xor a 	 	// Negative values replicate first row
		#else
				ld  hl, 0
				ret
		#endif

		._attr_1
			ld  b, a 		// save y
			ld  a, c 		// x
			cp  15
			jr  c, _attr_1b
			ld  hl, 0
			ret

			// If you put x in C and y in A you can use this entry point for enemies

		._attr_enems
			cp  10
			jr  c, _attr_enems_skip_1
			ld  hl, 8
			ret
		._attr_enems_skip_1
			ld  b, a
			ld  a, c
			cp  15
			jr  c, _attr_1b
			ld  hl, 8
			ret

		._attr_1b
			ld  a, b 		// restore y
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_attr
			add hl, de
			ld  l, (hl)

		._attr_end
			ld  h, 0
	#endasm
}

void qtile (unsigned char x, unsigned char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x
		
			dec hl
			dec hl
			ld  a, (hl) 	// y

			// If you put x in C and y in A you can call here
			
		.qtile_do	
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_buff
			add hl, de

			ld  l, (hl)
			ld  h, 0
	#endasm
}

// Draw tile tile

void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
	//_x = x; _y = y; _t = t;
	#asm
			; Copy params for speed & size
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__t), a
		._draw_coloured_tile_do
	#endasm

	#if defined USE_AUTO_SHADOWS && !defined UNPACKED_MAP
		prxx = (_x - VIEWPORT_X) >> 1;
		pryy = (_y - VIEWPORT_Y) >> 1;	
		if (attr (prxx, pryy) < 8 && (_t < 16 || _t == 19)) {
			_t = 64 + (_t << 2);
			gp_gen_org = (unsigned char *) &tileset [2048 + _t];
			sp_PrintAtInv (_y, _x, attr (prxx - 1, pryy - 1) == 8 ? (gp_gen_org[0] & 7)-1 : gp_gen_org [0], _t);
			sp_PrintAtInv (_y, _x + 1, attr (prxx, pryy - 1) == 8 ? (gp_gen_org[1] & 7)-1 : gp_gen_org [1], _t + 1);
			sp_PrintAtInv (_y + 1, _x, attr (prxx - 1, pryy) == 8 ? (gp_gen_org[2] & 7)-1 : gp_gen_org [2], _t + 2);
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen_org [3], _t + 3);
		} else
	#elif defined USE_AUTO_TILE_SHADOWS && !defined UNPACKED_MAP
		prxx = (_x - VIEWPORT_X) >> 1;
		pryy = (_y - VIEWPORT_Y) >> 1;	
		if (attr (prxx, pryy) < 4 && (_t < 16 || _t == 19)) {
			if (_t == 19) {
				_t = 140;
				t_alt = 192;				
			} else {
				_t = 64 + (_t << 2);
				t_alt = 128 + _t;
			}

			gp_gen_org = tileset + 2048 + _t;
			gp_gen_alt = tileset + 2048 + t_alt;
			
			if (attr (prxx - 1, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x, gp_gen_alt [0], t_alt);
			} else {
				sp_PrintAtInv (_y, _x, gp_gen_org [0], _t);
			}
			if (attr (prxx, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x + 1, gp_gen_alt [1], t_alt + 1);
			} else {
				sp_PrintAtInv (_y, _x + 1, gp_gen_org [1], _t + 1);
			}
			if (attr (prxx - 1, pryy) >= 4) {
				sp_PrintAtInv (_y + 1, _x, gp_gen_alt [2], t_alt + 2);
			} else {
				sp_PrintAtInv (_y + 1, _x, gp_gen_org [2], _t + 2);
			} 
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen_org [3], _t + 3);
		} else
	#endif
	{
		/*
		_t = 64 + (_t << 2);
		gp_gen_org = (unsigned char *) &tileset [2048 + _t];
		sp_PrintAtInv (_y, _x, *gp_gen_org, _t); gp_gen_org ++; _t ++;
		sp_PrintAtInv (_y, _x + 1, *gp_gen_org, _t); gp_gen_org ++; _t ++;
		sp_PrintAtInv (_y + 1, _x, *gp_gen_org, _t); gp_gen_org ++; _t ++;
		sp_PrintAtInv (_y + 1, _x + 1, *gp_gen_org, _t);
		*/
		#asm
				ld  a, (__x)
				ld  c, a
				ld  a, (__y)
				call SPCompDListAddr
				ex de, hl

				// Now write 4 attributes and 4 chars.

				// Make a pointer to the metatile colour array	
				ld  a, (__t)
				sla a
				sla a 				// A = _t * 4
				add 64 				// A = _t * 4 + 64
				
				ld  hl, _tileset + 2048
				ld  b, 0
				ld  c, a
				add hl, bc 			// HL = tileset + _taux
				
				ld  c, a 			// C = current pattern #

				// For each char: write colour, inc DE, write tile, inc DE*3
				
				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc de
				inc a 				// next tile
				ld  c, a 

				inc de
				inc de 				// next DisplayList cell

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc a 				// next tile
				
				ex  de, hl
				ld  bc, 123
				add hl, bc
				ex  de, hl			// next DisplayList cell
				ld  c, a 

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc de
				inc a 				// next tile
				ld  c, a 

				inc de
				inc de 				// next DisplayList cell

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de

				ld  a, c  			// read tile
				ld  (de), a			// write tile

				ld  a, (__x)
				ld  c, a
				inc a
				ld  e, a
				ld  a, (__y)
				ld  b, a
				inc a
				ld  d, a
				ld  iy, fsClipStruct
				call SPInvalidate	
		#endasm
	}		
}

void set_map_tile (unsigned char x, unsigned char y, unsigned char t, unsigned char n) {
	#asm
			; Copy params for speed & size
			ld  hl, 8
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			ld  c, a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__t), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__n), a

		.set_map_tile_do
			ld  a, (__y)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  b, 0
			ld  c, a

			ld  hl, _map_buff
			add hl, bc
			ld  a, (__t)
			ld (hl), a

			ld  hl, _map_attr
			add hl, bc
			ld  a, (__n)
			ld (hl), a
			
			ld  a, (__x)
			sla a
			add VIEWPORT_X
			ld  (__x), a

			ld  a, (__y)
			sla a
			add VIEWPORT_Y
			ld  (__y), a

			jp _draw_coloured_tile_do
	#endasm
}

void draw_2_digits (unsigned char x, unsigned char y, unsigned char value) {
	#asm
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			
			ld  d, 0
			ld  e, a
			ld  hl, 10
			call l_div_u 	// HL = division, DE = rest

			ld  a, e
			ld  (__n), a
			ld  a, l
			
			add 16
			ld  e, a
			ld  d, 71
			ld  a, (__x)
			ld  c, a
			ld  a, (__y)
			call SPPrintAtInv

			ld  a, (__n)
			add 16
			ld  e, a
			ld  d, 71
			ld  a, (__x)
			inc a
			ld  c, a
			ld  a, (__y)
			call SPPrintAtInv			
	#endasm
}

void draw_text (unsigned char x, unsigned char y, unsigned char c, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 8
			add hl, sp
			
			ld  a, (hl)
			ld  (__x), a
			ld  (__t), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			
			ld  a, (hl)
			ld  (__n), a
			dec hl

			ld  a, (hl)
			dec hl 
			ld  l, (hl)
			ld  h, a

		.draw_text_loop
			ld  a, (__x)
			ld  c, a
			inc a
			ld  (__x), a

			ld  a, (__n)
			ld  d, a
			
			ld  a, (hl)
			or  a
			ret z
			
			inc hl

			cp  0x25
			jr  z, draw_text_nl

			sub 32
			ld  e, a
			
			ld  a, (__y)
			
			push hl
			call SPPrintAtInv
			pop hl
			
			jr  draw_text_loop

		.draw_text_nl
			ld  a, (__t)
			ld  (__x), a
			ld  a, (__y)
			inc a
			ld  (__y), a
			jr draw_text_loop
	#endasm
}

void any_key (void) {
	#asm
			ld  hl, 0
			xor a
			in  a, (0xfe)
			and 0x1f
			cp  0x1f		// Issue 2/3 safe
			ret z
			ld  l, 1
	#endasm
}

void pad_read (void) {
	pad_this_frame = pad1;
	pad1 = pad0 = (joyfunc) (&keys); 

	// Keys held this frame
	pad_this_frame = (~pad_this_frame) | pad1;
}

void espera_activa (int espera) {
	// Waits until "espera" halts have passed 
	// or a key has been pressed.

	pti = any_key ();
	while (espera--)  {
		#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
			#asm
				halt
			#endasm
		#else
			rdd = 250; do { rdi = 1; } while (rdd --);
		#endif

		ptj = any_key ();
		if (ptj && pti == 0) {
			break;
		}
		pti = ptj;
	}
}

#ifdef ENABLE_PERSISTENCE
	void persist (void) {
		// Marks tile _x, _y @ n_pant to be cleared next time we enter this screen	
		// n_pant*20 + y*2 + x/8	
		gp_gen = (unsigned char *) (PERSIST_BASE + (n_pant << 4) + (n_pant << 2) + (_y << 1) + (_x >> 3));
		*gp_gen |= bitmask [_x & 7];	
	}

	void draw_persistent_row (void) {
		for (gpit = 0; gpit < 8; gpit ++) {
			if (rdi & (bitmask [gpit]))
				set_map_tile (rdx + gpit, rdy, PERSIST_CLEAR_TILE, comportamiento_tiles [PERSIST_CLEAR_TILE]);
		}
	}

	void draw_persistent (void) {
		gp_gen = (unsigned char *) (PERSIST_BASE + (n_pant << 4) + (n_pant << 2));
		for (rdy = 0; rdy < 10; rdy ++) {
			rdx = 0; rdi = *gp_gen ++; draw_persistent_row ();
			rdx = 8; rdi = *gp_gen ++; draw_persistent_row ();
		}
	}

	void clear_persistent (void) {
		#asm
				ld  hl, PERSIST_BASE
				ld  de, PERSIST_BASE+1
				ld  bc, MAP_W*MAP_H*20-1
				xor a
				ld  (hl), a
				ldir
		#endasm
	}
#endif

#ifdef DEBUG
	unsigned char drda, drdb;
	unsigned char hex_code (unsigned char n) {
		if (n < 10) return (n + 16);
		else return n + 23;
	}

	void print_hex (unsigned char x, unsigned char y, unsigned char h) {
		drda = hex_code (h >> 4); drdb = hex_code (h & 15);
		sp_PrintAtInv (y, x, 71, drda);
		sp_PrintAtInv (y, 1 + x, 71, drdb);
	}
#endif
