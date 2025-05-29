// MTE MK1 v4.11
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

extern unsigned char tileset [0];
extern unsigned char tspatterns [0];
#asm
		XDEF _ts
		XDEF tiles
	._tileset
	.tiles
	._font
		BINARY "font.bin" 	// 1024 bytes for 64 patterns
	._tspatterns
	#ifdef COMPRESSED_TS
			defs 3072
		._tilesetc
			BINARY "tilesetc.bin"
	#else
			BINARY "work.bin"   // 3072 bytes for 192 patterns
	#endif
	
#endasm

