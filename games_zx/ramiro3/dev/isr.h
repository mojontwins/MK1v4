// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

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
			#if defined MODE_128K_DUAL 
				#if defined ENABLE_ARKOS
						ld  a, (_ay_player_on)
						or  a
						jr  z, skip_arkos
						
						ld  b, ARKOS_RAM
						call SetRAMBank
						call ARKOS_ADDRESS_ATPLAY
						ld  b, 0
						call SetRAMBank

					.skip_arkos
				#endif

				#if defined ENABLE_WYZ
						ld  a, (_ay_player_on)
						or  a
						jr  z, skip_wyz

						ld  b, WYZ_RAM
						call SetRAMBank
						call WYZ_ADDRESS_PLAYERISR
						ld  b, 0
						call SetRAMBank

					.skip_wyz
				#endif
			#endif
		#endasm
	#endif
}
