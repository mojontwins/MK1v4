// sword_custom_frames.h

// Defines swoffs_x and (if needed) swoffs_y with SWORD_CUSTOM_FRAMES values.
// Also, you must define the interval in which the hitter hits.

#define MIN_SWORD_HIT_FRAME		1		// Hits if frame >= N
#define MAX_SWORD_HIT_FRAME		3		// Hits if frame < N

// Hits:                      x  O   O   x   x
unsigned char swoffs_x [] = { 8, 16, 16, 12, 8 };

#ifndef SWORD_STAB
	unsigned char swoffs_x [] = { 0, 0, 0, 0, 0  };
#endif
