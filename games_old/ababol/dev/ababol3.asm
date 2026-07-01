;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Wed Jul 01 11:28:39 2026



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


	._tileset
	BINARY "tileset.bin"
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #0 y máscara
	; Primera columna
	._sprite_1_a
	defb 0, 255
	defb 0, 254
	defb 0, 252
	defb 1, 248
	defb 2, 248
	defb 0, 224
	defb 13, 192
	defb 17, 192
	defb 20, 192
	defb 21, 192
	defb 17, 128
	defb 32, 128
	defb 41, 128
	defb 48, 128
	defb 2, 128
	defb 1, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_1_b
	defb 0, 255
	defb 0, 15
	defb 160, 7
	defb 80, 7
	defb 0, 7
	defb 160, 15
	defb 224, 15
	defb 160, 15
	defb 0, 15
	defb 128, 15
	defb 160, 15
	defb 0, 15
	defb 0, 7
	defb 176, 7
	defb 112, 7
	defb 32, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_1_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #1 y máscara
	; Primera columna
	._sprite_2_a
	defb 0, 254
	defb 0, 252
	defb 1, 248
	defb 2, 240
	defb 4, 240
	defb 1, 224
	defb 13, 192
	defb 16, 192
	defb 23, 128
	defb 37, 128
	defb 45, 128
	defb 44, 0
	defb 65, 0
	defb 81, 0
	defb 107, 0
	defb 3, 0
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_2_b
	defb 0, 15
	defb 160, 7
	defb 80, 7
	defb 0, 7
	defb 160, 15
	defb 224, 15
	defb 160, 15
	defb 0, 3
	defb 40, 3
	defb 40, 3
	defb 224, 3
	defb 0, 15
	defb 32, 15
	defb 32, 7
	defb 144, 3
	defb 200, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_2_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #2 y máscara
	; Primera columna
	._sprite_3_a
	defb 0, 255
	defb 0, 254
	defb 0, 252
	defb 1, 248
	defb 2, 248
	defb 0, 224
	defb 13, 192
	defb 17, 128
	defb 32, 128
	defb 45, 128
	defb 45, 128
	defb 32, 128
	defb 41, 128
	defb 51, 128
	defb 3, 128
	defb 1, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_3_b
	defb 0, 255
	defb 0, 15
	defb 160, 7
	defb 80, 7
	defb 0, 7
	defb 160, 15
	defb 224, 15
	defb 160, 1
	defb 12, 1
	defb 44, 1
	defb 224, 1
	defb 0, 15
	defb 128, 15
	defb 32, 3
	defb 184, 3
	defb 144, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_3_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #3 y máscara
	; Primera columna
	._sprite_4_a
	defb 0, 254
	defb 0, 252
	defb 1, 248
	defb 2, 248
	defb 0, 224
	defb 13, 224
	defb 13, 224
	defb 0, 192
	defb 23, 128
	defb 33, 128
	defb 33, 0
	defb 64, 0
	defb 50, 0
	defb 28, 128
	defb 0, 193
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_4_b
	defb 0, 15
	defb 160, 7
	defb 64, 7
	defb 0, 7
	defb 160, 1
	defb 236, 1
	defb 172, 1
	defb 0, 1
	defb 24, 3
	defb 32, 1
	defb 228, 1
	defb 12, 1
	defb 108, 1
	defb 0, 1
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_4_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #4 y máscara
	; Primera columna
	._sprite_5_a
	defb 0, 255
	defb 0, 240
	defb 5, 224
	defb 10, 224
	defb 0, 224
	defb 5, 240
	defb 7, 240
	defb 5, 128
	defb 48, 128
	defb 52, 128
	defb 7, 128
	defb 0, 240
	defb 1, 240
	defb 4, 192
	defb 29, 192
	defb 9, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_5_b
	defb 0, 255
	defb 0, 127
	defb 0, 63
	defb 128, 31
	defb 64, 31
	defb 0, 7
	defb 176, 3
	defb 136, 1
	defb 4, 1
	defb 180, 1
	defb 180, 1
	defb 4, 1
	defb 148, 1
	defb 204, 1
	defb 192, 1
	defb 128, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_5_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #5 y máscara
	; Primera columna
	._sprite_6_a
	defb 0, 240
	defb 5, 224
	defb 10, 224
	defb 0, 224
	defb 5, 240
	defb 7, 240
	defb 5, 240
	defb 0, 192
	defb 20, 192
	defb 20, 192
	defb 7, 192
	defb 0, 240
	defb 4, 240
	defb 4, 224
	defb 9, 192
	defb 19, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_6_b
	defb 0, 127
	defb 0, 63
	defb 128, 31
	defb 64, 15
	defb 32, 15
	defb 128, 7
	defb 176, 3
	defb 8, 3
	defb 232, 1
	defb 164, 1
	defb 180, 1
	defb 52, 0
	defb 130, 0
	defb 138, 0
	defb 214, 0
	defb 192, 0
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_6_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #6 y máscara
	; Primera columna
	._sprite_7_a
	defb 0, 255
	defb 0, 240
	defb 5, 224
	defb 10, 224
	defb 0, 224
	defb 5, 240
	defb 7, 240
	defb 5, 240
	defb 0, 240
	defb 1, 240
	defb 5, 240
	defb 0, 240
	defb 0, 224
	defb 13, 224
	defb 14, 224
	defb 4, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_7_b
	defb 0, 255
	defb 0, 127
	defb 0, 63
	defb 128, 31
	defb 64, 31
	defb 0, 7
	defb 176, 3
	defb 136, 3
	defb 40, 3
	defb 168, 3
	defb 136, 1
	defb 4, 1
	defb 148, 1
	defb 12, 1
	defb 64, 1
	defb 128, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_7_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #7 y máscara
	; Primera columna
	._sprite_8_a
	defb 0, 240
	defb 5, 224
	defb 2, 224
	defb 0, 224
	defb 5, 128
	defb 55, 128
	defb 53, 128
	defb 0, 128
	defb 24, 192
	defb 4, 128
	defb 39, 128
	defb 48, 128
	defb 54, 128
	defb 0, 128
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_8_b
	defb 0, 127
	defb 0, 63
	defb 128, 31
	defb 64, 31
	defb 0, 7
	defb 176, 7
	defb 176, 7
	defb 0, 3
	defb 232, 1
	defb 132, 1
	defb 132, 0
	defb 2, 0
	defb 76, 0
	defb 56, 1
	defb 0, 131
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_8_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #8 y máscara
	; Primera columna
	._sprite_9_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 1
	defb 124, 0
	defb 66, 0
	defb 32, 0
	defb 64, 0
	defb 5, 0
	defb 117, 0
	defb 48, 128
	defb 30, 192
	defb 1, 224
	defb 0, 224
	defb 15, 224
	defb 15, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_9_b
	defb 0, 255
	defb 0, 193
	defb 20, 128
	defb 42, 0
	defb 64, 0
	defb 148, 1
	defb 60, 1
	defb 180, 1
	defb 128, 1
	defb 140, 1
	defb 236, 1
	defb 0, 1
	defb 32, 15
	defb 128, 31
	defb 128, 31
	defb 0, 63
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_9_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #9 y máscara
	; Primera columna
	._sprite_10_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 15
	defb 112, 1
	defb 76, 0
	defb 34, 0
	defb 64, 0
	defb 0, 0
	defb 69, 0
	defb 5, 0
	defb 113, 0
	defb 48, 128
	defb 31, 192
	defb 6, 224
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_10_b
	defb 0, 255
	defb 0, 255
	defb 0, 193
	defb 20, 128
	defb 42, 0
	defb 64, 0
	defb 148, 1
	defb 60, 1
	defb 180, 1
	defb 128, 1
	defb 152, 3
	defb 216, 3
	defb 0, 3
	defb 32, 15
	defb 96, 15
	defb 192, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_10_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #10 y máscara
	; Primera columna
	._sprite_11_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 1
	defb 124, 0
	defb 66, 0
	defb 32, 0
	defb 64, 0
	defb 69, 0
	defb 3, 0
	defb 3, 192
	defb 28, 192
	defb 12, 224
	defb 7, 240
	defb 3, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_11_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 193
	defb 20, 128
	defb 42, 0
	defb 64, 0
	defb 148, 1
	defb 60, 1
	defb 132, 1
	defb 48, 1
	defb 176, 7
	defb 0, 7
	defb 160, 15
	defb 160, 15
	defb 64, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_11_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #11 y máscara
	; Primera columna
	._sprite_12_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_12_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_12_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #12 y máscara
	; Primera columna
	._sprite_13_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 131
	defb 40, 1
	defb 84, 0
	defb 2, 0
	defb 41, 128
	defb 60, 128
	defb 33, 128
	defb 12, 128
	defb 13, 224
	defb 0, 224
	defb 5, 240
	defb 5, 240
	defb 2, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_13_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 128
	defb 62, 0
	defb 66, 0
	defb 4, 0
	defb 2, 0
	defb 162, 0
	defb 192, 0
	defb 192, 3
	defb 56, 3
	defb 48, 7
	defb 224, 15
	defb 192, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_13_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #13 y máscara
	; Primera columna
	._sprite_14_a
	defb 0, 255
	defb 0, 255
	defb 0, 131
	defb 40, 1
	defb 84, 0
	defb 2, 0
	defb 41, 128
	defb 60, 128
	defb 45, 128
	defb 1, 128
	defb 25, 192
	defb 27, 192
	defb 0, 192
	defb 4, 240
	defb 6, 240
	defb 3, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_14_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 240
	defb 14, 128
	defb 50, 0
	defb 68, 0
	defb 2, 0
	defb 0, 0
	defb 162, 0
	defb 160, 0
	defb 142, 0
	defb 12, 1
	defb 248, 3
	defb 96, 7
	defb 0, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_14_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #14 y máscara
	; Primera columna
	._sprite_15_a
	defb 0, 255
	defb 0, 131
	defb 40, 1
	defb 84, 0
	defb 2, 0
	defb 41, 128
	defb 60, 128
	defb 45, 128
	defb 1, 128
	defb 49, 128
	defb 55, 128
	defb 0, 128
	defb 4, 240
	defb 1, 248
	defb 1, 248
	defb 0, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_15_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 128
	defb 62, 0
	defb 66, 0
	defb 4, 0
	defb 2, 0
	defb 160, 0
	defb 174, 0
	defb 12, 1
	defb 120, 3
	defb 128, 7
	defb 0, 7
	defb 240, 7
	defb 240, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_15_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #15 y máscara
	; Primera columna
	._sprite_16_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_16_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_16_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #16 y máscara
	; Primera columna
	._sprite_17_a
	defb 0, 240
	defb 7, 224
	defb 13, 224
	defb 13, 224
	defb 13, 224
	defb 15, 224
	defb 15, 224
	defb 5, 240
	defb 0, 192
	defb 26, 192
	defb 25, 192
	defb 0, 192
	defb 1, 252
	defb 1, 252
	defb 0, 240
	defb 7, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_17_b
	defb 0, 31
	defb 192, 15
	defb 96, 15
	defb 96, 15
	defb 96, 15
	defb 224, 15
	defb 224, 15
	defb 64, 7
	defb 16, 7
	defb 128, 7
	defb 64, 31
	defb 0, 31
	defb 64, 31
	defb 0, 31
	defb 0, 127
	defb 0, 127
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_17_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #17 y máscara
	; Primera columna
	._sprite_18_a
	defb 0, 240
	defb 7, 224
	defb 13, 224
	defb 13, 224
	defb 13, 224
	defb 15, 224
	defb 15, 224
	defb 5, 192
	defb 16, 192
	defb 2, 192
	defb 5, 240
	defb 0, 240
	defb 5, 240
	defb 1, 240
	defb 0, 252
	defb 1, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_18_b
	defb 0, 31
	defb 192, 15
	defb 96, 15
	defb 96, 15
	defb 96, 15
	defb 224, 15
	defb 224, 15
	defb 64, 31
	defb 0, 7
	defb 176, 7
	defb 48, 7
	defb 0, 7
	defb 0, 127
	defb 0, 127
	defb 0, 31
	defb 192, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_18_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #18 y máscara
	; Primera columna
	._sprite_19_a
	defb 0, 255
	defb 0, 248
	defb 2, 248
	defb 0, 240
	defb 6, 192
	defb 20, 128
	defb 34, 0
	defb 64, 0
	defb 69, 0
	defb 69, 0
	defb 36, 0
	defb 42, 128
	defb 30, 128
	defb 16, 192
	defb 0, 199
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_19_b
	defb 0, 255
	defb 0, 63
	defb 128, 63
	defb 0, 31
	defb 192, 7
	defb 80, 3
	defb 136, 1
	defb 4, 1
	defb 68, 1
	defb 68, 1
	defb 72, 1
	defb 168, 3
	defb 240, 3
	defb 16, 7
	defb 0, 199
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_19_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #19 y máscara
	; Primera columna
	._sprite_20_a
	defb 0, 248
	defb 2, 248
	defb 0, 0
	defb 230, 0
	defb 148, 0
	defb 130, 0
	defb 144, 0
	defb 73, 0
	defb 33, 0
	defb 26, 128
	defb 2, 192
	defb 6, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_20_b
	defb 0, 63
	defb 128, 63
	defb 0, 1
	defb 206, 0
	defb 82, 0
	defb 130, 0
	defb 18, 0
	defb 36, 0
	defb 8, 1
	defb 176, 3
	defb 128, 7
	defb 192, 31
	defb 0, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_20_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #20 y máscara
	; Primera columna
	._sprite_21_a
	defb 0, 227
	defb 8, 224
	defb 8, 224
	defb 8, 224
	defb 11, 224
	defb 9, 224
	defb 11, 224
	defb 10, 192
	defb 28, 192
	defb 27, 192
	defb 1, 192
	defb 4, 240
	defb 6, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_21_b
	defb 0, 255
	defb 0, 31
	defb 0, 15
	defb 0, 7
	defb 128, 7
	defb 64, 7
	defb 192, 7
	defb 128, 7
	defb 48, 7
	defb 64, 7
	defb 128, 31
	defb 0, 31
	defb 64, 31
	defb 0, 15
	defb 96, 15
	defb 0, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_21_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #21 y máscara
	; Primera columna
	._sprite_22_a
	defb 0, 224
	defb 8, 224
	defb 8, 224
	defb 11, 224
	defb 9, 224
	defb 11, 224
	defb 10, 224
	defb 8, 192
	defb 30, 192
	defb 27, 192
	defb 1, 192
	defb 0, 248
	defb 2, 248
	defb 0, 240
	defb 6, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_22_b
	defb 0, 31
	defb 0, 15
	defb 0, 7
	defb 128, 7
	defb 64, 7
	defb 192, 7
	defb 192, 7
	defb 0, 7
	defb 208, 7
	defb 64, 7
	defb 128, 15
	defb 32, 15
	defb 96, 15
	defb 0, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_22_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #22 y máscara
	; Primera columna
	._sprite_23_a
	defb 63, 192
	defb 124, 128
	defb 113, 128
	defb 97, 128
	defb 103, 128
	defb 71, 128
	defb 65, 128
	defb 65, 128
	defb 65, 128
	defb 33, 192
	defb 32, 192
	defb 32, 192
	defb 32, 192
	defb 32, 192
	defb 32, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_23_b
	defb 252, 3
	defb 14, 1
	defb 128, 1
	defb 128, 1
	defb 224, 1
	defb 224, 1
	defb 128, 1
	defb 128, 1
	defb 128, 1
	defb 128, 3
	defb 0, 3
	defb 0, 3
	defb 0, 3
	defb 0, 3
	defb 0, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_23_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #23 y máscara
	; Primera columna
	._sprite_24_a
	defb 31, 224
	defb 63, 192
	defb 56, 192
	defb 48, 192
	defb 51, 192
	defb 35, 192
	defb 32, 192
	defb 33, 192
	defb 33, 192
	defb 33, 192
	defb 33, 192
	defb 32, 192
	defb 32, 192
	defb 32, 192
	defb 32, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_24_b
	defb 0, 255
	defb 254, 1
	defb 7, 0
	defb 193, 0
	defb 192, 0
	defb 240, 0
	defb 240, 0
	defb 192, 0
	defb 128, 0
	defb 128, 1
	defb 128, 1
	defb 0, 1
	defb 0, 3
	defb 0, 3
	defb 0, 3
	defb 0, 131
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_24_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #24 y máscara
	; Primera columna
	._sprite_25_a
	defb 166, 0
	defb 66, 16
	defb 65, 16
	defb 71, 0
	defb 111, 0
	defb 44, 128
	defb 11, 128
	defb 15, 224
	defb 15, 224
	defb 15, 192
	defb 55, 128
	defb 118, 0
	defb 99, 0
	defb 56, 128
	defb 8, 193
	defb 0, 243
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_25_b
	defb 0, 157
	defb 98, 8
	defb 33, 12
	defb 145, 4
	defb 241, 0
	defb 59, 0
	defb 218, 0
	defb 248, 1
	defb 248, 3
	defb 240, 7
	defb 80, 7
	defb 168, 1
	defb 220, 1
	defb 12, 1
	defb 12, 225
	defb 6, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_25_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #25 y máscara
	; Primera columna
	._sprite_26_a
	defb 0, 185
	defb 70, 16
	defb 132, 48
	defb 137, 32
	defb 143, 0
	defb 220, 0
	defb 91, 0
	defb 31, 128
	defb 31, 192
	defb 15, 224
	defb 10, 224
	defb 21, 128
	defb 59, 128
	defb 48, 128
	defb 48, 135
	defb 96, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_26_b
	defb 101, 0
	defb 66, 8
	defb 130, 8
	defb 226, 0
	defb 246, 0
	defb 52, 1
	defb 208, 1
	defb 240, 7
	defb 240, 7
	defb 240, 3
	defb 236, 1
	defb 110, 0
	defb 198, 0
	defb 28, 1
	defb 16, 131
	defb 0, 207
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_26_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #26 y máscara
	; Primera columna
	._sprite_27_a
	defb 0, 248
	defb 3, 224
	defb 13, 224
	defb 9, 192
	defb 30, 192
	defb 29, 192
	defb 26, 192
	defb 26, 192
	defb 29, 128
	defb 62, 128
	defb 55, 0
	defb 103, 0
	defb 206, 0
	defb 12, 0
	defb 8, 225
	defb 0, 227
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_27_b
	defb 0, 31
	defb 192, 7
	defb 176, 7
	defb 144, 3
	defb 120, 3
	defb 184, 3
	defb 88, 3
	defb 88, 3
	defb 184, 1
	defb 124, 1
	defb 236, 0
	defb 230, 0
	defb 115, 0
	defb 48, 0
	defb 16, 135
	defb 0, 199
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_27_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #27 y máscara
	; Primera columna
	._sprite_28_a
	defb 0, 255
	defb 0, 248
	defb 3, 224
	defb 13, 224
	defb 13, 192
	defb 30, 192
	defb 29, 192
	defb 26, 192
	defb 26, 192
	defb 29, 128
	defb 62, 0
	defb 179, 0
	defb 103, 0
	defb 20, 0
	defb 12, 193
	defb 0, 225
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_28_b
	defb 0, 255
	defb 0, 31
	defb 192, 7
	defb 176, 7
	defb 176, 3
	defb 120, 3
	defb 184, 3
	defb 88, 3
	defb 88, 3
	defb 184, 1
	defb 124, 0
	defb 205, 0
	defb 230, 0
	defb 40, 0
	defb 48, 131
	defb 0, 135
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_28_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #28 y máscara
	; Primera columna
	._sprite_29_a
	defb 7, 248
	defb 200, 48
	defb 48, 0
	defb 160, 0
	defb 0, 0
	defb 128, 0
	defb 0, 0
	defb 128, 0
	defb 18, 0
	defb 140, 0
	defb 32, 0
	defb 32, 0
	defb 208, 32
	defb 12, 240
	defb 3, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_29_b
	defb 224, 31
	defb 24, 7
	defb 4, 3
	defb 2, 1
	defb 82, 1
	defb 0, 1
	defb 30, 0
	defb 63, 0
	defb 33, 0
	defb 63, 0
	defb 30, 0
	defb 0, 1
	defb 2, 1
	defb 12, 3
	defb 240, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_29_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #29 y máscara
	; Primera columna
	._sprite_30_a
	defb 1, 254
	defb 6, 248
	defb 200, 48
	defb 48, 0
	defb 160, 0
	defb 0, 0
	defb 128, 0
	defb 12, 0
	defb 146, 0
	defb 0, 0
	defb 128, 0
	defb 32, 0
	defb 32, 0
	defb 216, 32
	defb 7, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_30_b
	defb 224, 31
	defb 24, 7
	defb 4, 3
	defb 2, 1
	defb 82, 1
	defb 0, 1
	defb 14, 0
	defb 31, 0
	defb 17, 0
	defb 31, 0
	defb 14, 0
	defb 0, 1
	defb 2, 1
	defb 12, 3
	defb 240, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_30_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #30 y máscara
	; Primera columna
	._sprite_31_a
	defb 7, 248
	defb 24, 224
	defb 32, 192
	defb 64, 128
	defb 74, 128
	defb 0, 128
	defb 112, 0
	defb 248, 0
	defb 136, 0
	defb 248, 0
	defb 112, 0
	defb 0, 128
	defb 64, 128
	defb 48, 192
	defb 15, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_31_b
	defb 128, 127
	defb 96, 31
	defb 19, 12
	defb 12, 0
	defb 5, 0
	defb 0, 0
	defb 1, 0
	defb 48, 0
	defb 73, 0
	defb 0, 0
	defb 1, 0
	defb 4, 0
	defb 4, 0
	defb 27, 4
	defb 224, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_31_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Sprite #31 y máscara
	; Primera columna
	._sprite_32_a
	defb 7, 248
	defb 24, 224
	defb 32, 192
	defb 64, 128
	defb 74, 128
	defb 0, 128
	defb 120, 0
	defb 252, 0
	defb 132, 0
	defb 252, 0
	defb 120, 0
	defb 0, 128
	defb 64, 128
	defb 48, 192
	defb 15, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._sprite_32_b
	defb 224, 31
	defb 19, 12
	defb 12, 0
	defb 5, 0
	defb 0, 0
	defb 1, 0
	defb 0, 0
	defb 1, 0
	defb 72, 0
	defb 49, 0
	defb 4, 0
	defb 4, 0
	defb 11, 4
	defb 48, 15
	defb 192, 63
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._sprite_32_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._spr_boom
	defb 0, 128
	defb 56, 0
	defb 117, 0
	defb 123, 0
	defb 127, 0
	defb 57, 0
	defb 0, 0
	defb 96, 0
	defb 238, 0
	defb 95, 0
	defb 31, 0
	defb 62, 0
	defb 53, 128
	defb 42, 128
	defb 20, 128
	defb 0, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._spr_boom_b
	defb 0, 3
	defb 240, 1
	defb 248, 0
	defb 236, 0
	defb 212, 0
	defb 248, 0
	defb 224, 1
	defb 24, 0
	defb 124, 0
	defb 120, 0
	defb 244, 0
	defb 168, 0
	defb 0, 1
	defb 0, 3
	defb 0, 63
	defb 0, 127
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._spr_boom_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._spr_empty
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	.spr_empty_b
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	.spr_empty_c
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
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


	LIB SPInvalidate
	LIB SPCompDListAddr
	LIB SPMoveSprAbs
	LIB SPTileArray
	LIB SPPrintAtInv
	LIB SPUpdateNow
	LIB SPInitialize
	LIB SPNullSprPtr
	LIB SPRegisterHook
	LIB SPCreateGenericISR
	LIB SPInitIM2
	LIB SPInitialize
	LIB SPCreateSpr
	XREF SProtatetblInitialize
	XREF SPDisplayList
;	SECTION	text

._keys
	defw	383
	defw	479
	defw	735
	defw	509
	defw	507

;	SECTION	code

;	SECTION	text

._key_1
	defw	503
;	SECTION	code


;	SECTION	text

._key_2
	defw	759
;	SECTION	code


;	SECTION	text

._key_3
	defw	1271
;	SECTION	code



._my_malloc
	ld	hl,0	;const
	push	hl
	call	sp_BlockAlloc
	pop	bc
	ret


;	SECTION	text

._u_malloc
	defw	_my_malloc

;	SECTION	code

;	SECTION	text

._u_free
	defw	0

;	SECTION	code

;	SECTION	text

._spritesClipValues
	defb	4
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 4, 4 + 20, 1, 1 + 30
;	SECTION	text

._sprite_cells
	defw	_sprite_1_a
	defw	_sprite_2_a
	defw	_sprite_3_a
	defw	_sprite_4_a
	defw	_sprite_5_a
	defw	_sprite_6_a
	defw	_sprite_7_a
	defw	_sprite_8_a
	defw	_sprite_9_a
	defw	_sprite_10_a
	defw	_sprite_11_a
	defw	_sprite_12_a
	defw	_sprite_13_a
	defw	_sprite_14_a
	defw	_sprite_15_a
	defw	_sprite_16_a
	defw	_sprite_17_a
	defw	_sprite_18_a
	defw	_sprite_19_a
	defw	_sprite_20_a
	defw	_sprite_21_a
	defw	_sprite_22_a
	defw	_sprite_23_a
	defw	_sprite_24_a
	defw	_sprite_25_a
	defw	_sprite_26_a
	defw	_sprite_27_a
	defw	_sprite_28_a
	defw	_sprite_29_a
	defw	_sprite_30_a
	defw	_sprite_31_a
	defw	_sprite_32_a

;	SECTION	code

	defw 0

._ISR
	ld hl, _isrc
	inc (hl)
	ret



._system_init
	di
	ld bc, 0xf1f1
	call SPInitIM2
	ld de, 0xf1f1
	call SPCreateGenericISR
	ld l, 255
	ld bc, _ISR
	call SPRegisterHook
	ld de, 0
	call SPInitialize
	ei
	ld a,0
	out (254),a
	ld	hl,0	;const
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,60840	;const
	push	hl
	call	sp_AddMemory
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	ld b, 0
	ld hl, SPTileArray
	ld de, _tileset
	.load_tileset_loop
	ld (hl), e
	inc h
	ld (hl), d
	dec h
	inc hl
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	djnz load_tileset_loop
	ld	hl,_spritesClipValues
	ld	(_spritesClip),hl
	ld	hl,0	;const
	push	hl
	ld	hl,3	;const
	push	hl
	ld	hl,_sprite_2_a
	push	hl
	ld	hl,1	;const
	push	hl
	call	sp_CreateSpr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_sp_player),hl
	push	hl
	ld	hl,_sprite_2_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,(_sp_player)
	push	hl
	ld	hl,_sprite_2_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,_player+15
	push	hl
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_2_a
	pop	de
	call	l_pint
	pop	de
	call	l_pint
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_18
.i_16
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_18
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_17
	jp	nc,i_17
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,3	;const
	push	hl
	ld	hl,_sprite_9_a
	push	hl
	ld	hl,2	;const
	push	hl
	call	sp_CreateSpr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_sprite_9_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_sprite_9_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_9_a
	pop	de
	call	l_pint
	jp	i_16
.i_17
	.fix_sprites
	ld b, 6
	ld hl, (_sp_player)
	call _fix_sprites
	ld de, _sp_moviles
	ld b, 3
	.fix_sprites_rep1
	push bc
	ld a, (de)
	ld l, a
	inc de
	ld a, (de)
	ld h, a
	inc de
	ld b, 6
	call _fix_sprites
	pop bc
	djnz fix_sprites_rep1
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
	ld a, (__x)
	ld c, a
	ld a, (__y)
	call SPCompDListAddr
	ex de, hl
	ld a, (__t)
	sla a
	sla a
	add 64
	ld hl, _tileset + 2048
	ld b, 0
	ld c, a
	add hl, bc
	ld c, a
	ld a, (hl)
	ld (de), a
	inc de
	inc hl
	ld a, c
	ld (de), a
	inc de
	inc a
	ld c, a
	inc de
	inc de
	ld a, (hl)
	ld (de), a
	inc de
	inc hl
	ld a, c
	ld (de), a
	inc a
	ex de, hl
	ld bc, 123
	add hl, bc
	ex de, hl
	ld c, a
	ld a, (hl)
	ld (de), a
	inc de
	inc hl
	ld a, c
	ld (de), a
	inc de
	inc a
	ld c, a
	inc de
	inc de
	ld a, (hl)
	ld (de), a
	inc de
	ld a, c
	ld (de), a
	ld a, (__x)
	ld c, a
	inc a
	ld e, a
	ld a, (__y)
	ld b, a
	inc a
	ld d, a
	ld iy, fsClipStruct
	call SPInvalidate
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


;	SECTION	text

._clr2d
	defm	"G"
;	SECTION	code



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
	ld (__n), a
	ld a, l
	add 16
	ld e, a
	ld a, (_clr2d)
	ld d, a
	ld a, (__x)
	ld c, a
	ld a, (__y)
	call SPPrintAtInv
	ld a, (__n)
	add 16
	ld e, a
	ld a, (_clr2d)
	ld d, a
	ld a, (__x)
	inc a
	ld c, a
	ld a, (__y)
	call SPPrintAtInv
	ret



._draw_text
	ld hl, 8
	add hl, sp
	ld a, (hl)
	ld (__x), a
	ld (__t), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__n), a
	dec hl
	ld a, (hl)
	dec hl
	ld l, (hl)
	ld h, a
	.draw_text_loop
	ld a, (__x)
	ld c, a
	inc a
	ld (__x), a
	ld a, (__n)
	ld d, a
	ld a, (hl)
	or a
	ret z
	inc hl
	cp 0x25
	jr z, draw_text_nl
	sub 32
	ld e, a
	ld a, (__y)
	push hl
	call SPPrintAtInv
	pop hl
	jr draw_text_loop
	.draw_text_nl
	ld a, (__t)
	ld (__x), a
	ld a, (__y)
	inc a
	ld (__y), a
	jr draw_text_loop
	ret



._any_key
	ld hl, 0
	xor a
	in a, (0xfe)
	and 0x1f
	cp 0x1f
	ret z
	ld l, 1
	ret



._pad_read
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_20
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_20
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_pad0),a
	ld	h,0
	ld	a,l
	ld	(_pad1),a
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
	jp	i_23
.i_21
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_23
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,40	;const
	call	l_ult
	jp	nc,i_22
	halt
	jp	i_21
.i_22
	ret



._espera_activa
.i_26
	call	_pad_read
	halt
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_25
.i_27
.i_24
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_26
.i_25
	ret



._cortina
	;; Antes que nada vamos a limpiar el PAPER de toda la pantalla
	;; para que no queden artefactos feos
	ld de, 22528 ; Apuntamos con DE a la zona de atributos
	ld b, 3 ; Procesamos 3 tercios
	.clearb1
	push bc
	ld b, 255 ; Procesamos los 256 atributos de cada tercio
	.clearb2
	ld a, (de) ; Nos traemos un atributo
	and 199 ; Le hacemos la mÃ¡scara 11000111 y dejamos PAPER a 0
	ld (de), a ; Y lo volvemos a poner
	inc de ; Siguiente atributo
	djnz clearb2
	pop bc
	djnz clearb1
	;; Y ahora el cÃ³digo original que escribÃ­ para UWOL:
	ld a, 8
	.repitatodo
	ld c, a ; Salvamos el contador de "repitatodo" en 'c'
	ld hl, 16384
	ld a, 12
	.bucle
	ld b, a ; Salvamos el contador de "bucle" en 'b'
	ld a, 255
	.bucle1
	sla (hl)
	inc hl
	dec a
	jr nz, bucle1
	ld a, 255
	.bucle2
	srl (hl)
	inc hl
	dec a
	jr nz, bucle2
	ld a, b ; Restituimos el contador de "bucle" a 'a'
	dec a
	jr nz, bucle
	ld a, c ; Restituimos el contador de "repitatodo" a 'a'
	dec a
	jr nz, repitatodo
	ret



._step
	ld a, 16
	out (254), a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	xor 16
	out (254), a
	ret



._blackout
	.blackout
	ld hl, 22528
	ld de, 22529
	ld bc, 767
	xor a
	ld (hl), a
	ldir
	ret
	ret



._unpack_screen
	ld de, 16384
	call depack
	ret



._select_controls
.i_28
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_30
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_29
.i_30
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_32
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_29
.i_32
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_34
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_29
.i_34
.i_33
.i_31
	jp	i_28
.i_29
	ret



._draw_rectangle
	ld a, (__x)
	ld c, a
	ld a, (__y)
	ld b, a
	ld a, (__x2)
	ld e, a
	ld a, (__y2)
	ld d, a
	ld iy, fsClipStruct
	call SPInvalidate
	.dr_outter_loop
	ld a, (__y)
	ld b, a
	ld a, (__y2)
	cp b
	ret c
	ld a, (__x)
	ld c, a
	ld a, (__y)
	call SPCompDListAddr
	ld a, (__x)
	ld b, a
	ld a, (__x2)
	inc a
	sub b
	ld b, a
	.dr_inner_loop
	ld a, (__t)
	ld (hl), a
	inc hl
	xor a
	ld (hl), a
	inc hl
	inc hl
	inc hl
	djnz dr_inner_loop
	.dr_outter_loop_continue
	ld hl, __y
	inc (hl)
	jr dr_outter_loop
	ret



._render_this_enemy
	ld a, (_enit)
	sla a
	ld c, a
	ld b, 0
	ld hl, _sp_moviles
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	pop ix
	ld iy, vpClipStruct
	ld hl, _en_an_current_frame
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld hl, _en_an_next_frame
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	or a
	sbc hl, de
	push bc
	ld b, h
	ld c, l
	ld a, (_rdy)
	srl a
	srl a
	srl a
	add 4
	ld h, a
	ld a, (_rdx)
	srl a
	srl a
	srl a
	add 1
	ld l, a
	ld a, (_rdx)
	and 7
	ld d, a
	ld a, (_rdy)
	and 7
	ld e, a
	call SPMoveSprAbs
	pop bc
	ld hl, _en_an_current_frame
	add hl, bc
	ex de, hl
	ld hl, _en_an_next_frame
	add hl, bc
	ldi
	ldi
	ret



._render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_37
.i_35
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_37
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_ult
	jp	nc,i_36
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
	jp	i_35
.i_36
	ld	hl,(_gpy)
	ld	h,0
	ld	a,l
	ld	(_rdy),a
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
	ld ix, (_sp_player)
	ld iy, vpClipStruct
	ld hl, (_player + 17)
	ld de, (_player + 15)
	or a
	sbc hl, de
	ld b, h
	ld c, l
	ld a, (_rdy)
	srl a
	srl a
	srl a
	add 4
	ld h, a
	ld a, (_rdx)
	srl a
	srl a
	srl a
	add 1
	ld l, a
	ld a, (_rdx)
	and 7
	ld d, a
	ld a, (_rdy)
	and 7
	ld e, a
	call SPMoveSprAbs
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ret



._saca_a_todo_el_mundo_de_aqui
	ld ix, (_sp_player)
	ld iy, vpClipStruct
	ld bc, 0
	ld hl, 0xfefe
	ld de, 0
	call SPMoveSprAbs
	xor a
	.hide_sprites_enems_loop
	ld (_gpit), a
	sla a
	ld c, a
	ld b, 0
	ld hl, _sp_moviles
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	pop ix
	ld iy, vpClipStruct
	ld bc, 0
	ld hl, 0xfefe
	ld de, 0
	call SPMoveSprAbs
	ld a, (_gpit)
	inc a
	cp 3
	jr nz, hide_sprites_enems_loop
	ret



._fix_sprites
	.vtc
	ld c, 0
	ld a, 6
	add a, l
	ld l, a
	jp nc, vtc_noinc1
	inc h
	.vtc_noinc1
	.vtc_loop
	ld a, (hl)
	or a
	jr z, vtc_fin
	inc hl
	ld l, (hl)
	ld h, a
	push hl
	ld a, c
	cp b
	jr c, vtc_next
	ld a, 7
	add a, l
	ld l, a
	jp nc, vtc_noinc2
	inc h
	.vtc_noinc2
	ld (hl), SPNullSprPtr%256
	inc hl
	ld (hl), SPNullSprPtr/256
	.vtc_next
	inc c
	pop hl
	jr vtc_loop
	.vtc_fin
	ret



._enems_en_an_calc
	ld a, l
	sla a
	add 16
	ld hl, (_enit)
	ld h, 0
	ld de, _en_an_base_frame
	add hl, de
	ld (hl), a
	jp _enems_calc_frame
	ret


	.playsfx
	;di
	ld l,a
	ld h,0
	add hl,hl
	ld de,proclist
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de,0
	jp (hl)
	.sound1 ;enemy destroyed
	ex de,hl
	ld bc,500
	.sound1l0
	ld a,(hl)
	and 16
	out ($FE),a
	ld e,a
	inc a
	sla a
	sla a
	.sound1l1
	dec a
	jr nz,sound1l1
	out ($FE),a
	ld a,e
	inc a
	add a,a
	add a,a
	add a,a
	.sound1l2
	dec a
	jr nz,sound1l2
	ld a,b
	inc hl
	dec bc
	ld a,b
	or c
	jr nz,sound1l0
	;ei
	ret
	.sound2 ;enemy hit
	ex de,hl
	ld bc,40*256+100
	.sound2l0
	ld a,(hl)
	and 16
	out ($FE),a
	inc hl
	ld a,c
	.sound2l1
	dec a
	jr nz,sound2l1
	out ($FE),a
	ld a,c
	.sound2l2
	dec a
	jr nz,sound2l2
	djnz sound2l0
	;ei
	ret
	.sound3 ;something
	ex de,hl
	ld b,100
	ld de,$1020
	.sound3l0
	ld a,(hl)
	and d
	out ($FE),a
	inc hl
	ld a,e
	.sound3l0a
	dec a
	jr nz,sound3l0a
	djnz sound3l0
	ld b,250
	.sound3l1
	ld a,(hl)
	and d
	out ($FE),a
	inc hl
	ld a,2
	.sound3l2
	dec a
	jr nz,sound3l2
	xor a
	out ($FE),a
	ld a,e
	.sound3l3
	dec a
	jr nz,sound3l3
	djnz sound3l1
	;ei
	ret
	.sound4 ;jump
	ld bc,20*256+250
	.sound4l0
	ld a,16
	out ($FE),a
	ld a,4
	.sound4l1
	dec a
	jr nz,sound4l1
	out ($FE),a
	ld a,c
	.sound4l2
	dec a
	jr nz,sound4l2
	dec c
	dec c
	djnz sound4l0
	;ei
	ret
	.sound5 ;player hit
	ex de,hl
	ld bc,100*256+16
	.sound5l0
	ld a,(hl)
	and c
	out ($FE),a
	inc hl
	ld a,110
	sub b
	ld e,a
	and c
	out ($FE),a
	.sound5l1
	dec e
	jr nz,sound5l1
	djnz sound5l0
	;ei
	ret
	.sound6 ;enemy destroyed 2
	ex de,hl
	ld bc,20*256+16
	.sound6l0
	ld a,(hl)
	inc hl
	and c
	out ($FE),a
	xor a
	.sound6l0a
	dec a
	jr nz,sound6l0a
	djnz sound6l0
	.sound6l1
	ld a,(hl)
	inc hl
	and c
	out ($FE),a
	.sound6l2
	dec a
	jr nz,sound6l2
	djnz sound6l1
	;ei
	ret
	.sound7 ;shot
	ex de,hl
	ld bc,100*256
	.sound7l0
	ld a,(hl)
	inc hl
	or c
	and 16
	out ($FE),a
	ld a,(hl)
	srl a
	srl a
	.sound7l1
	dec a
	jr nz,sound7l1
	ld a,c
	add a,4
	ld c,a
	djnz sound7l0
	;ei
	ret
	.sound8 ;take item
	ld a,200
	jr soundItem
	.sound9
	ld a,175
	jr soundItem
	.sound10
	ld a,100
	.soundItem
	ld (frq),a
	ld b,4
	ld d,128
	.sound8l2
	push bc
	;.frq=$+1
	; ld bc,2*256+200
	defb #01 ;ld bc
	.frq
	defb 200 ;+200
	defb 2 ;2*256
	.sound8l0
	push bc
	ld b,50
	.sound8l1
	xor 16
	and 16
	out ($FE),a
	ld e,a
	ld a,d
	.sound8l2b
	dec a
	jr nz,sound8l2b
	out ($FE),a
	ld a,129
	sub d
	.sound8l3
	dec a
	jr nz,sound8l3
	ld a,e
	ld e,c
	.sound8l4
	dec e
	jr nz,sound8l4
	djnz sound8l1
	pop bc
	ld a,c
	sub 16
	ld c,a
	djnz sound8l0
	pop bc
	srl d
	srl d
	djnz sound8l2
	;ei
	ret
	.proclist
	defw sound1
	defw sound2
	defw sound3
	defw sound4
	defw sound5
	defw sound6
	defw sound7
	defw sound8
	defw sound9
	defw sound10

._peta_el_beeper
	ld a, l
	call playsfx
	ret



._decode_text
	ld de, script_encoded_text
	add hl, de
	ld de, #((23600 + 3*18))
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
	ld hl, #((23600 + 3*18))
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
	and 0x02
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
	and #(0x01 | 0x80)
	cp #(0x01 | 0x80)
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
	and #(0x01 | 0x80)
	cp #(0x01 | 0x80)
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
	and #(0x02 | 0x01)
	cp #(0x02 | 0x01)
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
	and 0x02
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
	and 0x01
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
	xor a
	rra
	rra
	rra
	and 7
	ld (sfxRoutineToneBorder +1),a
	ld (sfxRoutineNoiseBorder +1),a
	ld (sfxRoutineSampleBorder+1),a
	.readData
	ld a,(ix+0) ;read block type
	ld c,(ix+1) ;read duration 1
	ld b,(ix+2)
	ld e,(ix+3) ;read duration 2
	ld d,(ix+4)
	push de
	pop iy
	dec a
	jr z,sfxRoutineTone
	dec a
	jr z,sfxRoutineNoise
	dec a
	jr z,sfxRoutineSample
	pop iy
	pop ix
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
	and 16 ;7
	and 16 ;7 dummy
	.sfxRoutineSampleBorder
	or 0 ;7
	out (254),a ;11
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
	;generate tone with many parameters
	.sfxRoutineTone
	ld e,(ix+5) ;freq
	ld d,(ix+6)
	ld a,(ix+9) ;duty
	ld (sfxRoutineToneDuty+1),a
	ld hl,0
	.sfxRT0
	push bc
	push iy
	pop bc
	.sfxRT1
	add hl,de ;11
	ld a,h ;4
	.sfxRoutineToneDuty
	cp 0 ;7
	sbc a,a ;4
	and 16 ;7
	.sfxRoutineToneBorder
	or 0 ;7
	out (254),a ;11
	ld a,(0) ;13 dummy
	dec bc ;6
	ld a,b ;4
	or c ;4
	jp nz,sfxRT1 ;10=88t
	ld a,(sfxRoutineToneDuty+1) ;duty change
	add a,(ix+10)
	ld (sfxRoutineToneDuty+1),a
	ld c,(ix+7) ;slide
	ld b,(ix+8)
	ex de,hl
	add hl,bc
	ex de,hl
	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRT0
	ld c,11
	jr nextData
	;generate noise with two parameters
	.sfxRoutineNoise
	ld e,(ix+5) ;pitch
	ld d,1
	ld h,d
	ld l,d
	.sfxRN0
	push bc
	push iy
	pop bc
	.sfxRN1
	ld a,(hl) ;7
	and 16 ;7
	.sfxRoutineNoiseBorder
	or 0 ;7
	out (254),a ;11
	dec d ;4
	jp z,sfxRN2 ;10
	nop ;4 dummy
	jp sfxRN3 ;10 dummy
	.sfxRN2
	ld d,e ;4
	inc hl ;6
	ld a,h ;4
	and 31 ;7
	ld h,a ;4
	ld a,(0) ;13 dummy
	.sfxRN3
	nop ;4 dummy
	dec bc ;6
	ld a,b ;4
	or c ;4
	jp nz,sfxRN1 ;10=88 or 112t
	ld a,e
	add a,(ix+6) ;slide
	ld e,a
	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRN0
	ld c,7
	jr nextData
	.sfxData
	.SoundEffectsData
	defw SoundEffect0Data
	defw SoundEffect1Data
	.SoundEffect0Data
	defb 3 ;sample
	defw 740
	defw Sample0Data+0
	defb 39
	defb 0
	.SoundEffect1Data
	defb 3 ;sample
	defw 1043
	defw Sample1Data+0
	defb 33
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
	jp	nc,i_43
	ld	hl,_player+28
	call	l_gchar
	ld	a,h
	or	l
	jr	nz,i_44_i_43
.i_43
	jp	i_42
.i_44_i_43
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
.i_42
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
	and 0x80
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
	and 0x80
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
	and 0x04
	jr z, m_horz_kp_left_or_right_p
	ld a, c
	and 0x08
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
	and 0x04
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
	and 0x08
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
	jp	i_47
.i_45
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_47
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_46
	ld bc, (_enit)
	xor a
	ld b, a
	ld hl, _en_an_frame
	add hl, bc
	ld (hl), a
	ld hl, _en_an_state
	add hl, bc
	ld (hl), a
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_uge
	jp	c,i_45
.i_48
	ld hl, (_enoffs)
	add hl, bc
	ld (_enoffsmasi), hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
.i_51
	ld	a,l
	cp	#(1% 256)
	jp	z,i_52
	cp	#(2% 256)
	jp	z,i_53
	cp	#(3% 256)
	jp	z,i_54
	cp	#(4% 256)
	jp	z,i_55
	jp	i_56
.i_52
.i_53
.i_54
.i_55
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_50
.i_56
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
.i_50
	call	_extra_enems_init
	call enems_update_values_store
	jp	i_45
.i_46
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
	call SPUpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_57
	ld	hl,0	;const
	call	_peta_el_beeper
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
	jp	i_58
.i_57
	ld	hl,1	;const
	call	_peta_el_beeper
.i_58
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
	jp	i_61
.i_59
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_61
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_ult
	jp	nc,i_60
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,__en_t
	ld	a,(hl)
	rlca
	jp	nc,i_62
	ld	l,a
	ld	h,0
	jp	i_63
.i_62
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_64
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
	jp	nc,i_65
	call en_lineal_do
.i_65
	call	_enems_calc_frame
	call	_extra_enems_move
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_67
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_67
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_68_i_67
.i_67
	jp	i_66
.i_68_i_67
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
	jp	i_69
.i_66
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_70
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_72
	call	_this_enemy_kills
	ld	a,h
	or	l
	jp	z,i_72
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_72
	jr	c,i_73_i_72
.i_72
	jp	i_71
.i_73_i_72
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_75
	ld	hl,(_player+8)
	ld	de,65504	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_75
	ld	hl,(__en_t)
	ld	h,0
	ex	de,hl
	ld	hl,(_flags+31)
	ld	h,0
	call	l_uge
	jr	c,i_76_i_75
.i_75
	jp	i_74
.i_76_i_75
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
	jp	i_77
.i_74
	ld	a,(_player+23)
	and	a
	jp	nz,i_78
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
.i_78
.i_77
.i_71
	ld	hl,8	;const
	call	_script
.i_70
.i_69
	call	_extra_enems_checks
.i_64
.i_63
.i_79
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_59
.i_60
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

._sprite_remove_aid
	call	_saca_a_todo_el_mundo_de_aqui
	LIB SPValidate
	ld c, 1
	ld b, 4
	ld d, 4+19
	ld e, 1+29
	ld iy, fsClipStruct
	call SPValidate
	ret



._recuadrius
	call	_sprite_remove_aid
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_82
.i_80
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_82
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_81
	jp	nc,i_81
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_85
.i_83
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_85
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
	jp	nc,i_84
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	add 4
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	ld b, a
	ld a, 4 + 19
	sub b
	call SPPrintAtInv
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
	jp	nc,i_86
	ld de, 0x4700
	ld a, (_rdi)
	add 1
	ld c, a
	ld a, (_rdx)
	add 4
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdi)
	ld b, a
	ld a, 1 + 29
	sub b
	ld c, a
	ld a, (_rdx)
	add 4
	call SPPrintAtInv
.i_86
	jp	i_83
.i_84
	halt
	call SPUpdateNow
	jp	i_80
.i_81
	ret



._do_extern_action
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
.i_89
	ld	a,l
	cp	#(0% 256)
	jp	z,i_90
	cp	#(1% 256)
	jp	z,i_91
	jp	i_88
.i_90
	ld	hl,65216	;const
	ld	(_player+8),hl
	jp	i_88
.i_91
	ld a, 1
	call shiruplay
	call	_recuadrius
.i_88
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



._draw_text_cbc
	.dtcbc_loop
	ld a, (_rdx)
	ld c, a
	inc a
	ld (_rdx), a
	ld a, (__n)
	ld d, a
	ld a, (hl)
	or a
	jr z, dtcbc_done
	inc hl
	sub 32
	halt
	halt
	jr z, dtcbc_loop
	ld e, a
	ld a, (_rdy)
	push hl
	call SPPrintAtInv
	call SPUpdateNow
	pop hl
	jr dtcbc_loop
	.dtcbc_done
	xor a
	ld (_rdc), a
	ret



._textbox
	ld (_gp_gen), hl
	call	_sprite_remove_aid
	ld a, 6
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _top_string
	ld a, 7
	ld (__n), a
	call draw_text_loop
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
	ld a, 7
	ld (__n), a
	call draw_text_loop
	.stb_notop
	ld a, (_rdy)
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _mid_string
	ld a, 7
	ld (__n), a
	call draw_text_loop
	ld a, (_rdy)
	inc a
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _bottom_string
	ld a, 7
	ld (__n), a
	call draw_text_loop
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
	ld a, 7
	ld (__n), a
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
	call SPUpdateNow
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
	call SPUpdateNow
	.stb_redraw_done
	ret


	._s_title
	BINARY "titlec.bin"
	._s_marco
	BINARY "marcoc.bin"
	._s_ending
	BINARY "endingc.bin"

._title_screen
	call SPUpdateNow
	call	_blackout
	ld hl, _s_title
	call _unpack_screen
	ld	hl,11	;const
	push	hl
	ld	hl,10	;const
	push	hl
	ld	hl,70	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,4	;const
	push	hl
	ld	hl,i_1+32
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	xor a
	call shiruplay
	call musicstart
	call	_select_controls
	ret



._game_ending
	call SPUpdateNow
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
	ld	hl,4	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,5	;const
	push	hl
	ld	hl,i_1+41
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_98
.i_96
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_98
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_97
	jp	nc,i_97
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_96
.i_97
	ld	hl,9	;const
	call	_peta_el_beeper
	call	_no_break
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._game_over
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
	ld	hl,79	;const
	push	hl
	ld	hl,i_1+66
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	hl,5	;const
	call	_peta_el_beeper
	call	_no_break
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._main
	ld sp, 61936
	call	_system_init
.i_99
	call	_title_screen
	call	_blackout
	call SPUpdateNow
	ld hl, _s_marco
	call _unpack_screen
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
.i_101
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_102
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
	.ml_ud_skip
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_103
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
.i_103
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_104
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_105
	or	l
	jp	z,i_105
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_106
.i_105
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_106
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
.i_104
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_107
	ld a, 21
	ld (__x), a
	ld a, 2
	ld (__y), a
	ld a, (_player + 28)
	ld (_keys_old), a
	call draw_2_digits_shortcut
.i_107
	ld	hl,(_flags)
	ld	h,0
	ex	de,hl
	ld	hl,(_flag_old)
	ld	h,0
	call	l_ne
	jp	nc,i_108
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
.i_108
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
	jp	z,i_109
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_112
	ld	a,l
	cp	#(1% 256)
	jp	z,i_113
	cp	#(2% 256)
	jp	z,i_114
	cp	#(3% 256)
	jp	z,i_115
	jp	i_111
.i_113
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	call	_peta_el_beeper
	jp	i_111
.i_114
	ld	hl,_player+28
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
	jp	i_111
.i_115
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
	jp	nc,i_116
	ld	hl,99	;const
	ld	(_player+29),hl
.i_116
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_111
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_117
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
.i_117
.i_109
	._hotspots_finally
	ld a, 1
	ld (_hotspot_flag), a
	jr _hotspots_done
	._hotspots_else
	xor a
	ld (_hotspot_flag), a
	._hotspots_done
	.ml_min_faps_loop
	ld a, (_isrc)
	cp 2
	jr nc, ml_min_faps_loop_end
	halt
	jr ml_min_faps_loop
	.ml_min_faps_loop_end
	xor a
	ld (_isrc), a
	ld a, (_n_pant)
	ld c, a
	ld a, (_on_pant)
	cp c
	jr nz, skipupd
	call SPUpdateNow
	.skipupd
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
	rlca
	jp	c,i_118
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
.i_118
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_120
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_121_i_120
.i_120
	jp	i_119
.i_121_i_120
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_122
.i_119
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_124
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_125_i_124
.i_124
	jp	i_123
.i_125_i_124
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_123
.i_122
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_127
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_127
	ld	a,(_n_pant)
	cp	#(20 % 256)
	jr	z,i_127_uge
	jp	c,i_127
.i_127_uge
	jr	i_128_i_127
.i_127
	jp	i_126
.i_128_i_127
	ld a, (_n_pant)
	sub 20
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_129
.i_126
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_131
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_132_i_131
.i_131
	jp	i_130
.i_132_i_131
	ld a, (_n_pant)
	add 20
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_130
.i_129
	ld	hl,765	;const
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_133
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(1 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_135
	inc	hl
	ld	a,(_n_pant)
	cp	#(20 % 256)
	jr	z,i_135_uge
	jp	c,i_135
.i_135_uge
	jr	i_136_i_135
.i_135
	jp	i_134
.i_136_i_135
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
.i_134
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_138
	inc	hl
	ld	a,(_n_pant)
	cp	#(80 % 256)
	jp	z,i_138
	jr	c,i_139_i_138
.i_138
	jp	i_137
.i_139_i_138
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
.i_137
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_141
	inc	hl
	ld	a,(_n_pant)
	cp	#(0 % 256)
	jp	z,i_141
	jp	c,i_141
	jr	i_142_i_141
.i_141
	jp	i_140
.i_142_i_141
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
.i_140
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_144
	inc	hl
	ld	a,(_n_pant)
	cp	#(80 % 256)
	jp	z,i_144
	jr	c,i_145_i_144
.i_144
	jp	i_143
.i_145_i_144
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
.i_143
	ld	hl,_pad_this_frame
	ld	a,(hl)
	rlca
	jp	c,i_146
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	dec	hl
.i_146
.i_133
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_147
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_147
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_148
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
.i_148
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_150
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_149
.i_150
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_149
	xor a
	ld (_pant_just_rendered), a
	jp	i_101
.i_102
	jp	i_99
.i_100
	ret


	; *****************************************************************************
	; * phaser1 engine, with synthesised drums
	; *
	; * original code by shiru - .http
	; * modified by chris cowley
	; *
	; * produced by beepola v1.05.01
	; ******************************************************************************
	.musicstart
	ld hl,musicdata ; <- pointer to music data. change
	; this to play a different song
	ld a,(hl) ; get the loop start pointer
	ld (pattern_loop_begin),a
	inc hl
	ld a,(hl) ; get the song end pointer
	ld (pattern_loop_end),a
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl
	ld (instrum_tbl),hl
	ld (current_inst),hl
	add hl,de
	ld (pattern_addr),hl
	xor a
	ld (pattern_ptr),a ; set the pattern pointer to zero
	ld h,a
	ld l,a
	ld (note_ptr),hl ; set the note offset (within this pattern) to 0
	.player
	;di
	push iy
	;ld a,border_col
	xor a
	ld h,$00
	ld l,a
	ld (cnt_1a),hl
	ld (cnt_1b),hl
	ld (div_1a),hl
	ld (div_1b),hl
	ld (cnt_2),hl
	ld (div_2),hl
	ld (out_1),a
	ld (out_2),a
	jr main_loop
	; ********************************************************************************************************
	; * next_pattern
	; *
	; * select the next pattern in sequence (and handle looping if weve reached pattern_loop_end
	; * execution falls through to playnote to play the first note from our next pattern
	; ********************************************************************************************************
	.next_pattern
	ld a,(pattern_ptr)
	inc a
	inc a
	defb $fe ; cp n
	.pattern_loop_end defb 0
	jr nz,no_pattern_loop
	; handle pattern looping at and of song
	defb $3e ; ld a,n
	.pattern_loop_begin defb 0
	.no_pattern_loop ld (pattern_ptr),a
	ld hl,$0000
	ld (note_ptr),hl ; start of pattern (note_ptr = 0)
	.main_loop
	ld iyl,0 ; set channel = 0
	.read_loop
	ld hl,(pattern_addr)
	ld a,(pattern_ptr)
	ld e,a
	ld d,0
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl) ; now de = start of pattern data
	ld hl,(note_ptr)
	inc hl ; increment the note pointer and...
	ld (note_ptr),hl ; ..store it
	dec hl
	add hl,de ; now hl = address of note data
	ld a,(hl)
	or a
	jr z,next_pattern ; select next pattern
	bit 7,a
	jp z,render ; play the currently defined note(s) and drum
	ld iyh,a
	and $3f
	cp $3c
	jp nc,other ; other parameters
	add a,a
	ld b,0
	ld c,a
	ld hl,freq_table
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld a,iyl ; iyl = 0 for channel 1, or = 1 for channel 2
	or a
	jr nz,set_note2
	ld (div_1a),de
	ex de,hl
	defb $dd,$21 ; ld ix,nn
	.current_inst
	defw $0000
	ld a,(ix+$00)
	or a
	jr z,l809b ; original code jumps into byte 2 of the djnz (invalid opcode fd)
	ld b,a
	.l8098 add hl,hl
	djnz l8098
	.l809b ld e,(ix+$01)
	ld d,(ix+$02)
	add hl,de
	ld (div_1b),hl
	ld iyl,1 ; set channel = 1
	ld a,iyh
	and $40
	jr z,read_loop ; no phase reset
	ld hl,out_1 ; reset phaser
	res 4,(hl)
	ld hl,$0000
	ld (cnt_1a),hl
	ld h,(ix+$03)
	ld (cnt_1b),hl
	jr read_loop
	.set_note2
	ld (div_2),de
	ld a,iyh
	ld hl,out_2
	res 4,(hl)
	ld hl,$0000
	ld (cnt_2),hl
	jp read_loop
	.set_stop
	ld hl,$0000
	ld a,iyl
	or a
	jr nz,set_stop2
	; stop channel 1 note
	ld (div_1a),hl
	ld (div_1b),hl
	ld hl,out_1
	res 4,(hl)
	ld iyl,1
	jp read_loop
	.set_stop2
	; stop channel 2 note
	ld (div_2),hl
	ld hl,out_2
	res 4,(hl)
	jp read_loop
	.other cp $3c
	jr z,set_stop ; stop note
	cp $3e
	jr z,skip_ch1 ; no changes to channel 1
	inc hl ; instrument change
	ld l,(hl)
	ld h,$00
	add hl,hl
	ld de,(note_ptr)
	inc de
	ld (note_ptr),de ; increment the note pointer
	defb $01 ; ld bc,nn
	.instrum_tbl
	defw $0000
	add hl,bc
	ld (current_inst),hl
	jp read_loop
	.skip_ch1
	ld iyl,$01
	jp read_loop
	.exit_player
	ld hl,$2758
	exx
	pop iy
	;ei
	ret
	.render
	and $7f ; l813a
	cp $76
	jp nc,drums
	ld d,a
	exx
	defb $21 ; ld hl,nn
	.cnt_1a defw $0000
	defb $dd,$21 ; ld ix,nn
	.cnt_1b defw $0000
	defb $01 ; ld bc,nn
	.div_1a defw $0000
	defb $11 ; ld de,nn
	.div_1b defw $0000
	defb $3e ; ld a,n
	.out_1 defb $0
	exx
	ex af,af ; beware!
	defb $21 ; ld hl,nn
	.cnt_2 defw $0000
	defb $01 ; ld bc,nn
	.div_2 defw $0000
	defb $3e ; ld a,n
	.out_2 defb $00
	.play_note
	; read keyboard
	ld e,a
	xor a
	in a,($fe)
	or $e0
	inc a
	.player_wait_key
	jr nz,exit_player
	ld a,e
	ld e,0
	.l8168 exx
	ex af,af ; beware!
	add hl,bc
	out ($fe),a
	jr c,l8171
	jr l8173
	.l8171 xor $10
	.l8173 add ix,de
	jr c,l8179
	jr l817b
	.l8179 xor $10
	.l817b ex af,af ; beware!
	out ($fe),a
	exx
	add hl,bc
	jr c,l8184
	jr l8186
	.l8184 xor $10
	.l8186 nop
	jp l818a
	.l818a exx
	ex af,af ; beware!
	add hl,bc
	out ($fe),a
	jr c,l8193
	jr l8195
	.l8193 xor $10
	.l8195 add ix,de
	jr c,l819b
	jr l819d
	.l819b xor $10
	.l819d ex af,af ; beware!
	out ($fe),a
	exx
	add hl,bc
	jr c,l81a6
	jr l81a8
	.l81a6 xor $10
	.l81a8 nop
	jp l81ac
	.l81ac exx
	ex af,af ; beware!
	add hl,bc
	out ($fe),a
	jr c,l81b5
	jr l81b7
	.l81b5 xor $10
	.l81b7 add ix,de
	jr c,l81bd
	jr l81bf
	.l81bd xor $10
	.l81bf ex af,af ; beware!
	out ($fe),a
	exx
	add hl,bc
	jr c,l81c8
	jr l81ca
	.l81c8 xor $10
	.l81ca nop
	jp l81ce
	.l81ce exx
	ex af,af ; beware!
	add hl,bc
	out ($fe),a
	jr c,l81d7
	jr l81d9
	.l81d7 xor $10
	.l81d9 add ix,de
	jr c,l81df
	jr l81e1
	.l81df xor $10
	.l81e1 ex af,af ; beware!
	out ($fe),a
	exx
	add hl,bc
	jr c,l81ea
	jr l81ec
	.l81ea xor $10
	.l81ec dec e
	jp nz,l8168
	exx
	ex af,af ; beware!
	add hl,bc
	out ($fe),a
	jr c,l81f9
	jr l81fb
	.l81f9 xor $10
	.l81fb add ix,de
	jr c,l8201
	jr l8203
	.l8201 xor $10
	.l8203 ex af,af ; beware!
	out ($fe),a
	exx
	add hl,bc
	jr c,l820c
	jr l820e
	.l820c xor $10
	.l820e dec d
	jp nz,play_note
	ld (cnt_2),hl
	ld (out_2),a
	exx
	ex af,af ; beware!
	ld (cnt_1a),hl
	ld (cnt_1b),ix
	ld (out_1),a
	jp main_loop
	; ************************************************************
	; * drums - synthesised
	; ************************************************************
	.drums
	add a,a ; on entry a=$75+drum number (i.e. $76 to $7e)
	ld b,0
	ld c,a
	ld hl,drum_table - 236
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	ex de,hl
	jp (hl)
	.drum_tone1 ld l,16
	jr drum_tone
	.drum_tone2 ld l,12
	jr drum_tone
	.drum_tone3 ld l,8
	jr drum_tone
	.drum_tone4 ld l,6
	jr drum_tone
	.drum_tone5 ld l,4
	jr drum_tone
	.drum_tone6 ld l,2
	.drum_tone
	ld de,3700
	ld bc,$0101
	xor a
	.dt_loop0 out ($fe),a
	dec b
	jr nz,dt_loop1
	xor 16
	ld b,c
	ex af,af ; beware!
	ld a,c
	add a,l
	ld c,a
	ex af,af ; beware!
	.dt_loop1 dec e
	jr nz,dt_loop0
	dec d
	jr nz,dt_loop0
	jp main_loop
	.drum_noise1 ld de,2480
	ld ixl,1
	jr drum_noise
	.drum_noise2 ld de,1070
	ld ixl,10
	jr drum_noise
	.drum_noise3 ld de,365
	ld ixl,101
	.drum_noise
	ld h,d
	ld l,e
	xor a
	ld c,a
	.dn_loop0 ld a,(hl)
	and 16
	or c
	out ($fe),a
	ld b,ixl
	.dn_loop1 djnz dn_loop1
	inc hl
	dec e
	jr nz,dn_loop0
	dec d
	jr nz,dn_loop0
	jp main_loop
	.pattern_addr defw $0000
	.pattern_ptr defb 0
	.note_ptr defw $0000
	; **************************************************************
	; * frequency table
	; **************************************************************
	.freq_table
	defw 178,189,200,212,225,238,252,267,283,300,318,337
	defw 357,378,401,425,450,477,505,535,567,601,637,675
	defw 715,757,802,850,901,954,1011,1071,1135,1202,1274,1350
	defw 1430,1515,1605,1701,1802,1909,2023,2143,2270,2405,2548,2700
	defw 2860,3030,3211,3402,3604,3818,4046,4286,4541,4811,5097,5400
	; *****************************************************************
	; * synth drum lookup table
	; *****************************************************************
	.drum_table
	defw drum_tone1,drum_tone2,drum_tone3,drum_tone4,drum_tone5,drum_tone6
	defw drum_noise1,drum_noise2,drum_noise3
	.musicdata
	DEFB 0 ; Pattern loop begin * 2
	DEFB 12 ; Song length * 2
	DEFW 12 ; Offset to start of song (length of instrument table)
	DEFB 0 ; Multiple
	DEFW 20 ; Detune
	DEFB 0 ; Phase
	DEFB 1 ; Multiple
	DEFW 5 ; Detune
	DEFB 1 ; Phase
	DEFB 0 ; Multiple
	DEFW 5 ; Detune
	DEFB 1 ; Phase
	.patterndata DEFW PAT0
	DEFW PAT1
	DEFW PAT0
	DEFW PAT1
	DEFW PAT2
	DEFW PAT3
	; *** Pattern data - $00 marks the end of a pattern ***
	.pat0
	DEFB $BD,4
	DEFB 160
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 160
	DEFB 5
	DEFB 165
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 160
	DEFB 5
	DEFB 162
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 160
	DEFB 5
	DEFB 162
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 160
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 160
	DEFB 5
	DEFB 165
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 160
	DEFB 5
	DEFB 162
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 160
	DEFB 5
	DEFB 165
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 160
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 158
	DEFB 5
	DEFB 165
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 158
	DEFB 5
	DEFB 162
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 158
	DEFB 5
	DEFB 162
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 158
	DEFB 5
	DEFB 160
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 158
	DEFB 118
	DEFB 4
	DEFB 165
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 158
	DEFB 5
	DEFB 162
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 158
	DEFB 5
	DEFB 165
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 158
	DEFB 118
	DEFB 4
	DEFB $00
	.pat1
	DEFB $BD,4
	DEFB 160
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 156
	DEFB 5
	DEFB 165
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 156
	DEFB 5
	DEFB 162
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 156
	DEFB 5
	DEFB 162
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 156
	DEFB 118
	DEFB 4
	DEFB 160
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 156
	DEFB 5
	DEFB 165
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 156
	DEFB 5
	DEFB 162
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 156
	DEFB 5
	DEFB 165
	DEFB 144
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 156
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 158
	DEFB 5
	DEFB 190
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 158
	DEFB 5
	DEFB 190
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 158
	DEFB 5
	DEFB 148
	DEFB 146
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 158
	DEFB 5
	DEFB 150
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 160
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 150
	DEFB 160
	DEFB 5
	DEFB 148
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 150
	DEFB 163
	DEFB 5
	DEFB 151
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 163
	DEFB 118
	DEFB 4
	DEFB $00
	.pat2
	DEFB $BD,4
	DEFB 148
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 160
	DEFB 5
	DEFB 190
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 147
	DEFB 160
	DEFB 5
	DEFB 190
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 160
	DEFB 5
	DEFB 155
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 160
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 160
	DEFB 5
	DEFB 190
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 160
	DEFB 5
	DEFB 190
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 160
	DEFB 5
	DEFB 154
	DEFB 148
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 160
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 162
	DEFB 5
	DEFB 190
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 147
	DEFB 162
	DEFB 5
	DEFB 190
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 162
	DEFB 5
	DEFB 155
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 162
	DEFB 5
	DEFB 190
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 162
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 162
	DEFB 5
	DEFB 190
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 162
	DEFB 5
	DEFB 154
	DEFB 150
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 162
	DEFB 118
	DEFB 4
	DEFB $00
	.pat3
	DEFB $BD,4
	DEFB 148
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 163
	DEFB 5
	DEFB 190
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 147
	DEFB 163
	DEFB 5
	DEFB 190
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 163
	DEFB 5
	DEFB 155
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 163
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 163
	DEFB 5
	DEFB 190
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 163
	DEFB 5
	DEFB 190
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 154
	DEFB 163
	DEFB 5
	DEFB 154
	DEFB 151
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 163
	DEFB 118
	DEFB 4
	DEFB 148
	DEFB 153
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 165
	DEFB 5
	DEFB 190
	DEFB 153
	DEFB 118
	DEFB 4
	DEFB 147
	DEFB 165
	DEFB 5
	DEFB 190
	DEFB 153
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 165
	DEFB 5
	DEFB 155
	DEFB 153
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 165
	DEFB 5
	DEFB 190
	DEFB 155
	DEFB 118
	DEFB 4
	DEFB 156
	DEFB 167
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 155
	DEFB 118
	DEFB 4
	DEFB 190
	DEFB 167
	DEFB 5
	DEFB 168
	DEFB 156
	DEFB 118
	DEFB 4
	DEFB 167
	DEFB 168
	DEFB 5
	DEFB 165
	DEFB 156
	DEFB 118
	DEFB 4
	DEFB 163
	DEFB 168
	DEFB 118
	DEFB 4
	DEFB $00
;	SECTION	text

.i_1
	defm	"1\TECLADO%2\KEMPSTON%3\SINCLAI"
	defm	"R"
	defb	0

	defm	"MK1 V3\2"
	defb	0

	defm	"NOS VEMOS EN ICE PALACE!"
	defb	0

	defm	"GAME OVER!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._n_enems	defs	1
.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._sp_moviles	defs	6
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._hotspot_t	defs	1
._spritesClip	defs	2
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
._sp_player	defs	2
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
._enit	defs	1
._joyfunc	defs	2
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
._gpx	defs	1
._rdi	defs	1
._gpy	defs	1
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._tat	defs	1
._rdd	defs	1
._rdb	defs	1
._rdc	defs	1
._rdn	defs	1
._pti	defs	1
._ptj	defs	1
._tqt	defs	1
._tpx	defs	1
._tpy	defs	1
._enoffsmasi	defs	2
._pant_just_rendered	defs	1
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	XDEF	_n_enems
	XDEF	__en_t
	LIB	sp_BlockAlloc
	XDEF	__en_x
	XDEF	__en_y
	LIB	sp_ScreenStr
	XDEF	_ay_player_on
	defc	_ay_player_on	=	23297
	XDEF	_hotspots
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	XDEF	_clr2d
	LIB	sp_MouseAMXInit
	XDEF	_draw_text_cbc
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sp_moviles
	XDEF	_spr_empty
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	__en_y2
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_SetMousePosAMX
	LIB	sp_HashAdd
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23651
	XDEF	_extra_enems_init
	XDEF	_hotspot_t
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_player_walk_cycle
	XDEF	_half_life
	XDEF	__en_mx
	XDEF	__en_my
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_AddMemory
	LIB	sp_BlockCount
	XDEF	_sprite_cells
	XDEF	_enoffs_index
	XDEF	_en_an_state
	defc	_en_an_state	=	23645
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_gp_gen_alt
	XDEF	_extra_enems_move
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
	XDEF	_mueve_bicharracos
	LIB	sp_Heapify
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	XDEF	_key_1
	XDEF	_key_2
	XDEF	_key_3
	LIB	sp_MoveSprRel
	XDEF	_recuadrius
	XDEF	_hit_h
	XDEF	_gp_gen_org
	XDEF	_blackout
	LIB	sp_TileArray
	LIB	sp_MouseSim
	XDEF	_map_buff
	defc	_map_buff	=	23450
	LIB	sp_BlockFit
	XDEF	_hit_v
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	XDEF	_thrusting
	XDEF	_player_custom_veng
	XDEF	_mid_string
	LIB	sp_ClearRect
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	LIB	sp_ListAppend
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_pad_read
	XDEF	_t_alt
	LIB	sp_JoyKempston
	LIB	sp_UpdateNow
	LIB	sp_MouseKempston
	LIB	sp_PrintString
	LIB	sp_PixelDown
	LIB	sp_MoveSprAbsC
	LIB	sp_PixelLeft
	XDEF	_extra_enems_checks
	LIB	sp_InitAlloc
	XDEF	_espera_activa
	LIB	sp_DeleteSpr
	XDEF	__n
	LIB	sp_JoyTimexEither
	XDEF	_unpack_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	23642
	XDEF	_title_screen
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_hotspot_flag
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	XDEF	_player_custom_frame
	LIB	sp_PrintAtDiff
	XDEF	_bottom_string
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_sprite_11_a
	XDEF	_sprite_11_b
	XDEF	_sprite_11_c
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_sprite_12_c
	XDEF	_sprite_20_a
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_sprite_20_b
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
	XDEF	_sprite_20_c
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_sprite_15_c
	XDEF	_sprite_21_a
	XDEF	_sprite_16_a
	XDEF	_sprite_16_b
	XDEF	_sprite_16_c
	XDEF	_sprite_21_b
	XDEF	_sprite_17_a
	XDEF	_sprite_17_b
	XDEF	_sprite_17_c
	XDEF	_sprite_21_c
	XDEF	_sprite_18_a
	XDEF	_sprite_18_b
	XDEF	_sprite_18_c
	XDEF	_sprite_22_a
	XDEF	_sprite_19_a
	XDEF	_sprite_19_b
	XDEF	_sprite_19_c
	XDEF	_sprite_22_b
	XDEF	_sprite_22_c
	XDEF	_sprite_23_a
	XDEF	_sprite_23_b
	XDEF	_sprite_23_c
	XDEF	_sprite_24_a
	XDEF	_sprite_24_b
	XDEF	_sprite_24_c
	XDEF	_sprite_25_a
	XDEF	_sprite_25_b
	XDEF	_sprite_25_c
	XDEF	_sprite_26_a
	XDEF	_sprite_26_b
	XDEF	_sprite_26_c
	XDEF	_sprite_27_a
	XDEF	_sprite_27_b
	XDEF	_sprite_27_c
	XDEF	_sprite_28_a
	XDEF	_sprite_28_b
	XDEF	_sprite_28_c
	XDEF	_sprite_29_a
	XDEF	_sprite_29_b
	XDEF	_sprite_29_c
	XDEF	_sprite_30_a
	XDEF	_sprite_30_b
	XDEF	_sprite_30_c
	XDEF	_sprite_31_a
	XDEF	_sprite_31_b
	XDEF	_sprite_31_c
	XDEF	_sprite_32_a
	XDEF	_sprite_32_b
	XDEF	_sprite_32_c
	XDEF	_ptgmx
	XDEF	_ptgmy
	XDEF	_disable_collide_platform
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	23606
	XDEF	_gp_gen
	LIB	sp_InitIM2
	XDEF	_on_pant
	LIB	sp_RegisterHookLast
	LIB	sp_RemoveHook
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_MoveSprRelC
	LIB	sp_Pallette
	LIB	sp_GetTiles
	LIB	sp_WaitForNoKey
	LIB	sp_GetCharAddr
	LIB	sp_HashDelete
	XDEF	_enoffs
	XDEF	_sp_player
	XDEF	_spritesClipValues
	XDEF	_render_this_enemy
	XDEF	_pad_this_frame
	XDEF	_fix_sprites
	XREF	_script_n
	XDEF	_custom_bg_hit
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_cm_two_points
	XDEF	_shl_player_coords
	XDEF	_init_player
	XDEF	_draw_and_advance
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_sprite_remove_aid
	XDEF	_n_pant
	LIB	sp_Random32
	LIB	sp_ListInsert
	LIB	sp_ListFree
	XDEF	_en_j
	XDEF	_redraw_after_text
	XDEF	_en_an_ff
	defc	_en_an_ff	=	23648
	XDEF	_system_init
	XDEF	_draw_rectangle
	XDEF	_ISR
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_init_malotes
	XDEF	_enit
	XDEF	_collide_enem
	XDEF	_main
	XDEF	_mapa
	LIB	sp_ListSearch
	LIB	sp_WaitForKey
	XDEF	_draw_coloured_tile
	LIB	sp_Wait
	LIB	sp_GetScrnAddr
	XDEF	_joyfunc
	LIB	sp_PutTiles
	XDEF	_gpcx
	XDEF	_gpcy
	XDEF	_attr
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_s_title
	XDEF	_gpit
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23630
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23636
	LIB	sp_RemoveDList
	LIB	sp_ListNext
	XDEF	_scenery_info
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_enems_calc_frame
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_isrc
	defc	_isrc	=	23296
	XDEF	_objs_old
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_rdmt
	XDEF	_extra_enems_killed
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_move
	XDEF	_flag_old
	XDEF	_wall
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	LIB	sp_MoveSprAbsNC
	XDEF	_check_and_clear_cerrojo
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_this_enemy_kills
	XDEF	_pvx_total
	XDEF	_hotspot_t_r
	XDEF	_at1
	XDEF	_at2
	XDEF	__x2
	XDEF	__y2
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	_step
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_decode_text
	XDEF	_cx1
	XDEF	_cx2
	XDEF	_cy1
	XDEF	_cy2
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_calc_hotspot_ptr
	XDEF	_u_free
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_redraw_from_buffer
	XDEF	_pvy_total
	XDEF	_top_string
	XDEF	_temp_string
	LIB	sp_InstallISR
	XDEF	_script_param
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	_idx
	XDEF	_en_an_x
	defc	_en_an_x	=	23618
	XDEF	_en_an_y
	defc	_en_an_y	=	23624
	XDEF	_player
	XDEF	_sprite_1_a
	XDEF	_sprite_1_b
	XDEF	_sprite_1_c
	XDEF	_ay_counter
	defc	_ay_counter	=	23298
	XDEF	_sprite_2_a
	XDEF	_sprite_2_b
	XDEF	_sprite_2_c
	XDEF	_rda
	XDEF	_sprite_3_a
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	XDEF	_gpx
	XDEF	_sprite_4_a
	XDEF	_sprite_4_b
	XDEF	_sprite_4_c
	XDEF	_rdi
	XDEF	_sprite_5_a
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_gpy
	XDEF	_sprite_6_a
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
	XDEF	_sprite_7_a
	XDEF	_sprite_7_b
	XDEF	_sprite_7_c
	XDEF	_en_tocado
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_sprite_8_c
	XDEF	_keys_old
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	XDEF	_sprite_9_c
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_tat
	XDEF	_rdd
	XDEF	_tileset
	XDEF	_rdb
	XDEF	_rdc
	XDEF	_comportamiento_tiles
	XDEF	_rdn
	XDEF	_pti
	XDEF	_ptj
	LIB	sp_Initialize
	LIB	sp_SwapEndian
	LIB	sp_ComputePos
	LIB	sp_JoyTimexLeft
	XDEF	_bitmask
	LIB	sp_JoyTimexRight
	LIB	sp_SetMousePosKempston
	LIB	sp_CharDown
	LIB	sp_CharLeft
	LIB	sp_PixelRight
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	LIB	sp_HuffEncode
	XDEF	_tqt
	XDEF	_draw_2_digits
	XDEF	_tpx
	XDEF	_tpy
	XDEF	_no_break
	XDEF	_enoffsmasi
	XREF	_script_result
	XDEF	_script
	XDEF	_player_flicker
	XDEF	_check_lock_or_box_horz
	XDEF	_init_player_values
	XDEF	_init_hotspots
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	LIB	sp_inp
	LIB	sp_IterateSprChar
	XDEF	_check_lock_or_box_vert
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_hotspot_paint
	XDEF	_pant_just_rendered
	LIB	sp_IntPtInterval
	LIB	sp_RegisterHookFirst
	XDEF	__baddies_pointer
	LIB	sp_HashLookup
	XREF	_script_do
	XDEF	_any_key
	LIB	sp_PFill
	LIB	sp_HashRemove
	LIB	sp_CharUp
	XDEF	_orig_tile
	XREF	_script_tn
	XDEF	_en_an_frame
	defc	_en_an_frame	=	23600
	XDEF	_success
	LIB	sp_MoveSprRelNC
	XREF	_script_tx
	XREF	_script_ty
	XDEF	_textbox
	XDEF	_do_extern_action
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_render_all_sprites
	LIB	sp_IterateDList
	XDEF	_spr_boom
	XDEF	_draw_scr_background
	XDEF	_select_controls
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
