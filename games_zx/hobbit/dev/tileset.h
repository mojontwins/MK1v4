// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

extern unsigned char tileset [0];
#asm
	._tileset
	#ifdef COMPRESSED_TS
		defs 2304
	._tilesetc
		BINARY "tilesetc.bin"
	#else
		BINARY "tileset.bin"
	#endif
#endasm
