// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).
unsigned char px, py, pxx, pyy, pt, pt_alt;
unsigned char *pptr, *pptr_alt; 

void system_init (void) {
	// Kempston detection
	#asm
		halt
		in	a, (31)
		inc a
		ld	(_kempston_is_attached), a
		di
	#endasm
	
	// splib2 initialization
	sp_Initialize (7, 0);
	sp_Border (BLACK);
	sp_AddMemory(0, NUMBLOCKS, 14, AD_FREE);
	
	// Define keys and default controls
	keys.up    = sp_LookupKey('q');
	keys.down  = sp_LookupKey('a');
	keys.left  = sp_LookupKey('o');
	keys.right = sp_LookupKey('p');
	keys.fire  = sp_LookupKey(' ');

	key_m = sp_LookupKey ('m');
		
	joyfunc = sp_JoyKeyboard;

	// Load tileset
	allpurposepuntero = tileset;
	for (gpint = 0; gpint < 256; gpint++) {
		sp_TileArray (gpint, allpurposepuntero);
		allpurposepuntero += 8;
	}

	// Clipping rectangle
	spritesClipValues.row_coord = VIEWPORT_Y;
	spritesClipValues.col_coord = VIEWPORT_X;
	spritesClipValues.height = 20;
	spritesClipValues.width = 30;
	spritesClip = &spritesClipValues;
	
	// Sprite creation
	#ifdef NO_MASKS
		sp_player = sp_CreateSpr (sp_OR_SPRITE, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_c);
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (gpit = 0; gpit < 3; gpit ++) {
			sp_moviles [gpit] = sp_CreateSpr(sp_OR_SPRITE, 3, sprite_9_a, 1);
			sp_AddColSpr (sp_moviles [gpit], sprite_9_b);
			sp_AddColSpr (sp_moviles [gpit], sprite_9_c);	
			en_an_current_frame [gpit] = sprite_9_a;
		}
	#else
		sp_player = sp_CreateSpr (sp_MASK_SPRITE, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_c);
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (gpit = 0; gpit < 3; gpit ++) {
			sp_moviles [gpit] = sp_CreateSpr(sp_MASK_SPRITE, 3, sprite_9_a, 2);
			sp_AddColSpr (sp_moviles [gpit], sprite_9_b);
			sp_AddColSpr (sp_moviles [gpit], sprite_9_c);	
			en_an_current_frame [gpit] = sprite_9_a;
		}
	#endif

	#ifdef PLAYER_CAN_FIRE
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
			sp_bullets [gpit] = sp_CreateSpr (sp_OR_SPRITE, 2, sprite_19_a, 1);
			sp_AddColSpr (sp_bullets [gpit], sprite_19_b);
		}
	#endif	
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

void pad_read (void) {
	pad_this_frame = pad1;
	pad1 = pad0 = (joyfunc) (&keys); 

	// Keys held this frame
	pad_this_frame = (~pad_this_frame) | pad1;
}

// This function is called from the menu and
// sets up the controlling scheme depending on
// which key is pressed:

// 1 KEYS
// 2 KEMPSTON
// 3 SINCLAIR

void select_joyfunc (void) {
	#asm
		; Music generated by beepola
		call musicstart
	#endasm
	
	while (1) {
		
		if (sp_KeyPressed (0x01f7)) {
			joyfunc = sp_JoyKeyboard; break;
		} else if (sp_KeyPressed (0x02f7)) {
			joyfunc = sp_JoyKempston; break;
		} else if (sp_KeyPressed (0x04f7)) {
			joyfunc = sp_JoySinclair1; break;
		}			
	}
	#asm
		di
	#endasm
}

void blackout (void) {
	#asm
			ld hl, 22528
			ld (hl), 0
			push hl
			pop de
			inc de
			ld bc, 767
			ldir
	#endasm
}

void __FASTCALL__ unpack (unsigned int address) {
	#asm
			push hl
			call _blackout
			pop hl
			ld de, 16384
			call depack
	#endasm
}

void draw_text (unsigned char x, unsigned char y, unsigned char c, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 8
			add hl, sp
			
			ld  a, (hl)
			ld  (_px), a
			ld  (_pt), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (_py), a
			dec hl
			dec hl
			
			ld  a, (hl)
			ld  (_pt_alt), a
			dec hl

			ld  a, (hl)
			dec hl 
			ld  l, (hl)
			ld  h, a

		.draw_text_loop
			ld  a, (_px)
			ld  c, a
			inc a
			ld  (_px), a

			ld  a, (_pt_alt)
			ld  d, a
			
			ld  a, (hl)
			or  a
			ret z
			
			inc hl

			cp  0x25
			jr  z, draw_text_nl

			sub 32
			ld  e, a
			
			ld  a, (_py)
			
			push hl
			LIB SPPrintAtInv
			call SPPrintAtInv
			pop hl
			
			jr  draw_text_loop

		.draw_text_nl
			ld  a, (_pt)
			ld  (_px), a
			ld  a, (_py)
			inc a
			ld  (_py), a
			jr draw_text_loop
	#endasm
}
