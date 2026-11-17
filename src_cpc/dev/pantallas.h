// MTE MK1 v4.11
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// pantallas.h
// Includes the binary of the aplib-compressed static screens.
// title.bin, marco.bin (if suited) and ending.bin should be
// in the same directory.

extern unsigned char s_title [];
extern unsigned char s_marco [];
extern unsigned char s_ending [];

#ifndef NO_COMPRESSED_TITLE_SCR
#asm
	._s_title
		BINARY "titlec.bin"
	._s_marco
#endasm
#endif
#ifndef DIRECT_TO_PLAY
	#asm
			BINARY "marcoc.bin"
	#endasm
#endif
#ifndef NO_COMPRESSED_ENDING_SCR
#asm
	._s_ending
		BINARY "endingc.bin"
#endasm
#endif

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
	//unpack ((unsigned int) (s_title), BASE_SUPERBUFF);
	#asm
			ld  hl, _s_title
			ld  de, BASE_SUPERBUFF
			call depack
	#endasm
	draw_text (11, 17, "1 KEYBOARD");
	draw_text (11, 18, "2 JOYSTICK");

	cpc_UpdScr ();
	cpc_ShowTileMap (1);

	AY_PLAY_MUSIC (0);

	#asm
		.title_loop
			call _pad_read 
			
			ld  a, (_pad_this_frame) 
			and sp_AUX3 
			jr  nz, title_not_aux3

			ld  hl, _def_keys
			jr  copy_keys_to_extern
			
		.title_not_aux3

			ld  a, (_pad_this_frame) 
			and sp_AUX4
			jr  nz, title_loop

			ld  hl, _def_keys_joy

	// Copy keys to extern 
	
		.copy_keys_to_extern
			ld  de, cpc_KeysData + 12
			ld  bc, 24
			ldir
	#endasm
	AY_STOP_SOUND ();
}

void game_ending (void) {
	blackout ();

	#asm
			ld  hl, _s_ending
			ld  de, BASE_SUPERBUFF
			call depack
	#endasm
	cpc_ShowTileMap (1);
	
	AY_PLAY_MUSIC (0);
	espera_activa (500);
	AY_STOP_SOUND ();
}

void game_over (void) {
	AY_STOP_SOUND ();
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
	#endasm
	draw_rectangle ();	
	draw_text (11, 12, "GAME OVER!");
	cpc_UpdateNow (0);
	espera_activa (500);
}
