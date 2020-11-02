// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).

void draw_rectangle (unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char c) {	
	for (pti = y1; pti <= y2; pti ++)
		for (ptj = x1; ptj <= x2; ptj ++)
			sp_PrintAtInv (pti, ptj, c, 0);	
}

void attr (char x, char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  a, (hl) 	// x
			cp  15
			jr  c, _attr_1
			ld  hl, 0
			ret

		._attr_1
			ld  c, a
			dec hl
			dec hl
			ld  a, (hl) 	// y
			cp  10
			jr  c, _attr_2
			ld  hl, 0
			ret

		._attr_2
			ld  b, a
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
			gp_gen = (unsigned char *) &tileset [2048 + _t];
			sp_PrintAtInv (_y, _x, attr (prxx - 1, pryy - 1) == 8 ? (gp_gen[0] & 7)-1 : gp_gen [0], _t);
			sp_PrintAtInv (_y, _x + 1, attr (prxx, pryy - 1) == 8 ? (gp_gen[1] & 7)-1 : gp_gen [1], _t + 1);
			sp_PrintAtInv (_y + 1, _x, attr (prxx - 1, pryy) == 8 ? (gp_gen[2] & 7)-1 : gp_gen [2], _t + 2);
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen [3], _t + 3);
		} else
	#elif defined USE_AUTO_TILE_SHADOWS && !defined UNPACKED_MAP
		prxx = (_x - VIEWPORT_X) >> 1;
		pryy = (_y - VIEWPORT_Y) >> 1;	
		if (attr (prxx, pryy) < 4 && (_t < 16 || _t == 19)) {
			_t = 64 + (_t << 2);
			if (_t == 140) {
				gp_gen = (unsigned char *) &tileset [2188];
				t_alt = 192;
				gp_gen_alt = (unsigned char *) &tileset [2188];
			} else {
				gp_gen = (unsigned char *) &tileset [2048 + _t];
				t_alt = 128 + _t;
				gp_gen_alt = (unsigned char *) &tileset [2048 + _t + 128];
			}
			
			if (attr (prxx - 1, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x, gp_gen_alt [0], t_alt);
			} else {
				sp_PrintAtInv (_y, _x, gp_gen [0], _t);
			}
			if (attr (prxx, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x + 1, gp_gen_alt [1], t_alt + 1);
			} else {
				sp_PrintAtInv (_y, _x + 1, gp_gen [1], _t + 1);
			}
			if (attr (prxx - 1, pryy) >= 4) {
				sp_PrintAtInv (_y + 1, _x, gp_gen_alt [2], t_alt + 2);
			} else {
				sp_PrintAtInv (_y + 1, _x, gp_gen [2], _t + 2);
			} 
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen [3], _t + 3);
		} else
	#endif
	{
		/*
		_t = 64 + (_t << 2);
		gp_gen = (unsigned char *) &tileset [2048 + _t];
		sp_PrintAtInv (_y, _x, *gp_gen, _t); gp_gen ++; _t ++;
		sp_PrintAtInv (_y, _x + 1, *gp_gen, _t); gp_gen ++; _t ++;
		sp_PrintAtInv (_y + 1, _x, *gp_gen, _t); gp_gen ++; _t ++;
		sp_PrintAtInv (_y + 1, _x + 1, *gp_gen, _t);
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
	sp_PrintAtInv (y, x, 71, 16 + (value % 100) / 10);
	sp_PrintAtInv (y, 1 + x, 71, 16 + value % 10);
}

void draw_text (unsigned char x, unsigned char y, unsigned char c, char *s) {
	while (*s) {
		sp_PrintAtInv (y, x ++, c, (*s) - 32); s ++;
	}
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
