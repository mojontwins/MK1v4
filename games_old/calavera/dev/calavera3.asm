;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Fri Jun 13 14:47:35 2025



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	6

	defm	""
	defb	6

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	8

	defm	""
	defb	6

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	8

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	6

	defm	""
	defb	128

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

;	SECTION	code


	._tileset
	BINARY "tileset.bin"
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #0 y 1
	; Primera columna
	._sprite_1_a
	defb 1
	._sprite_2_a
	defb 0
	defb 7, 3
	defb 1, 0
	defb 15, 15
	defb 55, 23
	defb 59, 55
	defb 31, 59
	defb 3, 31
	defb 7, 3
	defb 14, 3
	defb 12, 1
	defb 12, 3
	defb 24, 15
	defb 16, 13
	defb 48, 9
	defb 56, 1
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_1_b
	defb 224
	._sprite_2_b
	defb 192
	defb 128, 240
	defb 128, 192
	defb 128, 128
	defb 128, 192
	defb 192, 160
	defb 224, 254
	defb 254, 254
	defb 254, 128
	defb 192, 128
	defb 192, 192
	defb 192, 192
	defb 192, 128
	defb 96, 128
	defb 96, 128
	defb 112, 192
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_1_c
	defb 0
	._sprite_2_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #2 y 3
	; Primera columna
	._sprite_3_a
	defb 1
	._sprite_4_a
	defb 1
	defb 0, 1
	defb 0, 7
	defb 7, 3
	defb 11, 15
	defb 27, 23
	defb 29, 55
	defb 15, 59
	defb 1, 31
	defb 3, 6
	defb 3, 6
	defb 3, 62
	defb 2, 60
	defb 6, 32
	defb 6, 0
	defb 7, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_3_b
	defb 224
	._sprite_4_b
	defb 128
	defb 120, 224
	defb 96, 128
	defb 192, 128
	defb 224, 192
	defb 208, 167
	defb 255, 255
	defb 255, 248
	defb 192, 252
	defb 240, 12
	defb 56, 12
	defb 120, 14
	defb 224, 0
	defb 128, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_3_c
	defb 0
	._sprite_4_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #4 y 5
	; Primera columna
	._sprite_5_a
	defb 7
	._sprite_6_a
	defb 3
	defb 1, 15
	defb 1, 3
	defb 1, 1
	defb 1, 3
	defb 3, 5
	defb 7, 127
	defb 127, 127
	defb 127, 1
	defb 3, 1
	defb 3, 3
	defb 3, 3
	defb 3, 1
	defb 6, 1
	defb 6, 1
	defb 14, 3
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_5_b
	defb 128
	._sprite_6_b
	defb 0
	defb 224, 192
	defb 128, 0
	defb 240, 240
	defb 236, 232
	defb 220, 236
	defb 248, 220
	defb 192, 248
	defb 224, 192
	defb 112, 192
	defb 48, 128
	defb 48, 192
	defb 24, 240
	defb 8, 176
	defb 12, 144
	defb 28, 128
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_5_c
	defb 0
	._sprite_6_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #6 y 7
	; Primera columna
	._sprite_7_a
	defb 7
	._sprite_8_a
	defb 1
	defb 30, 7
	defb 6, 1
	defb 3, 1
	defb 7, 3
	defb 11, 229
	defb 255, 255
	defb 255, 31
	defb 3, 63
	defb 15, 48
	defb 28, 48
	defb 30, 112
	defb 7, 0
	defb 1, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_7_b
	defb 128
	._sprite_8_b
	defb 128
	defb 0, 128
	defb 0, 224
	defb 224, 192
	defb 208, 240
	defb 216, 232
	defb 184, 236
	defb 240, 220
	defb 128, 248
	defb 192, 96
	defb 192, 96
	defb 192, 124
	defb 64, 60
	defb 96, 4
	defb 96, 0
	defb 224, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_7_c
	defb 0
	._sprite_8_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #8 y 9
	; Primera columna
	._sprite_9_a
	defb 1
	._sprite_10_a
	defb 1
	defb 3, 3
	defb 66, 197
	defb 162, 165
	defb 34, 37
	defb 35, 167
	defb 31, 31
	defb 1, 7
	defb 0, 2
	defb 1, 15
	defb 0, 98
	defb 1, 87
	defb 12, 74
	defb 19, 199
	defb 16, 0
	defb 112, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_9_b
	defb 128
	._sprite_10_b
	defb 128
	defb 192, 192
	defb 163, 66
	defb 165, 69
	defb 164, 68
	defb 229, 196
	defb 248, 248
	defb 224, 128
	defb 64, 0
	defb 240, 128
	defb 70, 0
	defb 234, 128
	defb 82, 48
	defb 227, 200
	defb 0, 8
	defb 0, 14
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_9_c
	defb 0
	._sprite_10_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #10 y 11
	; Primera columna
	._sprite_11_a
	defb 7
	._sprite_12_a
	defb 3
	defb 15, 7
	defb 13, 15
	defb 7, 15
	defb 11, 5
	defb 21, 7
	defb 42, 27
	defb 40, 101
	defb 40, 138
	defb 40, 144
	defb 40, 72
	defb 36, 36
	defb 32, 0
	defb 16, 0
	defb 8, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_11_b
	defb 224
	._sprite_12_b
	defb 192
	defb 240, 224
	defb 176, 240
	defb 224, 240
	defb 208, 160
	defb 168, 224
	defb 84, 216
	defb 20, 166
	defb 20, 81
	defb 20, 9
	defb 20, 18
	defb 36, 36
	defb 4, 0
	defb 8, 0
	defb 16, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_11_c
	defb 0
	._sprite_12_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #12 y 13
	; Primera columna
	._sprite_13_a
	defb 0
	._sprite_14_a
	defb 0
	defb 60, 0
	defb 124, 32
	defb 248, 66
	defb 248, 67
	defb 250, 103
	defb 255, 245
	defb 255, 255
	defb 253, 255
	defb 255, 255
	defb 119, 251
	defb 119, 252
	defb 19, 124
	defb 0, 124
	defb 0, 30
	defb 0, 6
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_13_b
	defb 0
	._sprite_14_b
	defb 0
	defb 60, 0
	defb 62, 4
	defb 31, 66
	defb 31, 194
	defb 95, 230
	defb 255, 175
	defb 255, 255
	defb 191, 255
	defb 255, 255
	defb 238, 223
	defb 238, 63
	defb 200, 62
	defb 0, 62
	defb 0, 120
	defb 0, 96
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_13_c
	defb 0
	._sprite_14_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Sprites #14 y 15
	; Primera columna
	._sprite_15_a
	defb 255
	._sprite_16_a
	defb 255
	defb 255, 255
	defb 255, 255
	defb 3, 3
	defb 7, 7
	defb 7, 7
	defb 1, 1
	defb 3, 3
	defb 3, 3
	defb 1, 0
	defb 3, 1
	defb 4, 1
	defb 4, 0
	defb 2, 0
	defb 1, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._sprite_15_b
	defb 255
	._sprite_16_b
	defb 255
	defb 255, 255
	defb 255, 255
	defb 224, 224
	defb 224, 224
	defb 224, 224
	defb 192, 192
	defb 192, 192
	defb 192, 192
	defb 192, 128
	defb 192, 128
	defb 32, 0
	defb 32, 128
	defb 64, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._sprite_15_c
	defb 0
	._sprite_16_c
	defb 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	._sprite_17_a
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
	._sprite_17_b
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
	._sprite_18_a
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	._sprite_18_b
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	._sprite_18_c
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	defb 0, 255, 0, 255, 0, 255, 0, 255
	._sprite_19_a
	defb 0, 0
	defb 0, 0
	defb 24, 0
	defb 60, 0
	defb 60, 0
	defb 24, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	._sprite_19_b
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
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
	defb	0
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 0, 0 + 20, 1, 1 + 30
;	SECTION	text

._player_cells
	defw	_sprite_1_a
	defw	_sprite_2_a
	defw	_sprite_3_a
	defw	_sprite_4_a
	defw	_sprite_5_a
	defw	_sprite_6_a
	defw	_sprite_7_a
	defw	_sprite_8_a

;	SECTION	code

;	SECTION	text

._enem_cells
	defw	_sprite_9_a
	defw	_sprite_10_a
	defw	_sprite_11_a
	defw	_sprite_12_a
	defw	_sprite_13_a
	defw	_sprite_14_a
	defw	_sprite_15_a
	defw	_sprite_16_a

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
	ld	hl,55	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,60615	;const
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
	ld	hl,64	;const
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
	jp	i_19
.i_17
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_19
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_18
	jp	nc,i_18
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,64	;const
	push	hl
	ld	hl,3	;const
	push	hl
	ld	hl,_sprite_9_a
	push	hl
	ld	hl,1	;const
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
	jp	i_17
.i_18
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
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_22
.i_20
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_22
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_21
	jp	nc,i_21
	ld	hl,_sp_bullets
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,64	;const
	push	hl
	ld	hl,2	;const
	push	hl
	ld	hl,_sprite_19_a
	push	hl
	ld	hl,1	;const
	push	hl
	call	sp_CreateSpr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_sp_bullets
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
	ld	hl,_sprite_19_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	jp	i_20
.i_21
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
	add 0
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
	ld	bc,i_24
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_24
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
	jp	i_27
.i_25
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_27
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,40	;const
	call	l_ult
	jp	nc,i_26
	halt
	jp	i_25
.i_26
	ret



._espera_activa
.i_30
	call	_pad_read
	halt
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_29
.i_31
.i_28
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_30
.i_29
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
	and 199 ; Le hacemos la máscara 11000111 y dejamos PAPER a 0
	ld (de), a ; Y lo volvemos a poner
	inc de ; Siguiente atributo
	djnz clearb2
	pop bc
	djnz clearb1
	;; Y ahora el código original que escribí para UWOL:
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
.i_32
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_34
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_33
.i_34
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_36
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_33
.i_36
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_38
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_33
.i_38
.i_37
.i_35
	jp	i_32
.i_33
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
	add 0
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
	jp	i_41
.i_39
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_41
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_40
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
	jp	i_39
.i_40
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
	add 0
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
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_44
.i_42
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_44
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_43
	jp	nc,i_43
	ld	de,_bullets_estado
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_45
	ld	de,_bullets_x
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	de,_bullets_y
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld a, (_rdi)
	sla a
	ld c, a
	ld b, 0
	ld hl, _sp_bullets
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	pop ix
	ld iy, vpClipStruct
	ld bc, 0
	ld a, (_rdy)
	srl a
	srl a
	srl a
	add 0
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
	jp	i_46
.i_45
	ld a, (_rdi)
	sla a
	ld c, a
	ld b, 0
	ld hl, _sp_bullets
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
.i_46
	jp	i_42
.i_43
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



._script
	ld a, l
	ld (_script_n), a
	ld a, (_tpx)
	ld c, a
	ld a, (_tpy)
	call qtile_do
	ld a, l
	ld (_tqt), a
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
;	SECTION	text

._malotes
	defb	192
	defb	128
	defb	176
	defb	32
	defb	192
	defb	128
	defb	-2
	defb	-2
	defb	2
	defs	1
	defb	64
	defb	128
	defb	16
	defb	128
	defb	64
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	32
	defb	112
	defb	16
	defb	112
	defb	32
	defb	112
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	48
	defb	144
	defb	48
	defb	144
	defb	208
	defb	144
	defb	2
	defb	0
	defb	4
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	208
	defb	112
	defb	16
	defb	112
	defb	208
	defb	112
	defb	-2
	defb	0
	defb	4
	defs	1
	defb	160
	defb	64
	defb	160
	defb	64
	defb	192
	defb	64
	defb	1
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	128
	defb	128
	defb	128
	defb	80
	defb	128
	defb	128
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	16
	defb	16
	defb	16
	defb	16
	defb	32
	defb	16
	defb	1
	defb	0
	defb	5
	defs	1
	defb	96
	defb	112
	defb	96
	defb	32
	defb	96
	defb	112
	defb	0
	defb	-2
	defb	2
	defs	1
	defb	64
	defb	128
	defb	16
	defb	128
	defb	64
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	32
	defb	64
	defb	32
	defb	64
	defb	48
	defb	64
	defb	1
	defb	0
	defb	2
	defs	1
	defb	144
	defb	128
	defb	32
	defb	128
	defb	144
	defb	128
	defb	-2
	defb	0
	defb	1
	defs	1
	defb	176
	defb	144
	defb	176
	defb	80
	defb	176
	defb	144
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	112
	defb	0
	defb	2
	defb	4
	defs	1
	defb	16
	defb	80
	defb	16
	defb	80
	defb	32
	defb	80
	defb	1
	defb	0
	defb	1
	defs	1
	defb	32
	defb	16
	defb	16
	defb	16
	defb	32
	defb	16
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	96
	defb	16
	defb	96
	defb	16
	defb	112
	defb	16
	defb	1
	defb	0
	defb	5
	defs	1
	defb	96
	defb	32
	defb	96
	defb	32
	defb	112
	defb	32
	defb	1
	defb	0
	defb	5
	defs	1
	defb	96
	defb	48
	defb	96
	defb	48
	defb	112
	defb	48
	defb	1
	defb	0
	defb	0
	defs	1
	defb	96
	defb	128
	defb	96
	defb	48
	defb	96
	defb	128
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	128
	defb	48
	defb	128
	defb	48
	defb	208
	defb	48
	defb	1
	defb	0
	defb	4
	defs	1
	defb	144
	defb	128
	defb	144
	defb	112
	defb	160
	defb	128
	defb	0
	defb	0
	defb	5
	defs	1
	defb	16
	defb	96
	defb	16
	defb	32
	defb	16
	defb	96
	defb	0
	defb	-1
	defb	1
	defs	1
	defb	112
	defb	48
	defb	80
	defb	48
	defb	112
	defb	48
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	64
	defb	112
	defb	64
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	2
	defs	1
	defb	16
	defb	0
	defb	16
	defb	0
	defb	32
	defb	0
	defb	0
	defb	0
	defb	5
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	96
	defb	112
	defb	64
	defb	112
	defb	96
	defb	112
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	16
	defb	16
	defb	16
	defb	16
	defb	32
	defb	16
	defb	1
	defb	0
	defb	5
	defs	1
	defb	176
	defb	16
	defb	96
	defb	16
	defb	176
	defb	16
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	144
	defb	80
	defb	112
	defb	80
	defb	144
	defb	80
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	48
	defb	112
	defb	48
	defb	32
	defb	48
	defb	112
	defb	0
	defb	-2
	defb	1
	defs	1
	defb	144
	defb	48
	defb	144
	defb	48
	defb	208
	defb	128
	defb	1
	defb	1
	defb	2
	defs	1
	defb	48
	defb	16
	defb	48
	defb	16
	defb	96
	defb	80
	defb	1
	defb	1
	defb	1
	defs	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	80
	defb	128
	defb	1
	defb	0
	defb	2
	defs	1
	defb	128
	defb	96
	defb	128
	defb	96
	defb	160
	defb	96
	defb	1
	defb	0
	defb	2
	defs	1
	defb	32
	defb	128
	defb	32
	defb	48
	defb	32
	defb	128
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	128
	defb	96
	defb	128
	defb	96
	defb	128
	defb	112
	defb	0
	defb	0
	defb	5
	defs	1
	defb	192
	defb	64
	defb	48
	defb	64
	defb	192
	defb	64
	defb	-2
	defb	0
	defb	4
	defs	1
	defb	192
	defb	128
	defb	64
	defb	128
	defb	192
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	160
	defb	96
	defb	128
	defb	96
	defb	160
	defb	96
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	144
	defb	64
	defb	144
	defb	64
	defb	160
	defb	64
	defb	1
	defb	0
	defb	1
	defs	1
	defb	96
	defb	80
	defb	96
	defb	80
	defb	144
	defb	80
	defb	1
	defb	0
	defb	4
	defs	1
	defb	16
	defb	96
	defb	16
	defb	32
	defb	16
	defb	96
	defb	0
	defb	-1
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	48
	defb	16
	defb	48
	defb	16
	defb	64
	defb	16
	defb	1
	defb	0
	defb	5
	defs	1
	defb	48
	defb	32
	defb	48
	defb	32
	defb	64
	defb	32
	defb	1
	defb	0
	defb	5
	defs	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	64
	defb	48
	defb	1
	defb	0
	defb	0
	defs	1
	defb	128
	defb	32
	defb	96
	defb	32
	defb	128
	defb	32
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	160
	defb	80
	defb	144
	defb	80
	defb	160
	defb	80
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	224
	defb	128
	defb	0
	defb	128
	defb	224
	defb	128
	defb	-2
	defb	0
	defb	4
	defs	1
	defb	160
	defb	80
	defb	160
	defb	80
	defb	160
	defb	96
	defb	0
	defb	1
	defb	5
	defs	1
	defb	80
	defb	96
	defb	32
	defb	96
	defb	80
	defb	96
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	112
	defb	96
	defb	112
	defb	48
	defb	112
	defb	96
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	112
	defb	48
	defb	112
	defb	48
	defb	112
	defb	64
	defb	0
	defb	1
	defb	5
	defs	1
	defb	128
	defb	48
	defb	128
	defb	48
	defb	128
	defb	64
	defb	0
	defb	1
	defb	5
	defs	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	112
	defb	128
	defb	1
	defb	0
	defb	4
	defs	1
	defb	96
	defb	128
	defb	96
	defb	128
	defb	208
	defb	128
	defb	2
	defb	0
	defb	4
	defs	1
	defb	176
	defb	32
	defb	176
	defb	32
	defb	176
	defb	48
	defb	0
	defb	1
	defb	5
	defs	1
	defb	64
	defb	96
	defb	64
	defb	48
	defb	64
	defb	96
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	112
	defb	96
	defb	80
	defb	96
	defb	112
	defb	96
	defb	-1
	defb	0
	defb	3
	defs	1
	defb	64
	defb	48
	defb	64
	defb	48
	defb	96
	defb	48
	defb	1
	defb	0
	defb	1
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	64
	defb	80
	defb	64
	defb	80
	defb	128
	defb	80
	defb	1
	defb	0
	defb	4
	defs	1
	defb	48
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	1
	defb	0
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	16
	defb	144
	defb	16
	defb	144
	defb	176
	defb	144
	defb	2
	defb	0
	defb	4
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	64
	defb	144
	defb	64
	defb	144
	defb	176
	defb	144
	defb	2
	defb	0
	defb	4
	defs	1
	defb	112
	defb	0
	defb	112
	defb	0
	defb	112
	defb	16
	defb	0
	defb	0
	defb	5
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	128
	defb	80
	defb	128
	defb	80
	defb	192
	defb	80
	defb	1
	defb	0
	defb	1
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	16
	defb	48
	defb	16
	defb	48
	defb	48
	defb	96
	defb	2
	defb	2
	defb	2
	defs	1
	defb	160
	defb	64
	defb	96
	defb	64
	defb	160
	defb	64
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	192
	defb	32
	defb	176
	defb	32
	defb	192
	defb	32
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	160
	defb	32
	defb	160
	defb	32
	defb	160
	defb	80
	defb	0
	defb	1
	defb	4
	defs	1
	defb	176
	defb	80
	defb	176
	defb	80
	defb	176
	defb	128
	defb	0
	defb	1
	defb	4
	defs	1
	defb	112
	defb	16
	defb	16
	defb	16
	defb	112
	defb	16
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	80
	defb	48
	defb	80
	defb	48
	defb	80
	defb	96
	defb	0
	defb	1
	defb	4
	defs	1
	defb	144
	defb	96
	defb	96
	defb	96
	defb	144
	defb	96
	defb	-2
	defb	0
	defb	1
	defs	1
	defb	192
	defb	64
	defb	144
	defb	64
	defb	192
	defb	64
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	192
	defb	48
	defb	32
	defb	48
	defb	192
	defb	48
	defb	-2
	defb	0
	defb	4
	defs	1
	defb	144
	defb	64
	defb	96
	defb	64
	defb	144
	defb	64
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	192
	defb	32
	defb	32
	defb	32
	defb	192
	defb	32
	defb	-2
	defb	0
	defb	2
	defs	1
	defb	112
	defb	96
	defb	112
	defb	96
	defb	112
	defb	112
	defb	0
	defb	1
	defb	5
	defs	1
	defb	128
	defb	80
	defb	128
	defb	80
	defb	128
	defb	96
	defb	0
	defb	1
	defb	5
	defs	1
	defb	208
	defb	64
	defb	16
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	1
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	96
	defb	96
	defb	80
	defb	96
	defb	96
	defb	96
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	32
	defb	48
	defb	32
	defb	48
	defb	64
	defb	48
	defb	1
	defb	0
	defb	3
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	208
	defb	64
	defb	32
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	3
	defs	1
	defb	16
	defb	112
	defb	16
	defb	112
	defb	176
	defb	112
	defb	1
	defb	0
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	144
	defb	80
	defb	80
	defb	80
	defb	144
	defb	80
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	160
	defb	112
	defb	160
	defb	16
	defb	160
	defb	112
	defb	0
	defb	-2
	defb	2
	defs	1
	defb	176
	defb	48
	defb	176
	defb	48
	defb	208
	defb	112
	defb	1
	defb	1
	defb	1
	defs	1
	defb	64
	defb	144
	defb	64
	defb	96
	defb	64
	defb	144
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	128
	defb	80
	defb	128
	defb	16
	defb	144
	defb	80
	defb	2
	defb	-2
	defb	2
	defs	1
	defb	208
	defb	16
	defb	176
	defb	16
	defb	208
	defb	16
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	32
	defb	16
	defb	32
	defb	16
	defb	80
	defb	16
	defb	1
	defb	0
	defb	1
	defs	1
	defb	160
	defb	32
	defb	160
	defb	32
	defb	192
	defb	80
	defb	2
	defb	2
	defb	2
	defs	1
	defb	176
	defb	128
	defb	176
	defb	64
	defb	176
	defb	128
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	112
	defb	80
	defb	112
	defb	64
	defb	112
	defb	80
	defb	0
	defb	-1
	defb	5
	defs	1
	defb	112
	defb	64
	defb	112
	defb	48
	defb	112
	defb	64
	defb	0
	defb	-1
	defb	5
	defs	1
	defb	160
	defb	144
	defb	160
	defb	80
	defb	160
	defb	144
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	48
	defb	128
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	96
	defb	64
	defb	96
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	4
	defs	1
	defb	96
	defb	32
	defb	96
	defb	32
	defb	176
	defb	48
	defb	2
	defb	2
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	80
	defb	112
	defb	80
	defb	112
	defb	224
	defb	112
	defb	2
	defb	0
	defb	4
	defs	1
	defb	48
	defb	48
	defb	32
	defb	48
	defb	48
	defb	48
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	208
	defb	128
	defb	128
	defb	128
	defb	208
	defb	128
	defb	-2
	defb	0
	defb	3
	defs	1
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	32
	defb	0
	defb	1
	defb	5
	defs	1
	defb	32
	defb	112
	defb	32
	defb	112
	defb	80
	defb	112
	defb	1
	defb	0
	defb	3
	defs	1
	defb	48
	defb	128
	defb	48
	defb	64
	defb	48
	defb	128
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	112
	defb	0
	defb	1
	defb	2
	defs	1
	defb	208
	defb	80
	defb	208
	defb	16
	defb	208
	defb	80
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	192
	defb	128
	defb	80
	defb	128
	defb	192
	defb	128
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	176
	defb	80
	defb	128
	defb	80
	defb	176
	defb	80
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	192
	defb	128
	defb	64
	defb	128
	defb	192
	defb	128
	defb	-2
	defb	0
	defb	3
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	32
	defb	128
	defb	32
	defb	96
	defb	32
	defb	128
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	16
	defb	32
	defb	16
	defb	32
	defb	16
	defb	80
	defb	0
	defb	2
	defb	2
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	192
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	-2
	defb	0
	defb	3
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defs	1

;	SECTION	code

;	SECTION	text

._hotspots
	defb	56
	defb	1
	defb	0
	defb	37
	defb	34
	defb	0
	defb	55
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	114
	defb	1
	defb	0
	defb	196
	defb	34
	defb	0
	defb	17
	defb	1
	defb	0
	defb	135
	defb	1
	defb	0
	defb	133
	defb	1
	defb	0
	defb	194
	defb	1
	defb	0
	defb	196
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	199
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	70
	defb	1
	defb	0
	defb	84
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	71
	defb	34
	defb	0
	defb	98
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	166
	defb	1
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
	defb	36
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	167
	defb	3
	defb	0
	defb	168
	defb	34
	defb	0
	defb	130
	defb	1
	defb	0
	defb	24
	defb	1
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
	defb	133
	defb	1
	defb	0
	defb	38
	defb	1
	defb	0
	defb	115
	defb	3
	defb	0
	defb	118
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	200
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	66
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	151
	defb	3
	defb	0
	defb	0
	defb	0
	defb	0
	defb	151
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	210
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	115
	defb	1
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
	defb	21
	defb	3
	defb	0
	defb	101
	defb	1
	defb	0

;	SECTION	code

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



._init_bullets
	ld hl, _bullets_estado
	ld de, _bullets_estado + 1
	ld bc, 3 - 1
	xor a
	ld (hl), a
	ldir
	ret



._init_malotes
	ld bc, 180
	ld de, 10
	ld ix, _malotes
	.init_malotes_loop
	ld a, (ix+8)
	and 127
	cp 5
	jr nz, init_malotes_not_5
	or 128
	.init_malotes_not_5
	ld (ix+8), a
	ld a, 5
	ld (ix+9), a
	add ix, de
	dec bc
	ld a, b
	or c
	jr nz, init_malotes_loop
	ret



._fire_bullet
	ld bc, 0
	.fire_bullet_search_loop
	ld hl, _bullets_estado
	add hl, bc
	ld a, (hl)
	or a
	jr z, fire_bullet_found
	inc c
	ld a, c
	cp 3
	jr nz, fire_bullet_search_loop
	ret
	.fire_bullet_found
	inc a
	ld (hl), a
	ld a, (_player + 22)
	or a
	ld a, (_gpx)
	jr z, fire_bullet_right
	.fire_bullet_left
	sub 4
	ld hl, _bullets_x
	add hl, bc
	ld (hl), a
	ld a, -8
	ld hl, _bullets_mx
	add hl, bc
	ld (hl), a
	jr fire_bullet_facing_done
	.fire_bullet_right
	add 12
	ld hl, _bullets_x
	add hl, bc
	ld (hl), a
	ld a, 8
	ld hl, _bullets_mx
	add hl, bc
	ld (hl), a
	.fire_bullet_facing_done
	ld a, (_gpy)
	add 4
	ld hl, _bullets_y
	add hl, bc
	ld (hl), a
	ld	hl,6	;const
	call	_peta_el_beeper
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	a,(_player+22)
	and	a
	jp	z,i_50
	ld	hl,128	;const
	jp	i_51
.i_50
	ld	hl,65408	;const
.i_51
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ret



._player_hidden
	ld	a,(_player+26)
	and	a
	jp	z,i_53
	ld	hl,(_player+6)
	ld	de,0	;const
	call	l_eq
	jr	c,i_54_i_53
.i_53
	jp	i_52
.i_54_i_53
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,2	;const
	ex	de,hl
	call	l_and
	ld	h,0
	ret


.i_52
	ld	hl,0 % 256	;const
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



._move
	xor a
	ld (_hit_h), a
	ld (_hit_v), a
	ld (_thrusting), a
	ld (_wall), a
	call _pad_read
	.m_vert_gravity_do
	ld hl, (_player + 8)
	ld de, 32
	add hl, de
	ld de, 512
	call l_lt
	jr nc, m_vert_gravity_done
	ex de, hl
	.m_vert_gravity_done
	ld (_player + 8), hl
	ld a, (_pad_this_frame)
	and 0x01
	jr nz, m_jump_start_done
	ld a, (_player + 19)
	or a
	jr nz, m_jump_start_done
	ld a, (_player + 26)
	ld c, a
	ld a, (_player + 25)
	or c
	jr z, m_jump_start_done
	ld (_player + 19), a
	xor a
	ld (_player + 14), a
	ld l, 3
	call _peta_el_beeper
	.m_jump_start_done
	ld a, (_pad0)
	and 0x01
	jr nz, m_jump_perform_not_pressing
	ld a, (_player + 19)
	or a
	jr z, m_jump_perform_done
	ld a, (_player + 14)
	srl a
	ld d, 0
	ld e, a
	ld hl, 160 + 24
	sbc hl, de
	ex de, hl
	ld hl, (_player + 8)
	sbc hl, de
	ld de, -256
	call l_gt
	jr nc, m_jump_perform_write_vy
	ex de, hl
	.m_jump_perform_write_vy
	ld (_player + 8), hl
	ld a, (_player + 14)
	inc a
	ld (_player + 14), a
	cp 8
	jr c, m_jump_perform_done
	.m_jump_perform_not_pressing
	xor a
	ld (_player + 19), a
	.m_jump_perform_done
	ld a, (_pad0)
	and 0x02
	ld a, 0
	jr nz, m_vert_jump_down_done
	ld hl, 160
	ld (_player + 8), hl
	inc a
	.m_vert_jump_down_done
	ld (_disable_collide_platform), a
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
	ld hl, (_player + 8)
	call HLshr6_A
	inc a
	ld c, a
	ld a, (_at1)
	and 8
	jr nz, m_vert_coll_down_adjust
	ld a, (_at2)
	and 8
	jr nz, m_vert_coll_down_adjust
	ld a, (_disable_collide_platform)
	or a
	jr nz, m_vert_coll_checks_done
	ld a, (_at1)
	and 4
	jr nz, m_vert_coll_down_ch2
	ld a, (_at2)
	and 4
	jp z, m_vert_coll_checks_done
	.m_vert_coll_down_ch2
	ld a, (_gpy)
	dec a
	and 15
	cp c
	jr nc, m_vert_coll_checks_done
	.m_vert_coll_down_adjust
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
	ld de, -64
	add hl, de
	bit 7, h
	jr z, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_rx_negative
	ld de, 64
	add hl, de
	bit 7, h
	jr nz, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_left_or_right_p
	ld a, 1
	ld (_thrusting), a
	ld a, c
	and 0x04
	jr nz, m_horz_kp_left_done
	.m_horz_kp_left_do
	ld de, -48
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
	ld de, 48
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
	.m_evil_tile_hit_check_v
	ld a, (_hit_v)
	or a
	jr z, m_evil_tile_hit_check_h
	ld hl, (_pvy_total)
	call l_neg
	ld (_player + 8), hl
	jr m_evil_tile_vel_set
	.m_evil_tile_hit_check_h
	ld a, (_hit_h)
	or a
	jr z, m_evil_tile_hit_done
	ld hl, (_pvx_total)
	call l_neg
	ld (_player + 6), hl
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
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_and
	ld	a,h
	or	l
	call	z,_fire_bullet
.i_55
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
	ld d, 0
	ld e, a
	ld hl, 3
	call l_div_u
	ld c, e
	jr m_frame_set
	.m_frame_still
	ld c, 0
	.m_frame_set
	ld a, (_player + 22)
	add c
	ld (_player + 20), a
	ld hl, (_player + 20)
	ld h, 0
	add hl, hl
	ld de, _player_cells
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
	ld	a,#(192 % 256 % 256)
	ld	(_gpx),a
	ld	hl,64 % 256	;const
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
	ld b, 10 * 6
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
	add 0
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
	add 0
	ld (__y), a
	ld a, (_hotspot_t_r)
	ld b, a
	cp 3
	ld a, 16
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
	and 0x3f
	ld (_rdc), a
	._draw_scr_advance_loop
	ld a, (_rdn)
	cp 0x40
	jr c, _draw_scr_advance_loop_done
	sub 0x40
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
	ld hl, _enem_cells
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
	call	_draw_scr_background
	._enems_init
	ld	hl,(_n_pant)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	(_enoffs),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_58
.i_56
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_58
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_57
	ld bc, (_enit)
	xor a
	ld b, a
	ld hl, _en_an_frame
	add hl, bc
	ld (hl), a
	ld hl, _en_an_state
	add hl, bc
	ld (hl), a
	ld hl, _en_an_fanty_activo
	add hl, bc
	ld (hl), a
	ld hl, (_enoffs)
	add hl, bc
	ld (_enoffsmasi), hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
.i_61
	ld	a,l
	cp	#(1% 256)
	jp	z,i_62
	cp	#(2% 256)
	jp	z,i_63
	cp	#(3% 256)
	jp	z,i_64
	cp	#(4% 256)
	jp	z,i_65
	jp	i_66
.i_62
.i_63
.i_64
.i_65
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_60
.i_66
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_60
	call enems_update_values_store
	jp	i_56
.i_57
	call	_init_bullets
	ld	hl,1	;const
	call	_script
	ret



._mueve_bullets
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_69
.i_67
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_69
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_68
	jp	nc,i_68
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_bullets_mx
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	de,_bullets_y
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	hl,_rdi
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_71
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,240	;const
	call	l_ugt
	jp	nc,i_70
.i_71
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_70
	jp	i_67
.i_68
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
	ld	hl,(__en_life)
	ld	h,0
	ex	de,hl
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_uge
	jp	nc,i_73
	ld	hl,(__en_life)
	ld	h,0
	ex	de,hl
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	ld	a,l
	ld	(__en_life),a
	jp	i_74
.i_73
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(__en_life),a
.i_74
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_17_a
	pop	de
	call	l_pint
	ld a, (__en_x)
	ld (_rdx), a
	ld a, (__en_y)
	ld (_rdy), a
	call _render_this_enemy
	call SPUpdateNow
	ld	a,(__en_life)
	and	a
	jp	nz,i_75
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
	ld	hl,_sprite_18_a
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
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(__en_life),a
	jp	i_76
.i_75
	ld	hl,1	;const
	call	_peta_el_beeper
.i_76
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
	jp	i_79
.i_77
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_79
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_78
	jp	nc,i_78
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,__en_t
	ld	a,(hl)
	rlca
	jp	nc,i_81
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(0 % 256)
	jr	z,i_82_i_81
.i_81
	jp	i_80
.i_82_i_81
	jp	i_83
.i_80
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_84
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
	jp	nc,i_85
	call en_lineal_do
.i_85
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_fanty_activo
	add hl, bc
	ld a, (hl)
	or a
	jp z, fantys_end
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	ld ixl, a
	ld a, c
	sla a
	ld (_gp_gen), a
	xor a
	ld (_gp_gen + 1), a
	call _player_hidden
	ld a, l
	ld hl, 12
	or a
	jr z, fantys_rr_set
	ld hl, -12
	.fantys_rr_set
	ld (fanty_A_mod_1 + 1), hl
	ld (fanty_A_mod_2 + 1), hl
	ld (fanty_A_mod_3 + 1), hl
	ld (fanty_A_mod_4 + 1), hl
	.fanty_x_axis
	ld bc, _en_an_x
	ld hl, (_gp_gen)
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	.fanty_vx_sk0
	ld hl, (_player)
	push hl
	call l_lt
	pop hl
	jr nc, fanty_vx_sk1
	ld hl, (_gp_gen)
	ld bc, _en_an_vx
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	.fanty_A_mod_1
	ld hl, 12
	add hl, de
	ld de, 256
	push hl
	call l_lt
	pop hl
	jr nc, fanty_vx_write
	ex de, hl
	jr fanty_vx_write
	.fanty_vx_sk1
	call l_eq
	jr c, fanty_vx_done
	ld hl, (_gp_gen)
	ld bc, _en_an_vx
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	.fanty_A_mod_2
	ld de, 12
	sbc hl, de
	ld de, -256
	push hl
	call l_gt
	pop hl
	jr nc, fanty_vx_write
	ex de, hl
	.fanty_vx_write
	ex de, hl
	ld hl, (_gp_gen)
	ld bc, _en_an_vx
	add hl, bc
	ld (hl), e
	inc hl
	ld (hl), d
	.fanty_vx_done
	.fanty_y_axis
	ld hl, (_gp_gen)
	ld bc, _en_an_y
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	.fanty_vy_sk0
	ld hl, (_player + 2)
	push hl
	call l_lt
	pop hl
	jr nc, fanty_vy_sk1
	ld hl, (_gp_gen)
	ld bc, _en_an_vy
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	.fanty_A_mod_3
	ld hl, 12
	add hl, de
	ld de, 256
	push hl
	call l_lt
	pop hl
	jr nc, fanty_vy_write
	ex de, hl
	jr fanty_vy_write
	.fanty_vy_sk1
	push hl
	call l_eq
	pop hl
	jr c, fanty_vy_done
	ld hl, (_gp_gen)
	ld bc, _en_an_vy
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	.fanty_A_mod_4
	ld de, 12
	sbc hl, de
	ld de, -256
	push hl
	call l_gt
	pop hl
	jr nc, fanty_vy_write
	ex de, hl
	.fanty_vy_write
	ex de, hl
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, (_gp_gen)
	ld bc, _en_an_vy
	add hl, bc
	ld (hl), e
	inc hl
	ld (hl), d
	.fanty_vy_done
	.fantys_update
	ld hl, (_gp_gen)
	ld bc, _en_an_vx
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld hl, (_gp_gen)
	ld bc, _en_an_x
	add hl, bc
	push hl
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	add hl, de
	ex de, hl
	.fanty_x_limit_0
	ld hl, 14336
	call l_gt
	jr c, fanty_x_ex_de_zero_velocity
	.fanty_x_limit_1
	ld hl, 0
	call l_lt
	jr nc, fanty_x_write
	.fanty_x_ex_de_zero_velocity
	ex de, hl
	ld hl, (_gp_gen)
	ld bc, _en_an_vx
	add hl, bc
	xor a
	ld (hl), a
	inc hl
	ld (hl), a
	.fanty_x_write
	pop hl
	ld (hl), e
	inc hl
	ld (hl), d
	ex de, hl
	call HLshr6_A
	ld (__en_x), a
	ld hl, (_gp_gen)
	ld bc, _en_an_vy
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld hl, (_gp_gen)
	ld bc, _en_an_y
	add hl, bc
	push hl
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	add hl, de
	ex de, hl
	.fanty_y_limit_0
	ld hl, 9216
	call l_gt
	jr c, fanty_y_ex_de_zero_velocity
	.fanty_y_limit_1
	ld hl, 0
	call l_lt
	jr nc, fanty_y_write
	.fanty_y_ex_de_zero_velocity
	ex de, hl
	ld hl, (_gp_gen)
	ld bc, _en_an_vy
	add hl, bc
	xor a
	ld (hl), a
	inc hl
	ld (hl), a
	.fanty_y_write
	pop hl
	ld (hl), e
	inc hl
	ld (hl), d
	ex de, hl
	call HLshr6_A
	ld (__en_y), a
	.fanty_rr_done
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_frame
	add hl, bc
	ld a, ixl
	;ld (hl), a
	.fantys_end
	call	_enems_calc_frame
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_87
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_87
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_88_i_87
.i_87
	jp	i_86
.i_88_i_87
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
	jp	i_89
.i_86
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_90
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_92
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_ult
	jp	c,i_93
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_92
.i_93
	jr	i_95_i_92
.i_92
	jp	i_91
.i_95_i_92
	ld	a,(_player+23)
	and	a
	jp	nz,i_96
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
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_97
	.en_col_lin_h
	ld a, (__en_mx)
	or a
	jr z, en_col_lin_v
	bit 7, a
	jr z, en_col_lin_h_pos
	.en_col_lin_h_neg
	ld hl, -192
	jr en_col_lin_h_write
	.en_col_lin_h_pos
	ld hl, 192
	.en_col_lin_h_write
	ld (_player + 6), hl
	.en_col_lin_v
	ld a, (__en_my)
	or a
	jr z, en_col_lin_end
	bit 7, a
	jr z, en_col_lin_v_pos
	.en_col_lin_v_neg
	ld hl, -192
	jr en_col_lin_v_write
	.en_col_lin_v_pos
	ld hl, 192
	.en_col_lin_v_write
	ld (_player + 8), hl
	.en_col_lin_end
	jp	i_98
.i_97
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, _en_an_vx
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	add hl, hl
	ld (_player + 6), hl
	ld hl, _en_an_vy
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	add hl, hl
	ld (_player + 8), hl
.i_98
.i_96
.i_91
	ld	hl,8	;const
	call	_script
.i_90
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_ult
	jp	c,i_100
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_102
.i_100
	ld	a,(__en_t)
	cp	#(4 % 256)
	jr	nz,i_103_i_102
.i_102
	jp	i_99
.i_103_i_102
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_en_j),a
	jp	i_106
.i_104
	ld	hl,_en_j
	ld	a,(hl)
	inc	(hl)
.i_106
	ld	a,(_en_j)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_105
	ld bc, (_en_j)
	ld b, 0
	ld hl, _bullets_estado
	add hl, bc
	ld a, (hl)
	or a
	jp z, enems_coll_bullets_continue
	ld a, (__en_y)
	sub 4
	ld d, a
	ld hl, _bullets_y
	add hl, bc
	ld a, (hl)
	cp d
	jp c, enems_coll_bullets_continue
	ld d, a
	ld a, (__en_y)
	add 12
	cp d
	jp c, enems_coll_bullets_continue
	ld a, (__en_x)
	sub 4
	ld d, a
	ld hl, _bullets_x
	add hl, bc
	ld a, (hl)
	cp d
	jp c, enems_coll_bullets_continue
	ld d, a
	ld a, (__en_x)
	add 12
	cp d
	jp c, enems_coll_bullets_continue
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_107
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	de,_bullets_mx
	ld	hl,(_en_j)
	ld	h,0
	add	hl,de
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_108
	ld	hl,128	;const
	jp	i_109
.i_108
	ld	hl,65408	;const
.i_109
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_107
	ld	de,_bullets_estado
	ld	hl,(_en_j)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1	;const
	push	hl
	call	_enems_kill
	pop	bc
	.enems_coll_bullets_continue
	jp	i_104
.i_105
.i_99
.i_89
.i_84
.i_83
.i_110
	ld a, (_scenery_info + 1)
	or a
	jr nz, enems_create_fanty_done
	ld a, (__en_t)
	and 128
	jr z, enems_create_fanty_done
	call _rand
	ld a, l
	and 31
	jr nz, enems_create_fanty_done
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_fanty_activo
	add hl, bc
	ld a, (hl)
	or a
	jr nz, enems_create_fanty_done
	inc a
	ld (hl), a
	ld h, b
	ld l, c
	add hl, hl
	ld b, h
	ld c, l
	ld hl, _en_an_y
	add hl, bc
	ld de, 0
	ld a, (_gpy)
	cp 120
	jr nc, fanty_create_set_y
	ld de, 144*64
	.fanty_create_set_y
	ld (hl), e
	inc hl
	ld (hl), d
	ex de, hl
	call HLshr6_A
	ld (__en_y), a
	.fanty_create_pick_x
	call _rand
	ld a, l
	cp 224
	jr nc, fanty_create_pick_x
	call Ashl16_HL
	ex de, hl
	ld hl, _en_an_x
	add hl, bc
	ld (hl), e
	inc hl
	ld (hl), d
	ex de, hl
	call HLshr6_A
	ld (__en_x), a
	xor a
	ld hl, _en_an_vx
	add hl, bc
	ld (hl), a
	inc hl
	ld (hl), a
	ld hl, _en_an_vy
	add hl, bc
	ld (hl), a
	inc hl
	ld (hl), a
	ld hl, 2
	call _enems_en_an_calc
	.enems_create_fanty_done
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_77
.i_78
	ret


	._calc_baddies_pointer
	add hl, hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, hl
	add hl, de
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
	ld (__en_x1), a
	inc hl
	ld a, (hl)
	ld (__en_y1), a
	inc hl
	ld a, (hl)
	ld (__en_x2), a
	inc hl
	ld a, (hl)
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
	inc hl
	ld a, (hl)
	ld (__en_life), a
	ret
	.enems_update_values_store
	ld hl, (__baddies_pointer)
	ld a, (__en_x)
	ld (hl), a
	inc hl
	ld a, (__en_y)
	ld (hl), a
	inc hl
	ld a, (__en_x1)
	ld (hl), a
	inc hl
	ld a, (__en_y1)
	ld (hl), a
	inc hl
	ld a, (__en_x2)
	ld (hl), a
	inc hl
	ld a, (__en_y2)
	ld (hl), a
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
	ld a, (__en_life)
	ld (hl), a
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

._do_extern_action
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_113
.i_111
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_113
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_112
	jp	nc,i_112
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	a,(__en_t)
	and	a
	jp	z,i_115
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	z,i_115
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_116
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_115
.i_116
	jr	i_118_i_115
.i_115
	jp	i_114
.i_118_i_115
	ld	hl,99	;const
	push	hl
	call	_enems_kill
	pop	bc
.i_114
	call enems_update_values_store
	jp	i_111
.i_112
	ret


	._s_title
	BINARY "titlec.bin"
	._s_marco
	._s_ending
	BINARY "endingc.bin"

._title_screen
	call SPUpdateNow
	call	_blackout
	ld hl, _s_title
	call _unpack_screen
	ld	hl,12	;const
	push	hl
	ld	hl,1	;const
	push	hl
	ld	hl,4	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	call musicstart
	call	_select_controls
	ret



._game_ending
	call SPUpdateNow
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_121
.i_119
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_121
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_120
	jp	nc,i_120
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_119
.i_120
	ld	hl,9	;const
	call	_peta_el_beeper
	call	_no_break
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._game_over
	ld a, 8
	ld (__x), a
	ld a, 11
	ld (__y), a
	ld a, 23
	ld (__x2), a
	ld a, 14
	ld (__y2), a
	ld a, 72
	ld (__t), a
	call	_draw_rectangle
	ld	hl,10	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,i_1+9
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,9	;const
	push	hl
	ld	hl,13	;const
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,i_1+22
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	hl,10	;const
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
.i_122
	call	_title_screen
	ld hl, _flags
	ld de, _flags + 1
	ld bc, 16 - 1
	xor a
	ld (hl), a
	ldir
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_malotes
	call	_init_bullets
	ld	a,#(4 % 256 % 256)
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
.i_124
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_125
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
	jp	nc,i_126
	ld	hl,16	;const
	push	hl
	ld	hl,21	;const
	push	hl
	ld	hl,_player+27
	call	l_gchar
	ld	h,0
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
.i_126
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_127
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_128
	or	l
	jp	z,i_128
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_129
.i_128
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_129
	ld	hl,7	;const
	push	hl
	ld	hl,21	;const
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
.i_127
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_mueve_bullets
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
	jp	z,i_130
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_133
	ld	a,l
	cp	#(1% 256)
	jp	z,i_134
	cp	#(3% 256)
	jp	z,i_135
	jp	i_132
.i_134
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	call	_peta_el_beeper
	jp	i_132
.i_135
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
	jp	nc,i_136
	ld	hl,99	;const
	ld	(_player+29),hl
.i_136
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_132
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_137
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
	ld	de,0
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
.i_137
.i_130
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
	and	#(2 % 256)
	jp	nz,i_138
	ld	hl,2	;const
	call	_script
.i_138
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_140
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_141_i_140
.i_140
	jp	i_139
.i_141_i_140
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_142
.i_139
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_144
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_145_i_144
.i_144
	jp	i_143
.i_145_i_144
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_143
.i_142
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_147
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_147
	ld	a,(_n_pant)
	cp	#(10 % 256)
	jr	z,i_147_uge
	jp	c,i_147
.i_147_uge
	jr	i_148_i_147
.i_147
	jp	i_146
.i_148_i_147
	ld a, (_n_pant)
	sub 10
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_149
.i_146
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_151
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_152_i_151
.i_151
	jp	i_150
.i_152_i_151
	ld a, (_n_pant)
	add 10
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_150
.i_149
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_153
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_153
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_154
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
.i_154
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_156
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_155
.i_156
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_155
	xor a
	ld (_pant_just_rendered), a
	jp	i_124
.i_125
	jp	i_122
.i_123
	ret


	; The Music Box Player Engine
	; Based on code written by Mark Alexander for the utility, The Music
	; Modified by Chris Cowley
	; Produced by Beepola v1.08.01
	; Adapted for MTE MK1 v4 by na_th_an
	.musicstart
	LD HL,MUSICDATA ; <- Pointer to Music Data. Change
	; this to play a different song
	LD A,(HL) ; Get the loop start pointer
	LD (PATTERN_LOOP_BEGIN),A
	INC HL
	LD A,(HL) ; Get the song end pointer
	LD (PATTERN_LOOP_END),A
	INC HL
	LD (PATTERNDATA1),HL
	LD (PATTERNDATA2),HL
	LD A,254
	LD (PATTERN_PTR),A ; Set the pattern pointer to zero
	CALL NEXT_PATTERN
	.NEXTNOTE
	CALL PLAYNOTE
	XOR A
	IN A,($FE)
	AND $1F
	CP $1F
	JR Z,NEXTNOTE ; Play next note if no key pressed
	RET ; Return from playing tune
	.PATTERN_PTR
	DEFB 0
	.NOTE_PTR
	DEFB 0
	.NEXT_PATTERN
	LD A,(PATTERN_PTR)
	INC A
	INC A
	DEFB $FE ; CP n
	.PATTERN_LOOP_END
	DEFB 0
	JR NZ,NO_PATTERN_LOOP
	DEFB $3E ; LD A,n
	.PATTERN_LOOP_BEGIN
	DEFB 0
	.NO_PATTERN_LOOP
	LD (PATTERN_PTR),A
	DEFB $21 ; LD HL,nn
	.PATTERNDATA1
	DEFW $0000
	LD E,A ; (this is the first byte of the pattern)
	LD D,0 ; and store it at TEMPO
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	LD A,(DE) ; Pattern Tempo -> A
	LD (TEMPO),A ; Store it at TEMPO
	LD A,1
	LD (NOTE_PTR),A
	.PLAYNOTE
	DEFB $21 ; LD HL,nn
	.PATTERNDATA2
	DEFW $0000
	LD A,(PATTERN_PTR)
	LD E,A
	LD D,0
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL) ; Now DE = Start of Pattern data
	LD A,(NOTE_PTR)
	LD L,A
	LD H,0
	ADD HL,DE ; Now HL = address of note data
	LD D,(HL)
	LD E,1
	; IF D = $0 then we are at the end of the pattern so increment PATTERN_PTR by 2 and set NOTE_PTR=0
	LD A,D
	AND A ; Optimised CP 0
	JR Z,NEXT_PATTERN
	PUSH DE
	INC HL
	LD D,(HL)
	LD E,1
	LD A,(NOTE_PTR)
	INC A
	INC A
	LD (NOTE_PTR),A ; Increment the note pointer by 2 (one note per chan)
	POP HL ; Now CH1 freq is in HL, and CH2 freq is in DE
	LD A,H
	DEC A
	JR NZ,OUTPUT_NOTE
	LD A,D ; executed only if Channel 2 contains a rest
	DEC A ; if DE (CH1 note) is also a rest then..
	JR Z,PLAY_SILENCE ; Play silence
	.OUTPUT_NOTE
	LD A,(TEMPO)
	LD C,A
	LD B,0
	XOR A
	EX AF,AF
	XOR A
	LD IXH,D
	LD D,$10
	.EAE5
	NOP
	NOP
	.EAE7
	EX AF,AF
	DEC E
	OUT ($FE),A
	JR NZ,EB04
	LD E,IXH
	XOR D
	EX AF,AF
	DEC L
	JP NZ,EB0B
	.EAF5
	OUT ($FE),A
	LD L,H
	XOR D
	DJNZ EAE5
	INC C
	JP NZ,EAE7
	RET
	.EB04
	JR Z,EB04
	EX AF,AF
	DEC L
	JP Z,EAF5
	.EB0B
	OUT ($FE),A
	NOP
	NOP
	DJNZ EAE5
	INC C
	JP NZ,EAE7
	RET
	.PLAY_SILENCE
	LD A,(TEMPO)
	CPL
	LD C,A
	.SILENCE_LOOP2
	PUSH BC
	PUSH AF
	LD B,0
	.SILENCE_LOOP
	PUSH HL
	LD HL,0000
	SRA (HL)
	SRA (HL)
	SRA (HL)
	NOP
	POP HL
	DJNZ SILENCE_LOOP
	DEC C
	JP NZ,SILENCE_LOOP
	POP AF
	POP BC
	RET
	; *** DATA ***
	.TEMPO
	DEFB 232
	.MUSICDATA
	DEFB 0 ; Loop start point * 2
	DEFB 4 ; Song Length * 2
	.PATTERNDATA
	DEFW PAT0
	DEFW PAT1
	; *** Pattern data consists of pairs of frequency values CH1,CH2 with a single $0 to
	; *** Mark the end of the pattern, and $01 for a rest
	.PAT0
	DEFB 232 ; Pattern tempo
	DEFB 25,203
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 32,255
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 43,171
	DEFB 1,1
	DEFB 32,255
	DEFB 1,1
	DEFB 25,203
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 28,227
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 34,136
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 43,171
	DEFB 1,1
	DEFB 24,192
	DEFB 1,1
	DEFB 25,203
	DEFB 1,1
	DEFB 28,227
	DEFB 1,1
	DEFB 25,203
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 32,255
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 43,171
	DEFB 1,1
	DEFB 32,255
	DEFB 1,1
	DEFB 25,203
	DEFB 1,1
	DEFB 21,171
	DEFB 1,1
	DEFB 24,192
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 38,151
	DEFB 1,1
	DEFB 1,1
	DEFB 1,1
	DEFB 32,255
	DEFB 1,1
	DEFB 24,192
	DEFB 1,1
	DEFB 25,203
	DEFB 1,1
	DEFB 28,227
	DEFB 1,1
	DEFB $0
	.PAT1
	DEFB 232 ; Pattern tempo
	DEFB 25,255
	DEFB 1,1
	DEFB 1,203
	DEFB 1,1
	DEFB 32,171
	DEFB 1,1
	DEFB 1,203
	DEFB 1,1
	DEFB 43,255
	DEFB 1,203
	DEFB 32,171
	DEFB 1,203
	DEFB 25,171
	DEFB 1,203
	DEFB 1,171
	DEFB 1,203
	DEFB 28,227
	DEFB 1,1
	DEFB 1,171
	DEFB 1,1
	DEFB 34,136
	DEFB 1,1
	DEFB 1,171
	DEFB 1,1
	DEFB 43,227
	DEFB 1,171
	DEFB 24,136
	DEFB 1,171
	DEFB 25,136
	DEFB 1,171
	DEFB 28,136
	DEFB 1,171
	DEFB 25,255
	DEFB 1,1
	DEFB 1,203
	DEFB 1,1
	DEFB 32,171
	DEFB 1,1
	DEFB 1,203
	DEFB 1,1
	DEFB 43,255
	DEFB 1,203
	DEFB 32,171
	DEFB 1,203
	DEFB 25,171
	DEFB 1,203
	DEFB 21,171
	DEFB 1,203
	DEFB 24,255
	DEFB 1,1
	DEFB 1,192
	DEFB 1,1
	DEFB 38,151
	DEFB 1,1
	DEFB 1,192
	DEFB 1,1
	DEFB 32,255
	DEFB 1,192
	DEFB 24,151
	DEFB 1,192
	DEFB 25,151
	DEFB 1,192
	DEFB 28,255
	DEFB 1,192
	DEFB $0
;	SECTION	text

.i_1
	defm	"MK1 V3.2"
	defb	0

	defm	"MENSO, YA TE"
	defb	0

	defm	"CUCARACHIARON!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._bspr_it	defs	1
._sp_moviles	defs	6
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._bullets_mx	defs	3
._hotspot_t	defs	1
._spritesClip	defs	2
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._flags	defs	16
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
._bullets_estado	defs	3
._ptgmx	defs	2
._ptgmy	defs	2
._disable_collide_platform	defs	1
._sp_player	defs	2
._gp_gen	defs	2
._sp_bullets	defs	6
._on_pant	defs	1
._enoffs	defs	2
._bullets_x	defs	3
._bullets_y	defs	3
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
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
	LIB	sp_BlockAlloc
	XDEF	__en_t
	XDEF	__en_x
	XDEF	__en_y
	LIB	sp_ScreenStr
	XDEF	_ay_player_on
	defc	_ay_player_on	=	23297
	XDEF	_hotspots
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	XDEF	_fire_bullet
	XDEF	_clr2d
	LIB	sp_MouseAMXInit
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_bspr_it
	XDEF	_sp_moviles
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	__en_y2
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_SetMousePosAMX
	LIB	sp_HashAdd
	XDEF	_bullets_mx
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23651
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
	XDEF	_en_an_state
	defc	_en_an_state	=	23645
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
	LIB	sp_Heapify
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	XDEF	_key_1
	XDEF	_key_2
	XDEF	_key_3
	LIB	sp_MoveSprRel
	XDEF	_mueve_bullets
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
	XDEF	_player_hidden
	XDEF	_hotspot_flag
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_bullets_estado
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
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_sprite_15_c
	XDEF	_ptgmx
	XDEF	_sprite_16_a
	XDEF	_sprite_16_b
	XDEF	_sprite_16_c
	XDEF	_ptgmy
	XDEF	_sprite_17_a
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	23606
	LIB	sp_RegisterHookLast
	LIB	sp_RemoveHook
	XDEF	_sprite_18_a
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_GetCharAddr
	XDEF	_sprite_19_a
	XDEF	_sprite_19_b
	XDEF	_disable_collide_platform
	LIB	sp_HashDelete
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XREF	_script_n
	XDEF	_qtile
	XDEF	_cm_two_points
	XDEF	_shl_player_coords
	XDEF	_draw_and_advance
	XDEF	_sp_player
	XDEF	_init_player
	XDEF	_gp_gen
	XDEF	_sp_bullets
	XDEF	_init_bullets
	LIB	sp_GetTiles
	XDEF	_fix_sprites
	XDEF	_spritesClipValues
	XDEF	_on_pant
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_render_this_enemy
	XDEF	_enoffs
	XDEF	_pad_this_frame
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	XDEF	_bullets_x
	XDEF	_bullets_y
	LIB	sp_GetAttrAddr
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_n_pant
	LIB	sp_Random32
	LIB	sp_ListInsert
	LIB	sp_ListFree
	XDEF	_en_j
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
	XDEF	_player_cells
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_attr
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
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
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
	XDEF	_pvy_total
	LIB	sp_InstallISR
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
	XDEF	_init_player_values
	XDEF	_init_hotspots
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	LIB	sp_inp
	LIB	sp_IterateSprChar
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
	XDEF	_do_extern_action
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_render_all_sprites
	LIB	sp_IterateDList
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
