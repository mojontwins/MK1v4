// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// Arkos routines
// Check the manual!

void arkos_stop (void) {
	#asm
		ld b, ARKOS_RAM
		call SetRAMBank
		ld a, 201
		ld (ARKOS_ADDRESS_ATPLAY),A
		ld b, 0
		call SetRAMBank
	#endasm
}

void __FASTCALL__ arkos_play_sound (unsigned char fx_number) {
	#asm
		di
		ld b, ARKOS_RAM
		call SetRAMBank
		
		; __FASTCALL__ -> fx_number is in l!
		ld a, ARKOS_SFX_CHANNEL
		ld h, 15
		ld e, 50
		ld d, 0
		ld bc, 0
		call ARKOS_ADDRESS_ATSFXPLAY
		
		ld b,0
		call SetRAMBank
		ei
	#endasm
}

void __FASTCALL__ arkos_play_music (unsigned char song_number) {
	#asm
		di
		ld b, ARKOS_RAM
		call SetRAMBank
		
		; Reactivate sound generation
		ld a, 175
		ld (ARKOS_ADDRESS_ATPLAY),A
		
		ld  a, l
		call ARKOS_ADDRESS_MT_LOAD_SONG		
		
		ld b, 0
		call SetRAMBank
		ei
	#endasm
}

void arkos_stop_sound (void)
{
	#asm
		di
		ld b, ARKOS_RAM
		call SetRAMBank
		
		call ARKOS_ADDRESS_ATSFXSTOPALL
		call ARKOS_ADDRESS_ATSTOP
		
		; Turn off sound generation
		ld a,201
		ld (ARKOS_ADDRESS_ATPLAY),A
		
		ld b,0
		call SetRAMBank
		ei
	#endasm
}

