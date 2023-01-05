// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Substitute with beepola stuff or whatever you like.

#asm
	.musicstart
		ld  hl, music_compressed
		ld  de, $f200
		call dzx0_standard
		jp $f200

	.music_compressed
		BINARY "buzzc.bin"
#endasm
