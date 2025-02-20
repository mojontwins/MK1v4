// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

extern unsigned char *wyz_songs [0];

#asm
	._00_title_mus_bin
		BINARY "../ogt/00_title.mus.bin"

	._01_nomo_mus_bin
		BINARY "../ogt/01_nomo.mus.bin"

	._02_ayjo_mus_bin
		BINARY "../ogt/02_ayjo.mus.bin"

	._03_cave_mus_bin
		BINARY "../ogt/03_cave.mus.bin"		

	._04_invisible_mus_bin
		BINARY "../ogt/04_invisible.mus.bin"

	._05_coca_mus_bin
		BINARY "../ogt/05_coca.mus.bin"

	._06_pokemos_mus_bin
		BINARY "../ogt/06_pokemos.mus.bin"

	._07_gameover_mus_bin
		BINARY "../ogt/07_gameover.mus.bin"

	._08_silence_mus_bin
		BINARY "../ogt/08_silence.mus.bin"

	._09_ending_mus_bin
		BINARY "../ogt/09_ending.mus.bin"

	._wyz_songs
		defw 	_00_title_mus_bin, _01_nomo_mus_bin, _02_ayjo_mus_bin, _03_cave_mus_bin
		defw	_04_invisible_mus_bin, _05_coca_mus_bin, _06_pokemos_mus_bin, _07_gameover_mus_bin
		defw	_08_silence_mus_bin, _09_ending_mus_bin
#endasm
