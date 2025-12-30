// custom_sprite_cells.h

#ifdef CPC
	extern unsigned char *sprite_cells [0];
	#asm
		._sprite_cells 
			// Player platformer
			defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
			defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
			// Player swimming
			defw SPRITE_08, SPRITE_09, SPRITE_0A, SPRITE_0B
			defw SPRITE_0C, SPRITE_0D, SPRITE_0E, SPRITE_0F
			// Baddies
			defw SPRITE_10, SPRITE_11, SPRITE_12, SPRITE_13
			defw SPRITE_14, SPRITE_15, SPRITE_16, SPRITE_17
			defw SPRITE_18, SPRITE_19, SPRITE_1A, SPRITE_1B
			defw SPRITE_1C, SPRITE_1D, SPRITE_1E, SPRITE_1F
	#endasm
#else
	unsigned char *sprite_cells [] = {
		// Player platformer
		sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
		sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a,
		// Player swimming
		sprite_9_a, sprite_10_a, sprite_11_a, sprite_12_a,
		sprite_13_a, sprite_14_a, sprite_15_a, sprite_16_a,
		// Baddies
		sprite_17_a, sprite_18_a, sprite_19_a, sprite_20_a,
		sprite_21_a, sprite_22_a, sprite_23_a, sprite_24_a,
		sprite_25_a, sprite_26_a, sprite_27_a, sprite_28_a,
		sprite_29_a, sprite_30_a, sprite_31_a, sprite_32_a
	};
#endif