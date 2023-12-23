// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Arkos routines
// Check the manual!

void __FASTCALL__ arkos_play_music (unsigned char song_number) {
	#asm
		di
		ld b, ARKOS_RAM
		call SetRAMBank
		
		; Reactivate sound generation
		ld a, 1
		ld (_ay_player_on), a
		
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
		xor a
		ld (_ay_player_on), a
		
		ld b, 0
		call SetRAMBank
		ei
	#endasm
}

