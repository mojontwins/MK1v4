;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Nov 26 12:58:44 2020



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
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	3
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 3, 3 + 20, 1, 1 + 30
;	SECTION	text

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pant_final
	defm	""
	defb	20

;	SECTION	code


;	SECTION	text

._max_screens
	defm	"H"
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
;	SECTION	text

._mapa
	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDE"
	defb	0

	defm	""
	defb	0

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

	defm	"R"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"U"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	"-"
	defb	220

	defm	""
	defb	197

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"U"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	2

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"R"
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
	defb	224

	defm	"U"
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

	defm	"P0"
	defb	0

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
	defb	3

	defm	""
	defb	221

	defm	"DDDDDDDDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	" "
	defb	2

	defm	"%"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	" R "
	defb	0

	defm	"'uwr%"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	"\0"
	defb	0

	defm	""
	defb	2

	defm	"%"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	149

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDGww"
	defb	0

	defm	""
	defb	0

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

	defm	" "
	defb	0

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

	defm	""
	defb	34

	defm	""
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

	defm	" "
	defb	0

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
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"wr"
	defb	34

	defm	""
	defb	34

	defm	" "
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

	defm	" "
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

	defm	" "
	defb	0

	defm	""
	defb	2

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
	defb	0

	defm	""
	defb	7

	defm	"wwwwp"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	9

	defm	"i"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	146

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"r"
	defb	8

	defm	""
	defb	137

	defm	"i"
	defb	150

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	"r"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"x"
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
	defb	34

	defm	""
	defb	34

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	150

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	153

	defm	"x"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	153

	defm	"ix"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	150

	defm	"fiiwx"
	defb	137

	defm	"DDDDDDDD "
	defb	1

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	2

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	228

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	""
	defb	0

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

	defm	"@"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	""
	defb	0

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

	defm	"I"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"Dgw"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDDDD@"
	defb	11

	defm	" "
	defb	1

	defm	" "
	defb	16

	defm	" "
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

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"p"
	defb	0

	defm	""
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	187

	defm	""
	defb	203

	defm	""
	defb	187

	defm	"PK"
	defb	188

	defm	""
	defb	203

	defm	"L"
	defb	192

	defm	""
	defb	204

	defm	""
	defb	181

	defm	""
	defb	164

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	196

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	12

	defm	"D@"
	defb	0

	defm	""
	defb	0

	defm	"DDDDDDD@"
	defb	1

	defm	""
	defb	2

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	18

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	196

	defm	""
	defb	5

	defm	"K"
	defb	204

	defm	""
	defb	203

	defm	"kU"
	defb	192

	defm	"JT"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	196

	defm	"P"
	defb	4

	defm	"D@"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"DDDDDDDD@!"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	16

	defm	""
	defb	2

	defm	"$"
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

	defm	"@"
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

	defm	"0"
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
	defb	0

	defm	""
	defb	0

	defm	"t"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"EUU"
	defb	14

	defm	"a "
	defb	0

	defm	""
	defb	4

	defm	"Z"
	defb	224

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

	defm	"DDww"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

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
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	213

	defm	"XU"
	defb	133

	defm	""
	defb	128

	defm	""
	defb	2

	defm	" "
	defb	0

	defm	"X"
	defb	136

	defm	""
	defb	128

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	" "
	defb	5

	defm	"P"
	defb	0

	defm	"!"
	defb	18

	defm	"! "
	defb	0

	defm	""
	defb	133

	defm	""
	defb	128

	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	8

	defm	"Xhf"
	defb	166

	defm	"XeXX"
	defb	8

	defm	""
	defb	22

	defm	""
	defb	138

	defm	""
	defb	136

	defm	""
	defb	24

	defm	""
	defb	136

	defm	""
	defb	5

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	161

	defm	"!"
	defb	2

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	26

	defm	" "
	defb	2

	defm	""
	defb	0

	defm	""
	defb	149

	defm	"V"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	"f"
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
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"  "
	defb	13

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	214

	defm	"k"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	182

	defm	"m"
	defb	136

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	136

	defm	""
	defb	210

	defm	""
	defb	18

	defm	""
	defb	16

	defm	"!"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	25

	defm	" ) "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"ffffffm"
	defb	211

	defm	"333=3"
	defb	211

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	18

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	19

	defm	"30!"
	defb	16

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	2

	defm	" "
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	2

	defm	"0"
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"330"
	defb	1

	defm	"  "
	defb	0

	defm	"="
	defb	208

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"! "
	defb	3

	defm	""
	defb	221

	defm	""
	defb	211

	defm	""
	defb	211

	defm	""
	defb	211

	defm	"3"
	defb	170

	defm	""
	defb	163

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"33333"
	defb	136

	defm	"e`"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	" !"
	defb	21

	defm	""
	defb	133

	defm	""
	defb	2

	defm	" @"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	21

	defm	"c33"
	defb	204

	defm	""
	defb	192

	defm	"!"
	defb	17

	defm	""
	defb	133

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	18

	defm	"!"
	defb	129

	defm	" "
	defb	4

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"$330"
	defb	1

	defm	""
	defb	2

	defm	""
	defb	12

	defm	""
	defb	204

	defm	"@"
	defb	144

	defm	"ei"
	defb	0

	defm	""
	defb	17

	defm	" "
	defb	4

	defm	""
	defb	213

	defm	"e"
	defb	133

	defm	""
	defb	204

	defm	""
	defb	2

	defm	"!"
	defb	0

	defm	"M"
	defb	133

	defm	""
	defb	129

	defm	""
	defb	130

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	4

	defm	"P0"
	defb	5

	defm	"DDDDEw"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P0"
	defb	213

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"U"
	defb	3

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"P0"
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	34

	defm	""
	defb	0

	defm	"]"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"R"
	defb	34

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"U"
	defb	34

	defm	" P"
	defb	0

	defm	""
	defb	150

	defm	""
	defb	34

	defm	"%R "
	defb	5

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	153

	defm	""
	defb	34

	defm	"U"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	4

	defm	"DDDDDDDEwwp"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	"P"
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	213

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"%"
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"R "
	defb	2

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"% "
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

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	213

	defm	""
	defb	0

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

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDD]"
	defb	208

	defm	""
	defb	221

	defm	"wwwww"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	146

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

	defm	""
	defb	9

	defm	""
	defb	153

	defm	"'ww"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	"&"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	""
	defb	34

	defm	"`"
	defb	34

	defm	""
	defb	34

	defm	"'"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	0

	defm	""
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

	defm	"`"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	34

	defm	")"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"ww"
	defb	34

	defm	""
	defb	151

	defm	""
	defb	0

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
	defb	217

	defm	""
	defb	150

	defm	"i"
	defb	153

	defm	""
	defb	153

	defm	"ii"
	defb	136

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
	defb	134

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	"h"
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
	defb	137

	defm	"h"
	defb	134

	defm	"h"
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
	defb	153

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	214

	defm	""
	defb	136

	defm	"i"
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

	defm	""
	defb	150

	defm	"x"
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
	defb	137

	defm	"ix"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	151

	defm	""
	defb	150

	defm	""
	defb	153

	defm	""
	defb	136

	defm	"wwww"
	defb	153

	defm	"F"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"De"
	defb	0

	defm	"330"
	defb	0

	defm	""
	defb	4

	defm	"CD"
	defb	3

	defm	"33"
	defb	0

	defm	""
	defb	0

	defm	"DD@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"D4w"
	defb	0

	defm	""
	defb	7

	defm	"wwDD@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	"D @"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	215

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	"p"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	"Dp@"
	defb	0

	defm	"@w"
	defb	208

	defm	"t@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	196

	defm	"D"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	20

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@0"
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
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"D@"
	defb	0

	defm	""
	defb	0

	defm	"DDDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"!"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	"E"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"@twtDD"
	defb	0

	defm	"DD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	0

	defm	""
	defb	16

	defm	" "
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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"DDDDDDG"
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	221

	defm	""
	defb	253

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	223

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"DDDDDD"
	defb	0

	defm	"A"
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
	defb	0

	defm	"T"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D@"
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
	defb	13

	defm	""
	defb	212

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"D"
	defb	221

	defm	"DDDDD"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	228

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

	defm	"N"
	defb	208

	defm	"@"
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

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	221

	defm	""
	defb	253

	defm	""
	defb	253

	defm	""
	defb	212

	defm	"DDDM"
	defb	221

	defm	"="
	defb	211

	defm	"3="
	defb	221

	defm	""
	defb	212

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
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	17

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

	defm	"D! "
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	196

	defm	"@ "
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	""
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"B"
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	6

	defm	"4"
	defb	0

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
	defb	141

	defm	"@"
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
	defb	133

	defm	"4"
	defb	128

	defm	""
	defb	6

	defm	"efUe"
	defb	141

	defm	"="
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	211

	defm	"=="
	defb	208

	defm	""
	defb	0

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

	defm	"@"
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	194

	defm	""
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	1

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"@"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	18

	defm	" "
	defb	20

	defm	""
	defb	0

	defm	""
	defb	146

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"! 0"
	defb	5

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	29

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	128

	defm	"  @"
	defb	13

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	180

	defm	"3"
	defb	221

	defm	""
	defb	218

	defm	""
	defb	170

	defm	""
	defb	221

	defm	""
	defb	2

	defm	""
	defb	18

	defm	" "
	defb	208

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	160

	defm	"!"
	defb	17

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" 0 "
	defb	0

	defm	""
	defb	3

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	"-"
	defb	18

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	209

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	2

	defm	""
	defb	0

	defm	"3"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	18

	defm	" ="
	defb	208

	defm	""
	defb	0

	defm	""
	defb	210

	defm	""
	defb	16

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	209

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	173

	defm	""
	defb	221

	defm	""
	defb	221

	defm	" "
	defb	3

	defm	"33"
	defb	170

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	128

	defm	"("
	defb	210

	defm	""
	defb	129

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

	defm	"C"
	defb	17

	defm	"!"
	defb	2

	defm	""
	defb	12

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	196

	defm	""
	defb	209

	defm	""
	defb	34

	defm	""
	defb	16

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"C"
	defb	17

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
	defb	4

	defm	""
	defb	210

	defm	""
	defb	0

	defm	" "
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	16

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

	defm	"@"
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	"H"
	defb	0

	defm	""
	defb	139

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	180

	defm	"P"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	170

	defm	"DDDE"
	defb	0

	defm	""
	defb	2

	defm	"Z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	2

	defm	"%"
	defb	170

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"Z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	"%"
	defb	169

	defm	""
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

	defm	"Z"
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	5

	defm	"DDDDE"
	defb	34

	defm	""
	defb	34

	defm	"Z"
	defb	170

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	170

	defm	"R"
	defb	34

	defm	"%"
	defb	170

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

	defm	"ZDDDDDDDDE"
	defb	0

	defm	""
	defb	0

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R"
	defb	34

	defm	"'"
	defb	170

	defm	""
	defb	186

	defm	""
	defb	165

	defm	"J"
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	"R"
	defb	34

	defm	"'"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	170

	defm	"E"
	defb	34

	defm	""
	defb	34

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	"R"
	defb	34

	defm	"'DDDJ"
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"z"
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	186

	defm	"P0"
	defb	7

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	149

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"tDDDDP0"
	defb	7

	defm	"p"
	defb	13

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
	defb	0

	defm	""
	defb	6

	defm	"r#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	6

	defm	"g"
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"fr"
	defb	34

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	"0"
	defb	6

	defm	"g"
	defb	34

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

	defm	"ir"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	151

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

	defm	"&p"
	defb	2

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

	defm	""
	defb	151

	defm	"wwpwwwy"
	defb	150

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"i"
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

	defm	""
	defb	150

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	134

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
	defb	150

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"f"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

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
	defb	156

	defm	"i"
	defb	156

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

	defm	"h"
	defb	153

	defm	""
	defb	151

	defm	""
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
	defb	137

	defm	""
	defb	153

	defm	""
	defb	151

	defm	""
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
	defb	153

	defm	"i"
	defb	151

	defm	"www"
	defb	136

	defm	"y@"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	"D"
	defb	7

	defm	"@"
	defb	7

	defm	"D@"
	defb	215

	defm	""
	defb	4

	defm	"@"
	defb	4

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

	defm	"DpE"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"@t@"
	defb	4

	defm	"U"
	defb	0

	defm	""
	defb	5

	defm	"T"
	defb	0

	defm	"D"
	defb	7

	defm	"DDDDG"
	defb	4

	defm	"@"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	" "
	defb	0

	defm	"Dp"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"t@"
	defb	14

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	144

	defm	""
	defb	6

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	"DDD"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"q"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"C"
	defb	0

	defm	"0"
	defb	0

	defm	"D"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	7

	defm	"C"
	defb	0

	defm	"0"
	defb	0

	defm	"D"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"C"
	defb	7

	defm	"0"
	defb	0

	defm	"D"
	defb	0

	defm	"@"
	defb	4

	defm	"0"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"D"
	defb	0

	defm	"@t@"
	defb	4

	defm	"DDDDDDDDD@"
	defb	34

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

	defm	"N"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	237

	defm	""
	defb	224

	defm	""
	defb	13

	defm	""
	defb	228

	defm	""
	defb	13

	defm	""
	defb	237

	defm	""
	defb	222

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	224

	defm	"@"
	defb	224

	defm	""
	defb	222

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"P"
	defb	0

	defm	"M"
	defb	237

	defm	""
	defb	222

	defm	""
	defb	221

	defm	""
	defb	222

	defm	"EP"
	defb	4

	defm	""
	defb	228

	defm	""
	defb	238

	defm	"N"
	defb	222

	defm	"DDDDDDNDDDDDDDD@! "
	defb	2

	defm	""
	defb	4

	defm	""
	defb	34

	defm	""
	defb	18

	defm	"$"
	defb	238

	defm	""
	defb	237

	defm	""
	defb	237

	defm	""
	defb	222

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	237

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	4

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
	defb	3

	defm	""
	defb	3

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

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"n"
	defb	222

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"NM"
	defb	224

	defm	""
	defb	0

	defm	"@00DD"
	defb	228

	defm	"p"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"H"
	defb	0

	defm	""
	defb	136

	defm	"U"
	defb	134

	defm	"U"
	defb	133

	defm	""
	defb	212

	defm	""
	defb	133

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	129

	defm	""
	defb	134

	defm	""
	defb	134

	defm	"]M"
	defb	221

	defm	""
	defb	204

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	24

	defm	""
	defb	212

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
	defb	17

	defm	""
	defb	19

	defm	"@"
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
	defb	18

	defm	"D"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	4

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	" D"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	13

	defm	"@"
	defb	137

	defm	""
	defb	9

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	212

	defm	"fjfff`"
	defb	3

	defm	""
	defb	211

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"="
	defb	211

	defm	"="
	defb	221

	defm	""
	defb	2

	defm	""
	defb	16

	defm	"!"
	defb	18

	defm	"!!"
	defb	13

	defm	""
	defb	210

	defm	""
	defb	18

	defm	"!"
	defb	2

	defm	""
	defb	0

	defm	" "
	defb	18

	defm	"]"
	defb	18

	defm	""
	defb	16

	defm	" 0"
	defb	0

	defm	" "
	defb	21

	defm	"B"
	defb	18

	defm	""
	defb	2

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	132

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"=@ "
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"="
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
	defb	3

	defm	""
	defb	208

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	166

	defm	"ffff`"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	218

	defm	""
	defb	173

	defm	""
	defb	221

	defm	""
	defb	136

	defm	" "
	defb	141

	defm	""
	defb	146

	defm	""
	defb	24

	defm	""
	defb	170

	defm	""
	defb	17

	defm	""
	defb	129

	defm	""
	defb	18

	defm	""
	defb	3

	defm	"Xh"
	defb	138

	defm	"b"
	defb	5

	defm	" !"
	defb	216

	defm	"("
	defb	8

	defm	""
	defb	136

	defm	""
	defb	2

	defm	""
	defb	128

	defm	""
	defb	34

	defm	""
	defb	3

	defm	"P "
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
	defb	221

	defm	""
	defb	170

	defm	"X"
	defb	134

	defm	"V"
	defb	134

	defm	"X]"
	defb	218

	defm	""
	defb	168

	defm	""
	defb	170

	defm	""
	defb	136

	defm	""
	defb	138

	defm	""
	defb	136

	defm	""
	defb	168

	defm	""
	defb	221

	defm	""
	defb	136

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	173

	defm	"8X"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	221

	defm	"VV"
	defb	136

	defm	"V"
	defb	133

	defm	""
	defb	133

	defm	""
	defb	141

	defm	""
	defb	128

	defm	""
	defb	5

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

	defm	"M"
	defb	144

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
	defb	4

	defm	""
	defb	220

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	2

	defm	""
	defb	16

	defm	""
	defb	17

	defm	"!"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	196

	defm	""
	defb	208

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	17

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	208

	defm	""
	defb	17

	defm	"!!"
	defb	34

	defm	""
	defb	28

	defm	""
	defb	204

	defm	"M"
	defb	0

	defm	" "
	defb	34

	defm	" ! "
	defb	4

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	12

	defm	""
	defb	204

	defm	"C"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"R"
	defb	34

	defm	"%"
	defb	164

	defm	"DDDE"
	defb	2

	defm	""
	defb	34

	defm	"Z"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"P"
	defb	3

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"%"
	defb	0

	defm	"0P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	3

	defm	""
	defb	13

	defm	""
	defb	222

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	3

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

	defm	""
	defb	5

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

	defm	"J"
	defb	170

	defm	"R"
	defb	34

	defm	"!"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"L"
	defb	204

	defm	""
	defb	196

	defm	"J"
	defb	164

	defm	"DDDDE"
	defb	3

	defm	""
	defb	0

	defm	"r"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P0"
	defb	0

	defm	" P"
	defb	0

	defm	""
	defb	34

	defm	"%"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"]"
	defb	221

	defm	""
	defb	221

	defm	"%"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"R"
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

	defm	"%"
	defb	34

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

	defm	""
	defb	150

	defm	"P"
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
	defb	166

	defm	""
	defb	149

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDGwwwww"
	defb	7

	defm	"www"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"&"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"0i"
	defb	0

	defm	"ww"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"`"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	9

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

	defm	"#"
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"gwwwww"
	defb	34

	defm	")"
	defb	153

	defm	""
	defb	150

	defm	""
	defb	153

	defm	"iih"
	defb	134

	defm	"fh"
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
	defb	150

	defm	""
	defb	153

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

	defm	""
	defb	134

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
	defb	137

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

	defm	""
	defb	153

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

	defm	"y"
	defb	151

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

	defm	"v"
	defb	150

	defm	""
	defb	151

	defm	""
	defb	136

	defm	""
	defb	135

	defm	"wwvi@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	224

	defm	""
	defb	0

	defm	"000"
	defb	0

	defm	"d@"
	defb	6

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

	defm	"D"
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	4

	defm	"F"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"D "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"$@"
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	160

	defm	""
	defb	0

	defm	"DP"
	defb	0

	defm	" "
	defb	0

	defm	" "
	defb	0

	defm	"TKP"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"UD"
	defb	203

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	196

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	"DDD"
	defb	0

	defm	"@"
	defb	1

	defm	"@"
	defb	0

	defm	"!"
	defb	0

	defm	"@"
	defb	4

	defm	""
	defb	0

	defm	"4"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	4

	defm	"p"
	defb	4

	defm	""
	defb	237

	defm	""
	defb	237

	defm	""
	defb	238

	defm	""
	defb	237

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	" "
	defb	224

	defm	""
	defb	226

	defm	""
	defb	16

	defm	""
	defb	208

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
	defb	13

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	218

	defm	""
	defb	173

	defm	""
	defb	0

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
	defb	221

	defm	""
	defb	238

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	222

	defm	""
	defb	238

	defm	"DDDDDDD@"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	" "
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0003"
	defb	3

	defm	""
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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	222

	defm	""
	defb	253

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	222

	defm	""
	defb	254

	defm	""
	defb	222

	defm	""
	defb	238

	defm	" "
	defb	224

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	34

	defm	""
	defb	14

	defm	""
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	18

	defm	""
	defb	224

	defm	""
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
	defb	14

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	222

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	237

	defm	""
	defb	238

	defm	"DD@"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"t"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"00@"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	4

	defm	"p"
	defb	4

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	4

	defm	""
	defb	238

	defm	""
	defb	222

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"@."
	defb	14

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	3

	defm	""
	defb	3

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

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	16

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	"M"
	defb	222

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	222

	defm	"DDM"
	defb	221

	defm	""
	defb	173

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	212

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
	defb	208

	defm	""
	defb	0

	defm	"A "
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
	defb	4

	defm	""
	defb	16

	defm	" "
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"@"
	defb	2

	defm	""
	defb	18

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	16

	defm	"@"
	defb	0

	defm	"  "
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	20

	defm	""
	defb	1

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	138

	defm	""
	defb	170

	defm	""
	defb	168

	defm	""
	defb	170

	defm	"j"
	defb	164

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	170

	defm	""
	defb	218

	defm	""
	defb	221

	defm	"="
	defb	221

	defm	"3"
	defb	221

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	3

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	204

	defm	"0"
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
	defb	13

	defm	""
	defb	0

	defm	""
	defb	4

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
	defb	208

	defm	""
	defb	0

	defm	"@"
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	4

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

	defm	"0"
	defb	0

	defm	"@"
	defb	0

	defm	" !"
	defb	9

	defm	""
	defb	13

	defm	""
	defb	170

	defm	""
	defb	164

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"i"
	defb	218

	defm	""
	defb	170

	defm	""
	defb	134

	defm	"fffhe=="
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
	defb	0

	defm	"!"
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	208

	defm	""
	defb	9

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	25

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	"P"
	defb	1

	defm	" "
	defb	133

	defm	""
	defb	0

	defm	""
	defb	13

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	" "
	defb	128

	defm	""
	defb	128

	defm	""
	defb	12

	defm	"="
	defb	9

	defm	"@"
	defb	8

	defm	" "
	defb	17

	defm	" "
	defb	13

	defm	""
	defb	217

	defm	""
	defb	132

	defm	""
	defb	0

	defm	" "
	defb	17

	defm	" "
	defb	0

	defm	"3( "
	defb	2

	defm	" fff0"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	184

	defm	"XX"
	defb	134

	defm	"fk"
	defb	182

	defm	"XU"
	defb	136

	defm	"U"
	defb	211

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	213

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	"!"
	defb	18

	defm	"CX"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	4

	defm	""
	defb	216

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"! M "
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	4

	defm	""
	defb	208

	defm	""
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	0

	defm	""
	defb	1

	defm	" E`"
	defb	2

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"$"
	defb	133

	defm	""
	defb	128

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	2

	defm	""
	defb	0

	defm	" E"
	defb	133

	defm	"`"
	defb	2

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"P"
	defb	3

	defm	""
	defb	4

	defm	"DDD"
	defb	170

	defm	"E"
	defb	0

	defm	"0"
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	"R"
	defb	34

	defm	"!"
	defb	170

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	"U"
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

	defm	"R"
	defb	34

	defm	"!"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"U"
	defb	34

	defm	" "
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	"P0"
	defb	1

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	"U"
	defb	3

	defm	""
	defb	0

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

	defm	"R "
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"U"
	defb	34

	defm	" DDDDDDDDDD"
	defb	7

	defm	"wu"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"Z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"wwu"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	18

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"]"
	defb	221

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	161

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"%"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"Z"
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
	defb	3

	defm	""
	defb	5

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"2Z"
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
	defb	2

	defm	"$DDDD@"
	defb	0

	defm	"wwwwwwr"
	defb	34

	defm	""
	defb	146

	defm	""
	defb	34

	defm	" "
	defb	3

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	150

	defm	"wwwp"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	150

	defm	""
	defb	146

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	"wwv"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	146

	defm	" "
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"6i"
	defb	34

	defm	" "
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	6

	defm	"i"
	defb	151

	defm	"wwww"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"h"
	defb	136

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"ih"
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
	defb	153

	defm	""
	defb	152

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

	defm	"i"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"ii"
	defb	136

	defm	""
	defb	134

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
	defb	137

	defm	""
	defb	136

	defm	""
	defb	153

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

	defm	""
	defb	137

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
	defb	137

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
	defb	137

	defm	""
	defb	151

	defm	""
	defb	204

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	199

	defm	""
	defb	153

	defm	""
	defb	151

	defm	"wwx"
	defb	135

	defm	"w"
	defb	153

	defm	"DD"
	defb	0

	defm	"DDDDD"
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" @"
	defb	14

	defm	""
	defb	0

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
	defb	188

	defm	"@"
	defb	0

	defm	""
	defb	188

	defm	"D"
	defb	187

	defm	""
	defb	0

	defm	"K!"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	","
	defb	181

	defm	""
	defb	4

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	240

	defm	""
	defb	12

	defm	"D@"
	defb	0

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	4

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"T"
	defb	197

	defm	"P"
	defb	0

	defm	"EP"
	defb	0

	defm	"UDUP"
	defb	4

	defm	"L"
	defb	187

	defm	""
	defb	188

	defm	"DDDDMDDDDDD@"
	defb	226

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	234

	defm	""
	defb	170

	defm	""
	defb	160

	defm	""
	defb	238

	defm	""
	defb	0

	defm	"dD"
	defb	180

	defm	"DK"
	defb	196

	defm	"DD"
	defb	1

	defm	""
	defb	12

	defm	"ff"
	defb	194

	defm	""
	defb	0

	defm	" "
	defb	0

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

	defm	"f`"
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ffdDDDDDDDDDDDDDD@ "
	defb	0

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	1

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"00"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

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

	defm	"ff"
	defb	136

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	172

	defm	""
	defb	180

	defm	"DDDDDDD"
	defb	2

	defm	""
	defb	6

	defm	"f"
	defb	0

	defm	" "
	defb	16

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	2

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

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"f"
	defb	0

	defm	""
	defb	4

	defm	"DDDDDDDDDDDDDD@ !"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"0"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"0"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	188

	defm	""
	defb	188

	defm	"w"
	defb	204

	defm	""
	defb	205

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"ll"
	defb	224

	defm	""
	defb	2

	defm	""
	defb	226

	defm	""
	defb	221

	defm	""
	defb	7

	defm	"` "
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	224

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"`"
	defb	0

	defm	"@"
	defb	0

	defm	"dDDDD"
	defb	4

	defm	"wtJ"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	138

	defm	""
	defb	164

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"L"
	defb	204

	defm	""
	defb	170

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	196

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	6

	defm	""
	defb	144

	defm	""
	defb	4

	defm	""
	defb	12

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	134

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
	defb	0

	defm	""
	defb	134

	defm	"t"
	defb	18

	defm	""
	defb	2

	defm	"!"
	defb	204

	defm	""
	defb	194

	defm	""
	defb	18

	defm	""
	defb	135

	defm	"Q"
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
	defb	29

	defm	"u"
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
	defb	135

	defm	""
	defb	170

	defm	""
	defb	163

	defm	"3333XZ"
	defb	170

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"e"
	defb	133

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	135

	defm	"p"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"Ww"
	defb	0

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	"wp"
	defb	6

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"wwv"
	defb	128

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"wwZ"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	2

	defm	"Vf"
	defb	170

	defm	"x"
	defb	170

	defm	""
	defb	170

	defm	"b"
	defb	24

	defm	"U"
	defb	134

	defm	"g"
	defb	139

	defm	""
	defb	187

	defm	""
	defb	189

	defm	""
	defb	18

	defm	""
	defb	221

	defm	"UXU"
	defb	133

	defm	""
	defb	133

	defm	"X"
	defb	133

	defm	""
	defb	136

	defm	"X"
	defb	136

	defm	"UXXw"
	defb	135

	defm	"xwx"
	defb	135

	defm	"wwwwgwwwwwwxwwwwwwwX"
	defb	135

	defm	"wwwwwuwwww"
	defb	135

	defm	"wwWz"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	168

	defm	"wf"
	defb	187

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	187

	defm	""
	defb	135

	defm	"xfffffff"
	defb	133

	defm	""
	defb	133

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	17

	defm	" "
	defb	0

	defm	"G"
	defb	135

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	20

	defm	"www`"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	2

	defm	"Gwwx`"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	4

	defm	""
	defb	135

	defm	"w"
	defb	204

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	16

	defm	"Gwwf"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	4

	defm	"wwxP`"
	defb	34

	defm	""
	defb	18

	defm	"GwXX"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	20

	defm	"wXh"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	"Fem"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"R"
	defb	34

	defm	""
	defb	4

	defm	"DDDDE"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P0"
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
	defb	165

	defm	""
	defb	3

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
	defb	170

	defm	"P"
	defb	34

	defm	"$DDDDE"
	defb	2

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
	defb	170

	defm	"DB!"
	defb	170

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	160

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"ww"
	defb	0

	defm	"wwwwx"
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
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"DDDDD"
	defb	0

	defm	""
	defb	7

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	9

	defm	""
	defb	34

	defm	""
	defb	170

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

	defm	"wz"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	"r"
	defb	34

	defm	"DDDDD"
	defb	0

	defm	""
	defb	2

	defm	"*"
	defb	170

	defm	""
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
	defb	170

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	161

	defm	""
	defb	34

	defm	" "
	defb	7

	defm	"wwwwww "
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
	defb	135

	defm	"x"
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
	defb	136

	defm	"wwwwyff"
	defb	146

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	""
	defb	6

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"wr"
	defb	34

	defm	"&"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	130

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	"9"
	defb	200

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"`0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	134

	defm	"li"
	defb	136

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	128

	defm	"0"
	defb	0

	defm	""
	defb	15

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"wwww"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	150

	defm	"iigwww"
	defb	153

	defm	"ffi"
	defb	136

	defm	"fi"
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

	defm	"i"
	defb	136

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"iih"
	defb	136

	defm	""
	defb	137

	defm	"i"
	defb	201

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	150

	defm	""
	defb	152

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

	defm	"h"
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
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	140

	defm	"h"
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

	defm	""
	defb	153

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
	defb	140

	defm	""
	defb	150

	defm	""
	defb	151

	defm	"wwwwww"
	defb	153

	defm	"DDDDDDDD"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"  N"
	defb	14

	defm	">"
	defb	224

	defm	"0"
	defb	0

	defm	"0"
	defb	4

	defm	"wp"
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	"0"
	defb	0

	defm	"0"
	defb	0

	defm	"0"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	"0"
	defb	0

	defm	"0"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	223

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	173

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
	defb	212

	defm	"DDDDDDDDDDDDDD@"
	defb	2

	defm	""
	defb	1

	defm	" "
	defb	0

	defm	""
	defb	16

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"wwwww"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	3

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
	defb	3

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	187

	defm	""
	defb	188

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	188

	defm	""
	defb	203

	defm	"L"
	defb	188

	defm	""
	defb	187

	defm	""
	defb	203

	defm	""
	defb	4

	defm	"LD"
	defb	196

	defm	"L"
	defb	236

	defm	"D"
	defb	196

	defm	"DDDDDDD@ "
	defb	1

	defm	""
	defb	0

	defm	" "
	defb	16

	defm	" "
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	3

	defm	""
	defb	14

	defm	""
	defb	238

	defm	""
	defb	235

	defm	""
	defb	189

	defm	""
	defb	189

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	188

	defm	""
	defb	204

	defm	""
	defb	188

	defm	""
	defb	203

	defm	""
	defb	205

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	3

	defm	""
	defb	192

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	194

	defm	""
	defb	0

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

	defm	"@"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDDDDDDDD@@"
	defb	0

	defm	"@"
	defb	2

	defm	""
	defb	1

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	208

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"0"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"0"
	defb	13

	defm	"@"
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	166

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
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"M "
	defb	225

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	16

	defm	""
	defb	208

	defm	""
	defb	4

	defm	""
	defb	224

	defm	"0"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"0"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	"j"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	166

	defm	""
	defb	0

	defm	""
	defb	13

	defm	"DDDDDDDD]"
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
	defb	216

	defm	"u"
	defb	0

	defm	" "
	defb	34

	defm	" "
	defb	2

	defm	""
	defb	0

	defm	""
	defb	135

	defm	""
	defb	133

	defm	"`!"
	defb	17

	defm	""
	defb	34

	defm	""
	defb	18

	defm	"eu"
	defb	133

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	2

	defm	""
	defb	149

	defm	""
	defb	135

	defm	"U"
	defb	134

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	6

	defm	""
	defb	133

	defm	"x"
	defb	133

	defm	""
	defb	128

	defm	"! "
	defb	9

	defm	""
	defb	133

	defm	""
	defb	135

	defm	"U"
	defb	128

	defm	" "
	defb	0

	defm	""
	defb	9

	defm	"e"
	defb	133

	defm	"u"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	166

	defm	"f"
	defb	135

	defm	"xwUfgwwwwveU"
	defb	133

	defm	""
	defb	133

	defm	"X"
	defb	133

	defm	"Xx"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	210

	defm	""
	defb	29

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	215

	defm	"Q"
	defb	18

	defm	""
	defb	18

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	"ub"
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	135

	defm	""
	defb	133

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"u"
	defb	134

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"!"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	7

	defm	""
	defb	133

	defm	""
	defb	134

	defm	""
	defb	9

	defm	""
	defb	0

	defm	" "
	defb	2

	defm	""
	defb	16

	defm	"w"
	defb	136

	defm	""
	defb	134

	defm	"fi"
	defb	0

	defm	""
	defb	144

	defm	""
	defb	7

	defm	"wwwxxx"
	defb	136

	defm	"wwwwwwwx"
	defb	136

	defm	"XU"
	defb	136

	defm	"U"
	defb	133

	defm	""
	defb	133

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
	defb	221

	defm	""
	defb	208

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	"!"
	defb	136

	defm	""
	defb	2

	defm	""
	defb	134

	defm	"h"
	defb	2

	defm	""
	defb	136

	defm	"h"
	defb	130

	defm	"  "
	defb	133

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"("
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	2

	defm	""
	defb	128

	defm	""
	defb	0

	defm	" "
	defb	34

	defm	""
	defb	18

	defm	""
	defb	2

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	9

	defm	"  "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	151

	defm	""
	defb	234

	defm	"ffjfh"
	defb	133

	defm	"xU"
	defb	136

	defm	"V"
	defb	168

	defm	"Xx"
	defb	133

	defm	""
	defb	135

	defm	"Wv"
	defb	133

	defm	""
	defb	136

	defm	"ww"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"B $"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"!"
	defb	4

	defm	"hh"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	18

	defm	""
	defb	136

	defm	""
	defb	24

	defm	""
	defb	0

	defm	""
	defb	18

	defm	""
	defb	129

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	5

	defm	""
	defb	2

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	18

	defm	"  "
	defb	9

	defm	"P"
	defb	1

	defm	" "
	defb	2

	defm	""
	defb	0

	defm	" "
	defb	6

	defm	"h"
	defb	0

	defm	"  "
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	136

	defm	"h"
	defb	134

	defm	"j"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	166

	defm	"hUw"
	defb	133

	defm	"j"
	defb	166

	defm	"VeX"
	defb	135

	defm	"w"
	defb	133

	defm	"le"
	defb	133

	defm	"Xe"
;	SECTION	code


;	SECTION	text

._cerrojos
	defb	18
	defb	3
	defb	9
	defb	0
	defb	18
	defb	10
	defb	9
	defb	0
	defb	19
	defb	3
	defb	9
	defb	0
	defb	19
	defb	5
	defb	9
	defb	0
	defb	42
	defb	2
	defb	4
	defb	0
	defb	42
	defb	10
	defb	4
	defb	0
	defb	52
	defb	9
	defb	5
	defb	0
	defb	53
	defb	3
	defb	4
	defb	0
	defb	54
	defb	2
	defb	3
	defb	0
	defb	62
	defb	6
	defb	7
	defb	0
	defb	64
	defb	8
	defb	7
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
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 16, 224
	defb 96, 128
	defb 144, 0
	defb 144, 0
	defb 161, 0
	defb 129, 0
	defb 96, 128
	defb 27, 224
	defb 3, 240
	defb 7, 224
	defb 23, 192
	defb 30, 192
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
	defb 224, 31
	defb 24, 7
	defb 4, 3
	defb 4, 3
	defb 104, 7
	defb 160, 15
	defb 160, 15
	defb 96, 15
	defb 128, 15
	defb 192, 15
	defb 96, 15
	defb 128, 7
	defb 176, 3
	defb 120, 1
	defb 28, 1
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
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 16, 224
	defb 96, 128
	defb 144, 0
	defb 144, 0
	defb 161, 0
	defb 131, 0
	defb 98, 128
	defb 27, 224
	defb 5, 240
	defb 6, 240
	defb 3, 240
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
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 4, 3
	defb 68, 3
	defb 168, 7
	defb 160, 15
	defb 96, 15
	defb 128, 15
	defb 224, 15
	defb 96, 15
	defb 64, 15
	defb 128, 31
	defb 128, 63
	defb 128, 63
	defb 192, 31
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
	defb 0, 255
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 16, 224
	defb 96, 128
	defb 144, 0
	defb 144, 0
	defb 161, 0
	defb 131, 0
	defb 98, 128
	defb 20, 224
	defb 1, 240
	defb 1, 224
	defb 26, 192
	defb 28, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 0, 255
	defb 224, 31
	defb 24, 7
	defb 4, 3
	defb 4, 3
	defb 104, 7
	defb 160, 15
	defb 160, 15
	defb 96, 15
	defb 128, 15
	defb 224, 15
	defb 224, 15
	defb 192, 7
	defb 240, 3
	defb 248, 1
	defb 28, 1
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
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 16, 224
	defb 112, 128
	defb 144, 0
	defb 144, 0
	defb 160, 0
	defb 135, 0
	defb 64, 128
	defb 56, 192
	defb 1, 248
	defb 5, 240
	defb 6, 224
	defb 12, 192
	defb 24, 193
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_4_b
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 4, 3
	defb 68, 3
	defb 168, 7
	defb 160, 15
	defb 96, 15
	defb 128, 15
	defb 224, 15
	defb 224, 15
	defb 192, 7
	defb 240, 3
	defb 248, 1
	defb 28, 1
	defb 0, 193
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
	defb 7, 248
	defb 24, 224
	defb 32, 192
	defb 32, 192
	defb 22, 224
	defb 5, 240
	defb 5, 240
	defb 6, 240
	defb 1, 240
	defb 7, 240
	defb 7, 240
	defb 3, 224
	defb 15, 192
	defb 31, 128
	defb 56, 128
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
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 8, 7
	defb 6, 1
	defb 9, 0
	defb 9, 0
	defb 133, 0
	defb 193, 0
	defb 70, 1
	defb 40, 7
	defb 128, 15
	defb 128, 7
	defb 88, 3
	defb 56, 3
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
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 32, 192
	defb 34, 192
	defb 21, 224
	defb 5, 240
	defb 6, 240
	defb 1, 240
	defb 7, 240
	defb 6, 240
	defb 2, 240
	defb 1, 248
	defb 1, 252
	defb 1, 252
	defb 3, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_6_b
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 8, 7
	defb 6, 1
	defb 9, 0
	defb 9, 0
	defb 133, 0
	defb 193, 0
	defb 70, 1
	defb 216, 7
	defb 160, 15
	defb 96, 15
	defb 192, 15
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
	defb 0, 255
	defb 7, 248
	defb 24, 224
	defb 32, 192
	defb 32, 192
	defb 22, 224
	defb 5, 240
	defb 5, 240
	defb 6, 240
	defb 1, 240
	defb 3, 240
	defb 6, 240
	defb 1, 224
	defb 13, 192
	defb 30, 128
	defb 56, 128
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_7_b
	defb 0, 255
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 8, 7
	defb 6, 1
	defb 9, 0
	defb 9, 0
	defb 133, 0
	defb 129, 0
	defb 6, 1
	defb 216, 7
	defb 192, 15
	defb 224, 7
	defb 232, 3
	defb 120, 3
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
	defb 7, 248
	defb 8, 240
	defb 16, 224
	defb 32, 192
	defb 34, 192
	defb 21, 224
	defb 5, 240
	defb 6, 240
	defb 1, 240
	defb 7, 240
	defb 7, 240
	defb 3, 224
	defb 15, 192
	defb 31, 128
	defb 56, 128
	defb 0, 131
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_8_b
	defb 224, 31
	defb 16, 15
	defb 8, 7
	defb 8, 7
	defb 14, 1
	defb 9, 0
	defb 9, 0
	defb 5, 0
	defb 225, 0
	defb 2, 1
	defb 28, 3
	defb 128, 31
	defb 160, 15
	defb 96, 7
	defb 48, 3
	defb 24, 131
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

._malotes
	defb	96
	defb	0
	defb	96
	defb	0
	defb	192
	defb	48
	defb	2
	defb	2
	defb	1
	defb	176
	defb	16
	defb	176
	defb	16
	defb	96
	defb	48
	defb	-1
	defb	1
	defb	2
	defb	112
	defb	96
	defb	112
	defb	96
	defb	112
	defb	128
	defb	0
	defb	1
	defb	3
	defb	80
	defb	128
	defb	80
	defb	128
	defb	80
	defb	16
	defb	0
	defb	-2
	defb	3
	defb	64
	defb	128
	defb	64
	defb	128
	defb	32
	defb	80
	defb	-1
	defb	-1
	defb	2
	defb	160
	defb	112
	defb	160
	defb	112
	defb	160
	defb	32
	defb	0
	defb	-1
	defb	4
	defb	32
	defb	112
	defb	32
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	3
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
	defb	48
	defb	0
	defb	48
	defb	0
	defb	48
	defb	32
	defb	0
	defb	1
	defb	3
	defb	208
	defb	32
	defb	208
	defb	32
	defb	80
	defb	80
	defb	-2
	defb	2
	defb	2
	defb	208
	defb	96
	defb	208
	defb	96
	defb	112
	defb	96
	defb	-1
	defb	0
	defb	4
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
	defb	96
	defb	32
	defb	96
	defb	32
	defb	208
	defb	32
	defb	1
	defb	0
	defb	2
	defb	80
	defb	128
	defb	80
	defb	128
	defb	80
	defb	48
	defb	0
	defb	-2
	defb	4
	defb	64
	defb	48
	defb	64
	defb	48
	defb	16
	defb	112
	defb	-2
	defb	2
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
	defb	64
	defb	80
	defb	64
	defb	80
	defb	32
	defb	128
	defb	-1
	defb	1
	defb	2
	defb	64
	defb	32
	defb	64
	defb	32
	defb	16
	defb	32
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	128
	defb	208
	defb	128
	defb	16
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	128
	defb	64
	defb	128
	defb	64
	defb	96
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	16
	defb	32
	defb	16
	defb	64
	defb	112
	defb	2
	defb	2
	defb	3
	defb	80
	defb	128
	defb	80
	defb	128
	defb	80
	defb	32
	defb	0
	defb	-1
	defb	4
	defb	144
	defb	48
	defb	144
	defb	48
	defb	208
	defb	64
	defb	1
	defb	1
	defb	2
	defb	208
	defb	128
	defb	208
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
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
	defb	80
	defb	96
	defb	80
	defb	96
	defb	80
	defb	16
	defb	0
	defb	-1
	defb	1
	defb	112
	defb	48
	defb	112
	defb	48
	defb	224
	defb	112
	defb	2
	defb	2
	defb	2
	defb	128
	defb	128
	defb	128
	defb	128
	defb	112
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	128
	defb	64
	defb	128
	defb	224
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
	defb	96
	defb	48
	defb	96
	defb	48
	defb	208
	defb	96
	defb	1
	defb	1
	defb	3
	defb	208
	defb	80
	defb	208
	defb	80
	defb	144
	defb	48
	defb	-1
	defb	-1
	defb	3
	defb	128
	defb	80
	defb	128
	defb	80
	defb	96
	defb	32
	defb	-1
	defb	-1
	defb	2
	defb	64
	defb	112
	defb	64
	defb	112
	defb	64
	defb	48
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
	defb	192
	defb	80
	defb	64
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
	defb	160
	defb	128
	defb	160
	defb	128
	defb	160
	defb	64
	defb	0
	defb	-1
	defb	4
	defb	112
	defb	128
	defb	112
	defb	128
	defb	112
	defb	80
	defb	0
	defb	-2
	defb	2
	defb	128
	defb	16
	defb	128
	defb	16
	defb	208
	defb	16
	defb	1
	defb	0
	defb	3
	defb	16
	defb	48
	defb	16
	defb	48
	defb	96
	defb	96
	defb	2
	defb	2
	defb	1
	defb	96
	defb	16
	defb	96
	defb	16
	defb	48
	defb	16
	defb	-1
	defb	0
	defb	2
	defb	16
	defb	112
	defb	16
	defb	112
	defb	32
	defb	112
	defb	1
	defb	0
	defb	3
	defb	192
	defb	112
	defb	192
	defb	112
	defb	192
	defb	16
	defb	0
	defb	-1
	defb	4
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
	defb	160
	defb	64
	defb	80
	defb	64
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	80
	defb	64
	defb	80
	defb	32
	defb	32
	defb	-1
	defb	-1
	defb	3
	defb	64
	defb	16
	defb	64
	defb	16
	defb	32
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
	defb	16
	defb	16
	defb	16
	defb	16
	defb	144
	defb	80
	defb	2
	defb	2
	defb	2
	defb	224
	defb	80
	defb	224
	defb	80
	defb	176
	defb	64
	defb	-1
	defb	-1
	defb	3
	defb	224
	defb	96
	defb	224
	defb	96
	defb	176
	defb	96
	defb	-1
	defb	0
	defb	4
	defb	80
	defb	128
	defb	80
	defb	128
	defb	80
	defb	48
	defb	0
	defb	-1
	defb	1
	defb	64
	defb	128
	defb	64
	defb	128
	defb	64
	defb	64
	defb	0
	defb	-2
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	0
	defb	1
	defb	3
	defb	64
	defb	112
	defb	64
	defb	112
	defb	64
	defb	16
	defb	0
	defb	-1
	defb	2
	defb	112
	defb	64
	defb	112
	defb	64
	defb	128
	defb	144
	defb	2
	defb	2
	defb	2
	defb	144
	defb	16
	defb	144
	defb	16
	defb	224
	defb	64
	defb	2
	defb	2
	defb	3
	defb	208
	defb	80
	defb	208
	defb	80
	defb	32
	defb	80
	defb	-2
	defb	0
	defb	4
	defb	96
	defb	32
	defb	96
	defb	32
	defb	160
	defb	32
	defb	1
	defb	0
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
	defb	208
	defb	64
	defb	208
	defb	64
	defb	96
	defb	64
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	80
	defb	128
	defb	80
	defb	16
	defb	0
	defb	-1
	defb	4
	defb	208
	defb	112
	defb	208
	defb	112
	defb	160
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
	defb	112
	defb	144
	defb	112
	defb	144
	defb	16
	defb	0
	defb	-2
	defb	1
	defb	112
	defb	112
	defb	112
	defb	112
	defb	48
	defb	112
	defb	-2
	defb	0
	defb	2
	defb	64
	defb	80
	defb	64
	defb	80
	defb	128
	defb	128
	defb	1
	defb	1
	defb	3
	defb	176
	defb	128
	defb	176
	defb	128
	defb	176
	defb	80
	defb	0
	defb	-2
	defb	2
	defb	192
	defb	128
	defb	192
	defb	128
	defb	192
	defb	32
	defb	0
	defb	-2
	defb	1
	defb	208
	defb	64
	defb	208
	defb	64
	defb	128
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

;	SECTION	text

._hotspots
	defb	147
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	101
	defb	4
	defb	0
	defb	52
	defb	4
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
	defb	136
	defb	4
	defb	0
	defb	101
	defb	4
	defb	0
	defb	116
	defb	4
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
	defb	120
	defb	2
	defb	0
	defb	0
	defb	0
	defb	0
	defb	165
	defb	4
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
	defb	136
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	83
	defb	4
	defb	0
	defb	72
	defb	4
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
	defb	104
	defb	4
	defb	0
	defb	167
	defb	2
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
	defb	148
	defb	4
	defb	0
	defb	51
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	87
	defb	4
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
	jp	i_21
.i_19
	ld	hl,_pti
	ld	a,(hl)
	inc	(hl)
.i_21
	ld	hl,(_pti)
	ld	h,0
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_ule
	jp	nc,i_20
	ld	hl,10	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	jp	i_24
.i_22
	ld	hl,_ptj
	ld	a,(hl)
	inc	(hl)
.i_24
	ld	hl,(_ptj)
	ld	h,0
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_ule
	jp	nc,i_23
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
	jp	i_22
.i_23
	jp	i_19
.i_20
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
	add 3
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
.i_25
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_26
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
	jp	i_25
.i_26
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
.i_27
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_28
	ld	hl,250 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_31
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdi),a
.i_29
	ld	hl,_rdd
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_31
.i_30
	call	_any_key
	ld	a,h
	or	l
	jr	nz,i_28
.i_32
	jp	i_27
.i_28
	ret



._paralyze_everyone
	ld	a,#(0 % 256 % 256)
	ld	(_player_min_killable),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_35
.i_33
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_35
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_34
	jp	nc,i_34
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(255 % 256 % 256)
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(32 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_33
.i_34
	ret



._restore_everyone
	ld	a,#(4 % 256 % 256)
	ld	(_player_min_killable),a
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
	cp	#(3 % 256)
	jp	z,i_37
	jp	nc,i_37
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_36
.i_37
	ret



._set_hotspot
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
	ld	(hl),#(1 % 256 % 256)
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
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
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
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,16
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret



._hook_system_inits
	ret



._hook_init_game
	ld	a,#(0 % 256 % 256)
	ld	(_resonators_on),a
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_player_min_killable),a
	ret



._hook_init_mainloop
	ret



._hook_mainloop
	ld	a,(_latest_hotspot)
	cp	#(4 % 256)
	jr	z,i_39_uge
	jp	c,i_39
.i_39_uge
	ld	a,(_latest_hotspot)
	cp	#(4 % 256)
	jp	nz,i_41
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_41
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	hl,(_hotspot_y)
	ld	h,0
	call	l_ule
	jr	c,i_42_i_41
.i_41
	jp	i_40
.i_42_i_41
	ld	hl,6 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	a,#(250 % 256 % 256)
	ld	(_resonators_on),a
	ld	hl,5 % 256	;const
	ld	a,l
	ld	(_latest_hotspot),a
	call	_paralyze_everyone
.i_40
	ld	hl,(_latest_hotspot)
	ld	h,0
	push	hl
	call	_set_hotspot
	pop	bc
.i_39
	ld	a,(_resonators_on)
	and	a
	jp	z,i_43
	ld	a,(_resonators_on)
	ld	e,a
	ld	d,0
	ld	hl,25	;const
	call	l_div_u
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	hl,_resonators_on
	ld	a,(hl)
	dec	(hl)
	ld	a,(_resonators_on)
	ld	e,a
	ld	d,0
	ld	hl,25	;const
	call	l_div_u
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	ld	hl,(_rdi)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdd)
	ld	h,0
	call	l_ne
	jp	nc,i_44
	ld	hl,4 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,25 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,(_rdd)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
.i_44
	ld	a,(_resonators_on)
	and	a
	jp	nz,i_45
	ld	hl,3 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	call	_restore_everyone
	ld	a,(_hotspot_y)
	cp	#(240 % 256)
	jp	z,i_46
	ld	hl,4 % 256	;const
	push	hl
	call	_set_hotspot
	pop	bc
.i_46
.i_45
.i_43
	ret



._hook_entering
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
	cp	#(4 % 256)
	jr	z,i_47_uge
	jp	c,i_47
.i_47_uge
	ld	a,(_resonators_on)
	and	a
	jp	z,i_48
	ld	hl,5	;const
	jp	i_49
.i_48
	ld	hl,4	;const
.i_49
	ld	h,0
	push	hl
	call	_set_hotspot
	pop	bc
.i_47
	ld	hl,(_resonators_on)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_paralyze_everyone
.i_50
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
.i_51
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_53
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_52
.i_53
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_55
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_52
.i_55
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_57
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_52
.i_57
.i_56
.i_54
	jp	i_51
.i_52
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
	ld	hl,15 % 256	;const
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
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,i_1+0
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
	pop	bc
	pop	hl
	push	hl
	push	bc
	xor	a
	or	h
	jp	p,i_61
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_61
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_62
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
	and 199 ; Le hacemos la m�scara 11000111 y dejamos PAPER a 0
	ld (de), a ; Y lo volvemos a poner
	inc de ; Siguiente atributo
	djnz clearb2
	pop bc
	djnz clearb1
	;; Y ahora el c�digo original que escrib� para UWOL:
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



._clear_cerrojo
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld b, 11
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
	ld a, (__x)
	cp d
	jr nz, clear_cerrojo_loop_continue
	ld a, (__y)
	cp e
	jr nz, clear_cerrojo_loop_continue
	xor a
	ld (hl), a
	ret
	.clear_cerrojo_loop_continue
	inc hl
	djnz clear_cerrojo_loop
	ret



._init_cerrojos
	ld b, 11
	ld hl, _cerrojos + 3
	ld de, 4
	ld a, 1
	.init_cerrojos_loop
	ld (hl), a
	add hl, de
	djnz init_cerrojos_loop
	ret



._init_malotes
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_65
.i_63
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_65
	ld	a,(_gpit)
	cp	#(216 % 256)
	jp	z,i_64
	jp	nc,i_64
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
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
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_gpit)
	ld	h,0
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
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_63
.i_64
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



._player_flicker
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	l,(hl)
	ld	h,0
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
	ld	bc,i_66
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_66
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
	jp	z,i_67
	ld	hl,0	;const
	ld	(_player+8),hl
.i_67
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
	jp	nc,i_68
	ld	hl,65024	;const
	ld	(_player+1+1),hl
.i_68
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_69
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_69
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
	jp	c,i_70
	ld	a,(_player+19)
	and	a
	jp	nz,i_71
	ld	a,(_player+26)
	and	a
	jp	nz,i_73
	ld	a,(_player+25)
	and	a
	jp	z,i_72
.i_73
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_72
.i_71
	ld	a,(_player+19)
	and	a
	jp	z,i_75
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_player+13)
	ld	h,0
	ld	bc,48
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
	ld	de,65216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_76
	ld	hl,65216	;const
	ld	(_player+8),hl
.i_76
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_77
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_77
.i_75
	jp	i_78
.i_70
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
.i_78
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_80
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_81_i_80
.i_80
	jp	i_79
.i_81_i_80
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_82
	or	l
	jp	z,i_82
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
	jp	p,i_83
	ld	hl,0	;const
	ld	(_player+6),hl
.i_83
	jp	i_84
.i_82
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_85
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
	jp	m,i_86
	or	l
	jp	z,i_86
	ld	hl,0	;const
	ld	(_player+6),hl
.i_86
.i_85
.i_84
.i_79
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_87
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_88
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
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
.i_88
.i_87
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_89
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_90
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
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_90
.i_89
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
	jp	p,i_91
	ld	hl,0	;const
	ld	(_player),hl
.i_91
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_92
	ld	hl,14336	;const
	ld	(_player),hl
.i_92
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
	ld	a,(_wall)
	and	a
	jp	z,i_94
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	z,i_95_i_94
.i_94
	jp	i_93
.i_95_i_94
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,15	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_97
	ld	hl,_player+28
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_98_i_97
.i_97
	jp	i_96
.i_98_i_97
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_clear_cerrojo
	pop	bc
	pop	bc
	ld	hl,_player+28
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	jp	i_99
.i_96
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,15	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_101
	ld	hl,_player+28
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_102_i_101
.i_101
	jp	i_100
.i_102_i_101
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_clear_cerrojo
	pop	bc
	pop	bc
	ld	hl,_player+28
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_100
.i_99
.i_93
	ld	hl,(_gpyy)
	ld	h,0
	ld	a,l
	ld	(_y1),a
	ld	h,0
	ld	a,l
	ld	(_y0),a
	ld	a,(_wall)
	cp	#(2 % 256)
	jp	nz,i_104
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_104
	inc	hl
	ld	a,(_gpxx)
	cp	#(14 % 256)
	jp	z,i_104
	jr	c,i_105_i_104
.i_104
	jp	i_103
.i_105_i_104
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_x0),a
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
	call	_can_move_box
	ld	a,h
	or	l
	jp	z,i_106
	ld	hl,1 % 256	;const
	push	hl
	call	_move_tile
	pop	bc
.i_106
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_107
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_y1),a
	ld	h,0
	ld	a,l
	ld	(_y0),a
	call	_can_move_box
	ld	a,h
	or	l
	jp	z,i_108
	ld	hl,1 % 256	;const
	push	hl
	call	_move_tile
	pop	bc
.i_108
.i_107
	jp	i_109
.i_103
	ld	a,(_wall)
	cp	#(1 % 256)
	jp	nz,i_111
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_111
	inc	hl
	ld	a,(_gpxx)
	cp	#(0 % 256)
	jp	z,i_111
	jp	c,i_111
	jr	i_112_i_111
.i_111
	jp	i_110
.i_112_i_111
	ld	hl,(_gpxx)
	ld	h,0
	ld	a,l
	ld	(_x0),a
	ld	hl,(_gpxx)
	ld	h,0
	dec	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
	call	_can_move_box
	ld	a,h
	or	l
	jp	z,i_113
	ld	hl,1 % 256	;const
	push	hl
	call	_move_tile
	pop	bc
.i_113
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_114
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_y1),a
	ld	h,0
	ld	a,l
	ld	(_y0),a
	call	_can_move_box
	ld	a,h
	or	l
	jp	z,i_115
	ld	hl,1 % 256	;const
	push	hl
	call	_move_tile
	pop	bc
.i_115
.i_114
.i_110
.i_109
	ld a, (_gpx)
	ld b, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_ptx1), a
	ld a, b
	add 11
	srl a
	srl a
	srl a
	srl a
	ld (_ptx2), a
	ld a, (_gpy)
	ld b, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (_pty1), a
	ld a, b
	add 11
	srl a
	srl a
	srl a
	srl a
	ld (_pty2), a
	ld a, (_ptx1)
	ld c, a
	ld a, (_pty1)
	call _attr_2
	ld a, l
	dec a
	jr z, evil_tile_collision
	ld a, (_ptx2)
	ld c, a
	ld a, (_pty1)
	call _attr_2
	ld a, l
	dec a
	jr z, evil_tile_collision
	ld a, (_ptx2)
	ld c, a
	ld a, (_pty1)
	call _attr_2
	ld a, l
	dec a
	jr z, evil_tile_collision
	ld a, (_ptx2)
	ld c, a
	ld a, (_pty2)
	call _attr_2
	ld a, l
	dec a
	jr nz, evil_tile_collision_done
	.evil_tile_collision
	ld	a,(_player+23)
	and	a
	jp	nz,i_116
	ld	hl,2 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	call	_player_flicker
.i_116
	ld	de,_player
	ld	hl,(_gpcx)
	call	l_pint
	ld	de,_player+1+1
	ld	hl,(_gpcy)
	call	l_pint
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	l_neg
	pop	de
	call	l_pint
	.evil_tile_collision_done
	ld a, (_player+22)
	dec a
	jr z, _player_cell_sel_set_rdi
	ld a, 4
	._player_cell_sel_set_rdi
	ld (_rdi), a
	ld	hl,(_player+26)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_118
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_119_i_118
.i_118
	jp	i_117
.i_119_i_118
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_120
.i_117
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_121
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_122
.i_121
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,3	;const
	ex	de,hl
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	cp	#(3 % 256)
	jp	nz,i_123
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_123
.i_122
.i_120
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
	ld	hl,_player
	ld	(hl),#(1024 % 256)
	inc	hl
	ld	(hl),#(1024 / 256)
	ld	hl,_player+1+1
	ld	(hl),#(4096 % 256)
	inc	hl
	ld	(hl),#(4096 / 256)
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
	ld	a,#(32 % 256)
	ld	(de),a
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
	ld	(hl),#(1 % 256 % 256)
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
	ld	(hl),#(10 % 256)
	inc	hl
	ld	(hl),#(10 / 256)
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
	ld	hl,20 % 256	;const
	ld	a,l
	ld	(_pant_final),a
	ret



._init_hotspots
	ld b, 12 * 6
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



._draw_scr_background
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdy),a
	ld	hl,_mapa
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	ld	de,75
	call	l_mult
	pop	de
	add	hl,de
	ld	(_gp_gen),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	#asm
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
	ld a, 19
	ret
	.draw_scr_alt_no
	ld a, c
	ret
	.draw_scr_bg_loop_end
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
	ld	a,(hl)
	and	a
	jp	z,i_124
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
	jp	z,i_125
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
	ld	de,3
	add	hl,de
	ld	h,0
	push	hl
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
	ld	de,16
	add	hl,de
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_125
	jp	i_126
.i_124
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
	jp	z,i_127
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_div
	ld	hl,2	;const
	call	l_eq
	jp	nc,i_128
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
	ld	de,3
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,16 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_128
.i_127
.i_126
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_131
.i_129
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_131
	ld	a,(_gpit)
	cp	#(11 % 256)
	jp	z,i_130
	jp	nc,i_130
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(_n_pant)
	cp	(hl)
	jp	nz,i_133
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_134_i_133
.i_133
	jp	i_132
.i_134_i_133
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	e,(hl)
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,3
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	ld	de,15
	call	l_mult
	push	hl
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	l,(hl)
	ld	h,0
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	de,_map_attr
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_map_buff
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_132
	jp	i_129
.i_130
	ret



._draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	call	_draw_scr_background
	ld	a,#(0 % 256 % 256)
	ld	(_f_zone_ac),a
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
	ld	(_gpit),a
	jp	i_137
.i_135
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_137
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_136
	jp	nc,i_136
	ld	de,_en_an_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_state
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
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
.i_140
	ld	a,l
	cp	#(0% 256)
	jp	z,i_141
	cp	#(1% 256)
	jp	z,i_142
	cp	#(2% 256)
	jp	z,i_143
	cp	#(3% 256)
	jp	z,i_144
	cp	#(4% 256)
	jp	z,i_145
	jp	i_146
.i_141
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
	jp	i_139
.i_142
.i_143
.i_144
.i_145
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_9_a
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
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
	dec	hl
	ld	de,288
	call	l_mult
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	jp	i_139
.i_146
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_139
	jp	i_135
.i_136
	call	_hook_entering
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
	ld	de,3
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
	ld	l,(hl)
	ld	h,0
	dec	l
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
	jp	i_149
.i_147
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_149
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_148
	jp	nc,i_148
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
	ld d, h
	ld e, l
	add hl, hl
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
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(32 % 256)
	jp	nz,i_150
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	dec	(hl)
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	nz,i_151
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_151
.i_150
	ld	hl,__en_t
	ld	a,(hl)
	and	#(16 % 256)
	jp	z,i_152
	ld	l,a
	ld	h,0
	jp	i_153
.i_152
	ld	a,(__en_t)
	and	a
	jp	z,i_154
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_cx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_cy),a
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(32 % 256)
	jp	z,i_155
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ule
	jp	nc,i_156
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
	jr z, en_linear_horz_bounds_do
	ld a, (__en_x2)
	cp c
	jr nz, en_linear_horz_bounds_done
	.en_linear_horz_bounds_do
	ld a, (__en_mx)
	ld c, a
	xor a
	sub c
	ld (__en_mx), a
	.en_linear_horz_bounds_done
	.en_linear_vert_bounds
	ld a, (__en_y)
	ld c, a
	ld a, (__en_y1)
	cp c
	jr z, en_linear_vert_bounds_do
	ld a, (__en_y2)
	cp c
	jr nz, en_linear_vert_bounds_done
	.en_linear_vert_bounds_do
	ld a, (__en_my)
	ld c, a
	xor a
	sub c
	ld (__en_my), a
	.en_linear_vert_bounds_done
	ld	a,(__en_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_en_xx),a
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_en_yy),a
	ld	hl,__en_mx
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_157
	ld	hl,(_en_xx)
	ld	h,0
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_en_yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_159
	ld	hl,__en_y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_160
	inc	hl
	ld	hl,(_en_xx)
	ld	h,0
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_en_yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_160
	ld	hl,1	;const
	jr	i_161
.i_160
	ld	hl,0	;const
.i_161
	ld	a,h
	or	l
	jp	nz,i_159
	jr	i_162
.i_159
	ld	hl,1	;const
.i_162
	ld	a,h
	or	l
	jp	z,i_158
	ld	hl,__en_mx
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
	ld	hl,(_en_cx)
	ld	h,0
	ld	a,l
	ld	(__en_x),a
.i_158
.i_157
	ld	hl,__en_my
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_163
	ld	hl,(_en_xx)
	ld	h,0
	push	hl
	ld	hl,(_en_yy)
	ld	h,0
	push	hl
	ld	hl,__en_my
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_165
	ld	hl,__en_x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_166
	inc	hl
	ld	hl,(_en_xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_en_yy)
	ld	h,0
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_166
	ld	hl,1	;const
	jr	i_167
.i_166
	ld	hl,0	;const
.i_167
	ld	a,h
	or	l
	jp	nz,i_165
	jr	i_168
.i_165
	ld	hl,1	;const
.i_168
	ld	a,h
	or	l
	jp	z,i_164
	ld	hl,__en_my
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
	ld	hl,(_en_cy)
	ld	h,0
	ld	a,l
	ld	(__en_y),a
.i_164
.i_163
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	add	hl,hl
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_156
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_count
	add hl, bc
	ld a, (hl)
	inc a
	cp 4
	jr c, enemy_animate_update_count
	push hl
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	xor 1
	ld (hl), a
	pop hl
	xor a
	.enemy_animate_update_count
	ld (hl), a
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
	ld	hl,(_rdd)
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
.i_155
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_170
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_170
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_171_i_170
.i_170
	jp	i_169
.i_171_i_170
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_172
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_174
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_174
	ld	hl,(_player+8)
	ld	de,65488	;const
	ex	de,hl
	call	l_ge
	jr	c,i_175_i_174
.i_174
	jp	i_173
.i_175_i_174
	call	_platform_get_player
.i_173
	jp	i_176
.i_172
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_177
	or	l
	jp	z,i_177
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_179
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-14
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_179
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_180_i_179
.i_179
	jp	i_178
.i_180_i_179
	call	_platform_get_player
.i_178
.i_177
.i_176
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_182
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_182
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_182
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_183_i_182
.i_182
	jp	i_181
.i_183_i_182
	call	_platform_get_player
	ld	hl,__en_mx
	call	l_gchar
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	ld	(_ptgmx),hl
.i_181
	jp	i_184
.i_169
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_186
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_186
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_186
	jr	c,i_187_i_186
.i_186
	jp	i_185
.i_187_i_186
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ult
	jp	nc,i_189
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_189
	ld	hl,(__en_t)
	ld	h,0
	ex	de,hl
	ld	hl,(_player_min_killable)
	ld	h,0
	call	l_uge
	jr	c,i_190_i_189
.i_189
	jp	i_188
.i_190_i_189
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
	call	_enems_kill
	jp	i_191
.i_188
	ld	a,(_player+23)
	and	a
	jp	nz,i_192
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
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	call	_player_flicker
.i_192
.i_191
.i_185
.i_184
.i_154
.i_153
.i_193
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
	jp	i_147
.i_148
	ret



._move_tile
	ld	hl,(_x0)
	ld	h,0
	push	hl
	ld	hl,(_y0)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,(_comportamiento_tiles)
	ld	h,0
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
	ld	hl,14 % 256	;const
	push	hl
	ld	hl,(_comportamiento_tiles+14)
	ld	h,0
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_194
	ld	hl,8 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
.i_194
	ret



._can_move_box
	ld	hl,(_x0)
	ld	h,0
	push	hl
	ld	hl,(_y0)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,14	;const
	ex	de,hl
	call	l_ne
	jp	c,i_196
	ld	hl,(_x1)
	ld	h,0
	push	hl
	ld	hl,(_y1)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,4	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_195
.i_196
	ld	hl,0 % 256	;const
	ret


.i_195
	ld	hl,1 % 256	;const
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
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,61288	;const
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
	jp	i_200
.i_198
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_200
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_199
	jp	nc,i_199
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
	jp	i_198
.i_199
	call	_hook_system_inits
.i_201
	call	_title_screen
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	call	_init_malotes
	ld	a,#(20 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_maincounter),a
	call	_hook_init_game
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,18 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,16 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
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
.i_203
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_204
	call	_hook_init_mainloop
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_on_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_205
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_on_pant),a
.i_205
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_206
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_207
	or	l
	jp	z,i_207
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_208
.i_207
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_208
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
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
.i_206
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_209
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,_player+28
	call	l_gchar
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_player+28
	call	l_gchar
	ld	h,0
	ld	a,l
	ld	(_keys_old),a
.i_209
	ld	hl,(_player+32)
	ld	h,0
	ex	de,hl
	ld	hl,(_killed_old)
	ld	h,0
	call	l_ne
	jp	nc,i_210
	ld	hl,16 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
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
.i_210
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_213
.i_211
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_213
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_212
	jp	nc,i_212
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
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
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
	add	hl,bc
	add	hl,bc
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
	ld	(_rdy),a
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
	ld	de,3
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
	jp	i_211
.i_212
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
	jp	c,i_215
	ld	a,(_half_life)
	and	a
	jp	z,i_214
.i_215
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_217
.i_214
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_217
	ld	a,(_rdy)
	cp	#(248 % 256)
	jr	z,i_218_uge
	jp	c,i_218
.i_218_uge
	ld	hl,2 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_219
.i_218
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,3
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdi),a
.i_219
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
	ld	(_latest_hotspot),a
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
	and	a
	jp	nz,i_220
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,(_player+29)
	ld	de,10	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_221
	ld	hl,10	;const
	ld	(_player+29),hl
.i_221
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
	ld	(hl),#(2 % 256 % 256)
	ld	hl,6 % 256	;const
	push	hl
	call	_play_sfx
	pop	bc
	jp	i_222
.i_220
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdi),a
.i_222
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
.i_225
	ld	a,l
	cp	#(2% 256)
	jp	nz,i_224
.i_226
	ld	hl,_player+28
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
.i_224
	ld	a,(_rdi)
	and	a
	jp	z,i_227
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
	ld	de,3
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
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_227
	._hotspots_done
	call	_hook_mainloop
	call	sp_UpdateNow
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
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_229
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_230_i_229
.i_229
	jp	i_228
.i_230_i_229
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	a,#(224 % 256 % 256)
	ld	(_gpx),a
	ld	hl,14336	;const
	ld	(_player),hl
	jp	i_231
.i_228
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_233
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_234_i_233
.i_233
	jp	i_232
.i_234_i_233
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,0	;const
	ld	(_player),hl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
.i_232
.i_231
	ld	hl,(_player+1+1)
	ld	de,65024	;const
	call	l_eq
	jp	nc,i_236
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_236
	ld	a,(_n_pant)
	cp	#(12 % 256)
	jr	z,i_236_uge
	jp	c,i_236
.i_236_uge
	jr	i_237_i_236
.i_236
	jp	i_235
.i_237_i_236
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-12
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
	ld	(hl),#(65216 % 256)
	inc	hl
	ld	(hl),#(65216 / 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_238
.i_235
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_240
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_241_i_240
.i_240
	jp	i_239
.i_241_i_240
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,12
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,0	;const
	ld	(_player+1+1),hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
.i_239
.i_238
	ld	hl,_player+27
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_243
	ld	a,(_n_pant)
	cp	#(20 % 256)
	jp	nz,i_242
.i_243
	ld	a,#(0 % 256 % 256)
	ld	(_success),a
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_245
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_247
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,8	;const
	ex	de,hl
	call	l_eq
	jr	c,i_248_i_247
.i_247
	jp	i_246
.i_248_i_247
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_246
	jp	i_249
.i_245
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	nz,i_250
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_250
.i_249
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_251
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_251
.i_242
	ld	a,(_player+36)
	and	a
	jp	z,i_252
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_253
	or	l
	jp	z,i_253
.i_253
.i_252
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	p,i_254
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_254
	jp	i_203
.i_204
	jp	i_201
.i_202
	ret


	.musicstart
	; Phaser1 Engine, with synthesised drums
	; Original code by Shiru - .http
	; Modified by Chris Cowley
	; Produced by Beepola v1.08.01
	; Adapted to MK1 by na_th_an
	.START
	LD HL,MUSICDATA ; <- Pointer to Music Data. Change
	; this to play a different song
	LD A,(HL) ; Get the loop start pointer
	LD (PATTERN_LOOP_BEGIN),A
	INC HL
	LD A,(HL) ; Get the song end pointer
	LD (PATTERN_LOOP_END),A
	INC HL
	LD E,(HL)
	INC HL
	LD D,(HL)
	INC HL
	LD (INSTRUM_TBL),HL
	LD (CURRENT_INST),HL
	ADD HL,DE
	LD (PATTERN_ADDR),HL
	XOR A
	LD (PATTERN_PTR),A ; Set the pattern pointer to zero
	LD H,A
	LD L,A
	LD (NOTE_PTR),HL ; Set the note offset (within this pattern) to 0
	.PLAYER
	;DI
	PUSH IY
	XOR A
	LD H,$00
	LD L,A
	LD (CNT_1A),HL
	LD (CNT_1B),HL
	LD (DIV_1A),HL
	LD (DIV_1B),HL
	LD (CNT_2),HL
	LD (DIV_2),HL
	LD (OUT_1),A
	LD (OUT_2),A
	JR MAIN_LOOP
	; ********************************************************************************************************
	; * NEXT_PATTERN
	; *
	; * Select the next pattern in sequence (and handle looping if weve reached PATTERN_LOOP_END
	; * Execution falls through to PLAYNOTE to play the first note from our next pattern
	; ********************************************************************************************************
	.NEXT_PATTERN
	LD A,(PATTERN_PTR)
	INC A
	INC A
	defb $FE ; CP n
	.PATTERN_LOOP_END defb 0
	JR NZ,NO_PATTERN_LOOP
	; Handle Pattern Looping at and of song
	defb $3E ; LD A,n
	.PATTERN_LOOP_BEGIN defb 0
	.NO_PATTERN_LOOP LD (PATTERN_PTR),A
	LD HL,$0000
	LD (NOTE_PTR),HL ; Start of pattern (NOTE_PTR = 0)
	.MAIN_LOOP
	LD IYL,0 ; Set channel = 0
	.READ_LOOP
	LD HL,(PATTERN_ADDR)
	LD A,(PATTERN_PTR)
	LD E,A
	LD D,0
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL) ; Now DE = Start of Pattern data
	LD HL,(NOTE_PTR)
	INC HL ; Increment the note pointer and...
	LD (NOTE_PTR),HL ; ..store it
	DEC HL
	ADD HL,DE ; Now HL = address of note data
	LD A,(HL)
	OR A
	JR Z,NEXT_PATTERN ; select next pattern
	BIT 7,A
	JP Z,RENDER ; Play the currently defined note(S) and drum
	LD IYH,A
	AND $3F
	CP $3C
	JP NC,OTHER ; Other parameters
	ADD A,A
	LD B,0
	LD C,A
	LD HL,FREQ_TABLE
	ADD HL,BC
	LD E,(HL)
	INC HL
	LD D,(HL)
	LD A,IYL ; IYL = 0 for channel 1, or = 1 for channel 2
	OR A
	JR NZ,SET_NOTE2
	LD (DIV_1A),DE
	EX DE,HL
	DEFB $DD,$21 ; LD IX,nn
	.CURRENT_INST
	DEFW $0000
	LD A,(IX+$00)
	OR A
	JR Z,L809B ; Original code jumps into byte 2 of the DJNZ (invalid opcode FD)
	LD B,A
	.L8098 ADD HL,HL
	DJNZ L8098
	.L809B LD E,(IX+$01)
	LD D,(IX+$02)
	ADD HL,DE
	LD (DIV_1B),HL
	LD IYL,1 ; Set channel = 1
	LD A,IYH
	AND $40
	JR Z,READ_LOOP ; No phase reset
	LD HL,OUT_1 ; Reset phaser
	RES 4,(HL)
	LD HL,$0000
	LD (CNT_1A),HL
	LD H,(IX+$03)
	LD (CNT_1B),HL
	JR READ_LOOP
	.SET_NOTE2
	LD (DIV_2),DE
	LD A,IYH
	LD HL,OUT_2
	RES 4,(HL)
	LD HL,$0000
	LD (CNT_2),HL
	JP READ_LOOP
	.SET_STOP
	LD HL,$0000
	LD A,IYL
	OR A
	JR NZ,SET_STOP2
	; Stop channel 1 note
	LD (DIV_1A),HL
	LD (DIV_1B),HL
	LD HL,OUT_1
	RES 4,(HL)
	LD IYL,1
	JP READ_LOOP
	.SET_STOP2
	; Stop channel 2 note
	LD (DIV_2),HL
	LD HL,OUT_2
	RES 4,(HL)
	JP READ_LOOP
	.OTHER CP $3C
	JR Z,SET_STOP ; Stop note
	CP $3E
	JR Z,SKIP_CH1 ; No changes to channel 1
	INC HL ; Instrument change
	LD L,(HL)
	LD H,$00
	ADD HL,HL
	LD DE,(NOTE_PTR)
	INC DE
	LD (NOTE_PTR),DE ; Increment the note pointer
	DEFB $01 ; LD BC,nn
	.INSTRUM_TBL
	DEFW $0000
	ADD HL,BC
	LD (CURRENT_INST),HL
	JP READ_LOOP
	.SKIP_CH1
	LD IYL,$01
	JP READ_LOOP
	.EXIT_PLAYER
	LD HL,$2758
	EXX
	POP IY
	;EI
	RET
	.RENDER
	AND $7F ; L813A
	CP $76
	JP NC,DRUMS
	LD D,A
	EXX
	DEFB $21 ; LD HL,nn
	.CNT_1A DEFW $0000
	DEFB $DD,$21 ; LD IX,nn
	.CNT_1B DEFW $0000
	DEFB $01 ; LD BC,nn
	.DIV_1A DEFW $0000
	DEFB $11 ; LD DE,nn
	.DIV_1B DEFW $0000
	DEFB $3E ; LD A,n
	.OUT_1 defb $0
	EXX
	EX af,af
	DEFB $21 ; LD HL,nn
	.CNT_2 DEFW $0000
	DEFB $01 ; LD BC,nn
	.DIV_2 DEFW $0000
	DEFB $3E ; LD A,n
	.OUT_2 defb $00
	.PLAY_NOTE
	; Read keyboard
	LD E,A
	XOR A
	IN A,($FE)
	OR $E0
	INC A
	.PLAYER_WAIT_KEY
	JR NZ,EXIT_PLAYER
	LD A,E
	LD E,0
	.L8168 EXX
	EX af,af
	ADD HL,BC
	OUT ($FE),A
	JR C,L8171
	JR L8173
	.L8171 XOR $10
	.L8173 ADD IX,DE
	JR C,L8179
	JR L817B
	.L8179 XOR $10
	.L817B EX af,af
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L8184
	JR L8186
	.L8184 XOR $10
	.L8186 NOP
	JP L818A
	.L818A EXX
	EX af,af
	ADD HL,BC
	OUT ($FE),A
	JR C,L8193
	JR L8195
	.L8193 XOR $10
	.L8195 ADD IX,DE
	JR C,L819B
	JR L819D
	.L819B XOR $10
	.L819D EX af,af
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81A6
	JR L81A8
	.L81A6 XOR $10
	.L81A8 NOP
	JP L81AC
	.L81AC EXX
	EX af,af
	ADD HL,BC
	OUT ($FE),A
	JR C,L81B5
	JR L81B7
	.L81B5 XOR $10
	.L81B7 ADD IX,DE
	JR C,L81BD
	JR L81BF
	.L81BD XOR $10
	.L81BF EX af,af
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81C8
	JR L81CA
	.L81C8 XOR $10
	.L81CA NOP
	JP L81CE
	.L81CE EXX
	EX af,af
	ADD HL,BC
	OUT ($FE),A
	JR C,L81D7
	JR L81D9
	.L81D7 XOR $10
	.L81D9 ADD IX,DE
	JR C,L81DF
	JR L81E1
	.L81DF XOR $10
	.L81E1 EX af,af
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81EA
	JR L81EC
	.L81EA XOR $10
	.L81EC DEC E
	JP NZ,L8168
	EXX
	EX af,af
	ADD HL,BC
	OUT ($FE),A
	JR C,L81F9
	JR L81FB
	.L81F9 XOR $10
	.L81FB ADD IX,DE
	JR C,L8201
	JR L8203
	.L8201 XOR $10
	.L8203 EX af,af
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L820C
	JR L820E
	.L820C XOR $10
	.L820E DEC D
	JP NZ,PLAY_NOTE
	LD (CNT_2),HL
	LD (OUT_2),A
	EXX
	EX af,af
	LD (CNT_1A),HL
	LD (CNT_1B),IX
	LD (OUT_1),A
	JP MAIN_LOOP
	; ************************************************************
	; * DRUMS - Synthesised
	; ************************************************************
	.DRUMS
	ADD A,A ; On entry A=$75+Drum number (i.e. $76 to $7E)
	LD B,0
	LD C,A
	LD HL,DRUM_TABLE - 236
	ADD HL,BC
	LD E,(HL)
	INC HL
	LD D,(HL)
	EX DE,HL
	JP (HL)
	.DRUM_TONE1 LD L,16
	JR DRUM_TONE
	.DRUM_TONE2 LD L,12
	JR DRUM_TONE
	.DRUM_TONE3 LD L,8
	JR DRUM_TONE
	.DRUM_TONE4 LD L,6
	JR DRUM_TONE
	.DRUM_TONE5 LD L,4
	JR DRUM_TONE
	.DRUM_TONE6 LD L,2
	.DRUM_TONE
	LD DE,3700
	LD BC,$0101
	XOR A
	.DT_LOOP0 OUT ($FE),A
	DEC B
	JR NZ,DT_LOOP1
	XOR 16
	LD B,C
	EX af,af
	LD A,C
	ADD A,L
	LD C,A
	EX af,af
	.DT_LOOP1 DEC E
	JR NZ,DT_LOOP0
	DEC D
	JR NZ,DT_LOOP0
	JP MAIN_LOOP
	.DRUM_NOISE1 LD DE,2480
	LD IXL,1
	JR DRUM_NOISE
	.DRUM_NOISE2 LD DE,1070
	LD IXL,10
	JR DRUM_NOISE
	.DRUM_NOISE3 LD DE,365
	LD IXL,101
	.DRUM_NOISE
	LD H,D
	LD L,E
	XOR A
	LD C,A
	.DN_LOOP0 LD A,(HL)
	AND 16
	OR C
	OUT ($FE),A
	LD B,IXL
	.DN_LOOP1 DJNZ DN_LOOP1
	INC HL
	DEC E
	JR NZ,DN_LOOP0
	DEC D
	JR NZ,DN_LOOP0
	JP MAIN_LOOP
	.PATTERN_ADDR DEFW $0000
	.PATTERN_PTR defb 0
	.NOTE_PTR DEFW $0000
	; **************************************************************
	; * Frequency Table
	; **************************************************************
	.FREQ_TABLE
	DEFW 178,189,200,212,225,238,252,267,283,300,318,337
	DEFW 357,378,401,425,450,477,505,535,567,601,637,675
	DEFW 715,757,802,850,901,954,1011,1071,1135,1202,1274,1350
	DEFW 1430,1515,1605,1701,1802,1909,2023,2143,2270,2405,2548,2700
	DEFW 2860,3030,3211,3402,3604,3818,4046,4286,4541,4811,5097,5400
	; *****************************************************************
	; * Synth Drum Lookup Table
	; *****************************************************************
	.DRUM_TABLE
	DEFW DRUM_TONE1,DRUM_TONE2,DRUM_TONE3,DRUM_TONE4,DRUM_TONE5,DRUM_TONE6
	DEFW DRUM_NOISE1,DRUM_NOISE2,DRUM_NOISE3
	.MUSICDATA
	DEFB 0 ; Pattern loop begin * 2
	DEFB 16 ; Song length * 2
	DEFW 4 ; Offset to start of song (length of instrument table)
	DEFB 0 ; Multiple
	DEFW 17 ; Detune
	DEFB 4 ; Phase
	.PATTERNDATA DEFW PAT0
	DEFW PAT1
	DEFW PAT2
	DEFW PAT3
	DEFW PAT4
	DEFW PAT3
	DEFW PAT2
	DEFW PAT6
	; *** Pattern data - $00 marks the end of a pattern ***
	.PAT0
	defb $BD,0
	defb 188
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 190
	defb 142
	defb 118
	defb 9
	defb 190
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb 190
	defb 137
	defb 118
	defb 9
	defb 190
	defb 141
	defb 10
	defb 190
	defb 148
	defb 119
	defb 9
	defb 190
	defb 144
	defb 118
	defb 9
	defb 190
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb $00
	.PAT1
	defb $BD,0
	defb 190
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 254
	defb 142
	defb 118
	defb 9
	defb 190
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb 190
	defb 137
	defb 118
	defb 9
	defb 190
	defb 141
	defb 10
	defb 190
	defb 148
	defb 119
	defb 9
	defb 254
	defb 144
	defb 118
	defb 9
	defb 190
	defb 118
	defb 9
	defb $BD,0
	defb 156
	defb 10
	defb 161
	defb 119
	defb 9
	defb 160
	defb 10
	defb $00
	.PAT2
	defb 163
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 170
	defb 142
	defb 118
	defb 9
	defb 165
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb 190
	defb 137
	defb 118
	defb 9
	defb 190
	defb 141
	defb 10
	defb 190
	defb 148
	defb 119
	defb 9
	defb 172
	defb 144
	defb 118
	defb 9
	defb 167
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb $00
	.PAT3
	defb 190
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 156
	defb 142
	defb 118
	defb 9
	defb 161
	defb 118
	defb 19
	defb 160
	defb 119
	defb 19
	defb 163
	defb 137
	defb 118
	defb 9
	defb 190
	defb 141
	defb 10
	defb 190
	defb 148
	defb 119
	defb 9
	defb 190
	defb 144
	defb 118
	defb 9
	defb 190
	defb 118
	defb 9
	defb 156
	defb 10
	defb 161
	defb 119
	defb 9
	defb 160
	defb 10
	defb $00
	.PAT4
	defb 163
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 170
	defb 142
	defb 118
	defb 9
	defb 165
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb 190
	defb 137
	defb 118
	defb 9
	defb 156
	defb 141
	defb 10
	defb 161
	defb 148
	defb 119
	defb 9
	defb 160
	defb 144
	defb 118
	defb 9
	defb 163
	defb 118
	defb 9
	defb 161
	defb 10
	defb 172
	defb 119
	defb 9
	defb 167
	defb 10
	defb $00
	.PAT6
	defb 190
	defb 135
	defb 118
	defb 9
	defb 190
	defb 139
	defb 10
	defb 190
	defb 146
	defb 119
	defb 9
	defb 170
	defb 142
	defb 118
	defb 9
	defb 165
	defb 118
	defb 19
	defb 190
	defb 119
	defb 9
	defb 165
	defb 5
	defb 165
	defb 5
	defb 167
	defb 137
	defb 118
	defb 9
	defb 172
	defb 141
	defb 5
	defb 172
	defb 5
	defb 190
	defb 148
	defb 119
	defb 9
	defb 190
	defb 144
	defb 118
	defb 9
	defb 190
	defb 118
	defb 19
	defb 190
	defb 119
	defb 19
	defb $00
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
.__en_y1	defs	1
.__en_x2	defs	1
.__en_y2	defs	1
._spritesClip	defs	2
._hotspot_x	defs	1
._hotspot_y	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._half_life	defs	1
._en_cx	defs	1
._en_cy	defs	1
._flags	defs	1
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._enemy_died	defs	1
._player_min_killable	defs	1
._killed_old	defs	1
._ezg_old	defs	1
._resonators_on	defs	1
._t_alt	defs	1
._x0	defs	1
._y0	defs	1
._x1	defs	1
._y1	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._sp_player	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	1
._pad_this_frame	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._joyfunc	defs	2
._boxx	defs	1
._boyy	defs	1
._gpcx	defs	2
._fzx1	defs	1
._fzx2	defs	1
._fzy1	defs	1
._fzy2	defs	1
._gpcy	defs	2
._playing	defs	1
._gpit	defs	1
._rdt1	defs	1
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
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	39
._jetpac_frame_counter	defs	1
._gpx	defs	1
._gpy	defs	1
._rdi	defs	1
._rdj	defs	2
._rdd	defs	1
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._enoffsmasi	defs	1
._latest_hotspot	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	__en_t
	LIB	sp_ScreenStr
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_hotspots
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
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
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_enems_kill
	XDEF	_init_falling_box_buffer
	XDEF	_spritesClip
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
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
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
	XDEF	_player_min_killable
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	LIB	sp_ClearRect
	XDEF	_ezg_old
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	XDEF	_resonators_on
	LIB	sp_ListAppend
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
	XDEF	_x0
	LIB	sp_InitAlloc
	XDEF	_y0
	XDEF	_x1
	XDEF	_y1
	XDEF	_espera_activa
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
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_fall_box
	XDEF	_pant_final
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
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
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
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_draw_and_advance
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_sp_player
	XDEF	_init_player
	XDEF	_gp_gen
	LIB	sp_GetTiles
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
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_en_j
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_draw_rectangle
	LIB	sp_IntRect
	LIB	sp_ListLast
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
	XDEF	_boxx
	XDEF	_boyy
	XDEF	_gpcx
	XDEF	_fzx1
	XDEF	_fzx2
	XDEF	_fzy1
	XDEF	_fzy2
	XDEF	_gpcy
	LIB	sp_RemoveDList
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23633
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23639
	XDEF	_gpit
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_attr
	XDEF	_hook_entering
	LIB	sp_ListNext
	XDEF	_s_title
	XDEF	_line_of_text_clear
	XDEF	_player_cells
	LIB	sp_HuffDecode
	XDEF	_keys
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
	XDEF	_clear_cerrojo
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	LIB	sp_ListAdd
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
	XDEF	_sprite_3_a
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
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_en_tocado
	XDEF	_init_player_values
	XDEF	_sprite_4_a
	XDEF	_sprite_4_b
	XDEF	_sprite_4_c
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sprite_5_a
	LIB	sp_Initialize
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_sprite_6_a
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_tileset
	XDEF	_sprite_6_b
	LIB	sp_ComputePos
	XDEF	_sprite_6_c
	XDEF	_sprite_7_a
	XDEF	_sprite_7_b
	XDEF	_bitmask
	XDEF	_sprite_7_c
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_sprite_8_c
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	XDEF	_sprite_9_c
	XDEF	_draw_2_digits
	XDEF	_player_flicker
	XDEF	_init_hotspots
	XDEF	_enoffsmasi
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	LIB	sp_inp
	XDEF	_latest_hotspot
	XDEF	_set_hotspot
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
	XDEF	_paralyze_everyone
	XDEF	_restore_everyone
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
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
