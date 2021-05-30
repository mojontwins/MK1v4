// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// pantallas.h
// Includes the binary of the aplib-compressed static screens.
// title.bin, marco.bin (if suited) and ending.bin should be
// in the same directory.

extern unsigned char s_title [];
extern unsigned char s_marco [];
extern unsigned char s_ending [];

#asm
	._s_title
		BINARY "../bin/titlec.bin"
	._s_marco
#endasm
#ifndef DIRECT_TO_PLAY
	#asm
			BINARY "../bin/marcoc.bin"
	#endasm
#endif
#asm
	._s_ending
		BINARY "../bin/endingc.bin"
#endasm

void blackout (void) {
	rda = BLACK_COLOUR_BYTE;
	#asm
			ld  a, 0xc0
		.bo_l1
			ld  h, a
			ld  l, 0
			ld  b, a
			ld  a, (_rda)
			ld  (hl), a
			ld  a, b
			ld  d, a
			ld  e, 1
			ld  bc, 0x5ff
			ldir

			add 8
			jr  nz, bo_l1
	#endasm
}

void title_screen (void) {
	blackout ();
	unpack ((unsigned int) (s_title), BASE_SUPERBUFF);
	cpc_ShowTileMap (1);

	AY_PLAY_MUSIC (0);
	while (1) {
		if (cpc_TestKey (KEY_AUX3)) { _gp_gen = def_keys; break; }
		if (cpc_TestKey (KEY_AUX4)) { _gp_gen = def_keys_joy; break; }
	}	
	AY_STOP_SOUND ();

	// Copy keys to extern 
	#asm
		._copy_keys_to_extern
			ld  hl, (__gp_gen)
			ld  de, cpc_KeysData + 12
			ld  bc, 24
			ldir
	#endasm
}

void game_ending (void) {
	blackout ();
	unpack ((unsigned int) (s_ending), BASE_SUPERBUFF);
	cpc_ShowTileMap (1);
	
	AY_PLAY_MUSIC (0)
	espera_activa (500);
	AY_STOP_SOUND ();
}

void game_over (void) {
	//10, 11, 21, 13, GAME_OVER_ATTR
	#asm
			ld  a, 10
			ld  (__x), a
			ld  a, 11
			ld  (__y), a
			ld  a, 21
			ld  (__x2), a
			ld  a, 13
			ld  (__y2), a
			ld  a, GAME_OVER_ATTR
			ld  (__t), a
	#endasm
	draw_rectangle ();	
	draw_text (11, 12, GAME_OVER_ATTR, "GAME OVER!");
	cpc_UpdateNow (0);
	espera_activa (500);
}