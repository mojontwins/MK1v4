// Custom player cells array

extern unsigned char *player_cells [0];
#asm
	._player_cells 
		// Normal / lit
		defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03 
		defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07

		// unlit
		defw SPRITE_10, SPRITE_11, SPRITE_12, SPRITE_13 
		defw SPRITE_14, SPRITE_15, SPRITE_16, SPRITE_17
#endasm
		