// custom_enem_cells.h
// Expanded enem cells array

	extern unsigned char *enem_cells [0];
	#asm
			._enem_cells
				defw SPRITE_08, SPRITE_09, SPRITE_0A, SPRITE_0B
				defw SPRITE_0C, SPRITE_0D, SPRITE_0E, SPRITE_0F
				defw SPRITE_10, SPRITE_11
	#endasm
