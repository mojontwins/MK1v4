// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

extern unsigned char *wyz_songs [0];

#asm
	._00_title_mus_bin
		BINARY "../ogt/00_title.mus.bin"

	._01_ingame_mus_bin
		BINARY "../ogt/01_ingame.mus.bin"

	._02_time_attack_mus_bin
		BINARY "../ogt/02_time_attack.mus.bin"

	._03_ending_mus_bin
		BINARY "../ogt/03_ending.mus.bin"

	._04_game_over_mus_bin
		BINARY "../ogt/04_game_over.mus.bin"

	._wyz_songs
		defw 	_00_title_mus_bin, _01_ingame_mus_bin, _02_time_attack_mus_bin, _03_ending_mus_bin, _04_game_over_mus_bin
#endasm
