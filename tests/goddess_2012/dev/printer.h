// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).
unsigned char px, py, pxx, pyy, pt, pt_alt;
unsigned char *pptr, *pptr_alt; 

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
		px = x; py = y; pt = t;
		unsigned char *pointer;
		unsigned char ppxpx, ppypy;
		t = 64 + (t << 2);
		pointer = tileset + 2048 + pt; // (unsigned char *) &tileset [2048 + t];
		sp_PrintAtInv (py, px, pointer [0], t);
		sp_PrintAtInv (py, px + 1, pointer [1], t + 1);
		sp_PrintAtInv (py + 1, px, pointer [2], t + 2);
		sp_PrintAtInv (py + 1, px + 1, pointer [3], t + 3);	
	}

#else
	// Draw packed tile (with special effects)

	void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
		px = x; py = y; pt = t;
		
		#ifdef USE_AUTO_SHADOWS
			pxx = (px - VIEWPORT_X) >> 1;
			pyy = (py - VIEWPORT_Y) >> 1;	
			if (attr (pxx, pyy) < 8 && (pt < 16 || pt == 19)) {
				pt = 64 + (pt << 2);
				pptr = (unsigned char *) &tileset [2048 + pt];
				sp_PrintAtInv (py, px, attr (pxx - 1, pyy - 1) == 8 ? (pptr[0] & 7)-1 : pptr [0], pt);
				sp_PrintAtInv (py, px + 1, attr (pxx, pyy - 1) == 8 ? (pptr[1] & 7)-1 : pptr [1], pt + 1);
				sp_PrintAtInv (py + 1, px, attr (pxx - 1, pyy) == 8 ? (pptr[2] & 7)-1 : pptr [2], pt + 2);
				sp_PrintAtInv (py + 1, px + 1, pptr [3], pt + 3);
			} else {
		#endif

		#ifdef USE_AUTO_TILE_SHADOWS
			pxx = (px - VIEWPORT_X) >> 1;
			pyy = (py - VIEWPORT_Y) >> 1;	
			if (attr (pxx, pyy) < 4 && (pt < 16 || pt == 19)) {
				pt = 64 + (pt << 2);
				if (pt == 140) {
					pptr = tileset + 2188; //(unsigned char *) &tileset [2188];
					pt_alt = 192;
					pptr_alt = tileset + 2188 //(unsigned char *) &tileset [2188];
				} else {
					pptr = tileset + 2048 + pt; //(unsigned char *) &tileset [2048 + pt];
					pt_alt = 128 + pt;
					pptr_alt = tileset + 2048 + pt + 128; //(unsigned char *) &tileset [2048 + pt + 128];
				}
				
				if (attr (pxx - 1, pyy - 1) >= 4) {
					sp_PrintAtInv (py, px, pptr_alt [0], pt_alt);
				} else {
					sp_PrintAtInv (py, px, pptr [0], pt);
				}
				if (attr (pxx, pyy - 1) >= 4) {
					sp_PrintAtInv (py, px + 1, pptr_alt [1], pt_alt + 1);
				} else {
					sp_PrintAtInv (py, px + 1, pptr [1], pt + 1);
				}
				if (attr (pxx - 1, pyy) >= 4) {
					sp_PrintAtInv (py + 1, px, pptr_alt [2], pt_alt + 2);
				} else {
					sp_PrintAtInv (py + 1, px, pptr [2], pt + 2);
				} 
				sp_PrintAtInv (py + 1, px + 1, pptr [3], pt + 3);
			} else
		#endif
		{
			pt = 64 + (pt << 2);
			pptr = tileset + 2048 + pt; //(unsigned char *) &tileset [2048 + pt];
			sp_PrintAtInv (py, px, pptr [0], pt);
			sp_PrintAtInv (py, px + 1, pptr [1], pt + 1);
			sp_PrintAtInv (py + 1, px, pptr [2], pt + 2);
			sp_PrintAtInv (py + 1, px + 1, pptr [3], pt + 3);
		}
	}
#endif

#ifdef PLAYER_SHOW_ITEM
	void draw_item () {
		draw_coloured_tile (ITEM_SHOW_X, ITEM_SHOW_Y, ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1);
	}
#endif

void draw_life () {
	#ifdef DRAW_HI_DIGIT
		sp_PrintAtInv (LIFE_H_Y, LIFE_H_X, 71, 16 + player.life / 100);
	#endif
	sp_PrintAtInv (LIFE_Y, LIFE_X, 71, 16 + (player.life % 100) / 10);
	sp_PrintAtInv (LIFE_Y, 1 + LIFE_X, 71, 16 + player.life % 10);
}

#ifndef DEACTIVATE_OBJECTS
	void draw_objs () {
		#ifdef ONLY_ONE_OBJECT
			if (player.objs) {
				sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X, 135, 132);
				sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X + 1, 135, 133);
				sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X, 135, 134);
				sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X + 1, 135, 135);
			} else {
				draw_coloured_tile (OBJECTS_ICON_X, OBJECTS_ICON_Y, 17);
			}
			sp_PrintAtInv (OBJECTS_Y, OBJECTS_X, 71, 16 + flags [OBJECT_COUNT] / 10);
			sp_PrintAtInv (OBJECTS_Y, 1 + OBJECTS_X, 71, 16 + flags [OBJECT_COUNT] % 10);
		#else
			sp_PrintAtInv (OBJECTS_Y, OBJECTS_X, 71, 16 + player.objs / 10);
			sp_PrintAtInv (OBJECTS_Y, 1 + OBJECTS_X, 71, 16 + player.objs % 10);
		#endif
	}
#endif

#ifndef DEACTIVATE_KEYS
	void draw_keys () {
		sp_PrintAtInv (KEYS_Y, KEYS_X, 71, 16 + player.keys / 10);
		sp_PrintAtInv (KEYS_Y, 1 + KEYS_X, 71, 16 + player.keys % 10);
	}
#endif

#if defined (PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)
	void draw_killed () {
		sp_PrintAtInv (KILLED_Y, KILLED_X, 71, 16 + player.killed / 10);
		sp_PrintAtInv (KILLED_Y, 1 + KILLED_X, 71, 16 + player.killed % 10);
	}
#endif
