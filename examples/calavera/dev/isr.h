// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// ISR routine
// isr

#asm
	defw 0	// 2 bytes libres
#endasm

void ISR (void) {	
	#ifdef MIN_FAPS_PER_FRAME
		#asm
			ld  hl, _isrc
			inc (hl)
		#endasm
	#endif
}
