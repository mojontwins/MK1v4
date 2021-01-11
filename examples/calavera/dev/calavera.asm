;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Jan 11 10:31:30 2021



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


	LIB SPInvalidate
	LIB SPCompDListAddr
	LIB SPMoveSprAbs
	LIB SPTileArray
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

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
	defb	8

	defm	""
	defb	4

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	4

	defm	""
	defb	0

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	8

;	SECTION	code


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
	defw	sp_FreeBlock

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

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._max_screens
	defm	"<"
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


	; aPPack decompressor
	; original source by dwedit
	; very slightly adapted by utopian
	; optimized by Metalbrain
	;hl = source
	;de = dest
	.depack
	ld ixl,128
	.apbranch1
	ldi
	.aploop0
	ld ixh,1 ;LWM = 0
	.aploop
	call ap_getbit
	jr nc,apbranch1
	call ap_getbit
	jr nc,apbranch2
	ld b,0
	call ap_getbit
	jr nc,apbranch3
	ld c,16 ;get an offset
	.apget4bits
	call ap_getbit
	rl c
	jr nc,apget4bits
	jr nz,apbranch4
	ld a,b
	.apwritebyte
	ld (de),a ;write a 0
	inc de
	jr aploop0
	.apbranch4
	and a
	ex de,hl ;write a previous byte (1-15 away from dest)
	sbc hl,bc
	ld a,(hl)
	add hl,bc
	ex de,hl
	jr apwritebyte
	.apbranch3
	ld c,(hl) ;use 7 bit offset, length = 2 or 3
	inc hl
	rr c
	ret z ;if a zero is encountered here, it is EOF
	ld a,2
	adc a,b
	push hl
	ld iyh,b
	ld iyl,c
	ld h,d
	ld l,e
	sbc hl,bc
	ld c,a
	jr ap_finishup2
	.apbranch2
	call ap_getgamma ;use a gamma code * 256 for offset, another gamma code for length
	dec c
	ld a,c
	sub ixh
	jr z,ap_r0_gamma ;if gamma code is 2, use old r0 offset,
	dec a
	;do I even need this code?
	;bc=bc*256+(hl), lazy 16bit way
	ld b,a
	ld c,(hl)
	inc hl
	ld iyh,b
	ld iyl,c
	push bc
	call ap_getgamma
	ex (sp),hl ;bc = len, hl=offs
	push de
	ex de,hl
	ld a,4
	cp d
	jr nc,apskip2
	inc bc
	or a
	.apskip2
	ld hl,127
	sbc hl,de
	jr c,apskip3
	inc bc
	inc bc
	.apskip3
	pop hl ;bc = len, de = offs, hl=junk
	push hl
	or a
	.ap_finishup
	sbc hl,de
	pop de ;hl=dest-offs, bc=len, de = dest
	.ap_finishup2
	ldir
	pop hl
	ld ixh,b
	jr aploop
	.ap_r0_gamma
	call ap_getgamma ;and a new gamma code for length
	push hl
	push de
	ex de,hl
	ld d,iyh
	ld e,iyl
	jr ap_finishup
	.ap_getbit ld a,ixl
	add a,a
	ld ixl,a
	ret nz
	ld a,(hl)
	inc hl
	rla
	ld ixl,a
	ret
	.ap_getgamma
	ld bc,1
	.ap_getgammaloop
	call ap_getbit
	rl c
	rl b
	call ap_getbit
	jr c,ap_getgammaloop
	ret
	._mapa
	BINARY "mapa.h.map.bin"
	._cerrojos
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
	defb 0
	._sprite_2_a
	defb 1
	defb 3, 7
	defb 0, 1
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
	defb 192
	._sprite_2_b
	defb 224
	defb 240, 128
	defb 192, 128
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
	defb 3, 12
	defb 3, 124
	defb 2, 120
	defb 6, 64
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
	defb 192, 192
	defb 240, 224
	defb 56, 112
	defb 120, 56
	defb 224, 112
	defb 128, 96
	defb 0, 48
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
	defb 3
	._sprite_6_a
	defb 7
	defb 15, 1
	defb 3, 1
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
	defb 0
	._sprite_6_b
	defb 128
	defb 192, 224
	defb 0, 128
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
	defb 3, 3
	defb 15, 7
	defb 28, 14
	defb 30, 28
	defb 7, 14
	defb 1, 6
	defb 0, 12
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
	defb 192, 48
	defb 192, 62
	defb 64, 30
	defb 96, 2
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
	defb 27, 22
	defb 1, 4
	defb 0, 0
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
	defb 104, 216
	defb 32, 128
	defb 0, 0
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
	defb 15, 15
	defb 7, 15
	defb 11, 7
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
	defb 240, 240
	defb 224, 240
	defb 208, 224
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
	defb 255, 247
	defb 255, 255
	defb 255, 255
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
	defb 255, 239
	defb 255, 255
	defb 255, 255
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
	; Sprites #16 y 17
	; Primera columna
	._extra_sprite_17_a
	defb 1
	._extra_sprite_18_a
	defb 0
	defb 1, 3
	defb 1, 3
	defb 0, 3
	defb 1, 1
	defb 3, 3
	defb 3, 7
	defb 3, 7
	defb 3, 7
	defb 3, 7
	defb 3, 7
	defb 15, 6
	defb 15, 14
	defb 9, 28
	defb 1, 24
	defb 1, 28
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._extra_sprite_17_b
	defb 128
	._extra_sprite_18_b
	defb 0
	defb 192, 0
	defb 192, 128
	defb 192, 128
	defb 128, 128
	defb 255, 0
	defb 227, 254
	defb 192, 198
	defb 192, 128
	defb 192, 128
	defb 224, 224
	defb 224, 112
	defb 192, 48
	defb 128, 48
	defb 128, 48
	defb 192, 56
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._extra_sprite_17_c
	defb 0
	._extra_sprite_18_c
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
	; Sprites #18 y 19
	; Primera columna
	._extra_sprite_19_a
	defb 1
	._extra_sprite_20_a
	defb 0
	defb 3, 0
	defb 3, 1
	defb 3, 1
	defb 1, 1
	defb 255, 0
	defb 199, 127
	defb 3, 99
	defb 3, 1
	defb 3, 1
	defb 7, 7
	defb 7, 14
	defb 3, 12
	defb 1, 12
	defb 1, 12
	defb 3, 28
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; Segunda columna
	._extra_sprite_19_b
	defb 128
	._extra_sprite_20_b
	defb 0
	defb 128, 192
	defb 128, 192
	defb 0, 192
	defb 128, 128
	defb 192, 192
	defb 192, 224
	defb 192, 224
	defb 192, 224
	defb 192, 224
	defb 192, 224
	defb 240, 96
	defb 240, 112
	defb 144, 56
	defb 128, 24
	defb 128, 56
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	defb 0, 0
	; tercera columna
	._extra_sprite_19_c
	defb 0
	._extra_sprite_20_c
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

._malotes
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
	defb	112
	defb	112
	defb	112
	defb	64
	defb	112
	defb	112
	defb	0
	defb	-2
	defb	2
	defs	1
	defb	80
	defb	128
	defb	32
	defb	128
	defb	80
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	96
	defb	64
	defb	96
	defb	64
	defb	112
	defb	112
	defb	1
	defb	1
	defb	1
	defs	1
	defb	48
	defb	32
	defb	48
	defb	32
	defb	48
	defb	96
	defb	0
	defb	2
	defb	2
	defs	1
	defb	176
	defb	128
	defb	176
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	1
	defs	1
	defb	144
	defb	16
	defb	144
	defb	16
	defb	192
	defb	128
	defb	4
	defb	4
	defb	1
	defs	1
	defb	208
	defb	48
	defb	144
	defb	48
	defb	208
	defb	96
	defb	-2
	defb	2
	defb	2
	defs	1
	defb	160
	defb	112
	defb	160
	defb	32
	defb	192
	defb	112
	defb	1
	defb	-1
	defb	1
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
	defb	5
	defs	1
	defb	112
	defb	128
	defb	112
	defb	64
	defb	112
	defb	128
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	192
	defb	80
	defb	144
	defb	80
	defb	192
	defb	80
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	96
	defb	128
	defb	96
	defb	80
	defb	96
	defb	128
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
	defb	16
	defb	32
	defb	16
	defb	32
	defb	32
	defb	32
	defb	1
	defb	0
	defb	5
	defs	1
	defb	112
	defb	80
	defb	80
	defb	80
	defb	112
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
	defb	48
	defb	144
	defb	48
	defb	64
	defb	48
	defb	144
	defb	0
	defb	-2
	defb	4
	defs	1
	defb	80
	defb	64
	defb	80
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	1
	defs	1
	defb	64
	defb	144
	defb	64
	defb	128
	defb	64
	defb	144
	defb	0
	defb	-1
	defb	5
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
	defb	5
	defs	1
	defb	128
	defb	48
	defb	128
	defb	48
	defb	144
	defb	128
	defb	1
	defb	1
	defb	1
	defs	1
	defb	160
	defb	80
	defb	160
	defb	80
	defb	160
	defb	128
	defb	0
	defb	1
	defb	2
	defs	1
	defb	112
	defb	112
	defb	16
	defb	112
	defb	112
	defb	112
	defb	-1
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
	defb	112
	defb	96
	defb	64
	defb	96
	defb	112
	defb	96
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	192
	defb	96
	defb	192
	defb	64
	defb	192
	defb	96
	defb	0
	defb	-2
	defb	2
	defs	1
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	32
	defb	0
	defb	1
	defb	5
	defs	1
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	32
	defb	0
	defb	1
	defb	5
	defs	1
	defb	48
	defb	112
	defb	48
	defb	112
	defb	80
	defb	112
	defb	1
	defb	0
	defb	2
	defs	1
	defb	176
	defb	48
	defb	144
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	2
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
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	80
	defb	0
	defb	1
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
	defb	32
	defb	48
	defb	32
	defb	64
	defb	80
	defb	1
	defb	1
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
	defb	0
	defb	192
	defb	0
	defb	192
	defb	48
	defb	0
	defb	1
	defb	1
	defs	1
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	80
	defb	0
	defb	1
	defb	4
	defs	1
	defb	176
	defb	64
	defb	176
	defb	64
	defb	176
	defb	112
	defb	0
	defb	1
	defb	4
	defs	1
	defb	96
	defb	32
	defb	16
	defb	32
	defb	96
	defb	32
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	80
	defb	0
	defb	1
	defb	2
	defs	1
	defb	96
	defb	64
	defb	96
	defb	0
	defb	96
	defb	64
	defb	0
	defb	-1
	defb	1
	defs	1
	defb	224
	defb	16
	defb	144
	defb	16
	defb	224
	defb	48
	defb	-1
	defb	1
	defb	1
	defs	1
	defb	144
	defb	96
	defb	32
	defb	96
	defb	144
	defb	96
	defb	-2
	defb	0
	defb	4
	defs	1
	defb	48
	defb	96
	defb	48
	defb	96
	defb	128
	defb	128
	defb	2
	defb	2
	defb	1
	defs	1
	defb	208
	defb	32
	defb	160
	defb	32
	defb	208
	defb	32
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	48
	defb	128
	defb	1
	defb	0
	defb	5
	defs	1
	defb	64
	defb	128
	defb	64
	defb	128
	defb	80
	defb	128
	defb	1
	defb	0
	defb	5
	defs	1
	defb	208
	defb	32
	defb	0
	defb	32
	defb	208
	defb	32
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
	defb	16
	defb	64
	defb	144
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	144
	defb	64
	defb	144
	defb	16
	defb	160
	defb	64
	defb	1
	defb	-1
	defb	2
	defs	1
	defb	208
	defb	32
	defb	176
	defb	32
	defb	208
	defb	32
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	32
	defb	48
	defb	32
	defb	0
	defb	32
	defb	48
	defb	0
	defb	-1
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
	defb	144
	defb	176
	defb	16
	defb	176
	defb	144
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	16
	defb	112
	defb	16
	defb	16
	defb	16
	defb	112
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	176
	defb	32
	defb	176
	defb	32
	defb	192
	defb	32
	defb	1
	defb	0
	defb	5
	defs	1
	defb	160
	defb	48
	defb	160
	defb	48
	defb	176
	defb	48
	defb	1
	defb	0
	defb	5
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
	defb	80
	defb	64
	defb	80
	defb	64
	defb	208
	defb	64
	defb	1
	defb	0
	defb	4
	defs	1
	defb	112
	defb	48
	defb	112
	defb	48
	defb	160
	defb	80
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
	defb	160
	defb	128
	defb	160
	defb	128
	defb	160
	defb	144
	defb	0
	defb	0
	defb	15
	defs	1
	defb	144
	defb	48
	defb	144
	defb	48
	defb	144
	defb	64
	defb	0
	defb	0
	defb	15
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
	defb	64
	defb	192
	defb	64
	defb	192
	defb	80
	defb	0
	defb	0
	defb	15
	defs	1
	defb	144
	defb	144
	defb	144
	defb	144
	defb	160
	defb	144
	defb	0
	defb	0
	defb	15
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

;	SECTION	code

;	SECTION	text

._hotspots
	defb	38
	defb	1
	defb	0
	defb	32
	defb	1
	defb	0
	defb	114
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	195
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
	defb	54
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	136
	defb	1
	defb	0
	defb	97
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
	defb	36
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	177
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	146
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
	defb	36
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	1
	defb	0
	defb	180
	defb	1
	defb	0
	defb	193
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
	defb	0
	defb	0
	defb	0
	defb	116
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	179
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

	.sound_play
	ld hl, soundEffectsData ;address of sound effects data
	push iy
	ld b,0
	ld c,a
	add hl,bc
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix ;put it into ix
	.readData
	ld a,(ix+0) ;read block type
	or a
	jr nz,readData_sound
	pop iy
	ret
	.readData_sound
	ld c,(ix+1) ;read duration 1
	ld b,(ix+2)
	ld e,(ix+3) ;read duration 2
	ld d,(ix+4)
	push de
	pop iy
	dec a
	jr nz,sfxRoutineNoise
	;this routine generate tone with many parameters
	.sfxRoutineTone
	ld e,(ix+5) ;freq
	ld d,(ix+6)
	ld a,(ix+9) ;duty
	ld (sfxRoutineTone_duty + 1),a
	ld hl,0
	.sfxRoutineTone_l0
	push bc
	push iy
	pop bc
	.sfxRoutineTone_l1
	add hl,de
	ld a,h
	.sfxRoutineTone_duty
	cp 0
	sbc a,a
	and 16
	.sfxRoutineTone_border
	or 0
	out ($fe),a
	dec bc
	ld a,b
	or c
	jr nz,sfxRoutineTone_l1
	ld a,(sfxRoutineTone_duty + 1)
	add a,(ix+10) ;duty change
	ld (sfxRoutineTone_duty + 1),a
	ld c,(ix+7) ;slide
	ld b,(ix+8)
	ex de,hl
	add hl,bc
	ex de,hl
	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRoutineTone_l0
	ld c,11
	.nextData
	add ix,bc ;skip to the next block
	jr readData
	;this routine generate noise with two parameters
	.sfxRoutineNoise
	ld e,(ix+5) ;pitch
	ld d,1
	ld h,d
	ld l,d
	.sfxRoutineNoise_l0
	push bc
	push iy
	pop bc
	.sfxRoutineNoise_l1
	ld a,(hl)
	and 16
	.sfxRoutineNoise_border
	or 0
	out ($fe),a
	dec d
	jr nz,sfxRoutineNoise_l2
	ld d,e
	inc hl
	ld a,h
	and $1f
	ld h,a
	.sfxRoutineNoise_l2
	dec bc
	ld a,b
	or c
	jr nz,sfxRoutineNoise_l1
	ld a,e
	add a,(ix+6) ;slide
	ld e,a
	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRoutineNoise_l0
	ld c,7
	jr nextData
	.soundEffectsData
	defw soundEffectsData_sfx0
	defw soundEffectsData_sfx1
	defw soundEffectsData_sfx2
	defw soundEffectsData_sfx3
	defw soundEffectsData_sfx4
	defw soundEffectsData_sfx5
	defw soundEffectsData_sfx6
	defw soundEffectsData_sfx7
	defw soundEffectsData_sfx8
	defw soundEffectsData_sfx9
	defw soundEffectsData_sfx10
	defw soundEffectsData_sfx11
	.soundEffectsData_sfx0
	defb 0x01
	defw 0x000a,0x03e8,0x00c8,0x0016,0x1680
	defb 0x00
	.soundEffectsData_sfx1
	defb 0x01
	defw 0x0064,0x0014,0x01f4,0x0002,0x0010
	defb 0x00
	.soundEffectsData_sfx2
	defb 0x02
	defw 0x0001,0x03e8,0x000a
	defb 0x01
	defw 0x0014,0x0064,0x0190,0xfff0,0x0080
	defb 0x02
	defw 0x0001,0x07d0,0x0001
	defb 0x00
	.soundEffectsData_sfx3
	defb 0x01
	defw 0x0014,0x00c8,0x0d48,0x000a,0x0040
	defb 0x00
	.soundEffectsData_sfx4
	defb 0x01
	defw 0x0050,0x0014,0x03e8,0xffff,0x0080
	defb 0x00
	.soundEffectsData_sfx5
	defb 0x01
	defw 0x0004,0x03e8,0x03e8,0x0190,0x0080
	defb 0x00
	.soundEffectsData_sfx6
	defb 0x01
	defw 0x0002,0x0fa0,0x0190,0x00c8,0x0040
	defb 0x01
	defw 0x0002,0x0fa0,0x00c8,0x00c8,0x0020
	defb 0x00
	.soundEffectsData_sfx7
	defb 0x01
	defw 0x000a,0x03e8,0x00c8,0x0002,0x0010
	defb 0x01
	defw 0x0001,0x0fa0,0x0000,0x0000,0x0000
	defb 0x01
	defw 0x000a,0x03e8,0x00c8,0xfffe,0x0010
	defb 0x01
	defw 0x0001,0x07d0,0x0000,0x0000,0x0000
	defb 0x01
	defw 0x000a,0x03e8,0x00b4,0xfffe,0x0010
	defb 0x01
	defw 0x0001,0x0fa0,0x0000,0x0000,0x0000
	defb 0x00
	.soundEffectsData_sfx8
	defb 0x02
	defw 0x0001,0x03e8,0x0014
	defb 0x01
	defw 0x0001,0x03e8,0x0000,0x0000,0x0000
	defb 0x02
	defw 0x0001,0x03e8,0x0001
	defb 0x00
	.soundEffectsData_sfx9
	defb 0x02
	defw 0x0014,0x0032,0x0101
	defb 0x00
	.soundEffectsData_sfx10
	defb 0x02
	defw 0x0064,0x01f4,0x0264
	defb 0x00
	.soundEffectsData_sfx11
	defb 0x01
	defw 0x0014,0x01f4,0x00c8,0x0005,0x0110
	defb 0x01
	defw 0x0001,0x03e8,0x0000,0x0000,0x0000
	defb 0x01
	defw 0x001e,0x01f4,0x00c8,0x0008,0x0110
	defb 0x01
	defw 0x0001,0x07d0,0x0000,0x0000,0x0000
	defb 0x00

._play_sfx
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	(_asm_int),hl
	push ix
	push iy
	ld a, (_asm_int)
	call sound_play
	pop ix
	pop iy
	ret



._beepet
	push ix
	push iy
	ld a, 6
	call sound_play
	ld a, 3
	call sound_play
	ld a, 6
	call sound_play
	ld a, 3
	call sound_play
	ld a, 6
	call sound_play
	ld a, 3
	call sound_play
	ld a, 6
	call sound_play
	ld a, 3
	call sound_play
	pop iy
	pop ix
	ret



._draw_rectangle
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_18
.i_16
	ld	hl,_pti
	ld	a,(hl)
	inc	(hl)
.i_18
	ld	hl,(_pti)
	ld	h,0
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_ule
	jp	nc,i_17
	ld	hl,10	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	jp	i_21
.i_19
	ld	hl,_ptj
	ld	a,(hl)
	inc	(hl)
.i_21
	ld	hl,(_ptj)
	ld	h,0
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_ule
	jp	nc,i_20
	ld	hl,(_pti)
	ld	h,0
	push	hl
	ld	hl,(_ptj)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_19
.i_20
	jp	i_16
.i_17
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
	cp 11
	jr nc, _attr3
	ld hl, 0
	ret
	._attr3
	xor a
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



._draw_2_digits
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,100	;const
	call	l_div_u
	ld	hl,10	;const
	call	l_div_u
	ld	de,16
	add	hl,de
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,10	;const
	call	l_div_u
	ex	de,hl
	ld	de,16
	add	hl,de
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret



._draw_text
.i_22
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_23
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,10	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	call	l_gint	;
	call	l_gchar
	ld	bc,-32
	add	hl,bc
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	de
	pop	hl
	inc	hl
	push	hl
	push	de
	dec	hl
	jp	i_22
.i_23
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



._espera_activa
.i_24
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_25
	ld	hl,250 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_28
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdi),a
.i_26
	ld	hl,_rdd
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_28
.i_27
	call	_any_key
	ld	a,h
	or	l
	jr	nz,i_25
.i_29
	jp	i_24
.i_25
	ret


	._ts_attr_0
	BINARY "ts_attr_0c.bin"
	._ts_attr_1
	BINARY "ts_attr_1c.bin"
;	SECTION	text

._scr_ini
	defm	""
	defb	5

	defm	"(2"
	defb	15

;	SECTION	code


;	SECTION	text

._ini_x
	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

;	SECTION	code


;	SECTION	text

._ini_y
	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	2

;	SECTION	code


;	SECTION	text

._l_crucifixes
	defm	""
	defb	1

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	16

;	SECTION	code


;	SECTION	text

._l_ts_attr
	defw	_ts_attr_0
	defw	_ts_attr_0
	defw	_ts_attr_1
	defw	_ts_attr_1

;	SECTION	code

;	SECTION	text

._new_level_string
	defm	"LEVEL 00"
	defb	0

;	SECTION	code



;	SECTION	text

._zombie_cells
	defw	_extra_sprite_17_a
	defw	_extra_sprite_18_a
	defw	_extra_sprite_19_a
	defw	_extra_sprite_20_a

;	SECTION	code


._my_shr4
	.shr4
	srl a
	srl a
	srl a
	srl a
	ret
	ret



._pop_and_pursue
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(__en_y),a
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(__en_an_state),a
	ret



._check_feet
	ld a, (__en_x)
	add 4
	call shr4
	ld c, a
	ld a, (__en_y)
	add 16
	call shr4
	call _attr_enems
	ld a, l
	and 12
	ld (__en_an_lfoot), a
	ld a, (__en_x)
	add 11
	call shr4
	ld c, a
	ld a, (__en_y)
	add 16
	call shr4
	call _attr_enems
	ld a, l
	and 12
	ld (__en_an_rfoot), a
	ld c, a
	ld a, (__en_an_lfoot)
	or c
	ld (__en_an_feet), a
	ret



._hook_system_inits
	ret



._hook_init_game
	ld	a,#(1 % 256 % 256)
	ld	(_new_level),a
	ld	hl,2 % 256	;const
	ld	a,l
	ld	(_level),a
	ret



._hook_init_mainloop
	ld	a,(_new_level)
	and	a
	jp	z,i_37
	ld	a,#(0 % 256 % 256)
	ld	(_new_level),a
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	call	sp_ClearRect
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_spritesClip)
	push	hl
	push	hl
	call	sp_Invalidate
	pop	bc
	pop	bc
	ld	hl,_new_level_string+7
	push	hl
	ld	hl,(_level)
	ld	h,0
	ld	bc,49
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,_new_level_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
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
	call	sp_UpdateNow
	ld	hl,10 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,150	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld	de,_scr_ini
	ld	hl,(_level)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	call	_init_player_values
	ld	hl,_player+27
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	a,#(255 % 256 % 256)
	ld	(_enemy_killer),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	hl,_l_ts_attr
	push	hl
	ld	hl,(_level)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_asm_int),hl
	ld hl, (_asm_int)
	ld de, _tileset + 2048
	jp depack
.i_37
	ret



._hook_mainloop
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_39
	ld	a,(_n_pant)
	cp	#(40 % 256)
	jr	z,i_39_uge
	jp	c,i_39
.i_39_uge
	jr	i_40_i_39
.i_39
	jp	i_38
.i_40_i_39
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-10
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+8
	ld	(hl),#(65024 % 256)
	inc	hl
	ld	(hl),#(65024 / 256)
	ld	hl,2 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_38
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_42
	ld	a,(_n_pant)
	cp	#(50 % 256)
	jr	z,i_42_uge
	jp	c,i_42
.i_42_uge
	jr	i_43_i_42
.i_42
	jp	i_41
.i_43_i_42
	ld	hl,0	;const
	ld	(_player+8),hl
.i_41
	ld	hl,_player+27
	call	l_gchar
	push	hl
	ld	de,_l_crucifixes
	ld	hl,(_level)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_44
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_game_loop_flag),a
.i_44
	ret



._hook_entering
	ret



._extra_enems_init
	ld	a,(__en_t)
	cp	#(15 % 256)
	jp	nz,i_45
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
.i_45
	ret



._extra_enems_move
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_eq
	jp	nc,i_46
	ld a, (__en_x)
	add 8
	ld c, a
	ld a, (_gpx)
	cp c
	ld a, 0
	jr nc, z_set_facing
	ld a, 2
	.z_set_facing
	ld (__en_an_facing), a
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_an_state),a
	and	a
	jp	nz,i_47
	ld	hl,__en_y
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld a, (__en_x)
	add 8
	call shr4
	ld c, a
	ld a, (__en_y)
	add 15
	call shr4
	call _attr_enems
	ld a, l
	and 12
	jr nz, z_appearing_done
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(__en_an_state),a
	.z_appearing_done
	jp	i_48
.i_47
	call	_check_feet
	ld	hl,__en_an_state
	ld	a,(hl)
	rrca
	jp	nc,i_49
	ld	l,a
	ld	h,0
	ld a, (__en_an_facing)
	or a
	ld a, (__en_x)
	jr z, z_pursuing_c_facing_right
	.z_pursuing_c_facing_left
	add 4
	jr z_pursuing_c_facing_done
	.z_pursuing_c_facing_right
	add 11
	.z_pursuing_c_facing_done
	call shr4
	ld (_rdd), a
	ld c, a
	ld a, (__en_y)
	call shr4
	call _attr_enems
	ld a, l
	ld (_rdi), a
	ld a, (_rdd)
	ld c, a
	ld a, (__en_y)
	add 15
	call shr4
	call _attr_enems
	ld a, (_rdi)
	or l
	and 8
	ld (_rdd), a ; rdd set -> horizontal collision
	ld	hl,__en_an_state
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_50
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ult
	jp	nc,i_52
	ld	a,(__en_an_facing)
	and	a
	jp	z,i_53
	ld	a,(__en_an_rfoot)
	cp	#(0 % 256)
	jr	z,i_54_i_53
.i_53
	jp	i_52
.i_54_i_53
	ld	hl,1	;const
	jr	i_55
.i_52
	ld	hl,0	;const
.i_55
	ld	a,h
	or	l
	jp	nz,i_56
	ld	a,(__en_an_facing)
	cp	#(0 % 256)
	jp	nz,i_57
	ld	a,(__en_an_lfoot)
	cp	#(0 % 256)
	jp	nz,i_57
	ld	hl,1	;const
	jr	i_58
.i_57
	ld	hl,0	;const
.i_58
	ld	a,h
	or	l
	jp	nz,i_56
	jr	i_59
.i_56
	ld	hl,1	;const
.i_59
	ld	a,h
	or	l
	jp	nz,i_60
	ld	a,(_rdd)
	and	a
	jp	z,i_51
.i_60
	ld	a,(__en_an_state)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_or
	ld	h,0
	ld	a,l
	ld	(__en_an_state),a
	ld	de,_en_an_ct_j
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(8 % 256 % 256)
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	(hl),#(65408 % 256)
	inc	hl
	ld	(hl),#(65408 / 256)
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(__en_y2),a
	jp	i_62
.i_51
	ld	a,(__en_an_feet)
	and	a
	jp	nz,i_63
	ld	a,#(2 % 256 % 256)
	ld	(__en_an_state),a
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
	jp	i_62
.i_63
.i_50
	ld	hl,(_rdd)
	ld	h,0
	call	l_lneg
	jp	nc,i_64
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x)
	ld	h,0
	call	l_ult
	jp	nc,i_65
	ld	hl,__en_x
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	jp	i_66
.i_65
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x)
	ld	h,0
	call	l_ugt
	jp	nc,i_67
	ld	hl,__en_x
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
.i_67
.i_66
.i_64
.i_49
	call	_check_feet
	ld	hl,__en_an_state
	ld	a,(hl)
	and	#(4 % 256)
	jp	z,i_68
	ld	de,_en_an_ct_j
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_69
	ld	de,_en_an_ct_j
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	dec	(hl)
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,4
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_70
.i_69
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,32
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(__en_an_feet)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_71
	call	_pop_and_pursue
	jp	i_62
.i_71
.i_70
	ld	hl,_en_an_y
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
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__en_y),a
.i_68
	ld	hl,__en_an_state
	ld	a,(hl)
	and	#(2 % 256)
	jp	z,i_72
	ld	hl,(__en_an_feet)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_73
	call	_pop_and_pursue
	jp	i_62
.i_73
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,32
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,_en_an_y
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
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__en_y),a
.i_72
.i_48
.i_62
.i_74
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,__en_an_state
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_zombie_cells
	push	hl
	ld	hl,(__en_an_facing)
	ld	h,0
	push	hl
	ld	a,(__en_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1	;const
	ex	de,hl
	call	l_and
	pop	de
	add	hl,de
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
.i_46
	ret



._extra_enems_checks
	ret



._extra_enems_killed
	ld	a,(_enemy_died)
	cp	#(15 % 256)
	jp	nz,i_75
	ld	a,#(15 % 256 % 256)
	ld	(__en_t),a
	ld	hl,(__en_x1)
	ld	h,0
	ld	a,l
	ld	(__en_x),a
	ld	hl,(__en_y1)
	ld	h,0
	ld	a,l
	ld	(__en_y),a
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_75
	ret


	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"

._unpack
	call blackout
	ld hl, (_asm_int)
	ld de, 16384
	jp depack
	.blackout
	ld hl, 22528
	ld de, 22529
	ld bc, 767
	xor a
	ld (hl), a
	ldir
	ret
	ret



._title_screen
	call	sp_UpdateNow
	ld	hl,_s_title
	ld	(_asm_int),hl
	call	_unpack
	; Music generated by beepola
	call musicstart
	di
.i_76
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_78
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_77
.i_78
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_80
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_77
.i_80
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_82
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_77
.i_82
.i_81
.i_79
	jp	i_76
.i_77
.i_83
	ret



._game_ending
	call	sp_UpdateNow
	ld	hl,_s_ending
	ld	(_asm_int),hl
	call	_unpack
	call	_beepet
	ld	hl,11 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._game_over
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,87 % 256	;const
	push	hl
	call	_draw_rectangle
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,87 % 256	;const
	push	hl
	ld	hl,i_1+9
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	call	_beepet
	ld	hl,10 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._do_extern_action
	ret


;	SECTION	text

._line_of_text_clear
	defm	"                              "
	defm	"  "
	defb	0

;	SECTION	code



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
	defw	0

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


._abs_a
	bit 7, a
	ret z
	neg
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



._collide_enem
	ld hl, 0
	ld a, (_gpx)
	ld c, a
	ld a, (_en_ccx)
	add 8
	cp c
	ret c
	ld a, (_en_ccx)
	ld c, a
	ld a, (_gpx)
	add 8
	cp c
	ret c
	ld a, (_gpy)
	ld c, a
	ld a, (_en_ccy)
	add 12
	cp c
	ret c
	ld a, (_en_ccy)
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
	;; Ahora DE = [SEED]
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
	;; Ahora [SEED] = HL
	ld l, e
	ld h, 0
	;; Return 8 bit
	ret



._abs
	bit 7, h
	ret z
	call l_neg
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
	xor a ; ld a, 255
	.bucle1
	sla (hl)
	inc hl
	dec a
	jr nz, bucle1
	xor a ; ld a, 255
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



._init_bullets
	ld hl, _bullets_estado
	ld de, _bullets_estado + 1
	ld bc, 3 - 1
	xor a
	ld (hl), a
	ldir
	ret



._init_malotes
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_89
.i_87
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_89
	ld	a,(_gpit)
	cp	#(180 % 256)
	jp	z,i_88
	jp	nc,i_88
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	(hl),#(5 % 256 % 256)
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,5	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_90
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	push	hl
	call	l_gchar
	ld	de,16	;const
	ex	de,hl
	call	l_or
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_90
	jp	i_87
.i_88
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
	ld	hl,9 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ret



._player_hidden
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_92
	inc	hl
	ld	hl,(_player+6)
	ld	de,0	;const
	call	l_eq
	jr	c,i_93_i_92
.i_92
	jp	i_91
.i_93_i_92
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,2	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_94
	ld	hl,1 % 256	;const
	ret


.i_94
.i_91
	ld	hl,0 % 256	;const
	ret



._adjust_to_tile_x
	ld	a,(_gpxx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,_player
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ret



._adjust_to_tile_y
	ld	a,(_gpyy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	hl,_player+1+1
	push	hl
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ret



._move
	ld	hl,(_player)
	ld	(_gpcx),hl
	ld	hl,(_player+1+1)
	ld	(_gpcy),hl
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_95
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_95
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
	._player_gravity
	ld hl, (_player + 8)
	bit 7, h
	jr nz, player_gravity_add
	ld de, 512 - 32
	or a
	push hl
	sbc hl, de
	pop hl
	jr nc, player_gravity_maximum
	.player_gravity_add
	ld de, 32
	add hl, de
	jr player_gravity_vy_set
	.player_gravity_maximum
	ld hl, 512
	.player_gravity_vy_set
	ld (_player + 8), hl
	.player_gravity_done
	ld	a,(_player+25)
	and	a
	jp	z,i_96
	ld	hl,0	;const
	ld	(_player+8),hl
.i_96
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
	ld	de,65024	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_97
	ld	hl,65024	;const
	ld	(_player+1+1),hl
.i_97
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_98
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_98
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpxx),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	.vert_collision
	xor a
	ld (_player + 26), a
	ld (_player + 37), a
	ld de, (_player + 8)
	ld hl, (_ptgmy)
	add hl, de
	ld (_rdj), hl
	ld a, h
	or l
	jp z, vert_collision_done
	bit 7, h
	jr z, vert_collision_positive
	.vert_collision_negative
	ld a, (_gpy)
	and 15
	cp 12
	jp nc, vert_collision_done
	.vert_collision_if1
	ld a, (_gpx)
	and 15
	cp 12
	jr nc, vert_collision_if2
	ld a, (_gpxx)
	ld c, a
	ld a, (_gpyy)
	call _attr_2
	ld a, l
	and 8
	jr nz, vert_collision_up
	.vert_collision_if2
	ld a, (_gpx)
	and 15
	cp 5
	jp c, vert_collision_done
	ld a, (_gpxx)
	inc a
	ld c, a
	ld a, (_gpyy)
	call _attr_2
	ld a, l
	and 8
	jp z, vert_collision_done
	.vert_collision_up
	ld hl, 0
	ld (_player + 8), hl
	ld a, (_gpyy)
	sla a
	sla a
	sla a
	sla a
	add 12
	ld (_gpy), a
	ld a, (_gpy)
	ld e, a
	ld d, 0
	ld l, 6
	call l_asl
	ld (_player + 2), hl
	ld a, 1
	ld (_player + 37), a
	jr vert_collision_done
	.vert_collision_positive
	ld a, (_gpy)
	and 15
	ld c, a
	ld de, (_player + 8)
	ld l, 6
	call l_asr
	ld a, l
	cp c
	jr c, vert_collision_done
	.vert_collision_if3
	ld a, (_gpx)
	and 15
	cp 12
	jr nc, vert_collision_if4
	ld a, (_gpxx)
	ld c, a
	ld a, (_gpyy)
	inc a
	call _attr_2
	ld a, l
	and 12
	jr nz, vert_collision_down
	.vert_collision_if4
	ld a, (_gpx)
	and 15
	cp 5
	jr c, vert_collision_done
	ld a, (_gpxx)
	inc a
	ld c, a
	ld a, (_gpyy)
	inc a
	call _attr_2
	ld a, l
	and 12
	jr z, vert_collision_done
	.vert_collision_down
	ld hl, 0
	ld (_player + 8), hl
	call _adjust_to_tile_y
	ld a, 1
	ld (_player + 26), a
	.vert_collision_done
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	c,i_99
	ld	a,(_player+19)
	and	a
	jp	nz,i_100
	ld	a,(_player+26)
	and	a
	jp	nz,i_102
	ld	a,(_player+25)
	and	a
	jp	z,i_101
.i_102
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_101
.i_100
	ld	a,(_player+19)
	and	a
	jp	z,i_104
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_player+13)
	ld	h,0
	ld	bc,32
	add	hl,bc
	push	hl
	ld	a,(_player+14)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	pop	de
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
	jp	nc,i_105
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_105
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_106
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_106
.i_104
	jp	i_107
.i_99
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
.i_107
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_109
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_110_i_109
.i_109
	jp	i_108
.i_110_i_109
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_111
	or	l
	jp	z,i_111
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_player+12
	call	l_gchar
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_112
	ld	hl,0	;const
	ld	(_player+6),hl
.i_112
	jp	i_113
.i_111
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_114
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_player+12
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_115
	or	l
	jp	z,i_115
	ld	hl,0	;const
	ld	(_player+6),hl
.i_115
.i_114
.i_113
.i_108
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_116
	ld	hl,(_player+6)
	push	hl
	ld	hl,(_player+39)
	call	l_neg
	pop	de
	call	l_gt
	jp	nc,i_117
	ld	hl,_player+22
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_player+11
	call	l_gchar
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_pint
.i_117
.i_116
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_118
	ld	de,(_player+6)
	ld	hl,(_player+39)
	call	l_lt
	jp	nc,i_119
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_player+11
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_119
.i_118
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
	jp	p,i_120
	ld	hl,0	;const
	ld	(_player),hl
.i_120
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_121
	ld	hl,14336	;const
	ld	(_player),hl
.i_121
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpxx),a
	xor a
	ld (_wall), a
	ld hl, (_player + 6)
	ld de, (_ptgmx)
	add hl, de
	ld (_rdj), hl
	ld a, h
	or l
	jp z, horz_collision_done
	bit 7, h
	jp z, horz_collision_positive
	.horz_collision_negative
	ld a, (_gpx)
	and 15
	cp 12
	jp nc, horz_collision_done
	.horz_collision_if1
	ld a, (_gpy)
	and 15
	cp 12
	jp nc, horz_collision_if2
	ld a, (_gpxx)
	ld c, a
	ld a, (_gpyy)
	call _attr_2
	ld a, l
	and 8
	jp nz, horz_collision_left
	.horz_collision_if2
	ld a, (_gpy)
	and 15
	jp z, horz_collision_done
	ld a, (_gpxx)
	ld c, a
	ld a, (_gpyy)
	inc a
	call _attr_2
	ld a, l
	and 8
	jp z, horz_collision_done
	.horz_collision_left
	ld hl, 0
	ld (_player + 6), hl
	ld a, (_gpxx)
	sla a
	sla a
	sla a
	sla a
	add 12
	ld (_gpx), a
	ld a, (_gpx)
	ld e, a
	ld d, 0
	ld l, 6
	call l_asl
	ld (_player), hl
	ld a, 1
	ld (_wall), a
	jr horz_collision_done
	.horz_collision_positive
	ld a, (_gpx)
	and 15
	cp 4
	jp c, horz_collision_done
	.horz_collision_if3
	ld a, (_gpy)
	and 15
	cp 12
	jp nc, horz_collision_if4
	ld a, (_gpxx)
	inc a
	ld c, a
	ld a, (_gpyy)
	call _attr_2
	ld a, l
	and 8
	jp nz, horz_collision_right
	.horz_collision_if4
	ld a, (_gpy)
	and 15
	jp z, horz_collision_done
	ld a, (_gpxx)
	inc a
	ld c, a
	ld a, (_gpyy)
	inc a
	call _attr_2
	ld a, l
	and 8
	jp z, horz_collision_done
	.horz_collision_right
	ld hl, 0
	ld (_player + 6), hl
	ld a, (_gpxx)
	sla a
	sla a
	sla a
	sla a
	add 4
	ld (_gpx), a
	ld a, (_gpx)
	ld e, a
	ld d, 0
	ld l, 6
	call l_asl
	ld (_player), hl
	ld a, 2
	ld (_wall), a
	.horz_collision_done
	ld	hl,_pad0
	ld	a,(hl)
	and	#(128 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_123
	inc	hl
	ld	a,(_player+33)
	cp	#(0 % 256)
	jr	z,i_124_i_123
.i_123
	jp	i_122
.i_124_i_123
	ld	hl,_player+33
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_fire_bullet
.i_122
	ld	hl,_pad0
	ld	a,(hl)
	rlca
	jp	nc,i_125
	ld	hl,_player+33
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_125
	ld a, (_player+22)
	or a
	jr z, _player_cell_sel_set_rdi
	ld a, 4
	._player_cell_sel_set_rdi
	ld (_rdi), a
	ld	hl,(_player+26)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_127
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_128_i_127
.i_127
	jp	i_126
.i_128_i_127
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_129
.i_126
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_130
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_131
.i_130
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,3	;const
	ex	de,hl
	call	l_div_u
	ex	de,hl
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_131
.i_129
	ld	hl,_player+17
	push	hl
	ld	hl,_player_cells
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdd)
	ld	h,0
	add	hl,de
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ret



._init_player_values
	ld	de,_ini_x
	ld	hl,(_level)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,_player
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	de,_ini_y
	ld	hl,(_level)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	hl,_player+1+1
	push	hl
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+10
	push	hl
	pop	de
	ld	a,#(32 % 256)
	ld	(de),a
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+11
	push	hl
	pop	de
	ld	a,#(24 % 256)
	ld	(de),a
	ld	hl,_player+12
	push	hl
	pop	de
	ld	a,#(24 % 256)
	ld	(de),a
	ld	hl,_player+39
	ld	(hl),#(256 % 256)
	inc	hl
	ld	(hl),#(256 / 256)
	ld	hl,_player+13
	ld	(hl),#(64 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+20
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+21
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+23
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+33
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+35
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+34
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret



._init_player
	call	_init_player_values
	ld	hl,_player+29
	ld	(hl),#(66 % 256)
	inc	hl
	ld	(hl),#(66 / 256)
	ld	hl,_player+27
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	hl,_player+28
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	hl,_player+32
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
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



._draw_scr_background
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdy),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	._draw_scr_get_scr_address
	ld a, (_n_pant)
	sla a
	ld d, 0
	ld e, a
	ld hl, _mapa
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
	ld	a,#(240 % 256 % 256)
	ld	(_hotspot_y),a
	ld	a,#(0 % 256 % 256)
	ld	(_hotspot_t),a
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
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_132
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
	ld	a,(hl)
	and	a
	jp	z,i_133
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_hotspot_t),a
.i_133
	jp	i_134
.i_132
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
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_135
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_div
	ld	hl,2	;const
	call	l_eq
	jp	nc,i_136
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_hotspot_t),a
.i_136
.i_135
.i_134
	ld	a,(_hotspot_t)
	and	a
	jp	z,i_137
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdx),a
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
	ld	a,(hl)
	and	#(15 % 256)
	ld	l,a
	ld	h,0
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_hotspot_y),a
	ld	hl,_map_buff
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,(_rdx)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_orig_tile),a
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_hotspot_t)
	cp	#(3 % 256)
	jp	nz,i_138
	ld	hl,16	;const
	jp	i_139
.i_138
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	de,16
	add	hl,de
.i_139
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_137
	ret



._enems_calc_frame
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_enem_cells
	push	hl
	ld	de,_en_an_base_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	pop	de
	add	hl,de
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ret



._enems_en_an_calc
	ld	de,_en_an_base_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	pop	de
	ld	a,l
	ld	(de),a
	call	_enems_calc_frame
	ret



._draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	call	_draw_scr_background
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_f_zone_ac),a
	._enems_init
	ld	hl,(_n_pant)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_enoffs),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_142
.i_140
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_142
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_141
	jp	nc,i_141
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_enoffs)
	ld	h,0
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
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
.i_145
	ld	a,l
	cp	#(1% 256)
	jp	z,i_146
	cp	#(2% 256)
	jp	z,i_147
	cp	#(3% 256)
	jp	z,i_148
	cp	#(4% 256)
	jp	z,i_149
	jp	i_150
.i_146
.i_147
.i_148
.i_149
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_144
.i_150
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
.i_144
	call	_extra_enems_init
	jp	i_140
.i_141
	call	_init_bullets
	call	_hook_entering
	ret



._mueve_bullets
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_153
.i_151
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_153
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_152
	jp	nc,i_152
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
	jp	nz,i_155
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,240	;const
	call	l_ugt
	jp	nc,i_154
.i_155
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_154
	jp	i_151
.i_152
	ret



._platform_get_player
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	hl,_player+1+1
	push	hl
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	ld	hl,__en_my
	call	l_gchar
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	ld	(_ptgmy),hl
	ret



._enems_kill
	ld	hl,(__en_t)
	ld	h,0
	ld	a,l
	ld	(_enemy_died),a
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,(_en_ccy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_en_ccx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_en_ccx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_en_ccy)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	call	sp_MoveSprAbs
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	call	sp_UpdateNow
	ld	hl,10 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
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
	ld	hl,16	;const
	call	l_or
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,_player+32
	inc	(hl)
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(__en_life),a
	call	_extra_enems_killed
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
	jp	i_159
.i_157
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_159
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_158
	jp	nc,i_158
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	ld hl, (_enoffsmasi)
	ld h, 0
	add hl, hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, hl
	add hl, de
	ld de, _malotes
	add hl, de
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
	ld	hl,__en_t
	ld	a,(hl)
	and	#(16 % 256)
	jp	z,i_161
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(0 % 256)
	jr	z,i_162_i_161
.i_161
	jp	i_160
.i_162_i_161
	jp	i_163
.i_160
	ld	a,(__en_t)
	and	a
	jp	z,i_164
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_cx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_cy),a
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ule
	jp	c,i_166
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_165
.i_166
	ld a, (__en_mx)
	ld c, a
	ld a, (__en_x)
	add c
	ld (__en_x), a
	ld a, (__en_my)
	ld c, a
	ld a, (__en_y)
	add c
	ld (__en_y), a
	.en_linear_horz_bounds
	ld a, (__en_x)
	ld c, a
	ld a, (__en_x1)
	cp c
	jr c, horz_limit_skip_1
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	.horz_limit_skip_1
	ld a, (__en_x2)
	ld c, a
	ld a, (__en_x)
	cp c
	jr c, horz_limit_skip_2
	ld a, (__en_mx)
	call _abs_a
	neg
	ld (__en_mx), a
	.horz_limit_skip_2
	.en_linear_vert_bounds
	ld a, (__en_y)
	ld c, a
	ld a, (__en_y1)
	cp c
	jr c, vert_limit_skip_1
	ld a, (__en_my)
	call _abs_a
	ld (__en_my), a
	.vert_limit_skip_1
	ld a, (__en_y2)
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, vert_limit_skip_2
	ld a, (__en_my)
	call _abs_a
	neg
	ld (__en_my), a
	.vert_limit_skip_2
.i_165
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_168
	call	_player_hidden
	ld	a,h
	or	l
	jp	z,i_169
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_171
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_172_i_171
.i_171
	jp	i_170
.i_172_i_171
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,6
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_173
.i_170
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_175
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_176_i_175
.i_175
	jp	i_174
.i_176_i_175
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-6
	add	hl,bc
	pop	de
	call	l_pint
.i_174
.i_173
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_178
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_179_i_178
.i_178
	jp	i_177
.i_179_i_178
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,6
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_180
.i_177
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_182
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_183_i_182
.i_182
	jp	i_181
.i_183_i_182
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-6
	add	hl,bc
	pop	de
	call	l_pint
.i_181
.i_180
	jp	i_184
.i_169
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_185
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_187
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_188_i_187
.i_187
	jp	i_186
.i_188_i_187
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_189
.i_186
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_191
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_192_i_191
.i_191
	jp	i_190
.i_192_i_191
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_190
.i_189
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_194
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_195_i_194
.i_194
	jp	i_193
.i_195_i_194
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_196
.i_193
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_198
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_199_i_198
.i_198
	jp	i_197
.i_199_i_198
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_197
.i_196
.i_185
.i_184
	ld	hl,_en_an_x
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
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_en_an_y
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
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,15360	;const
	call	l_gt
	jp	nc,i_200
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,15360	;const
	ex	de,hl
	call	l_pint
.i_200
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_201
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_201
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,10240	;const
	call	l_gt
	jp	nc,i_202
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,10240	;const
	ex	de,hl
	call	l_pint
.i_202
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_203
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_203
.i_168
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_count
	add hl, bc
	ld a, (hl)
	inc a
	cp 4
	jr c, _enemy_animate_update_count
	push hl
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	xor 1
	ld (hl), a
	pop hl
	xor a
	._enemy_animate_update_count
	ld (hl), a
	call	_enems_calc_frame
	call	_extra_enems_move
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_204
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
	jp	i_205
.i_204
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
.i_205
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_207
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_207
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_208_i_207
.i_207
	jp	i_206
.i_208_i_207
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_209
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_211
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_211
	ld	hl,(_player+8)
	ld	de,65504	;const
	ex	de,hl
	call	l_ge
	jr	c,i_212_i_211
.i_211
	jp	i_210
.i_212_i_211
	call	_platform_get_player
.i_210
	jp	i_213
.i_209
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_214
	or	l
	jp	z,i_214
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_216
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-14
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_216
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_217_i_216
.i_216
	jp	i_215
.i_217_i_216
	call	_platform_get_player
.i_215
.i_214
.i_213
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_219
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_219
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_219
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_220_i_219
.i_219
	jp	i_218
.i_220_i_219
	call	_platform_get_player
	ld	hl,__en_mx
	call	l_gchar
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	ld	(_ptgmx),hl
.i_218
	jp	i_221
.i_206
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_223
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_223
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,16	;const
	call	l_ult
	jp	c,i_224
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_223
.i_224
	jr	i_226_i_223
.i_223
	jp	i_222
.i_226_i_223
	ld	a,(_player+23)
	and	a
	jp	nz,i_227
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,(_enit)
	ld	h,0
	ld	a,l
	ld	(_enemy_killer),a
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	z,i_228
	jp	c,i_228
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	jp	i_229
.i_228
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
.i_229
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	nz,i_230
	ld	hl,__en_mx
	call	l_gchar
	xor	a
	or	h
	jp	m,i_231
	or	l
	jp	z,i_231
	ld	hl,256	;const
	ld	(_player+6),hl
.i_231
	ld	hl,__en_mx
	call	l_gchar
	xor	a
	or	h
	jp	p,i_232
	ld	hl,65280	;const
	ld	(_player+6),hl
.i_232
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_233
	or	l
	jp	z,i_233
	ld	hl,256	;const
	ld	(_player+8),hl
.i_233
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_234
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_234
	jp	i_235
.i_230
	ld	hl,_player+6
	push	hl
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_player+8
	push	hl
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_235
.i_227
.i_222
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,16	;const
	call	l_ult
	jp	c,i_237
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_236
.i_237
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_en_j),a
	jp	i_241
.i_239
	ld	hl,_en_j
	ld	a,(hl)
	inc	(hl)
.i_241
	ld	a,(_en_j)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_240
	ld bc, (_en_j)
	ld b, 0
	ld hl, _bullets_estado
	add hl, bc
	ld a, (hl)
	or a
	jp z, enems_coll_bullets_continue
	ld a, (_en_ccy)
	sub 4
	ld d, a
	ld hl, _bullets_y
	add hl, bc
	ld a, (hl)
	cp d
	jp c, enems_coll_bullets_continue
	ld d, a
	ld a, (_en_ccy)
	add 12
	cp d
	jp c, enems_coll_bullets_continue
	ld a, (_en_ccx)
	sub 4
	ld d, a
	ld hl, _bullets_x
	add hl, bc
	ld a, (hl)
	cp d
	jp c, enems_coll_bullets_continue
	ld d, a
	ld a, (_en_ccx)
	add 12
	cp d
	jp c, enems_coll_bullets_continue
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_242
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
	jp	nc,i_243
	ld	hl,128	;const
	jp	i_244
.i_243
	ld	hl,65408	;const
.i_244
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_242
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
	ld	de,_en_an_morido
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	de,_bullets_estado
	ld	hl,(_en_j)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,__en_life
	ld	a,(hl)
	dec	(hl)
	ld	hl,(__en_life)
	ld	h,0
	ld	a,h
	or	l
	call	z,_enems_kill
.i_245
	.enems_coll_bullets_continue
	jp	i_239
.i_240
.i_236
.i_221
	call	_extra_enems_checks
.i_164
.i_163
.i_246
	ld	hl,__en_t
	ld	a,(hl)
	and	#(16 % 256)
	jp	z,i_248
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,0	;const
	call	l_eq
	jp	nc,i_248
	call	_rand
	ld	de,31	;const
	ex	de,hl
	call	l_and
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_248
	inc	hl
	jr	i_249
.i_248
	ld	hl,0	;const
.i_249
	ld	a,h
	or	l
	jp	z,i_247
	ld	de,_en_an_fanty_activo
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_player+1+1)
	ld	de,5120	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_250
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
	jp	i_251
.i_250
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,10240	;const
	ex	de,hl
	call	l_pint
.i_251
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	_rand
	ld	de,240	;const
	ex	de,hl
	call	l_div
	ex	de,hl
	ld	bc,-8
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
	pop	de
	call	l_pint
	ld	hl,2 % 256	;const
	push	hl
	call	_enems_en_an_calc
	pop	bc
.i_247
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
	jp	i_157
.i_158
	ret



._main
	di
	ld sp, 61952
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	sp_Initialize
	pop	bc
	pop	bc
	ld	hl,0 % 256	;const
	push	hl
	call	sp_Border
	pop	bc
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,55 % 256	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,61063	;const
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
	ld	hl,64 % 256	;const
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
	ld	hl,_sprite_2_c
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
	jp	i_254
.i_252
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_254
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_253
	jp	nc,i_253
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,64 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
	push	hl
	ld	hl,_sprite_9_a
	push	hl
	ld	hl,1 % 256	;const
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
	ld	hl,_sprite_9_c
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
	jp	i_252
.i_253
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_257
.i_255
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_257
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_256
	jp	nc,i_256
	ld	hl,_sp_bullets
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,64 % 256	;const
	push	hl
	ld	hl,2 % 256	;const
	push	hl
	ld	hl,_sprite_19_a
	push	hl
	ld	hl,1 % 256	;const
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
	jp	i_255
.i_256
	call	_hook_system_inits
.i_258
	call	_cortina
	call	_title_screen
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_malotes
	call	_init_bullets
	ld	a,#(40 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_game_loop_flag),a
	call	_hook_init_game
	ld	a,#(0 % 256 % 256)
	ld	(_half_life),a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(_coins_old),a
	ld	h,0
	ld	a,l
	ld	(_ezg_old),a
	ld	h,0
	ld	a,l
	ld	(_item_old),a
	ld	h,0
	ld	a,l
	ld	(_killed_old),a
	ld	h,0
	ld	a,l
	ld	(_keys_old),a
	ld	h,0
	ld	a,l
	ld	(_life_old),a
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_260
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_261
	call	_hook_init_mainloop
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_on_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_262
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_on_pant),a
.i_262
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_263
	ld	hl,16 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
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
.i_263
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_264
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_265
	or	l
	jp	z,i_265
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_266
.i_265
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_266
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
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
.i_264
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_mueve_bullets
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_269
.i_267
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_269
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_268
	jp	nc,i_268
	ld	de,_en_an_fanty_activo
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_270
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	jp	i_271
.i_270
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_271
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
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,_en_an_next_frame
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
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	call	sp_MoveSprAbs
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	jp	i_267
.i_268
	ld	hl,(_gpy)
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0
	call	l_eq
	jp	c,i_273
	ld	a,(_half_life)
	and	a
	jp	z,i_272
.i_273
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_275
.i_272
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_275
	ld	a,(_rdy)
	cp	#(248 % 256)
	jr	z,i_276_uge
	jp	c,i_276
.i_276_uge
	ld	hl,65535 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_277
.i_276
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdi),a
.i_277
	ld	hl,(_sp_player)
	push	hl
	ld	hl,(_spritesClip)
	push	hl
	ld	de,(_player+17)
	ld	hl,(_player+15)
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	push	hl
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	call	sp_MoveSprAbs
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_280
.i_278
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_280
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_279
	jp	nc,i_279
	ld	de,_bullets_estado
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_281
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
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	de,_bullets_y
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	de,_bullets_x
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	de,_bullets_x
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	#(7 % 256)
	ld	l,a
	ld	h,0
	push	hl
	ld	de,_bullets_y
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	#(7 % 256)
	ld	l,a
	ld	h,0
	push	hl
	call	sp_MoveSprAbs
	exx
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	exx
	jp	i_282
.i_281
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
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,65534 % 256	;const
	push	hl
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	sp_MoveSprAbs
	exx
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	exx
.i_282
	jp	i_278
.i_279
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_latest_hotspot),a
	ld a, (_hotspot_x)
	ld c, a
	ld a, (_gpx)
	add 12
	cp c
	jp c, _hotspots_done
	ld a, (_gpx)
	ld c, a
	ld a, (_hotspot_x)
	add 12
	cp c
	jp c, _hotspots_done
	ld a, (_hotspot_y)
	ld c, a
	ld a, (_gpy)
	add 12
	cp c
	jp c, _hotspots_done
	ld a, (_gpy)
	ld c, a
	ld a, (_hotspot_y)
	add 12
	cp c
	jp c, _hotspots_done
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	a,l
	ld	(_latest_hotspot),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_285
	ld	a,l
	cp	#(1% 256)
	jp	z,i_286
	cp	#(3% 256)
	jp	z,i_287
	jp	i_284
.i_286
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	jp	i_284
.i_287
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
	jp	nc,i_288
	ld	hl,99	;const
	ld	(_player+29),hl
.i_288
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,6 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_284
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_289
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_hotspot_y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_orig_tile)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
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
.i_289
	._hotspots_done
	call	_hook_mainloop
	call	sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_292
.i_290
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_292
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_291
	jp	nc,i_291
	ld	de,_en_an_morido
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_293
	ld	hl,1 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	de,_en_an_morido
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_293
	jp	i_290
.i_291
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_295
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_296_i_295
.i_295
	jp	i_294
.i_296_i_295
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	a,#(224 % 256 % 256)
	ld	(_gpx),a
	ld	hl,14336	;const
	ld	(_player),hl
	jp	i_297
.i_294
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_299
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_300_i_299
.i_299
	jp	i_298
.i_300_i_299
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,0	;const
	ld	(_player),hl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
.i_298
.i_297
	ld	hl,(_player+1+1)
	ld	de,65024	;const
	call	l_eq
	jp	nc,i_302
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_302
	ld	a,(_n_pant)
	cp	#(10 % 256)
	jr	z,i_302_uge
	jp	c,i_302
.i_302_uge
	jr	i_303_i_302
.i_302
	jp	i_301
.i_303_i_302
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-10
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	a,#(144 % 256 % 256)
	ld	(_gpy),a
	ld	hl,_player+1+1
	ld	(hl),#(9216 % 256)
	inc	hl
	ld	(hl),#(9216 / 256)
	ld	hl,_player+8
	ld	(hl),#(65280 % 256)
	inc	hl
	ld	(hl),#(65280 / 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_304
.i_301
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_306
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_307_i_306
.i_306
	jp	i_305
.i_307_i_306
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,10
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,0	;const
	ld	(_player+1+1),hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
.i_305
.i_304
	ld	a,(_game_loop_flag)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_308
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_308
	ld	a,(_player+36)
	and	a
	jp	z,i_309
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_310
	or	l
	jp	z,i_310
.i_310
.i_309
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_312
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_311
.i_312
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_311
	jp	i_260
.i_261
	jp	i_258
.i_259
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
	EI
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
	defm	"_ANDALE!"
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
.__en_y1	defs	1
.__en_x2	defs	1
.__en_y2	defs	1
._bullets_mx	defs	3
.__en_an_rfoot	defs	1
._spritesClip	defs	2
._hotspot_t	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._half_life	defs	1
._en_cx	defs	1
._en_cy	defs	1
.__en_an_state	defs	1
._flags	defs	1
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._enemy_died	defs	1
._killed_old	defs	1
._ezg_old	defs	1
._level	defs	1
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._bullets_estado	defs	3
.__en_an_feet	defs	1
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._sp_player	defs	2
._en_an_ct_j	defs	3
._gp_gen	defs	2
._sp_bullets	defs	6
._on_pant	defs	1
._enoffs	defs	1
._pad_this_frame	defs	1
._bullets_x	defs	3
._bullets_y	defs	3
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._joyfunc	defs	2
._gpcx	defs	2
._gpcy	defs	2
._fzx1	defs	1
._fzx2	defs	1
._fzy1	defs	1
._fzy2	defs	1
._rdt1	defs	1
._playing	defs	1
._gpit	defs	1
._rdt2	defs	1
._seed	defs	2
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._maincounter	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._wall	defs	1
._f_zone_ac	defs	1
.__en_an_facing	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	41
._jetpac_frame_counter	defs	1
._rdc	defs	1
._gpx	defs	1
._gpy	defs	1
._rdi	defs	1
._rdj	defs	2
._rdd	defs	1
._rdn	defs	1
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._enoffsmasi	defs	1
._new_level	defs	1
._game_loop_flag	defs	1
._latest_hotspot	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
.__en_an_lfoot	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	__en_t
	LIB	sp_ScreenStr
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_hotspots
	XDEF	_abs_a
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	XDEF	_fire_bullet
	LIB	sp_MouseAMXInit
	XDEF	_can_move_box
	XDEF	_hook_init_mainloop
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sp_moviles
	XDEF	__en_x1
	LIB	sp_SetMousePosAMX
	XDEF	__en_y1
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_HashAdd
	XDEF	__en_x2
	XDEF	__en_y2
	XDEF	_bullets_mx
	XDEF	__en_an_rfoot
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23654
	XDEF	_init_falling_box_buffer
	XDEF	_extra_enems_init
	XDEF	_spritesClip
	XDEF	_hotspot_t
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	__en_mx
	XDEF	__en_my
	XDEF	_half_life
	XDEF	_en_cx
	XDEF	_en_cy
	XDEF	_adjust_to_tile_x
	XDEF	_adjust_to_tile_y
	XDEF	_en_an_state
	defc	_en_an_state	=	23648
	XDEF	__en_an_state
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
	XDEF	_hook_system_inits
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	XDEF	_key_1
	XDEF	_key_2
	XDEF	_key_3
	LIB	sp_MoveSprRel
	XDEF	_mueve_bullets
	XDEF	_beepet
	XDEF	_play_sfx
	XDEF	_en_an_morido
	defc	_en_an_morido	=	23618
	XDEF	_gp_gen_org
	XDEF	_enemy_died
	LIB	sp_TileArray
	LIB	sp_MouseSim
	LIB	sp_BlockFit
	XDEF	_map_buff
	defc	_map_buff	=	23450
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	XDEF	_ini_x
	XDEF	_ini_y
	LIB	sp_ClearRect
	XDEF	_ezg_old
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	LIB	sp_ListAppend
	XDEF	_level
	LIB	sp_ListCreate
	LIB	sp_ListConcat
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
	XDEF	_l_crucifixes
	LIB	sp_DeleteSpr
	LIB	sp_JoyTimexEither
	XDEF	__n
	XDEF	_title_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	23645
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_player_hidden
	XDEF	_life_old
	LIB	sp_Invalidate
	XDEF	_en_ccx
	XDEF	_en_ccy
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_fall_box
	XDEF	_bullets_estado
	XDEF	__en_an_feet
	XDEF	_s_marco
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_sprite_11_a
	XDEF	_enemy_killer
	XDEF	_sprite_11_b
	XDEF	_sprite_11_c
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_sprite_12_c
	XDEF	_extra_sprite_20_a
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_extra_sprite_20_b
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
	XDEF	_extra_sprite_20_c
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_sprite_15_c
	LIB	sp_RegisterHookLast
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_HashDelete
	LIB	sp_GetCharAddr
	XDEF	_ptgmx
	XDEF	_ptgmy
	LIB	sp_RemoveHook
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	23606
	XDEF	_sprite_16_a
	XDEF	_sprite_16_b
	XDEF	_sprite_16_c
	XDEF	_extra_sprite_17_a
	XDEF	_extra_sprite_17_b
	XDEF	_extra_sprite_17_c
	XDEF	_extra_sprite_18_a
	XDEF	_extra_sprite_18_b
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_extra_sprite_18_c
	XDEF	_extra_sprite_19_a
	XDEF	_extra_sprite_19_b
	XDEF	_extra_sprite_19_c
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_sprite_19_a
	XDEF	_sp_player
	XDEF	_sprite_19_b
	XDEF	_qtile
	XDEF	_en_an_ct_j
	XDEF	_gp_gen
	XDEF	_init_player
	XDEF	_sp_bullets
	XDEF	_init_bullets
	XDEF	_draw_and_advance
	LIB	sp_GetTiles
	XDEF	_pop_and_pursue
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
	XDEF	_bullets_x
	XDEF	_bullets_y
	XDEF	_zombie_cells
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_en_j
	XDEF	_en_an_ff
	defc	_en_an_ff	=	23651
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_draw_rectangle
	LIB	sp_IntRect
	LIB	sp_ListLast
	XDEF	_scr_ini
	LIB	sp_ListCurr
	XDEF	_init_malotes
	XDEF	_enit
	XDEF	_collide_enem
	XDEF	_hook_mainloop
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
	XDEF	_fzx1
	XDEF	_fzx2
	XDEF	_fzy1
	XDEF	_fzy2
	XDEF	_rdt1
	LIB	sp_RemoveDList
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23633
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23639
	XDEF	_gpit
	XDEF	_rdt2
	XDEF	_s_title
	XDEF	_line_of_text_clear
	XDEF	_hook_entering
	LIB	sp_ListNext
	XDEF	_player_cells
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_enems_calc_frame
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_isrc
	defc	_isrc	=	23700
	XDEF	_objs_old
	XDEF	_gpxx
	XDEF	_gpyy
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_extra_enems_killed
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_move
	XDEF	_wall
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	XDEF	_f_zone_ac
	LIB	sp_MoveSprAbsNC
	XDEF	__en_an_facing
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_check_feet
	LIB	sp_ListAdd
	XDEF	_my_shr4
	LIB	sp_KeyPressed
	XDEF	_step
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_hook_init_game
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_u_free
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_new_level_string
	LIB	sp_InstallISR
	XDEF	_item_old
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	_idx
	XDEF	_en_an_x
	defc	_en_an_x	=	23621
	XDEF	_en_an_y
	defc	_en_an_y	=	23627
	XDEF	_player
	XDEF	_sprite_1_a
	XDEF	_jetpac_frame_counter
	XDEF	_sprite_1_b
	XDEF	_sprite_1_c
	XDEF	_sprite_2_a
	XDEF	_sprite_2_b
	XDEF	_sprite_2_c
	XDEF	_rdc
	LIB	sp_SwapEndian
	LIB	sp_CharLeft
	XDEF	_gpx
	XDEF	_gpy
	LIB	sp_CharDown
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	XDEF	_rdi
	XDEF	_rdj
	XDEF	_rdd
	XDEF	_rdn
	XDEF	_sprite_3_a
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_en_tocado
	XDEF	_init_player_values
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	XDEF	_sprite_4_a
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sprite_4_b
	LIB	sp_Initialize
	XDEF	_sprite_4_c
	XDEF	_sprite_5_a
	XDEF	_sprite_5_b
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_tileset
	XDEF	_sprite_5_c
	LIB	sp_ComputePos
	XDEF	_sprite_6_a
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
	XDEF	_bitmask
	XDEF	_sprite_7_a
	XDEF	_sprite_7_b
	XDEF	_sprite_7_c
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_sprite_8_c
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	XDEF	_sprite_9_c
	XDEF	_draw_2_digits
	XDEF	_ts_attr_0
	XDEF	_ts_attr_1
	XDEF	_l_ts_attr
	XDEF	_enoffsmasi
	XDEF	_new_level
	XDEF	_init_hotspots
	XDEF	_game_loop_flag
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	LIB	sp_inp
	XDEF	_latest_hotspot
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_asm_int
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
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_unpack
	LIB	sp_IterateDList
	XDEF	_max_screens
	XDEF	_draw_scr_background
	XDEF	_game_over
	XDEF	__en_an_lfoot
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
