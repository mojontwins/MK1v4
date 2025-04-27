;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Sun Apr 27 16:06:22 2025



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb 2, 252
	defb 4, 248
	defb 0, 248
	defb 88, 160
	defb 160, 0
	defb 128, 0
	defb 128, 0
	defb 95, 128
	defb 48, 140
	defb 48, 136
	defb 5, 240
	defb 5, 240
	defb 102, 0
	defb 94, 0
	defb 64, 0
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_b
	defb 12, 3
	defb 2, 1
	defb 18, 1
	defb 42, 1
	defb 232, 1
	defb 120, 7
	defb 32, 7
	defb 176, 3
	defb 130, 1
	defb 6, 1
	defb 192, 15
	defb 248, 3
	defb 252, 1
	defb 6, 0
	defb 7, 240
	defb 0, 255
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
	defb 4, 248
	defb 8, 240
	defb 16, 224
	defb 16, 224
	defb 81, 128
	defb 145, 0
	defb 160, 0
	defb 134, 0
	defb 72, 128
	defb 16, 196
	defb 24, 192
	defb 27, 192
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_2_b
	defb 24, 7
	defb 4, 3
	defb 68, 3
	defb 176, 3
	defb 176, 7
	defb 240, 15
	defb 64, 15
	defb 224, 15
	defb 64, 7
	defb 16, 3
	defb 12, 1
	defb 44, 1
	defb 96, 15
	defb 96, 15
	defb 96, 15
	defb 176, 7
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
	defb 4, 248
	defb 8, 240
	defb 8, 240
	defb 18, 224
	defb 35, 192
	defb 64, 128
	defb 64, 128
	defb 33, 192
	defb 0, 228
	defb 0, 224
	defb 3, 240
	defb 7, 240
	defb 103, 0
	defb 94, 0
	defb 64, 33
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 8, 7
	defb 4, 3
	defb 226, 1
	defb 176, 3
	defb 180, 3
	defb 248, 7
	defb 32, 7
	defb 144, 9
	defb 198, 0
	defb 126, 0
	defb 0, 15
	defb 136, 3
	defb 28, 1
	defb 6, 0
	defb 7, 240
	defb 0, 255
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
	defb 4, 248
	defb 8, 240
	defb 8, 240
	defb 9, 240
	defb 104, 144
	defb 144, 0
	defb 131, 0
	defb 132, 0
	defb 104, 130
	defb 13, 224
	defb 13, 224
	defb 55, 128
	defb 47, 128
	defb 32, 144
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_4_b
	defb 8, 7
	defb 4, 3
	defb 226, 1
	defb 178, 1
	defb 178, 1
	defb 248, 1
	defb 32, 0
	defb 115, 0
	defb 7, 0
	defb 0, 0
	defb 12, 1
	defb 158, 0
	defb 182, 0
	defb 12, 65
	defb 16, 199
	defb 8, 227
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
	defb 16, 224
	defb 32, 192
	defb 71, 128
	defb 13, 192
	defb 45, 192
	defb 31, 224
	defb 4, 224
	defb 9, 144
	defb 99, 0
	defb 126, 0
	defb 0, 240
	defb 17, 192
	defb 56, 128
	defb 96, 0
	defb 224, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_5_b
	defb 32, 31
	defb 16, 15
	defb 16, 15
	defb 72, 7
	defb 196, 3
	defb 2, 1
	defb 2, 1
	defb 132, 3
	defb 0, 39
	defb 0, 7
	defb 192, 15
	defb 224, 15
	defb 230, 0
	defb 122, 0
	defb 2, 132
	defb 0, 255
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
	defb 24, 224
	defb 32, 192
	defb 34, 192
	defb 13, 192
	defb 13, 224
	defb 15, 240
	defb 2, 240
	defb 7, 240
	defb 2, 224
	defb 8, 192
	defb 48, 128
	defb 52, 128
	defb 6, 240
	defb 6, 240
	defb 6, 240
	defb 13, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_6_b
	defb 32, 31
	defb 16, 15
	defb 8, 7
	defb 8, 7
	defb 138, 1
	defb 137, 0
	defb 5, 0
	defb 97, 0
	defb 18, 1
	defb 8, 35
	defb 24, 3
	defb 216, 3
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 192, 31
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
	defb 48, 192
	defb 64, 128
	defb 72, 128
	defb 84, 128
	defb 23, 128
	defb 30, 224
	defb 4, 224
	defb 13, 192
	defb 65, 128
	defb 96, 128
	defb 3, 240
	defb 31, 192
	defb 63, 128
	defb 96, 0
	defb 224, 15
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_7_b
	defb 64, 63
	defb 32, 31
	defb 0, 31
	defb 26, 5
	defb 5, 0
	defb 1, 0
	defb 1, 0
	defb 250, 1
	defb 12, 49
	defb 12, 17
	defb 160, 15
	defb 160, 15
	defb 102, 0
	defb 122, 0
	defb 2, 0
	defb 0, 255
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
	defb 16, 224
	defb 32, 192
	defb 71, 128
	defb 77, 128
	defb 77, 128
	defb 31, 128
	defb 4, 0
	defb 206, 0
	defb 224, 0
	defb 0, 0
	defb 48, 128
	defb 121, 0
	defb 109, 0
	defb 48, 130
	defb 8, 227
	defb 16, 199
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
	defb 32, 31
	defb 16, 15
	defb 16, 15
	defb 144, 15
	defb 22, 9
	defb 9, 0
	defb 193, 0
	defb 33, 0
	defb 22, 65
	defb 176, 7
	defb 176, 7
	defb 236, 1
	defb 244, 1
	defb 4, 9
	defb 0, 255
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
	defb 1, 248
	defb 3, 24
	defb 66, 8
	defb 162, 0
	defb 34, 0
	defb 35, 0
	defb 27, 128
	defb 1, 192
	defb 0, 248
	defb 1, 248
	defb 0, 248
	defb 1, 224
	defb 12, 192
	defb 19, 192
	defb 16, 0
	defb 112, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_9_b
	defb 128, 31
	defb 192, 8
	defb 163, 0
	defb 165, 0
	defb 164, 0
	defb 229, 0
	defb 104, 0
	defb 32, 3
	defb 0, 7
	defb 240, 0
	defb 70, 0
	defb 234, 0
	defb 82, 0
	defb 227, 0
	defb 0, 8
	defb 0, 255
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
	defb 1, 248
	defb 3, 16
	defb 197, 0
	defb 165, 0
	defb 37, 0
	defb 167, 0
	defb 22, 0
	defb 4, 192
	defb 0, 224
	defb 15, 0
	defb 98, 0
	defb 87, 0
	defb 74, 0
	defb 199, 0
	defb 0, 16
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_10_b
	defb 128, 31
	defb 192, 24
	defb 66, 16
	defb 69, 0
	defb 68, 0
	defb 196, 0
	defb 216, 1
	defb 128, 3
	defb 0, 31
	defb 128, 31
	defb 0, 31
	defb 128, 7
	defb 48, 3
	defb 200, 3
	defb 8, 0
	defb 14, 224
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
	defb 1, 254
	defb 2, 252
	defb 20, 232
	defb 37, 192
	defb 37, 192
	defb 71, 128
	defb 66, 128
	defb 64, 128
	defb 64, 128
	defb 64, 128
	defb 76, 128
	defb 82, 140
	defb 34, 220
	defb 2, 252
	defb 4, 248
	defb 4, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_11_b
	defb 224, 31
	defb 16, 15
	defb 12, 3
	defb 74, 1
	defb 74, 1
	defb 201, 0
	defb 81, 0
	defb 33, 0
	defb 1, 0
	defb 1, 0
	defb 9, 0
	defb 21, 8
	defb 146, 13
	defb 208, 15
	defb 200, 7
	defb 200, 7
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
	defb 3, 252
	defb 4, 248
	defb 8, 240
	defb 10, 240
	defb 42, 208
	defb 87, 128
	defb 68, 128
	defb 64, 128
	defb 64, 128
	defb 64, 128
	defb 68, 128
	defb 66, 140
	defb 34, 204
	defb 34, 204
	defb 20, 232
	defb 4, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_12_b
	defb 192, 63
	defb 32, 31
	defb 16, 15
	defb 144, 15
	defb 146, 13
	defb 149, 8
	defb 145, 0
	defb 33, 0
	defb 1, 0
	defb 1, 0
	defb 9, 0
	defb 17, 8
	defb 162, 25
	defb 162, 25
	defb 148, 11
	defb 144, 15
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
	defb 15, 192
	defb 25, 128
	defb 54, 128
	defb 51, 128
	defb 54, 128
	defb 25, 128
	defb 15, 192
	defb 0, 128
	defb 53, 0
	defb 77, 0
	defb 65, 0
	defb 33, 8
	defb 2, 128
	defb 4, 240
	defb 2, 240
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
	defb 240, 3
	defb 56, 1
	defb 220, 1
	defb 92, 1
	defb 216, 1
	defb 56, 1
	defb 240, 3
	defb 0, 1
	defb 72, 1
	defb 36, 1
	defb 36, 1
	defb 24, 1
	defb 0, 67
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
	defb 15, 192
	defb 25, 128
	defb 54, 128
	defb 51, 128
	defb 54, 128
	defb 25, 128
	defb 15, 192
	defb 0, 192
	defb 5, 224
	defb 9, 224
	defb 9, 224
	defb 9, 224
	defb 5, 224
	defb 5, 224
	defb 9, 224
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_14_b
	defb 240, 3
	defb 56, 1
	defb 220, 1
	defb 92, 1
	defb 216, 1
	defb 56, 1
	defb 240, 3
	defb 0, 7
	defb 64, 15
	defb 32, 15
	defb 32, 15
	defb 64, 15
	defb 64, 15
	defb 64, 15
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
	defb 255, 0
	defb 255, 0
	defb 170, 0
	defb 0, 0
	defb 7, 224
	defb 7, 224
	defb 0, 240
	defb 3, 240
	defb 3, 240
	defb 0, 224
	defb 3, 224
	defb 4, 224
	defb 4, 224
	defb 2, 224
	defb 1, 240
	defb 0, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_15_b
	defb 255, 0
	defb 255, 0
	defb 171, 0
	defb 0, 0
	defb 224, 7
	defb 224, 7
	defb 0, 15
	defb 192, 15
	defb 192, 15
	defb 0, 7
	defb 192, 7
	defb 32, 7
	defb 32, 7
	defb 64, 7
	defb 0, 15
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
	defb 255, 0
	defb 255, 0
	defb 170, 0
	defb 0, 0
	defb 7, 224
	defb 7, 224
	defb 0, 240
	defb 3, 240
	defb 3, 240
	defb 0, 240
	defb 1, 248
	defb 1, 248
	defb 0, 248
	defb 0, 252
	defb 0, 255
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
	defb 255, 0
	defb 255, 0
	defb 171, 0
	defb 0, 0
	defb 224, 7
	defb 224, 7
	defb 0, 15
	defb 192, 15
	defb 192, 15
	defb 0, 15
	defb 128, 31
	defb 0, 31
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
	defb	3
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 3, 3 + 20, 1, 1 + 30
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
	ld	hl,(__x)
	ld	h,0
	dec	hl
	ex	de,hl
	ld	l,#(1 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_prxx),a
	ld	hl,(__y)
	ld	h,0
	dec	hl
	dec	hl
	dec	hl
	ex	de,hl
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
	jp	nc,i_21
	ld	a,(__t)
	ld	e,a
	ld	d,0
	ld	hl,16	;const
	call	l_ult
	jp	c,i_22
	ld	a,(__t)
	cp	#(19 % 256)
	jp	nz,i_21
.i_22
	jr	i_24_i_21
.i_21
	jp	i_20
.i_24_i_21
	ld	a,(__t)
	cp	#(19 % 256)
	jp	nz,i_25
	ld	a,#(140 % 256 % 256)
	ld	(__t),a
	ld	hl,192 % 256	;const
	ld	a,l
	ld	(_t_alt),a
	jp	i_26
.i_25
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
.i_26
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
	jp	nc,i_27
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
	jp	i_28
.i_27
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
.i_28
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
	jp	nc,i_29
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
	jp	i_30
.i_29
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
.i_30
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
	jp	nc,i_31
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
	jp	i_32
.i_31
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
.i_32
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
	jp	i_33
.i_20
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
.i_33
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
	add 3
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
	.draw_line_of_text
	;; Entry point called from msc4i
	;; HL should point to string.
	ld a, 4
	ld (__t), a
	ld (__x), a
	ld a, 23
	ld (__y), a
	ld a, 71
	ld (__n), a
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
	ld	bc,i_35
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_35
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
.i_36
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_37
	halt
	call	_any_key
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	and	a
	jp	z,i_39
	ld	a,(_pti)
	cp	#(0 % 256)
	jr	z,i_40_i_39
.i_39
	jp	i_38
.i_40_i_39
	jp	i_37
.i_38
	ld	hl,(_ptj)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_36
.i_37
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
.i_41
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_43
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_42
.i_43
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_45
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_42
.i_45
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_47
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_42
.i_47
.i_46
.i_44
	jp	i_41
.i_42
.i_48
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
	add 3
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
	jp	i_51
.i_49
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_51
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_50
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
	jp	i_49
.i_50
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
	add 3
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



._do_extern_action
	ret



._script
	ld a, l
	ld (_script_n), a
	jp _script_do
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
;	SECTION	text

._mapa
	defm	"R0"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	" "
	defb	221

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"]"
	defb	210

	defm	" "
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"b"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	" "
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"&"
	defb	0

	defm	"X"
	defb	144

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"D"
	defb	136

	defm	"HD"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"%"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"R "
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	210

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"'"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ww"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDD@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	3

	defm	""
	defb	7

	defm	"w"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	151

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	9

	defm	""
	defb	144

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
	defb	34

	defm	""
	defb	34

	defm	" p0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	153

	defm	"f"
	defb	153

	defm	"f`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"`"
	defb	0

	defm	""
	defb	153

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"`"
	defb	144

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"h"
	defb	136

	defm	"ff "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	146

	defm	")fff"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"R"
	defb	0

	defm	""
	defb	0

	defm	"DDDDE"
	defb	221

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S"
	defb	13

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	181

	defm	"0"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S "
	defb	0

	defm	""
	defb	221

	defm	""
	defb	204

	defm	""
	defb	205

	defm	""
	defb	221

	defm	""
	defb	213

	defm	"2"
	defb	34

	defm	"!"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"!"
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"-"
	defb	221

	defm	""
	defb	220

	defm	""
	defb	205

	defm	""
	defb	221

	defm	"DDDE"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	165

	defm	"wp"
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	221

	defm	""
	defb	204

	defm	""
	defb	218

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"*"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	213

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"*"
	defb	186

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	"w"
	defb	34

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"-"
	defb	204

	defm	""
	defb	141

	defm	""
	defb	170

	defm	"P"
	defb	7

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	7

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"s"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	2

	defm	" 7"
	defb	0

	defm	""
	defb	2

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	7

	defm	"w"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	3

	defm	""
	defb	7

	defm	"w"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	"b2 "
	defb	0

	defm	""
	defb	6

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	34

	defm	""
	defb	150

	defm	"ffh"
	defb	136

	defm	""
	defb	136

	defm	"b)"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"f"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"`"
	defb	9

	defm	""
	defb	9

	defm	"`"
	defb	6

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"`"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"i"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"gw"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	"f"
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"iffR"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	213

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
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
	defb	5

	defm	""
	defb	0

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	"`P"
	defb	3

	defm	" @"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	2

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	3

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	"@"
	defb	9

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	4

	defm	""
	defb	17

	defm	""
	defb	129

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	209

	defm	""
	defb	25

	defm	""
	defb	34

	defm	"r"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"r"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"p"
	defb	8

	defm	""
	defb	144

	defm	""
	defb	8

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	34

	defm	"#p"
	defb	0

	defm	""
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

	defm	""
	defb	0

	defm	""
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
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"@"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`0"
	defb	0

	defm	"b0"
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	2

	defm	"`0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	")"
	defb	3

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"`0"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	34

	defm	"'ww"
	defb	144

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	3

	defm	""
	defb	7

	defm	"p"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"`7"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"&h"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	150

	defm	""
	defb	150

	defm	""
	defb	153

	defm	"f"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	134

	defm	""
	defb	152

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"i"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"i"
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	156

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	"i"
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"l"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"fffff"
	defb	136

	defm	""
	defb	134

	defm	"fR "
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	"H"
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	"DJ"
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"H"
	defb	138

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"E "
	defb	0

	defm	""
	defb	4

	defm	""
	defb	139

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"R"
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	4

	defm	"DL"
	defb	196

	defm	"D"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"@"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	169

	defm	"B#"
	defb	34

	defm	""
	defb	0

	defm	"DDD"
	defb	137

	defm	""
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	10

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	136

	defm	""
	defb	146

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	132

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"*"
	defb	186

	defm	""
	defb	186

	defm	""
	defb	186

	defm	"B"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"ww"
	defb	0

	defm	""
	defb	4

	defm	"DD"
	defb	170

	defm	"B "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"`2 "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"6ww"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"b"
	defb	34

	defm	"'"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"6"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"`"
	defb	0

	defm	"0w"
	defb	12

	defm	""
	defb	7

	defm	"p9"
	defb	12

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
	defb	3

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	153

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
	defb	7

	defm	"w`"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	")f"
	defb	153

	defm	""
	defb	150

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	150

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	150

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"i"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	140

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"f"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	200

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"fhif"
	defb	136

	defm	""
	defb	134

	defm	"f"
	defb	150

	defm	"R"
	defb	34

	defm	" DDDDE"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"DA"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	197

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	202

	defm	""
	defb	202

	defm	"]"
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	202

	defm	""
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	4

	defm	"DDDDDDJ"
	defb	164

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"B "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	202

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	12

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	202

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	"DDDB"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	7

	defm	"w"
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"bwr "
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	2

	defm	"#"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	144

	defm	""
	defb	2

	defm	"2w"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	"6"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	6

	defm	"0"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	"c"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"f"
	defb	153

	defm	"f"
	defb	34

	defm	"f"
	defb	134

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	153

	defm	"ff"
	defb	152

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	150

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"f"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"f"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	144

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	146

	defm	""
	defb	34

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"R"
	defb	34

	defm	" DDDDE"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	181

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"DDDDE"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"m"
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	176

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	"gwwwwwwy"
	defb	153

	defm	""
	defb	153

	defm	"DDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	165

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	""
	defb	161

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	165

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	16

	defm	""
	defb	7

	defm	"wwDDDD@"
	defb	0

	defm	""
	defb	0

	defm	"*"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	161

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	16

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	"wwwwwv"
	defb	0

	defm	""
	defb	9

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
	defb	151

	defm	"w"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	153

	defm	""
	defb	153

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	137

	defm	"f"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	151

	defm	"r"
	defb	34

	defm	")"
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"i"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	130

	defm	""
	defb	34

	defm	"&"
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"h"
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	135

	defm	"wwwwwww"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"f"
	defb	34

	defm	" "
	defb	6

	defm	""
	defb	6

	defm	"f"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	146

	defm	" "
	defb	6

	defm	""
	defb	150

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	134

	defm	"h"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	134

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"f"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"fgwwwwwww"
;	SECTION	code


;	SECTION	text

._malotes
	defb	192
	defb	64
	defb	192
	defb	16
	defb	192
	defb	64
	defb	0
	defb	-1
	defb	4
	defb	96
	defb	48
	defb	96
	defb	48
	defb	96
	defb	80
	defb	0
	defb	1
	defb	1
	defb	144
	defb	0
	defb	144
	defb	0
	defb	176
	defb	48
	defb	2
	defb	2
	defb	2
	defb	80
	defb	80
	defb	80
	defb	16
	defb	80
	defb	80
	defb	0
	defb	-1
	defb	2
	defb	48
	defb	96
	defb	48
	defb	16
	defb	48
	defb	96
	defb	0
	defb	-2
	defb	3
	defb	160
	defb	112
	defb	160
	defb	32
	defb	160
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	16
	defb	112
	defb	16
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	1
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	96
	defb	0
	defb	1
	defb	1
	defb	80
	defb	80
	defb	80
	defb	80
	defb	112
	defb	80
	defb	1
	defb	0
	defb	2
	defb	80
	defb	32
	defb	48
	defb	32
	defb	80
	defb	32
	defb	-1
	defb	0
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	208
	defb	80
	defb	2
	defb	2
	defb	2
	defb	208
	defb	96
	defb	112
	defb	96
	defb	208
	defb	96
	defb	-1
	defb	0
	defb	4
	defb	96
	defb	48
	defb	96
	defb	48
	defb	208
	defb	48
	defb	1
	defb	0
	defb	2
	defb	144
	defb	128
	defb	96
	defb	128
	defb	144
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	96
	defb	112
	defb	96
	defb	112
	defb	128
	defb	112
	defb	1
	defb	0
	defb	3
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	1
	defb	3
	defb	160
	defb	48
	defb	160
	defb	48
	defb	160
	defb	128
	defb	0
	defb	1
	defb	2
	defb	64
	defb	48
	defb	16
	defb	48
	defb	64
	defb	48
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	128
	defb	16
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	128
	defb	64
	defb	96
	defb	64
	defb	128
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	112
	defb	0
	defb	2
	defb	3
	defb	96
	defb	128
	defb	96
	defb	32
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	144
	defb	48
	defb	144
	defb	48
	defb	192
	defb	64
	defb	1
	defb	1
	defb	2
	defb	208
	defb	128
	defb	176
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	208
	defb	32
	defb	1
	defb	0
	defb	2
	defb	112
	defb	48
	defb	112
	defb	48
	defb	208
	defb	96
	defb	1
	defb	1
	defb	2
	defb	176
	defb	48
	defb	176
	defb	48
	defb	176
	defb	112
	defb	0
	defb	1
	defb	0
	defb	64
	defb	128
	defb	64
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	4
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	128
	defb	0
	defb	2
	defb	2
	defb	80
	defb	96
	defb	80
	defb	96
	defb	208
	defb	112
	defb	2
	defb	2
	defb	3
	defb	208
	defb	80
	defb	144
	defb	48
	defb	208
	defb	80
	defb	-1
	defb	-1
	defb	3
	defb	128
	defb	80
	defb	96
	defb	32
	defb	128
	defb	80
	defb	-1
	defb	-1
	defb	2
	defb	64
	defb	112
	defb	64
	defb	48
	defb	64
	defb	112
	defb	0
	defb	-1
	defb	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	192
	defb	48
	defb	2
	defb	0
	defb	2
	defb	192
	defb	80
	defb	64
	defb	80
	defb	192
	defb	80
	defb	-1
	defb	0
	defb	3
	defb	80
	defb	112
	defb	80
	defb	112
	defb	208
	defb	112
	defb	1
	defb	0
	defb	1
	defb	192
	defb	128
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	144
	defb	128
	defb	112
	defb	64
	defb	144
	defb	128
	defb	-2
	defb	-2
	defb	2
	defb	160
	defb	48
	defb	160
	defb	48
	defb	192
	defb	48
	defb	1
	defb	0
	defb	1
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	48
	defb	2
	defb	0
	defb	1
	defb	96
	defb	16
	defb	48
	defb	16
	defb	96
	defb	16
	defb	-1
	defb	0
	defb	2
	defb	176
	defb	112
	defb	128
	defb	112
	defb	176
	defb	112
	defb	-2
	defb	0
	defb	3
	defb	192
	defb	80
	defb	192
	defb	80
	defb	192
	defb	112
	defb	0
	defb	1
	defb	1
	defb	32
	defb	16
	defb	32
	defb	16
	defb	144
	defb	16
	defb	1
	defb	0
	defb	2
	defb	160
	defb	64
	defb	80
	defb	64
	defb	160
	defb	64
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	80
	defb	32
	defb	32
	defb	64
	defb	80
	defb	-1
	defb	-1
	defb	3
	defb	64
	defb	16
	defb	32
	defb	16
	defb	64
	defb	128
	defb	-1
	defb	1
	defb	2
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	128
	defb	0
	defb	2
	defb	3
	defb	16
	defb	16
	defb	16
	defb	16
	defb	144
	defb	80
	defb	2
	defb	2
	defb	2
	defb	80
	defb	96
	defb	16
	defb	96
	defb	80
	defb	96
	defb	-2
	defb	0
	defb	3
	defb	176
	defb	128
	defb	96
	defb	128
	defb	176
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	96
	defb	128
	defb	96
	defb	16
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	64
	defb	128
	defb	64
	defb	64
	defb	64
	defb	128
	defb	0
	defb	-2
	defb	2
	defb	32
	defb	16
	defb	32
	defb	16
	defb	80
	defb	128
	defb	2
	defb	2
	defb	3
	defb	64
	defb	96
	defb	64
	defb	32
	defb	64
	defb	96
	defb	0
	defb	-1
	defb	2
	defb	112
	defb	32
	defb	112
	defb	32
	defb	128
	defb	128
	defb	2
	defb	2
	defb	2
	defb	144
	defb	16
	defb	144
	defb	16
	defb	208
	defb	64
	defb	2
	defb	2
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	96
	defb	80
	defb	2
	defb	2
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	96
	defb	0
	defb	2
	defb	4
	defb	48
	defb	96
	defb	48
	defb	96
	defb	208
	defb	128
	defb	1
	defb	1
	defb	2
	defb	208
	defb	48
	defb	96
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	-1
	defb	4
	defb	208
	defb	112
	defb	160
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	80
	defb	48
	defb	1
	defb	1
	defb	3
	defb	144
	defb	96
	defb	144
	defb	32
	defb	144
	defb	96
	defb	0
	defb	-2
	defb	1
	defb	112
	defb	112
	defb	48
	defb	112
	defb	112
	defb	112
	defb	-2
	defb	0
	defb	2
	defb	128
	defb	48
	defb	128
	defb	48
	defb	128
	defb	128
	defb	0
	defb	1
	defb	1
	defb	160
	defb	16
	defb	160
	defb	16
	defb	192
	defb	128
	defb	2
	defb	2
	defb	2
	defb	32
	defb	48
	defb	32
	defb	48
	defb	32
	defb	128
	defb	0
	defb	2
	defb	4
	defb	208
	defb	64
	defb	128
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	2
	defb	48
	defb	96
	defb	48
	defb	96
	defb	192
	defb	112
	defb	1
	defb	1
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	64
	defb	32
	defb	1
	defb	0
	defb	1

;	SECTION	code

;	SECTION	text

._hotspots
	defb	0
	defb	0
	defb	0
	defb	88
	defb	3
	defb	0
	defb	211
	defb	3
	defb	0
	defb	52
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
	defb	82
	defb	3
	defb	0
	defb	98
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
	defb	151
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
	defb	51
	defb	3
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



._init_malotes
	ld bc, 72
	ld de, 9
	ld ix, _malotes
	.init_malotes_loop
	ld a, (ix+8)
	and 127
	ld (ix+8), a
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



._move_tile_with_check
	ld a, (_x1)
	ld c, a
	ld a, (_y1)
	call _attr_enems
	xor a
	or l
	ret nz
	ld	hl,(_x0)
	ld	h,0
	push	hl
	ld	hl,(_y0)
	ld	h,0
	push	hl
	ld	hl,0	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_x1)
	ld	h,0
	push	hl
	ld	hl,(_y1)
	ld	h,0
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,2	;const
	call	_peta_el_beeper
	ret



._cm_two_points
	ld a, (__x)
	cp 15
	jr nc, _cm_two_points_at1_reset
	ld a, (__y)
	cp 10
	jr c, _cm_two_points_at1_do
	._cm_two_points_at1_reset
	xor a
	jr _cm_two_points_at1_done
	._cm_two_points_at1_do
	ld a, (__y)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (__x)
	add b
	ld e, a
	ld d, 0
	ld hl, _map_attr
	add hl, de
	ld a, (hl)
	._cm_two_points_at1_done
	ld (_at1), a
	ld a, (__x2)
	cp 15
	jr nc, _cm_two_points_at2_reset
	ld a, (__y2)
	cp 10
	jr c, _cm_two_points_at2_do
	._cm_two_points_at2_reset
	xor a
	jr _cm_two_points_at2_done
	._cm_two_points_at2_do
	ld a, (__y2)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (__x2)
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
	ld	hl,(__x)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_rda),a
	cp	#(14 % 256)
	jp	nz,i_56
	ld	hl,(_rdx)
	ld	h,0
	ld	a,l
	ld	(_x0),a
	ld	hl,(_rdy)
	ld	h,0
	ld	a,l
	ld	(_y1),a
	ld	h,0
	ld	a,l
	ld	(_y0),a
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_57
	or	l
	jp	z,i_57
	ld	hl,(_x0)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
	jp	i_58
.i_57
	ld	hl,(_x0)
	ld	h,0
	dec	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
.i_58
	call	_move_tile_with_check
.i_56
	ret



._check_lock_or_box_vert
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,(__y)
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ret



._move
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hit),a
	call	_pad_read
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	ld	bc,32
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+8)
	ld	de,512	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_59
	ld	hl,512	;const
	ld	(_player+8),hl
.i_59
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(128 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_61
	inc	hl
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_61
	ld	a,(_player+26)
	and	a
	jp	nz,i_62
	ld	a,(_player+25)
	and	a
	jp	z,i_61
.i_62
	jr	i_64_i_61
.i_61
	jp	i_60
.i_64_i_61
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,3	;const
	call	_peta_el_beeper
.i_60
	ld	hl,_pad0
	ld	a,(hl)
	rlca
	jp	c,i_65
	ld	a,(_player+19)
	and	a
	jp	z,i_66
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	a,(_player+14)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	ld	de,184
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player+8)
	ld	de,65280	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_67
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_67
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_68
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_68
.i_66
	jp	i_69
.i_65
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
.i_69
	ld	hl,_player+1+1
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,(_player+8)
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player+1+1)
	xor	a
	or	h
	jp	p,i_70
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_70
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_71
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_71
	ld hl, (_player + 2)
	call HLshr6_A
	ld (_gpy), A
	ld	de,(_player+8)
	ld	hl,(_ptgmy)
	add	hl,de
	ld	(_pvy_total),hl
	ld	a,h
	or	l
	jp	z,i_72
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	hl,(_pvy_total)
	xor	a
	or	h
	jp	m,i_73
	or	l
	jp	z,i_73
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_75
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	z,i_74
.i_75
	ld	hl,0	;const
	ld	(_player+8),hl
	ld a, (_gpy)
	and 0xf0
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	ld	hl,_player+26
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_74
	jp	i_77
.i_73
	ld	hl,(_pvy_total)
	xor	a
	or	h
	jp	p,i_78
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_80
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_79
.i_80
	ld	hl,0	;const
	ld	(_player+8),hl
	ld a, (_gpy)
	and 0xf0
	add 12
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
.i_79
.i_78
.i_77
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_83
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_82
.i_83
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit),a
.i_82
.i_72
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_player+26
	push	hl
	ld	hl,_at1
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_85
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_85
	ld	hl,0	;const
	jr	i_86
.i_85
	ld	hl,1	;const
.i_86
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	z,i_88
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jr	nz,i_89_i_88
.i_88
	jp	i_87
.i_89_i_88
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_90
	or	l
	jp	z,i_90
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,-64
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_91
	ld	hl,0	;const
	ld	(_player+6),hl
.i_91
	jp	i_92
.i_90
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_93
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,64
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_94
	or	l
	jp	z,i_94
	ld	hl,0	;const
	ld	(_player+6),hl
.i_94
.i_93
.i_92
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_thrusting),a
	jp	i_95
.i_87
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_96
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,-48
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_97
	ld	hl,65280	;const
	ld	(_player+6),hl
.i_97
	ld	hl,_player+22
	ld	(hl),#(4 % 256 % 256)
.i_96
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_98
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,48
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_99
	ld	hl,256	;const
	ld	(_player+6),hl
.i_99
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
.i_98
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_thrusting),a
.i_95
	ld	hl,_player
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,(_player+6)
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_player
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,(_ptgmx)
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player)
	xor	a
	or	h
	jp	p,i_100
	ld	hl,0	;const
	ld	(_player),hl
.i_100
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_101
	ld	hl,14336	;const
	ld	(_player),hl
.i_101
	ld hl, (_player)
	call HLshr6_A
	ld (_gpx), A
	ld	de,(_player+6)
	ld	hl,(_ptgmx)
	add	hl,de
	ld	(_pvx_total),hl
	ld	a,h
	or	l
	jp	z,i_102
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	hl,(_pvx_total)
	xor	a
	or	h
	jp	m,i_103
	or	l
	jp	z,i_103
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,12
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_105
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_104
.i_105
	call	_check_lock_or_box_horz
	ld	hl,0	;const
	ld	(_player+6),hl
	ld a, (_gpx)
	and 0xf0
	add 4
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), HL
.i_104
	jp	i_107
.i_103
	ld	hl,(_pvx_total)
	xor	a
	or	h
	jp	p,i_108
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_110
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_109
.i_110
	call	_check_lock_or_box_horz
	ld	hl,0	;const
	ld	(_player+6),hl
	ld a, (_gpx)
	and 0xf0
	add 12
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), HL
.i_109
.i_108
.i_107
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_113
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_112
.i_113
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	de,_player+8
	ld	hl,(_pvy_total)
	call	l_pint
.i_112
.i_102
	ld	hl,(_pvx_total)
	call	_abs
	push	hl
	ld	hl,(_pvy_total)
	call	_abs
	pop	de
	call	l_gt
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	a,(_hit)
	and	a
	jp	z,i_115
	ld	a,(_rdi)
	and	a
	jp	z,i_116
	ld	hl,_player+6
	push	hl
	ld	hl,(_pvx_total)
	call	l_neg
	pop	de
	call	l_pint
	jp	i_117
.i_116
	ld	hl,_player+8
	push	hl
	ld	hl,(_pvy_total)
	call	l_neg
	pop	de
	call	l_pint
.i_117
	ld	hl,2	;const
	call	_peta_el_beeper
	ld	hl,_player+46
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_115
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
	and 128
	jr z, nospecial
	ld (_tat), a
	ld a, (_tpx)
	ld c, a
	ld a, (_tpy)
	call qtile_do
	ld a, l
	ld (_tqt), a
	ld hl, 5
	call _script
	.nospecial
	ld	a,(_player+26)
	and	a
	jp	nz,i_119
	ld	a,(_player+25)
	and	a
	jp	nz,i_119
	ld	hl,0	;const
	jr	i_120
.i_119
	ld	hl,1	;const
.i_120
	call	l_lneg
	jp	nc,i_118
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_121
.i_118
	ld	a,(_thrusting)
	and	a
	jp	z,i_122
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	push	hl
	ld	hl,_player_walk_cycle
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1	;const
	ex	de,hl
	call	l_and
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_123
.i_122
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
.i_123
.i_121
	ld	hl,_player+17
	push	hl
	ld	hl,_player_cells
	push	hl
	ld	hl,(_player+20)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
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
	ld (_player+6), hl
	ld (_player+8), hl
	xor a
	ld (_player+19),a
	ld (_player+20),a
	ld (_player+21),a
	ld (_player+23), a
	ld (_player+24),a
	ld (_player+36),a
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 20
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 4 * 6
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
	add 3
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
	add 3
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
	call no_alt_bg_subst
	ld (__n), a
	call _draw_and_advance
	ld a, (_rdt2)
	call no_alt_bg_subst
	ld (__n), a
	call _draw_and_advance
	ld a, (_gpit)
	inc a
	ld (_gpit), a
	cp 75
	jr nz, draw_scr_bg_loop
	jr draw_scr_bg_loop_end
	.no_alt_bg_subst
	ld c, a
	call _rand
	ld a, l
	and 15
	cp 2
	jr nc, draw_scr_alt_no
	ld a, c
	or a
	ret nz
	ld a, 16 + 3
	ret
	.draw_scr_alt_no
	ld a, c
	ret
	.draw_scr_bg_loop_end
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
	jp	i_126
.i_124
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_126
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_125
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
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,(__en_t)
	ld	h,0
.i_129
	ld	a,l
	cp	#(1% 256)
	jp	z,i_130
	cp	#(2% 256)
	jp	z,i_131
	cp	#(3% 256)
	jp	z,i_132
	cp	#(4% 256)
	jp	z,i_133
	jp	i_134
.i_130
.i_131
.i_132
.i_133
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_128
.i_134
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
.i_128
	jp	i_124
.i_125
	ld	hl,1	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,8
	add	hl,de
	call	_script
	ret



._platform_get_player
	ld a, 1
	ld (_player+25), a
	ld a, (__en_y)
	sub 16
	ld (_gpy), a
	call Ashl16_HL
	ld (_player+2), hl
	ld hl, 0
	ld (_player+8), hl
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
	ld	hl,_sprite_17_a
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
	jp	z,i_135
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
	jp	i_136
.i_135
	ld	hl,1	;const
	call	_peta_el_beeper
.i_136
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
	jp	i_139
.i_137
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_139
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_138
	jp	nc,i_138
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,__en_t
	ld	a,(hl)
	rlca
	jp	nc,i_140
	ld	l,a
	ld	h,0
	jp	i_141
.i_140
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_142
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
	jp	nc,i_143
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
	._en_bg_collision_horz
	ld a, (__en_mx)
	or a
	jr z, _en_bg_collision_horz_done
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
	jr z, _en_bg_collision_horz_done
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
	ld a, (__en_mx)
	neg
	ld (__en_mx), a
	._en_bg_collision_horz_done
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
	._en_bg_collision_vert
	ld a, (__en_my)
	or a
	jr z, _en_bg_collision_vert_done
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
	or a
	jr z, _en_bg_collision_vert_done
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
	ld a, (__en_my)
	neg
	ld (__en_my), a
	._en_bg_collision_vert_done
	.en_linear_done
.i_143
	call	_enems_calc_frame
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_145
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_145
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_146_i_145
.i_145
	jp	i_144
.i_146_i_145
	.moving_platforms
	ld a, (_player+19)
	or a
	jr z, moving_platforms_do
	ld a, (_player+14)
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
	ld a, (_player+9)
	bit 7, a
	jr nz, moving_platforms_done
	call _platform_get_player
	ld a, (__en_mx)
	call Ashl16_HL
	call withSign
	ld (_ptgmx), hl
	.moving_platforms_done
	jp	i_147
.i_144
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_149
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_149
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_149
	jr	c,i_150_i_149
.i_149
	jp	i_148
.i_150_i_149
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_152
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_153_i_152
.i_152
	jp	i_151
.i_153_i_152
	ld	hl,_player+8
	ld	(hl),#(65280 % 256)
	inc	hl
	ld	(hl),#(65280 / 256)
	ld	hl,255	;const
	push	hl
	call	_enems_kill
	pop	bc
	jp	i_154
.i_151
	ld	a,(_player+23)
	and	a
	jp	nz,i_155
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
	ld	hl,__en_mx
	call	l_gchar
	xor	a
	or	h
	jp	m,i_156
	or	l
	jp	z,i_156
	ld	hl,512	;const
	ld	(_player+6),hl
.i_156
	ld	hl,__en_mx
	call	l_gchar
	xor	a
	or	h
	jp	p,i_157
	ld	hl,65024	;const
	ld	(_player+6),hl
.i_157
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_158
	or	l
	jp	z,i_158
	ld	hl,512	;const
	ld	(_player+8),hl
.i_158
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_159
	ld	hl,65024	;const
	ld	(_player+8),hl
.i_159
.i_155
.i_154
.i_148
.i_147
.i_142
.i_141
.i_160
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_137
.i_138
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
	ld	hl,13	;const
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
	jp	i_163
.i_161
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_163
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_162
	jp	nc,i_162
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_161
.i_162
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
.i_164
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
	ld	a,#(20 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	a,#(0 % 256 % 256)
	ld	(_script_result),a
	ld	hl,0	;const
	call	_script
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_half_life),a
	ld a, 255
	ld (_objs_old), a
	ld (_life_old), a
	ld (_keys_old), a
	ld (_killed_old), a
	ld (_flag_old), a
	ld (_on_pant), a
.i_166
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_167
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
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_168
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_169
	or	l
	jp	z,i_169
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_170
.i_169
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_170
	ld	hl,4	;const
	push	hl
	ld	hl,1	;const
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
.i_168
	ld	hl,(_player+32)
	ld	h,0
	ex	de,hl
	ld	hl,(_killed_old)
	ld	h,0
	call	l_ne
	jp	nc,i_171
	ld	hl,16	;const
	push	hl
	ld	hl,1	;const
	push	hl
	ld	hl,(_player+32)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+32)
	ld	h,0
	ld	a,l
	ld	(_killed_old),a
.i_171
	ld	hl,(_flags)
	ld	h,0
	ex	de,hl
	ld	hl,(_flag_old)
	ld	h,0
	call	l_ne
	jp	nc,i_172
	ld	hl,7	;const
	push	hl
	ld	hl,0	;const
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
.i_172
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
	jp	z,i_173
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_176
	ld	a,l
	cp	#(3% 256)
	jp	nz,i_175
.i_177
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
	jp	nc,i_178
	ld	hl,99	;const
	ld	(_player+29),hl
.i_178
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_175
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_179
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
	ld	de,3
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
.i_179
.i_173
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
	jp	nz,i_180
	ld	hl,2	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,9
	add	hl,de
	call	_script
.i_180
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_182
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_183_i_182
.i_182
	jp	i_181
.i_183_i_182
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_184
.i_181
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_186
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_187_i_186
.i_186
	jp	i_185
.i_187_i_186
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_185
.i_184
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_189
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_189
	ld	a,(_n_pant)
	cp	#(4 % 256)
	jr	z,i_189_uge
	jp	c,i_189
.i_189_uge
	jr	i_190_i_189
.i_189
	jp	i_188
.i_190_i_189
	ld a, (_n_pant)
	sub 4
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_191
.i_188
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_193
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_194_i_193
.i_193
	jp	i_192
.i_194_i_193
	ld a, (_n_pant)
	add 4
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_192
.i_191
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_195
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_195
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_196
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
.i_196
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_198
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_197
.i_198
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_197
	xor a
	ld (_pant_just_rendered), a
	jp	i_166
.i_167
	jp	i_164
.i_165
	ret


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
._a1	defs	1
._a2	defs	1
._a3	defs	1
._a4	defs	1
._t_alt	defs	1
._t1	defs	1
._t2	defs	1
._t3	defs	1
._t4	defs	1
._x0	defs	1
._x1	defs	1
._y0	defs	1
._y1	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._xx	defs	1
._yy	defs	1
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
._gpcx	defs	2
._gpcy	defs	2
._joyfunc	defs	2
._rdt1	defs	1
._rdt2	defs	1
._gpit	defs	1
._playing	defs	1
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
._cerrojos	defs	2
._pvx_total	defs	2
._hotspot_t_r	defs	1
._at1	defs	1
._at2	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._nocast	defs	1
._cx1	defs	1
._cx2	defs	1
._cy1	defs	1
._cy2	defs	1
._prxx	defs	1
._pryy	defs	1
.__ta	defs	1
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
	XDEF	_a1
	XDEF	_a2
	XDEF	_a3
	XDEF	_a4
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
	XDEF	_t1
	XDEF	_t2
	XDEF	_t3
	XDEF	_t4
	LIB	sp_MoveSprAbsC
	LIB	sp_PixelLeft
	XDEF	_x0
	XDEF	_x1
	XDEF	_y0
	XDEF	_y1
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
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_xx
	XDEF	_yy
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
	XDEF	_qtile
	LIB	sp_RegisterHookLast
	XDEF	_sprite_18_a
	LIB	sp_RemoveHook
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_GetCharAddr
	LIB	sp_HashDelete
	XREF	_script_n
	XDEF	_cm_two_points
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_draw_and_advance
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
	XDEF	_init_malotes
	XDEF	_enit
	XDEF	_collide_enem
	XDEF	_main
	XDEF	_mapa
	LIB	sp_ListSearch
	LIB	sp_WaitForKey
	XDEF	_draw_coloured_tile
	XDEF	_attr
	LIB	sp_Wait
	LIB	sp_GetScrnAddr
	LIB	sp_PutTiles
	XDEF	_gpcx
	XDEF	_gpcy
	XDEF	_joyfunc
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_player_cells
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
	XDEF	_nocast
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
	XDEF	__ta
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
	XDEF	_init_player_values
	LIB	sp_Initialize
	LIB	sp_SwapEndian
	LIB	sp_ComputePos
	LIB	sp_JoyTimexLeft
	LIB	sp_JoyTimexRight
	XDEF	_bitmask
	LIB	sp_SetMousePosKempston
	LIB	sp_CharDown
	LIB	sp_CharLeft
	LIB	sp_PixelRight
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	LIB	sp_HuffEncode
	XDEF	_draw_2_digits
	XDEF	_tqt
	XREF	_script_result
	XDEF	_tpx
	XDEF	_tpy
	XDEF	_script
	XDEF	_enoffsmasi
	XDEF	_player_flicker
	XDEF	_move_tile_with_check
	XDEF	_check_lock_or_box_horz
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
