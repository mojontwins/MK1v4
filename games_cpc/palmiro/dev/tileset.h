// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

extern unsigned char tileset [0];
#asm
		XDEF _ts
		XDEF tiles
	._tileset
	.tiles
	._font
		BINARY "font.bin" 	// 1024 bytes for 64 patterns
	._tspatterns
		BINARY "work.bin"   // 3072 bytes for 192 patterns
#endasm

