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
		BINARY "title.bin"
	._s_marco
#endasm
#ifndef DIRECT_TO_PLAY
#asm
		BINARY "marco.bin"
#endasm
#endif
#asm
	._s_ending
		BINARY "ending.bin"
#endasm

void unpack (void) {
	#asm
			call blackout

			ld hl, (_asm_int)
			ld de, 16384
			jp depack

		.blackout
			ld hl, 22528
			ld de, 22529
			ld bc, 767
			xor a
			ld (hl), a
			ldir
			ret
		#endasm
}

void title_screen (void) {
	#asm 
		call SPUpdateNow
	#endasm
	asm_int = (unsigned int) (s_title); unpack ();

	// CUSTOM {
	draw_text (7, 4, 71, "RAMIRO, EL VAMPIRO");
	draw_text (10, 7, 7, "EN EL BOSQUE");
	draw_text (10, 8, 7, "DEL SUSPIRO!");
	
	/*
	draw_text (6, 4, 71, "RAMIRE, THE VAMPIRE");
	draw_text (12, 7, 7, "PUTS BACK");
	draw_text (11, 8, 7, "THE ZAPHIRE");
	*/
	
	draw_text (8, 19, 71, "MOJON TWINS 2022");
	draw_text (10, 20, 7, "CHURRERA 4.8");
	
	sp_UpdateNow ();
	// } END_OF_CUSTOM

	if (is128k) {
		wyz_play_music (0);
	} else {
		#asm
			; Music generated by beepola

			call musicstart

			#if !(defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME)
				di
			#endif
		#endasm
	}
	
	while (1) {
		rda = rand ();	// This makes RNG randomer
		if (sp_KeyPressed (key_1)) {
			joyfunc = sp_JoyKeyboard; break;
		} else if (sp_KeyPressed (key_2)) {
			joyfunc = sp_JoyKempston; break;
		} else if (sp_KeyPressed (key_3)) {
			joyfunc = sp_JoySinclair1; break;
		}			
	}

	after_title:

	if (is128k) wyz_stop_sound ();
}

void game_ending (void) {
	if (is128k) wyz_stop_sound ();

	#asm 
		call SPUpdateNow
	#endasm
	asm_int = (unsigned int) (s_ending); unpack ();
	beepet (); play_sfx (11);

	if (is128k) {
		wyz_play_music (3);
	} else {
		beepet (); play_sfx (11);
	}

	espera_activa (500);

	if (is128k) wyz_stop_sound ();
}

void game_over (void) {
	if (is128k) wyz_stop_sound ();

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
	#asm 
		call SPUpdateNow
	#endasm

	if (is128k) {
		wyz_play_music (3);
	} else {
		beepet (); play_sfx (10);
	}

	beepet (); play_sfx (10);
	espera_activa (500);

	if (is128k) wyz_stop_sound ();
}
