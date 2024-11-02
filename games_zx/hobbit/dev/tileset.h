// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

extern unsigned char tileset [0];
#asm
	._tileset
	#ifdef COMPRESSED_TS
		#if COMPRESSED_TS == 1
				defs 2304
			._tilesetc
				BINARY "tilesetc.bin"
		#elif COMPRESSED_TS == 2
				BINARY "tileset.bin"
			._tilesetc 
				BINARY "ts_attrsc.bin"
		#endif
	#else
			BINARY "tileset.bin"
	#endif
#endasm
