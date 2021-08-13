// Custom player cells array

// In this case, the spriteset is:
// 1  2  3  4  5  6  7  8  9  10
// R1 R2 R3 RJ RH L1 L2 L3 LJ LH

extern unsigned char *player_cells [0];
#asm
	._player_cells 
		defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03, SPRITE_16
		defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07, SPRITE_17
#endasm
		