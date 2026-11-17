// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

extern unsigned char *player_frames [0];
#ifdef PLAYER_MOGGY_STYLE
	// right: 0 + frame
	// left: 2 + frame
	// up: 4 + frame
	// down: 6 + frame
	#asm
		defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
		defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
	#endasm

#elif defined PLAYER_BOOTEE
	// vy = 0: 0 + facing
	// vy < 0: 1 + facing
	// vy > 0: 2 + facing
	#asm
		._player_frames
			defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
			defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
	#endasm

#elif defined PLAYER_ALTERNATE_ANIMATION
	// Alternate animation:
	// 0 1 2 + facing = walk, 0 = stand, 3 = jump/fall
	#asm
		._player_frames
			defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
			defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
	#endasm

#else
	// Side view, normal
	// 0 1 2 3 + facing: walk, 1 = stand. 8 + facing = jump/fall
	#asm
		._player_frames
			defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_01
			defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_05
			defw SPRITE_03, SPRITE_07
	#endasm

	};
#endif

// Sprite cell arrays for the malotes

extern unsigned char *enem_frames [0];
#asm
	._enem_frames
		defw SPRITE_08, SPRITE_09, SPRITE_0A, SPRITE_0B
		defw SPRITE_0C, SPRITE_0D, SPRITE_0E, SPRITE_0F
#endasm
