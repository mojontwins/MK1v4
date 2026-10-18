// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

// Custom flick.
// This file is used if you #define ENABLE_CUSTOM_FLICK
// Do your thing, return 0 to prevent screen flick.

unsigned char flick_left (void) {
	return 1;
}

unsigned char flick_right (void) {
	return 1;
}

unsigned char flick_up (void) {
	return 0;
}

unsigned char flick_down (void) {
	return 0;
}
