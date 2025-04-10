;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Apr 10 19:51:51 2025



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	4

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
;	SECTION	text

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pant_final
	defm	"c"
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
	ld	hl,0 % 256	;const
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
	defw 0

._ISR
	ld hl, _isrc
	inc (hl)
	ret



._system_init
	di
	ld sp, 61936
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
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,40 % 256	;const
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
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
	push	hl
	ld	hl,_sprite_2_a
	push	hl
	ld	hl,1 % 256	;const
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
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
	push	hl
	ld	hl,_sprite_9_a
	push	hl
	ld	hl,2 % 256	;const
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
	ld	hl,(__x)
	ld	h,0
	dec	hl
	ex	de,hl
	ld	l,#(1 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_prxx),a
	ld	a,(__y)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_pryy),a
	ld	hl,(_prxx)
	ld	h,0
	push	hl
	ld	hl,(_pryy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,4	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_20
	ld	a,(__t)
	ld	e,a
	ld	d,0
	ld	hl,16	;const
	call	l_ult
	jp	c,i_21
	ld	a,(__t)
	cp	#(19 % 256)
	jp	nz,i_20
.i_21
	jr	i_23_i_20
.i_20
	jp	i_19
.i_23_i_20
	ld	a,(__t)
	cp	#(19 % 256)
	jp	nz,i_24
	ld	a,#(140 % 256 % 256)
	ld	(__t),a
	ld	hl,192 % 256	;const
	ld	a,l
	ld	(_t_alt),a
	jp	i_25
.i_24
	ld	a,(__t)
	ld	e,a
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asl
	ld	de,64
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(__t),a
	ld	hl,(__t)
	ld	h,0
	ld	de,128
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_t_alt),a
.i_25
	ld	de,_tileset+2048
	ld	hl,(__t)
	ld	h,0
	add	hl,de
	ld	(_gp_gen_org),hl
	ld	de,_tileset+2048
	ld	hl,(_t_alt)
	ld	h,0
	add	hl,de
	ld	(_gp_gen_alt),hl
	ld	hl,(_prxx)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,(_pryy)
	ld	h,0
	dec	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,4	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_26
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen_alt)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_t_alt)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_27
.i_26
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen_org)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(__t)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_27
	ld	hl,(_prxx)
	ld	h,0
	push	hl
	ld	hl,(_pryy)
	ld	h,0
	dec	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,4	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_28
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gp_gen_alt)
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_t_alt)
	ld	h,0
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_29
.i_28
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gp_gen_org)
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(__t)
	ld	h,0
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_29
	ld	hl,(_prxx)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,(_pryy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,4	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_30
	ld	hl,(__y)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen_alt)
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_t_alt)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_31
.i_30
	ld	hl,(__y)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen_org)
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(__t)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_31
	ld	hl,(__y)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gp_gen_org)
	inc	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(__t)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_32
.i_19
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
.i_32
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
	ld	bc,i_34
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_34
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



._espera_activa
	call	_any_key
	ld	h,0
	ld	a,l
	ld	(_pti),a
.i_35
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_36
	halt
	call	_any_key
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	and	a
	jp	z,i_38
	ld	a,(_pti)
	cp	#(0 % 256)
	jr	z,i_39_i_38
.i_38
	jp	i_37
.i_39_i_38
	jp	i_36
.i_37
	ld	hl,(_ptj)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_35
.i_36
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
	; Music generated by beepola
	; call musicstart
.i_40
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_42
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_41
.i_42
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_44
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_41
.i_44
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_46
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_41
.i_46
.i_45
.i_43
	jp	i_40
.i_41
.i_47
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
	add hl, bc
	pop de
	ldi
	ldi
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
	._s_title
	BINARY "titlec.bin"
	._s_marco
	._s_ending
	BINARY "endingc.bin"

._title_screen
	call	_blackout
	ld hl, _s_title
	call _unpack_screen
	call	_select_controls
	ret



._game_ending
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_50
.i_48
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_50
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_49
	jp	nc,i_49
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	ld	hl,2 % 256	;const
	call	_peta_el_beeper
	jp	i_48
.i_49
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	ld	hl,500	;const
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
	call	_draw_rectangle
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	call	_beepet
	ld	hl,10	;const
	push	hl
	call	_play_sfx
	pop	bc
	ret


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

;	SECTION	text

.i_1
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
._en_cx	defs	1
._en_cy	defs	1
._flags	defs	16
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._killed_old	defs	1
._ezg_old	defs	1
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
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._joyfunc	defs	2
._gpcx	defs	2
._gpcy	defs	2
._rdt1	defs	1
._rdt2	defs	1
._gpit	defs	1
._playing	defs	1
._seed	defs	2
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._maincounter	defs	1
._rdmt	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._wall	defs	1
._hotspot_t_r	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	47
._jetpac_frame_counter	defs	1
._rda	defs	1
._gpx	defs	1
._rdi	defs	1
._rdj	defs	2
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._gpy	defs	1
._rdd	defs	1
._rdb	defs	1
._pti	defs	1
._ptj	defs	1
._enoffsmasi	defs	2
._asm_int	defs	2
._pant_just_rendered	defs	1
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
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
	XDEF	_can_move_box
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
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23651
	XDEF	_init_falling_box_buffer
	XDEF	_hotspot_t
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_half_life
	XDEF	__en_mx
	XDEF	__en_my
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_AddMemory
	LIB	sp_BlockCount
	XDEF	_en_cx
	XDEF	_en_cy
	XDEF	_en_an_state
	defc	_en_an_state	=	23645
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_gp_gen_alt
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
	XREF	_beepet
	XREF	_play_sfx
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
	LIB	sp_ClearRect
	XDEF	_ezg_old
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
	XDEF	_espera_activa
	LIB	sp_InitAlloc
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
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	XDEF	_fall_box
	LIB	sp_PrintAtDiff
	XDEF	_pant_final
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
	LIB	sp_IntPtLargeRect
	LIB	sp_GetCharAddr
	LIB	sp_HashDelete
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_sp_player
	XDEF	_gp_gen
	LIB	sp_GetTiles
	XDEF	_fix_sprites
	XDEF	_spritesClipValues
	XDEF	_on_pant
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_enoffs
	XDEF	_pad_this_frame
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
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
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_system_init
	XDEF	_draw_rectangle
	XDEF	_ISR
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_enit
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
	XREF	_attr
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
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_enems_calc_frame
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_isrc
	defc	_isrc	=	23296
	XDEF	_objs_old
	XDEF	_gpxx
	XDEF	_gpyy
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_rdmt
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_wall
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	LIB	sp_MoveSprAbsNC
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_hotspot_t_r
	XDEF	__x2
	XDEF	__y2
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	_step
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_u_free
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	LIB	sp_InstallISR
	XDEF	_item_old
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
	XDEF	_jetpac_frame_counter
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
	XDEF	_rdj
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
	XDEF	_gpy
	XDEF	_rdd
	XDEF	_tileset
	XDEF	_rdb
	XDEF	_pti
	XDEF	_comportamiento_tiles
	XDEF	_ptj
	XDEF	_move_tile
	XDEF	_init_player_values
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
	XDEF	_ay_counter
	defc	_ay_counter	=	23298
	XDEF	_draw_2_digits
	XDEF	_enoffsmasi
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	LIB	sp_inp
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_asm_int
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
	XDEF	_coins_old
	XDEF	_do_extern_action
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
