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
	// x + 15 * y = x + (16 - 1) * y = x + 16 * y - y = x + (y << 4) - y.
	#ifdef PLAYER_AUTO_CHANGE_SCREEN
		if (x < 0 || y < 0 || x > 14 || y > 9) return 0;
	#else
		if (x < 0 || y < 0) return 8;
	#endif
	return map_attr [x + (y << 4) - y];	
}

void qtile (unsigned char x, unsigned char y) {
	// x + 15 * y = x + (16 - 1) * y = x + 16 * y - y = x + (y << 4) - y.
	return map_buff [x + (y << 4) - y];	
}

#ifdef UNPACKED_MAP
	// Draw unpacked tile

	void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
		t = 64 + (t << 2);
		gp_gen = (unsigned char *) &tileset [2048 + t];
		sp_PrintAtInv (y, x, *gp_gen, t); ++ gp_gen; ++ t;
		sp_PrintAtInv (y, x + 1, *gp_gen, t); ++ gp_gen; ++ t;
		sp_PrintAtInv (y + 1, x, *gp_gen, t); ++ gp_gen; ++ t;
		sp_PrintAtInv (y + 1, x + 1, *gp_gen, t);
	}

#else
	// Draw packed tile (with special effects)

	void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
		#ifdef USE_AUTO_TILE_SHADOWS
			unsigned char *gp_gen_alt;
			unsigned char t_alt;
		#endif
		
		#ifdef USE_AUTO_SHADOWS
			prxx = (x - VIEWPORT_X) >> 1;
			pryy = (y - VIEWPORT_Y) >> 1;	
			if (attr (prxx, pryy) < 8 && (t < 16 || t == 19)) {
				t = 64 + (t << 2);
				gp_gen = (unsigned char *) &tileset [2048 + t];
				sp_PrintAtInv (y, x, attr (prxx - 1, pryy - 1) == 8 ? (gp_gen[0] & 7)-1 : gp_gen [0], t);
				sp_PrintAtInv (y, x + 1, attr (prxx, pryy - 1) == 8 ? (gp_gen[1] & 7)-1 : gp_gen [1], t + 1);
				sp_PrintAtInv (y + 1, x, attr (prxx - 1, pryy) == 8 ? (gp_gen[2] & 7)-1 : gp_gen [2], t + 2);
				sp_PrintAtInv (y + 1, x + 1, gp_gen [3], t + 3);
			} else
		#endif

		#ifdef USE_AUTO_TILE_SHADOWS
			prxx = (x - VIEWPORT_X) >> 1;
			pryy = (y - VIEWPORT_Y) >> 1;	
			if (attr (prxx, pryy) < 4 && (t < 16 || t == 19)) {
				t = 64 + (t << 2);
				if (t == 140) {
					gp_gen = (unsigned char *) &tileset [2188];
					t_alt = 192;
					gp_gen_alt = (unsigned char *) &tileset [2188];
				} else {
					gp_gen = (unsigned char *) &tileset [2048 + t];
					t_alt = 128 + t;
					gp_gen_alt = (unsigned char *) &tileset [2048 + t + 128];
				}
				
				if (attr (prxx - 1, pryy - 1) >= 4) {
					sp_PrintAtInv (y, x, gp_gen_alt [0], t_alt);
				} else {
					sp_PrintAtInv (y, x, gp_gen [0], t);
				}
				if (attr (prxx, pryy - 1) >= 4) {
					sp_PrintAtInv (y, x + 1, gp_gen_alt [1], t_alt + 1);
				} else {
					sp_PrintAtInv (y, x + 1, gp_gen [1], t + 1);
				}
				if (attr (prxx - 1, pryy) >= 4) {
					sp_PrintAtInv (y + 1, x, gp_gen_alt [2], t_alt + 2);
				} else {
					sp_PrintAtInv (y + 1, x, gp_gen [2], t + 2);
				} 
				sp_PrintAtInv (y + 1, x + 1, gp_gen [3], t + 3);
			} else
		#endif
		{
			t = 64 + (t << 2);
			gp_gen = (unsigned char *) &tileset [2048 + t];
			sp_PrintAtInv (y, x, *gp_gen, t); ++ gp_gen; ++ t;
			sp_PrintAtInv (y, x + 1, *gp_gen, t); ++ gp_gen; ++ t;
			sp_PrintAtInv (y + 1, x, *gp_gen, t); ++ gp_gen; ++ t;
			sp_PrintAtInv (y + 1, x + 1, *gp_gen, t);
		}		
	}
#endif

void draw_2_digits (unsigned char x, unsigned char y, unsigned char value) {
	sp_PrintAtInv (y, x, 71, 16 + (value % 100) / 10);
	sp_PrintAtInv (y, 1 + x, 71, 16 + value % 10);
}

void draw_text (unsigned char x, unsigned char y, unsigned char c, char *s) {
	unsigned char m;
	while (*s) {
		m = (*s) - 32;
		sp_PrintAtInv (y, x ++, c, m);
		s ++;
	}
}
