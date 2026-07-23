;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Jul 23 13:00:29 2026



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	8

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	0

;	SECTION	code


	.inks0
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x44
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x5D
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x43
	out (c), a
	ret
	.inks1
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x5C
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x40
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4E
	out (c), a
	ret
	.inks2
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x44
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x56
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x5E
	out (c), a
	ret
	.inks3
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x58
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x45
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x43
	out (c), a
	ret
	XDEF _ts
	XDEF tiles
	._tileset
	.tiles
	._font
	BINARY "font.bin"
	._tspatterns
	BINARY "work.bin"
	._sprites
	BINARY "sprites.bin"
	._spr_boom
	BINARY "sprites_extra.bin"
	._spr_empty
	defs 96, 0
;	SECTION	text

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pad1
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pad_this_frame
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._bitmask
	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	4

	defm	""
	defb	8

	defm	""
	defb	16

	defm	" @"
	defb	128

;	SECTION	code


	XREF _nametable
	XREF tabla_teclas
	LIB cpc_KeysData
	LIB cpc_UpdTileTable
	LIB cpc_InvalidateRect
	LIB cpc_TestKeyboard
	XDEF viewport_x
	XDEF viewport_y
	defc viewport_x = 1
	defc viewport_y = 4
;	SECTION	text

._sm_cox
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._sm_coy
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._sm_invfunc
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1

;	SECTION	code

;	SECTION	text

._sm_updfunc
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT

;	SECTION	code

	._sm_sprptr
	defw _sprites + 0x0000, _sprites + 0x0040, _sprites + 0x0080, _sprites + 0x00C0
	defw _sprites + 0x0100, _sprites + 0x0140, _sprites + 0x0180, _sprites + 0x01C0
	defw _sprites + 0x0200, _sprites + 0x0240, _sprites + 0x0280, _sprites + 0x02C0
	defw _sprites + 0x0300, _sprites + 0x0340, _sprites + 0x0380, _sprites + 0x03C0
	defw _sprites + 0x0400, _sprites + 0x0440, _sprites + 0x0480, _sprites + 0x04C0
	defw _sprites + 0x0500, _sprites + 0x0540, _sprites + 0x0580, _sprites + 0x05C0
	defw _sprites + 0x0600, _sprites + 0x0640, _sprites + 0x0680, _sprites + 0x06C0
	defw _sprites + 0x0700, _sprites + 0x0740, _sprites + 0x0780, _sprites + 0x07C0
	.EFECTO0
	.EFECTO5
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0x56, 0x0F, 0x00
	defb 0xF6, 0x0F, 0x00
	defb 0x14, 0x0E, 0x00
	defb 0x64, 0x0E, 0x00
	defb 0x62, 0x0D, 0x00
	defb 0xD0, 0x0D, 0x00
	defb 0xF1, 0x0C, 0x00
	defb 0xFF
	.EFECTO1
	.EFECTO4
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO2
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0x56, 0x0F, 0x00
	defb 0xF6, 0x0F, 0x00
	defb 0x14, 0x0E, 0x00
	defb 0x64, 0x0E, 0x00
	defb 0x62, 0x0D, 0x00
	defb 0xD0, 0x0D, 0x00
	defb 0xF1, 0x0C, 0x00
	defb 0xFF
	.EFECTO3
	defb 0xE8, 0x1B, 0x00
	defb 0xB4, 0x0F, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0x90, 0x0D, 0x00
	defb 0x87, 0x0D, 0x00
	defb 0x78, 0x0C, 0x00
	defb 0x6C, 0x0B, 0x00
	defb 0x60, 0x0A, 0x00
	defb 0x5A, 0x09, 0x00
	defb 0xFF
	.EFECTO6
	defb 0x03, 0x2f, 0x1F
	defb 0xea, 0x1f, 0x1f
	defb 0xdd, 0x1c, 0x1F
	defb 0xd0, 0x1c, 0x1F
	defb 0xc4, 0x19, 0x1f
	defb 0xb7, 0x19, 0x1f
	defb 0xb7, 0x18, 0x1f
	defb 0xb7, 0x18, 0x1f
	defb 0xb7, 0x15, 0x1f
	defb 0xb7, 0x15, 0x1f
	defb 0xFF
	.EFECTO7
	defb 0x1F, 0x0B, 0x00
	defb 0x5A, 0x0F, 0x00
	defb 0x3C, 0x0F, 0x00
	defb 0x1E, 0x0A, 0x00
	defb 0x2D, 0x0A, 0x00
	defb 0x5A, 0x05, 0x00
	defb 0x3C, 0x05, 0x00
	defb 0x1E, 0x04, 0x00
	defb 0x2D, 0x02, 0x00
	defb 0xB4, 0x01, 0x00
	defb 0xFF
	.EFECTO8
	defb 0x1F, 0x0B, 0x00
	defb 0x5A, 0x0F, 0x00
	defb 0x3C, 0x0F, 0x00
	defb 0x1E, 0x0A, 0x00
	defb 0x2D, 0x0A, 0x00
	defb 0x5A, 0x05, 0x00
	defb 0x3C, 0x05, 0x00
	defb 0x1E, 0x04, 0x00
	defb 0x2D, 0x02, 0x00
	defb 0xB4, 0x01, 0x00
	defb 0xFF
	.EFECTO9
	defb 0x25, 0x1C, 0x00
	defb 0x3A, 0x0F, 0x00
	defb 0x2D, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0xBC, 0x0F, 0x00
	defb 0x96, 0x0D, 0x00
	defb 0x4B, 0x0D, 0x00
	defb 0x32, 0x0D, 0x00
	defb 0x3A, 0x0D, 0x00
	defb 0x2D, 0x0D, 0x00
	defb 0xE2, 0x0D, 0x00
	defb 0xBC, 0x0D, 0x00
	defb 0x96, 0x0D, 0x00
	defb 0x4B, 0x0D, 0x00
	defb 0x32, 0x0D, 0x00
	defb 0x3A, 0x0D, 0x00
	defb 0x2D, 0x0C, 0x00
	defb 0xE2, 0x0C, 0x00
	defb 0xBC, 0x0C, 0x00
	defb 0x96, 0x0B, 0x00
	defb 0x4B, 0x0B, 0x00
	defb 0x32, 0x0B, 0x00
	defb 0x3A, 0x0B, 0x00
	defb 0x2D, 0x0B, 0x00
	defb 0xE2, 0x0B, 0x00
	defb 0xBC, 0x0B, 0x00
	defb 0x96, 0x0B, 0x00
	defb 0x4B, 0x0A, 0x00
	defb 0x32, 0x0A, 0x00
	defb 0x3A, 0x0A, 0x00
	defb 0x2D, 0x09, 0x00
	defb 0xE2, 0x09, 0x00
	defb 0xBC, 0x08, 0x00
	defb 0x96, 0x08, 0x00
	defb 0x4B, 0x08, 0x00
	defb 0x32, 0x07, 0x00
	defb 0x3A, 0x07, 0x00
	defb 0x2D, 0x06, 0x00
	defb 0xE2, 0x06, 0x00
	defb 0xBC, 0x06, 0x00
	defb 0x96, 0x05, 0x00
	defb 0x4B, 0x05, 0x00
	defb 0x32, 0x05, 0x00
	defb 0x3A, 0x04, 0x00
	defb 0x2D, 0x04, 0x00
	defb 0xE2, 0x03, 0x00
	defb 0xBC, 0x03, 0x00
	defb 0x96, 0x03, 0x00
	defb 0x4B, 0x03, 0x00
	defb 0x32, 0x02, 0x00
	defb 0x3A, 0x01, 0x00
	defb 0x2D, 0x01, 0x00
	defb 0xE2, 0x01, 0x00
	defb 0xBC, 0x01, 0x00
	defb 0xFF
	; Tabla de instrumentos
	.TABLA_PAUTAS
	defw PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,0,PAUTA_6,PAUTA_7,PAUTA_8,PAUTA_9,PAUTA_10,PAUTA_11,PAUTA_12,PAUTA_13,PAUTA_14,PAUTA_15,PAUTA_16
	; Tabla de efectos
	.TABLA_SONIDOS
	defw 0
	;Pautas (instrumentos)
	;Instrumento 'Piano'
	.PAUTA_0
	defb 6,0,5,0,4,0,3,0,129
	;Instrumento 'Piano Reverb'
	.PAUTA_1
	defb 10,0,11,0,10,0,9,0,9,0,9,0,8,0,8,0,8,0,8,0,7,0,7,0,7,0,7,0,136
	;Instrumento 'Fade In FX'
	.PAUTA_2
	defb 2,0,3,0,4,8,4,-1,5,-4,5,20,5,-24,4,4,132
	;Instrumento 'Guitar 1'
	.PAUTA_3
	defb 14,0,14,0,12,0,12,0,10,0,9,1,9,1,9,-1,8,-1,8,0,8,0,134
	;Instrumento 'Guitar 2'
	.PAUTA_4
	defb 10,0,10,0,8,0,8,0,6,0,6,1,6,0,6,0,6,-1,6,0,6,0,134
	;Instrumento 'Eco guitar'
	.PAUTA_6
	defb 7,0,7,0,7,0,6,0,6,0,6,0,6,0,6,0,5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,3,0,0,0,129
	;Instrumento 'Solo Guitar'
	.PAUTA_7
	defb 76,0,11,0,11,0,11,0,10,0,9,1,9,0,9,-1,9,0,9,0,9,-1,9,0,9,1,9,0,9,0,138
	;Instrumento 'Eco Solo Guitar'
	.PAUTA_8
	defb 70,0,6,0,6,0,5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,4,0,4,0,3,0,3,0,3,0,3,0,3,0,3,0,2,0,2,0,2,0,1,0,129
	;Instrumento 'Slap Bass'
	.PAUTA_9
	defb 47,0,15,4,14,-4,13,3,12,-5,12,0,129
	;Instrumento 'Robo'
	.PAUTA_10
	defb 13,-1,13,-1,29,11,28,3,28,6,28,7,27,3,31,4,27,15,26,11,26,8,26,6,9,0,25,5,25,7,131
	;Instrumento 'Chip'
	.PAUTA_11
	defb 76,0,13,0,46,0,13,0,12,0,11,0,129
	;Instrumento 'Clipclop'
	.PAUTA_12
	defb 12,0,11,0,10,0,9,0,9,0,9,0,9,0,9,0,8,0,8,0,8,0,8,0,8,0,138
	;Instrumento 'Eco'
	.PAUTA_13
	defb 9,0,8,0,7,0,6,0,129
	;Instrumento 'Harmonica'
	.PAUTA_14
	defb 44,0,13,0,14,0,13,0,12,0,11,0,129
	;Instrumento 'Onda'
	.PAUTA_15
	defb 74,0,10,0,11,0,12,0,11,0,10,0,9,0,6,0,129
	;Instrumento 'Teeth'
	.PAUTA_16
	defb 73,0,10,0,42,0,9,0,8,0,7,0,7,0,7,0,7,0,6,0,6,0,6,0,6,0,136
	;Efectos
	;Frecuencias para las notas
	._00_title_mus_bin
	BINARY "../ogt/00_title.mus.bin"
	._01_ingame_mus_bin
	BINARY "../ogt/01_ingame.mus.bin"
	._02_gover_mus_bin
	BINARY "../ogt/02_gover.mus.bin"
	._wyz_songs
	defw _00_title_mus_bin, _01_ingame_mus_bin, _02_gover_mus_bin

._wyz_init
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_isr_player_on),a
	call WYZPLAYER_INIT
	ret



._wyz_play_music
	add hl, hl
	ld de, _wyz_songs
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld de, 0x8C00
	call depack
	ld a, 0
	call CARGA_CANCION
	ld a, 1
	ld (_isr_player_on), a
	ret



._peta_el_beeper
	; Sound number is in L
	ld a, l
	ld b, 1
	call INICIA_EFECTO
	ret



._wyz_stop_sound
	call PLAYER_OFF
	xor a
	ld (_isr_player_on), a
	ret


	; 1 PSG proPLAYER V 0.47c - WYZ 19.03.2016
	; (WYZTracker 2.0 o superior)
	.WYZPLAYER_INIT
	CALL PLAYER_OFF
	LD DE, 0x0020 ; No. BYTES RESERVADOS POR CANAL
	LD HL, 0xDF80 ;* RESERVAR MEMORIA PARA BUFFER DE SONIDO!!!!!
	LD (CANAL_A), HL
	ADD HL, DE
	LD (CANAL_B), HL
	ADD HL, DE
	LD (CANAL_C), HL
	ADD HL, DE
	LD (CANAL_P), HL
	RET
	.INICIO
	.WYZ_PLAYER_ISR
	CALL ROUT
	LD HL,PSG_REG
	LD DE,PSG_REG_SEC
	LD BC,14
	LDIR
	CALL REPRODUCE_SONIDO
	CALL PLAY
	JP REPRODUCE_EFECTO
	; REPRODUCE UN SONIDO POR EL CANAL ESPECIFICADO
	; IN
	; A = NUMERO DE SONIDO
	; B = CANAL
	.INICIA_SONIDO
	LD HL, TABLA_SONIDOS
	CALL EXT_WORD
	LD (PUNTERO_SONIDO), DE
	LD HL, INTERR
	SET 2, (HL)
	; na_th_an :: Percussion channel is fixed to 1
	;LD A, 1
	;LD HL, TABLA_DATOS_CANAL_SFX
	;CALL EXT_WORD
	;LD (SONIDO_REGS), DE
	RET
	; REPRODUCE UN FX POR EL CANAL ESPECIFICADO
	; IN
	; A = NUMERO DE SONIDO
	; B = CANAL
	.INICIA_EFECTO
	LD HL, TABLA_EFECTOS
	CALL EXT_WORD
	LD (PUNTERO_EFECTO), DE
	LD HL, INTERR
	SET 3, (HL)
	LD A, B
	LD HL, TABLA_DATOS_CANAL_SFX
	CALL EXT_WORD
	LD (EFECTO_REGS), DE
	RET
	;REPRODUCE EFECTOS DE SONIDO
	.REPRODUCE_SONIDO
	LD HL, INTERR
	BIT 2,(HL) ;ESTA ACTIVADO EL EFECTO?
	RET Z
	LD HL, (SONIDO_REGS)
	PUSH HL
	POP IX
	LD HL, (PUNTERO_SONIDO)
	CALL REPRODUCE_SONIDO_O_EFECTO
	OR A
	JR Z, REPRODUCE_SONIDO_LIMPIA_BIT
	LD (PUNTERO_SONIDO), HL
	RET
	.REPRODUCE_SONIDO_LIMPIA_BIT
	LD HL, INTERR
	RES 2, (HL)
	RET
	.REPRODUCE_EFECTO
	LD HL, INTERR
	BIT 3, (HL)
	RET Z
	LD HL, (EFECTO_REGS)
	PUSH HL
	POP IX
	LD HL, (PUNTERO_EFECTO)
	CALL REPRODUCE_SONIDO_O_EFECTO
	OR A
	JR Z, REPRODUCE_EFECTO_LIMPIA_BIT
	LD (PUNTERO_EFECTO), HL
	RET
	.REPRODUCE_EFECTO_LIMPIA_BIT
	LD HL, INTERR
	RES 3, (HL)
	RET
	.REPRODUCE_SONIDO_O_EFECTO
	LD A,(HL)
	CP 0xFF
	JR Z,FIN_SONIDO
	LD E, (IX+0) ; IX+0 -> SFX_L LO
	LD D, (IX+1) ; IX+1 -> SFX_L HI
	LD (DE),A
	INC HL
	LD A,(HL)
	RRCA
	RRCA
	RRCA
	RRCA
	AND 00001111B
	LD E, (IX+2) ; IX+2 -> SFX_H LO
	LD D, (IX+3) ; IX+3 -> SFX_H HI
	LD (DE),A
	LD A,(HL)
	AND 00001111B
	LD E, (IX+4) ; IX+4 -> SFX_V LO
	LD D, (IX+5) ; IX+5 -> SFX_V HI
	LD (DE),A
	INC HL
	LD A,(HL)
	LD B,A
	BIT 7,A ;09.08.13 BIT MAS SIGINIFICATIVO ACTIVA ENVOLVENTES
	JR Z,NO_ENVOLVENTES_SONIDO
	LD A,0x12
	LD (DE),A
	INC HL
	LD A,(HL)
	LD (PSG_REG_SEC+11),A
	INC HL
	LD A,(HL)
	LD (PSG_REG_SEC+12),A
	INC HL
	LD A,(HL)
	CP 1
	JR Z,NO_ENVOLVENTES_SONIDO ;NO ESCRIBE LA ENVOLVENTE SI SU VALOR ES 1
	LD (PSG_REG_SEC+13),A
	.NO_ENVOLVENTES_SONIDO
	LD A,B
	AND 0x7F ; RES 7,A ; AND A
	JR Z,NO_RUIDO
	LD (PSG_REG_SEC+6),A
	LD A, (IX+6) ; IX+6 -> SFX_MIX
	JR SI_RUIDO
	.NO_RUIDO XOR A
	LD (PSG_REG_SEC+6),A
	LD A,10111000B
	.SI_RUIDO LD (PSG_REG_SEC+7),A
	INC HL
	LD A, 1
	RET
	.FIN_SONIDO
	LD A,(ENVOLVENTE_BACK) ;NO RESTAURA LA ENVOLVENTE SI ES 0
	AND A
	JR Z,FIN_NOPLAYER
	;xor a ; ***
	LD (PSG_REG_SEC+13),A ;08.13 RESTAURA LA ENVOLVENTE TRAS EL SFX
	.FIN_NOPLAYER
	LD A,10111000B
	LD (PSG_REG_SEC+7),A
	XOR A
	RET
	;VUELCA BUFFER DE SONIDO AL PSG
	.ROUT
	LD A,(PSG_REG+13)
	AND A ;ES CERO?
	JR Z,NO_BACKUP_ENVOLVENTE
	LD (ENVOLVENTE_BACK),A ;08.13 / GUARDA LA ENVOLVENTE EN EL BACKUP
	XOR A
	.NO_BACKUP_ENVOLVENTE
	;VUELCA BUFFER DE SONIDO AL PSG
	LD HL,PSG_REG_SEC
	.LOUT
	CALL WRITEPSGHL
	INC A
	CP 13
	JR NZ,LOUT
	LD A,(HL)
	AND A
	RET Z
	LD A,13
	CALL WRITEPSGHL
	XOR A
	LD (PSG_REG+13),A
	LD (PSG_REG_SEC+13),A
	RET
	;; A = REGISTER
	;; (HL) = VALUE
	.WRITEPSGHL
	LD B,0xF4
	OUT (C),A
	LD BC,0xF6C0
	OUT (C),C
	DEFB 0xED
	DEFB 0x71
	LD B,0xF5
	OUTI
	LD BC,0xF680
	OUT (C),C
	DEFB 0xED
	DEFB 0x71
	RET
	;PLAYER OFF
	.PLAYER_OFF
	XOR A ;***** IMPORTANTE SI NO HAY MUSICA ****
	LD (INTERR),A
	;LD (FADE),A ;solo si hay fade out
	.CLEAR_PSG_BUFFER
	LD HL,PSG_REG
	LD DE,PSG_REG+1
	LD BC,14
	LD (HL),A
	LDIR
	LD A,10111000B ; **** POR SI ACASO ****
	LD (PSG_REG+7),A
	LD HL,PSG_REG
	LD DE,PSG_REG_SEC
	LD BC,14
	LDIR
	JP ROUT
	;CARGA UNA CANCION
	;.IN(A)=Nº DE CANCION
	.CARGA_CANCION
	LD HL,INTERR ;CARGA CANCION
	SET 1,(HL) ;REPRODUCE CANCION
	LD HL,SONG
	LD (HL),A ;Nº A
	;DECODIFICAR
	;IN-> INTERR 0 ON
	; SONG
	;CARGA CANCION SI/NO
	.DECODE_SONG
	LD A,(SONG)
	;LEE CABECERA DE LA CANCION
	;BYTE 0=TEMPO
	LD HL,TABLA_SONG
	CALL EXT_WORD
	LD A,(DE)
	LD (TEMPO),A
	DEC A
	LD (TTEMPO),A
	;HEADER BYTE 1
	;[-|-|-|-| 3-1 | 0 ]
	;[-|-|-|-|FX CHN|LOOP]
	INC DE ;LOOP 1=ON/0=OFF?
	LD A,(DE)
	BIT 0,A
	JR Z,NPTJP0
	LD HL,INTERR
	SET 4,(HL)
	;SELECCION DEL CANAL DE EFECTOS DE RITMO
	.NPTJP0
	AND 00000110B
	RRA
	;LD (SELECT_CANAL_P),A
	PUSH DE
	; na_th_an :: Percussion channel is fixed to 1
	;LD HL, TABLA_DATOS_CANAL_SFX
	;CALL EXT_WORD
	;LD (SONIDO_REGS), DE
	POP HL
	INC HL ;2 BYTES RESERVADOS
	INC HL
	INC HL
	;BUSCA Y GUARDA INICIO DE LOS CANALES EN EL MODULO MUS (OPTIMIZAR****************)
	;AÑADE OFFSET DEL LOOP
	PUSH HL ;IX INICIO OFFSETS LOOP POR CANAL
	POP IX
	LD DE,0x0008 ;HASTA INICIO DEL CANAL A
	ADD HL,DE
	LD (PUNTERO_P_DECA),HL ;GUARDA PUNTERO INICIO CANAL
	LD E,(IX+0)
	LD D,(IX+1)
	ADD HL,DE
	LD (PUNTERO_L_DECA),HL ;GUARDA PUNTERO INICIO LOOP
	CALL BGICMODBC1
	LD (PUNTERO_P_DECB),HL
	LD E,(IX+2)
	LD D,(IX+3)
	ADD HL,DE
	LD (PUNTERO_L_DECB),HL
	CALL BGICMODBC1
	LD (PUNTERO_P_DECC),HL
	LD E,(IX+4)
	LD D,(IX+5)
	ADD HL,DE
	LD (PUNTERO_L_DECC),HL
	CALL BGICMODBC1
	LD (PUNTERO_P_DECP),HL
	LD E,(IX+6)
	LD D,(IX+7)
	ADD HL,DE
	LD (PUNTERO_L_DECP),HL
	;LEE DATOS DE LAS NOTAS
	;[|][|||||] LONGITUD\NOTA
	.INIT_DECODER
	LD DE,(CANAL_A)
	LD (PUNTERO_A),DE
	LD HL,(PUNTERO_P_DECA)
	CALL DECODE_CANAL ;CANAL A
	LD (PUNTERO_DECA),HL
	LD DE,(CANAL_B)
	LD (PUNTERO_B),DE
	LD HL,(PUNTERO_P_DECB)
	CALL DECODE_CANAL ;CANAL B
	LD (PUNTERO_DECB),HL
	LD DE,(CANAL_C)
	LD (PUNTERO_C),DE
	LD HL,(PUNTERO_P_DECC)
	CALL DECODE_CANAL ;CANAL C
	LD (PUNTERO_DECC),HL
	LD DE,(CANAL_P)
	LD (PUNTERO_P),DE
	LD HL,(PUNTERO_P_DECP)
	CALL DECODE_CANAL ;CANAL P
	LD (PUNTERO_DECP),HL
	RET
	;BUSCA INICIO DEL CANAL
	.BGICMODBC1
	LD E,0x3F ;CODIGO INSTRUMENTO 0
	.BGICMODBC2
	XOR A ;BUSCA EL BYTE 0
	LD B,0xFF ;EL MODULO DEBE TENER UNA LONGITUD MENOR DE 0xFF00 ... o_O!
	CPIR
	DEC HL
	DEC HL
	LD A,E ;ES EL INSTRUMENTO 0??
	CP (HL)
	INC HL
	INC HL
	JR Z,BGICMODBC2
	DEC HL
	DEC HL
	DEC HL
	LD A,E ;ES VOLUMEN 0??
	CP (HL)
	INC HL
	INC HL
	INC HL
	JR Z,BGICMODBC2
	RET
	;DECODIFICA NOTAS DE UN CANAL
	;IN (DE)=DIRECCION DESTINO
	;NOTA=0 FIN CANAL
	;NOTA=1 SILENCIO
	;NOTA=2 PUNTILLO
	;NOTA=3 COMANDO I
	.DECODE_CANAL
	LD A,(HL)
	AND A ;FIN DEL CANAL?
	JR Z,FIN_DEC_CANAL
	CALL GETLEN
	CP 00000001B ;ES SILENCIO?
	JR NZ,NO_SILENCIO
	OR 0x40 ; SET 6,A
	JR NO_MODIFICA
	.NO_SILENCIO
	CP 00111110B ;ES PUNTILLO?
	JR NZ,NO_PUNTILLO
	OR A
	RRC B
	XOR A
	JR NO_MODIFICA
	.NO_PUNTILLO
	CP 00111111B ;ES COMANDO?
	JR NZ,NO_MODIFICA
	BIT 0,B ;COMADO=INSTRUMENTO?
	JR Z,NO_INSTRUMENTO
	LD A,11000001B ;CODIGO DE INSTRUMENTO
	LD (DE),A
	INC HL
	INC DE
	LDI ;Nº DE INSTRUMENTO
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	LDI ;VOLUMEN RELATIVO DEL INSTRUMENTO
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	JR DECODE_CANAL
	.NO_INSTRUMENTO
	BIT 2,B
	JR Z,NO_ENVOLVENTE
	LD A,11000100B ;CODIGO ENVOLVENTE
	LD (DE),A
	INC DE
	INC HL
	LDI
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	JR DECODE_CANAL
	.NO_ENVOLVENTE
	BIT 1,B
	JR Z,NO_MODIFICA
	LD A,11000010B ;CODIGO EFECTO
	LD (DE),A
	INC HL
	INC DE
	LD A,(HL)
	CALL GETLEN
	.NO_MODIFICA
	LD (DE),A
	INC DE
	XOR A
	DJNZ NO_MODIFICA
	OR 0x81 ; SET 7,A ; SET 0,A
	LD (DE),A
	INC DE
	INC HL
	RET ;** JR DECODE_CANAL
	.FIN_DEC_CANAL
	OR 0x80 ; SET 7,A
	LD (DE),A
	INC DE
	RET
	.GETLEN
	LD B,A
	AND 00111111B
	PUSH AF
	LD A,B
	AND 11000000B
	RLCA
	RLCA
	INC A
	LD B,A
	LD A,10000000B
	.DCBC0
	RLCA
	DJNZ DCBC0
	LD B,A
	POP AF
	RET
	;PLAY _______________________________
	.PLAY
	LD HL,INTERR ;PLAY BIT 1 ON?
	BIT 1,(HL)
	RET Z
	;TEMPO
	LD HL,TTEMPO ;CONTADOR TEMPO
	INC (HL)
	LD A,(TEMPO)
	CP (HL)
	JR NZ,PAUTAS
	LD (HL),0
	;INTERPRETA
	; Lee una nueva linea. Yo voy a incrementar dos contadores:
	; uno de lineas. Otro se incrementará cada 4 lineas. Éste lo "reflejaré" en low ram.
	ld a, (LINE_COUNTER)
	inc a
	cp 4
	jr nz, nonewblack
	; Incrementamos esto en low RAM
	ld hl, _wyz_beat_ct
	inc (hl)
	xor a
	nonewblack:
	ld (LINE_COUNTER), a
	LD IY,PSG_REG
	LD IX,PUNTERO_A
	LD BC,PSG_REG+8
	CALL LOCALIZA_NOTA
	LD IY,PSG_REG+2
	LD IX,PUNTERO_B
	LD BC,PSG_REG+9
	CALL LOCALIZA_NOTA
	LD IY,PSG_REG+4
	LD IX,PUNTERO_C
	LD BC,PSG_REG+10
	CALL LOCALIZA_NOTA
	LD IX,PUNTERO_P ;EL CANAL DE EFECTOS ENMASCARA OTRO CANAL
	CALL LOCALIZA_EFECTO
	;PAUTAS
	.PAUTAS
	LD IY,PSG_REG+0
	LD IX,PUNTERO_P_A
	LD HL,PSG_REG+8
	CALL PAUTA ;PAUTA CANAL A
	LD IY,PSG_REG+2
	LD IX,PUNTERO_P_B
	LD HL,PSG_REG+9
	CALL PAUTA ;PAUTA CANAL B
	LD IY,PSG_REG+4
	LD IX,PUNTERO_P_C
	LD HL,PSG_REG+10
	JP PAUTA ;PAUTA CANAL C
	;LOCALIZA NOTA CANAL A
	;IN (PUNTERO_A)
	;LOCALIZA NOTA CANAL A
	;IN (PUNTERO_A)
	.LOCALIZA_NOTA
	LD L,(IX+PUNTERO_A-PUNTERO_A) ;HL=(PUNTERO_A_C_B)
	LD H,(IX+PUNTERO_A-PUNTERO_A+1)
	LD A,(HL)
	AND 11000000B ;COMANDO?
	CP 11000000B
	JR NZ,LNJP0
	;BIT(0)=INSTRUMENTO
	.COMANDOS
	LD A,(HL)
	BIT 0,A ;INSTRUMENTO
	JR Z,COM_EFECTO
	INC HL
	LD A,(HL) ;Nº DE PAUTA
	INC HL
	LD E,(HL)
	PUSH HL ;;TEMPO ******************
	LD HL,TEMPO
	BIT 5,E
	JR Z,NO_DEC_TEMPO
	DEC (HL)
	.NO_DEC_TEMPO
	BIT 6,E
	JR Z,NO_INC_TEMPO
	INC (HL)
	.NO_INC_TEMPO
	RES 5,E ;SIEMPRE RESETEA LOS BITS DE TEMPO
	RES 6,E
	POP HL
	LD (IX+VOL_INST_A-PUNTERO_A),E ;REGISTRO DEL VOLUMEN RELATIVO
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	LD HL,TABLA_PAUTAS
	CALL EXT_WORD
	LD (IX+PUNTERO_P_A0-PUNTERO_A),E
	LD (IX+PUNTERO_P_A0-PUNTERO_A+1),D
	LD (IX+PUNTERO_P_A-PUNTERO_A),E
	LD (IX+PUNTERO_P_A-PUNTERO_A+1),D
	LD L,C
	LD H,B
	RES 4,(HL) ;APAGA EFECTO ENVOLVENTE
	XOR A
	LD (PSG_REG_SEC+13),A
	LD (PSG_REG+13),A
	;LD (ENVOLVENTE_BACK),A ;08.13 / RESETEA EL BACKUP DE LA ENVOLVENTE
	JR LOCALIZA_NOTA
	.COM_EFECTO
	BIT 1,A ;EFECTO DE SONIDO
	JR Z,COM_ENVOLVENTE
	INC HL
	LD A,(HL)
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	JP INICIA_SONIDO
	.COM_ENVOLVENTE
	BIT 2,A
	RET Z ;IGNORA - ERROR
	INC HL
	LD A,(HL) ;CARGA CODIGO DE ENVOLVENTE
	LD (ENVOLVENTE),A
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	LD L,C
	LD H,B
	LD (HL),00010000B ;ENCIENDE EFECTO ENVOLVENTE
	JR LOCALIZA_NOTA
	.LNJP0
	LD A,(HL)
	INC HL
	BIT 7,A
	JR Z,NO_FIN_CANAL_A ;
	BIT 0,A
	JR Z,FIN_CANAL_A
	.FIN_NOTA_A
	LD E,(IX+CANAL_A-PUNTERO_A)
	LD D,(IX+CANAL_A-PUNTERO_A+1) ;PUNTERO BUFFER AL INICIO
	LD (IX+PUNTERO_A-PUNTERO_A),E
	LD (IX+PUNTERO_A-PUNTERO_A+1),D
	LD L,(IX+PUNTERO_DECA-PUNTERO_A) ;CARGA PUNTERO DECODER
	LD H,(IX+PUNTERO_DECA-PUNTERO_A+1)
	PUSH BC
	CALL DECODE_CANAL ;DECODIFICA CANAL
	POP BC
	LD (IX+PUNTERO_DECA-PUNTERO_A),L ;GUARDA PUNTERO DECODER
	LD (IX+PUNTERO_DECA-PUNTERO_A+1),H
	JP LOCALIZA_NOTA
	.FIN_CANAL_A
	LD HL,INTERR ;LOOP?
	BIT 4,(HL)
	JR NZ,FCA_CONT
	POP AF
	JP PLAYER_OFF
	.FCA_CONT
	LD L,(IX+PUNTERO_L_DECA-PUNTERO_A) ;CARGA PUNTERO INICIAL DECODER
	LD H,(IX+PUNTERO_L_DECA-PUNTERO_A+1)
	LD (IX+PUNTERO_DECA-PUNTERO_A),L
	LD (IX+PUNTERO_DECA-PUNTERO_A+1),H
	JR FIN_NOTA_A
	.NO_FIN_CANAL_A
	LD (IX+PUNTERO_A-PUNTERO_A),L ;(PUNTERO_A_B_C)=HL GUARDA PUNTERO
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	AND A ;NO REPRODUCE NOTA SI NOTA=0
	JR Z,FIN_RUTINA
	BIT 6,A ;SILENCIO?
	JR Z,NO_SILENCIO_A
	LD A,(BC)
	AND 00010000B
	JR NZ,SILENCIO_ENVOLVENTE
	XOR A
	LD (BC),A ;RESET VOLUMEN DEL CORRESPODIENTE CHIP
	LD (IY+0),A
	LD (IY+1),A
	RET
	.SILENCIO_ENVOLVENTE
	LD A,0xFF
	LD (PSG_REG+11),A
	LD (PSG_REG+12),A
	XOR A
	LD (PSG_REG+13),A
	LD (IY+0),A
	LD (IY+1),A
	RET
	.NO_SILENCIO_A
	LD (IX+REG_NOTA_A-PUNTERO_A),A ;REGISTRO DE LA NOTA DEL CANAL
	CALL NOTA ;REPRODUCE NOTA
	LD L,(IX+PUNTERO_P_A0-PUNTERO_A) ;HL=(PUNTERO_P_A0) RESETEA PAUTA
	LD H,(IX+PUNTERO_P_A0-PUNTERO_A+1)
	LD (IX+PUNTERO_P_A-PUNTERO_A),L ;(PUNTERO_P_A)=HL
	LD (IX+PUNTERO_P_A-PUNTERO_A+1),H
	.FIN_RUTINA
	RET
	;LOCALIZA EFECTO
	;IN HL=(PUNTERO_P)
	.LOCALIZA_EFECTO
	LD L,(IX+0) ;HL=(PUNTERO_P)
	LD H,(IX+1)
	LD A,(HL)
	CP 11000010B
	JR NZ,LEJP0
	INC HL
	LD A,(HL)
	INC HL
	LD (IX+00),L
	LD (IX+01),H
	JP INICIA_SONIDO
	.LEJP0
	INC HL
	BIT 7,A
	JR Z,NO_FIN_CANAL_P ;
	BIT 0,A
	JR Z,FIN_CANAL_P
	.FIN_NOTA_P
	LD DE,(CANAL_P)
	LD (IX+0),E
	LD (IX+1),D
	LD HL,(PUNTERO_DECP) ;CARGA PUNTERO DECODER
	PUSH BC
	CALL DECODE_CANAL ;DECODIFICA CANAL
	POP BC
	LD (PUNTERO_DECP),HL ;GUARDA PUNTERO DECODER
	JP LOCALIZA_EFECTO
	.FIN_CANAL_P
	LD HL,(PUNTERO_L_DECP) ;CARGA PUNTERO INICIAL DECODER
	LD (PUNTERO_DECP),HL
	JR FIN_NOTA_P
	.NO_FIN_CANAL_P
	LD (IX+0),L ;(PUNTERO_A_B_C)=HL GUARDA PUNTERO
	LD (IX+1),H
	RET
	; PAUTA DE LOS 3 CANALES
	; .IN(IX):PUNTERO DE LA PAUTA
	; (HL):REGISTRO DE VOLUMEN
	; (IY):REGISTROS DE FRECUENCIA
	; FORMATO PAUTA
	; 7 6 5 4 3-0 3-0
	; BYTE 1 [LOOP|OCT-1|OCT+1|ORNMT|VOL] - BYTE 2 [ | | | |PITCH/NOTA]
	.PAUTA
	BIT 4,(HL) ;SI LA ENVOLVENTE ESTA ACTIVADA NO ACTUA PAUTA
	RET NZ
	LD A,(IY+0)
	LD B,(IY+1)
	OR B
	RET Z
	PUSH HL
	.PCAJP4
	LD L,(IX+0)
	LD H,(IX+1)
	LD A,(HL)
	BIT 7,A ;LOOP / EL RESTO DE BITS NO AFECTAN
	JR Z,PCAJP0
	AND 00011111B ;MÁXIMO LOOP PAUTA (0,32)X2!!!-> PARA ORNAMENTOS
	RLCA ;X2
	LD D,0
	LD E,A
	SBC HL,DE
	LD A,(HL)
	.PCAJP0
	BIT 6,A ;OCTAVA -1
	JR Z,PCAJP1
	LD E,(IY+0)
	LD D,(IY+1)
	AND A
	RRC D
	RR E
	LD (IY+0),E
	LD (IY+1),D
	JR PCAJP2
	.PCAJP1
	BIT 5,A ;OCTAVA +1
	JR Z,PCAJP2
	LD E,(IY+0)
	LD D,(IY+1)
	AND A
	RLC E
	RL D
	LD (IY+0),E
	LD (IY+1),D
	.PCAJP2
	LD A,(HL)
	BIT 4,A
	JR NZ,PCAJP6 ;ORNAMENTOS SELECCIONADOS
	INC HL ;______________________ FUNCION PITCH DE FRECUENCIA__________________
	PUSH HL
	LD E,A
	LD A,(HL) ;PITCH DE FRECUENCIA
	LD L,A
	AND A
	LD A,E
	JR Z,ORNMJP1
	LD A,(IY+0) ;SI LA FRECUENCIA ES 0 NO HAY PITCH
	ADD A,(IY+1)
	AND A
	LD A,E
	JR Z,ORNMJP1
	BIT 7,L
	JR Z,ORNNEG
	LD H,0xFF
	JR PCAJP3
	.ORNNEG
	LD H,0
	.PCAJP3
	LD E,(IY+0)
	LD D,(IY+1)
	ADC HL,DE
	LD (IY+0),L
	LD (IY+1),H
	JR ORNMJP1
	.PCAJP6
	INC HL ;______________________ FUNCION ORNAMENTOS__________________
	PUSH HL
	PUSH AF
	LD A,(IX+REG_NOTA_A-PUNTERO_P_A) ;RECUPERA REGISTRO DE NOTA EN EL CANAL
	LD E,(HL) ;
	ADC E ;+- NOTA
	CALL TABLA_NOTAS
	POP AF
	.ORNMJP1
	POP HL
	INC HL
	LD (IX+0),L
	LD (IX+1),H
	.PCAJP5
	POP HL
	LD B,(IX+VOL_INST_A-PUNTERO_P_A) ;VOLUMEN RELATIVO
	ADD B
	JP P,PCAJP7
	LD A,1 ;NO SE EXTIGUE EL VOLUMEN
	.PCAJP7
	AND 00001111B ;VOLUMEN FINAL MODULADO
	LD (HL),A
	RET
	;NOTA - REPRODUCE UNA NOTA
	;IN (A)=CODIGO DE LA NOTA
	; (IY)=REGISTROS DE FRECUENCIA
	.NOTA
	LD L,C
	LD H,B
	BIT 4,(HL)
	LD B,A
	JR NZ,EVOLVENTES
	LD A,B
	.TABLA_NOTAS
	LD HL,DATOS_NOTAS ;BUSCA FRECUENCIA
	CALL EXT_WORD
	LD (IY+0),E
	LD (IY+1),D
	RET
	;IN (A)=CODIGO DE LA ENVOLVENTE
	; (IY)=REGISTRO DE FRECUENCIA
	.EVOLVENTES
	LD HL,DATOS_NOTAS
	;SUB 12
	RLCA ;X2
	LD D,0
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	PUSH DE
	LD A,(ENVOLVENTE) ;FRECUENCIA DEL CANAL ON/OFF
	RRA
	JR NC,FRECUENCIA_OFF
	LD (IY+0),E
	LD (IY+1),D
	JR CONT_ENV
	.FRECUENCIA_OFF
	LD DE,0x0000
	LD (IY+0),E
	LD (IY+1),D
	;CALCULO DEL RATIO (OCTAVA ARRIBA)
	.CONT_ENV
	POP DE
	PUSH AF
	PUSH BC
	AND 00000011B
	LD B,A
	;INC B
	;AND A ;1/2
	RR D
	RR E
	.CRTBC0
	;AND A ;1/4 - 1/8 - 1/16
	RR D
	RR E
	DJNZ CRTBC0
	LD A,E
	LD (PSG_REG+11),A
	LD A,D
	AND 00000011B
	LD (PSG_REG+12),A
	POP BC
	POP AF ;SELECCION FORMA DE ENVOLVENTE
	RRA
	AND 00000110B ;0x08,0x0A,0x0C,0x0E
	ADD 8
	LD (PSG_REG+13),A
	LD (ENVOLVENTE_BACK),A
	RET
	;EXTRAE UN WORD DE UNA TABLA
	;.IN(HL)=DIRECCION TABLA
	; (A)= POSICION
	;OUT(DE)=WORD
	.EXT_WORD
	LD D,0
	RLCA
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	RET
	;TABLA DE DATOS DEL SELECTOR DEL CANAL DE EFECTOS DE RITMO
	.TABLA_DATOS_CANAL_SFX
	defw SELECT_CANAL_A,SELECT_CANAL_B,SELECT_CANAL_C
	;BYTE 0:SFX_L
	;BYTE 1:SFX_H
	;BYTE 2:SFX_V
	;BYTE 3:SFX_MIX
	.SELECT_CANAL_A
	defw PSG_REG_SEC+0, PSG_REG_SEC+1, PSG_REG_SEC+8
	defb 10110001B
	.SELECT_CANAL_B
	defw PSG_REG_SEC+2, PSG_REG_SEC+3, PSG_REG_SEC+9
	defb 10101010B
	.SELECT_CANAL_C
	defw PSG_REG_SEC+4, PSG_REG_SEC+5, PSG_REG_SEC+10
	defb 10011100B
	;_______________________________
	.INTERR
	defb 0 ;INTERRUPTORES 1=ON 0=OFF
	;BIT 0=CARGA CANCION ON/OFF
	;BIT 1=PLAYER ON/OFF
	;BIT 2=EFECTOS ON/OFF
	;BIT 3=SFX ON/OFF
	;BIT 4=LOOP
	;MUSICA **** EL ORDEN DE LAS VARIABLES ES FIJO ******
	.SONG defb 0 ;DBNº DE CANCION
	.TEMPO defb 0 ;DB TEMPO
	.TTEMPO defb 0 ;DB CONTADOR TEMPO
	.PUNTERO_A defw 0 ;DW PUNTERO DEL CANAL A
	.PUNTERO_B defw 0 ;DW PUNTERO DEL CANAL B
	.PUNTERO_C defw 0 ;DW PUNTERO DEL CANAL C
	.CANAL_A defw 0 ;DW DIRECION DE INICIO DE LA MUSICA A
	.CANAL_B defw 0 ;DW DIRECION DE INICIO DE LA MUSICA B
	.CANAL_C defw 0 ;DW DIRECION DE INICIO DE LA MUSICA C
	.PUNTERO_P_A defw 0 ;DW PUNTERO PAUTA CANAL A
	.PUNTERO_P_B defw 0 ;DW PUNTERO PAUTA CANAL B
	.PUNTERO_P_C defw 0 ;DW PUNTERO PAUTA CANAL C
	.PUNTERO_P_A0 defw 0 ;DW INI PUNTERO PAUTA CANAL A
	.PUNTERO_P_B0 defw 0 ;DW INI PUNTERO PAUTA CANAL B
	.PUNTERO_P_C0 defw 0 ;DW INI PUNTERO PAUTA CANAL C
	.PUNTERO_P_DECA defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL A
	.PUNTERO_P_DECB defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL B
	.PUNTERO_P_DECC defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL C
	.PUNTERO_DECA defw 0 ;DW PUNTERO DECODER CANAL A
	.PUNTERO_DECB defw 0 ;DW PUNTERO DECODER CANAL B
	.PUNTERO_DECC defw 0 ;DW PUNTERO DECODER CANAL C
	.PUNTERO_EFECTO defw 0 ;DW PUNTERO DEL SONIDO QUE SE REPRODUCE
	.REG_NOTA_A defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL A
	.VOL_INST_A defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL A
	.REG_NOTA_B defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL B
	.VOL_INST_B defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL B ;VACIO
	.REG_NOTA_C defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL C
	.VOL_INST_C defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL C
	.PUNTERO_L_DECA defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL A
	.PUNTERO_L_DECB defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL B
	.PUNTERO_L_DECC defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL C
	;CANAL DE EFECTOS DE RITMO - ENMASCARA OTRO CANAL
	.PUNTERO_P defw 0 ;DW PUNTERO DEL CANAL EFECTOS
	.CANAL_P defw 0 ;DW DIRECION DE INICIO DE LOS EFECTOS
	.PUNTERO_P_DECP defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL P
	.PUNTERO_DECP defw 0 ;DW PUNTERO DECODER CANAL P
	.PUNTERO_L_DECP defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL P
	;SELECT_CANAL_P defb INTERR+0x36 ;DB SELECCION DE CANAL DE EFECTOS DE RITMO
	.SFX_L defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO BAJO
	.SFX_H defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO ALTO
	.SFX_V defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO VOLUMEN
	.SFX_MIX defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO MIXER
	;EFECTOS DE SONIDO
	.N_SONIDO defb 0 ;DB : NUMERO DE SONIDO
	.PUNTERO_SONIDO defw 0 ;DW : PUNTERO DEL SONIDO QUE SE REPRODUCE
	.EFECTO_REGS defw 0
	.SONIDO_REGS defw SELECT_CANAL_B ; na_th_an :: Percussion channel is fixed to 1
	;DB (13) BUFFERs DE REGISTROS DEL PSG
	.PSG_REG defs 16
	.PSG_REG_SEC defs 16
	.ENVOLVENTE
	defb 0 ;DB : FORMA DE LA ENVOLVENTE
	;BIT 0 : FRECUENCIA CANAL ON/OFF
	;BIT 1-2 : RATIO
	;BIT 3-3 : FORMA
	.ENVOLVENTE_BACK defb 0 ;.defb BACKUP DE LA FORMA DE LA ENVOLENTE
	.DATOS_NOTAS
	defw 0x0000, 0x0000
	defw 964,910,859,811,766,722,682,644,608,573
	defw 541,511,482,455,430,405,383,361,341,322
	defw 304,287,271,255,241,228,215,203,191,180
	defw 170,161,152,143,135,128,121,114,107,101
	defw 96,90,85,81,76,72,68,64,60,57
	defw 54,51,48,45,43,40,38,36,34,32
	.TABLA_SONG
	defw 0x8C00
	.TABLA_EFECTOS
	defw EFECTO0, EFECTO1, EFECTO2, EFECTO3, EFECTO4, EFECTO5, EFECTO6, EFECTO7
	defw EFECTO8, EFECTO9
	.LINE_COUNTER
	defb 0
	; LUT for transparent pixels in sprites
	; taken from CPCTelera
	._trpixlutc
	BINARY "trpixlutc.bin"
	._def_keys
	defw $4404 ; LEFT O
	defw $4308 ; RIGHT P
	defw $4808 ; UP Q
	defw $4820 ; DOWN A
	defw $4580 ; BUTTON_A SPACE
	defw $4808 ; BUTTON_B Q
	defw $4801 ; KEY_AUX3 1
	defw $4802 ; KEY_AUX4 2
	defw $4880 ; KEY_AUX1 Z
	defw $4780 ; KEY_AUX2 X
	defw $4204 ; KEY_ENTER
	defw $4804 ; KEY_ESC
	._def_keys_joy
	defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
	defw 0x4801, 0x4802, 0x4880, 0x4780, 0x4204, 0x4804
	._sprite_cells
	defw (_sprites + 0x0000), (_sprites + 0x0040), (_sprites + 0x0080), (_sprites + 0x00C0)
	defw (_sprites + 0x0100), (_sprites + 0x0140), (_sprites + 0x0180), (_sprites + 0x01C0)
	defw (_sprites + 0x0200), (_sprites + 0x0240), (_sprites + 0x0280), (_sprites + 0x02C0)
	defw (_sprites + 0x0300), (_sprites + 0x0340), (_sprites + 0x0380), (_sprites + 0x03C0)
	defw (_sprites + 0x0400), (_sprites + 0x0440), (_sprites + 0x0480), (_sprites + 0x04C0)
	defw (_sprites + 0x0500), (_sprites + 0x0540), (_sprites + 0x0580), (_sprites + 0x05C0)
	defw (_sprites + 0x0600), (_sprites + 0x0640), (_sprites + 0x0680), (_sprites + 0x06C0)
	defw (_sprites + 0x0700), (_sprites + 0x0740), (_sprites + 0x0780), (_sprites + 0x07C0)
	.pal_hud
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x44
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x57
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
	.pal_general
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x5C
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x40
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4E
	out (c), a
	ret
	.palmap
	defw inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0, inks0
	defw inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1, inks1
	defw inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2, inks2
	defw inks3, inks3, inks3, inks3, inks3

._blackout
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rda),a
	ld a, 0xc0
	.bo_l1
	ld h, a
	ld l, 0
	ld b, a
	ld a, (_rda)
	ld (hl), a
	ld a, b
	ld d, a
	ld e, 1
	ld bc, 0x5ff
	ldir
	add 8
	jr nz, bo_l1
	ret



._cpc_Border
	ld a, l
	ld bc, 0x7F11
	out (c), c
	out (c), a
	ret



._system_init
	call	_wyz_init
	di
	ld hl, 0xC000
	xor a
	ld (hl), a
	ld de, 0xC001
	ld bc, 0x3DFF
	ldir
	ld a, 195
	ld (0x38), a
	ld hl, _isr
	ld (0x39), hl
	ld b,0xf5
	.wait_vsync
	in a,(c)
	rra
	jp nc,wait_vsync
	xor a
	ld (isr_c1), a
	ei
	jp after_isr
	._isr
	push af
	push hl
	push de
	push bc
	push ix
	push iy
	ld a, (isr_c1)
	inc a
	cp 3
	jr z, _set_game_pal
	cp 6
	jr c, _isr_done
	ld hl, isr_c2
	inc (hl)
	ld a, (_isr_player_on)
	or a
	jr z, _skip_ay_player
	call WYZ_PLAYER_ISR
	._skip_ay_player
	ld a, (_do_split)
	or a
	jr z, isr_nohud
	call pal_hud
	.isr_nohud
	xor a
	._isr_done
	ld (isr_c1), a
	pop iy
	pop ix
	pop bc
	pop de
	pop hl
	pop af
	ei
	ret
	._set_game_pal
	ld a, (_do_split)
	or a
	jr z, isr_nosplit
	.inject_pal
	call pal_general
	.isr_nosplit
	ld a, 3
	jr _isr_done
	.isr_c1
	defb 0
	.isr_c2
	defb 0
	.after_isr
	ld	hl,84	;const
	call	_cpc_Border
	ld hl, _trpixlutc
	ld de, 0xF800 + 0x600
	call depack
	call	cpc_MakeM1RotationLUTs
	call	_blackout
	ld	hl,1	;const
	call	cpc_SetMode
	; Horizontal chars (32), CRTC REG #1
	ld b, 0xbc
	ld c, 1 ; REG = 1
	out (c), c
	inc b
	ld c, 32 ; VALUE = 32
	out (c), c
	; Horizontal pos (42), CRTC REG #2
	ld b, 0xbc
	ld c, 2 ; REG = 2
	out (c), c
	inc b
	ld c, 42 ; VALUE = 42
	out (c), c
	; Vertical pos (4), CRTC REG #5
	ld b, 0xbc
	ld c, 5 ; REG = 5
	out (c), c
	inc b
	ld c, 4 ; VALUE = 24
	out (c), c
	; Vertical chars (24), CRTC REG #6
	ld b, 0xbc
	ld c, 6 ; REG = 6
	out (c), c
	inc b
	ld c, 24 ; VALUE = 24
	out (c), c
	.sprite_creation
	ld ix, #(0xE000 + 0x600+(0*16))
	ld a, (_sm_cox)
	ld (ix + 6), a
	ld a, (_sm_coy)
	ld (ix + 7), a
	ld hl, (_sm_invfunc)
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, (_sm_updfunc)
	ld (ix + 15), h
	ld (ix + 14), l
	ld hl, _spr_empty
	ld (ix + 1), h
	ld (ix + 0), l
	ld (ix + 3), h
	ld (ix + 2), l
	ld ix, #(0xE000 + 0x600+(1*16))
	ld de, 16
	ld b, 3
	.sp_sw_init_enems_loop
	ld hl, cpc_PutSpTileMap8x16Px
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, cpc_PutTrSp8x16TileMapPx
	ld (ix + 15), h
	ld (ix + 14), l
	add ix, de
	djnz sp_sw_init_enems_loop
	ld ix, 0xE000 + 0x600
	ld de, 16
	ld b, 1 + 3 + 0 + 0 + 0
	.sp_sw_init_turnoff_loop
	ld a, #((1*8)/4)
	ld (ix + 10), a
	ld a, #(4*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	ret



.__tile_address
	ld a, (__y)
	add a, a ; 2 4
	add a, a ; 4 4
	add a, a ; 8 4
	ld h, 0 ; 2
	ld l, a ; 4
	add hl, hl ; 16 11
	add hl, hl ; 32 11
	; 44 t-states
	; HL = _y * 32
	ld de, (__x)
	ld d, 0
	add hl, de
	; HL = _y * 32 + _x
	ld de, _nametable
	add hl, de
	ex de, hl
	; DE = buffer address
	ret



._draw_coloured_tile
	; Copy params for speed & size
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (__x), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__t), a
	._draw_coloured_tile_do
	call __tile_address ; DE = buffer address
	ex de, hl
	ld a, (__t)
	sla a
	sla a
	add 64
	ld (hl), a
	inc hl
	inc a
	ld (hl), a
	ld bc, 31
	add hl, bc
	inc a
	ld (hl), a
	inc hl
	inc a
	ld (hl), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	dec e
	inc d
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	ret



._set_map_tile
	; Copy params for speed & size
	ld hl, 8
	add hl, sp
	ld a, (hl)
	ld (__x), a
	ld c, a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__t), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__n), a
	.set_map_tile_do
	ld a, (__y)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	add c
	ld b, 0
	ld c, a
	ld hl, _map_buff
	add hl, bc
	ld a, (__t)
	ld (hl), a
	ld hl, _map_attr
	add hl, bc
	ld a, (__n)
	ld (hl), a
	.set_map_tile_do_print
	ld a, (__x)
	sla a
	add 1
	ld (__x), a
	ld a, (__y)
	sla a
	add 4
	ld (__y), a
	jp _draw_coloured_tile_do
	ret



._invalidate_viewport
	ld B, 4
	ld C, 1
	ld D, 4+19
	ld E, 1+29
	call cpc_InvalidateRect
	ret



._draw_2_digits
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (__x), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	dec hl
	ld a, (hl)
	.draw_2_digits_shortcut
	ld d, 0
	ld e, a
	ld hl, 10
	call l_div_u
	ld a, e
	add 16
	ld (__n), a
	ld a, l
	add 16
	ld (__t), a
	call __tile_address ; DE = buffer address
	ld a, (__t)
	ld (de), a
	inc de
	ld a, (__n)
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	ret



._draw_text
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (__x), a
	ld (__t), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	ld a, (hl)
	dec hl
	ld l, (hl)
	ld h, a
	.draw_text_pre_loop
	push hl
	xor a
	ld (__n), a ; Strlen
	call __tile_address ; DE = buffer address
	pop hl
	.draw_text_loop
	ld a, (hl)
	or a
	jr z, print_str_inv
	inc hl
	sub 32
	ld (de), a
	inc de
	.draw_text_cont
	ld a, (__n)
	inc a
	ld (__n), a
	jr draw_text_loop
	.print_str_inv
	; Invalidate cells based upon strlen.
	ld a, (__y)
	ld b, a
	ld d, a
	ld a, (__x)
	ld c, a
	ld a, (__n)
	add c
	dec a
	ld e, a
	call cpc_InvalidateRect
	ret



._pad_read
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld hl, cpc_KeysData + 12
	xor a
	ld (_pad0), a
	ld b, 1
	pad_read_loop:
	push bc
	ld d, (hl)
	inc hl
	ld a, (hl)
	inc hl
	call cpc_TestKeyboard
	and d
	pop bc
	jr z, pad_read_not_pressed
	ld a, (_pad0)
	or b
	ld (_pad0), a
	.pad_read_not_pressed
	sla b
	jr nz, pad_read_loop
	ld a, (_pad0)
	cpl
	ld (_pad0), a
	ld (_pad1), a
	ld	hl,(_pad_this_frame)
	ld	h,0
	call	l_com
	ex	de,hl
	ld	hl,(_pad1)
	ld	h,0
	call	l_or
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ret



._no_break
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_14
.i_12
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_14
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ult
	jp	nc,i_13
	halt
	jp	i_12
.i_13
	ret



._espera_activa
.i_17
	call	_pad_read
	halt
	halt
	halt
	halt
	halt
	halt
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_16
.i_18
.i_15
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_17
.i_16
	ret



._cortina
	ret



._step
	ret



._unpack_screen
	ld de, 0x9000
	call depack
	ret



._draw_rectangle
	call __tile_address
	ld a, (__y2)
	inc a
	ld hl, __y
	sub (hl)
	ld b, a
	ld a, (__x)
	add 31
	ld hl, __x2
	sub (hl)
	dec a
	ld (__n), a
	.draw_rectangle_it1
	push bc
	ld a, (__x)
	ld b, a
	.draw_rectangle_it2
	xor a
	ld (de), a
	inc de
	inc b
	ld a, (__x2)
	inc a
	cp b
	jr nc, draw_rectangle_it2
	ld hl, (__n)
	ld h, 0
	add hl, de
	ex de, hl
	pop bc
	djnz draw_rectangle_it1
	ld a, (__y)
	ld b, a
	ld a, (__x)
	ld c, a
	ld a, (__y2)
	ld d, a
	ld a, (__x2)
	ld e, a
	call cpc_InvalidateRect
	ret



._render_this_enemy
	ld d, 1
	call _get_pointer_to_enem_or_coco
	ld a, (_rdx)
	add #(1*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_rdy)
	add #(4*8)
	add (ix + 7)
	ld (ix + 9), a
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, _en_an_next_frame
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (ix + 0), l
	ld (ix + 1), h
	ret



._render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_21
.i_19
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_21
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_20
	ld hl, (_enoffs)
	ld bc, (_enit)
	ld b, 0
	add hl, bc
	call _calc_baddies_pointer
	ld a, (hl)
	ld (_rdx), a
	inc hl
	ld a, (hl)
	ld (_rdy), a
	call _render_this_enemy
	jp	i_19
.i_20
	ld a, (_gpy)
	ld (_rdy), a
	ld a, (_player + 23)
	and 2
	jr z, render_player_on_screen
	ld a, (_half_life)
	or a
	jr nz, render_player_on_screen
	.render_player_off_screen
	ld a, 240
	jr render_player_set_x
	.render_player_on_screen
	ld a, (_gpx)
	.render_player_set_x
	ld (_rdx), a
	.render_player
	ld ix, #(0xE000 + 0x600 + (0*16))
	ld a, (_gpx)
	add #(1*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_gpy)
	add #(4*8)
	add (ix + 7)
	ld (ix + 9), a
	ld a, (_player + 23)
	and 2
	jr z, player_render_graphic
	ld a, (_half_life)
	or a
	jr z, player_render_graphic
	.player_render_empty
	ld hl, _spr_empty
	jr player_render_set_sp0
	.player_render_graphic
	ld hl, (_player + 17)
	.player_render_set_sp0
	ld (ix + 0), l
	ld (ix + 1), h
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ret



._saca_a_todo_el_mundo_de_aqui
	ld de, 16
	ld b, 1 + 3 + 0 + 0 + 0
	ld hl, 0xE000 + 0x600
	.clear_sprites_loop
	ld a, #(_spr_empty%256)
	ld (hl), a
	inc hl
	ld a, #(_spr_empty/256)
	ld (hl), a
	add hl, de
	djnz clear_sprites_loop
	ret



._cpc_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_22
	ld a, #((1 + 3 + 0 + 0 + 0)*16)
	._cpc_screen_update_inv_loop
	sub 16
	push af
	ld d, 0
	ld e, a
	ld hl, _sp_sw
	add hl, de
	ld b, h
	ld c, l
	ld de, _cpc_screen_update_inv_ret
	push de
	ld de, 12
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	ld h, b
	ld l, c
	ret
	._cpc_screen_update_inv_ret
	pop af
	or a
	jr nz, _cpc_screen_update_inv_loop
.i_22
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_23
	ld a, #((1 + 3 + 0 + 0 + 0)*16)
	._cpc_screen_update_upd_loop
	sub 16
	push af
	ld d, 0
	ld e, a
	ld hl, _sp_sw
	add hl, de
	ld b, h
	ld c, l
	ld de, _cpc_screen_update_upd_ret
	push de
	ld de, 14
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	ld h, b
	ld l, c
	ret
	._cpc_screen_update_upd_ret
	pop af
	or a
	jr nz, _cpc_screen_update_upd_loop
	._cpc_screen_update_done
.i_23
	.ml_min_faps_loop
	ld a, (isr_c2)
	cp 2
	jr nc, ml_min_faps_loop_end
	halt
	jr ml_min_faps_loop
	.ml_min_faps_loop_end
	xor a
	ld (isr_c2), a
	ld a, (_pant_just_rendered)
	or a
	jr z, change_palette_done
	ld hl, (_n_pant)
	ld h, 0
	add hl, hl
	ld de, palmap
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (inject_pal + 1), hl
	.change_palette_done
	call cpc_ShowTouchedTiles
	call cpc_ResetTouchedTiles
	ret



._cpc_HardPause
	ld a, l
	.cpc_HardPause_outer
	ld b, 6
	.cpc_HardPause_inner
	halt
	djnz cpc_HardPause_inner
	dec a
	jr nz, cpc_HardPause_outer
	ret



._get_pointer_to_enem_or_coco
	ld a, (_enit)
	add d
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, 0xE000 + 0x600
	add hl, de
	push hl
	pop ix
	ret



._enems_en_an_calc
	ld b, l
	sla b
	ld d, 1
	call _get_pointer_to_enem_or_coco
	ld a, b
	add 16
	ld hl, (_enit)
	ld h, 0
	ld de, _en_an_base_frame
	add hl, de
	ld (hl), a
	ld b, 0
	ld c, a
	ld hl, _sm_cox
	add hl, bc
	ld a, (hl)
	ld (ix + 6), a
	ld hl, _sm_coy
	add hl, bc
	ld a, (hl)
	add (ix + 7), a
	sla c
	ld hl, _sm_invfunc
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld (ix + 12), e
	ld (ix + 13), d
	ld hl, _sm_updfunc
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld d, (hl)
	ld (ix + 14), e
	ld (ix + 15), d
	jp _enems_calc_frame
	ret



._select_controls
	.title_loop
	call _pad_read
	ld a, (_pad_this_frame)
	and 0x40
	jr nz, title_not_aux3
	ld hl, _def_keys
	jr copy_keys_to_extern
	.title_not_aux3
	ld a, (_pad_this_frame)
	and 0x80
	jr nz, title_loop
	ld hl, _def_keys_joy
	.copy_keys_to_extern
	ld de, cpc_KeysData + 12
	ld bc, 24
	ldir
	call	_wyz_stop_sound
	ret



._decode_text
	ld de, script_encoded_text
	add hl, de
	ld de, #((0xD000 + 0x600 + 3*18))
	ld c, 0x80
	.fbsd_mainb
	call fbsd_unpackc
	or a
	jr z, fbsd_escaped
	add 64
	jr fbsd_stor
	.fbsd_escaped
	call fbsd_unpackc
	or a
	jr z, fbsd_done
	cp 31
	jr nz, fbsd_nonl
	ld a, '%'
	jr fbsd_stor
	.fbsd_nonl
	add 32
	.fbsd_stor
	ld (de), a
	inc de
	jr fbsd_mainb
	.fbsd_unpackc
	ld a, c
	ld b, 0x08
	.fbsd_bucle
	call fbsd_getbit
	rl b
	jr nc, fbsd_bucle
	ld c, a
	ld a, b
	ret
	.fbsd_getbit
	add a, a
	ret nz
	ld a, (hl)
	inc hl
	rla
	ret
	.fbsd_done
	ld (de), a
	ld hl, #((0xD000 + 0x600 + 3*18))
	jp _textbox
	ret



._script
	ld a, l
	ld (_script_n), a
	ld a, (_tpx)
	ld c, a
	ld a, (_tpy)
	call qtile_do
	ld a, l
	ld (_tqt), a
	ld a, 0xff
	ld (_script_param), a
	call _script_do
	call _shl_player_coords
	ret


	XDEF script_bytecode
	XDEF _attr_2
	XDEF qtile_do
	XDEF set_map_tile_do
	XDEF _peta_el_beeper
	XDEF draw_line_of_text
	XDEF _tpx
	XDEF _tpy
	XDEF _tat
	XDEF _tqt
	XDEF _hotspot_t
	XDEF _scenery_info
	XDEF _do_extern_action
	XDEF _cpc_UpdateNow
	.script_bytecode
	BINARY "script.spt.bin"
	.script_encoded_text
	BINARY "text.bin"
	; -----------------------------------------------------------------------------
	; ZX0 decoder by Einar Saukas & Urusergi
	; "Standard" version (68 bytes only)
	; -----------------------------------------------------------------------------
	; .Parameters
	; .HL source address (compressed data)
	; .DE destination address (decompressing)
	; -----------------------------------------------------------------------------
	.depack
	.dzx0_standard
	ld bc, $ffff ; preserve default offset 1
	push bc
	inc bc
	ld a, $80
	.dzx0s_literals
	call dzx0s_elias ; obtain length
	ldir ; copy literals
	add a, a ; copy from last offset or new offset?
	jr c, dzx0s_new_offset
	call dzx0s_elias ; obtain length
	.dzx0s_copy
	ex (sp), hl ; preserve source, restore offset
	push hl ; preserve offset
	add hl, de ; calculate destination - offset
	ldir ; copy from offset
	pop hl ; restore offset
	ex (sp), hl ; preserve offset, restore source
	add a, a ; copy from literals or new offset?
	jr nc, dzx0s_literals
	.dzx0s_new_offset
	pop bc ; discard last offset
	ld c, $fe ; prepare negative offset
	call dzx0s_elias_loop ; obtain offset MSB
	inc c
	ret z ; check end marker
	ld b, c
	ld c, (hl) ; obtain offset LSB
	inc hl
	rr b ; last offset bit becomes first length bit
	rr c
	push bc ; preserve new offset
	ld bc, 1 ; obtain length
	call nc, dzx0s_elias_backtrack
	inc bc
	jr dzx0s_copy
	.dzx0s_elias
	inc c ; interlaced Elias gamma coding
	.dzx0s_elias_loop
	add a, a
	jr nz, dzx0s_elias_skip
	ld a, (hl) ; load another group of 8 bits
	inc hl
	rla
	.dzx0s_elias_skip
	ret c
	.dzx0s_elias_backtrack
	add a, a
	rl c
	rl b
	jr dzx0s_elias_loop
	; -----------------------------------------------------------------------------
	._mapa
	BINARY "mapa.map.bin"
	._cerrojos
	BINARY "mapa.locks.bin"
;	SECTION	text

._malotes
	defb	32
	defb	48
	defb	35
	defb	115
	defb	1
	defb	0
	defb	2
	defb	144
	defb	64
	defb	148
	defb	180
	defb	1
	defb	0
	defb	1
	defb	64
	defb	112
	defb	71
	defb	167
	defb	1
	defb	0
	defb	2
	defb	112
	defb	112
	defb	114
	defb	119
	defb	0
	defb	-2
	defb	2
	defb	192
	defb	128
	defb	200
	defb	216
	defb	1
	defb	0
	defb	3
	defb	144
	defb	16
	defb	145
	defb	152
	defb	0
	defb	1
	defb	4
	defb	144
	defb	64
	defb	148
	defb	212
	defb	2
	defb	0
	defb	2
	defb	96
	defb	64
	defb	20
	defb	100
	defb	-1
	defb	0
	defb	2
	defb	64
	defb	48
	defb	67
	defb	211
	defb	1
	defb	0
	defb	2
	defb	64
	defb	96
	defb	70
	defb	134
	defb	1
	defb	0
	defb	2
	defb	16
	defb	0
	defb	16
	defb	20
	defb	0
	defb	2
	defb	2
	defb	64
	defb	128
	defb	72
	defb	120
	defb	1
	defb	0
	defb	1
	defb	144
	defb	128
	defb	152
	defb	216
	defb	2
	defb	0
	defb	3
	defb	80
	defb	128
	defb	40
	defb	88
	defb	-2
	defb	0
	defb	1
	defb	128
	defb	128
	defb	136
	defb	168
	defb	1
	defb	0
	defb	3
	defb	32
	defb	128
	defb	40
	defb	104
	defb	1
	defb	0
	defb	1
	defb	208
	defb	128
	defb	216
	defb	232
	defb	1
	defb	0
	defb	1
	defb	192
	defb	96
	defb	150
	defb	198
	defb	-2
	defb	0
	defb	2
	defb	32
	defb	112
	defb	35
	defb	55
	defb	1
	defb	-1
	defb	2
	defb	176
	defb	48
	defb	147
	defb	179
	defb	-1
	defb	0
	defb	3
	defb	48
	defb	128
	defb	24
	defb	56
	defb	-1
	defb	0
	defb	1
	defb	160
	defb	128
	defb	163
	defb	168
	defb	0
	defb	-2
	defb	2
	defb	32
	defb	128
	defb	40
	defb	56
	defb	1
	defb	0
	defb	3
	defb	192
	defb	128
	defb	88
	defb	200
	defb	-1
	defb	0
	defb	2
	defb	192
	defb	96
	defb	102
	defb	198
	defb	-2
	defb	0
	defb	2
	defb	192
	defb	64
	defb	132
	defb	196
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	96
	defb	102
	defb	134
	defb	-1
	defb	0
	defb	2
	defb	192
	defb	80
	defb	165
	defb	197
	defb	-1
	defb	0
	defb	1
	defb	64
	defb	0
	defb	64
	defb	69
	defb	0
	defb	2
	defb	2
	defb	128
	defb	96
	defb	118
	defb	134
	defb	-1
	defb	0
	defb	2
	defb	176
	defb	48
	defb	83
	defb	179
	defb	-2
	defb	0
	defb	2
	defb	64
	defb	16
	defb	65
	defb	161
	defb	2
	defb	0
	defb	2
	defb	160
	defb	16
	defb	161
	defb	166
	defb	0
	defb	1
	defb	1
	defb	96
	defb	48
	defb	51
	defb	99
	defb	-1
	defb	0
	defb	3
	defb	208
	defb	144
	defb	25
	defb	217
	defb	-1
	defb	0
	defb	4
	defb	192
	defb	96
	defb	118
	defb	198
	defb	-1
	defb	0
	defb	4
	defb	80
	defb	64
	defb	84
	defb	196
	defb	1
	defb	0
	defb	2
	defb	96
	defb	128
	defb	56
	defb	104
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	40
	defb	88
	defb	-2
	defb	0
	defb	1
	defb	128
	defb	96
	defb	54
	defb	134
	defb	-1
	defb	0
	defb	2
	defb	144
	defb	112
	defb	151
	defb	199
	defb	1
	defb	0
	defb	1
	defb	96
	defb	112
	defb	97
	defb	103
	defb	0
	defb	-2
	defb	2
	defb	48
	defb	32
	defb	50
	defb	56
	defb	0
	defb	2
	defb	2
	defb	112
	defb	112
	defb	114
	defb	119
	defb	0
	defb	-1
	defb	4
	defb	64
	defb	48
	defb	19
	defb	67
	defb	-1
	defb	0
	defb	3
	defb	48
	defb	48
	defb	51
	defb	55
	defb	0
	defb	1
	defb	2
	defb	80
	defb	16
	defb	81
	defb	86
	defb	0
	defb	2
	defb	2
	defb	112
	defb	16
	defb	113
	defb	117
	defb	0
	defb	1
	defb	2
	defb	80
	defb	64
	defb	84
	defb	180
	defb	2
	defb	0
	defb	4
	defb	80
	defb	112
	defb	87
	defb	151
	defb	1
	defb	0
	defb	2
	defb	32
	defb	48
	defb	35
	defb	211
	defb	1
	defb	0
	defb	2
	defb	32
	defb	16
	defb	33
	defb	38
	defb	0
	defb	2
	defb	2
	defb	96
	defb	64
	defb	100
	defb	164
	defb	2
	defb	0
	defb	3
	defb	32
	defb	128
	defb	40
	defb	184
	defb	1
	defb	0
	defb	4
	defb	0
	defb	48
	defb	3
	defb	99
	defb	2
	defb	0
	defb	1
	defb	192
	defb	16
	defb	193
	defb	199
	defb	0
	defb	4
	defb	2
	defb	32
	defb	112
	defb	39
	defb	183
	defb	1
	defb	0
	defb	2
	defb	16
	defb	64
	defb	20
	defb	24
	defb	0
	defb	2
	defb	2
	defb	192
	defb	64
	defb	196
	defb	200
	defb	0
	defb	2
	defb	2
	defb	48
	defb	128
	defb	56
	defb	200
	defb	2
	defb	0
	defb	4
	defb	208
	defb	32
	defb	82
	defb	210
	defb	-2
	defb	0
	defb	2
	defb	160
	defb	112
	defb	71
	defb	167
	defb	-1
	defb	0
	defb	2
	defb	176
	defb	48
	defb	179
	defb	211
	defb	1
	defb	0
	defb	1
	defb	80
	defb	16
	defb	81
	defb	83
	defb	0
	defb	1
	defb	2
	defb	96
	defb	48
	defb	99
	defb	195
	defb	2
	defb	0
	defb	3
	defb	16
	defb	96
	defb	22
	defb	198
	defb	2
	defb	0
	defb	2
	defb	96
	defb	128
	defb	104
	defb	168
	defb	1
	defb	0
	defb	1
	defb	192
	defb	32
	defb	98
	defb	194
	defb	-2
	defb	0
	defb	4
	defb	64
	defb	128
	defb	56
	defb	72
	defb	-1
	defb	0
	defb	3
	defb	208
	defb	80
	defb	114
	defb	213
	defb	-1
	defb	-1
	defb	2
	defb	96
	defb	48
	defb	19
	defb	103
	defb	-1
	defb	1
	defb	2
	defb	224
	defb	48
	defb	99
	defb	227
	defb	-1
	defb	0
	defb	2
	defb	16
	defb	112
	defb	19
	defb	87
	defb	1
	defb	-1
	defb	2
	defb	176
	defb	80
	defb	101
	defb	181
	defb	-1
	defb	0
	defb	1
	defb	0
	defb	128
	defb	8
	defb	184
	defb	1
	defb	0
	defb	4
	defb	48
	defb	48
	defb	19
	defb	51
	defb	-2
	defb	0
	defb	1
	defb	32
	defb	96
	defb	38
	defb	102
	defb	1
	defb	0
	defb	3
	defb	128
	defb	16
	defb	129
	defb	133
	defb	0
	defb	1
	defb	2
	defb	192
	defb	32
	defb	194
	defb	198
	defb	0
	defb	1
	defb	2
	defb	80
	defb	112
	defb	39
	defb	87
	defb	-1
	defb	0
	defb	2
	defb	80
	defb	16
	defb	33
	defb	81
	defb	-1
	defb	0
	defb	2
	defb	192
	defb	48
	defb	195
	defb	199
	defb	0
	defb	2
	defb	1
	defb	192
	defb	96
	defb	54
	defb	198
	defb	-2
	defb	0
	defb	2
	defb	80
	defb	48
	defb	83
	defb	147
	defb	1
	defb	0
	defb	2
	defb	0
	defb	128
	defb	8
	defb	232
	defb	1
	defb	0
	defb	4
	defb	32
	defb	112
	defb	39
	defb	199
	defb	1
	defb	0
	defb	2
	defb	176
	defb	32
	defb	66
	defb	178
	defb	-2
	defb	0
	defb	2
	defb	0
	defb	128
	defb	8
	defb	104
	defb	1
	defb	0
	defb	4
	defb	128
	defb	112
	defb	135
	defb	199
	defb	1
	defb	0
	defb	2
	defb	176
	defb	32
	defb	178
	defb	199
	defb	1
	defb	1
	defb	2
	defb	176
	defb	64
	defb	68
	defb	180
	defb	-2
	defb	0
	defb	2
	defb	96
	defb	128
	defb	104
	defb	200
	defb	2
	defb	0
	defb	1
	defb	48
	defb	96
	defb	54
	defb	166
	defb	1
	defb	0
	defb	2
	defb	160
	defb	32
	defb	162
	defb	165
	defb	0
	defb	1
	defb	2
	defb	176
	defb	128
	defb	24
	defb	184
	defb	-2
	defb	0
	defb	1
	defb	112
	defb	128
	defb	56
	defb	120
	defb	-1
	defb	0
	defb	3
	defb	192
	defb	32
	defb	114
	defb	194
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	128
	defb	50
	defb	56
	defb	0
	defb	-1
	defb	4
	defb	96
	defb	128
	defb	104
	defb	152
	defb	1
	defb	0
	defb	2
	defb	192
	defb	128
	defb	195
	defb	200
	defb	0
	defb	-1
	defb	4
	defb	0
	defb	128
	defb	8
	defb	136
	defb	2
	defb	0
	defb	4
	defb	112
	defb	48
	defb	113
	defb	115
	defb	0
	defb	-1
	defb	4
	defb	144
	defb	96
	defb	38
	defb	150
	defb	-1
	defb	0
	defb	2
	defb	192
	defb	48
	defb	195
	defb	199
	defb	0
	defb	1
	defb	6
	defb	192
	defb	48
	defb	83
	defb	195
	defb	-1
	defb	0
	defb	7
	defb	112
	defb	48
	defb	115
	defb	120
	defb	0
	defb	1
	defb	5
	defb	80
	defb	32
	defb	82
	defb	162
	defb	1
	defb	0
	defb	7
	defb	64
	defb	32
	defb	66
	defb	71
	defb	0
	defb	1
	defb	6
	defb	80
	defb	64
	defb	84
	defb	88
	defb	0
	defb	1
	defb	6
	defb	96
	defb	48
	defb	99
	defb	179
	defb	1
	defb	0
	defb	7
	defb	64
	defb	128
	defb	72
	defb	136
	defb	1
	defb	0
	defb	7
	defb	80
	defb	32
	defb	82
	defb	87
	defb	0
	defb	1
	defb	5
	defb	192
	defb	128
	defb	195
	defb	200
	defb	0
	defb	-1
	defb	6
	defb	176
	defb	48
	defb	179
	defb	184
	defb	0
	defb	2
	defb	6
	defb	64
	defb	64
	defb	68
	defb	180
	defb	1
	defb	0
	defb	7
	defb	144
	defb	16
	defb	145
	defb	151
	defb	0
	defb	1
	defb	6
	defb	80
	defb	64
	defb	84
	defb	164
	defb	1
	defb	0
	defb	7
	defb	48
	defb	32
	defb	50
	defb	146
	defb	1
	defb	0
	defb	7
	defb	80
	defb	32
	defb	82
	defb	86
	defb	0
	defb	1
	defb	6
	defb	112
	defb	64
	defb	116
	defb	180
	defb	1
	defb	0
	defb	7
	defb	176
	defb	32
	defb	178
	defb	183
	defb	0
	defb	1
	defb	6
	defb	48
	defb	64
	defb	52
	defb	196
	defb	1
	defb	0
	defb	7
	defb	48
	defb	64
	defb	52
	defb	164
	defb	1
	defb	0
	defb	7
	defb	176
	defb	32
	defb	162
	defb	181
	defb	-1
	defb	1
	defb	6
	defb	255
	defs	1
	defs	1
	defs	1
	defs	1
	defs	1
	defs	1

;	SECTION	code

;	SECTION	text

._enoffs_index
	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	5

	defm	""
	defb	8

	defm	""
	defb	10

	defm	""
	defb	13

	defm	""
	defb	15

	defm	""
	defb	18

	defm	""
	defb	21

	defm	""
	defb	23

	defm	""
	defb	26

	defm	""
	defb	28

	defm	""
	defb	30

	defm	" #&(+-0358;>@BEGJLORTWZ\^adghi"
	defm	"jklnoqrstuvwxyz{||||||||||||||"
	defm	"||||||||"
;	SECTION	code


;	SECTION	text

._hotspots
	defb	136
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	88
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	135
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	120
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	216
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	102
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	113
	defb	1
	defb	0
	defb	166
	defb	1
	defb	0
	defb	184
	defb	1
	defb	0
	defb	193
	defb	1
	defb	0
	defb	199
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	168
	defb	1
	defb	0
	defb	18
	defb	1
	defb	0
	defb	39
	defb	2
	defb	0
	defb	216
	defb	1
	defb	0
	defb	24
	defb	1
	defb	0
	defb	214
	defb	1
	defb	0
	defb	35
	defb	1
	defb	0
	defb	35
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	184
	defb	1
	defb	0
	defb	134
	defb	1
	defb	0
	defb	102
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	146
	defb	1
	defb	0
	defb	102
	defb	1
	defb	0
	defb	97
	defb	1
	defb	0
	defb	165
	defb	1
	defb	0
	defb	210
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	70
	defb	1
	defb	0
	defb	134
	defb	2
	defb	0
	defb	34
	defb	3
	defb	0
	defb	23
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	82
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	146
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	82
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	120
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	135
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	120
	defb	3
	defb	0
	defb	86
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0

;	SECTION	code


._player_custom_veng
	ld a, (_n_pant)
	cp 40
	jr c, player_movement_ninnin
	cp 60
	jp c, player_movement_dx_swim
	.player_movement_ninnin
	ld a, (_player + 26)
	or a
	jr z, m_vert_jump_down_done
	ld a, (_pad0)
	and 0x08
	ld a, 0
	jr nz, m_vert_jump_down_done
	ld hl, 64*2
	ld (_player + 8), hl
	inc a
	.m_vert_jump_down_done
	ld (_disable_collide_platform), a
	.player_veng_gravity
	ld hl, (_player + 8)
	ld de, 32
	ld a, (_player + 19)
	or a
	jr z, player_veng_gravity_add
	ld de, 16
	.player_veng_gravity_add
	add hl, de
	push hl
	ld de, -512
	add hl, de
	bit 7, h
	pop hl
	jr nz, player_veng_gravity_done
	ld hl, 512
	.player_veng_gravity_done
	ld (_player + 8), hl
	.player_jump_start
	ld a, (_pad_this_frame)
	and #(0x04 | 0x10)
	cp #(0x04 | 0x10)
	jr z, player_jump_start_done
	ld a, (_player + 19)
	or a
	jr nz, player_jump_start_done
	ld a, (_player + 26)
	or a
	jr nz, player_jump_start_do
	ld a, (_player + 25)
	or a
	jr z, player_jump_start_done
	.player_jump_start_do
	xor a
	ld (_player + 14), a
	inc a
	ld (_player + 19), a
	ld (_player + 43), a
	ld hl, -384
	ld (_player + 8), hl
	ld l, 3
	call _peta_el_beeper
	.player_jump_start_done
	.player_jump_pressing
	ld a, (_pad0)
	and #(0x04 | 0x10)
	cp #(0x04 | 0x10)
	jr z, player_jump_not_pressing
	ld a, (_player + 19)
	or a
	jr z, player_jump_done
	ld a, (_player + 14)
	inc a
	ld (_player + 14), a
	cp 8
	jr nz, player_jump_done
	xor a
	ld (_player + 19), a
	jr player_jump_done
	.player_jump_not_pressing
	ld a, (_player + 19)
	or a
	jr z, player_jump_done
	ld hl, -192
	ld (_player + 8), hl
	xor a
	ld (_player + 19), a
	.player_jump_done
	ret
	.player_movement_dx_swim
	.swim_check_idle
	ld a, (_pad0)
	and #(0x08 | 0x04)
	cp #(0x08 | 0x04)
	jr nz, swim_no_idle
	ld hl, (_player + 2)
	ld a, h
	cp 2
	jr c, swim_float_end
	ld hl, (_player + 8)
	ld de, #(-8);
	add hl, de
	ld de, #(112 * 2)
	call l_gt
	jr nc, swim_float_vy_set
	ld hl, #(-(112 / 2))
	.swim_float_vy_set
	ld (_player + 8), hl
	.swim_float_end
	xor a
	ld (_thrusting), a
	.swim_no_idle
	ld a, (_pad0)
	and 0x08
	jr nz, swim_down_done
	.swim_down
	ld hl, (_player + 8)
	ld de, 112
	call l_gt
	jr nc, swim_down_done
	ld de, 40
	add hl, de
	ld (_player + 8), hl
	.swim_down_done
	ld a, (_pad0)
	and 0x04
	jr nz, swim_up_done
	.swim_up
	ld hl, (_player + 8)
	ld de, #(-112)
	call l_lt
	jr nc, swim_up_done
	ld de, #(-40)
	add hl, de
	ld (_player + 8), hl
	.swim_up_done
	ret



._player_custom_frame
	ld a, (_n_pant)
	cp 40
	jr c, _player_custom_frame_walk
	cp 60
	jp c, _player_custom_frame_swim
	._player_custom_frame_walk
	ld c, 3
	ld a, (_player + 26)
	ld b, a
	ld a, (_player + 25)
	or b
	jr z, m_frame_set
	.m_frame_on_something
	ld a, (_thrusting)
	or a
	jr z, m_frame_still
	ld hl, (_player + 6)
	ld a, h
	or l
	jr z, m_frame_still
	ld a, (_gpx)
	srl a
	srl a
	srl a
	and 3
	ld h, 0
	ld l, a
	ld de, _player_walk_cycle
	add hl, de
	ld c, (hl)
	jr m_frame_set
	.m_frame_still
	ld c, 1
	.m_frame_set
	ld a, (_player + 22)
	add c
	ld l, a
	ld h, 0
	ret
	._player_custom_frame_swim
	ld c, 8
	ld a, (_thrusting)
	or a
	jr z, m_frame_set
	ld a, (_maincounter)
	srl a
	srl a
	srl a
	and 3
	ld h, 0
	ld l, a
	ld de, _player_walk_cycle
	add hl, de
	ld a, (hl)
	add c
	ld c, a
	jr m_frame_set
	ret



._custom_bg_hit
	ld hl, 0
	ld a, (_n_pant)
	cp 40
	jr c, _player_custom_pinch_walk
	cp 60
	jp c, _player_custom_pinch_swim
	._player_custom_pinch_walk
	ld a, (_hit_v)
	or a
	ret z
	ld hl, #(-(320 / 2))
	ld (_player + 8), hl
	ld hl, 1
	ret
	._player_custom_pinch_swim
	ld a, (_hit_v)
	ld c, a
	ld a, (_hit_h)
	or c
	ret z
	.m_evil_tile_hit_do
	ld a, (_rdi)
	or a
	jr z, m_evil_tile_hit_v
	.m_evil_tile_hit_h
	ld hl, (_pvx_total)
	call l_neg
	ld (_player + 6), hl
	ld hl, 1
	ret
	.m_evil_tile_hit_v
	ld hl, (_pvy_total)
	call l_neg
	ld (_player + 8), hl
	ld hl, 1
	ret
	ret



._extra_enems_init
	ld a, (__en_t)
	cp 5
	ret c
	cp 9
	ret nc
	ld h, 0
	ld l, a
	dec hl
	jp _enems_en_an_calc
	ret



._extra_enems_move
	ld a, (__en_t)
	cp 5
	ret c
	cp 8
	ret nc
	call en_lineal_do
	ld a, (__en_t)
	cp 7
	ret nz
	ld a, (__en_mx)
	bit 7, a
	jr nz, enm_turn_around
	ld a, (__en_my)
	bit 7, a
	ret z
	.enm_turn_around
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, _en_an_next_frame
	add hl, bc
	push hl
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	ld hl, _en_an_base_frame
	add hl, bc
	add a, (hl)
	add 2
	sla a
	ld c, a
	ld hl, _sprite_cells
	add hl, bc
	pop de
	ldi
	ldi
	ret



._extra_enems_checks
	ret



._extra_enems_killed
	ret



._this_enemy_kills
	ld	hl,1 % 256	;const
	ret


	;BeepFX player by Shiru
	;You are free to do whatever you want with this code
	.shiruplay
	ld hl,sfxData ;address of sound effects data
	di
	ld b, 0xf4
	ld d, 9
	out (c), d
	ld bc, 0xf6c0
	out (c), c
	ld c, 0
	out (c), c
	ld bc, 0xf680
	out (c), c
	push ix
	push iy
	ld b,0
	ld c,a
	add hl,bc
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	push de
	pop ix ;put it into ix
	.readData
	ld a,(ix+0) ;read block type
	ld c,(ix+1) ;read duration 1
	ld b,(ix+2)
	ld e,(ix+3) ;read duration 2
	ld d,(ix+4)
	push de
	pop iy
	cp 3
	jr z,sfxRoutineSample
	pop iy
	pop ix
	ld b,0xf5
	.wait_vsync_s
	in a,(c)
	rra
	jp nc,wait_vsync_s
	xor a
	ld (isr_c1), a
	ei
	ret
	;play sample
	.sfxRoutineSample
	ex de,hl
	.sfxRS0
	ld e,8 ;7
	ld d,(hl) ;7
	inc hl ;6
	.sfxRS1
	ld a,(ix+5) ;19
	.sfxRS2
	dec a ;4
	jr nz,sfxRS2 ;7/12
	rl d ;8
	sbc a,a ;4
	and 0xf ;7 A = 0/15
	push bc ;11
	ld b, 0xf4 ;7
	out (c), a ;12
	pop bc
	dec e ;4
	jp nz,sfxRS1 ;10=88t
	dec bc ;6
	ld a,b ;4
	or c ;4
	jp nz,sfxRS0 ;10=132t
	ld c,6
	.nextData
	add ix,bc ;skip to the next block
	jr readData
	.sfxData
	.SoundEffectsData
	defw SoundEffect0Data
	defw SoundEffect1Data
	.SoundEffect0Data
	defb 3 ;sample
	defw 740
	defw Sample0Data+0
	defb 38
	defb 0
	.SoundEffect1Data
	defb 3 ;sample
	defw 1043
	defw Sample1Data+0
	defb 32
	defb 0
	.Sample0Data
	defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	defb 255,255,255,255,255,255,255,255,255,255,255,255,255,253,223,255
	defb 255,255,251,253,255,122,215,239,253,253,95,251,253,127,253,127
	defb 255,255,245,235,245,127,253,255,247,255,239,127,250,255,125,87
	defb 255,122,254,165,191,94,87,213,222,181,214,255,107,127,234,191
	defb 239,235,127,245,255,181,181,173,95,125,173,191,45,95,237,191
	defb 237,254,250,218,215,181,191,237,47,222,191,171,126,183,178,223
	defb 87,93,150,214,219,255,191,182,223,255,5,255,101,167,187,224
	defb 239,31,15,248,7,249,32,254,3,254,12,63,192,63,233,127
	defb 63,240,31,169,234,95,224,63,169,3,254,1,255,104,31,240
	defb 15,235,64,127,128,63,173,3,255,1,255,24,15,254,3,254
	defb 52,15,252,3,250,26,135,254,1,254,143,67,255,0,255,129
	defb 240,127,224,63,240,124,15,244,7,252,7,225,255,64,255,193
	defb 126,31,248,15,254,23,193,254,129,255,213,248,31,240,15,252
	defb 171,192,255,128,255,235,220,31,248,15,253,254,128,255,0,255
	defb 252,15,255,15,255,255,255,255,255,255,255,254,159,255,232,119
	defb 248,31,224,255,199,127,160,63,224,7,255,128,63,240,15,31
	defb 240,1,254,7,135,236,120,63,15,131,251,254,15,135,131,237
	defb 223,7,199,135,206,207,135,195,195,231,227,227,225,225,231,187
	defb 227,227,225,227,187,225,241,225,243,241,241,248,248,255,59,225
	defb 248,248,127,167,193,248,127,31,255,195,255,143,255,255,129,255
	defb 135,255,255,131,255,135,255,254,15,254,7,255,240,127,240,31
	defb 255,7,255,1,255,224,255,192,127,240,126,15,63,192,252,62
	defb 127,131,240,241,252,31,15,159,193,240,241,252,63,30,31,131
	defb 227,225,248,126,124,63,15,199,143,225,241,241,252,126,60,63
	defb 15,135,135,193,240,240,248,62,15,252,15,248,255,240,254,15
	defb 252,63,231,255,159,241,255,71,255,255,31,255,255,15,255,255
	defb 15,251,254,15,255,252,31,255,240,63,255,192,253,255,3,247
	defb 220,63,62,225,125,247,31,207,48,254,251,143,207,129,248,248
	defb 63,31,7,225,240,252,126,31,143,131,225,240,124,62,15,143
	defb 195,225,240,124,126,31,31,199,143,241,227,204,113,230,56,113
	defb 142,56,199,28,115,143,25,199,140,243,199,121,227,184,225,252
	defb 241,252,120,254,120,222,120,222,60,111,60,111,60,63,30,63
	defb 158,55,158,55,142,27,143,27,207,27,199,15,199,141,231,141
	defb 227,140,227,140,243,198,113,199,57,231,60,243,28,115,158,113
	defb 142,57,143,57,199,159,199,207,225,231,248,243,248,121,252,30
	defb 126,7,127,3,189,137,223,228,103,242,51,249,29,221,131,255
	defb 193,223,240,55,252,14,255,131,191,226,110,252,77,191,19,183
	defb 226,126,252,7,255,192,127,248,7,255,128,127,248,7,255,192
	defb 126,252,19,247,228,159,191,100,253,251,19,247,252,95,239,241
	defb 191,151,194,127,79,230,254,31,230,254,63,199,255,63,225,255
	defb 15,244,255,131,252,63,224,255,39,248,63,193,255,7,252,31
	defb 240,127,193,255,131,252,15,248,31,224,63,224,127,192,255,192
	defb 255,129,255,192,255,192,255,192,127,248,31,252,31,255,243,255
	defb 246,255,255,255,255,242,255,255,255,159,255,31,255,255,255,255
	defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	defb 255,255,255,253
	.Sample1Data
	defb 255,255,255,255,255,255,255,250,239,131,248,7,254,7,255,15
	defb 225,255,240,15,255,255,193,255,5,255,248,255,0,0,31,255
	defb 255,255,225,254,0,128,127,255,247,254,31,192,0,15,255,255
	defb 255,240,63,0,120,31,255,255,255,192,252,3,224,255,255,255
	defb 255,131,240,7,195,255,255,255,255,1,240,7,195,255,255,255
	defb 255,7,224,15,7,255,255,255,255,7,255,252,0,0,127,255
	defb 255,255,191,224,2,3,255,255,255,255,254,0,32,63,255,255
	defb 255,63,224,2,1,255,255,255,247,254,0,0,31,255,255,255
	defb 191,240,0,1,255,255,255,255,255,128,4,7,255,255,255,247
	defb 254,0,32,63,255,255,191,143,248,0,241,255,255,255,252,63
	defb 224,3,79,255,255,255,255,128,160,0,183,255,255,255,255,255
	defb 7,240,0,63,255,255,255,255,192,126,0,3,255,255,225,254
	defb 7,255,248,0,255,255,255,223,255,193,254,0,31,255,255,255
	defb 254,15,240,3,247,255,246,255,135,254,0,224,63,243,255,131
	defb 254,1,224,63,249,255,193,255,0,240,31,253,255,225,255,0
	defb 240,31,251,255,193,255,1,240,31,243,255,131,254,1,224,63
	defb 201,255,7,252,1,224,63,207,254,127,240,0,1,255,255,255
	defb 255,255,128,0,63,255,255,255,255,255,128,63,255,255,255,255
	defb 255,240,0,31,255,255,255,255,255,255,255,255,255,255,255,255
	defb 255,255,255,255,255,255,255,191,247,230,191,230,255,191,227,252
	defb 239,255,254,128,31,143,255,193,255,243,255,255,252,0,7,254
	defb 63,7,252,224,124,231,224,127,129,224,255,31,3,252,127,15
	defb 176,252,63,231,224,251,143,131,248,124,31,97,240,255,31,15
	defb 220,124,63,159,193,230,62,31,255,224,55,62,15,255,226,39
	defb 60,31,255,198,12,120,31,255,60,25,224,127,252,228,7,129
	defb 255,227,240,30,7,255,31,192,120,31,248,63,3,192,255,224
	defb 248,15,193,255,131,240,31,135,255,7,224,63,7,254,7,128
	defb 31,255,255,128,0,55,254,255,248,0,3,255,255,255,192,1
	defb 255,255,255,255,64,0,255,255,255,255,128,31,255,255,255,255
	defb 255,254,0,0,15,255,255,255,255,255,255,255,255,156,255,255
	defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,240,255
	defb 240,71,255,255,252,0,15,195,252,255,224,124,31,240,7,131
	defb 255,7,248,255,240,255,193,254,63,60,127,193,254,31,128,255
	defb 193,252,31,193,255,7,248,127,241,248,63,131,255,31,7,251
	defb 199,227,193,249,241,241,225,248,241,248,1,248,241,248,3,240
	defb 255,240,31,192,127,128,254,7,252,7,240,127,192,127,3,252
	defb 15,224,127,128,254,15,240,31,193,254,7,240,127,192,252,31
	defb 240,127,7,248,63,131,252,15,193,252,15,193,252,15,225,248
	defb 31,227,255,240,127,129,254,15,248,63,193,255,3,252,31,248
	defb 31,224,255,193,254,7,254,15,248,63,240,127,225,255,129,255
	defb 7,254,15,252,63,248,63,240,255,192,255,131,255,7,254,31
	defb 252,15,248,63,240,127,224,255,192,255,131,255,129,255,7,255
	defb 3,254,15,254,7,254,15,254,7,254,31,254,7,254,15,255
	defb 7,255,7,247,129,255,193,252,32,127,248,127,199,159,255,255
	defb 255,253,255,255,255,243,254,127,255,184,239,220,255,204,127,158
	defb 35,254,3,252,120,223,252,7,216,255,191,252,15,192,255,255
	defb 255,227,255,255,255,255,255,255,255,255,255,255,255,254,127,199
	defb 255,129,114,31,255,255,192,156,255,255,255,252,0,255,255,255
	defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	defb 255,255,255,255,255,255,255,255,255,255,191,111,255,255,255,255
	defb 255,127,251,255,255,255,192,127,248,15,248,3,255,0,255,192
	defb 127,248,31,252,7,255,1,255,224,31,248,31,255,128,255,192
	defb 126,254,3,255,1,251,248,7,254,3,247,244,15,252,7,230
	defb 248,15,248,7,231,248,31,248,7,246,252,15,252,3,242,252
	defb 7,254,1,251,126,7,255,0,254,223,129,255,128,127,127,224
	defb 127,224,31,205,248,31,252,3,253,127,3,255,128,255,39,224
	defb 127,240,15,242,252,7,255,0,255,7,224,63,240,15,252,63
	defb 129,255,192,63,224,252,7,255,1,254,131,248,31,252,3,252
	defb 15,224,127,248,7,240,31,248,1,254,15,254,143,243,255,128
	defb 15,240,127,240,127,223,254,0,127,131,255,195,254,255,240,1
	defb 254,15,254,15,255,255,192,7,252,127,248,63,207,255,0,31
	defb 224,255,224,255,191,252,0,127,195,255,193,254,127,248,0,255
	defb 135,255,193,254,255,248,1,255,7,255,131,254,127,240,1,255
	defb 7,255,193,255,63,252,1,255,195,255,192,255,199,255,0,63
	defb 248,255,252,127,248,127,224,3,255,159,255,207,255,239,255,0
	defb 15,255,253
	.HLshr6_A
	sla h
	sla h
	ld a, l
	rlca
	rlca
	and 0x03
	or h
	ret
	.Ashl16_HL
	ld l, 0
	ld h, a
	srl h
	rr l
	srl h
	rr l
	ret
	.withSign
	bit 7, a
	ret z
	ld a, $C0
	or h
	ld h, a
	ret
	._abs_a
	bit 7, a
	ret z
	neg
	ret
;	SECTION	text

._player_walk_cycle
	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	1

;	SECTION	code



._qtile
	ld hl, 4
	add hl, sp
	ld c, (hl)
	dec hl
	dec hl
	ld a, (hl)
	.qtile_do
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	add c
	ld d, 0
	ld e, a
	ld hl, _map_buff
	add hl, de
	ld l, (hl)
	ld h, 0
	ret



._attr
	ld hl, 4
	add hl, sp
	ld c, (hl)
	dec hl
	dec hl
	ld a, (hl)
	._attr_2
	cp 10
	jr c, _attr_1
	ld hl, 0
	ret
	._attr_1
	ld b, a
	ld a, c
	cp 15
	jr c, _attr_1b
	ld hl, 0
	ret
	._attr_enems
	cp 10
	jr c, _attr_enems_skip_1
	ld hl, 8
	ret
	._attr_enems_skip_1
	ld b, a
	ld a, c
	cp 15
	jr c, _attr_1b
	ld hl, 8
	ret
	._attr_1b
	ld a, b
	sla a
	sla a
	sla a
	sla a
	sub b
	add c
	ld d, 0
	ld e, a
	ld hl, _map_attr
	add hl, de
	ld l, (hl)
	._attr_end
	ld h, 0
	ret



._collide_enem
	ld hl, 0
	ld a, (_gpx)
	ld c, a
	ld a, (__en_x)
	add 12
	cp c
	ret c
	ld a, (__en_x)
	ld c, a
	ld a, (_gpx)
	add 12
	cp c
	ret c
	ld a, (_gpy)
	ld c, a
	ld a, (__en_y)
	add 12
	cp c
	ret c
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 12
	cp c
	ret c
	ld l, 1
	ret



._rand
	.rand16
	ld hl, _seed
	ld a, (hl)
	ld e, a
	inc hl
	ld a, (hl)
	ld d, a
	ld a, d
	ld h, e
	ld l, 253
	or a
	sbc hl, de
	sbc a, 0
	sbc hl, de
	ld d, 0
	sbc a, d
	ld e, a
	sbc hl, de
	jr nc, nextrand
	inc hl
	.nextrand
	ld d, h
	ld e, l
	ld hl, _seed
	ld a, e
	ld (hl), a
	inc hl
	ld a, d
	ld (hl), a
	ld l, e
	ld h, 0
	ret



._abs
	bit 7, h
	ret z
	call l_neg
	ret



._check_and_clear_cerrojo
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,15	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_29
	ld	hl,_player+28
	call	l_gchar
	ld	a,h
	or	l
	jr	nz,i_30_i_29
.i_29
	jp	i_28
.i_30_i_29
	xor a
	ld (__t), a
	ld a, (_comportamiento_tiles) ;; beh [0]
	ld (__n), a
	ld a, (_rdx)
	ld (__x), a
	ld c, a
	ld a, (_rdy)
	ld (__y), a
	call set_map_tile_do
	ld b, 2
	ld hl, _cerrojos
	.clear_cerrojo_loop
	ld c, (hl)
	inc hl
	ld d, (hl)
	inc hl
	ld e, (hl)
	inc hl
	ld a, (_n_pant)
	cp c
	jr nz, clear_cerrojo_loop_continue
	ld a, (_rdx)
	cp d
	jr nz, clear_cerrojo_loop_continue
	ld a, (_rdy)
	cp e
	jr nz, clear_cerrojo_loop_continue
	xor a
	ld (hl), a
	jr clear_cerrojo_loop_done
	.clear_cerrojo_loop_continue
	inc hl
	djnz clear_cerrojo_loop
	.clear_cerrojo_loop_done
	ld	hl,_player+28
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
.i_28
	ret



._init_cerrojos
	ld b, 2
	ld hl, _cerrojos + 3
	ld de, 4
	ld a, 1
	.init_cerrojos_loop
	ld (hl), a
	add hl, de
	djnz init_cerrojos_loop
	ret



._init_malotes
	ld bc, 124
	ld de, 7
	ld ix, _malotes
	.init_malotes_loop
	ld a, (ix+6)
	and 127
	ld (ix+6), a
	add ix, de
	dec bc
	ld a, b
	or c
	jr nz, init_malotes_loop
	ret



._player_flicker
	ld a, 2
	ld (_player + 23), a
	ld a, 50
	ld (_player + 24), a
	ret



._cm_two_points
	ld a, (_cx1)
	cp 15
	jr nc, _cm_two_points_at1_reset
	ld a, (_cy1)
	cp 10
	jr c, _cm_two_points_at1_do
	._cm_two_points_at1_reset
	xor a
	jr _cm_two_points_at1_done
	._cm_two_points_at1_do
	ld a, (_cy1)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (_cx1)
	add b
	ld e, a
	ld d, 0
	ld hl, _map_attr
	add hl, de
	ld a, (hl)
	._cm_two_points_at1_done
	ld (_at1), a
	ld a, (_cx2)
	cp 15
	jr nc, _cm_two_points_at2_reset
	ld a, (_cy2)
	cp 10
	jr c, _cm_two_points_at2_do
	._cm_two_points_at2_reset
	xor a
	jr _cm_two_points_at2_done
	._cm_two_points_at2_do
	ld a, (_cy2)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (_cx2)
	add b
	ld e, a
	ld d, 0
	ld hl, _map_attr
	add hl, de
	ld a, (hl)
	._cm_two_points_at2_done
	ld (_at2), a
	ret



._check_lock_or_box_horz
	ld a, (_pad_this_frame)
	and 0x10
	ret nz
	ld a, (_cx1)
	ld (_rdx), a
	ld c, a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_rdy), a
	call qtile_do
	ld a, l
	ld (_rda), a
	ld a, (_rda)
	cp 15
	jr nz, lock_horz_done
	call _check_and_clear_cerrojo
	.lock_horz_done
	ret



._check_lock_or_box_vert
	ld a, (_pad_this_frame)
	and 0x10
	ret nz
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_rdx), a
	ld c, a
	ld a, (_cy1)
	ld (_rdy), a
	call qtile_do
	ld a, l
	ld (_rda), a
	ld a, (_rda)
	cp 15
	jr nz, lock_vert_done
	call _check_and_clear_cerrojo
	.lock_vert_done
	ret



._move
	xor a
	ld (_hit_h), a
	ld (_hit_v), a
	ld (_thrusting), a
	ld (_wall), a
	call _pad_read
	call	_player_custom_veng
	ld hl, (_player + 8)
	ex de, hl
	ld hl, (_player + 2)
	add hl, de
	bit 7, h
	jr z, m_vert_thrust_notneg
	ld hl, 0
	jr m_vert_thurst_write
	.m_vert_thrust_notneg
	ld de, 144*64
	call l_lt
	jr nc, m_vert_thurst_write
	ex de, hl
	.m_vert_thurst_write
	ld (_player + 2), hl
	call HLshr6_A
	ld (_gpy), a
	and 15
	cp 8
	jr c, m_vert_jd_disable_done
	xor a
	ld (_disable_collide_platform), a
	.m_vert_jd_disable_done
	ld a, (_gpx)
	ld c, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_cx1), a
	ld a, c
	add 11
	srl a
	srl a
	srl a
	srl a
	ld (_cx2), a
	ld hl, (_ptgmy)
	ex de, hl
	ld hl, (_player + 8)
	add hl, de
	ld (_pvy_total), hl
	ld a, h
	or l
	jp z, m_vert_coll_done
	.m_vert_coll_do
	bit 7, h
	jr nz, m_vert_coll_up
	.m_vert_coll_down
	ld a, (_gpy)
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (_cy1), a
	ld (_cy2), a
	call _cm_two_points
	ld c, 12
	ld a, (_disable_collide_platform)
	or a
	jr z, jump_down_platform_done
	ld c, 8
	.jump_down_platform_done
	ld a, (_at1)
	and c
	jr nz, m_vert_coll_down_adjust
	ld a, (_at2)
	and c
	jp z, m_vert_coll_checks_done
	.m_vert_coll_down_adjust
	call _check_lock_or_box_vert
	ld hl, 0
	.m_vert_coll_down_set_vy
	ld (_player + 8), hl
	ld a, (_gpy)
	and 0xf0
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	ld a, 8
	ld (_wall), a
	jr m_vert_coll_checks_done
	.m_vert_coll_up
	ld a, (_gpy)
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_cy1), a
	ld (_cy2), a
	call _cm_two_points
	ld a, (_at1)
	and 8
	jr nz, m_vert_coll_up_adjust
	ld a, (_at2)
	and 8
	jr z, m_vert_coll_checks_done
	.m_vert_coll_up_adjust
	call _check_lock_or_box_vert
	ld hl, 0
	.m_vert_coll_up_set_vy
	ld (_player + 8), hl
	ld a, (_gpy)
	and 0xf0
	add 12
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	ld a, 4
	ld (_wall), a
	.m_vert_coll_checks_done
	ld a, (_at1)
	and 1
	jr nz, m_vert_coll_sethit
	ld a, (_at2)
	and 1
	jr z, m_vert_coll_done
	.m_vert_coll_sethit
	ld a, (_at1)
	cp 4
	jr z, m_vert_coll_done
	cp 8
	jr z, m_vert_coll_done
	ld a, (_at2)
	cp 4
	jr z, m_vert_coll_done
	cp 8
	jr z, m_vert_coll_done
	ld a, 1
	ld (_hit_v), a
	.m_vert_coll_done
	ld a, (_gpy)
	add 16
	srl a
	srl a
	srl a
	srl a
	ld (_cy1), a
	ld (_cy2), a
	call _cm_two_points
	ld a, (_at1)
	and 12
	jr nz, m_vert_set_possee
	ld a, (_at2)
	and 12
	jr nz, m_vert_set_possee
	xor a
	jr m_vert_set_possee_write
	.m_vert_set_possee
	ld a, 1
	.m_vert_set_possee_write
	ld (_player + 26), a
	ld a, (_pad0)
	ld c, a
	and 0x01
	jr z, m_horz_kp_left_or_right_p
	ld a, c
	and 0x02
	jr z, m_horz_kp_left_or_right_p
	ld hl, (_player + 6)
	ld a, h
	or l
	jr z, m_horz_kp_done
	bit 7, h
	jr nz, m_horz_kp_rx_negative
	.m_horz_kp_rx_positive
	ld de, -32
	add hl, de
	bit 7, h
	jr z, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_rx_negative
	ld de, 32
	add hl, de
	bit 7, h
	jr nz, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_left_or_right_p
	ld a, c
	and 0x01
	jr nz, m_horz_kp_left_done
	.m_horz_kp_left_do
	ld a, 1
	ld (_thrusting), a
	ld de, -24
	ld hl, (_player + 6)
	add hl, de
	ld de, -192
	call l_gt
	jr nc, m_horz_kp_left_facing
	ex de, hl
	.m_horz_kp_left_facing
	ld a, 4
	ld (_player + 22), a
	jr m_horz_kp_vx_write
	.m_horz_kp_left_done
	ld a, c
	and 0x02
	jr nz, m_horz_kp_right_done
	.m_horz_kp_right_do
	ld a, 2
	ld (_thrusting), a
	ld de, 24
	ld hl, (_player + 6)
	add hl, de
	ld de, 192
	call l_lt
	jr nc, m_horz_kp_right_facing
	ex de, hl
	.m_horz_kp_right_facing
	ld a, 0
	ld (_player + 22), a
	.m_horz_kp_right_done
	.m_horz_kp_vx_write
	ld (_player + 6), hl
	.m_horz_kp_done
	ld hl, (_player + 6)
	ex de, hl
	ld hl, (_player + 0)
	add hl, de
	ex de, hl
	ld hl, (_ptgmx)
	add hl, de
	bit 7, h
	jr z, m_horz_thrust_notneg
	ld hl, 0
	jr m_horz_thurst_write
	.m_horz_thrust_notneg
	ld de, 224*64
	call l_lt
	jr nc, m_horz_thurst_write
	ex de, hl
	.m_horz_thurst_write
	ld (_player + 0), hl
	call HLshr6_A
	ld (_gpx), A
	ld hl, (_ptgmx)
	ex de, hl
	ld hl, (_player + 6)
	add hl, de
	ld (_pvx_total), hl
	ld a, h
	or l
	jp z, m_horz_coll_done
	.m_horz_coll_do
	ld a, (_gpy)
	ld c, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_cy1), a
	ld a, c
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (_cy2), a
	bit 7, h
	jr nz, m_horz_coll_left
	.m_horz_coll_right
	ld a, (_gpx)
	add 12
	srl a
	srl a
	srl a
	srl a
	ld (_cx1), a
	ld (_cx2), a
	call _cm_two_points
	ld a, (_at1)
	and 8
	jr nz, m_horz_coll_right_adjust
	ld a, (_at2)
	and 8
	jp z, m_horz_coll_checks_done
	.m_horz_coll_right_adjust
	call _check_lock_or_box_horz
	ld hl, 0
	.m_vert_coll_right_set_vy
	ld (_player + 6), hl
	ld a, (_gpx)
	and 0xf0
	add 4
	ld (_gpx), a
	call Ashl16_HL
	ld (_player + 0), HL
	ld a, 2
	ld (_wall), a
	jr m_horz_coll_checks_done
	.m_horz_coll_left
	ld a, (_gpx)
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_cx1), a
	ld (_cx2), a
	call _cm_two_points
	ld a, (_at1)
	and 8
	jr nz, m_horz_coll_left_adjust
	ld a, (_at2)
	and 8
	jr z, m_horz_coll_checks_done
	.m_horz_coll_left_adjust
	call _check_lock_or_box_horz
	ld hl, 0
	.m_vert_coll_left_set_vy
	ld (_player + 6), hl
	ld a, (_gpx)
	and 0xf0
	add 12
	ld (_gpx), a
	call Ashl16_HL
	ld (_player + 0), HL
	ld a, 1
	ld (_wall), a
	.m_horz_coll_checks_done
	ld a, (_at1)
	and 1
	jr nz, m_horz_coll_sethit
	ld a, (_at2)
	and 1
	jr z, m_horz_coll_done
	.m_horz_coll_sethit
	ld a, 1
	ld (_hit_h), a
	.m_horz_coll_done
	ld hl, (_pvx_total)
	call _abs
	ex de, hl
	ld hl, (_pvy_total)
	call _abs
	call l_gt
	rl a
	and 1
	ld (_rdi), a
	call _custom_bg_hit
	xor a
	or l
	jr z, m_evil_tile_hit_done
	.m_evil_tile_vel_set
	ld a, (_player + 23)
	or a
	jr nz, m_evil_tile_hit_done
	ld l, 2
	call _peta_el_beeper
	ld a, 1
	ld (_player + 46), a
	ld a, 1
	ld (_player + 36), a
	.m_evil_tile_hit_done
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld (_tpx), a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_tpy), a
	call _attr_2
	ld a, l
	ld (_tat), a
	and 128
	jr z, nospecial
	ld hl, 5
	call _script
	.nospecial
	ld	hl,_player+20
	push	hl
	call	_player_custom_frame
	pop	de
	ld	a,l
	ld	(de),a
	ld hl, (_player + 20)
	ld h, 0
	add hl, hl
	ld de, _sprite_cells
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (_player + 17), hl
	ret



._shl_player_coords
	ld a, (_gpx)
	call Ashl16_HL
	ld (_player), hl
	ld a, (_gpy)
	call Ashl16_HL
	ld (_player + 2), hl
	ret



._init_player_values
	ld	a,#(32 % 256 % 256)
	ld	(_gpx),a
	ld	hl,112 % 256	;const
	ld	a,l
	ld	(_gpy),a
	call _shl_player_coords
	ld hl, 0
	ld (_player + 6), hl
	ld (_player + 8), hl
	xor a
	ld (_player + 19), a
	ld (_player + 20), a
	ld (_player + 23), a
	ld (_player + 24), a
	ld (_player + 36), a
	ld (_player + 22), a
	ret



._init_player
	call	_init_player_values
	ld hl, 20
	ld (_player + 29), hl
	xor a
	ld (_player + 27), a
	ld (_player + 28), a
	ld (_player + 32), a
	ret



._init_hotspots
	ld b, 20 * 4
	ld hl, _hotspots + 2
	ld de, 3
	ld a, 1
	.init_hotspots_loop
	ld (hl), a
	add hl, de
	djnz init_hotspots_loop
	ret



._draw_and_advance
	ld bc, (__n)
	ld b, 0
	ld hl, _comportamiento_tiles
	add hl, bc
	ld a, (hl)
	ld bc, (_rdi)
	ld b, 0
	ld hl, _map_attr
	add hl, bc
	ld (hl), a
	ld hl, _map_buff
	add hl, bc
	ld a, (__n)
	ld (hl), a
	ld a, (_rdx)
	add 1
	ld h, 0
	ld l, a
	push hl
	ld a, (_rdy)
	add 4
	ld h, 0
	ld l, a
	push hl
	ld hl, (__n)
	ld h, 0
	push hl
	call _draw_coloured_tile
	pop bc
	pop bc
	pop bc
	ld a, (_rdx)
	add 2
	cp 30
	jr nz, draw_and_advance_x_set
	ld a, (_rdy)
	add 2
	ld (_rdy), a
	xor a
	.draw_and_advance_x_set
	ld (_rdx), a
	ld hl, _rdi
	inc (hl)
	ret



._calc_hotspot_ptr
	ld hl, (_n_pant)
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	ex de, hl
	ret



._hotspot_paint
	ld a, 240
	ld (_hotspot_y), a
	xor a
	ld (_hotspot_t_r), a
	ld a, (_scenery_info + 0)
	or a
	ret nz
	call _calc_hotspot_ptr
	ld ix, _hotspots
	add ix, de
	ld a, (ix+2)
	cp 1
	jr nz, hotspot_paint_act_skip
	ld a, (ix+1)
	or a
	jr z, hotspot_paint_act_skip
	ld (_hotspot_t_r), a
	.hotspot_paint_act_skip
	ld a, (ix+2)
	or a
	jr nz, hotspot_paint_noact_skip
	call _rand
	ld a, l
	and 3
	cp 2
	jr nz, hotspot_paint_noact_skip
	ld a, 3
	ld (_hotspot_t_r), a
	.hotspot_paint_noact_skip
	ld a, (_hotspot_t_r)
	or a
	ret z
	ld a, (ix+0)
	ld b, a
	and 0xf0
	ld (_hotspot_x), a
	srl a
	srl a
	srl a
	srl a
	ld (_rdx), a
	ld e, a
	ld a, b
	and 15
	ld (_rdy), a
	ld b, a
	sla a
	sla a
	sla a
	sla a
	ld (_hotspot_y), a
	sub b
	add e
	ld c, a
	ld b, 0
	ld hl, _map_buff
	add hl, bc
	ld a, (hl)
	ld (_orig_tile), a
	ld a, (_rdx)
	sla a
	add 1
	ld (__x), a
	ld a, (_rdy)
	sla a
	add 4
	ld (__y), a
	ld a, (_hotspot_t_r)
	ld b, a
	cp 3
	ld a, 32
	jr z, hotspot_paint_set_t
	add b
	.hotspot_paint_set_t
	ld (__t), a
	call _draw_coloured_tile_do
	ret



._draw_scr_background
	xor a
	ld (_rdx), a
	ld (_rdy), a
	ld (_rdi), a
	._draw_scr_get_scr_address
	ld hl, (_n_pant)
	ld h, 0
	add hl, hl
	ld de, _mapa
	add hl, de ; HL = map + (n_pant << 1)
	ld e, (hl)
	inc hl
	ld d, (hl) ; DE = index
	ld hl, _mapa
	add hl, de ; HL = map + index
	ld (_gp_gen), hl
	._draw_scr_rle
	._draw_scr_loop
	ld a, (_rdi)
	cp 150
	jr z, _draw_scr_loop_done
	ld hl, (_gp_gen)
	ld a, (hl)
	inc hl
	ld (_gp_gen), hl
	ld (_rdn), a
	and 0x1f
	ld (_rdc), a
	._draw_scr_advance_loop
	ld a, (_rdn)
	cp 0x20
	jr c, _draw_scr_advance_loop_done
	sub 0x20
	ld (_rdn), a
	call _advance_worm
	jr _draw_scr_advance_loop
	._draw_scr_advance_loop_done
	call _advance_worm
	jr _draw_scr_loop
	._advance_worm
	ld a, (_rdc)
	ld (__n), a
	call _draw_and_advance
	ret
	._draw_scr_loop_done
	call	_hotspot_paint
	ld hl, _cerrojos
	ld b, 2
	.draw_scr_bolts_loop
	; Cerrojos structure is np, x, y, st
	ld c, (hl) ; np
	inc hl
	ld d, (hl) ; x
	inc hl
	ld e, (hl) ; y
	inc hl
	ld a, (hl) ; st
	inc hl
	; Open lock? (st == 0)
	or a
	jr nz, draw_scr_bolts_continue
	; Current screen?
	ld a, (_n_pant)
	cp c
	jr nz, draw_scr_bolts_continue
	; Clear bolt
	push bc
	ld a, d
	ld c, d ;; Call directly needs C
	ld (__x), a
	ld a, e
	ld (__y), a
	xor a
	ld (__t), a
	ld a, (_comportamiento_tiles) ;; beh [0]
	ld (__n), a
	call set_map_tile_do
	pop bc
	.draw_scr_bolts_continue
	djnz draw_scr_bolts_loop
	ret



._enems_calc_frame
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, _en_an_next_frame
	add hl, bc
	push hl
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	ld hl, _en_an_base_frame
	add hl, bc
	add a, (hl)
	sla a
	ld c, a
	ld hl, _sprite_cells
	add hl, bc
	pop de
	ldi
	ldi
	ret



._draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	call	_saca_a_todo_el_mundo_de_aqui
	call	_draw_scr_background
	._enems_init
	ld hl, (_n_pant)
	ld h, 0
	ld de, _enoffs_index
	add hl, de
	ld a, (hl)
	ld (_enoffs), a
	inc hl
	ld b, a
	ld a, (hl)
	sub b
	ld (_n_enems), a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_33
.i_31
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_33
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_32
	ld bc, (_enit)
	xor a
	ld b, a
	ld hl, _en_an_frame
	add hl, bc
	ld (hl), a
	ld hl, _en_an_state
	add hl, bc
	ld (hl), a
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_spr_empty
	pop	de
	call	l_pint
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_uge
	jp	c,i_31
.i_34
	ld hl, (_enoffs)
	add hl, bc
	ld (_enoffsmasi), hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
.i_37
	ld	a,l
	cp	#(1% 256)
	jp	z,i_38
	cp	#(2% 256)
	jp	z,i_39
	cp	#(3% 256)
	jp	z,i_40
	cp	#(4% 256)
	jp	z,i_41
	jp	i_42
.i_38
.i_39
.i_40
.i_41
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_36
.i_42
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_spr_empty
	pop	de
	call	l_pint
.i_36
	call	_extra_enems_init
	call enems_update_values_store
	jp	i_31
.i_32
	ld	hl,1	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,16
	add	hl,de
	call	_script
	ret



._platform_get_player
	ld a, 1
	ld (_player + 25), a
	ld a, (__en_y)
	sub 16
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), hl
	ld hl, 0
	ld (_player + 8), hl
	srl a
	srl a
	srl a
	srl a
	ld a, (__en_my)
	call Ashl16_HL
	call withSign
	ld (_ptgmy), hl
	ret



._enems_kill
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_spr_boom
	pop	de
	call	l_pint
	ld a, (__en_x)
	ld (_rdx), a
	ld a, (__en_y)
	ld (_rdy), a
	call _render_this_enemy
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_43
	ld	hl,0	;const
	call	_peta_el_beeper
	ld	hl,10	;const
	call	_cpc_HardPause
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_spr_empty
	pop	de
	call	l_pint
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_or
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,_player+32
	inc	(hl)
	ld	hl,4	;const
	call	_script
	call	_extra_enems_killed
	jp	i_44
.i_43
	ld	hl,1	;const
	call	_peta_el_beeper
.i_44
	ret



._mueve_bicharracos
	ld	a,#(0 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+25
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0	;const
	ld	(_ptgmy),hl
	ld	(_ptgmx),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_47
.i_45
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_47
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_ult
	jp	nc,i_46
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,__en_t
	ld	a,(hl)
	rlca
	jp	nc,i_48
	ld	l,a
	ld	h,0
	jp	i_49
.i_48
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_50
	ld a, (_maincounter)
	and 3
	jr nz, enems_animate_done
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	xor 1
	ld (hl), a
	.enems_animate_done
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ule
	jp	nc,i_51
	call en_lineal_do
.i_51
	call	_enems_calc_frame
	call	_extra_enems_move
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_53
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_53
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_54_i_53
.i_53
	jp	i_52
.i_54_i_53
	.moving_platforms
	ld a, (_player + 19)
	or a
	jr z, moving_platforms_do
	ld a, (_player + 14)
	cp 5
	jp c, moving_platforms_done
	.moving_platforms_do
	.moving_platforms_vert
	ld a, (__en_my)
	or a
	jr z, moving_platforms_vert_done
	bit 7, a
	jr z, moving_platforms_vert_down
	.moving_platforms_vert_up
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 17
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	jr moving_platforms_vert_done
	.moving_platforms_vert_down
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 20
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 13
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	.moving_platforms_vert_done
	.moving_platforms_horz
	ld a, (__en_mx)
	or a
	jr z, moving_platforms_done
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 16
	cp c
	jr c, moving_platforms_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_done
	ld a, (_player + 9)
	bit 7, a
	jr nz, moving_platforms_done
	call _platform_get_player
	ld a, (__en_mx)
	call Ashl16_HL
	call withSign
	ld (_ptgmx), hl
	.moving_platforms_done
	jp	i_55
.i_52
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_56
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_58
	call	_this_enemy_kills
	ld	a,h
	or	l
	jp	z,i_58
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_58
	jr	c,i_59_i_58
.i_58
	jp	i_57
.i_59_i_58
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_61
	ld	hl,(_player+8)
	ld	de,65504	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_61
	ld	hl,(__en_t)
	ld	h,0
	ex	de,hl
	ld	hl,(_flags+31)
	ld	h,0
	call	l_uge
	jr	c,i_62_i_61
.i_61
	jp	i_60
.i_62_i_61
	ld	hl,65216	;const
	ld	(_player+8),hl
	ld a, (__en_y)
	cp 12
	jr c, cwepke_zero
	sub 12
	jr cwepke_w
	.cwepke_zero
	xor a
	.cwepke_w
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), hl
	ld	hl,255	;const
	push	hl
	call	_enems_kill
	pop	bc
	jp	i_63
.i_60
	ld	a,(_player+23)
	and	a
	jp	nz,i_64
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2	;const
	call	_peta_el_beeper
	ld	hl,_player+46
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+36
	ld	(hl),#(2 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_64
.i_63
.i_57
	ld	hl,8	;const
	call	_script
.i_56
.i_55
	call	_extra_enems_checks
.i_50
.i_49
.i_65
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_45
.i_46
	ret


	._calc_baddies_pointer
	ld d, h
	ld e, l
	add hl, hl
	add hl, hl
	add hl, hl
	or a
	sbc hl, de
	ld de, _malotes
	add hl, de
	ret
	.enems_get_values
	ld hl, (_enoffsmasi)
	call _calc_baddies_pointer
	ld (__baddies_pointer), hl
	ld a, (hl)
	ld (__en_x), a
	inc hl
	ld a, (hl)
	ld (__en_y), a
	inc hl
	ld a, (hl)
	ld b, a
	and 0xf0
	ld (__en_x1), a
	ld a, b
	sla a
	sla a
	sla a
	sla a
	ld (__en_y1), a
	inc hl
	ld a, (hl)
	ld b, a
	and 0xf0
	ld (__en_x2), a
	ld a, b
	sla a
	sla a
	sla a
	sla a
	ld (__en_y2), a
	inc hl
	ld a, (hl)
	ld (__en_mx), a
	inc hl
	ld a, (hl)
	ld (__en_my), a
	inc hl
	ld a, (hl)
	ld (__en_t), a
	ret
	.enems_update_values_store
	ld hl, (__baddies_pointer)
	ld a, (__en_x)
	ld (hl), a
	inc hl
	ld a, (__en_y)
	ld (hl), a
	inc hl
	inc hl
	inc hl
	ld a, (__en_mx)
	ld (hl), a
	inc hl
	ld a, (__en_my)
	ld (hl), a
	inc hl
	ld a, (__en_t)
	ld (hl), a
	inc hl
	ret
	._en_bg_collision_check
	ld a, (_ptx1)
	ld c, a
	ld a, (_pty1)
	call _attr_enems
	ld a, l
	and 9
	ret nz
	ld a, (_ptx2)
	ld c, a
	ld a, (_pty2)
	call _attr_enems
	ld a, l
	and 9
	ret
	.__ctileoff
	bit 7, a
	jr z, __ctileoff_1
	xor a
	ret
	.__ctileoff_1
	ld a, 1
	ret
	.en_xx_calc
	ld a, (__en_x)
	srl a
	srl a
	srl a
	srl a
	ld (_en_xx), a
	ret
	.en_yy_calc
	ld a, (__en_y)
	srl a
	srl a
	srl a
	srl a
	ld (_en_yy), a
	ret
	.en_bg_collision_horz
	ld a, (__en_mx)
	or a
	ld l, a
	ret z
	call __ctileoff
	ld (_rdi), a
	ld c, a
	call en_xx_calc
	call en_yy_calc
	ld a, (_en_xx)
	add c
	ld (_ptx1), a
	ld (_ptx2), a
	ld a, (_en_yy)
	ld (_pty1), a
	ld a, (__en_y)
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (_pty2), a
	call _en_bg_collision_check
	or a
	ld l, a
	ret z
	ld a, (_en_xx)
	ld c, a
	ld a, (_rdi)
	xor 1
	add c
	sla a
	sla a
	sla a
	sla a
	ld (__en_x), a
	._en_bg_collision_horz_done
	ld l, 1
	ret
	.en_bg_collision_vert
	ld a, (__en_my)
	or a
	ld l, a
	ret z
	call __ctileoff
	ld (_rdi), a
	ld c, a
	call en_xx_calc
	call en_yy_calc
	ld a, (_en_yy)
	add c
	ld (_pty1), a
	ld (_pty2), a
	ld a, (_en_xx)
	ld (_ptx1), a
	ld a, (__en_x)
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (_ptx2), a
	call _en_bg_collision_check
	ld hl, 0
	or a
	ld l, a
	ret z
	ld a, (_en_yy)
	ld c, a
	ld a, (_rdi)
	xor 1
	add c
	sla a
	sla a
	sla a
	sla a
	ld (__en_y), a
	._en_bg_collision_vert_done
	ld l, 1
	ret
	.en_lineal_do
	.en_linear_horizontal_axis
	ld a, (__en_mx)
	or a
	jr z, en_linear_horizontal_axis_done
	ld c, a
	ld a, (__en_x)
	add c
	ld (__en_x), a
	.en_linear_horz_bounds
	ld a, (__en_x)
	ld c, a
	ld a, (__en_x1)
	cp c
	jr c, horz_limit_skip_1
	ld a, (__en_x1)
	ld (__en_x), a
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	jr horz_limit_skip_2
	.horz_limit_skip_1
	ld a, (__en_x2)
	ld c, a
	ld a, (__en_x)
	cp c
	jr c, horz_limit_skip_2
	ld a, (__en_x2)
	ld (__en_x), a
	ld a, (__en_mx)
	call _abs_a
	neg
	ld (__en_mx), a
	.horz_limit_skip_2
	.en_linear_horizontal_axis_done
	.en_linear_vertical_axis
	ld a, (__en_my)
	or a
	jr z, en_linear_vertical_axis_done
	ld c, a
	ld a, (__en_y)
	add c
	ld (__en_y), a
	.en_linear_vert_bounds
	ld a, (__en_y)
	ld c, a
	ld a, (__en_y1)
	cp c
	jr c, vert_limit_skip_1
	ld a, (__en_y1)
	ld (__en_y), a
	ld a, (__en_my)
	call _abs_a
	ld (__en_my), a
	jr vert_limit_skip_2
	.vert_limit_skip_1
	ld a, (__en_y2)
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, vert_limit_skip_2
	ld a, (__en_y2)
	ld (__en_y), a
	ld a, (__en_my)
	call _abs_a
	neg
	ld (__en_my), a
	.vert_limit_skip_2
	.en_linear_vertical_axis_done
	.en_linear_done
	ret

._recuadrius
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_68
.i_66
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_68
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_67
	jp	nc,i_67
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_71
.i_69
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_71
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	de,30
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_ult
	jp	nc,i_70
	ld a, (_rdi)
	add 4
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdi)
	ld c, a
	ld a, #(4+19)
	sub c
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	de,19
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_ult
	jp	nc,i_72
	ld a, (_rdx)
	add 4
	ld (__y), a
	ld a, (_rdi)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdx)
	add 4
	ld (__y), a
	ld a, (_rdi)
	ld c, a
	ld a, #(1+29)
	sub c
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
.i_72
	jp	i_69
.i_70
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jp	i_66
.i_67
	ret



._do_extern_action
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
.i_75
	ld	a,l
	cp	#(0% 256)
	jp	z,i_76
	cp	#(1% 256)
	jp	z,i_77
	jp	i_74
.i_76
	ld	hl,65216	;const
	ld	(_player+8),hl
	jp	i_74
.i_77
	call	_recuadrius
.i_74
	ret


;	SECTION	text

._top_string
	defm	"<======================>"
	defb	0

;	SECTION	code



;	SECTION	text

._mid_string
	defm	"#                      $"
	defb	0

;	SECTION	code



;	SECTION	text

._bottom_string
	defm	"'(((((((((((((((((((((()"
	defb	0

;	SECTION	code



;	SECTION	text

._temp_string
	defm	"                      "
	defb	0

;	SECTION	code




._redraw_from_buffer
	ld a, 1
	ld (__x), a
	ld a, 4
	ld (__y), a
	xor a
	.redraw_from_buffer_loop
	ld (_gpit), a
	ld bc, (_gpit)
	ld b, 0
	ld hl, _map_buff
	add hl, bc
	ld a, (hl)
	cp 16
	jr nc, redraw_set_tile
	.redraw_set_tile
	ld (__t), a
	call _draw_coloured_tile_do
	ld a, (__x)
	add a, 2
	cp 1 + 30
	jr nz, redraw_from_buffer_set_x
	ld a, (__y)
	add a, 2
	ld (__y), a
	ld a, 1
	.redraw_from_buffer_set_x
	ld (__x), a
	ld a, (_gpit)
	inc a
	cp 150
	jr nz, redraw_from_buffer_loop
	ret



._print_tile_inv
	call __tile_address
	ld a, (__n)
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ret



._draw_text_cbc
	.dtcbc_loop
	ld a, (_rdx)
	ld (__x), a
	ld c, a
	inc a
	ld (_rdx), a
	ld a, (hl)
	or a
	jr z, dtcbc_done
	inc hl
	sub 32
	jr z, dtcbc_loop
	halt
	halt
	push hl
	ld (__n), a
	ld a, (_rdy)
	ld (__y), a
	call _print_tile_inv
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	pop hl
	jr dtcbc_loop
	.dtcbc_done
	xor a
	ld (_rdc), a
	ret



._textbox
	ld (_gp_gen), hl
	ld a, 6
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _top_string
	call draw_text_pre_loop
	ld a, 7
	ld (_rdy), a
	.stb_loop
	ld a, (_rdy)
	cp 8
	jr c, stb_notop
	.stb_top
	ld a, (_rdy)
	dec a
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _mid_string
	call draw_text_pre_loop
	.stb_notop
	ld a, (_rdy)
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _mid_string
	call draw_text_pre_loop
	ld a, (_rdy)
	inc a
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _bottom_string
	call draw_text_pre_loop
	ld de, _temp_string
	ld hl, (_gp_gen)
	.fill_buffer_loop
	ld a, (hl)
	or a
	jr z, fill_buffer_end
	cp '%'
	jr z, fill_buffer_end
	ld (de), a
	inc de
	inc hl
	jr fill_buffer_loop
	.fill_buffer_end
	xor a
	ld (de), a
	ld (_gp_gen), hl
	ld a, 5
	ld (_rdx), a
	ld hl, _temp_string
	call dtcbc_loop
	ld a, (_rdy)
	add 2
	ld (_rdy), a
	ld hl, (_gp_gen)
	ld a, (hl)
	or a
	jr z, stb_exitloop
	inc hl
	ld (_gp_gen), hl
	jp stb_loop
	.stb_exitloop
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,1	;const
	call	_peta_el_beeper
	.stb_waitkey
	call _pad_read
	ld a, (_pad_this_frame)
	inc a
	jr z, stb_waitkey
	call _redraw_from_buffer
	call _hotspot_paint
	call _render_all_sprites
	ld hl, 1
	push hl
	call _cpc_UpdateNow
	pop hl
	.stb_redraw_done
	ret


	._s_title
	BINARY "titlec.bin"
	._s_marco
	BINARY "marcoc.bin"
	._s_ending
	BINARY "endingc.bin"

._title_screen
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_do_split),a
	call pal_general
	call	_blackout
	ld hl, _s_title
	call _unpack_screen
	ld	hl,12	;const
	push	hl
	ld	hl,10	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,11	;const
	push	hl
	ld	hl,i_1+9
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,i_1+17
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	call	cpc_UpdScr
	ld	hl,1	;const
	call	cpc_ShowTileMap
	xor a
	call shiruplay
	ld	hl,0	;const
	call	_wyz_play_music
	call	_select_controls
	ret



._game_ending
	call pal_general
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
	ld	hl,4	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,i_1+26
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	call	cpc_UpdScr
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld	hl,0	;const
	call	_wyz_play_music
	call	_no_break
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
	ret



._game_over
	call	_wyz_stop_sound
	ld a, 10
	ld (__x), a
	ld a, 11
	ld (__y), a
	ld a, 21
	ld (__x2), a
	ld a, 13
	ld (__y2), a
	ld a, 72
	ld (__t), a
	call	_draw_rectangle
	ld	hl,11	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,i_1+51
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,2	;const
	call	_wyz_play_music
	call	_no_break
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
	ret



._main
	call	_system_init
.i_82
	call	_title_screen
	call	_blackout
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_do_split),a
	ld hl, _s_marco
	call _unpack_screen
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld hl, _flags
	ld de, _flags + 1
	ld bc, 32 - 1
	xor a
	ld (hl), a
	ldir
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	call	_init_malotes
	ld	a,#(0 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_script_result),a
	ld	hl,0	;const
	call	_script
	xor a
	ld (_maincounter), a
	ld (_half_life), a
	ld (_scenery_info + 0), a
	ld (_scenery_info + 1), a
	ld a, 255
	ld (_objs_old), a
	ld (_life_old), a
	ld (_keys_old), a
	ld (_killed_old), a
	ld (_flag_old), a
	ld (_on_pant), a
	ld	hl,1	;const
	call	_wyz_play_music
.i_84
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_85
	ld a, (_n_pant)
	ld c, a
	ld a, (_on_pant)
	cp c
	jr z, ml_ud_skip
	call _draw_scr
	ld a, (_n_pant)
	ld (_on_pant), a
	ld a, 1
	ld (_pant_just_rendered), a
	ld (_do_split), a
	.ml_ud_skip
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_86
	ld	hl,14	;const
	push	hl
	ld	hl,2	;const
	push	hl
	ld	hl,_player+27
	call	l_gchar
	ld	de,25
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_player+27
	call	l_gchar
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_86
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_87
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_88
	or	l
	jp	z,i_88
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_89
.i_88
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_89
	ld	hl,7	;const
	push	hl
	ld	hl,2	;const
	push	hl
	ld	hl,(_pti)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_87
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_90
	ld a, 21
	ld (__x), a
	ld a, 2
	ld (__y), a
	ld a, (_player + 28)
	ld (_keys_old), a
	call draw_2_digits_shortcut
.i_90
	ld	hl,(_flags)
	ld	h,0
	ex	de,hl
	ld	hl,(_flag_old)
	ld	h,0
	call	l_ne
	jp	nc,i_91
	ld	hl,25	;const
	push	hl
	ld	hl,1	;const
	push	hl
	ld	hl,(_flags)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags)
	ld	h,0
	ld	a,l
	ld	(_flag_old),a
.i_91
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
	ld	hl,(_hotspot_t_r)
	ld	h,0
	ld	a,l
	ld	(_hotspot_t),a
	ld a, (_hotspot_x)
	ld c, a
	ld a, (_gpx)
	add 12
	cp c
	jp c, _hotspots_else
	ld a, (_gpx)
	ld c, a
	ld a, (_hotspot_x)
	add 12
	cp c
	jp c, _hotspots_else
	ld a, (_hotspot_y)
	ld c, a
	ld a, (_gpy)
	add 12
	cp c
	jp c, _hotspots_else
	ld a, (_gpy)
	ld c, a
	ld a, (_hotspot_y)
	add 12
	cp c
	jp c, _hotspots_else
	ld	a,(_hotspot_t)
	and	a
	jp	z,i_92
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_95
	ld	a,l
	cp	#(1% 256)
	jp	z,i_96
	cp	#(2% 256)
	jp	z,i_97
	cp	#(3% 256)
	jp	z,i_98
	jp	i_94
.i_96
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	call	_peta_el_beeper
	jp	i_94
.i_97
	ld	hl,_player+28
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
	jp	i_94
.i_98
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,(_player+29)
	ld	de,99	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_99
	ld	hl,99	;const
	ld	(_player+29),hl
.i_99
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_94
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_100
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	push	hl
	ld	a,(_hotspot_y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,4
	add	hl,de
	push	hl
	ld	hl,(_orig_tile)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	a,#(240 % 256 % 256)
	ld	(_hotspot_y),a
	ld	hl,_hotspots
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	push	hl
	ld	hl,_rdi
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,3	;const
	call	_script
.i_100
.i_92
	._hotspots_finally
	ld a, 1
	ld (_hotspot_flag), a
	jr _hotspots_done
	._hotspots_else
	xor a
	ld (_hotspot_flag), a
	._hotspots_done
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_on_pant)
	ld	h,0
	call	l_eq
	jp	nc,i_101
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
.i_101
	.player_flicker_done_check
	ld a, (_player + 23)
	and 2
	jr z, player_flicker_check_done
	ld a, (_player + 24)
	dec a
	jr nz, player_flicker_ct_write
	xor a
	ld (_player + 23), a
	.player_flicker_ct_write
	ld (_player + 24), a
	.player_flicker_check_done
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(16 % 256)
	jp	nz,i_102
	ld	hl,2	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,17
	add	hl,de
	call	_script
.i_102
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_104
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_105_i_104
.i_104
	jp	i_103
.i_105_i_104
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_106
.i_103
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_108
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_109_i_108
.i_108
	jp	i_107
.i_109_i_108
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_107
.i_106
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_111
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_111
	ld	a,(_n_pant)
	cp	#(20 % 256)
	jr	z,i_111_uge
	jp	c,i_111
.i_111_uge
	jr	i_112_i_111
.i_111
	jp	i_110
.i_112_i_111
	ld a, (_n_pant)
	sub 20
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_113
.i_110
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_115
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_116_i_115
.i_115
	jp	i_114
.i_116_i_115
	ld a, (_n_pant)
	add 20
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_114
.i_113
	ld	hl,9	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_117
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_119
	inc	hl
	ld	a,(_n_pant)
	cp	#(20 % 256)
	jr	z,i_119_uge
	jp	c,i_119
.i_119_uge
	jr	i_120_i_119
.i_119
	jp	i_118
.i_120_i_119
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
.i_118
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_122
	inc	hl
	ld	a,(_n_pant)
	cp	#(80 % 256)
	jp	z,i_122
	jr	c,i_123_i_122
.i_122
	jp	i_121
.i_123_i_122
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
.i_121
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(1 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_125
	inc	hl
	ld	a,(_n_pant)
	cp	#(0 % 256)
	jp	z,i_125
	jp	c,i_125
	jr	i_126_i_125
.i_125
	jp	i_124
.i_126_i_125
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
.i_124
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_128
	inc	hl
	ld	a,(_n_pant)
	cp	#(80 % 256)
	jp	z,i_128
	jr	c,i_129_i_128
.i_128
	jp	i_127
.i_129_i_128
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
.i_127
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(16 % 256)
	jp	nz,i_130
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	dec	hl
.i_130
.i_117
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_131
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_131
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_132
	.player_is_dead
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+29
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_player+46)
	ld	h,0
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_pint
	call	_player_flicker
.i_132
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_134
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_133
.i_134
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_133
	xor a
	ld (_pant_just_rendered), a
	jp	i_84
.i_85
	jp	i_82
.i_83
	ret


;	SECTION	text

.i_1
	defm	"1\TECLAS"
	defb	0

	defm	"2\MANDO"
	defb	0

	defm	"MK1 V3\2"
	defb	0

	defm	"NOS VEMOS EN ICE PALACE!"
	defb	0

	defm	"GAME UNDER"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._n_enems	defs	1
.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._isr_player_on	defs	1
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._hotspot_t	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._flags	defs	32
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._hit_h	defs	1
._gp_gen_org	defs	2
._hit_v	defs	1
._killed_old	defs	1
._thrusting	defs	1
._wyz_beat_ct	defs	1
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._hotspot_flag	defs	1
._life_old	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._disable_collide_platform	defs	1
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
._enit	defs	1
._gpcx	defs	2
._gpcy	defs	2
._rdt1	defs	1
._rdt2	defs	1
._gpit	defs	1
._playing	defs	1
._scenery_info	defs	2
._seed	defs	2
._objs_old	defs	1
._maincounter	defs	1
._rdmt	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._flag_old	defs	1
._wall	defs	1
._pvx_total	defs	2
._hotspot_t_r	defs	1
._at1	defs	1
._at2	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._cx1	defs	1
._cx2	defs	1
._cy1	defs	1
._cy2	defs	1
._prxx	defs	1
._pryy	defs	1
._pvy_total	defs	2
._script_param	defs	1
._idx	defs	2
._player	defs	47
._rda	defs	1
._rdb	defs	1
._rdc	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdi	defs	1
._rdn	defs	1
._keys_old	defs	1
._tat	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._tqt	defs	1
._tpx	defs	1
._tpy	defs	1
._enoffsmasi	defs	2
._do_split	defs	1
._pant_just_rendered	defs	1
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	XDEF	_n_enems
	XDEF	__en_t
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_isr_player_on
	XDEF	_hotspots
	LIB	cpc_PutTrSp8x8TileMapPxM1
	LIB	cpc_PutTrSp16x16TileMapPxM1
	LIB	cpc_PutTrSp16x24TileMapPxM1
	XDEF	_draw_scr
	XDEF	_spr_next
	defc	_spr_next	=	58944
	XDEF	_wyz_play_music
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	XDEF	_sm_invfunc
	LIB	cpc_PutSpTileMap12x24CA
	LIB	cpc_PrintGphStrStdXY
	XDEF	_draw_text_cbc
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sprites
	LIB	cpc_PutTiles
	XDEF	_spr_empty
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	__en_y2
	XDEF	_def_keys
	XDEF	_cortina
	LIB	cpc_PrintGphStrM12X
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54835
	XDEF	_extra_enems_init
	XDEF	_hotspot_t
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_player_walk_cycle
	XDEF	_half_life
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_ShowScrTileMap
	LIB	cpc_SetMode
	XDEF	_enoffs_index
	LIB	cpc_ClrScr
	XDEF	_sprite_cells
	XDEF	_get_pointer_to_enem_or_coco
	LIB	cpc_SetModo
	XDEF	_en_an_state
	defc	_en_an_state	=	54829
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_extra_enems_move
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	LIB	cpc_ShowTouchedTiles2
	LIB	cpc_SetTile
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	LIB	cpc_PutSpTileMap8x8PxM1
	LIB	cpc_PutSpTileMap16x16PxM1
	LIB	cpc_PutSpTileMap16x24PxM1
	XDEF	_recuadrius
	LIB	cpc_CollSp
	LIB	cpc_PutMaskSp4x16
	XDEF	_hit_h
	XDEF	_gp_gen_org
	XDEF	_blackout
	XDEF	_map_buff
	defc	_map_buff	=	50838
	LIB	cpc_PrintGphStrStd
	XDEF	_hit_v
	XDEF	_cpc_Border
	XDEF	_killed_old
	XDEF	_thrusting
	XDEF	_player_custom_veng
	XDEF	_mid_string
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_invalidate_viewport
	LIB	cpc_ShowTileMap
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_print_tile_inv
	XDEF	_wyz_beat_ct
	XDEF	_t_alt
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_cpc_UpdateNow
	XDEF	_extra_enems_checks
	XDEF	_espera_activa
	LIB	cpc_PutTrSp2Bx8TileMapG
	LIB	cpc_PutTrSp4Bx16TileMapG
	LIB	cpc_PutTrSp4Bx24TileMapG
	LIB	cpc_SpRLM1
	XDEF	__n
	XDEF	_unpack_screen
	XDEF	_title_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	54826
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_wyz_init
	XDEF	_hotspot_flag
	XDEF	_life_old
	LIB	cpc_PrintGphStrXY2X
	LIB	cpc_SpRRM1
	XDEF	_enems_en_an_calc
	XDEF	_sm_sprptr
	LIB	cpc_PrintGphStrXYM1
	LIB	cpc_PutTrSp12x24TileMapGCA
	XDEF	_player_custom_frame
	XDEF	_bottom_string
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	LIB	cpc_TestKey
	LIB	cpc_PutSprite
	XDEF	cpc_PutSpTileMap
	LIB	cpc_PutTrSpTileMap
	LIB	cpc_PutORSpTileMap
	LIB	cpc_PutCpSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	LIB	cpc_PutSPTileMap4Bx16
	LIB	cpc_PutSPTileMap4Bx24
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_cm_two_points
	XREF	_script_n
	LIB	cpc_TouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	LIB	cpc_SetTouchTileXY
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_shl_player_coords
	XDEF	_draw_and_advance
	XDEF	_disable_collide_platform
	LIB	cpc_PutTrSp4x8TileMapGPx
	LIB	cpc_PutTrSp8x16TileMapGPx
	LIB	cpc_PutTrSp8x24TileMapGPx
	XDEF	_init_player
	XDEF	_gp_gen
	XDEF	_on_pant
	XDEF	_render_this_enemy
	XDEF	_custom_bg_hit
	XDEF	_enoffs
	LIB	cpc_PutSpTr
	XDEF	_pad_this_frame
	LIB	cpc_DisableFirmware
	LIB	cpc_EnableFirmware
	LIB	cpc_PrintGphStrXYM12X
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	__tile_address
	XDEF	_n_pant
	LIB	cpc_UpdScrM1P
	XDEF	_def_keys_joy
	XDEF	_en_j
	XDEF	_redraw_after_text
	LIB	cpc_SetBorder
	XDEF	_en_an_ff
	defc	_en_an_ff	=	54832
	LIB	cpc_RLI
	XDEF	_system_init
	XDEF	_draw_rectangle
	LIB	cpc_RRI
	LIB	cpc_GetSp
	XDEF	_init_malotes
	XDEF	_enit
	XDEF	_collide_enem
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_main
	XDEF	_mapa
	XDEF	_draw_coloured_tile
	XDEF	_attr
	LIB	cpc_ResetTouchedTiles
	XDEF	_gpcx
	XDEF	_gpcy
	LIB	cpc_ShowTouchedTiles
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_s_title
	XDEF	_gpit
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	54814
	XDEF	_en_an_vy
	defc	_en_an_vy	=	54820
	LIB	cpc_PutMaskSp2x8
	XDEF	_sm_updfunc
	LIB	cpc_ScanKeyboard
	LIB	cpc_SetColour
	XDEF	_scenery_info
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_maincounter
	XDEF	_rdmt
	LIB	cpc_PutTrSp2Bx8TileMap
	LIB	cpc_PutTrSp4Bx16TileMap
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	LIB	cpc_PutTrSp4Bx24TileMap
	XDEF	_extra_enems_killed
	XDEF	_move
	XDEF	_flag_old
	XDEF	_wall
	LIB	cpc_UpdScr
	LIB	cpc_PutTrSp16x16TileMapPxM1LUT
	XDEF	_check_and_clear_cerrojo
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	54796
	XDEF	_this_enemy_kills
	XDEF	_pvx_total
	XDEF	_hotspot_t_r
	LIB	cpc_ScrollLeft0
	XDEF	_at1
	XDEF	_at2
	XDEF	__x2
	XDEF	__y2
	LIB	cpc_PutSPTileMap2Bx8
	LIB	cpc_AnyKeyPressed
	XDEF	_step
	XDEF	__en_life
	XDEF	_cpc_HardPause
	XDEF	_decode_text
	XDEF	_cx1
	XDEF	_cx2
	XDEF	_cy1
	XDEF	_cy2
	XDEF	_prxx
	LIB	cpc_AssignKey
	XDEF	_pryy
	LIB	cpc_TouchTiles
	XDEF	_calc_hotspot_ptr
	LIB	cpc_PutSPTileMap4x8Px
	XDEF	_abs
	LIB	cpc_ScrollRight0
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
	LIB	cpc_MakeM1RotationLUTs
	LIB	cpc_PutTrSp4x8TileMapPx
	LIB	cpc_PutTrSp8x8TileMapPx
	LIB	cpc_PutTrSp8x16TileMapPx
	LIB	cpc_PutTrSp8x24TileMapPx
	LIB	cpc_UnExo
	XDEF	_redraw_from_buffer
	XDEF	_pvy_total
	XDEF	_top_string
	XDEF	_temp_string
	XDEF	_script_param
	LIB	cpc_SetInkGphStrM1
	XDEF	_idx
	XDEF	_en_an_x
	defc	_en_an_x	=	54802
	XDEF	_en_an_y
	defc	_en_an_y	=	54808
	XDEF	_player
	LIB	cpc_PutMaskSpriteTileMap
	LIB	cpc_PutTrSpriteTileMap
	LIB	cpc_UpdateTileMap
	XDEF	_rda
	XDEF	_rdb
	XDEF	_rdc
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	LIB	cpc_PutSpTileMap8x8Px
	XDEF	_rdi
	XDEF	_rdn
	XDEF	_keys_old
	XDEF	_init_player_values
	XDEF	_en_tocado
	LIB	cpc_TestKeyF
	XDEF	_tat
	LIB	cpc_PutTrSp16x16TileMapGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	LIB	cpc_PutTrSp16x24TileMapGPxM1P
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	_draw_2_digits
	XREF	_script_result
	XDEF	_check_lock_or_box_horz
	XDEF	_player_flicker
	XDEF	_pti
	XDEF	_tileset
	XDEF	_ptj
	XDEF	_no_break
	XDEF	_comportamiento_tiles
	XDEF	_init_hotspots
	XDEF	_script
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_tqt
	XDEF	_tpx
	XDEF	_tpy
	XDEF	_enoffsmasi
	LIB	cpc_PutSpTileMapO
	LIB	cpc_PutSp
	LIB	cpc_UpdScrAddresses
	XDEF	_tspatterns
	XDEF	_do_split
	XDEF	_check_lock_or_box_vert
	LIB	cpc_PutTrSp8x8TileMapGPxM1
	LIB	cpc_PutTrSp16x16TileMapGPxM1
	XDEF	_hotspot_paint
	XDEF	_pant_just_rendered
	XDEF	__baddies_pointer
	LIB	cpc_PutMaskSpTileMap
	LIB	cpc_TouchTileSpXY
	XREF	_script_do
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XREF	_script_tn
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	LIB	cpc_RedefineKey
	LIB	cpc_PutTrSp8x16TileMapGPxP
	LIB	cpc_PutTrSp8x24TileMapGPxP
	XREF	_script_tx
	XREF	_script_ty
	XDEF	_textbox
	XDEF	_do_extern_action
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	54787
	LIB	cpc_GetTiles
	XDEF	_render_all_sprites
	LIB	cpc_PutSpXOR
	LIB	cpc_PrintStr
	XDEF	_spr_boom
	XDEF	_draw_scr_background
	LIB	cpc_PrintGphStr2X
	XDEF	_select_controls
	XDEF	_game_over
	LIB	cpc_PrintGphStrM1


; --- End of Scope Defns ---


; --- End of Compilation ---
