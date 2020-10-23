;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Fri Oct 23 05:55:42 2020



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	8

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
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	4

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
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._keys
	defw	1151
	defw	479
	defw	735
	defw	509
	defw	507

;	SECTION	code

;	SECTION	text

._key_m
	defw	1151
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
	defb	2
	defb	1
	defb	20
	defb	30

;	SECTION	code

;	SECTION	text

._max_screens
	defm	""
	defb	24

;	SECTION	code


;	SECTION	text

._script_result
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._script_something_done
	defm	""
	defb	0

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
	defm	""
	defb	177

	defm	"!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!*"
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
	defb	147

	defm	"#"
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

	defm	"3:"
	defb	0

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

	defm	"3"
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3:"
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
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
	defb	153

	defm	"33:CCZCT3C"
	defb	165

	defm	"EE"
	defb	165

	defm	"ESEJUUZUUE#!"
	defb	34

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	19

	defm	"3#22"
	defb	18

	defm	"223333233333"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	155

	defm	"33<30"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	""
	defb	195

	defm	"333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"3333"
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"444:"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"TTTT"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	165

	defm	"UUUU"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"UU!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##;2#33333"
	defb	169

	defm	""
	defb	153

	defm	""
	defb	147

	defm	"3<33:"
	defb	0

	defm	""
	defb	0

	defm	"33333"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"33<30"
	defb	0

	defm	""
	defb	11

	defm	"4C44C"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"U4TY"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"UTUUUUUUU!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##32#33"
	defb	195

	defm	"3333"
	defb	195

	defm	"3333"
	defb	195

	defm	"333333333333333344C44C44TU4TUD"
	defm	"TUVdUUUUUfw"
	defb	18

	defm	"!!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	18

	defm	"3#"
	defb	34

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	""
	defb	18

	defm	"3332"
	defb	19

	defm	"!23"
	defb	195

	defm	"3323#3336339"
	defb	153

	defm	"333sLC"
	defb	0

	defm	""
	defb	3

	defm	"CCgEE0"
	defb	0

	defm	"5EgueT"
	defb	0

	defm	""
	defb	4

	defm	"fgwgfP"
	defb	0

	defm	"Wwwwwvff"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	"!!"
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	"#2"
	defb	19

	defm	"#"
	defb	18

	defm	"&2#32323s333343733339"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	179

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"CC3C@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	165

	defm	"EDEE"
	defb	0

	defm	""
	defb	0

	defm	"gUUUUffgvfffgwww"
	defb	17

	defm	""
	defb	161

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	161

	defm	""
	defb	17

	defm	"!"
	defb	34

	defm	""
	defb	26

	defm	""
	defb	34

	defm	""
	defb	177

	defm	"*"
	defb	17

	defm	"##b"
	defb	163

	defm	":#"
	defb	161

	defm	"#37"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	131

	defm	"33p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"337"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	195

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"437"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"T3y"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"ESGeUUUUUE#! "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	162

	defm	""
	defb	18

	defm	""
	defb	19

	defm	"3#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"22330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"33330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	"33<3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"33330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"4444"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	"TTTTUDU"
	defb	149

	defm	"VeUUUUUVw!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##32#33333c3333337<333336s333"
	defm	"333w36dC4fgt6wUfgwwfwvgwwwwwww"
	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	23

	defm	"ws!!#2fww3##3gw"
	defb	239

	defm	""
	defb	227

	defm	"3<3>"
	defb	254

	defm	""
	defb	240

	defm	""
	defb	0

	defm	"333"
	defb	195

	defm	""
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

	defm	"D4"
	defb	179

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"TZC;"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ff"
	defb	165

	defm	"D"
	defb	171

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"gwvffffw"
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

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
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	0

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

	defm	"fo"
	defb	191

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	14

	defm	"wwf`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"gwwwDDDGww"
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	192

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	0

	defm	"`"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	143

	defm	""
	defb	183

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	8

	defm	"f|"
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
	defb	135

	defm	"w"
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
	defb	8

	defm	"wp"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	12

	defm	""
	defb	135

	defm	"wDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	"w!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!'s"
	defb	34

	defm	"1!"
	defb	28

	defm	"##w33#!#"
	defb	195

	defm	"7v333#33ws333337w333333wv"
	defb	0

	defm	""
	defb	0

	defm	"f437wp"
	defb	12

	defm	""
	defb	7

	defm	"vf3ww"
	defb	0

	defm	""
	defb	0

	defm	"wwvgw|"
	defb	0

	defm	""
	defb	7

	defm	"www#!"
	defb	34

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	"ws3#22"
	defb	18

	defm	"gw333327ws<3336ww333<3wws33339"
	defm	""
	defb	153

	defm	""
	defb	155

	defm	"33;3C"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"44"
	defb	163

	defm	"5@"
	defb	0

	defm	""
	defb	10

	defm	"ffZDVffgwvffwww"
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"U"
	defb	1

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	16

	defm	""
	defb	5

	defm	"UU"
	defb	141

	defm	""
	defb	213

	defm	""
	defb	136

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	133

	defm	"UP"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"."
	defb	241

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	136

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
	defb	34

	defm	"("
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	128

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	15

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
	defb	133

	defm	"UUUDEUX"
	defb	16

	defm	""
	defb	0

	defm	""
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
	defb	128

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
	defb	16

	defm	""
	defb	8

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
	defb	16

	defm	""
	defb	128

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	191

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	248

	defm	"H"
	defb	132

	defm	"FdDDf"
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"UDEUU"
	defb	0

	defm	""
	defb	5

	defm	"P"
	defb	2

	defm	""
	defb	34

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
	defb	16

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
	defb	16

	defm	""
	defb	0

	defm	"30"
	defb	254

	defm	""
	defb	179

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	"336ff`"
	defb	0

	defm	"fff"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	200

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	251

	defm	""
	defb	240

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	200

	defm	"UUUU"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	14

	defm	""
	defb	128

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
	defb	200

	defm	""
	defb	1

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
	defb	128

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
	defb	0

	defm	""
	defb	200

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	15

	defm	""
	defb	190

	defm	""
	defb	240

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	134

	defm	"ffffDDH"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	136

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
	defb	15

	defm	""
	defb	240

	defm	""
	defb	128

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	136

	defm	""
	defb	1

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
	defb	168

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"0"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	131

	defm	"6"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	180

	defm	"N"
	defb	255

	defm	""
	defb	136

	defm	"ftDvff("
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	24

	defm	""
	defb	129

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
	defb	128

	defm	""
	defb	1

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

	defm	"("
	defb	128

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	136

	defm	""
	defb	1

	defm	""
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
	defb	216

	defm	""
	defb	131

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

	defm	""
	defb	136

	defm	"3"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	131

	defm	"3"
	defb	255

	defm	""
	defb	255

	defm	""
	defb	239

	defm	""
	defb	255

	defm	""
	defb	239

	defm	""
	defb	136

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
	defb	34

	defm	"("
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	1

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"("
	defb	128

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	143

	defm	""
	defb	254

	defm	""
	defb	255

	defm	""
	defb	0

	defm	""
	defb	254

	defm	""
	defb	251

	defm	""
	defb	1

	defm	""
	defb	136

	defm	"UUP"
	defb	21

	defm	"UP"
	defb	0

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	27

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	136

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
	defb	34

	defm	""
	defb	136

	defm	""
	defb	137

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
	defb	153

	defm	""
	defb	152

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	129

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	136

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
	defb	132

	defm	"H"
	defb	132

	defm	"DDD"
	defb	0

	defm	""
	defb	8

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
	defb	128

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	134

	defm	""
	defb	240

	defm	""
	defb	15

	defm	""
	defb	235

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	235

	defm	""
	defb	8

	defm	"vDfdFff"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	16

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"H"
	defb	136

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
	defb	34

	defm	""
	defb	34

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	168

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

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
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	255

	defm	""
	defb	235

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	246

	defm	""
	defb	134

	defm	"ffdDffx"
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	8

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"!"
	defb	208

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	128

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	209

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	3

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"UX"
	defb	136

	defm	"33"
	defb	228

	defm	""
	defb	16

	defm	""
	defb	14

	defm	""
	defb	250

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

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"("
;	SECTION	code


;	SECTION	text

._cerrojos
	defb	9
	defb	13
	defb	2
	defb	0
	defb	9
	defb	9
	defb	3
	defb	0
	defb	9
	defb	11
	defb	3
	defb	0
	defb	10
	defb	11
	defb	5
	defb	0
	defb	10
	defb	14
	defb	5
	defb	0
	defb	10
	defb	0
	defb	7
	defb	0
	defb	10
	defb	2
	defb	7
	defb	0
	defb	11
	defb	2
	defb	3
	defb	0
	defb	11
	defb	11
	defb	4
	defb	0
	defb	11
	defb	0
	defb	5
	defb	0
	defb	11
	defb	3
	defb	5
	defb	0
	defb	14
	defb	5
	defb	3
	defb	0
	defb	14
	defb	8
	defb	3
	defb	0
	defb	14
	defb	9
	defb	3
	defb	0
	defb	14
	defb	10
	defb	3
	defb	0
	defb	14
	defb	1
	defb	5
	defb	0
	defb	14
	defb	4
	defb	5
	defb	0
	defb	14
	defb	8
	defb	8
	defb	0
	defb	15
	defb	4
	defb	3
	defb	0
	defb	15
	defb	7
	defb	8
	defb	0
	defb	15
	defb	14
	defb	8
	defb	0
	defb	16
	defb	0
	defb	8
	defb	0
	defb	17
	defb	5
	defb	3
	defb	0
	defb	17
	defb	7
	defb	3
	defb	0
	defb	17
	defb	5
	defb	8
	defb	0
	defb	17
	defb	8
	defb	8
	defb	0
	defb	18
	defb	12
	defb	3
	defb	0
	defb	18
	defb	13
	defb	3
	defb	0
	defb	18
	defb	12
	defb	8
	defb	0
	defb	18
	defb	13
	defb	8
	defb	0
	defb	19
	defb	4
	defb	8
	defb	0
	defb	19
	defb	5
	defb	8
	defb	0
	defb	19
	defb	6
	defb	8
	defb	0
	defb	19
	defb	7
	defb	8
	defb	0
	defb	19
	defb	9
	defb	8
	defb	0
	defb	19
	defb	10
	defb	8
	defb	0
	defb	19
	defb	11
	defb	8
	defb	0
	defb	19
	defb	13
	defb	8
	defb	0
	defb	20
	defb	1
	defb	6
	defb	0
	defb	20
	defb	2
	defb	6
	defb	0
	defb	20
	defb	4
	defb	6
	defb	0
	defb	20
	defb	5
	defb	6
	defb	0
	defb	20
	defb	8
	defb	6
	defb	0
	defb	20
	defb	10
	defb	6
	defb	0
	defb	21
	defb	2
	defb	8
	defb	0
	defb	21
	defb	5
	defb	8
	defb	0
	defb	22
	defb	2
	defb	8
	defb	0
	defb	22
	defb	3
	defb	8
	defb	0
	defb	22
	defb	12
	defb	8
	defb	0
	defb	23
	defb	12
	defb	8
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
	defb 1, 254
	defb 2, 252
	defb 4, 248
	defb 0, 248
	defb 4, 248
	defb 0, 248
	defb 4, 248
	defb 8, 240
	defb 16, 224
	defb 32, 192
	defb 64, 128
	defb 65, 128
	defb 152, 0
	defb 164, 24
	defb 65, 184
	defb 3, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_b
	defb 160, 31
	defb 0, 15
	defb 80, 7
	defb 240, 7
	defb 0, 7
	defb 208, 7
	defb 208, 7
	defb 148, 3
	defb 242, 1
	defb 226, 1
	defb 2, 1
	defb 176, 1
	defb 162, 1
	defb 4, 3
	defb 16, 7
	defb 184, 7
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
	defb 0, 255
	defb 1, 254
	defb 2, 252
	defb 4, 248
	defb 0, 248
	defb 4, 248
	defb 0, 248
	defb 4, 248
	defb 8, 240
	defb 16, 224
	defb 32, 192
	defb 64, 128
	defb 73, 128
	defb 148, 8
	defb 161, 24
	defb 67, 184
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_2_b
	defb 0, 255
	defb 160, 31
	defb 0, 15
	defb 80, 7
	defb 240, 7
	defb 0, 7
	defb 208, 7
	defb 212, 3
	defb 146, 1
	defb 242, 1
	defb 226, 1
	defb 0, 1
	defb 178, 1
	defb 160, 3
	defb 8, 3
	defb 156, 3
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
	defb 1, 254
	defb 2, 252
	defb 0, 252
	defb 2, 252
	defb 0, 252
	defb 2, 252
	defb 4, 248
	defb 8, 240
	defb 16, 224
	defb 32, 192
	defb 33, 192
	defb 76, 128
	defb 82, 140
	defb 32, 220
	defb 1, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 208, 15
	defb 0, 7
	defb 40, 3
	defb 120, 3
	defb 0, 3
	defb 104, 3
	defb 104, 3
	defb 74, 1
	defb 121, 0
	defb 113, 0
	defb 1, 0
	defb 176, 0
	defb 161, 0
	defb 2, 1
	defb 136, 3
	defb 220, 3
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
	defb 0, 255
	defb 1, 254
	defb 2, 252
	defb 0, 252
	defb 2, 252
	defb 12, 240
	defb 18, 224
	defb 32, 192
	defb 64, 128
	defb 64, 128
	defb 152, 0
	defb 164, 24
	defb 64, 188
	defb 2, 248
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
	._sprite_4_b
	defb 208, 15
	defb 0, 7
	defb 40, 3
	defb 120, 3
	defb 0, 3
	defb 106, 1
	defb 105, 0
	defb 73, 0
	defb 121, 0
	defb 112, 0
	defb 1, 0
	defb 218, 1
	defb 80, 1
	defb 4, 1
	defb 14, 0
	defb 0, 255
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
	defb 5, 248
	defb 0, 240
	defb 10, 224
	defb 15, 224
	defb 0, 224
	defb 11, 224
	defb 11, 224
	defb 41, 192
	defb 79, 128
	defb 71, 128
	defb 64, 128
	defb 13, 128
	defb 69, 128
	defb 32, 192
	defb 8, 224
	defb 29, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_5_b
	defb 128, 127
	defb 64, 63
	defb 32, 31
	defb 0, 31
	defb 32, 31
	defb 0, 31
	defb 32, 31
	defb 16, 15
	defb 8, 7
	defb 4, 3
	defb 2, 1
	defb 130, 1
	defb 25, 0
	defb 37, 24
	defb 130, 29
	defb 192, 31
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
	defb 0, 255
	defb 5, 248
	defb 0, 240
	defb 10, 224
	defb 15, 224
	defb 0, 224
	defb 11, 224
	defb 43, 192
	defb 73, 128
	defb 79, 128
	defb 71, 128
	defb 0, 128
	defb 77, 128
	defb 5, 192
	defb 16, 192
	defb 57, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_6_b
	defb 0, 255
	defb 128, 127
	defb 64, 63
	defb 32, 31
	defb 0, 31
	defb 32, 31
	defb 0, 31
	defb 32, 31
	defb 16, 15
	defb 8, 7
	defb 4, 3
	defb 2, 1
	defb 146, 1
	defb 41, 16
	defb 133, 24
	defb 194, 29
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
	defb 11, 240
	defb 0, 224
	defb 20, 192
	defb 30, 192
	defb 0, 192
	defb 22, 192
	defb 22, 192
	defb 82, 128
	defb 158, 0
	defb 142, 0
	defb 128, 0
	defb 13, 0
	defb 133, 0
	defb 64, 128
	defb 17, 192
	defb 59, 192
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
	defb 128, 127
	defb 64, 63
	defb 0, 63
	defb 64, 63
	defb 0, 63
	defb 64, 63
	defb 32, 31
	defb 16, 15
	defb 8, 7
	defb 4, 3
	defb 132, 3
	defb 50, 1
	defb 74, 49
	defb 4, 59
	defb 128, 63
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
	defb 11, 240
	defb 0, 224
	defb 20, 192
	defb 30, 192
	defb 0, 192
	defb 86, 128
	defb 150, 0
	defb 146, 0
	defb 158, 0
	defb 14, 0
	defb 128, 0
	defb 91, 128
	defb 10, 128
	defb 32, 128
	defb 112, 0
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_8_b
	defb 0, 255
	defb 128, 127
	defb 64, 63
	defb 0, 63
	defb 64, 63
	defb 48, 15
	defb 72, 7
	defb 4, 3
	defb 2, 1
	defb 2, 1
	defb 25, 0
	defb 37, 24
	defb 2, 61
	defb 64, 31
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
	defb 1, 240
	defb 7, 224
	defb 3, 192
	defb 12, 192
	defb 26, 128
	defb 30, 128
	defb 12, 128
	defb 0, 128
	defb 30, 128
	defb 31, 128
	defb 11, 192
	defb 11, 192
	defb 3, 192
	defb 10, 192
	defb 0, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_11_b
	defb 192, 15
	defb 192, 15
	defb 224, 7
	defb 0, 7
	defb 96, 7
	defb 208, 3
	defb 240, 3
	defb 96, 3
	defb 0, 3
	defb 176, 3
	defb 240, 3
	defb 224, 7
	defb 96, 7
	defb 96, 7
	defb 64, 15
	defb 0, 31
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
	defb 3, 240
	defb 3, 240
	defb 7, 224
	defb 0, 224
	defb 6, 224
	defb 11, 192
	defb 15, 192
	defb 6, 192
	defb 0, 192
	defb 13, 192
	defb 15, 192
	defb 7, 224
	defb 6, 224
	defb 6, 224
	defb 2, 240
	defb 0, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_12_b
	defb 128, 15
	defb 224, 7
	defb 192, 3
	defb 48, 3
	defb 88, 1
	defb 120, 1
	defb 48, 1
	defb 0, 1
	defb 120, 1
	defb 248, 1
	defb 208, 3
	defb 208, 3
	defb 192, 3
	defb 80, 3
	defb 0, 7
	defb 0, 255
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
	defb 0, 195
	defb 60, 129
	defb 124, 1
	defb 248, 3
	defb 248, 1
	defb 250, 0
	defb 255, 0
	defb 253, 0
	defb 247, 0
	defb 254, 0
	defb 117, 0
	defb 119, 0
	defb 19, 128
	defb 0, 236
	defb 0, 255
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
	defb 0, 195
	defb 60, 129
	defb 62, 128
	defb 31, 192
	defb 31, 128
	defb 95, 0
	defb 255, 0
	defb 191, 0
	defb 239, 0
	defb 127, 0
	defb 174, 0
	defb 238, 0
	defb 200, 1
	defb 0, 55
	defb 0, 255
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
	defb 0, 223
	defb 32, 141
	defb 66, 24
	defb 67, 24
	defb 101, 0
	defb 247, 0
	defb 254, 0
	defb 245, 0
	defb 255, 0
	defb 251, 0
	defb 252, 0
	defb 124, 1
	defb 124, 1
	defb 30, 128
	defb 6, 224
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
	defb 0, 251
	defb 4, 177
	defb 66, 24
	defb 194, 24
	defb 166, 0
	defb 239, 0
	defb 127, 0
	defb 175, 0
	defb 255, 0
	defb 223, 0
	defb 63, 0
	defb 62, 128
	defb 62, 128
	defb 120, 1
	defb 96, 7
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
	defb 127, 0
	defb 0, 128
	defb 5, 240
	defb 7, 240
	defb 1, 248
	defb 2, 248
	defb 3, 248
	defb 1, 248
	defb 3, 248
	defb 4, 240
	defb 4, 241
	defb 2, 248
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
	._sprite_15_b
	defb 255, 0
	defb 255, 0
	defb 254, 0
	defb 0, 1
	defb 64, 15
	defb 160, 15
	defb 192, 31
	defb 128, 31
	defb 192, 31
	defb 64, 31
	defb 192, 31
	defb 32, 15
	defb 32, 143
	defb 64, 31
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
	defb 127, 0
	defb 0, 128
	defb 5, 240
	defb 7, 240
	defb 1, 248
	defb 2, 248
	defb 3, 248
	defb 0, 252
	defb 1, 252
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
	._sprite_16_b
	defb 255, 0
	defb 255, 0
	defb 254, 0
	defb 0, 1
	defb 64, 15
	defb 160, 15
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 128, 63
	defb 128, 63
	defb 0, 63
	defb 128, 63
	defb 0, 127
	defb 0, 255
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
	defb	176
	defb	80
	defb	176
	defb	80
	defb	16
	defb	80
	defb	-2
	defb	0
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
	defb	80
	defb	32
	defb	80
	defb	32
	defb	160
	defb	32
	defb	1
	defb	0
	defb	2
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	80
	defb	0
	defb	1
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
	defb	128
	defb	32
	defb	128
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	1
	defb	96
	defb	0
	defb	96
	defb	0
	defb	80
	defb	112
	defb	-1
	defb	1
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
	defb	112
	defb	0
	defb	112
	defb	0
	defb	160
	defb	128
	defb	2
	defb	2
	defb	3
	defb	80
	defb	0
	defb	80
	defb	0
	defb	32
	defb	96
	defb	-2
	defb	2
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
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	128
	defb	0
	defb	2
	defb	3
	defb	128
	defb	0
	defb	128
	defb	0
	defb	128
	defb	64
	defb	0
	defb	1
	defb	1
	defb	32
	defb	0
	defb	32
	defb	0
	defb	32
	defb	112
	defb	0
	defb	2
	defb	3
	defb	128
	defb	64
	defb	128
	defb	64
	defb	128
	defb	112
	defb	0
	defb	1
	defb	1
	defb	112
	defb	128
	defb	112
	defb	128
	defb	16
	defb	128
	defb	-2
	defb	0
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
	defb	16
	defb	32
	defb	16
	defb	32
	defb	144
	defb	32
	defb	2
	defb	0
	defb	2
	defb	160
	defb	16
	defb	160
	defb	16
	defb	176
	defb	128
	defb	1
	defb	1
	defb	3
	defb	144
	defb	112
	defb	144
	defb	112
	defb	16
	defb	112
	defb	-1
	defb	0
	defb	1
	defb	176
	defb	16
	defb	176
	defb	16
	defb	192
	defb	128
	defb	1
	defb	1
	defb	3
	defb	144
	defb	96
	defb	144
	defb	96
	defb	80
	defb	96
	defb	-1
	defb	0
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
	defb	128
	defb	112
	defb	128
	defb	112
	defb	128
	defb	16
	defb	0
	defb	-2
	defb	3
	defb	80
	defb	96
	defb	80
	defb	96
	defb	48
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	96
	defb	64
	defb	96
	defb	64
	defb	96
	defb	80
	defb	0
	defb	0
	defb	0
	defb	112
	defb	32
	defb	112
	defb	32
	defb	80
	defb	128
	defb	-2
	defb	2
	defb	3
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	1
	defb	0
	defb	4
	defb	160
	defb	112
	defb	160
	defb	112
	defb	48
	defb	96
	defb	-1
	defb	-1
	defb	3
	defb	208
	defb	80
	defb	208
	defb	80
	defb	176
	defb	80
	defb	-1
	defb	0
	defb	1
	defb	64
	defb	32
	defb	64
	defb	32
	defb	128
	defb	128
	defb	2
	defb	2
	defb	3
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	80
	defb	0
	defb	1
	defb	3
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	64
	defb	0
	defb	1
	defb	2
	defb	48
	defb	64
	defb	48
	defb	64
	defb	112
	defb	80
	defb	1
	defb	1
	defb	3
	defb	192
	defb	96
	defb	192
	defb	96
	defb	128
	defb	96
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	32
	defb	32
	defb	32
	defb	32
	defb	16
	defb	0
	defb	0
	defb	1
	defb	144
	defb	48
	defb	144
	defb	48
	defb	144
	defb	112
	defb	0
	defb	2
	defb	3
	defb	128
	defb	128
	defb	128
	defb	128
	defb	64
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	160
	defb	32
	defb	160
	defb	32
	defb	160
	defb	48
	defb	0
	defb	0
	defb	0
	defb	192
	defb	128
	defb	192
	defb	128
	defb	192
	defb	112
	defb	0
	defb	0
	defb	6
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
	defb	1
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
	defb	48
	defb	48
	defb	48
	defb	48
	defb	112
	defb	48
	defb	1
	defb	0
	defb	1
	defb	96
	defb	80
	defb	96
	defb	80
	defb	112
	defb	128
	defb	1
	defb	1
	defb	3
	defb	208
	defb	80
	defb	208
	defb	80
	defb	208
	defb	128
	defb	0
	defb	1
	defb	3
	defb	144
	defb	128
	defb	144
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	80
	defb	128
	defb	16
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	80
	defb	16
	defb	80
	defb	16
	defb	144
	defb	48
	defb	1
	defb	1
	defb	3
	defb	128
	defb	128
	defb	128
	defb	128
	defb	16
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	16
	defb	48
	defb	16
	defb	48
	defb	112
	defb	48
	defb	1
	defb	0
	defb	1
	defb	144
	defb	16
	defb	144
	defb	16
	defb	192
	defb	128
	defb	2
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
	defb	4
	defb	112
	defb	64
	defb	112
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	4
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	112
	defb	0
	defb	2
	defb	3
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	1
	defb	4
	defb	208
	defb	128
	defb	208
	defb	128
	defb	208
	defb	112
	defb	0
	defb	0
	defb	6
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	32
	defb	0
	defb	0
	defb	6
	defb	16
	defb	96
	defb	16
	defb	96
	defb	16
	defb	80
	defb	0
	defb	0
	defb	6
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	48
	defb	80
	defb	48
	defb	176
	defb	48
	defb	1
	defb	0
	defb	4
	defb	192
	defb	48
	defb	192
	defb	48
	defb	192
	defb	128
	defb	0
	defb	1
	defb	4
	defb	80
	defb	96
	defb	80
	defb	96
	defb	112
	defb	128
	defb	1
	defb	1
	defb	3
	defb	112
	defb	128
	defb	112
	defb	128
	defb	112
	defb	32
	defb	0
	defb	-1
	defb	4
	defb	192
	defb	128
	defb	192
	defb	128
	defb	144
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	80
	defb	128
	defb	16
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	112
	defb	112
	defb	112
	defb	112
	defb	112
	defb	48
	defb	0
	defb	-1
	defb	4
	defb	208
	defb	16
	defb	208
	defb	16
	defb	192
	defb	16
	defb	0
	defb	0
	defb	6
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
	defb	52
	defb	1
	defb	0
	defb	119
	defb	1
	defb	0
	defb	151
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
	defb	39
	defb	1
	defb	0
	defb	150
	defb	1
	defb	0
	defb	135
	defb	1
	defb	0
	defb	184
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	72
	defb	1
	defb	0
	defb	199
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

;	SECTION	code

	.sound_play
	ld hl, soundEffectsData ;address of sound effects data
	;di
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
	;ei
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

._peta_el_beeper
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
	ld a, (hl)
	cp 15
	jr c, _attr_1
	ld hl, 0
	ret
	._attr_1
	ld c, a
	dec hl
	dec hl
	ld a, (hl)
	cp 10
	jr c, _attr_2
	ld hl, 0
	ret
	._attr_2
	ld b, a
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
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__t),a
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asl
	ld	de,64
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_tileset
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2048
	add	hl,de
	pop	de
	add	hl,de
	ld	(_gp_gen),hl
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
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	ld	hl,2	;const
	add	hl,sp
	inc	(hl)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	ld	hl,2	;const
	add	hl,sp
	inc	(hl)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	ld	hl,2	;const
	add	hl,sp
	inc	(hl)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
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
	dec	sp
.i_25
	ld	hl,3	;const
	add	hl,sp
	call	l_gint	;
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_26
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,5	;const
	add	hl,sp
	call	l_gint	;
	call	l_gchar
	ld	bc,-32
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,11	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
	push	hl
	ld	hl,9	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,3	;const
	add	hl,sp
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	dec	hl
	jp	i_25
.i_26
	inc	sp
	ret


	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"

._unpack
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_asm_int),hl
	ld hl, 22528
	ld (hl), 0
	push hl
	pop de
	inc de
	ld bc, 767
	ldir
	ld hl, (_asm_int)
	ld de, 16384
	call depack
	ret



._espera_activa
	ei
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
	halt
	call	sp_GetKey
	ld	a,h
	or	l
	jr	nz,i_28
.i_29
	jp	i_27
.i_28
	di
	ret



._title_screen
	call	sp_UpdateNow
	ld	hl,_s_title
	push	hl
	call	_unpack
	pop	bc
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,4 % 256	;const
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
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	push	hl
	ld	hl,i_1+19
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,i_1+32
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+45
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,i_1+62
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	; Music generated by beepola
	call musicstart
	di
.i_30
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_32
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_31
.i_32
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_34
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_31
.i_34
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_36
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_31
.i_36
.i_35
.i_33
	jp	i_30
.i_31
	ret



._game_ending
	call	sp_UpdateNow
	ld	hl,_s_ending
	push	hl
	call	_unpack
	pop	bc
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_39
.i_37
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_39
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_38
	jp	nc,i_38
	ld	hl,6 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,3 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	jp	i_37
.i_38
	ld	hl,11 % 256	;const
	push	hl
	call	_peta_el_beeper
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
	ld	hl,96 % 256	;const
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
	ld	hl,96 % 256	;const
	push	hl
	ld	hl,i_1+75
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_42
.i_40
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_42
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_41
	jp	nc,i_41
	ld	hl,6 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,3 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	jp	i_40
.i_41
	ld	hl,10 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret


;	SECTION	text

._e_scripts
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_2
	defw	0
	defw	0
	defw	0
	defw	_mscce_3
	defw	0
	defw	0
	defw	_mscce_4
	defw	0
	defw	_mscce_6
	defw	_mscce_5
	defw	0
	defw	0
	defw	_mscce_11
	defw	_mscce_12
	defw	_mscce_8
	defw	_mscce_7
	defw	_mscce_9
	defw	_mscce_10
	defw	_mscce_0
	defw	_mscce_1

;	SECTION	code

;	SECTION	text

._f_scripts
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_1
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_3
	defw	_msccf_2
	defw	0
	defw	0
	defw	_msccf_8
	defw	_msccf_9
	defw	_msccf_5
	defw	_msccf_4
	defw	_msccf_6
	defw	_msccf_7
	defw	0
	defw	_msccf_0
	defw	0

;	SECTION	code

	._mscce_0
	defb 0x06, 0xF0, 0xFF, 0xB3, 0x62, 0x65, 0xFF, 0xFF
	._mscce_1
	defb 0x05, 0x10, 0x02, 0x04, 0xFF, 0xFF, 0xFF
	._mscce_2
	defb 0x12, 0xF0, 0xFF, 0x20, 0x0C, 0x07, 0x17, 0x20, 0x0D, 0x06, 0x18, 0xA6, 0xA7, 0x51, 0xB4, 0x54, 0xDF, 0x7F, 0xFF, 0xFF
	._mscce_3
	defb 0x2B, 0xF0, 0xFF, 0x20, 0x07, 0x02, 0x19, 0x20, 0x07, 0x03, 0x1A, 0xE3, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x25, 0x2E, 0x34, 0x32, 0x21, 0x24, 0x21, 0x00, 0x21, 0x2C, 0x00, 0x33, 0x35, 0x22, 0x34, 0x25, 0x32, 0x32, 0x21, 0x2E, 0x25, 0x2F, 0x00, 0x00, 0xEE, 0xFF, 0xFF
	._mscce_4
	defb 0x33, 0xF0, 0xFF, 0x20, 0x04, 0x06, 0x1B, 0x20, 0x04, 0x07, 0x1C, 0x20, 0x07, 0x06, 0x19, 0x20, 0x07, 0x07, 0x1A, 0xE3, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x25, 0x2E, 0x34, 0x32, 0x21, 0x24, 0x21, 0x00, 0x21, 0x2C, 0x00, 0x33, 0x35, 0x22, 0x34, 0x25, 0x32, 0x32, 0x21, 0x2E, 0x25, 0x2F, 0x00, 0x00, 0xEE, 0xFF, 0xFF
	._mscce_5
	defb 0x31, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x2D, 0x21, 0x23, 0x21, 0x32, 0x29, 0x21, 0x00, 0x2C, 0x21, 0x00, 0x25, 0x33, 0x34, 0x32, 0x21, 0x26, 0x21, 0x2C, 0x21, 0x32, 0x29, 0x21, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x20, 0x02, 0x07, 0x15, 0x20, 0x03, 0x07, 0x1D, 0x51, 0x18, 0x64, 0x4C, 0x7F, 0xA6, 0xFF, 0x07, 0xA8, 0xFF, 0x20, 0x00, 0x03, 0x1F, 0xFF, 0x07, 0xB8, 0xFF, 0x20, 0x03, 0x07, 0x1E, 0xFF, 0xFF
	._mscce_6
	defb 0x2E, 0xA9, 0xFF, 0x61, 0xA6, 0x20, 0x02, 0x02, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x33, 0x25, 0x34, 0x21, 0x00, 0x23, 0x2F, 0x2E, 0x00, 0x34, 0x25, 0x34, 0x21, 0x33, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x51, 0x20, 0x20, 0x2F, 0x2F, 0xFF, 0xFF
	._mscce_7
	defb 0x31, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x2C, 0x22, 0x25, 0x32, 0x34, 0x2F, 0x00, 0x25, 0x2C, 0x00, 0x34, 0x35, 0x25, 0x32, 0x34, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x20, 0x03, 0x02, 0x13, 0x20, 0x04, 0x02, 0x1D, 0x51, 0x30, 0x10, 0x59, 0x2F, 0xA6, 0xFF, 0x07, 0xAA, 0xFF, 0x20, 0x00, 0x07, 0x1F, 0xFF, 0x07, 0xBA, 0xFF, 0x20, 0x04, 0x02, 0x1E, 0xFF, 0xFF
	._mscce_8
	defb 0x2E, 0xAB, 0xFF, 0x61, 0xA6, 0x20, 0x06, 0x04, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x33, 0x25, 0x34, 0x21, 0x00, 0x23, 0x2F, 0x2E, 0x00, 0x34, 0x25, 0x34, 0x21, 0x33, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x51, 0x60, 0x40, 0x6F, 0x4F, 0xFF, 0xFF
	._mscce_9
	defb 0x31, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x2F, 0x2E, 0x2F, 0x33, 0x2F, 0x00, 0x25, 0x2C, 0x00, 0x33, 0x25, 0x22, 0x2F, 0x33, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x20, 0x0C, 0x02, 0x1D, 0x20, 0x0D, 0x02, 0x14, 0x51, 0xB6, 0x10, 0xDF, 0x2F, 0xA6, 0xFF, 0x07, 0xAC, 0xFF, 0x20, 0x0E, 0x07, 0x1F, 0xFF, 0x07, 0xBC, 0xFF, 0x20, 0x0C, 0x02, 0x1E, 0xFF, 0xFF
	._mscce_10
	defb 0x2E, 0xAD, 0xFF, 0x61, 0xA6, 0x20, 0x0D, 0x08, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x33, 0x25, 0x34, 0x21, 0x00, 0x23, 0x2F, 0x2E, 0x00, 0x34, 0x25, 0x34, 0x21, 0x33, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x51, 0xD0, 0x80, 0xDF, 0x8F, 0xFF, 0xFF
	._mscce_11
	defb 0x31, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x29, 0x34, 0x2F, 0x32, 0x00, 0x25, 0x2C, 0x00, 0x2C, 0x25, 0x2E, 0x21, 0x24, 0x2F, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x20, 0x0C, 0x08, 0x1D, 0x20, 0x0D, 0x08, 0x16, 0x51, 0xB6, 0x80, 0xDF, 0x8F, 0xA6, 0xFF, 0x07, 0xAE, 0xFF, 0x20, 0x0E, 0x03, 0x1F, 0xFF, 0x07, 0xBE, 0xFF, 0x20, 0x0C, 0x08, 0x1E, 0xFF, 0xFF
	._mscce_12
	defb 0x2E, 0xAF, 0xFF, 0x61, 0xA6, 0x20, 0x0D, 0x08, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x2E, 0x21, 0x00, 0x33, 0x25, 0x34, 0x21, 0x00, 0x23, 0x2F, 0x2E, 0x00, 0x34, 0x25, 0x34, 0x21, 0x33, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x51, 0xD0, 0x80, 0xDF, 0x8F, 0xFF, 0xFF
	._msccf_0
	defb 0x05, 0xF0, 0xFF, 0x30, 0x01, 0xFF, 0x2A, 0x10, 0x01, 0x14, 0xFF, 0xE0, 0x08, 0x65, 0x61, 0x6E, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x32, 0x21, 0x2D, 0x30, 0x21, 0x00, 0x24, 0x25, 0x33, 0x21, 0x23, 0x34, 0x29, 0x36, 0x21, 0x24, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xFF, 0xFF
	._msccf_1
	defb 0x0B, 0x21, 0xC0, 0xDF, 0x22, 0x60, 0x7F, 0x41, 0x0E, 0xFF, 0xF1, 0xFF, 0x2A, 0x20, 0x0C, 0x07, 0xA6, 0xFF, 0xE3, 0x00, 0x00, 0x33, 0x25, 0x34, 0x21, 0x33, 0x01, 0x00, 0x33, 0x25, 0x34, 0x21, 0x33, 0x00, 0x23, 0x2F, 0x2E, 0x00, 0x34, 0x25, 0x34, 0x21, 0x33, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x07, 0xB6, 0xFF, 0x2A, 0x20, 0x0D, 0x06, 0xA7, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x2F, 0x2C, 0x21, 0x00, 0x30, 0x29, 0x32, 0x21, 0x34, 0x21, 0x0E, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x0B, 0xB7, 0xFF, 0xFF
	._msccf_2
	defb 0x31, 0x20, 0x03, 0x07, 0xA8, 0xFF, 0xB8, 0x20, 0x03, 0x07, 0x1E, 0x20, 0x00, 0x03, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x32, 0x29, 0x30, 0x34, 0x21, 0x00, 0x21, 0x22, 0x29, 0x25, 0x32, 0x34, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE0, 0x08, 0xFF, 0x2A, 0x20, 0x02, 0x07, 0xA6, 0xFF, 0xB6, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x21, 0x2C, 0x25, 0x00, 0x26, 0x32, 0x21, 0x2E, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x0B, 0xFF, 0xFF
	._msccf_3
	defb 0x3D, 0xA9, 0xA6, 0x20, 0x02, 0x02, 0xFF, 0xA1, 0xB6, 0xB9, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x0E, 0x03, 0x10, 0x20, 0x02, 0x02, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x34, 0x32, 0x21, 0x30, 0x21, 0x24, 0x2F, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_4
	defb 0x31, 0x20, 0x04, 0x02, 0xAA, 0xFF, 0xBA, 0x20, 0x04, 0x02, 0x1E, 0x20, 0x00, 0x07, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x32, 0x29, 0x30, 0x34, 0x21, 0x00, 0x21, 0x22, 0x29, 0x25, 0x32, 0x34, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE0, 0x08, 0xFF, 0x2A, 0x20, 0x03, 0x02, 0xA6, 0xFF, 0xB6, 0xE3, 0x25, 0x33, 0x34, 0x21, 0x33, 0x00, 0x2C, 0x25, 0x2A, 0x2F, 0x33, 0x00, 0x2F, 0x00, 0x25, 0x32, 0x25, 0x33, 0x00, 0x2D, 0x35, 0x39, 0x00, 0x23, 0x28, 0x29, 0x23, 0x2F, 0x1F, 0x00, 0xEE, 0xE1, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_5
	defb 0x3D, 0xAB, 0xA6, 0x20, 0x06, 0x04, 0xFF, 0xA1, 0xB6, 0xBB, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x0E, 0x07, 0x10, 0x20, 0x06, 0x04, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x34, 0x32, 0x21, 0x30, 0x21, 0x24, 0x2F, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_6
	defb 0x31, 0x20, 0x0C, 0x02, 0xAC, 0xFF, 0xBC, 0x20, 0x0C, 0x02, 0x1E, 0x20, 0x0E, 0x07, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x32, 0x29, 0x30, 0x34, 0x21, 0x00, 0x21, 0x22, 0x29, 0x25, 0x32, 0x34, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE0, 0x08, 0xFF, 0x2A, 0x20, 0x0D, 0x02, 0xA6, 0xFF, 0xB6, 0xE3, 0x2D, 0x25, 0x00, 0x23, 0x2F, 0x2D, 0x25, 0x32, 0x29, 0x21, 0x00, 0x35, 0x2E, 0x00, 0x28, 0x25, 0x2C, 0x21, 0x2F, 0x00, 0x25, 0x2E, 0x00, 0x2D, 0x21, 0x2E, 0x34, 0x25, 0x23, 0x21, 0xEE, 0xE1, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_7
	defb 0x3D, 0xAD, 0xA6, 0x20, 0x0D, 0x08, 0xFF, 0xA1, 0xB6, 0xBD, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x00, 0x07, 0x10, 0x20, 0x0D, 0x08, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x34, 0x32, 0x21, 0x30, 0x21, 0x24, 0x2F, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_8
	defb 0x31, 0x20, 0x0C, 0x08, 0xAE, 0xFF, 0xBE, 0x20, 0x0C, 0x08, 0x1E, 0x20, 0x0E, 0x03, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x32, 0x29, 0x30, 0x34, 0x21, 0x00, 0x21, 0x22, 0x29, 0x25, 0x32, 0x34, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE0, 0x08, 0xFF, 0x2A, 0x20, 0x0D, 0x08, 0xA6, 0xFF, 0xB6, 0xE3, 0x00, 0x36, 0x2F, 0x39, 0x00, 0x24, 0x25, 0x00, 0x23, 0x2F, 0x2D, 0x30, 0x32, 0x21, 0x33, 0x00, 0x2C, 0x2F, 0x33, 0x00, 0x2D, 0x29, 0x25, 0x32, 0x23, 0x2F, 0x2C, 0x25, 0x33, 0x00, 0xEE, 0xE1, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_9
	defb 0x3D, 0xAF, 0xA6, 0x20, 0x0D, 0x08, 0xFF, 0xA1, 0xB6, 0xBF, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x00, 0x03, 0x10, 0x20, 0x0D, 0x08, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x34, 0x32, 0x21, 0x30, 0x21, 0x24, 0x2F, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xE1, 0xE0, 0x06, 0xFF, 0xFF

._msc_init_all
	ld hl, _flags
	ld de, _flags+1
	ld bc, 16-1
	xor a
	ld (hl), a
	ldir
	ret



._read_byte
	ld hl, (_script)
	ld a, (hl)
	inc hl
	ld (_script), hl
	ld l, a
	ld h, 0
	and 0xF0
	ld (_sc_i), a
	ld a, l
	and 0x0f
	ld (_sc_m), a
	ret



._read_vbyte
	call _read_byte
	;ld a, l
	bit 7, a
	ret z
	and 127
	ld d, 0
	ld e, a
	ld hl, _flags
	add hl, de
	ld l, (hl)
	ld h, 0
	ret



._read_x_y
	call _read_vbyte
	ld a, l
	ld (_sc_x), a
	call _read_vbyte
	ld a, l
	ld (_sc_y), a
	ret



._run_script
	ld	a,#(0 % 256 % 256)
	ld	(_sc_res),a
	ld	hl,(_script)
	ld	a,h
	or	l
	jp	nz,i_45
	ret


.i_45
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_46
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_eq
	jp	c,i_47
.i_48
	ld	de,(_script)
	ld	hl,(_sc_c)
	ld	h,0
	add	hl,de
	ld	(_next_script),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_continuar),a
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
.i_49
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_50
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_51
	ld	de,_flags
	ld	hl,(_sc_m)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_52
.i_51
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_53
	ld	de,_flags
	ld	hl,(_sc_m)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_54
.i_53
	ld	hl,(_sc_c)
	ld	h,0
.i_57
	ld	a,l
	cp	#(16% 256)
	jp	z,i_58
	cp	#(32% 256)
	jp	z,i_59
	cp	#(33% 256)
	jp	z,i_62
	cp	#(34% 256)
	jp	z,i_65
	cp	#(65% 256)
	jp	z,i_68
	cp	#(240% 256)
	jp	z,i_69
	cp	#(255% 256)
	jp	z,i_70
	jp	i_56
.i_58
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_read_vbyte
	pop	de
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_56
.i_59
	call	_read_x_y
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	a,(_sc_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_ge
	jp	nc,i_60
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	a,(_sc_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_le
	jp	nc,i_60
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_ge
	jp	nc,i_60
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_le
	jp	nc,i_60
	ld	hl,1	;const
	jr	i_61
.i_60
	ld	hl,0	;const
.i_61
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_56
.i_62
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_x),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_y),a
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_x)
	ld	h,0
	call	l_ge
	jp	nc,i_63
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_le
	jp	nc,i_63
	ld	hl,1	;const
	jr	i_64
.i_63
	ld	hl,0	;const
.i_64
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_56
.i_65
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_x),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_y),a
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_x)
	ld	h,0
	call	l_ge
	jp	nc,i_66
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_le
	jp	nc,i_66
	ld	hl,1	;const
	jr	i_67
.i_66
	ld	hl,0	;const
.i_67
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_56
.i_68
	ld	hl,_player+26
	call	l_gchar
	push	hl
	call	_read_vbyte
	pop	de
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
.i_69
	jp	i_56
.i_70
	ld a, 1
	ld (_sc_terminado), a
	ld (_sc_continuar), a
	ld (_script_something_done), a
.i_56
.i_54
.i_52
	jp	i_49
.i_50
	ld	a,(_sc_continuar)
	and	a
	jp	z,i_71
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_72
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_73
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_74
	ld	hl,_flags
	push	hl
	ld	a,(_sc_m)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_75
.i_74
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_76
	ld	hl,_flags
	push	hl
	ld	a,(_sc_m)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	pop	de
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_77
.i_76
	ld	hl,(_sc_c)
	ld	h,0
.i_80
	ld	a,l
	cp	#(16% 256)
	jp	z,i_81
	cp	#(32% 256)
	jp	z,i_82
	cp	#(48% 256)
	jp	z,i_83
	cp	#(64% 256)
	jp	z,i_84
	cp	#(81% 256)
	jp	z,i_85
	cp	#(96% 256)
	jp	z,i_86
	cp	#(97% 256)
	jp	z,i_87
	cp	#(98% 256)
	jp	z,i_88
	cp	#(100% 256)
	jp	z,i_89
	cp	#(101% 256)
	jp	z,i_90
	cp	#(110% 256)
	jp	z,i_91
	cp	#(224% 256)
	jp	z,i_92
	cp	#(225% 256)
	jp	z,i_93
	cp	#(227% 256)
	jp	z,i_94
	cp	#(241% 256)
	jp	z,i_98
	cp	#(255% 256)
	jp	z,i_99
	jp	i_79
.i_81
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_79
.i_82
	call	_read_x_y
	call	_read_vbyte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	ld	hl,_map_buff
	push	hl
	ld	hl,(_sc_x)
	ld	h,0
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sc_n
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_map_attr
	push	hl
	ld	hl,(_sc_x)
	ld	h,0
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_sc_n)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_sc_x)
	ld	h,0
	ld	de,1
	add	hl,de
	ex	de,hl
	ld	hl,(_sc_x)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_sc_y)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_sc_n)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	jp	i_79
.i_83
	ld	hl,_player+28
	push	hl
	call	l_gint	;
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	jp	i_79
.i_84
	ld	hl,_player+26
	push	hl
	call	l_gchar
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_79
.i_85
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzx1),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzy1),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzx2),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzy2),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_f_zone_ac),a
	jp	i_79
.i_86
	ld	hl,_scenery_info
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_79
.i_87
	ld	hl,_scenery_info
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_79
.i_88
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_79
.i_89
	ld	hl,_scenery_info+4
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_79
.i_90
	ld	hl,_scenery_info+4
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_79
.i_91
	call	_draw_scr_background
	jp	i_79
.i_92
	call	_read_vbyte
	ld	h,0
	push	hl
	call	_peta_el_beeper
	pop	bc
	jp	i_79
.i_93
	call	sp_UpdateNow
	jp	i_79
.i_94
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_x),a
.i_95
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	ld	e,a
	ld	d,0
	ld	hl,238	;const
	call	l_eq
	jp	c,i_96
.i_97
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,(_sc_x)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,(_sc_n)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_sc_x
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	jp	i_95
.i_96
	jp	i_79
.i_98
	ld a, 1
	ld (_sc_terminado), a
	ld (_script_result), a
	jp	i_79
.i_99
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_79
.i_77
.i_75
	jp	i_72
.i_73
.i_71
	ld	hl,(_next_script)
	ld	(_script),hl
	jp	i_46
.i_47
	ld	hl,(_sc_res)
	ld	h,0
	ret



._do_extern_action
	ret



._tileset_offset_calc
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	hl,10	;const
	call	l_ult
	jp	c,i_101
	ld	a,(_n_pant)
	cp	#(12 % 256)
	jp	z,i_101
	ld	a,(_n_pant)
	cp	#(13 % 256)
	jp	nz,i_100
.i_101
	ld	hl,0 % 256	;const
	ret


.i_100
	ld	hl,32 % 256	;const
	ret



._saca_a_todo_el_mundo_de_aqui
	ld	hl,(_sp_player)
	push	hl
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	sp_MoveSprAbs
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_105
.i_103
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_105
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_104
	jp	nc,i_104
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
	ld	a,h
	or	l
	jp	z,i_106
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_gpit)
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
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
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
.i_106
	jp	i_103
.i_104
	ret



._collide
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_uge
	jp	nc,i_107
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_107
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ex	de,hl
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_uge
	jp	nc,i_107
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_107
	ld	hl,1	;const
	jr	i_108
.i_107
	ld	hl,0	;const
.i_108
	ld	h,0
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
	jp	p,i_109
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_109
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_110
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



._get_coin
	ld	hl,_flags+1
	inc	(hl)
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_flags+1)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_map_attr
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_map_buff
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,1
	add	hl,de
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,5 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,_f_scripts
	push	hl
	ld	hl,(_max_screens)
	ld	h,0
	inc	hl
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	ret



._move
	ld	hl,(_player)
	ld	(_gpcx),hl
	ld	hl,(_player+1+1)
	ld	(_gpcy),hl
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_111
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_111
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_pad0),a
	ld	hl,(_player+8)
	ld	de,512	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_112
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_player+10
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	jp	i_113
.i_112
	ld	hl,512	;const
	ld	(_player+8),hl
.i_113
	ld	a,(_player+25)
	and	a
	jp	z,i_114
	ld	hl,0	;const
	ld	(_player+8),hl
.i_114
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
	jp	p,i_115
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_115
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_116
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_116
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
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_117
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_119
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_120
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_120
	ld	hl,1	;const
	jr	i_121
.i_120
	ld	hl,0	;const
.i_121
	ld	a,h
	or	l
	jp	nz,i_119
	jr	i_122
.i_119
	ld	hl,1	;const
.i_122
	ld	a,h
	or	l
	jp	z,i_118
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	ld	a,l
	ld	(_gpyy),a
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
.i_118
	jp	i_123
.i_117
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_125
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jr	c,i_126_i_125
.i_125
	jp	i_124
.i_126_i_125
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_127
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	c,i_129
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_130
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_130
	ld	hl,1	;const
	jr	i_131
.i_130
	ld	hl,0	;const
.i_131
	ld	a,h
	or	l
	jp	nz,i_129
	jr	i_132
.i_129
	ld	hl,1	;const
.i_132
	ld	a,h
	or	l
	jp	z,i_128
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
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
.i_128
.i_127
.i_124
.i_123
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_134
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_136
.i_134
	ld	hl,(_player+8)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_137
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_137
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	c,i_138
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_139
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_139
	ld	hl,1	;const
	jr	i_140
.i_139
	ld	hl,0	;const
.i_140
	ld	a,h
	or	l
	jp	nz,i_138
	jr	i_141
.i_138
	ld	hl,1	;const
.i_141
	ld	a,h
	or	l
	jp	z,i_137
	ld	hl,1	;const
	jr	i_142
.i_137
	ld	hl,0	;const
.i_142
	ld	a,h
	or	l
	jp	nz,i_143
	ld	a,(_player+25)
	and	a
	jp	z,i_136
.i_143
	jr	i_145_i_136
.i_136
	jp	i_133
.i_145_i_136
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_133
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,128	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_147
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_149
.i_147
	ld	a,(_player+19)
	and	a
	jr	nz,i_150_i_149
.i_149
	jp	i_146
.i_150_i_149
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_player+13)
	ld	h,0
	ld	bc,16
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
	jp	nc,i_151
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_151
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_152
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_152
.i_146
	ld	hl,_pad0
	ld	a,(hl)
	and	#(128 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_154
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(1 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_155_i_154
.i_154
	jp	i_153
.i_155_i_154
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
.i_153
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_157
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_157
	ld	hl,0	;const
	jr	i_158
.i_157
	ld	hl,1	;const
.i_158
	call	l_lneg
	jp	nc,i_156
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_159
	or	l
	jp	z,i_159
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
	jp	p,i_160
	ld	hl,0	;const
	ld	(_player+6),hl
.i_160
	jp	i_161
.i_159
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_162
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
	jp	m,i_163
	or	l
	jp	z,i_163
	ld	hl,0	;const
	ld	(_player+6),hl
.i_163
.i_162
.i_161
.i_156
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_164
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_165
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
.i_165
.i_164
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_166
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_167
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
.i_167
.i_166
	ld	hl,_player
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,(_player+6)
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,(_player)
	xor	a
	or	h
	jp	p,i_168
	ld	hl,0	;const
	ld	(_player),hl
.i_168
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_169
	ld	hl,14336	;const
	ld	(_player),hl
.i_169
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
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_170
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_172
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_173
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_173
	ld	hl,1	;const
	jr	i_174
.i_173
	ld	hl,0	;const
.i_174
	ld	a,h
	or	l
	jp	nz,i_172
	jr	i_175
.i_172
	ld	hl,1	;const
.i_175
	ld	a,h
	or	l
	jp	z,i_171
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	ld	a,l
	ld	(_gpxx),a
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
.i_171
	jp	i_176
.i_170
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_178
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_179
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_179
	ld	hl,1	;const
	jr	i_180
.i_179
	ld	hl,0	;const
.i_180
	ld	a,h
	or	l
	jp	nz,i_178
	jr	i_181
.i_178
	ld	hl,1	;const
.i_181
	ld	a,h
	or	l
	jp	z,i_177
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
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
.i_177
.i_176
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h
	or	l
	jp	z,i_183
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_184
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_184
	inc	hl
	jr	i_185
.i_184
	ld	hl,0	;const
.i_185
	ld	a,h
	or	l
	jp	nz,i_183
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_186
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_186
	inc	hl
	jr	i_187
.i_186
	ld	hl,0	;const
.i_187
	ld	a,h
	or	l
	jp	nz,i_183
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_188
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_188
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_188
	inc	hl
	jr	i_189
.i_188
	ld	hl,0	;const
.i_189
	ld	a,h
	or	l
	jp	nz,i_183
	jr	i_190
.i_183
	ld	hl,1	;const
.i_190
	ld	a,h
	or	l
	jp	z,i_182
	ld	hl,2 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,_player+28
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
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
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
.i_182
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	c,i_192
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_193
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	c,i_192
.i_193
	jr	i_193_i_194
.i_194
	ld	a,h
	or	l
	jp	nz,i_192
.i_193_i_194
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_195
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	c,i_192
.i_195
	jr	i_195_i_196
.i_196
	ld	a,h
	or	l
	jp	nz,i_192
.i_195_i_196
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_197
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_197
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_197
	ld	hl,1	;const
	jr	i_198
.i_197
	ld	hl,0	;const
.i_198
	ld	a,h
	or	l
	jp	nz,i_192
	jr	i_199
.i_192
	ld	hl,1	;const
.i_199
	ld	a,h
	or	l
	jp	z,i_191
	ld	a,(_player+34)
	ld	e,a
	ld	d,0
	ld	hl,32	;const
	call	l_uge
	jp	c,i_201
	ld	hl,(_scenery_info+1+1+1)
	ld	h,0
	call	l_lneg
	jp	nc,i_200
.i_201
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	nc,i_203
	ld	hl,_player+33
	push	hl
	ld	l,(hl)
	ld	h,0
	inc	hl
	ld	de,3	;const
	ex	de,hl
	call	l_and
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_player+33)
	ld	h,0
	call	l_lneg
	jp	nc,i_204
	ld	hl,3 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_204
	ld	hl,_player+28
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	inc	hl
.i_203
	jp	i_205
.i_200
	ld	a,(_player+33)
	cp	#(8 % 256)
	jp	z,i_206
	jp	c,i_206
	ld	hl,_player+33
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+34
	inc	(hl)
	ld	hl,2 % 256	;const
	push	hl
	call	sp_Border
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,0 % 256	;const
	push	hl
	call	sp_Border
	pop	bc
	jp	i_207
.i_206
	ld	hl,_player+33
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_207
.i_205
	jp	i_208
.i_191
	ld	a,(_player+34)
	and	a
	jp	z,i_209
	ld	hl,_player+34
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_209
.i_208
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_210
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_210
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_212
	inc	hl
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
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_213_i_212
.i_212
	jp	i_211
.i_213_i_212
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_211
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_215
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_216_i_215
.i_215
	jp	i_214
.i_216_i_215
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_214
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_218
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_218
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_219_i_218
.i_218
	jp	i_217
.i_219_i_218
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_217
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	z,i_220
	ld	a,(_player+22)
	and	a
	jp	nz,i_221
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_8_a
	pop	de
	call	l_pint
	jp	i_222
.i_221
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_4_a
	pop	de
	call	l_pint
.i_222
	jp	i_223
.i_220
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_224
	ld	a,(_player+22)
	and	a
	jp	nz,i_225
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_6_a
	pop	de
	call	l_pint
	jp	i_226
.i_225
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_2_a
	pop	de
	call	l_pint
.i_226
	jp	i_227
.i_224
	ld	hl,_player+21
	inc	(hl)
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_228
	ld	hl,_player+21
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+20
	push	hl
	ld	l,(hl)
	ld	h,0
	inc	hl
	ld	de,3	;const
	ex	de,hl
	call	l_and
	pop	de
	ld	a,l
	ld	(de),a
	call	_step
.i_228
	ld	a,(_player+22)
	and	a
	jp	nz,i_229
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_231
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_230
.i_231
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_6_a
	pop	de
	call	l_pint
	jp	i_233
.i_230
	ld	a,(_player+20)
	and	a
	jp	nz,i_234
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_5_a
	pop	de
	call	l_pint
	jp	i_235
.i_234
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_236
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_7_a
	pop	de
	call	l_pint
.i_236
.i_235
.i_233
	jp	i_237
.i_229
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_239
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_238
.i_239
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_2_a
	pop	de
	call	l_pint
	jp	i_241
.i_238
	ld	a,(_player+20)
	and	a
	jp	nz,i_242
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_1_a
	pop	de
	call	l_pint
	jp	i_243
.i_242
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_244
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_3_a
	pop	de
	call	l_pint
.i_244
.i_243
.i_241
.i_237
.i_227
.i_223
	ret



._init_player_values
	ld	hl,_player
	ld	(hl),#(10240 % 256)
	inc	hl
	ld	(hl),#(10240 / 256)
	ld	hl,_player+1+1
	ld	(hl),#(7168 % 256)
	inc	hl
	ld	(hl),#(7168 / 256)
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
	ld	a,#(64 % 256)
	ld	(de),a
	ld	hl,_player+12
	push	hl
	pop	de
	ld	a,#(48 % 256)
	ld	(de),a
	ld	hl,_player+13
	ld	(hl),#(128 % 256 % 256)
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
	ld	hl,_player+32
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+34
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+33
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+35
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret



._init_player
	call	_init_player_values
	ld	hl,_player+28
	ld	(hl),#(69 % 256)
	inc	hl
	ld	(hl),#(69 / 256)
	ld	hl,_player+26
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	hl,_player+27
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	hl,_player+31
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret



._init_hotspots
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_247
.i_245
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_247
	ld	a,(_gpit)
	cp	#(24 % 256)
	jp	z,i_246
	jp	nc,i_246
	ld	hl,_hotspots
	push	hl
	ld	hl,(_gpit)
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
	ld	l,(hl)
	ld	h,0
	jp	i_245
.i_246
	ret



._delete_text
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_250
.i_248
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_250
	ld	a,(_gpit)
	cp	#(30 % 256)
	jp	z,i_249
	jp	nc,i_249
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_248
.i_249
	ret



._draw_scr_background
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdy),a
	ld	hl,(_n_pant)
	ld	h,0
	ld	de,75
	call	l_mult
	ld	(_idx),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	call	_tileset_offset_calc
	ld	h,0
	ld	a,l
	ld	(_tileoffset),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_253
.i_251
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_253
	ld	a,(_gpit)
	cp	#(75 % 256)
	jp	z,i_252
	jp	nc,i_252
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	ld	de,15
	call	l_mult
	push	hl
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	hl,_mapa
	push	hl
	ld	hl,(_idx)
	inc	hl
	ld	(_idx),hl
	dec	hl
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdt1),a
	cp	#(13 % 256)
	jp	nz,i_255
	ld	hl,(_scenery_info)
	ld	h,0
	call	l_lneg
	jr	c,i_256_i_255
.i_255
	jp	i_254
.i_256_i_255
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdt1),a
.i_254
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdt2),a
	cp	#(13 % 256)
	jp	nz,i_258
	ld	hl,(_scenery_info)
	ld	h,0
	call	l_lneg
	jr	c,i_259_i_258
.i_258
	jp	i_257
.i_259_i_258
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdt2),a
.i_257
	ld	de,_map_attr
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_comportamiento_tiles
	push	hl
	ld	hl,(_tileoffset)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdt1)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_rdx)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_tileoffset)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdt1)
	ld	h,0
	add	hl,de
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	de,_map_buff
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_rdt1
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_rdx)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	cp	#(30 % 256)
	jp	nz,i_260
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_260
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
	ld	de,_map_attr
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_comportamiento_tiles
	push	hl
	ld	hl,(_tileoffset)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdt2)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_rdx)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_tileoffset)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdt2)
	ld	h,0
	add	hl,de
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	de,_map_buff
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_rdt2
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_rdx)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	cp	#(30 % 256)
	jp	nz,i_261
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_261
	jp	i_251
.i_252
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
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_262
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
	jp	z,i_263
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
	ld	hl,(_rdx)
	ld	h,0
	ld	de,1
	add	hl,de
	ex	de,hl
	ld	hl,(_rdx)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,(_rdy)
	ld	h,0
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
.i_263
.i_262
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
	jp	i_266
.i_264
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_266
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_265
	jp	nc,i_265
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
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
.i_269
	ld	a,l
	cp	#(0% 256)
	jp	z,i_270
	cp	#(1% 256)
	jp	z,i_273
	cp	#(2% 256)
	jp	z,i_274
	cp	#(3% 256)
	jp	z,i_275
	cp	#(4% 256)
	jp	z,i_276
	cp	#(6% 256)
	jp	z,i_277
	jp	i_268
.i_270
	ld	a,(_scenery_info+5)
	and	a
	jp	z,i_271
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprite_13_a
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	push	hl
	call	_rand
	ld	de,224	;const
	ex	de,hl
	call	l_div
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	push	hl
	call	_rand
	ld	de,144	;const
	ex	de,hl
	call	l_div
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	ld	de,0	;const
	ex	de,hl
	call	l_pint
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,14
	add	hl,bc
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_272
.i_271
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_272
	jp	i_268
.i_273
.i_274
.i_275
.i_276
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
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
	jp	i_268
.i_277
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprite_13_a
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
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
	inc	hl
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	ld	de,0	;const
	ex	de,hl
	call	l_pint
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,14
	add	hl,bc
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_268
	jp	i_264
.i_265
	call	_delete_text
	ld	hl,(_e_scripts+50)
	ld	(_script),hl
	call	_run_script
	ld	hl,_e_scripts
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	ret



._mueve_bicharracos
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	dec	sp
	ld	a,l
	pop	hl
	ld	l,a
	push	hl
	ld	hl,_player+25
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_280
.i_278
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_280
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_279
	jp	nc,i_279
	ld	hl,9	;const
	add	hl,sp
	push	hl
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	c,i_282
	ld	a,(_scenery_info+5)
	and	a
	jp	z,i_281
.i_282
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,3	;const
	add	hl,sp
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	inc	hl
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,15	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	inc	hl
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,15	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	inc	(hl)
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_284
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
.i_287
	ld	a,l
	cp	#(1% 256)
	jp	z,i_288
	cp	#(2% 256)
	jp	z,i_291
	cp	#(3% 256)
	jp	z,i_294
	cp	#(6% 256)
	jp	z,i_295
	cp	#(0% 256)
	jp	z,i_296
	cp	#(4% 256)
	jp	z,i_299
	jp	i_286
.i_288
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_289
	ld	hl,_sprite_9_a
	jp	i_290
.i_289
	ld	hl,_sprite_10_a
.i_290
	pop	de
	call	l_pint
	jp	i_286
.i_291
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_292
	ld	hl,_sprite_11_a
	jp	i_293
.i_292
	ld	hl,_sprite_12_a
.i_293
	pop	de
	call	l_pint
	jp	i_286
.i_294
.i_295
.i_296
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_297
	ld	hl,_sprite_13_a
	jp	i_298
.i_297
	ld	hl,_sprite_14_a
.i_298
	pop	de
	call	l_pint
	jp	i_286
.i_299
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_300
	ld	hl,_sprite_15_a
	jp	i_301
.i_300
	ld	hl,_sprite_16_a
.i_301
	pop	de
	call	l_pint
.i_286
.i_284
	ld	hl,8	;const
	add	hl,sp
	push	hl
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	c,i_303
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_302
.i_303
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,1	;const
	add	hl,sp
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_305
.i_302
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,1	;const
	add	hl,sp
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	inc	hl
	ld	a,(hl)
	pop	de
	ld	(de),a
.i_305
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,4	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_306
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_307
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_309
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_309
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_309
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_309
	ld	hl,(_player+8)
	ld	de,65520	;const
	ex	de,hl
	call	l_ge
	jr	c,i_310_i_309
.i_309
	jp	i_308
.i_310_i_309
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,5	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_player+1+1)
	ld	de,1024	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_311
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_313
	ld	hl,8	;const
	add	hl,sp
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_314
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_314
	ld	hl,1	;const
	jr	i_315
.i_314
	ld	hl,0	;const
.i_315
	ld	a,h
	or	l
	jp	nz,i_313
	jr	i_316
.i_313
	ld	hl,1	;const
.i_316
	ld	a,h
	or	l
	jp	z,i_312
	ld	hl,_player+1+1
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_312
.i_311
.i_308
	jp	i_317
.i_307
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	m,i_318
	or	l
	jp	z,i_318
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_320
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_320
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_320
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-14
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_320
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_321_i_320
.i_320
	jp	i_319
.i_321_i_320
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,5	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_322
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_324
	ld	hl,8	;const
	add	hl,sp
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_325
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_325
	ld	hl,1	;const
	jr	i_326
.i_325
	ld	hl,0	;const
.i_326
	ld	a,h
	or	l
	jp	nz,i_324
	jr	i_327
.i_324
	ld	hl,1	;const
.i_327
	ld	a,h
	or	l
	jp	z,i_323
	ld	hl,_player+1+1
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_323
.i_322
.i_319
.i_318
.i_317
	ld	hl,7	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,5	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_329
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_329
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_329
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_329
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_329
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_330_i_329
.i_329
	jp	i_328
.i_330_i_329
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,3	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,5	;const
	add	hl,sp
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	add	hl,sp
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,15	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_player
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_331
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_333
	ld	hl,7	;const
	add	hl,sp
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_334
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_334
	ld	hl,1	;const
	jr	i_335
.i_334
	ld	hl,0	;const
.i_335
	ld	a,h
	or	l
	jp	nz,i_333
	jr	i_336
.i_333
	ld	hl,1	;const
.i_336
	ld	a,h
	or	l
	jp	z,i_332
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_332
	jp	i_337
.i_331
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	m,i_338
	or	l
	jp	z,i_338
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_340
	ld	hl,7	;const
	add	hl,sp
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_341
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_341
	ld	hl,1	;const
	jr	i_342
.i_341
	ld	hl,0	;const
.i_342
	ld	a,h
	or	l
	jp	nz,i_340
	jr	i_343
.i_340
	ld	hl,1	;const
.i_343
	ld	a,h
	or	l
	jp	z,i_339
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_339
.i_338
.i_337
.i_328
	jp	i_344
.i_306
	ld	hl,0	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	jp	nc,i_346
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,9	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_collide
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_346
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,16	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_346
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_347_i_346
.i_346
	jp	i_345
.i_347_i_346
	ld	hl,0	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,_player+35
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,4	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_348
	ld	hl,_player+28
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_349
.i_348
	ld	hl,_player+28
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
.i_349
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_345
.i_344
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	c,i_351
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_350
.i_351
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_353
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_355
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_356_i_355
.i_355
	jp	i_354
.i_356_i_355
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,16
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_357
.i_354
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_359
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_360_i_359
.i_359
	jp	i_358
.i_360_i_359
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_pint
.i_358
.i_357
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_362
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_363_i_362
.i_362
	jp	i_361
.i_363_i_362
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,16
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_364
.i_361
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_366
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_367_i_366
.i_366
	jp	i_365
.i_367_i_366
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_pint
.i_365
.i_364
.i_353
	ld	a,(_scenery_info+4)
	and	a
	jp	z,i_368
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,10
	add	hl,bc
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	call	l_gint	;
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_368
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,15360	;const
	call	l_gt
	jp	nc,i_369
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	de,15360	;const
	ex	de,hl
	call	l_pint
.i_369
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_370
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_370
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,10240	;const
	call	l_gt
	jp	nc,i_371
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	de,10240	;const
	ex	de,hl
	call	l_pint
.i_371
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_372
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_372
	jp	i_373
.i_350
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_375
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,4
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_374
.i_375
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_374
	pop	hl
	push	hl
	ld	l,h
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	inc	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_378
	pop	hl
	push	hl
	ld	l,h
	ld	h,0
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,5
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_377
.i_378
	ld	hl,_malotes
	push	hl
	ld	hl,11	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,7
	add	hl,bc
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,13	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_377
.i_373
.i_281
	jp	i_278
.i_279
	ld	hl,11	;const
	add	hl,sp
	ld	sp,hl
	ret



._main
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
	ld	hl,61256	;const
	push	hl
	call	sp_AddMemory
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	ld	hl,_tileset
	ld	(_gp_gen),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_382
	ld	hl,(_gpit)
	ld	h,0
	push	hl
	ld	hl,(_gp_gen)
	push	hl
	call	sp_TileArray
	pop	bc
	pop	bc
	ld	hl,(_gp_gen)
	ld	bc,8
	add	hl,bc
	ld	(_gp_gen),hl
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_380
	ld	hl,(_gpit)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_382
.i_381
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
	ld	hl,128 % 256	;const
	push	hl
	call	sp_CreateSpr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_sp_player),hl
	push	hl
	ld	hl,_sprite_2_b
	push	hl
	ld	hl,128 % 256	;const
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_sp_player)
	push	hl
	ld	hl,_sprite_2_c
	push	hl
	ld	hl,128 % 256	;const
	push	hl
	call	sp_AddColSpr
	pop	bc
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
	jp	i_385
.i_383
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_385
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_384
	jp	nc,i_384
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
	ld	hl,128 % 256	;const
	push	hl
	call	sp_CreateSpr
	pop	bc
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
	ld	hl,128 % 256	;const
	push	hl
	call	sp_AddColSpr
	pop	bc
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
	ld	hl,128 % 256	;const
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	push	hl
	ld	hl,_sprite_9_a
	pop	de
	call	l_pint
	jp	i_383
.i_384
.i_386
	call	_title_screen
	ld	a,#(1 % 256 % 256)
	ld	(_playing),a
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_scenery_info+5
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_scenery_info+4
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_init_player
	call	_init_hotspots
	ld	a,#(5 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_result),a
	call	_msc_init_all
	ld	hl,_flags+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_e_scripts
	push	hl
	ld	hl,(_max_screens)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	call	_draw_scr
	ld	a,#(0 % 256 % 256)
	ld	(_reentered),a
	ld	a,#(0 % 256 % 256)
	ld	(_half_life),a
	ld	hl,255 % 256	;const
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
.i_388
	ld	a,(_playing)
	and	a
	jp	z,i_389
	ld	hl,_player+26
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_390
	ld	hl,29 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,_player+26
	call	l_gchar
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_player+26
	call	l_gchar
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_390
	ld	de,(_player+28)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_391
	ld	hl,(_player+28)
	xor	a
	or	h
	jp	m,i_392
	or	l
	jp	z,i_392
	ld	hl,(_player+28)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_393
.i_392
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_393
	ld	hl,3 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_pti)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+28)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_391
	ld	hl,(_player+34)
	ld	h,0
	ex	de,hl
	ld	hl,(_ezg_old)
	ld	h,0
	call	l_ne
	jp	nc,i_394
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_player+34)
	ld	h,0
	ld	de,32
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+34)
	ld	h,0
	ld	a,l
	ld	(_ezg_old),a
.i_394
	ld	hl,_maincounter
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_half_life),a
	call	_move
	call	_mueve_bicharracos
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_397
.i_395
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_397
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_396
	jp	nc,i_396
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
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	c,i_399
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
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_398
.i_399
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	jp	i_401
.i_398
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
.i_401
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	inc	hl
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
	ld	de,2
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_rdi)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_pint
	jp	i_395
.i_396
	ld	a,(_f_zone_ac)
	cp	#(1 % 256)
	jp	nz,i_402
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzx1)
	ld	h,0
	call	l_uge
	jp	nc,i_404
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzx2)
	ld	h,0
	call	l_ule
	jp	nc,i_404
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzy1)
	ld	h,0
	call	l_uge
	jp	nc,i_404
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzy2)
	ld	h,0
	call	l_ule
	jr	c,i_405_i_404
.i_404
	jp	i_403
.i_405_i_404
	ld	hl,_f_scripts
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
.i_403
.i_402
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	c,i_407
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_406
.i_407
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	call	sp_MoveSprAbs
	exx
	ld	hl,14	;const
	add	hl,sp
	ld	sp,hl
	exx
	jp	i_409
.i_406
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
.i_409
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	call	sp_UpdateNow
	ld	hl,_player+23
	ld	a,(hl)
	and	#(2 % 256)
	jp	z,i_410
	ld	hl,_player+24
	dec	(hl)
	ld	a,(hl)
	and	a
	jp	nz,i_411
	ld	hl,_player+23
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_411
.i_410
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_413
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_413
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_y)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_413
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_y)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_414_i_413
.i_413
	jp	i_412
.i_414_i_413
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
	ld	de,2
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
	jp	nz,i_415
	ld	hl,_player+28
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,(_player+28)
	ld	de,69	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_416
	ld	hl,69	;const
	ld	(_player+28),hl
.i_416
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
	call	_peta_el_beeper
	pop	bc
	jp	i_417
.i_415
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
	cp	#(1 % 256)
	jp	nz,i_418
	ld	hl,_player+26
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	dec	hl
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
	ld	hl,6 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,_flags+1+1
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_418
.i_417
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
.i_412
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_419
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_419
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	hl,_rdi
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_420
	ld	hl,_f_scripts
	push	hl
	ld	hl,(_max_screens)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	ld	hl,_f_scripts
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	ld	hl,(_script_something_done)
	ld	h,0
	call	l_lneg
	jp	nc,i_421
	ld	hl,9 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_421
.i_420
	ld	hl,(_player)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_423
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_424_i_423
.i_423
	jp	i_422
.i_424_i_423
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	call	_draw_scr
	ld	hl,14336	;const
	ld	(_player),hl
.i_422
	ld	hl,(_player)
	ld	de,14336	;const
	call	l_eq
	jp	nc,i_426
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_427_i_426
.i_426
	jp	i_425
.i_427_i_426
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	call	_draw_scr
	ld	hl,0	;const
	ld	(_player),hl
.i_425
	ld	hl,(_player+1+1)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_429
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_429
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_429_uge
	jp	c,i_429
.i_429_uge
	jr	i_430_i_429
.i_429
	jp	i_428
.i_430_i_429
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	call	_draw_scr
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_428
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	call	l_eq
	jp	nc,i_432
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_433_i_432
.i_432
	jp	i_431
.i_433_i_432
	ld	a,(_n_pant)
	cp	#(18 % 256)
	jp	z,i_434
	jp	nc,i_434
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	call	_draw_scr
	ld	hl,0	;const
	ld	(_player+1+1),hl
	jp	i_435
.i_434
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	l_neg
	pop	de
	call	l_pint
	ld	hl,2 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,_player+28
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	inc	hl
.i_435
.i_431
	ld	hl,(_script_result)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_436
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_436
	ld	a,(_player+35)
	and	a
	jp	z,i_437
	ld	hl,_player+35
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+28)
	xor	a
	or	h
	jp	m,i_438
	or	l
	jp	z,i_438
.i_438
.i_437
	ld	hl,(_player+28)
	ld	de,0	;const
	ex	de,hl
	call	l_le
	jp	c,i_440
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_439
.i_440
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_439
	jp	i_388
.i_389
	jp	i_386
.i_387
	ret


	.musicstart
	ret
;	SECTION	text

.i_1
	defm	"RAMIRO, EL VAMPIRO"
	defb	0

	defm	"EN EL BOSQUE"
	defb	0

	defm	"DEL SUSPIRO!"
	defb	0

	defm	"MOJON TWINS 2013"
	defb	0

	defm	"CHURRERA 4.7"
	defb	0

	defm	"GAME OVER!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._sp_moviles	defs	6
._spritesClip	defs	2
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
._flags	defs	16
._gp_gen_alt	defs	2
._killed_old	defs	1
._reentered	defs	1
._ezg_old	defs	1
._t_alt	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._sp_player	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	1
._pad0	defs	1
._n_pant	defs	1
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
._sc_c	defs	1
._scenery_info	defs	6
._sc_i	defs	1
._sc_m	defs	1
._sc_n	defs	1
._seed	defs	2
._sc_x	defs	1
._sc_y	defs	1
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._maincounter	defs	1
._f_zone_ac	defs	1
._sc_res	defs	1
._prxx	defs	1
._pryy	defs	1
._tileoffset	defs	1
._next_script	defs	2
._item_old	defs	1
._idx	defs	2
._player	defs	36
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
._script	defs	2
._sc_terminado	defs	1
._asm_int	defs	2
._sc_continuar	defs	1
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	_read_vbyte
	LIB	sp_ScreenStr
	XDEF	_hotspots
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	XDEF	_f_scripts
	LIB	sp_MouseAMXInit
	XDEF	_can_move_box
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_sp_moviles
	LIB	sp_SetMousePosAMX
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_HashAdd
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XREF	_init_falling_box_buffer
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	_en_an
	defc	_en_an	=	23800
	XDEF	_half_life
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
	LIB	sp_Heapify
	XDEF	_malotes
	XDEF	_draw_text
	XDEF	_key_1
	XDEF	_key_2
	XDEF	_key_3
	LIB	sp_MoveSprRel
	LIB	sp_TileArray
	LIB	sp_MouseSim
	LIB	sp_BlockFit
	XDEF	_map_buff
	defc	_map_buff	=	23900
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	LIB	sp_ClearRect
	XDEF	_reentered
	XDEF	_ezg_old
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	24050
	XDEF	_key_m
	XDEF	_script_something_done
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
	LIB	sp_InitAlloc
	XDEF	_espera_activa
	LIB	sp_DeleteSpr
	LIB	sp_JoyTimexEither
	XDEF	_title_screen
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_fall_box
	XDEF	_mscce_0
	XDEF	_mscce_1
	XDEF	_mscce_2
	XDEF	_mscce_3
	XDEF	_mscce_4
	XDEF	_mscce_5
	XDEF	_mscce_6
	XDEF	_mscce_7
	XDEF	_mscce_8
	XDEF	_mscce_9
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	XDEF	_msccf_0
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_msccf_1
	XDEF	_sprite_11_a
	XDEF	_sprite_11_b
	XDEF	_sprite_11_c
	XDEF	_msccf_2
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_sprite_12_c
	XDEF	_msccf_3
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_msccf_4
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
	XDEF	_msccf_5
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_sprite_15_c
	LIB	sp_RegisterHookLast
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_HashDelete
	LIB	sp_GetCharAddr
	XDEF	_sprite_16_a
	XDEF	_sprite_16_b
	LIB	sp_RemoveHook
	XDEF	_sprite_16_c
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_qtile
	XDEF	_msccf_6
	XDEF	_msccf_7
	XDEF	_msccf_8
	XDEF	_msccf_9
	XDEF	_read_byte
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
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	LIB	sp_HashCreate
	XDEF	_pad0
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_draw_rectangle
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_enit
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
	XDEF	_gpit
	XDEF	_rdt2
	XDEF	_s_title
	XDEF	_sc_c
	LIB	sp_ListNext
	XDEF	_scenery_info
	XDEF	_sc_i
	XDEF	_sc_m
	XDEF	_sc_n
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_sc_x
	XDEF	_sc_y
	XDEF	_objs_old
	XDEF	_gpxx
	XDEF	_gpyy
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_move
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	XDEF	_f_zone_ac
	LIB	sp_MoveSprAbsNC
	XDEF	_sc_res
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	_step
	LIB	sp_PrintAtInv
	XDEF	_delete_text
	XDEF	_read_x_y
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_u_free
	XDEF	_tileoffset
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_next_script
	XDEF	_run_script
	LIB	sp_InstallISR
	XDEF	_item_old
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	_idx
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
	XDEF	_init_player_values
	XDEF	_sprite_4_a
	XDEF	_sprite_4_b
	XDEF	_sprite_4_c
	XDEF	_sprite_5_a
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_script_result
	LIB	sp_Initialize
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_sprite_6_a
	XDEF	_pti
	XDEF	_ptj
	XDEF	_tileset
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
	LIB	sp_ComputePos
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
	XDEF	_mscce_10
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_e_scripts
	XDEF	_script
	XDEF	_msc_init_all
	XDEF	_tileset_offset_calc
	XDEF	_init_hotspots
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	XDEF	_get_coin
	LIB	sp_inp
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_sc_terminado
	XDEF	_asm_int
	LIB	sp_IntPtInterval
	LIB	sp_RegisterHookFirst
	LIB	sp_HashLookup
	LIB	sp_PFill
	LIB	sp_HashRemove
	XDEF	_sc_continuar
	LIB	sp_CharUp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_success
	LIB	sp_MoveSprRelNC
	XDEF	_do_extern_action
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
