// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// WYZ routines
// Check the manual!

void __FASTCALL__ wyz_play_music (unsigned char song_number) {
	#asm
		di
		ld b, WYZ_RAM
		call SetRAMBank
		
		ld  a, l
		call WYZ_ADDRESS_MT_LOAD_SONG		
		
		ld b, 0
		call SetRAMBank
		ei
	#endasm
}

void wyz_stop_sound (void)
{
	#asm
		di
		ld b, WYZ_RAM
		call SetRAMBank
		
		call WYZ_ADDRESS_PLAYER_OFF
		
		ld b, 0
		call SetRAMBank
		ei
	#endasm
}
