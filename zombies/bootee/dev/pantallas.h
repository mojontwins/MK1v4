// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// Pantallas.h
// Carga las pantallas fijas
// Copyleft 2010 The Mojon Twins

#ifndef MODE_128K
	extern unsigned char s_title [];
	extern unsigned char s_marco [];
	extern unsigned char s_ending [];

	#asm
		._s_title
			BINARY "title.bin"
		._s_marco
		#ifndef DIRECT_TO_PLAY
			BINARY "marco.bin"
		#endif
		._s_ending
			BINARY "ending.bin"
	#endasm
#endif

void title (void) {
	// Here the title screen
	sp_UpdateNow();
	blackout ();

	#ifdef MODE_128K
		// Resource 0 = title.bin
		get_resource (0, 16384);
	#else		
		unpack_screen ((unsigned char *) (s_title));
	#endif

	#ifdef CPC
		cpc_UpdScr ();
		cpc_ShowTileMap (1);
	#endif

	#if defined MODE_128K || defined CPC
		wyz_play_music (0);
	#endif

	select_joyfunc ();

	#if defined MODE_128K || defined CPC
		wyz_stop_sound ();
	#endif
}

void game_ending (void) {
	sp_UpdateNow();
	blackout ();

	#ifdef MODE_128K
		// Resource 2 = ending
		get_resource (2, 16384);
	#else
		unpack_screen (s_ending);
	#endif

	#ifdef MODE_128K
	#else
		gpit = 4; do {
			PLAY_SFX (7);
			PLAY_SFX (2);
		} while (--gpit);
		PLAY_SFX (9);
	#endif
	
	espera_activa (500);
}

void recuadre (char *s) {
	print_str (10, 11, 79, spacer);
	print_str (10, 12, 79, s);
	print_str (10, 13, 79, spacer);
}

void game_over (void) {
	recuadre (" GAME OVER! ");
	sp_UpdateNow ();

	#if defined MODE_128K || defined CPC
		wyz_play_music (2);	
	#else
		gpit = 4; do {
			PLAY_SFX (7);
			PLAY_SFX (2);
		} while (--gpit);
		PLAY_SFX (9);
	#endif

	espera_activa (500);
}

#if defined(TIMER_ENABLE) && defined(SHOW_TIMER_OVER)
	void time_over (void) {
		recuadre (" TIME'S UP! ");
		sp_UpdateNow ();
			
		#ifdef MODE_128K
		#else
			gpit = 4; do {
				PLAY_SFX (1);
				PLAY_SFX (2);
			} while (--gpit);
			PLAY_SFX (0);
		#endif
			
		espera_activa (250);
	}
#endif

#ifdef PAUSE_ABORT
	void pause_screen (void) {
		recuadre ("   PAUSED   ");
		sp_UpdateNow ();
	}
#endif
