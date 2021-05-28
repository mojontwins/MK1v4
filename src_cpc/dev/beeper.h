// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// beeper.h
// Cointains Beeper sound effects

// Most effects have been taken off BeepFX's demo project.
// So I guess they should be credited to Shiru again ;)

/*
	TABLA DE SONIDOS

	n	Sonido
	----------
	1	Salto
	2	enemy hit
	3	killzone hit
	4	countdown
	5	coin
	6	object
	7	talk 1
	8	key in lock
	9	shoot
	10	explosion
	11	talk 2	
	12  ramiro hover (only AY)
*/

void __FASTCALL__ play_sfx (unsigned char n) {
	// TODO
}

void beepet (void) {
	/*
	for (gpit = 0; gpit < 4; gpit ++) {
		play_sfx (6);
		play_sfx (3);
	}
	*/
	#asm
		push ix
		push iy
		ld  a, 6
		call sound_play
		ld  a, 3
		call sound_play
		ld  a, 6
		call sound_play
		ld  a, 3
		call sound_play
		ld  a, 6
		call sound_play
		ld  a, 3
		call sound_play
		ld  a, 6
		call sound_play
		ld  a, 3
		call sound_play
		pop iy
		pop ix
	#endasm
}
