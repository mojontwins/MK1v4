
extern unsigned char s_title [];
extern unsigned char s_marco [];
extern unsigned char s_ending [];

#asm
	._s_title
		BINARY "titlec.bin"
	._s_marco

	#ifndef DIRECT_TO_PLAY
			BINARY "marcoc.bin"
	#endif
			
	._s_ending
		BINARY "endingc.bin"
#endasm

void title_screen (void) {
	blackout ();
	#asm
			ld  hl, _s_title
			call _unpack_screen
	#endasm
	
	select_controls ();
}

void game_ending (void) {
	#ifdef SPECCY 
		#asm 
			call SPUpdateNow
		#endasm
	#endif

	blackout ();
	#asm
			ld  hl, _s_ending
			call _unpack_screen
	#endasm

	#ifdef CPC
		cpc_ShowTileMap (1);
		AY_PLAY_MUSIC (0);
		espera_activa (500);
		AY_STOP_SOUND ();
	#else
		for (gpit = 0; gpit < 4; gpit ++) {
			peta_el_beeper (7);
			peta_el_beeper (2);
		}
		peta_el_beeper (9);
		
		espera_activa (500);
	#endif
}

void game_over (void) {
	#ifdef CPC 
		AY_STOP_SOUND ();
	#endif 

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
	draw_text (11, 12, 
		#ifndef CPC
			71, 
		#endif
		"GAME OVER!");
	
	#ifdef CPC
		cpc_UpdateNow (0);
		espera_activa (500);
	#else 
		#asm 
				call SPUpdateNow
		#endasm
		peta_el_beeper (10);
	#endif
}
