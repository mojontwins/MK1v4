// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// Sprite cell arrays for the player

#ifdef PLAYER_MOGGY_STYLE
	// right: 0 + frame
	// left: 2 + frame
	// up: 4 + frame
	// down: 6 + frame
	unsigned char *player_frames [] = {
		sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
		sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a
	};

#elif defined PLAYER_BOOTEE
	// vy = 0: 0 + facing
	// vy < 0: 1 + facing
	// vy > 0: 2 + facing
	unsigned char *player_frames [] = {
		sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
		sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a
	};

#elif defined PLAYER_ALTERNATE_ANIMATION
	// Alternate animation:
	// 0 1 2 + facing = walk, 0 = stand, 3 = jump/fall
	unsigned char *player_frames [] = {
		sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
		sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a
	};

#else
	// Side view, normal
	// 0 1 2 3 + facing: walk, 1 = stand. 8 + facing = jump/fall
	unsigned char *player_frames [] = {
		sprite_1_a, sprite_2_a, sprite_3_a, sprite_2_a,
		sprite_5_a, sprite_6_a, sprite_7_a, sprite_6_a,
		sprite_4_a, sprite_8_a 
	};
#endif

// Sprite cell arrays for the malotes

unsigned char *enem_frames [] = {
	sprite_9_a, sprite_10_a, sprite_11_a, sprite_12_a, 
	sprite_13_a, sprite_14_a, sprite_15_a, sprite_16_a
};
