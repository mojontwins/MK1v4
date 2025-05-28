;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Wed May 28 07:40:54 2025



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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	9

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
	._sprite_1_a
	defb 0, 255
	defb 2, 252
	defb 5, 248
	defb 10, 240
	defb 13, 240
	defb 26, 224
	defb 96, 128
	defb 67, 128
	defb 38, 192
	defb 18, 224
	defb 23, 224
	defb 99, 128
	defb 128, 0
	defb 96, 128
	defb 16, 224
	defb 39, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_b
	defb 0, 255
	defb 64, 63
	defb 32, 31
	defb 32, 31
	defb 80, 15
	defb 8, 7
	defb 4, 3
	defb 226, 1
	defb 212, 3
	defb 208, 7
	defb 240, 7
	defb 236, 3
	defb 2, 1
	defb 28, 3
	defb 136, 7
	defb 228, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_2_a
	defb 2, 252
	defb 5, 248
	defb 10, 240
	defb 13, 240
	defb 26, 224
	defb 112, 128
	defb 67, 128
	defb 38, 192
	defb 18, 224
	defb 23, 224
	defb 35, 192
	defb 64, 128
	defb 80, 128
	defb 40, 208
	defb 8, 240
	defb 19, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_2_b
	defb 64, 63
	defb 32, 31
	defb 16, 15
	defb 80, 15
	defb 8, 7
	defb 4, 3
	defb 226, 1
	defb 212, 3
	defb 208, 7
	defb 240, 7
	defb 232, 7
	defb 4, 3
	defb 20, 3
	defb 152, 7
	defb 16, 15
	defb 200, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_3_a
	defb 3, 252
	defb 6, 248
	defb 13, 240
	defb 10, 240
	defb 20, 224
	defb 33, 192
	defb 66, 128
	defb 118, 128
	defb 23, 224
	defb 35, 192
	defb 32, 192
	defb 40, 192
	defb 40, 192
	defb 24, 224
	defb 9, 240
	defb 6, 249
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 64, 63
	defb 32, 31
	defb 80, 15
	defb 16, 15
	defb 12, 3
	defb 226, 1
	defb 212, 3
	defb 208, 7
	defb 240, 7
	defb 232, 7
	defb 8, 7
	defb 24, 7
	defb 152, 7
	defb 16, 15
	defb 144, 15
	defb 96, 159
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_4_a
	defb 3, 252
	defb 6, 248
	defb 13, 240
	defb 10, 240
	defb 20, 224
	defb 33, 192
	defb 66, 128
	defb 118, 128
	defb 23, 224
	defb 35, 192
	defb 32, 192
	defb 40, 192
	defb 40, 192
	defb 24, 224
	defb 9, 240
	defb 6, 249
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_4_b
	defb 64, 63
	defb 32, 31
	defb 80, 15
	defb 16, 15
	defb 12, 3
	defb 226, 1
	defb 212, 3
	defb 208, 7
	defb 240, 7
	defb 232, 7
	defb 8, 7
	defb 24, 7
	defb 152, 7
	defb 16, 15
	defb 144, 15
	defb 96, 159
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_5_a
	defb 0, 255
	defb 2, 252
	defb 4, 248
	defb 4, 248
	defb 10, 240
	defb 16, 224
	defb 32, 192
	defb 71, 128
	defb 43, 192
	defb 11, 224
	defb 15, 224
	defb 55, 192
	defb 64, 128
	defb 56, 192
	defb 17, 224
	defb 39, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_5_b
	defb 0, 255
	defb 64, 63
	defb 160, 31
	defb 80, 15
	defb 176, 15
	defb 88, 7
	defb 6, 1
	defb 194, 1
	defb 100, 3
	defb 72, 7
	defb 232, 7
	defb 198, 1
	defb 1, 0
	defb 6, 1
	defb 8, 7
	defb 228, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_6_a
	defb 2, 252
	defb 4, 248
	defb 8, 240
	defb 10, 240
	defb 16, 224
	defb 32, 192
	defb 71, 128
	defb 43, 192
	defb 11, 224
	defb 15, 224
	defb 23, 224
	defb 32, 192
	defb 40, 192
	defb 25, 224
	defb 8, 240
	defb 19, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_6_b
	defb 64, 63
	defb 160, 31
	defb 80, 15
	defb 176, 15
	defb 88, 7
	defb 14, 1
	defb 194, 1
	defb 100, 3
	defb 72, 7
	defb 232, 7
	defb 196, 3
	defb 2, 1
	defb 10, 1
	defb 20, 11
	defb 16, 15
	defb 200, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_7_a
	defb 2, 252
	defb 4, 248
	defb 10, 240
	defb 8, 240
	defb 48, 192
	defb 71, 128
	defb 43, 192
	defb 11, 224
	defb 15, 224
	defb 23, 224
	defb 16, 224
	defb 24, 224
	defb 25, 224
	defb 8, 240
	defb 9, 240
	defb 6, 249
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_7_b
	defb 192, 63
	defb 96, 31
	defb 176, 15
	defb 80, 15
	defb 40, 7
	defb 132, 3
	defb 66, 1
	defb 110, 1
	defb 232, 7
	defb 196, 3
	defb 4, 3
	defb 20, 3
	defb 20, 3
	defb 24, 7
	defb 144, 15
	defb 96, 159
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_8_a
	defb 2, 252
	defb 4, 248
	defb 10, 240
	defb 8, 240
	defb 48, 192
	defb 71, 128
	defb 43, 192
	defb 11, 224
	defb 15, 224
	defb 23, 224
	defb 16, 224
	defb 24, 224
	defb 25, 224
	defb 8, 240
	defb 9, 240
	defb 6, 249
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_8_b
	defb 192, 63
	defb 96, 31
	defb 176, 15
	defb 80, 15
	defb 40, 7
	defb 132, 3
	defb 66, 1
	defb 110, 1
	defb 232, 7
	defb 196, 3
	defb 4, 3
	defb 20, 3
	defb 20, 3
	defb 24, 7
	defb 144, 15
	defb 96, 159
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_9_a
	defb 0, 252
	defb 3, 248
	defb 5, 240
	defb 7, 240
	defb 11, 224
	defb 21, 192
	defb 42, 128
	defb 40, 128
	defb 40, 129
	defb 40, 131
	defb 40, 131
	defb 36, 129
	defb 32, 139
	defb 16, 199
	defb 8, 227
	defb 0, 247
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_9_b
	defb 0, 63
	defb 192, 31
	defb 160, 15
	defb 224, 15
	defb 208, 7
	defb 168, 3
	defb 84, 1
	defb 20, 1
	defb 20, 129
	defb 20, 193
	defb 20, 193
	defb 36, 129
	defb 4, 209
	defb 8, 227
	defb 16, 199
	defb 0, 239
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_10_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 252
	defb 3, 248
	defb 5, 240
	defb 7, 224
	defb 27, 128
	defb 101, 0
	defb 138, 0
	defb 144, 4
	defb 72, 3
	defb 36, 129
	defb 0, 219
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_10_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 63
	defb 192, 31
	defb 160, 15
	defb 224, 7
	defb 216, 1
	defb 166, 0
	defb 81, 0
	defb 9, 32
	defb 18, 192
	defb 36, 129
	defb 0, 219
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_11_a
	defb 0, 248
	defb 7, 240
	defb 15, 128
	defb 111, 0
	defb 146, 0
	defb 140, 0
	defb 105, 0
	defb 115, 0
	defb 27, 128
	defb 28, 192
	defb 15, 224
	defb 3, 240
	defb 7, 128
	defb 124, 0
	defb 254, 0
	defb 124, 1
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_11_b
	defb 12, 97
	defb 146, 0
	defb 210, 0
	defb 52, 1
	defb 220, 1
	defb 152, 3
	defb 48, 7
	defb 240, 7
	defb 96, 15
	defb 192, 19
	defb 140, 33
	defb 222, 0
	defb 190, 0
	defb 252, 1
	defb 248, 3
	defb 112, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_12_a
	defb 96, 15
	defb 144, 0
	defb 151, 0
	defb 211, 0
	defb 108, 0
	defb 8, 128
	defb 51, 128
	defb 63, 128
	defb 27, 192
	defb 28, 192
	defb 7, 224
	defb 111, 224
	defb 243, 128
	defb 124, 0
	defb 62, 0
	defb 12, 1
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_12_b
	defb 12, 225
	defb 18, 0
	defb 210, 0
	defb 52, 1
	defb 220, 1
	defb 80, 3
	defb 48, 7
	defb 240, 7
	defb 96, 15
	defb 224, 15
	defb 128, 31
	defb 192, 31
	defb 128, 1
	defb 126, 0
	defb 255, 0
	defb 126, 0
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_13_a
	defb 0, 255
	defb 52, 195
	defb 72, 131
	defb 136, 7
	defb 136, 7
	defb 8, 5
	defb 133, 0
	defb 0, 0
	defb 131, 0
	defb 129, 0
	defb 3, 136
	defb 66, 136
	defb 16, 236
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_13_b
	defb 0, 255
	defb 44, 195
	defb 18, 193
	defb 17, 224
	defb 17, 224
	defb 16, 160
	defb 161, 0
	defb 0, 0
	defb 193, 0
	defb 129, 0
	defb 192, 17
	defb 66, 17
	defb 8, 55
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_14_a
	defb 0, 255
	defb 0, 255
	defb 32, 223
	defb 64, 189
	defb 65, 188
	defb 96, 152
	defb 147, 8
	defb 9, 0
	defb 131, 0
	defb 130, 0
	defb 0, 4
	defb 128, 3
	defb 4, 131
	defb 68, 131
	defb 18, 225
	defb 6, 249
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_14_b
	defb 0, 255
	defb 0, 255
	defb 4, 251
	defb 2, 189
	defb 130, 61
	defb 6, 25
	defb 201, 16
	defb 144, 0
	defb 193, 0
	defb 65, 0
	defb 0, 32
	defb 1, 192
	defb 32, 193
	defb 34, 193
	defb 72, 135
	defb 96, 159
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_15_a
	defb 0, 0
	defb 47, 0
	defb 95, 0
	defb 47, 0
	defb 23, 128
	defb 11, 192
	defb 5, 224
	defb 3, 240
	defb 0, 248
	defb 1, 252
	defb 1, 252
	defb 0, 254
	defb 0, 255
	defb 0, 255
	defb 0, 252
	defb 0, 254
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_15_b
	defb 0, 0
	defb 250, 0
	defb 244, 0
	defb 250, 0
	defb 212, 1
	defb 232, 3
	defb 208, 7
	defb 160, 15
	defb 0, 31
	defb 128, 63
	defb 192, 31
	defb 32, 15
	defb 16, 199
	defb 16, 199
	defb 32, 15
	defb 0, 31
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._sprite_16_a
	defb 0, 0
	defb 47, 0
	defb 95, 0
	defb 47, 0
	defb 23, 128
	defb 11, 192
	defb 5, 224
	defb 3, 240
	defb 0, 248
	defb 1, 252
	defb 0, 254
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_16_b
	defb 0, 0
	defb 250, 0
	defb 244, 0
	defb 250, 0
	defb 212, 1
	defb 232, 3
	defb 208, 7
	defb 160, 15
	defb 0, 31
	defb 128, 63
	defb 224, 15
	defb 16, 7
	defb 8, 227
	defb 8, 227
	defb 8, 3
	defb 0, 135
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	defb	2
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 2, 2 + 20, 1, 1 + 30
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
	add 2
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
	ld	bc,i_21
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_21
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
	jp	i_24
.i_22
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_24
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,40	;const
	call	l_ult
	jp	nc,i_23
	halt
	jp	i_22
.i_23
	ret



._espera_activa
.i_27
	call	_pad_read
	halt
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_26
.i_28
.i_25
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_27
.i_26
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
.i_29
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_31
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_30
.i_31
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_33
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_30
.i_33
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_35
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_30
.i_35
.i_34
.i_32
	jp	i_29
.i_30
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
	add 2
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
	jp	i_38
.i_36
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_38
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_37
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
	jp	i_36
.i_37
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
	add 2
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
;	SECTION	text

._mapa
	defm	""
	defb	18

	defm	""
	defb	16

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
	defb	1

	defm	""
	defb	16

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UUQ"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UUU"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UUUR"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	21

	defm	"UUU"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	25

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"331"
	defb	153

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"3333"
	defb	0

	defm	""
	defb	192

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
	defb	11

	defm	""
	defb	203

	defm	""
	defb	176

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

	defm	"UUU"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"UUU"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@UUUU"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	5

	defm	"UUUQ"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	4

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
	defb	1

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	"3333$"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331`"
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
	defb	6

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
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
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
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
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
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	192

	defm	""
	defb	188

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UUU["
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UUUUP"
	defb	0

	defm	""
	defb	0

	defm	"UUUUUP"
	defb	0

	defm	"UUUUUUP"
	defb	1

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"1"
	defb	17

	defm	" 333"
	defb	0

	defm	"1"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"33 "
	defb	0

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"31"
	defb	3

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	0

	defm	"30"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	1

	defm	""
	defb	3

	defm	"33$"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	"'wwq`"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"A"
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
	defb	6

	defm	""
	defb	16

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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

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

	defm	"UUUUP"
	defb	0

	defm	""
	defb	0

	defm	"UUUUUP"
	defb	0

	defm	"UUUUUUPUUUUUUUUUUUUUUU"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	16

	defm	"33"
	defb	240

	defm	"333"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"32"
	defb	26

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331"
	defb	9

	defm	""
	defb	157

	defm	""
	defb	0

	defm	"3333 "
	defb	154

	defm	""
	defb	157

	defm	""
	defb	3

	defm	"3331"
	defb	10

	defm	""
	defb	9

	defm	""
	defb	157

	defm	""
	defb	16

	defm	"33"
	defb	16

	defm	" "
	defb	0

	defm	""
	defb	154

	defm	""
	defb	145

	defm	""
	defb	3

	defm	"30"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	9

	defm	" 333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	145

	defm	""
	defb	3

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	16

	defm	"1"
	defb	3

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	161

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"0"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"3333333"
	defb	30

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3332"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"31"
	defb	3

	defm	"3"
	defb	16

	defm	""
	defb	4

	defm	"`"
	defb	3

	defm	"3"
	defb	0

	defm	"31"
	defb	0

	defm	"`"
	defb	0

	defm	"333<"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"333"
	defb	17

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"32"
	defb	3

	defm	"0 "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"31"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"333"
	defb	16

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331"
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

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	176

	defm	""
	defb	176

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
	defb	13

	defm	""
	defb	13

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
	defb	160

	defm	""
	defb	160

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
	defb	1

	defm	""
	defb	16

	defm	""
	defb	3

	defm	"3331"
	defb	0

	defm	" "
	defb	3

	defm	"3331"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33"
	defb	16

	defm	"3"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"330"
	defb	3

	defm	"3 "
	defb	1

	defm	""
	defb	3

	defm	""
	defb	16

	defm	"3330"
	defb	0

	defm	""
	defb	16

	defm	"0"
	defb	3

	defm	"3330"
	defb	1

	defm	""
	defb	192

	defm	"33"
	defb	16

	defm	"33p"
	defb	21

	defm	"P30"
	defb	3

	defm	"3"
	defb	17

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	3

	defm	"33"
	defb	16

	defm	"2"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"330"
	defb	3

	defm	""
	defb	16

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
	defb	16

	defm	""
	defb	4

	defm	""
	defb	132

	defm	"D"
	defb	132

	defm	"D"
	defb	132

	defm	"A"
	defb	4

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	16

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	145

	defm	""
	defb	10

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	1

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

	defm	"w"
	defb	16

	defm	"333331"
	defb	17

	defm	""
	defb	3

	defm	"33333"
	defb	0

	defm	""
	defb	16

	defm	"33333"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33330"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"33"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"31"
	defb	16

	defm	"3330"
	defb	3

	defm	"3!"
	defb	192

	defm	"333331"
	defb	17

	defm	""
	defb	16

	defm	"3333<"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"333<"
	defb	177

	defm	"333331"
	defb	17

	defm	""
	defb	19

	defm	"33333"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	16

	defm	"333333"
	defb	16

	defm	""
	defb	3

	defm	"333331 "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"!"
	defb	3

	defm	"33"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	23

	defm	"w 3"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"2"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"1"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	3

	defm	"33"
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"3"
	defb	18

	defm	""
	defb	17

	defm	"3333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3333 `"
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	16

	defm	"31"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"30"
	defb	3

	defm	";"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	3

	defm	"31"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"33"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3332"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"2www"
	defb	22

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

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
	defb	7

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
	defb	215

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
	defb	9

	defm	""
	defb	215

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	170

	defm	""
	defb	215

	defm	""
	defb	212

	defm	"p"
	defb	0

	defm	"}"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	217

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	169

	defm	""
	defb	170

	defm	""
	defb	157

	defm	""
	defb	13

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	160

	defm	""
	defb	170

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
	defb	1

	defm	""
	defb	3

	defm	"33331"
	defb	0

	defm	" 33333"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33332"
	defb	0

	defm	""
	defb	18

	defm	""
	defb	3

	defm	"3333"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	"33331"
	defb	0

	defm	""
	defb	16

	defm	"33333"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33331"
	defb	0

	defm	""
	defb	16

	defm	"33333"
	defb	16

	defm	""
	defb	1

	defm	"wwww"
	defb	16

	defm	"1"
	defb	0

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	3

	defm	" "
	defb	0

	defm	""
	defb	16

	defm	"333330"
	defb	1

	defm	""
	defb	16

	defm	"33333"
	defb	0

	defm	""
	defb	27

	defm	""
	defb	3

	defm	"33330"
	defb	1

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"333"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"3330"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33333"
	defb	0

	defm	""
	defb	16

	defm	"333330"
	defb	1

	defm	""
	defb	3

	defm	"33333"
	defb	0

	defm	""
	defb	23

	defm	"www"
	defb	183

	defm	"wp"
	defb	1

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"3333333#3333331333333<"
	defb	17

	defm	""
	defb	16

	defm	"33333"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"33330"
	defb	19

	defm	"3333331333331"
	defb	3

	defm	"#33333"
	defb	0

	defm	"1wwww"
	defb	16

	defm	"33"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"31"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"1"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	224

	defm	"31"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"30"
	defb	3

	defm	"3"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	30

	defm	""
	defb	3

	defm	"33"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	"3>"
	defb	1

	defm	""
	defb	7

	defm	"w"
	defb	0

	defm	""
	defb	16

	defm	"33"
	defb	0

	defm	""
	defb	16

	defm	"UP"
	defb	1

	defm	"wwUR"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	16

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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3333"
	defb	16

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3>"
	defb	3

	defm	"2"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"33"
	defb	0

	defm	"3"
	defb	16

	defm	"`"
	defb	0

	defm	""
	defb	3

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	3

	defm	"35"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"1"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	6

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

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"`"
	defb	0

	defm	""
	defb	6

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"LD"
	defb	180

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"ff`"
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
	defb	1

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"1"
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33331"
	defb	0

	defm	""
	defb	16

	defm	"33333 "
	defb	2

	defm	""
	defb	17

	defm	"!"
	defb	3

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	1

	defm	""
	defb	3

	defm	"33331"
	defb	0

	defm	""
	defb	16

	defm	"33333"
	defb	16

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"1"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

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
	defb	3

	defm	"333333"
	defb	0

	defm	"3333330"
	defb	3

	defm	"333331"
	defb	0

	defm	"333333"
	defb	0

	defm	""
	defb	3

	defm	"<"
	defb	3

	defm	"3333"
	defb	0

	defm	";"
	defb	187

	defm	""
	defb	203

	defm	"{"
	defb	199

	defm	"wp"
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"3"
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"3"
	defb	17

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
	defb	3

	defm	"0#33333313333333"
	defb	18

	defm	""
	defb	3

	defm	"333332"
	defb	0

	defm	"333333"
	defb	19

	defm	"3333331ww"
	defb	188

	defm	""
	defb	3

	defm	"333"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	3

	defm	"31 "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	188

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	3

	defm	""
	defb	16

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

	defm	"2"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	28

	defm	"8"
	defb	8

	defm	""
	defb	3

	defm	"$"
	defb	132

	defm	""
	defb	132

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	209

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	218

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"3"
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"330"
	defb	3

	defm	""
	defb	30

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	"`33"
	defb	16

	defm	"3"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	3

	defm	"30"
	defb	3

	defm	"?"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3331"
	defb	22

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	131

	defm	"1"
	defb	188

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	12

	defm	""
	defb	20

	defm	"D"
	defb	217

	defm	""
	defb	154

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	153

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

	defm	"HD"
	defb	132

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	212

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	212

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	212

	defm	""
	defb	132

	defm	"-"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	153

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	1

	defm	""
	defb	3

	defm	"33331"
	defb	0

	defm	""
	defb	16

	defm	"3330"
	defb	17

	defm	" "
	defb	1

	defm	""
	defb	3

	defm	"333 "
	defb	1

	defm	""
	defb	0

	defm	" 3"
	defb	192

	defm	"30"
	defb	3

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	3

	defm	";"
	defb	3

	defm	""
	defb	192

	defm	"31"
	defb	0

	defm	""
	defb	240

	defm	"<"
	defb	188

	defm	""
	defb	11

	defm	""
	defb	3

	defm	"3"
	defb	240

	defm	""
	defb	17

	defm	""
	defb	27

	defm	""
	defb	188

	defm	""
	defb	188

	defm	""
	defb	187

	defm	""
	defb	3

	defm	""
	defb	17

	defm	""
	defb	29

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	17

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	154

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

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

	defm	"3333330"
	defb	3

	defm	""
	defb	3

	defm	"30303"
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	3

	defm	""
	defb	3

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

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" D"
	defb	132

	defm	"D"
	defb	132

	defm	"D"
	defb	132

	defm	"A-"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	154

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	0

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	0

	defm	""
	defb	169

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	"33"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"1"
	defb	17

	defm	"333331"
	defb	17

	defm	"#3"
	defb	3

	defm	"03"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"HD@31HD"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"D"
	defb	3

	defm	""
	defb	29

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	157

	defm	""
	defb	212

	defm	""
	defb	2

	defm	""
	defb	154

	defm	""
	defb	153

	defm	""
	defb	160

	defm	""
	defb	169

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	212

	defm	""
	defb	26

	defm	""
	defb	10

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	170

	defm	""
	defb	154

	defm	""
	defb	209

;	SECTION	code


;	SECTION	text

._cerrojos
	defb	5
	defb	6
	defb	8
	defb	0
	defb	25
	defb	8
	defb	5
	defb	0
	defb	27
	defb	1
	defb	5
	defb	0
	defb	27
	defb	13
	defb	5
	defb	0

;	SECTION	code

;	SECTION	text

._malotes
	defb	64
	defb	16
	defb	64
	defb	16
	defb	64
	defb	128
	defb	0
	defb	4
	defb	3
	defb	208
	defb	16
	defb	96
	defb	16
	defb	208
	defb	16
	defb	-2
	defb	0
	defb	1
	defb	192
	defb	0
	defb	112
	defb	0
	defb	192
	defb	0
	defb	-2
	defb	0
	defb	1
	defb	128
	defb	0
	defb	128
	defb	0
	defb	128
	defb	64
	defb	0
	defb	1
	defb	2
	defb	144
	defb	16
	defb	144
	defb	16
	defb	176
	defb	96
	defb	2
	defb	2
	defb	2
	defb	96
	defb	0
	defb	96
	defb	0
	defb	96
	defb	32
	defb	0
	defb	1
	defb	2
	defb	16
	defb	32
	defb	16
	defb	32
	defb	96
	defb	32
	defb	2
	defb	0
	defb	1
	defb	144
	defb	96
	defb	144
	defb	0
	defb	144
	defb	96
	defb	0
	defb	-1
	defb	3
	defb	176
	defb	0
	defb	176
	defb	0
	defb	176
	defb	80
	defb	0
	defb	1
	defb	2
	defb	96
	defb	112
	defb	48
	defb	112
	defb	96
	defb	112
	defb	-1
	defb	0
	defb	3
	defb	48
	defb	0
	defb	48
	defb	0
	defb	48
	defb	32
	defb	0
	defb	1
	defb	1
	defb	208
	defb	0
	defb	208
	defb	0
	defb	208
	defb	64
	defb	0
	defb	2
	defb	1
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	80
	defb	0
	defb	1
	defb	1
	defb	96
	defb	0
	defb	96
	defb	0
	defb	96
	defb	64
	defb	0
	defb	1
	defb	1
	defb	160
	defb	0
	defb	160
	defb	0
	defb	208
	defb	80
	defb	2
	defb	2
	defb	2
	defb	80
	defb	112
	defb	16
	defb	112
	defb	80
	defb	112
	defb	-2
	defb	0
	defb	2
	defb	96
	defb	0
	defb	0
	defb	0
	defb	96
	defb	0
	defb	-1
	defb	0
	defb	2
	defb	224
	defb	0
	defb	224
	defb	0
	defb	224
	defb	48
	defb	0
	defb	1
	defb	2
	defb	128
	defb	16
	defb	128
	defb	16
	defb	128
	defb	128
	defb	0
	defb	2
	defb	3
	defb	160
	defb	0
	defb	160
	defb	0
	defb	160
	defb	112
	defb	0
	defb	1
	defb	1
	defb	16
	defb	96
	defb	16
	defb	96
	defb	80
	defb	128
	defb	4
	defb	4
	defb	2
	defb	16
	defb	80
	defb	16
	defb	48
	defb	96
	defb	80
	defb	1
	defb	-1
	defb	1
	defb	16
	defb	16
	defb	16
	defb	16
	defb	96
	defb	16
	defb	2
	defb	0
	defb	2
	defb	160
	defb	0
	defb	160
	defb	0
	defb	160
	defb	144
	defb	0
	defb	2
	defb	3
	defb	48
	defb	32
	defb	48
	defb	32
	defb	144
	defb	32
	defb	2
	defb	0
	defb	3
	defb	112
	defb	48
	defb	112
	defb	48
	defb	112
	defb	128
	defb	0
	defb	1
	defb	2
	defb	160
	defb	96
	defb	160
	defb	0
	defb	160
	defb	96
	defb	0
	defb	-2
	defb	3
	defb	96
	defb	128
	defb	96
	defb	16
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	144
	defb	16
	defb	144
	defb	16
	defb	176
	defb	112
	defb	2
	defb	2
	defb	3
	defb	112
	defb	48
	defb	32
	defb	16
	defb	112
	defb	48
	defb	-2
	defb	-2
	defb	1
	defb	64
	defb	128
	defb	64
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	4
	defb	208
	defb	112
	defb	112
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	1
	defb	64
	defb	16
	defb	64
	defb	16
	defb	96
	defb	16
	defb	1
	defb	0
	defb	3
	defb	16
	defb	128
	defb	16
	defb	128
	defb	160
	defb	128
	defb	1
	defb	0
	defb	4
	defb	48
	defb	112
	defb	48
	defb	64
	defb	48
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	80
	defb	48
	defb	80
	defb	48
	defb	160
	defb	96
	defb	2
	defb	2
	defb	2
	defb	208
	defb	112
	defb	128
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	3
	defb	208
	defb	80
	defb	208
	defb	16
	defb	208
	defb	80
	defb	0
	defb	-1
	defb	2
	defb	16
	defb	16
	defb	16
	defb	16
	defb	96
	defb	128
	defb	4
	defb	4
	defb	3
	defb	64
	defb	0
	defb	64
	defb	0
	defb	112
	defb	48
	defb	2
	defb	2
	defb	1
	defb	16
	defb	64
	defb	16
	defb	64
	defb	80
	defb	112
	defb	1
	defb	1
	defb	2
	defb	208
	defb	16
	defb	192
	defb	16
	defb	208
	defb	128
	defb	-2
	defb	2
	defb	3
	defb	16
	defb	0
	defb	16
	defb	0
	defb	112
	defb	32
	defb	1
	defb	1
	defb	2
	defb	208
	defb	0
	defb	176
	defb	0
	defb	208
	defb	48
	defb	-2
	defb	2
	defb	3
	defb	64
	defb	64
	defb	64
	defb	0
	defb	96
	defb	64
	defb	1
	defb	-1
	defb	1
	defb	160
	defb	112
	defb	160
	defb	64
	defb	160
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	192
	defb	32
	defb	48
	defb	32
	defb	192
	defb	32
	defb	-1
	defb	0
	defb	4
	defb	64
	defb	0
	defb	64
	defb	0
	defb	176
	defb	16
	defb	1
	defb	1
	defb	3
	defb	192
	defb	48
	defb	80
	defb	48
	defb	192
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	112
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	3
	defb	64
	defb	80
	defb	64
	defb	80
	defb	192
	defb	112
	defb	2
	defb	2
	defb	2
	defb	192
	defb	48
	defb	32
	defb	48
	defb	192
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	16
	defb	32
	defb	16
	defb	32
	defb	128
	defb	32
	defb	1
	defb	0
	defb	1
	defb	16
	defb	64
	defb	16
	defb	64
	defb	112
	defb	112
	defb	2
	defb	2
	defb	2
	defb	208
	defb	64
	defb	128
	defb	64
	defb	208
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	0
	defb	2
	defb	1
	defb	64
	defb	32
	defb	64
	defb	32
	defb	64
	defb	80
	defb	0
	defb	2
	defb	3
	defb	16
	defb	112
	defb	16
	defb	112
	defb	112
	defb	112
	defb	1
	defb	0
	defb	1
	defb	192
	defb	128
	defb	192
	defb	16
	defb	192
	defb	128
	defb	0
	defb	-1
	defb	4
	defb	112
	defb	48
	defb	16
	defb	48
	defb	112
	defb	48
	defb	-2
	defb	0
	defb	3
	defb	176
	defb	48
	defb	32
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	1
	defb	176
	defb	64
	defb	48
	defb	64
	defb	176
	defb	64
	defb	-1
	defb	0
	defb	1
	defb	16
	defb	0
	defb	16
	defb	0
	defb	192
	defb	32
	defb	2
	defb	2
	defb	2
	defb	32
	defb	112
	defb	32
	defb	112
	defb	192
	defb	112
	defb	2
	defb	0
	defb	4
	defb	192
	defb	32
	defb	48
	defb	32
	defb	192
	defb	32
	defb	-2
	defb	0
	defb	4
	defb	176
	defb	80
	defb	48
	defb	80
	defb	176
	defb	80
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	80
	defb	32
	defb	80
	defb	208
	defb	80
	defb	-1
	defb	0
	defb	4
	defb	64
	defb	64
	defb	64
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	2
	defb	16
	defb	0
	defb	0
	defb	0
	defb	16
	defb	144
	defb	-3
	defb	3
	defb	2
	defb	16
	defb	48
	defb	16
	defb	48
	defb	208
	defb	48
	defb	1
	defb	0
	defb	4
	defb	96
	defb	64
	defb	96
	defb	64
	defb	96
	defb	128
	defb	0
	defb	1
	defb	1
	defb	208
	defb	80
	defb	128
	defb	80
	defb	208
	defb	128
	defb	-2
	defb	2
	defb	3
	defb	96
	defb	32
	defb	96
	defb	32
	defb	96
	defb	96
	defb	0
	defb	2
	defb	1
	defb	128
	defb	80
	defb	128
	defb	80
	defb	224
	defb	80
	defb	2
	defb	0
	defb	4
	defb	96
	defb	112
	defb	16
	defb	112
	defb	96
	defb	112
	defb	-1
	defb	0
	defb	3
	defb	112
	defb	16
	defb	112
	defb	16
	defb	112
	defb	80
	defb	0
	defb	1
	defb	2
	defb	48
	defb	96
	defb	48
	defb	0
	defb	48
	defb	96
	defb	0
	defb	-2
	defb	1
	defb	176
	defb	48
	defb	176
	defb	48
	defb	176
	defb	128
	defb	0
	defb	2
	defb	3
	defb	160
	defb	32
	defb	160
	defb	32
	defb	192
	defb	80
	defb	2
	defb	2
	defb	1
	defb	96
	defb	48
	defb	96
	defb	0
	defb	96
	defb	48
	defb	0
	defb	-1
	defb	2
	defb	144
	defb	144
	defb	48
	defb	144
	defb	144
	defb	144
	defb	-1
	defb	0
	defb	3
	defb	32
	defb	80
	defb	32
	defb	16
	defb	32
	defb	80
	defb	0
	defb	-2
	defb	1
	defb	192
	defb	80
	defb	192
	defb	32
	defb	192
	defb	80
	defb	0
	defb	-2
	defb	2
	defb	112
	defb	80
	defb	112
	defb	32
	defb	112
	defb	80
	defb	0
	defb	-1
	defb	3
	defb	208
	defb	48
	defb	32
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	64
	defb	32
	defb	64
	defb	32
	defb	192
	defb	32
	defb	1
	defb	0
	defb	2
	defb	80
	defb	96
	defb	80
	defb	96
	defb	112
	defb	96
	defb	1
	defb	0
	defb	1
	defb	112
	defb	16
	defb	16
	defb	16
	defb	112
	defb	80
	defb	-2
	defb	2
	defb	3
	defb	176
	defb	64
	defb	176
	defb	64
	defb	176
	defb	96
	defb	0
	defb	1
	defb	1
	defb	208
	defb	80
	defb	208
	defb	80
	defb	208
	defb	128
	defb	0
	defb	1
	defb	1

;	SECTION	code

;	SECTION	text

._hotspots
	defb	22
	defb	2
	defb	0
	defb	115
	defb	2
	defb	0
	defb	113
	defb	1
	defb	0
	defb	216
	defb	1
	defb	0
	defb	81
	defb	1
	defb	0
	defb	24
	defb	1
	defb	0
	defb	98
	defb	1
	defb	0
	defb	115
	defb	1
	defb	0
	defb	69
	defb	1
	defb	0
	defb	129
	defb	2
	defb	0
	defb	209
	defb	2
	defb	0
	defb	18
	defb	1
	defb	0
	defb	200
	defb	1
	defb	0
	defb	100
	defb	1
	defb	0
	defb	148
	defb	1
	defb	0
	defb	34
	defb	1
	defb	0
	defb	66
	defb	1
	defb	0
	defb	209
	defb	1
	defb	0
	defb	19
	defb	1
	defb	0
	defb	113
	defb	1
	defb	0
	defb	133
	defb	1
	defb	0
	defb	35
	defb	1
	defb	0
	defb	70
	defb	1
	defb	0
	defb	87
	defb	1
	defb	0
	defb	129
	defb	1
	defb	0
	defb	87
	defb	1
	defb	0
	defb	114
	defb	1
	defb	0
	defb	100
	defb	1
	defb	0
	defb	129
	defb	1
	defb	0
	defb	212
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
	jp	nc,i_45
	ld	hl,_player+28
	call	l_gchar
	ld	a,h
	or	l
	jr	nz,i_46_i_45
.i_45
	jp	i_44
.i_46_i_45
	xor a
	ld (__t), a
	ld a, (_comportamiento_tiles) ;; beh [0]
	ld (__n), a
	ld a, (_rdx)
	ld (__x), a
	ld a, (_rdy)
	ld (__y), a
	call set_map_tile_do
	ld b, 4
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
.i_44
	ret



._init_cerrojos
	ld b, 4
	ld hl, _cerrojos + 3
	ld de, 4
	ld a, 1
	.init_cerrojos_loop
	ld (hl), a
	add hl, de
	djnz init_cerrojos_loop
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
	ld (_hit), a
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
	and #(0x01 | 0x80)
	cp #(0x01 | 0x80)
	jr z, m_jump_start_done
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
	and #(0x01 | 0x80)
	cp #(0x01 | 0x80)
	jr z, m_jump_perform_not_pressing
	ld a, (_player + 19)
	or a
	jr z, m_jump_perform_done
	ld a, (_player + 14)
	srl a
	ld d, 0
	ld e, a
	ld hl, 192 + 32
	sbc hl, de
	ex de, hl
	ld hl, (_player + 8)
	sbc hl, de
	ld de, -312
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
	ld (_gpy), A
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
	ld a, (_at1)
	and 12
	jr nz, m_vert_coll_down_adjust
	ld a, (_at2)
	and 12
	jr z, m_vert_coll_checks_done
	.m_vert_coll_down_adjust
	ld hl, 0
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
	ld a, 1
	ld (_hit), a
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
	ld de, -64
	ld hl, (_player + 6)
	add hl, de
	ld de, -256
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
	ld de, 64
	ld hl, (_player + 6)
	add hl, de
	ld de, 256
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
	jr z, m_horz_coll_checks_done
	.m_horz_coll_right_adjust
	call _check_lock_or_box_horz
	ld hl, 0
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
	ld (_hit), a
	ld hl, (_pvy_total)
	ld (_player + 8), hl
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
	ld a, (_hit)
	or a
	jr z, m_evil_tile_hit_done
	.m_evil_tile_hit_do
	ld a, (_rdi)
	or a
	jr z, m_evil_tile_hit_v
	.m_evil_tile_hit_h
	ld hl, (_pvx_total)
	call l_neg
	ld (_player + 6), hl
	jr m_evil_tile_vel_set
	.m_evil_tile_hit_v
	ld hl, (_pvy_total)
	call l_neg
	ld (_player + 8), hl
	.m_evil_tile_vel_set
	ld l, 2
	call _peta_el_beeper
	ld a, 1
	ld (_player + 46), a
	ld a, 1
	ld (_player + 36), a
	.m_evil_tile_hit_done
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
	and 1
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



._init_player_values
	ld	a,#(32 % 256 % 256)
	ld	(_gpx),a
	ld	hl,32 % 256	;const
	ld	a,l
	ld	(_gpy),a
	ld a, (_gpx)
	call Ashl16_HL
	ld (_player), hl
	ld a, (_gpy)
	call Ashl16_HL
	ld (_player + 2), hl
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
	ld hl, 99
	ld (_player + 29), hl
	xor a
	ld (_player + 27), a
	ld (_player + 28), a
	ld (_player + 32), a
	ret



._init_hotspots
	ld b, 6 * 5
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
	add 2
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
	add 2
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
	ld	hl,_mapa
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	ld	de,75
	call	l_mult
	pop	de
	add	hl,de
	ld	(_gp_gen),hl
	xor a
	ld (_rdi), a
	ld (_gpit), a
	.draw_scr_bg_loop
	ld hl, (_gp_gen)
	ld a, (hl)
	inc hl
	ld (_gp_gen), hl
	ld b, a
	srl a
	srl a
	srl a
	srl a
	ld (_rdt1), a
	ld a, b
	and 15
	ld (_rdt2), a
	ld a, (_rdt1)
	ld (__n), a
	call _draw_and_advance
	ld a, (_rdt2)
	ld (__n), a
	call _draw_and_advance
	ld a, (_gpit)
	inc a
	ld (_gpit), a
	cp 75
	jr nz, draw_scr_bg_loop
	jr draw_scr_bg_loop_end
	.draw_scr_bg_loop_end
	call	_hotspot_paint
	ld hl, _cerrojos
	ld b, 4
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
	jp	i_49
.i_47
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_49
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_48
	ld bc, (_enit)
	xor a
	ld b, a
	ld hl, _en_an_frame
	add hl, bc
	ld (hl), a
	ld hl, _en_an_state
	add hl, bc
	ld (hl), a
	ld hl, (_enoffs)
	add hl, bc
	ld (_enoffsmasi), hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
.i_52
	ld	a,l
	cp	#(1% 256)
	jp	z,i_53
	cp	#(2% 256)
	jp	z,i_54
	cp	#(3% 256)
	jp	z,i_55
	cp	#(4% 256)
	jp	z,i_56
	jp	i_57
.i_53
.i_54
.i_55
.i_56
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_51
.i_57
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
.i_51
	call enems_update_values_store
	jp	i_47
.i_48
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
	jp	i_60
.i_58
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_60
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_59
	jp	nc,i_59
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_61
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
	jp	nc,i_62
	call en_lineal_do
.i_62
	call	_enems_calc_frame
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_64
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_64
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_65_i_64
.i_64
	jp	i_63
.i_65_i_64
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
	jp	i_66
.i_63
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_68
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_68
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_68
	jr	c,i_69_i_68
.i_68
	jp	i_67
.i_69_i_68
	ld	a,(_player+23)
	and	a
	jp	nz,i_70
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
	.en_col_lin_h
	ld a, (__en_mx)
	or a
	jr z, en_col_lin_v
	bit 7, a
	jr z, en_col_lin_h_pos
	.en_col_lin_h_neg
	ld hl, -256*2
	jr en_col_lin_h_write
	.en_col_lin_h_pos
	ld hl, 256*2
	.en_col_lin_h_write
	ld (_player + 6), hl
	.en_col_lin_v
	ld a, (__en_my)
	or a
	jr z, en_col_lin_end
	bit 7, a
	jr z, en_col_lin_v_pos
	.en_col_lin_v_neg
	ld hl, -256*2
	jr en_col_lin_v_write
	.en_col_lin_v_pos
	ld hl, 256*2
	.en_col_lin_v_write
	ld (_player + 8), hl
	.en_col_lin_end
.i_70
.i_67
.i_66
.i_61
.i_71
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_58
.i_59
	ret


	._calc_baddies_pointer
	ld d, h
	ld e, l
	add hl, hl
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
	ld	hl,12	;const
	push	hl
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
	call	_no_break
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_74
.i_72
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_74
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_73
	jp	nc,i_73
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_72
.i_73
	ld	hl,9	;const
	call	_peta_el_beeper
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
	ld	hl,i_1+9
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	_no_break
	call SPUpdateNow
	ld	hl,10	;const
	call	_peta_el_beeper
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._main
	ld sp, 61936
	call	_system_init
.i_75
	call	_title_screen
	call	_blackout
	call SPUpdateNow
	ld hl, _s_marco
	call _unpack_screen
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	ld	hl,24 % 256	;const
	ld	a,l
	ld	(_n_pant),a
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
.i_77
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_78
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
	jp	nc,i_79
	ld	hl,11	;const
	push	hl
	ld	hl,0	;const
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
.i_79
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_80
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_81
	or	l
	jp	z,i_81
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_82
.i_81
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_82
	ld	hl,4	;const
	push	hl
	ld	hl,0	;const
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
.i_80
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_83
	ld a, 17
	ld (__x), a
	ld a, 0
	ld (__y), a
	ld a, (_player + 28)
	ld (_keys_old), a
	call draw_2_digits_shortcut
.i_83
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
	jp	z,i_84
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_87
	ld	a,l
	cp	#(1% 256)
	jp	z,i_88
	cp	#(2% 256)
	jp	z,i_89
	cp	#(3% 256)
	jp	z,i_90
	jp	i_86
.i_88
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	call	_peta_el_beeper
	jp	i_86
.i_89
	ld	hl,_player+28
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
	jp	i_86
.i_90
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,10
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+29)
	ld	de,99	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_91
	ld	hl,99	;const
	ld	(_player+29),hl
.i_91
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_86
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_92
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
	ld	de,2
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
	ld	l,a
	ld	h,0
.i_92
.i_84
	._hotspots_else
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
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_94
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_95_i_94
.i_94
	jp	i_93
.i_95_i_94
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_96
.i_93
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_98
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_99_i_98
.i_98
	jp	i_97
.i_99_i_98
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_97
.i_96
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_101
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_101
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_101_uge
	jp	c,i_101
.i_101_uge
	jr	i_102_i_101
.i_101
	jp	i_100
.i_102_i_101
	ld a, (_n_pant)
	sub 6
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_103
.i_100
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_105
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_106_i_105
.i_105
	jp	i_104
.i_106_i_105
	ld a, (_n_pant)
	add 6
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_104
.i_103
	ld	hl,_player+27
	call	l_gchar
	ld	de,25	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_107
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_107
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_108
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
.i_108
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	p,i_109
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_109
	xor a
	ld (_pant_just_rendered), a
	jp	i_77
.i_78
	jp	i_75
.i_76
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
	defb 0 ; pattern loop begin * 2
	defb 16 ; song length * 2
	defw 8 ; offset to start of song (length of instrument table)
	defb 1 ; multiple
	defw 10 ; detune
	defb 0 ; phase
	defb 1 ; multiple
	defw 5 ; detune
	defb 1 ; phase
	.patterndata
	defw pat0
	defw pat1
	defw pat0
	defw pat1
	defw pat2
	defw pat3
	defw pat2
	defw pat3
	; *** pattern data - $00 marks the end of a pattern ***
	.pat0
	defb $bd,0
	defb 152
	defb 140
	defb 6
	defb 157
	defb 140
	defb 6
	defb 159
	defb 188
	defb 6
	defb 152
	defb 140
	defb 6
	defb 157
	defb 6
	defb 159
	defb 6
	defb 152
	defb 6
	defb 159
	defb 6
	defb 151
	defb 139
	defb 6
	defb 157
	defb 139
	defb 6
	defb 159
	defb 188
	defb 6
	defb 151
	defb 139
	defb 6
	defb 157
	defb 6
	defb 159
	defb 6
	defb 151
	defb 6
	defb 159
	defb 6
	defb $00
	.pat1
	defb $bd,0
	defb 150
	defb 138
	defb 6
	defb 157
	defb 138
	defb 6
	defb 159
	defb 188
	defb 6
	defb 150
	defb 138
	defb 6
	defb 157
	defb 6
	defb 159
	defb 6
	defb 150
	defb 6
	defb 159
	defb 6
	defb 149
	defb 137
	defb 6
	defb 159
	defb 137
	defb 6
	defb 157
	defb 188
	defb 6
	defb 149
	defb 137
	defb 6
	defb 159
	defb 6
	defb 157
	defb 145
	defb 6
	defb 149
	defb 6
	defb 159
	defb 6
	defb $00
	.pat2
	defb $bd,2
	defb 140
	defb 152
	defb 24
	defb 140
	defb 6
	defb 141
	defb 6
	defb 140
	defb 12
	defb 139
	defb 163
	defb 24
	defb 139
	defb 6
	defb 140
	defb 6
	defb 139
	defb 12
	defb $00
	.pat3
	defb 138
	defb 150
	defb 24
	defb 138
	defb 6
	defb 139
	defb 6
	defb 138
	defb 12
	defb 137
	defb 161
	defb 30
	defb 133
	defb 145
	defb 18
	defb $00
;	SECTION	text

.i_1
	defm	"MK1 V3.2"
	defb	0

	defm	"GAME OVER!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

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
._flags	defs	16
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._killed_old	defs	1
._thrusting	defs	1
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._sp_player	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
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
._hit	defs	1
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
	XDEF	_clr2d
	LIB	sp_MouseAMXInit
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sp_moviles
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
	XDEF	_gp_gen_org
	XDEF	_blackout
	LIB	sp_TileArray
	LIB	sp_MouseSim
	XDEF	_map_buff
	defc	_map_buff	=	23450
	LIB	sp_BlockFit
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
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
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
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	23606
	LIB	sp_RegisterHookLast
	LIB	sp_RemoveHook
	LIB	sp_IntLargeRect
	XDEF	_sprite_18_a
	LIB	sp_IntPtLargeRect
	LIB	sp_GetCharAddr
	LIB	sp_HashDelete
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_cm_two_points
	XDEF	_draw_and_advance
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_sp_player
	XDEF	_init_player
	XDEF	_gp_gen
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
	XDEF	_check_and_clear_cerrojo
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
	XDEF	_hit
	XDEF	_en_an_x
	defc	_en_an_x	=	23618
	XDEF	_player
	XDEF	_en_an_y
	defc	_en_an_y	=	23624
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
	XDEF	_pti
	XDEF	_comportamiento_tiles
	XDEF	_ptj
	LIB	sp_Initialize
	LIB	sp_SwapEndian
	LIB	sp_ComputePos
	LIB	sp_JoyTimexLeft
	LIB	sp_JoyTimexRight
	LIB	sp_SetMousePosKempston
	XDEF	_bitmask
	LIB	sp_CharDown
	LIB	sp_CharLeft
	LIB	sp_PixelRight
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	LIB	sp_HuffEncode
	XDEF	_draw_2_digits
	XDEF	_no_break
	XDEF	_tqt
	XDEF	_check_lock_or_box_horz
	XDEF	_tpx
	XDEF	_tpy
	XDEF	_init_player_values
	XDEF	_enoffsmasi
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
	XDEF	_any_key
	LIB	sp_PFill
	LIB	sp_HashRemove
	LIB	sp_CharUp
	XDEF	_orig_tile
	XDEF	_en_an_frame
	defc	_en_an_frame	=	23600
	XDEF	_success
	LIB	sp_MoveSprRelNC
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
