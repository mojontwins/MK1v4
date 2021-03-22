;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Mar 22 14:06:06 2021



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
	defb	4

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	4

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

;	SECTION	code


	.SetRAMBank
	ld a, b
	or a
	jp z, restISR
	xor a
	ld i, a
	jp SetRAMBankKeepGoing
	.restISR
	ld a, $f0
	ld i, a
	.SetRAMBankKeepGoing
	ld a, 16
	or b
	ld bc, $7ffd
	out (C), a
	ret
	.arkos_address_call
	ld b, 1
	call SetRAMBank
	call 0xC81C
	ld b, 0
	jp SetRAMBank
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
	defb	2
	defb	1
	defb	20
	defb	30

;	SECTION	code

	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb 2, 2 + 20, 1, 1 + 30
;	SECTION	text

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._max_screens
	defm	"$"
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


	defw 0

._ISR
	ld hl, _isrc
	inc (hl)
	ld a, (_ay_player_on)
	or a
	jr z, skip_arkos
	ld b, 1
	call SetRAMBank
	call 0xC000
	ld b, 0
	call SetRAMBank
	.skip_arkos
	ret



._arkos_play_music
	di
	ld b, 1
	call SetRAMBank
	; Reactivate sound generation
	ld a, 1
	ld (_ay_player_on), a
	ld a, l
	call 0xC7FC
	ld b, 0
	call SetRAMBank
	ei
	ret



._arkos_stop_sound
	di
	ld b, 1
	call SetRAMBank
	call 0xC6F7
	call 0xC6E1
	; Turn off sound generation
	xor a
	ld (_ay_player_on), a
	ld b, 0
	call SetRAMBank
	ei
	ret


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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

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

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	210

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	25

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"#"
	defb	192

	defm	""
	defb	18

	defm	""
	defb	153

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	148

	defm	"DDDI"
	defb	184

	defm	""
	defb	187

	defm	""
	defb	153

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	153

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	254

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	129

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"0"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	"DDK"
	defb	238

	defm	""
	defb	224

	defm	""
	defb	240

	defm	""
	defb	15

	defm	""
	defb	9

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
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
	defb	188

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	9

	defm	""
	defb	183

	defm	""
	defb	158

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
	defb	128

	defm	"i"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	144

	defm	""
	defb	13

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	128

	defm	""
	defb	13

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	187

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	128

	defm	""
	defb	190

	defm	""
	defb	238

	defm	"}"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	8

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	184

	defm	""
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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	137

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
	defb	9

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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	137

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
	defb	9

	defm	""
	defb	128

	defm	""
	defb	197

	defm	"L"
	defb	0

	defm	""
	defb	21

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	137

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
	defb	169

	defm	""
	defb	128

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	152

	defm	""
	defb	0

	defm	""
	defb	241

	defm	""
	defb	151

	defm	"`"
	defb	222

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	187

	defm	""
	defb	1

	defm	"("
	defb	0

	defm	""
	defb	13

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	139

	defm	""
	defb	34

	defm	""
	defb	137

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	187

	defm	")"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	139

	defm	""
	defb	176

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
	defb	187

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
	defb	189

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

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
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"B#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	"["
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	155

	defm	"B#"
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	4

	defm	"TEDDDD"
	defb	224

	defm	"U"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	15

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
	defb	15

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
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
	defb	240

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"@"
	defb	0

	defm	""
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	0

	defm	""
	defb	18

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	21

	defm	"TDDD"
	defb	179

	defm	""
	defb	0

	defm	""
	defb	18

	defm	""
	defb	139

	defm	""
	defb	185

	defm	""
	defb	155

	defm	""
	defb	153

	defm	""
	defb	184

	defm	"#"
	defb	18

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

	defm	"."
	defb	226

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	145

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"0"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	210

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	155

	defm	"DD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	155

	defm	""
	defb	13

	defm	""
	defb	144

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	128

	defm	""
	defb	15

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	219

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	144

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	219

	defm	""
	defb	237

	defm	""
	defb	144

	defm	""
	defb	222

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	144

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	233

	defm	""
	defb	13

	defm	""
	defb	190

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	189

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	180

	defm	"@"
	defb	221

	defm	""
	defb	180

	defm	"DDD"
	defb	8

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
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
	defb	141

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
	defb	217

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
	defb	141

	defm	""
	defb	222

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	137

	defm	""
	defb	221

	defm	""
	defb	15

	defm	""
	defb	221

	defm	""
	defb	223

	defm	""
	defb	221

	defm	""
	defb	253

	defm	""
	defb	11

	defm	""
	defb	141

	defm	""
	defb	208

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	157

	defm	""
	defb	217

	defm	""
	defb	208

	defm	""
	defb	137

	defm	"}"
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	9

	defm	""
	defb	137

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	208

	defm	""
	defb	185

	defm	""
	defb	137

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	157

	defm	""
	defb	232

	defm	""
	defb	176

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
	defb	0

	defm	""
	defb	128

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
	defb	153

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	189

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
	defb	11

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	233

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	216

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	216

	defm	"w"
	defb	157

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	155

	defm	""
	defb	0

	defm	""
	defb	221

	defm	"`"
	defb	11

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	235

	defm	""
	defb	144

	defm	""
	defb	6

	defm	""
	defb	215

	defm	""
	defb	0

	defm	""
	defb	189

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	174

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	11

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	144

	defm	""
	defb	1

	defm	"` `"
	defb	3

	defm	" "
	defb	137

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

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
	defb	0

	defm	""
	defb	9

	defm	""
	defb	148

	defm	""
	defb	0

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
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	8

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
	defb	0

	defm	""
	defb	139

	defm	""
	defb	160

	defm	""
	defb	234

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	4

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
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
	defb	240

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	18

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	21

	defm	"@"
	defb	18

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	18

	defm	"UD"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	18

	defm	"%UTDDDDD"
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
	defb	184

	defm	""
	defb	187

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	144

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	248

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	177

	defm	"0"
	defb	9

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	34

	defm	"8"
	defb	176

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"`"
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	34

	defm	"g"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	215

	defm	""
	defb	4

	defm	"DDK"
	defb	235

	defm	"DDD"
	defb	137

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	176

	defm	""
	defb	184

	defm	""
	defb	14

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
	defb	8

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	8

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
	defb	157

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
	defb	139

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	142

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"V"
	defb	208

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	0

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	9

	defm	""
	defb	189

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
	defb	222

	defm	""
	defb	185

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
	defb	219

	defm	""
	defb	189

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
	defb	185

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
	defb	233

	defm	""
	defb	158

	defm	""
	defb	238

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	205

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	247

	defm	""
	defb	252

	defm	""
	defb	154

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
	defb	171

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	144

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
	defb	137

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
	defb	11

	defm	""
	defb	176

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
	defb	136

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
	defb	0

	defm	""
	defb	9

	defm	""
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
	defb	16

	defm	""
	defb	185

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
	defb	8

	defm	""
	defb	176

	defm	"T"
	defb	12

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	0

	defm	"P"
	defb	139

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
	defb	171

	defm	""
	defb	187

	defm	""
	defb	0

	defm	"yw"
	defb	155

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	136

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
	defb	11

	defm	""
	defb	176

	defm	""
	defb	14

	defm	""
	defb	231

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	28

	defm	""
	defb	136

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

	defm	"y"
	defb	150

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

	defm	"x"
	defb	155

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	14

	defm	""
	defb	238

	defm	""
	defb	232

	defm	""
	defb	128

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
	defb	136

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
	defb	1

	defm	""
	defb	11

	defm	""
	defb	181

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	156

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	187

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
	defb	0

	defm	""
	defb	169

	defm	""
	defb	139

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	185

	defm	""
	defb	0

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
	defb	144

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"22"
	defb	0

	defm	"p"
	defb	9

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"20"
	defb	6

	defm	""
	defb	9

	defm	""
	defb	176

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
	defb	137

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
	defb	233

	defm	""
	defb	176

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
	defb	0

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"X"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	251

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	128

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	134

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	233

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	"e"
	defb	12

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	9

	defm	"g"
	defb	0

	defm	""
	defb	27

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	144

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
	defb	27

	defm	""
	defb	0

	defm	""
	defb	7

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
	defb	144

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
	defb	16

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	180

	defm	"\"
	defb	11

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	12

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
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	186

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	8

	defm	""
	defb	145

	defm	""
	defb	11

	defm	""
	defb	183

	defm	""
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
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	11

	defm	""
	defb	183

	defm	""
	defb	235

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	"y"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	235

	defm	""
	defb	1

	defm	""
	defb	128

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	176

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	144

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	144

	defm	""
	defb	10

	defm	""
	defb	171

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	186

	defm	""
	defb	170

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	185

	defm	""
	defb	137

	defm	""
	defb	137

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"}"
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
	defb	219

	defm	""
	defb	230

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
	defb	144

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	"@"
	defb	221

	defm	""
	defb	221

	defm	"#"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	155

	defm	"]"
	defb	221

	defm	""
	defb	211

	defm	"-"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	137

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	155

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
	defb	0

	defm	""
	defb	10

	defm	""
	defb	190

	defm	""
	defb	235

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
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
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
	defb	0

	defm	""
	defb	137

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
	defb	141

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
	defb	219

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	155

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	224

	defm	""
	defb	24

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
	defb	138

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

	defm	"a"
	defb	11

	defm	""
	defb	153

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	1

	defm	""
	defb	192

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	3

	defm	""
	defb	14

	defm	""
	defb	235

	defm	""
	defb	12

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	11

	defm	""
	defb	176

	defm	" "
	defb	1

	defm	""
	defb	190

	defm	""
	defb	238

	defm	""
	defb	224

	defm	"0"
	defb	187

	defm	""
	defb	3

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	8

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
	defb	224

	defm	""
	defb	16

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	12

	defm	"`"
	defb	0

	defm	"`E"
	defb	187

	defm	""
	defb	174

	defm	""
	defb	10

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

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	185

	defm	""
	defb	0

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
	defb	144

	defm	"22"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	2

	defm	"20"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	144

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
	defb	139

	defm	""
	defb	1

	defm	""
	defb	14

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"{"
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
	defb	16

	defm	""
	defb	185

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
	defb	200

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
	defb	16

	defm	""
	defb	14

	defm	""
	defb	185

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	248

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	151

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	16

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	16

	defm	""
	defb	9

	defm	"v"
	defb	170

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	11

	defm	"y"
	defb	187

	defm	""
	defb	144

	defm	""
	defb	7

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"y"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	183

	defm	""
	defb	4

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	14

	defm	""
	defb	186

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
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	176

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
	defb	8

	defm	""
	defb	0

	defm	"}"
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
	defb	230

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
	defb	216

	defm	""
	defb	157

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
	defb	238

	defm	"i"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"~"
	defb	237

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	13

	defm	""
	defb	221

	defm	"E"
	defb	10

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

	defm	"w"
	defb	0

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	185

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
	defb	148

	defm	"p"
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
	defb	9

	defm	"f`"
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	190

	defm	""
	defb	235

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
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
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	10

	defm	"o"
	defb	255

	defm	""
	defb	255

	defm	""
	defb	246

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

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
	defb	16

	defm	"`"
	defb	232

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
	defb	128

	defm	""
	defb	1

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	151

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	231

	defm	"`"
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
	defb	8

	defm	""
	defb	16

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
	defb	176

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	186

	defm	""
	defb	127

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	248

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	238

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
	defb	11

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	232

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	232

	defm	""
	defb	128

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	144

	defm	"# "
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	5

	defm	""
	defb	0

	defm	"p"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	232

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	"{"
	defb	187

	defm	""
	defb	15

	defm	""
	defb	0

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
	defb	240

	defm	""
	defb	139

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	11

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	150

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	210

	defm	"#"
	defb	0

	defm	""
	defb	19

	defm	""
	defb	137

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	34

	defm	"#"
	defb	18

	defm	"#"
	defb	9

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	148

	defm	"DDDD"
	defb	144

	defm	""
	defb	9

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	"y"
	defb	185

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
	defb	144

	defm	"p"
	defb	0

	defm	"#0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	2

	defm	"2"
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"20"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	16

	defm	""
	defb	144

	defm	""
	defb	193

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
	defb	11

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
	defb	0

	defm	""
	defb	16

	defm	"T"
	defb	199

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
	defb	10

	defm	""
	defb	170

	defm	""
	defb	166

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	247

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"p"
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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	20

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	137

	defm	"x"
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	2

	defm	"###"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	"3#3 "
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
	defb	0

	defm	""
	defb	10

	defm	""
	defb	167

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	246

	defm	""
	defb	170

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	176

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	181

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	144

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

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
	defb	1

	defm	""
	defb	9

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
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"E"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	"n"
	defb	231

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
	defb	16

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
	defb	0

	defm	""
	defb	11

	defm	"p"
	defb	0

	defm	""
	defb	138

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

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	"y"
	defb	187

	defm	"p"
	defb	9

	defm	""
	defb	0

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
	defb	179

	defm	"2#2"
	defb	0

	defm	""
	defb	11

	defm	""
	defb	144

	defm	""
	defb	9

	defm	""
	defb	34

	defm	"220"
	defb	8

	defm	""
	defb	152

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
	defb	8

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	25

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	197

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"H"
	defb	152

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	196

	defm	"X"
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	154

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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	; Segunda columna
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
	._extra_sprite_17_a
	defb 0, 255
	defb 0, 255
	defb 0, 224
	defb 29, 192
	defb 62, 128
	defb 119, 0
	defb 98, 0
	defb 119, 0
	defb 62, 128
	defb 28, 192
	defb 0, 224
	defb 0, 254
	defb 0, 254
	defb 0, 254
	defb 0, 254
	defb 0, 254
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._extra_sprite_17_b
	defb 0, 255
	defb 0, 255
	defb 0, 3
	defb 168, 1
	defb 212, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 254, 0
	defb 170, 0
	defb 0, 84
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._extra_sprite_17_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_18_a
	defb 0, 15
	defb 96, 1
	defb 124, 0
	defb 58, 0
	defb 58, 128
	defb 39, 128
	defb 31, 128
	defb 6, 192
	defb 1, 240
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
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; Segunda columna
	._extra_sprite_18_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 127
	defb 0, 127
	defb 0, 63
	defb 128, 31
	defb 192, 15
	defb 160, 7
	defb 112, 3
	defb 40, 1
	defb 28, 128
	defb 14, 192
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
	; tercera columna
	._extra_sprite_18_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_19_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 128
	defb 126, 0
	defb 127, 0
	defb 31, 0
	defb 111, 0
	defb 119, 0
	defb 57, 128
	defb 59, 128
	defb 29, 192
	defb 5, 224
	defb 0, 248
	defb 0, 255
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
	._extra_sprite_19_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 1
	defb 126, 0
	defb 254, 0
	defb 248, 0
	defb 246, 0
	defb 238, 0
	defb 92, 1
	defb 220, 1
	defb 184, 3
	defb 160, 7
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
	; tercera columna
	._extra_sprite_19_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_20_a
	defb 0, 255
	defb 0, 248
	defb 7, 224
	defb 24, 192
	defb 32, 128
	defb 65, 0
	defb 66, 0
	defb 65, 0
	defb 32, 0
	defb 88, 0
	defb 103, 0
	defb 56, 128
	defb 31, 192
	defb 7, 224
	defb 0, 248
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
	._extra_sprite_20_b
	defb 0, 255
	defb 0, 31
	defb 224, 7
	defb 24, 3
	defb 4, 1
	defb 194, 0
	defb 2, 0
	defb 194, 0
	defb 4, 0
	defb 26, 0
	defb 230, 0
	defb 28, 1
	defb 248, 3
	defb 224, 7
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
	; tercera columna
	._extra_sprite_20_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_21_a
	defb 7, 240
	defb 15, 224
	defb 29, 192
	defb 24, 192
	defb 29, 192
	defb 15, 192
	defb 21, 192
	defb 31, 192
	defb 13, 192
	defb 23, 192
	defb 13, 192
	defb 23, 192
	defb 13, 192
	defb 23, 192
	defb 13, 224
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
	._extra_sprite_21_b
	defb 0, 127
	defb 128, 63
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 128, 31
	defb 64, 7
	defb 248, 3
	defb 80, 3
	defb 248, 3
	defb 80, 3
	defb 248, 3
	defb 80, 3
	defb 248, 3
	defb 80, 3
	defb 248, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	; tercera columna
	._extra_sprite_21_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_22_a
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 1, 254
	defb 30, 224
	defb 34, 192
	defb 64, 128
	defb 128, 0
	defb 146, 0
	defb 104, 144
	defb 4, 248
	defb 0, 248
	defb 4, 240
	defb 14, 224
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
	; Segunda columna
	._extra_sprite_22_b
	defb 0, 255
	defb 0, 255
	defb 208, 15
	defb 0, 7
	defb 42, 1
	defb 121, 0
	defb 1, 0
	defb 104, 0
	defb 105, 0
	defb 72, 1
	defb 122, 1
	defb 112, 1
	defb 2, 0
	defb 219, 0
	defb 80, 0
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
	._extra_sprite_22_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	._extra_sprite_23_a
	defb 0, 255
	defb 0, 255
	defb 11, 240
	defb 0, 224
	defb 84, 128
	defb 158, 0
	defb 128, 0
	defb 22, 0
	defb 150, 0
	defb 18, 128
	defb 94, 128
	defb 14, 128
	defb 64, 0
	defb 219, 0
	defb 10, 0
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
	._extra_sprite_23_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 128, 127
	defb 120, 7
	defb 68, 3
	defb 2, 1
	defb 1, 0
	defb 73, 0
	defb 22, 9
	defb 32, 31
	defb 0, 31
	defb 32, 15
	defb 112, 7
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
	; tercera columna
	._extra_sprite_23_c
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
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
	defb	112
	defb	96
	defb	112
	defb	176
	defb	112
	defb	2
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
	defb	144
	defb	0
	defb	144
	defb	0
	defb	192
	defb	96
	defb	4
	defb	4
	defb	3
	defb	32
	defb	112
	defb	32
	defb	112
	defb	128
	defb	112
	defb	2
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
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	112
	defb	0
	defb	2
	defb	2
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	96
	defb	0
	defb	1
	defb	2
	defb	208
	defb	64
	defb	208
	defb	64
	defb	208
	defb	128
	defb	0
	defb	2
	defb	4
	defb	192
	defb	32
	defb	176
	defb	32
	defb	192
	defb	32
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
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	80
	defb	2
	defb	0
	defb	3
	defb	80
	defb	48
	defb	16
	defb	48
	defb	80
	defb	48
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	1
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	176
	defb	96
	defb	2
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
	defb	96
	defb	112
	defb	96
	defb	112
	defb	208
	defb	112
	defb	2
	defb	0
	defb	4
	defb	160
	defb	128
	defb	160
	defb	32
	defb	160
	defb	128
	defb	0
	defb	-1
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
	defb	16
	defb	32
	defb	16
	defb	32
	defb	208
	defb	32
	defb	2
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
	defb	144
	defb	128
	defb	144
	defb	128
	defb	208
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	48
	defb	0
	defb	1
	defb	4
	defb	176
	defb	96
	defb	16
	defb	96
	defb	176
	defb	96
	defb	-2
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
	defb	192
	defb	128
	defb	144
	defb	128
	defb	192
	defb	128
	defb	-1
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
	defb	64
	defb	64
	defb	64
	defb	16
	defb	64
	defb	64
	defb	0
	defb	-1
	defb	2
	defb	192
	defb	80
	defb	96
	defb	80
	defb	192
	defb	128
	defb	-2
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
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	2
	defb	4
	defb	160
	defb	80
	defb	144
	defb	80
	defb	160
	defb	80
	defb	-1
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
	defb	144
	defb	128
	defb	32
	defb	128
	defb	144
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	32
	defb	32
	defb	32
	defb	16
	defb	32
	defb	32
	defb	0
	defb	0
	defb	6
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	32
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
	defb	112
	defb	128
	defb	16
	defb	128
	defb	112
	defb	128
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	32
	defb	32
	defb	32
	defb	32
	defb	32
	defb	48
	defb	0
	defb	0
	defb	6
	defb	144
	defb	32
	defb	144
	defb	32
	defb	144
	defb	48
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
	defb	64
	defb	16
	defb	64
	defb	16
	defb	80
	defb	64
	defb	1
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
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	2
	defb	48
	defb	128
	defb	48
	defb	128
	defb	160
	defb	128
	defb	1
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
	defb	208
	defb	96
	defb	32
	defb	96
	defb	208
	defb	96
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
	defb	176
	defb	96
	defb	112
	defb	96
	defb	176
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
	defb	48
	defb	112
	defb	0
	defb	2
	defb	4
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	64
	defb	0
	defb	2
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
	defb	32
	defb	32
	defb	32
	defb	32
	defb	48
	defb	32
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
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	1
	defb	0
	defb	2
	defb	176
	defb	64
	defb	112
	defb	64
	defb	176
	defb	64
	defb	-2
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
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
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
	defb	64
	defb	48
	defb	64
	defb	48
	defb	128
	defb	48
	defb	1
	defb	0
	defb	2
	defb	128
	defb	80
	defb	128
	defb	80
	defb	128
	defb	128
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
	defb	32
	defb	48
	defb	32
	defb	48
	defb	128
	defb	48
	defb	2
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
	defb	192
	defb	96
	defb	112
	defb	96
	defb	192
	defb	96
	defb	-1
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
	defb	96
	defb	64
	defb	96
	defb	64
	defb	96
	defb	128
	defb	0
	defb	2
	defb	4
	defb	112
	defb	80
	defb	112
	defb	80
	defb	192
	defb	112
	defb	2
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
	defb	80
	defb	48
	defb	80
	defb	48
	defb	144
	defb	64
	defb	2
	defb	2
	defb	3
	defb	160
	defb	128
	defb	160
	defb	128
	defb	208
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
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
	defb	1
	defb	3
	defb	32
	defb	128
	defb	32
	defb	64
	defb	32
	defb	128
	defb	0
	defb	-1
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	128
	defb	128
	defb	2
	defb	0
	defb	1
	defb	96
	defb	96
	defb	96
	defb	96
	defb	192
	defb	112
	defb	2
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
	defb	176
	defb	48
	defb	128
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	128
	defb	32
	defb	128
	defb	128
	defb	128
	defb	-2
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
	defb	80
	defb	32
	defb	80
	defb	32
	defb	112
	defb	96
	defb	2
	defb	2
	defb	3
	defb	128
	defb	96
	defb	64
	defb	64
	defb	128
	defb	96
	defb	-2
	defb	-2
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

;	SECTION	code

;	SECTION	text

._hotspots
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	55
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
	defb	200
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	1
	defb	0
	defb	102
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
	defb	212
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
	defb	101
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
	defb	179
	defb	2
	defb	0

;	SECTION	code

	.sound_play
	ld hl, soundEffectsData ;address of sound effects data
	di
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
	ei
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
	ld a, (_is128k)
	or a
	jr z, _skip_ay
	di
	ld b, 1
	call SetRAMBank
	; __FASTCALL__ -> fx_number is in l!
	ld a, 0
	ld h, 15
	ld e, 50
	ld d, 0
	ld bc, 0
	call 0xC704
	ld b,0
	call SetRAMBank
	ei
	ret
	._skip_ay
	push ix
	push iy
	ld a, l
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
	add 2
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
	halt
	call	_any_key
	ld	a,h
	or	l
	jr	nz,i_28
.i_29
	jp	i_27
.i_28
	ret


	LIB SPPrintAtInv
;	SECTION	text

._map_behaviours
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
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	5

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	1

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

;	SECTION	code


;	SECTION	text

._evil_eye_state_cts
	defm	""
	defb	30

	defm	""
	defb	30

	defm	"<"
	defb	5

	defm	""
	defb	5

;	SECTION	code


;	SECTION	text

._evil_eye_state_tiles
	defm	""
	defb	29

	defm	""
	defb	30

	defm	""
	defb	31

	defm	""
	defb	30

	defm	""
	defb	29

;	SECTION	code


;	SECTION	text

._object_cells
	defw	0
	defw	_extra_sprite_17_a
	defw	_extra_sprite_18_a
	defw	_extra_sprite_19_a
	defw	_extra_sprite_20_a
	defw	_extra_sprite_21_a

;	SECTION	code

;	SECTION	text

._ofrendas_order
	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	4

;	SECTION	code


;	SECTION	text

._water_pushplates
	defm	""
	defb	0

	defm	"&MWy"
;	SECTION	code


;	SECTION	text

._temp_string
	defm	"                        "
	defb	0

;	SECTION	code



;	SECTION	text

._text0
	defm	"POR OSIRIS Y POR APIS%MIRADME "
	defm	"BIEN: SOY EL%ALTAR DE LAS OFRE"
	defm	"NDAS.%TE DARE COSAS SI TRAES%M"
	defm	"ONEDAS AL MENDA."
	defb	0

;	SECTION	code



;	SECTION	text

._text1
	defm	"UN ROLLO DE PAPEL DEL%CULO DOB"
	defm	"LE CAPA, QUE%TE DEJA SUAVITO Y"
	defm	" TE%QUITA LA ZURRAPA."
	defb	0

;	SECTION	code



;	SECTION	text

._text2
	defm	"UNA FLAUTA DE FAKIR%IMPORTADA "
	defm	"DE ORIENTE%QUE TE DUERME CON S"
	defm	"U%MUSICA O SI TE DA EN%LOS DIE"
	defm	"NTES."
	defb	0

;	SECTION	code



;	SECTION	text

._text3
	defm	"UNAS BRAGAS PRINCESA%ROBADAS D"
	defm	"E UN CAJON%DE LA LETIZIA ESA."
	defb	0

;	SECTION	code



;	SECTION	text

._text4
	defm	"UN TARRO DE GRASA DE%CABALLO. "
	defm	"PARA QUE%QUERRIAS ESTO? LOCO%M"
	defm	"E HALLO."
	defb	0

;	SECTION	code



;	SECTION	text

._text5
	defm	"TES KI YA CARAJAULA,%LLEVATE E"
	defm	"SO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text6
	defm	"Y ESTO QUE ES? BEBE-%CHARCOS, "
	defm	"ESCUCHAPEOS"
	defb	0

;	SECTION	code



;	SECTION	text

._text7
	defm	"PARA QUE QUIERO ESTO,%BOQUIMUE"
	defm	"LLE?"
	defb	0

;	SECTION	code



;	SECTION	text

._text8
	defm	"PERO QUE ME TRAES?%BOTARATE TA"
	defm	"LLOCEBOLLA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text9
	defm	"Y AY, QUE POCAS LUCES%ME DUELE"
	defm	" LA PETACA.%COMI MUCHAS CHUCHE"
	defm	"S%Y ME HAGO MUCHA CACA."
	defb	0

;	SECTION	code



;	SECTION	text

._text10
	defm	"AUNQUE SEA DENOCHE%NO CONSIGO "
	defm	"DORMIR.%TENGO MUCHO INSOMNIO%Q"
	defm	"UE PUEDO HACIR?"
	defb	0

;	SECTION	code



;	SECTION	text

._text11
	defm	"QUE DESPISTE TENGO%AYER FUI LO"
	defm	" PEOR. ME%DESMADRE EN UN CUMPL"
	defm	"E%Y PERDI LA ROPA%INTERIOR."
	defb	0

;	SECTION	code



;	SECTION	text

._text12
	defm	"ESTOY SIN RECATO%A SU SERVICIO"
	defm	".%TRABAJO MUY BARATO%PERO EL C"
	defm	"UERO ES MI%VICIO..."
	defb	0

;	SECTION	code



;	SECTION	text

._text13
	defm	"RECUPERA LOS CUATRO%TROZOS DEL"
	defm	" PAPIRO%Y VUELVE AQUI PARA%HAC"
	defm	"ER EL HECHIZO"
	defb	0

;	SECTION	code



;	SECTION	text

._text14
	defm	"VAYA INSISTENCIA, TE%ABRO MI P"
	defm	"IRAMIDE,%MONTUNO! QUE CASI PA-"
	defm	"%RECES EL REY DE LOS%HUNOS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text15
	defm	"LO CONSIGUIO AL FIN!%ENSAMBLAD"
	defm	"O EL PAPIRO%SE DISPONE A LEER "
	defm	"EL%CONJURO NUESTRO BUEN%RAMIRO"
	defm	"."
	defb	0

;	SECTION	code



;	SECTION	text

._text16
	defm	"DICE ASI:%- 2 CEBOLLAS%- PAPEL"
	defm	" DEL CULO%- PAN%- FAIRY"
	defb	0

;	SECTION	code



;	SECTION	text

._text17
	defm	"EL POBRE VAMPIRO SE%QUEDA CON "
	defm	"CARA MONA:%NO ES UN CONJURO,%E"
	defm	"S LA LISTA DEL%MERCADONA."
	defb	0

;	SECTION	code



;	SECTION	text

._text18
	defm	"YA QUE ME TRAES UNA%OFRENDA, Y"
	defm	"O SOLTARE%PRENDA..."
	defb	0

;	SECTION	code



;	SECTION	text

._text19
	defm	"YA TIENES UN OBJETO!%USALO ANT"
	defm	"ES, CATETO."
	defb	0

;	SECTION	code



;	SECTION	text

._text20
	defm	"Y YA TE ABRI. AHORA%JUYE... JU"
	defm	"YE!!"
	defb	0

;	SECTION	code



;	SECTION	text

._text21
	defm	"OH, QUE SUAVE ES!%Y AHORA, POR"
	defm	"FA, VETE%QUE HARE CACA Y ME%LI"
	defm	"MPIARE EL OJETE"
	defb	0

;	SECTION	code



;	SECTION	text

._text22
	defm	"UNA FLAUTA DE FAKIR!%CON FEO S"
	defm	"U SONIDO%EN SOLO UNOS MITUTOS%"
	defm	"YA ESTARE DORMIDO"
	defb	0

;	SECTION	code



;	SECTION	text

._text23
	defm	"OH, GUAPO VAMPIRILLO,%RECIBO C"
	defm	"ON ALBOROTO%TU BELLO REGALO: U"
	defm	"NAS%BRAGAS PA MI TOTO"
	defb	0

;	SECTION	code



;	SECTION	text

._text24
	defm	"QUE LUSTROSO QUEDARA%EL CUERO "
	defm	"DE MI ARNES%IRE VISITAR A MARI"
	defm	"SA%A CHUPARLE LOS PIES"
	defb	0

;	SECTION	code



;	SECTION	text

._text25
	defm	"SI SACAS LA MONEDA%ENFADARAS A"
	defm	" HORUS!%YA SOLO TE QUEDA%RASCA"
	defm	"RLE LOS OJUS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text26
	defm	"SOY SONIA LA MOMIA%GUARDIANA D"
	defm	"E LA%TERCERA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text27
	defm	"SOY CLIEMENTE LA%SERPIENTE,%GU"
	defm	"ARDIAN DE LA%CUARTA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text28
	defm	"SOY MARISA LA%SACERDOTISA,%GUA"
	defm	"RDIANA DE LA%SEGUNDA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text29
	defm	"SOY GUSTAVO EL%ESCLAVO,%GUARDI"
	defm	"AN DE LA%PRIMERA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text30
	defm	"LOS TROZOS ESTAN%EN CRIPTAS CE"
	defm	"RRADAS,%TENDRAS QUE COMPLACER%"
	defm	"A SUS GUARDIANES"
	defb	0

;	SECTION	code



;	SECTION	text

._text31
	defm	""
	defb	34

	defm	"TE PILLE, LORITO!"
	defb	34

	defm	",%OYES A ALGUIEN GRITAR%"
	defb	34

	defm	"NO PIERDAS TU PORTE%Y VUELVE A"
	defm	" EMPEZAR!"
	defb	34

	defm	""
	defb	0

;	SECTION	code



;	SECTION	text

._text32
	defm	"CUIDADO CON EL OJO!%SE HACE LA"
	defm	" DORMIDA%PERO SI TE VE%TE CHUP"
	defm	"A LA VIDA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text33
	defm	"RAMON EL FARAON,%TE INVITO A S"
	defm	"U KELI%Y ENTRE VINOS Y HUMO%TE"
	defm	" CONTO SU PELI..."
	defb	0

;	SECTION	code



;	SECTION	text

._text34
	defm	"SI JUNTAS 4 PARTES%EL PODEWR D"
	defm	"EL PAPIRO%OCULTO EN ESTE SITIO"
	defm	"%SERA TUYO, RAMIRO"
	defb	0

;	SECTION	code



;	SECTION	text

._text35
	defm	"BUSCA A RAMON Y QUE%CON SU ABR"
	defm	"ACADABRA%NO SE HAGA EL REMOLON"
	defm	"%Y LA PIRAMIDE TE ABRA"
	defb	0

;	SECTION	code



;	SECTION	text

._text36
	defm	"ESTE ES EL ALTAR ROTO%QUE NO T"
	defm	"E DISCRIMINA%Y SI LE TOCAS EL "
	defm	"TOTO%TE DA PAPEL DE COCINA"
	defb	0

;	SECTION	code



;	SECTION	text

._text37
	defm	"QUE HACES, ALOCADO?%ESE PAPEL "
	defm	"DE COCINA%A MI CULO DELICADO%L"
	defm	"O HARIA FOSFATINA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text38
	defm	"EL ALTAR NO CONTESTA"
	defb	0

;	SECTION	code



;	SECTION	text

._texts
	defw	_text0
	defw	_text1
	defw	_text2
	defw	_text3
	defw	_text4
	defw	_text5
	defw	_text6
	defw	_text7
	defw	_text8
	defw	_text9
	defw	_text10
	defw	_text11
	defw	_text12
	defw	_text13
	defw	_text14
	defw	_text15
	defw	_text16
	defw	_text17
	defw	_text18
	defw	_text19
	defw	_text20
	defw	_text21
	defw	_text22
	defw	_text23
	defw	_text24
	defw	_text25
	defw	_text26
	defw	_text27
	defw	_text28
	defw	_text29
	defw	_text30
	defw	_text31
	defw	_text32
	defw	_text33
	defw	_text34
	defw	_text35
	defw	_text36
	defw	_text37
	defw	_text38

;	SECTION	code

;	SECTION	text

._talk_sounds
	defm	""
	defb	7

	defm	""
	defb	11

;	SECTION	code


;	SECTION	text

._redraw_after_text
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._adm_s_n_pant
	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	5

	defm	""
	defb	6

	defm	""
	defb	10

	defm	""
	defb	13

	defm	""
	defb	14

	defm	""
	defb	19

	defm	""
	defb	25

;	SECTION	code


;	SECTION	text

._adm_s_x
	defm	""
	defb	6

	defm	""
	defb	20

	defm	""
	defb	22

	defm	""
	defb	8

	defm	""
	defb	16

	defm	""
	defb	20

	defm	""
	defb	6

	defm	""
	defb	6

	defm	""
	defb	6

;	SECTION	code


;	SECTION	text

._adm_s_y
	defm	""
	defb	12

	defm	""
	defb	14

	defm	""
	defb	16

	defm	""
	defb	12

	defm	""
	defb	10

	defm	""
	defb	16

	defm	""
	defb	16

	defm	""
	defb	4

	defm	""
	defb	4

;	SECTION	code



._clear_gamearea
	ld hl, 22528 + 64
	ld de, 22528 + 65
	ld bc, 767 - 128
	xor a
	ld (hl), a
	ldir
	ret



._paint_water_strip
	ld a, (_rdy)
	cp 2+20
	ret nc
	ld c, 1+2
	call SPCompDListAddr
	ld b, 26
	ld a, (_rdi)
	ld c, 5
	.paint_water_strip_loop
	ld (hl), c
	inc hl
	ld (hl), a
	inc hl
	inc hl
	inc hl
	djnz paint_water_strip_loop
	ld c, 1
	ld e, 1 + 29
	ld a, (_rdy)
	ld b, a
	ld d, a
	ld iy, fsClipStruct
	call SPInvalidate
	ret



._draw_falling_block
	ld a, (__trap_bx)
	sla a
	add 1
	ld (__x), a
	ld a, (__trap_by)
	sla a
	add 2
	ld (__y), a
	ld a, (__trap_bt)
	ld (__t), a
	jp _draw_coloured_tile_do
	ret



._clear_temp_string
	ld hl, _temp_string
	ld de, _temp_string+1
	ld bc, 23
	ld a, 32
	ld (hl), a
	ldir
	ret



._redraw_from_buffer
	ld a, 1
	ld (__x), a
	ld a, 2
	ld (__y), a
	xor a
	.redraw_from_buffer_loop
	ld (_gpit), a
	ld bc, (_gpit)
	ld b, 0
	ld hl, _map_buff
	add hl, bc
	ld a, (hl)
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



._sprite_remove_aid
	call	_saca_a_todo_el_mundo_de_aqui
	ld ix, (_sp_pinv)
	ld iy, vpClipStruct
	ld bc, 0
	ld hl, 0xfefe
	ld de, 0
	call SPMoveSprAbs
	LIB SPValidate
	ld c, 1
	ld b, 2
	ld d, 2+19
	ld e, 1+29
	ld iy, fsClipStruct
	call SPValidate
	ret



._decorate_screen
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
.i_82
	ld	de,_adm_s_n_pant
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,(_n_pant)
	ld	h,0
	call	l_ule
	jp	nc,i_83
	ld	de,_adm_s_n_pant
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(_n_pant)
	cp	(hl)
	jp	nz,i_84
	ld	de,_adm_s_x
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_adm_s_y
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,49 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	jp	i_83
.i_84
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	jp	i_82
.i_83
	ld	a,(_evil_eye_screen)
	and	a
	jp	z,i_85
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,28 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,29 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_85
	ret



._show_text_box
	call	_sprite_remove_aid
	ld	hl,_texts
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_gp_gen),hl
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,7 % 256	;const
	ld	a,l
	ld	(_rdy),a
.i_86
	ld de, _temp_string + 1
	ld hl, (_gp_gen)
	.fill_buffer_loop
	ld a, (hl)
	or a
	jr z, fill_buffer_end
	cp '%'
	jr z, fill_buffer_end
	ld (de), a
	inc hl
	inc de
	jr fill_buffer_loop
	.fill_buffer_end
	ld (_gp_gen), hl
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	_clear_temp_string
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,_talk_sounds
	push	hl
	call	_rand
	ld	de,1	;const
	ex	de,hl
	call	l_and
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	call	_play_sfx
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_88
	ld b, 20
	.textbox_delay
	halt
	djnz textbox_delay
.i_88
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_87
.i_89
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	dec	hl
	jp	i_86
.i_87
.i_90
	call	_any_key
	ld	a,h
	or	l
	jp	nz,i_90
.i_91
.i_92
	call	_any_key
	call	l_lneg
	jp	c,i_92
.i_93
	ld	hl,(_redraw_after_text)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_94
	call	_redraw_from_buffer
	call	_hotspot_paint
	call	_decorate_screen
	call	_render_all_sprites
.i_94
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_redraw_after_text),a
	ret



._recuadrius
	call	_sprite_remove_aid
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_97
.i_95
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_97
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_96
	jp	nc,i_96
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_100
.i_98
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_100
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
	jp	nc,i_99
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	add 2
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	ld b, a
	ld a, 2 + 19
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
	jp	nc,i_101
	ld de, 0x4700
	ld a, (_rdi)
	add 1
	ld c, a
	ld a, (_rdx)
	add 2
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdi)
	ld b, a
	ld a, 1 + 29
	sub b
	ld c, a
	ld a, (_rdx)
	add 2
	call SPPrintAtInv
.i_101
	jp	i_98
.i_99
	halt
	ld	hl,0	;const
	push	hl
	call	sp_UpdateNow
	pop	bc
	jp	i_95
.i_96
	ret



._trap_kill
	call	sp_UpdateNow
	ld	hl,10 % 256	;const
	call	_play_sfx
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_102
	ld b, 50
	.trap_kill_delay
	halt
	djnz trap_kill_delay
.i_102
	ld	a,(_is128k)
	and	a
	jp	z,i_103
	ld	hl,5 % 256	;const
	call	_arkos_play_music
.i_103
	ld	hl,31 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
	call	sp_UpdateNow
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-5
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	hl,0	;const
	ld	(_player+8),hl
	call	_recuadrius
	ret



._water_trap_setup
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	hl,6	;const
	call	l_div_u
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	and	a
	jp	z,i_104
	ld	hl,_rdi
	ld	a,(hl)
	rrca
	jp	nc,i_105
	ld	hl,11	;const
	jp	i_106
.i_105
	ld	hl,2	;const
.i_106
	ld	h,0
	ld	a,l
	ld	(_water_top_door_x),a
	ld	hl,(_water_top_door_x)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_water_top_door_x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,_water_pushplates
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_104
	ld	a,(_rdi)
	cp	#(4 % 256)
	jp	z,i_107
	jp	nc,i_107
	ld	hl,_rdi
	ld	a,(hl)
	rrca
	jp	nc,i_108
	ld	hl,2	;const
	jp	i_109
.i_108
	ld	hl,11	;const
.i_109
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,46 % 256	;const
	push	hl
	ld	hl,4 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_rdx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,46 % 256	;const
	push	hl
	ld	hl,4 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_107
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_water_locks),a
	ret



._hook_system_inits
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
	push	hl
	ld	de,_sprite_2_a
	push	de
	push	hl
	call	sp_CreateSpr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_sp_pinv),hl
	push	hl
	ld	hl,_sprite_2_b
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,(_sp_pinv)
	push	hl
	ld	hl,_sprite_2_c
	push	hl
	call	sp_AddColSpr
	pop	bc
	pop	bc
	ld	hl,_sprite_2_a
	ld	(_pinv_next_frame),hl
	ld	(_pinv_current_frame),hl
	ret



._hook_init_game
	ld	a,#(0 % 256 % 256)
	ld	(_water_level),a
	ld	a,#(0 % 256 % 256)
	ld	(_pinv),a
	ld	a,#(0 % 256 % 256)
	ld	(_ofrendas_idx),a
	ld	a,#(0 % 256 % 256)
	ld	(_pofrendas),a
	ld	a,#(255 % 256 % 256)
	ld	(_pofrendas_old),a
	ld	hl,_flags+16
	ld	(hl),#(0 % 256 % 256)
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(_opscore),a
	ld b, 4
	ld a, r
	ld (_seed), a
	.shuffle_loop
	push bc
	call _rand
	pop bc
	ld a, l
	and 3
	ld c, a
	push bc
	call _rand
	pop bc
	ld a, l
	and 3
	ld d, 0
	ld e, a
	ld hl, _ofrendas_order
	add hl, de
	ld a, (hl)
	ld (_rdi), a
	ld e, c
	push hl
	ld hl, _ofrendas_order
	add hl, de
	ld a, (hl)
	pop hl
	ld (hl), a
	ld a, (_rdi)
	ld hl, _ofrendas_order
	add hl, de
	ld (hl), a
	djnz shuffle_loop
	ld	a,(_is128k)
	and	a
	jp	z,i_110
	ld	hl,1 % 256	;const
	call	_arkos_play_music
.i_110
	ret



._hook_init_mainloop
	ret



._hook_mainloop
	ld	a,(_evil_eye_screen)
	and	a
	jp	z,i_111
	ld	a,(_evil_eye_counter)
	and	a
	jp	z,i_112
	ld	hl,_evil_eye_counter
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	jp	i_113
.i_112
	ld	hl,_evil_eye_state
	ld	a,(hl)
	inc	(hl)
	ld	a,(_evil_eye_state)
	cp	#(5 % 256)
	jp	nz,i_114
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_evil_eye_state),a
.i_114
	ld	de,_evil_eye_state_cts
	ld	hl,(_evil_eye_state)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_evil_eye_counter),a
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	de,_evil_eye_state_tiles
	ld	hl,(_evil_eye_state)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_scenery_info+1+1
	push	hl
	ld	a,(_evil_eye_state)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_eq
	ld	hl,0	;const
	rl	l
	pop	de
	ld	a,l
	ld	(de),a
.i_113
.i_111
	ld	hl,(_scenery_info+1+1)
	ld	h,0
	ex	de,hl
	ld	hl,(_half_life)
	ld	h,0
	call	l_and
	ld	a,h
	or	l
	jp	z,i_115
	ld	hl,2	;const
	jp	i_116
.i_115
	ld	hl,0	;const
.i_116
	ld	h,0
	push	hl
	call	sp_Border
	pop	bc
	ld	a,(_trap_screen)
	and	a
	jp	z,i_118
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jr	c,i_119_i_118
.i_118
	jp	i_117
.i_119_i_118
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_arkos_stop_sound
.i_120
	ld	hl,_flags
	push	hl
	ld	bc,15
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	ld	de,10
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	a,#(1 % 256 % 256)
	ld	(_trap_active),a
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,5
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_flags+10
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ld hl, _trap_by
	ld de, _trap_by + 1
	ld bc, 3 - 1
	ld a, 0xff
	ld (hl), a
	ldir
	ld	a,(_trap_coins)
	and	a
	jp	z,i_121
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,5 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,10 % 256	;const
	call	_play_sfx
.i_121
	ld	a,(_is128k)
	and	a
	jp	z,i_122
	ld	hl,2 % 256	;const
	call	_arkos_play_music
.i_122
.i_117
	ld	hl,(_trap_active)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_123
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	dec	hl
	ld	a,h
	or	l
	jp	nz,i_124
	ld bc, 3
	.trap_block_find_loop
	dec c
	ld hl, _trap_by
	add hl, bc
	ld a, (hl)
	cp 0xff
	jr z, trap_block_create_new
	xor a
	or c
	jr z, trap_block_find_done
	jr trap_block_find_loop
	.trap_block_create_new
	xor a
	ld (hl), a
	push bc
	.trap_block_select_x
	call _rand
	ld a, l
	and 0xf
	jr z, trap_block_select_x
	cp 14
	jr nc, trap_block_select_x
	pop bc
	ld hl, _trap_bx
	add hl, bc
	ld (hl), a
	ld a, (_trap_coins)
	or a
	jr nz, trap_block_set_coins
	push bc
	call _rand
	pop bc
	ld a, l
	and 1
	add 6
	jr trap_block_write
	.trap_block_set_coins
	ld a, 50
	.trap_block_write
	ld hl, _trap_bt
	add hl, bc
	ld (hl), a
	.trap_block_find_done
.i_124
	ld	a,(_half_life)
	and	a
	jp	z,i_125
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_128
.i_126
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_128
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_127
	ld bc, (_gpit)
	ld b, 0
	ld hl, _trap_by
	add hl, bc
	ld a, (hl)
	ld (__trap_by), a
	ld hl, _trap_bx
	add hl, bc
	ld a, (hl)
	ld (__trap_bx), a
	ld hl, _trap_bt
	add hl, bc
	ld a, (hl)
	ld (__trap_bt), a
	ld	a,(__trap_by)
	cp	#(255 % 256)
	jp	z,i_129
	ld	hl,(__trap_bx)
	ld	h,0
	push	hl
	ld	a,(__trap_by)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	a,(__trap_by)
	and	a
	jp	z,i_130
	ld	hl,(__trap_bx)
	ld	h,0
	push	hl
	ld	hl,(__trap_by)
	ld	h,0
	push	hl
	ld	de,_map_buff
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_130
	ld	hl,__trap_by
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_rda)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rda),a
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
	ex	de,hl
	ld	hl,(__trap_bx)
	ld	h,0
	call	l_eq
	jp	nc,i_132
	ld	hl,(_rdy)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	call	l_eq
	jp	nc,i_132
	ld	a,(_trap_coins)
	and	a
	jr	nz,i_133_i_132
.i_132
	jp	i_131
.i_133_i_132
	ld	hl,_flags+10
	inc	(hl)
	ld	hl,5 % 256	;const
	call	_play_sfx
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
	jp	i_134
.i_131
	ld	de,_map_attr
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_135
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
	jp	i_136
.i_135
	call	_draw_falling_block
	ld	hl,_map_attr
	push	hl
	ld	hl,(_rda)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	#(12 % 256)
	jp	z,i_137
	ld	hl,(_rdx)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_bx)
	ld	h,0
	call	l_eq
	jp	nc,i_139
	ld	hl,(_rdy)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	call	l_eq
	jr	c,i_140_i_139
.i_139
	jp	i_138
.i_140_i_139
	call	_trap_kill
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
	ld	hl,_player+27
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	hl,_flags
	push	hl
	ld	bc,15
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	ld	de,10
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_127
.i_138
	ld	de,_map_attr
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(__trap_bt)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	de,_map_buff
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,__trap_bt
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
.i_137
.i_136
.i_134
	ld	de,_trap_by
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,__trap_by
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	a,(_flags+10)
	cp	#(30 % 256)
	jp	nz,i_141
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,8 % 256	;const
	call	_play_sfx
	ld	a,#(0 % 256 % 256)
	ld	(_trap_active),a
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_arkos_stop_sound
.i_142
	call	_draw_scr_background
	ld	a,(_is128k)
	and	a
	jp	z,i_143
	ld	hl,1 % 256	;const
	call	_arkos_play_music
.i_143
.i_141
.i_129
	jp	i_126
.i_127
.i_125
.i_123
	ld	a,(_pinv)
	and	a
	jp	z,i_144
	ld	a,(_player+22)
	and	a
	jp	z,i_145
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_146
.i_145
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdx),a
.i_146
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	jp	i_147
.i_144
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_147
	ld ix, (_sp_pinv)
	ld iy, vpClipStruct
	ld hl, (_pinv_next_frame)
	ld de, (_pinv_current_frame)
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
	ld	hl,(_pinv_next_frame)
	ld	(_pinv_current_frame),hl
	ld	a,(_latest_hotspot)
	cp	#(2 % 256)
	jp	nz,i_148
	ld	hl,_pofrendas
	ld	a,(hl)
	inc	(hl)
	ld	hl,5 % 256	;const
	call	_play_sfx
	ld	a,(_n_pant)
	cp	#(29 % 256)
	jp	nz,i_149
	ld	hl,25 % 256	;const
	ld	a,l
	ld	(_water_level),a
	call	_water_trap_setup
	ld	a,(_is128k)
	and	a
	jp	z,i_150
	ld	hl,2 % 256	;const
	call	_arkos_play_music
.i_150
.i_149
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(5 % 256)
	ld	(hl),a
.i_148
	ld	hl,(_pofrendas)
	ld	h,0
	ex	de,hl
	ld	hl,(_pofrendas_old)
	ld	h,0
	call	l_ne
	jp	nc,i_151
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_pofrendas)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_pofrendas)
	ld	h,0
	ld	a,l
	ld	(_pofrendas_old),a
.i_151
	ld	hl,(_flags+10)
	ld	h,0
	ex	de,hl
	ld	hl,(_coins_old)
	ld	h,0
	call	l_ne
	jp	nc,i_152
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_flags+10)
	ld	h,0
	ld	de,30
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags+10)
	ld	h,0
	ld	a,l
	ld	(_coins_old),a
.i_152
	ld	hl,(_flags+16)
	ld	h,0
	ex	de,hl
	ld	hl,(_opscore)
	ld	h,0
	call	l_ne
	jp	nc,i_153
	ld	hl,28 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_flags+16)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags+16)
	ld	h,0
	ld	a,l
	ld	(_opscore),a
.i_153
	ld	a,(_water_level)
	and	a
	jp	z,i_154
	ld	a,(_water_ct)
	and	a
	jp	z,i_155
	ld	hl,_water_ct
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	jp	i_156
.i_155
	ld	hl,_water_level
	ld	a,(hl)
	dec	(hl)
	ld	hl,(_water_level)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	hl,62 % 256	;const
	ld	a,l
	ld	(_rdi),a
	call	_paint_water_strip
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	hl,63 % 256	;const
	ld	a,l
	ld	(_rdi),a
	call	_paint_water_strip
	ld	hl,20 % 256	;const
	ld	a,l
	ld	(_water_ct),a
.i_156
	ld	a,(_gpy)
	cp	#(144 % 256)
	jr	z,i_158_ule
	jp	nc,i_158
.i_158_ule
	ld	a,(_water_level)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asl
	ex	de,hl
	ld	hl,(_gpy)
	ld	h,0
	call	l_ule
	jr	c,i_159_i_158
.i_158
	jp	i_157
.i_159_i_158
	call	_trap_kill
	ld	a,#(0 % 256 % 256)
	ld	(_water_level),a
	ld	hl,_hotspots+87+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_pofrendas
	ld	a,(hl)
	dec	(hl)
	ld	a,#(5 % 256 % 256)
	ld	(_n_pant),a
	ld	hl,0	;const
	ld	(_player+1+1),hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	a,#(120 % 256 % 256)
	ld	(_gpx),a
	ld	hl,_player
	ld	(hl),#(7680 % 256)
	inc	hl
	ld	(hl),#(7680 / 256)
	ld	a,(_is128k)
	and	a
	jp	z,i_160
	ld	hl,1 % 256	;const
	call	_arkos_play_music
.i_160
.i_157
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
	ld	hl,(_gpy)
	ld	h,0
	dec	hl
	dec	hl
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_player+37)
	and	a
	jp	z,i_162
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,19	;const
	ex	de,hl
	call	l_eq
	jr	c,i_163_i_162
.i_162
	jp	i_161
.i_163_i_162
	ld	hl,_water_locks
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,5 % 256	;const
	call	_play_sfx
	ld	a,(_water_locks)
	cp	#(2 % 256)
	jp	nz,i_164
	ld	hl,(_water_top_door_x)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	de,0 % 256	;const
	push	de
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_water_top_door_x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	de,0 % 256	;const
	push	de
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,8 % 256	;const
	call	_play_sfx
.i_164
.i_161
.i_154
	ld	a,(_n_pant)
	cp	#(12 % 256)
	jp	nz,i_166
	ld	a,(_flags+5)
	cp	#(0 % 256)
	jp	nz,i_166
	ld	a,(_player+26)
	and	a
	jr	nz,i_167_i_166
.i_166
	jp	i_165
.i_167_i_166
	ld	hl,_flags+5
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_render_all_sprites
	call	sp_UpdateNow
	ld	hl,2 % 256	;const
	push	hl
	call	_do_extern_action
	pop	bc
.i_165
	ret



._hook_entering
	ld bc, (_n_pant)
	ld b, 0
	ld hl, _map_behaviours
	add hl, bc
	ld c, (hl)
	ld a, c
	and 2
	ld (_evil_eye_screen), a
	ld a, c
	and 4
	ld (_trap_screen), a
	ld a, c
	and 8
	ld (_trap_coins), a
	ld	hl,_scenery_info+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_decorate_screen
	ld	a,#(2 % 256 % 256)
	ld	(_evil_eye_state),a
	ld	a,#(0 % 256 % 256)
	ld	(_evil_eye_counter),a
	ld	a,(_trap_active)
	and	a
	jp	z,i_168
	ld	a,(_is128k)
	and	a
	jp	z,i_169
	ld	hl,1 % 256	;const
	call	_arkos_play_music
.i_169
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(5 % 256)
	ld	(hl),a
.i_168
	ld	a,#(0 % 256 % 256)
	ld	(_trap_active),a
	ld	a,(_water_level)
	and	a
	jp	z,i_170
	ld	hl,65280	;const
	ld	(_player+8),hl
	call	_water_trap_setup
	ld	a,(_n_pant)
	cp	#(5 % 256)
	jp	nz,i_171
	ld	a,#(0 % 256 % 256)
	ld	(_water_level),a
	ld	a,(_is128k)
	and	a
	jp	z,i_172
	ld	hl,1 % 256	;const
	call	_arkos_play_music
.i_172
	jp	i_173
.i_171
	ld	hl,25 % 256	;const
	ld	a,l
	ld	(_water_level),a
.i_173
.i_170
	ret


;	SECTION	text

._e_scripts
	defw	_mscce_0
	defw	0
	defw	_mscce_1
	defw	_mscce_2
	defw	0
	defw	_mscce_3
	defw	_mscce_4
	defw	0
	defw	0
	defw	0
	defw	_mscce_5
	defw	0
	defw	0
	defw	_mscce_7
	defw	_mscce_8
	defw	0
	defw	_mscce_6
	defw	0
	defw	0
	defw	_mscce_9
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_10
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_11
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_12
	defw	_mscce_13
	defw	0

;	SECTION	code

;	SECTION	text

._f_scripts
	defw	_msccf_0
	defw	0
	defw	_msccf_1
	defw	0
	defw	0
	defw	_msccf_2
	defw	_msccf_3
	defw	0
	defw	0
	defw	0
	defw	_msccf_4
	defw	0
	defw	0
	defw	_msccf_5
	defw	_msccf_6
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_7
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_8
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_9
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0

;	SECTION	code

	._mscce_0
	defb 0x20, 0xF0, 0xFF, 0xE3, 0x16, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x52, 0x41, 0x4D, 0x4F, 0x4E, 0x20, 0x45, 0x4C, 0x20, 0x46, 0x41, 0x52, 0x41, 0x4F, 0x4E, 0x00, 0xA0, 0x20, 0x26, 0x1B, 0xFF, 0xFF
	._mscce_1
	defb 0x06, 0xF0, 0xFF, 0x20, 0x97, 0x1A, 0xFF, 0x09, 0xB4, 0xFF, 0x20, 0xE1, 0x00, 0x20, 0xE2, 0x00, 0xFF, 0xFF
	._mscce_2
	defb 0x06, 0xF0, 0xFF, 0x01, 0x0F, 0x04, 0xFF, 0x09, 0xBE, 0xFF, 0x20, 0x15, 0x2E, 0x20, 0x28, 0x0B, 0xFF, 0xFF
	._mscce_3
	defb 0x1E, 0xF0, 0xFF, 0xE3, 0x15, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4C, 0x41, 0x20, 0x20, 0x43, 0x49, 0x53, 0x54, 0x45, 0x52, 0x4E, 0x41, 0x00, 0x20, 0xA8, 0x1B, 0xFF, 0xFF
	._mscce_4
	defb 0x09, 0xF0, 0xFF, 0x20, 0x36, 0x15, 0x20, 0x46, 0x16, 0xFF, 0xFF
	._mscce_5
	defb 0x06, 0xF0, 0xFF, 0x20, 0x75, 0x19, 0xFF, 0x09, 0xB3, 0xFF, 0x20, 0x57, 0x00, 0x20, 0x58, 0x00, 0xFF, 0xFF
	._mscce_6
	defb 0x06, 0xF0, 0xFF, 0x01, 0x0F, 0x03, 0xFF, 0x0C, 0xBD, 0xFF, 0x20, 0x72, 0x2E, 0x20, 0x65, 0x2E, 0x20, 0x78, 0x0B, 0xFF, 0xFF
	._mscce_7
	defb 0x26, 0xF0, 0xFF, 0xE3, 0x1A, 0x20, 0x20, 0x20, 0x20, 0x41, 0x4C, 0x54, 0x41, 0x52, 0x20, 0x44, 0x45, 0x20, 0x4C, 0x41, 0x53, 0x20, 0x4F, 0x46, 0x52, 0x45, 0x4E, 0x44, 0x41, 0x53, 0x21, 0x00, 0x20, 0x98, 0x15, 0x20, 0xA8, 0x16, 0xFF, 0x09, 0xB6, 0xFF, 0x20, 0x37, 0x00, 0x20, 0x38, 0x00, 0xFF, 0xFF
	._mscce_8
	defb 0x06, 0xF0, 0xFF, 0x20, 0x28, 0x1B, 0xFF, 0xFF
	._mscce_9
	defb 0x06, 0xF0, 0xFF, 0x20, 0x22, 0x18, 0xFF, 0x09, 0xB2, 0xFF, 0x20, 0x01, 0x00, 0x20, 0x02, 0x00, 0xFF, 0xFF
	._mscce_10
	defb 0x06, 0xF0, 0xFF, 0x20, 0x22, 0x17, 0xFF, 0x09, 0xB1, 0xFF, 0x20, 0x01, 0x00, 0x20, 0x02, 0x00, 0xFF, 0xFF
	._mscce_11
	defb 0x06, 0xA9, 0xFF, 0x20, 0x38, 0x14, 0xFF, 0x06, 0xB9, 0xFF, 0x20, 0x38, 0x10, 0xFF, 0xFF
	._mscce_12
	defb 0x06, 0xA9, 0xFF, 0x20, 0x27, 0x0A, 0xFF, 0xFF
	._mscce_13
	defb 0x03, 0xF0, 0xFF, 0xFF, 0xFF
	._msccf_0
	defb 0x0A, 0x20, 0x02, 0x06, 0x41, 0x04, 0xFF, 0xE4, 0x40, 0xF1, 0xFF, 0x0D, 0x20, 0x02, 0x06, 0xA0, 0xFF, 0xE4, 0x01, 0xB6, 0xB0, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_1
	defb 0x07, 0x20, 0x09, 0x07, 0xFF, 0xE4, 0x44, 0xFF, 0xFF
	._msccf_2
	defb 0x07, 0x20, 0x0A, 0x08, 0xFF, 0xE4, 0x19, 0xFF, 0x0E, 0x20, 0x0A, 0x08, 0x10, 0x12, 0x00, 0xFF, 0x01, 0x12, 0x01, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_3
	defb 0x0A, 0x21, 0x21, 0x4F, 0x22, 0x51, 0x6F, 0xFF, 0xE4, 0x03, 0xFF, 0xFF
	._msccf_4
	defb 0x07, 0x20, 0x07, 0x05, 0xFF, 0xE4, 0x43, 0xFF, 0xFF
	._msccf_5
	defb 0x0A, 0x21, 0x81, 0xAF, 0x22, 0x71, 0x8F, 0xFF, 0xE4, 0x80, 0xFF, 0xFF
	._msccf_6
	defb 0x07, 0x20, 0x02, 0x08, 0xFF, 0xE4, 0x20, 0xFF, 0x0E, 0x20, 0x02, 0x08, 0x10, 0x11, 0x00, 0xFF, 0x01, 0x11, 0x01, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_7
	defb 0x07, 0x20, 0x02, 0x02, 0xFF, 0xE4, 0x42, 0xFF, 0xFF
	._msccf_8
	defb 0x07, 0x20, 0x02, 0x02, 0xFF, 0xE4, 0x41, 0xFF, 0xFF
	._msccf_9
	defb 0x0D, 0x20, 0x03, 0x08, 0xA9, 0xFF, 0xB9, 0x20, 0x38, 0x10, 0xE1, 0xE0, 0x08, 0xFF, 0xFF

._msc_init_all
	ld hl, _flags
	ld de, _flags+1
	ld bc, 21-1
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
	ld	(_script_result),a
	ld	hl,(_script)
	ld	a,h
	or	l
	jp	nz,i_176
	ret


.i_176
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_177
	ld	hl,(_script_result)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_178
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_eq
	jp	c,i_178
.i_179
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
.i_180
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_181
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_182
	ld	de,_flags
	ld	hl,(_sc_m)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_183
.i_182
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_184
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
	jp	i_185
.i_184
	ld	hl,(_sc_c)
	ld	h,0
.i_188
	ld	a,l
	cp	#(16% 256)
	jp	z,i_189
	cp	#(32% 256)
	jp	z,i_190
	cp	#(33% 256)
	jp	z,i_193
	cp	#(34% 256)
	jp	z,i_196
	cp	#(65% 256)
	jp	z,i_199
	cp	#(240% 256)
	jp	z,i_200
	cp	#(255% 256)
	jp	z,i_201
	jp	i_187
.i_189
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
	jp	i_187
.i_190
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
	jp	nc,i_191
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
	jp	nc,i_191
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
	jp	nc,i_191
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
	jp	nc,i_191
	ld	hl,1	;const
	jr	i_192
.i_191
	ld	hl,0	;const
.i_192
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_187
.i_193
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
	jp	nc,i_194
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_le
	jp	nc,i_194
	ld	hl,1	;const
	jr	i_195
.i_194
	ld	hl,0	;const
.i_195
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_187
.i_196
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
	jp	nc,i_197
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_le
	jp	nc,i_197
	ld	hl,1	;const
	jr	i_198
.i_197
	ld	hl,0	;const
.i_198
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_187
.i_199
	ld	hl,_player+27
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
.i_200
	jp	i_187
.i_201
	ld a, 1
	ld (_sc_terminado), a
	ld (_sc_continuar), a
	ld (_script_something_done), a
.i_187
.i_185
.i_183
	jp	i_180
.i_181
	ld	a,(_sc_continuar)
	and	a
	jp	z,i_202
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_203
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_204
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_205
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
	jp	i_206
.i_205
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_207
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
	jp	i_208
.i_207
	ld	hl,(_sc_c)
	ld	h,0
.i_211
	ld	a,l
	cp	#(1% 256)
	jp	z,i_212
	cp	#(16% 256)
	jp	z,i_213
	cp	#(32% 256)
	jp	z,i_214
	cp	#(224% 256)
	jp	z,i_215
	cp	#(225% 256)
	jp	z,i_216
	cp	#(227% 256)
	jp	z,i_217
	cp	#(228% 256)
	jp	z,i_218
	cp	#(241% 256)
	jp	z,i_219
	cp	#(255% 256)
	jp	z,i_220
	jp	i_210
.i_212
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_210
.i_213
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
	jp	i_210
.i_214
	call	_read_byte
	ld	a,(_sc_i)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_sc_m)
	ld	h,0
	push	hl
	call	_read_vbyte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_sc_n)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_210
.i_215
	call	_read_vbyte
	ld	h,0
	call	_play_sfx
	jp	i_210
.i_216
	call	sp_UpdateNow
	jp	i_210
.i_217
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,(_script)
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,(_script)
	ld	hl,(_sc_n)
	ld	h,0
	add	hl,de
	ld	(_script),hl
	jp	i_210
.i_218
	call	_read_byte
	ld	h,0
	push	hl
	call	_do_extern_action
	pop	bc
	jp	i_210
.i_219
	ld a, 1
	ld (_sc_terminado), a
	ld (_script_result), a
	jp	i_210
.i_220
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_210
.i_208
.i_206
	jp	i_203
.i_204
.i_202
	ld	hl,(_next_script)
	ld	(_script),hl
	jp	i_177
.i_178
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
	ld	hl,9 % 256	;const
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
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,i_1+34
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
	ld	a,(_is128k)
	and	a
	jp	z,i_221
	ld	hl,0 % 256	;const
	call	_arkos_play_music
	jp	i_222
.i_221
	; Music generated by beepola
	call musicstart
.i_222
.i_223
	call	_rand
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_225
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_224
.i_225
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_227
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_224
.i_227
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_229
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_224
.i_229
.i_228
.i_226
	jp	i_223
.i_224
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_arkos_stop_sound
.i_230
.i_231
	ret



._game_ending
	call	sp_UpdateNow
	ld	hl,_s_ending
	ld	(_asm_int),hl
	call	_unpack
	ld	hl,7 % 256	;const
	push	hl
	ld	de,15 % 256	;const
	push	de
	push	hl
	ld	hl,i_1+75
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,17 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,i_1+93
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,(_flags+16)
	cp	#(99 % 256)
	jp	z,i_232
	jp	nc,i_232
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,5 % 256	;const
	push	hl
	ld	hl,i_1+110
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,20 % 256	;const
	push	hl
	push	hl
	ld	hl,(_flags+16)
	ld	h,0
	inc	hl
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	jp	i_233
.i_232
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,5 % 256	;const
	push	hl
	ld	hl,i_1+125
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_233
	call	sp_UpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_234
	ld	hl,4 % 256	;const
	call	_arkos_play_music
	jp	i_235
.i_234
	call	_beepet
	ld	hl,11 % 256	;const
	call	_play_sfx
.i_235
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_arkos_stop_sound
.i_236
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
	ld	hl,104 % 256	;const
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
	ld	hl,104 % 256	;const
	push	hl
	ld	hl,i_1+141
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_237
	ld	hl,3 % 256	;const
	call	_arkos_play_music
	jp	i_238
.i_237
	call	_beepet
	ld	hl,10 % 256	;const
	call	_play_sfx
.i_238
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld	hl,(_is128k)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_arkos_stop_sound
.i_239
	ret



._speech
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	call	sp_UpdateNow
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	call	sp_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	call	sp_UpdateNow
	ret



._do_extern_action
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(3 % 256)
	jp	z,i_241
	cp	#(128 % 256)
	jp	nz,i_240
.i_241
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(3 % 256)
	jp	nz,i_244
	ld	a,(_flags+18)
	and	a
	jr	nz,i_245_i_244
.i_244
	jp	i_243
.i_245_i_244
	ld	hl,38 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_246
.i_243
	ld	a,(_pinv)
	and	a
	jp	z,i_247
	ld	hl,19 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_248
.i_247
	ld	a,(_pofrendas)
	and	a
	jp	nz,i_250
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(3 % 256)
	jp	nz,i_249
.i_250
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(128 % 256)
	jp	nz,i_252
	ld	hl,_ofrendas_order
	push	hl
	ld	hl,_ofrendas_idx
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_pinv),a
	ld	hl,_pofrendas
	ld	a,(hl)
	dec	(hl)
	ld	hl,(_pinv)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_253
.i_252
	ld	a,#(5 % 256 % 256)
	ld	(_pinv),a
	ld	hl,36 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
	ld	hl,_flags+18
	ld	(hl),#(1 % 256 % 256)
.i_253
	ld	hl,_object_cells
	push	hl
	ld	hl,(_pinv)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_pinv_next_frame),hl
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(5 % 256)
	ld	(hl),a
	ld	l,a
	ld	h,0
	jp	i_254
.i_249
	ld	hl,0 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
.i_254
.i_248
.i_246
	jp	i_255
.i_240
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(64 % 256)
	jp	nz,i_256
	ld	hl,15 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_259
.i_257
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_259
	ld	a,(_rdi)
	ld	e,a
	ld	d,0
	ld	hl,18	;const
	call	l_ult
	jp	nc,i_258
	call	sp_UpdateNow
	call	_clear_gamearea
	ld	a,#(0 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,(_rdi)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_257
.i_258
	jp	i_260
.i_256
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_261
	ld	hl,14 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,30 % 256	;const
	push	hl
	call	_speech
	pop	bc
	pop	bc
	pop	bc
	jp	i_262
.i_261
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(2 % 256)
	jp	nz,i_263
	ld	hl,33 % 256	;const
	push	hl
	ld	hl,34 % 256	;const
	push	hl
	ld	hl,35 % 256	;const
	push	hl
	call	_speech
	pop	bc
	pop	bc
	pop	bc
	jp	i_264
.i_263
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(64 % 256)
	jp	z,i_265
	jp	nc,i_265
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_266
.i_265
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-64
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_which_character),a
	ld	hl,(_which_character)
	ld	h,0
	ld	de,25
	add	hl,de
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	call	sp_UpdateNow
	ld	de,_flags
	ld	hl,(_which_character)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(2 % 256)
	jp	nz,i_267
	ld	hl,20 % 256	;const
	push	hl
	call	_show_text_box
	pop	bc
	jp	i_268
.i_267
	ld	de,_flags
	ld	hl,(_which_character)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(0 % 256)
	jp	z,i_270
	ld	a,(_pinv)
	cp	#(0 % 256)
	jp	nz,i_269
.i_270
	ld	hl,(_which_character)
	ld	h,0
	ld	de,8
	add	hl,de
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	ld	de,_flags
	ld	hl,(_which_character)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	nz,i_272
	ld	de,_flags
	ld	hl,(_which_character)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_flags+16
	push	hl
	ld	l,(hl)
	ld	h,0
	inc	hl
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
.i_272
	call	sp_UpdateNow
	jp	i_273
.i_269
	ld	hl,(_pinv)
	ld	h,0
	ex	de,hl
	ld	hl,(_which_character)
	ld	h,0
	call	l_ne
	jp	nc,i_274
	ld	hl,(_which_character)
	ld	h,0
	ld	de,4
	add	hl,de
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
.i_274
.i_273
.i_268
	ld	hl,(_pinv)
	ld	h,0
	ex	de,hl
	ld	hl,(_which_character)
	ld	h,0
	call	l_eq
	jp	nc,i_275
	ld	hl,(_which_character)
	ld	h,0
	ld	de,20
	add	hl,de
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	ld	hl,2 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,i_1+152
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	de,_flags
	ld	hl,(_which_character)
	ld	h,0
	add	hl,de
	ld	(hl),#(2 % 256 % 256)
	ld	a,#(0 % 256 % 256)
	ld	(_pinv),a
	ld	hl,6 % 256	;const
	call	_play_sfx
	ld	hl,_flags+16
	push	hl
	ld	l,(hl)
	ld	h,0
	inc	hl
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
.i_275
.i_266
.i_264
.i_262
.i_260
.i_255
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
	defw	_extra_sprite_22_a
	defw	_sprite_5_a
	defw	_sprite_6_a
	defw	_sprite_7_a
	defw	_sprite_8_a
	defw	_extra_sprite_23_a

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



._render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_281
.i_279
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_281
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_280
	jp	nc,i_280
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
	jp	c,i_283
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
	jp	nc,i_282
.i_283
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
	jp	i_285
.i_282
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
.i_285
	ld a, (_rdi)
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
	jp	i_279
.i_280
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
	jp	c,i_287
	ld	a,(_half_life)
	and	a
	jp	z,i_286
.i_287
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_289
.i_286
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_289
	ld ix, (_sp_player)
	ld iy, vpClipStruct
	ld hl, (_player + 17)
	ld de, (_player + 15)
	or a
	sbc hl, de
	ld b, h
	ld c, l
	ld a, (_rdy)
	cp 248
	jr c, ras_player_on_screen
	ld a, 2-1
	jr ras_rdi_calc_done
	.ras_player_on_screen
	ld a, (_rdy)
	srl a
	srl a
	srl a
	add 2
	.ras_rdi_calc_done
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



._get_coin
	ld	hl,_flags+10
	inc	(hl)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	hl,5 % 256	;const
	call	_play_sfx
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
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
	ld	bc,i_290
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_290
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
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,129	;const
	call	l_and
	ld	de,129	;const
	ex	de,hl
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_button_jump),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_291
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_291
	jr	i_292
.i_291
	ld	hl,1	;const
.i_292
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	a,(_button_jump)
	and	a
	jp	z,i_293
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_295
	ld	a,(_player+42)
	cp	#(0 % 256)
	jr	z,i_296_i_295
.i_295
	jp	i_294
.i_296_i_295
	ld	a,(_rdi)
	and	a
	jp	nz,i_298
	ld	a,(_player+25)
	and	a
	jp	z,i_297
.i_298
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1 % 256	;const
	call	_play_sfx
.i_297
.i_294
	ld	a,(_player+19)
	and	a
	jp	z,i_300
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
	jp	nc,i_301
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_301
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_302
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_302
.i_300
	jp	i_303
.i_293
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(0 % 256 % 256)
.i_303
	ld	hl,(_player+41)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,_player+41
	ld	(hl),#(0 % 256 % 256)
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_305
	ld	a,(_button_jump)
	and	a
	jp	z,i_306
	ld	a,(_player+43)
	cp	#(0 % 256)
	jp	nz,i_306
	ld	hl,1	;const
	jr	i_307
.i_306
	ld	hl,0	;const
.i_307
	ld	a,h
	or	l
	jp	nz,i_305
	jr	i_308
.i_305
	ld	hl,1	;const
.i_308
	ld	a,h
	or	l
	jp	z,i_304
	ld	hl,_player+42
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	m,i_309
	or	l
	jp	z,i_309
	ld	a,(_rda)
	cp	#(0 % 256)
	jp	nz,i_311
	ld	a,(_is128k)
	and	a
	jr	nz,i_312_i_311
.i_311
	jp	i_310
.i_312_i_311
	ld	hl,12 % 256	;const
	call	_play_sfx
.i_310
	ld	hl,_player+41
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	._player_hover
	ld a, (_pad0)
	or 0x02
	ld (_pad0), a
	ld hl, (_player + 8)
	ld de, 256 - 4
	or a
	push hl
	sbc hl, de
	pop hl
	jr nc, player_hover_maximum
	ld de, 4
	add hl, de
	jr player_hover_set
	.player_hover_maximum
	ld hl, 256
	.player_hover_set
	ld (_player + 8), hl
.i_309
	jp	i_313
.i_304
	ld	hl,_player+42
	ld	(hl),#(0 % 256 % 256)
.i_313
	ld	hl,(_player+41)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_314
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
.i_314
	ld	a,(_player+25)
	and	a
	jp	z,i_315
	ld	hl,0	;const
	ld	(_player+8),hl
.i_315
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
	jp	nc,i_316
	ld	hl,65024	;const
	ld	(_player+1+1),hl
.i_316
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_317
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_317
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
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_319
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_320_i_319
.i_319
	jp	i_318
.i_320_i_319
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_321
	or	l
	jp	z,i_321
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
	jp	p,i_322
	ld	hl,0	;const
	ld	(_player+6),hl
.i_322
	jp	i_323
.i_321
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_324
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
	jp	m,i_325
	or	l
	jp	z,i_325
	ld	hl,0	;const
	ld	(_player+6),hl
.i_325
.i_324
.i_323
.i_318
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_326
	ld	hl,(_player+6)
	push	hl
	ld	hl,(_player+39)
	call	l_neg
	pop	de
	call	l_gt
	jp	nc,i_327
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
.i_327
.i_326
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_328
	ld	de,(_player+6)
	ld	hl,(_player+39)
	call	l_lt
	jp	nc,i_329
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
.i_329
.i_328
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
	jp	p,i_330
	ld	hl,0	;const
	ld	(_player),hl
.i_330
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_331
	ld	hl,14336	;const
	ld	(_player),hl
.i_331
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
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld a, (_gpy)
	add 14
	srl a
	srl a
	srl a
	srl a
	call _attr_2
	ld a, l
	dec a
	jr nz, evil_tile_collision_done
	.evil_tile_collision
	ld	a,(_player+23)
	and	a
	jp	nz,i_332
	ld	hl,2 % 256	;const
	call	_play_sfx
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-5
	add	hl,bc
	pop	de
	call	l_pint
	call	_player_flicker
.i_332
	ld	de,_player
	ld	hl,(_gpcx)
	call	l_pint
	ld	de,_player+1+1
	ld	hl,(_gpcy)
	call	l_pint
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	_abs
	call	l_neg
	pop	de
	call	l_pint
	ld	hl,(_player+8)
	ld	de,65408	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_333
	ld	hl,65408	;const
	ld	(_player+8),hl
.i_333
	.evil_tile_collision_done
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_335
	ld	a,(_scenery_info+1+1)
	and	a
	jr	nz,i_336_i_335
.i_335
	jp	i_334
.i_336_i_335
	ld	a,(_player+35)
	ld	e,a
	ld	d,0
	ld	hl,32	;const
	call	l_uge
	jp	c,i_338
	ld	hl,(_scenery_info+1)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_337
.i_338
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0
	call	l_eq
	jp	nc,i_341
	ld	a,(_maincounter)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_and
	ld	de,0
	call	l_eq
	jr	c,i_342_i_341
.i_341
	jp	i_340
.i_342_i_341
	ld	hl,_player+34
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
	ld	hl,(_player+34)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	c,i_344
	ld	a,(_is128k)
	and	a
	jp	z,i_343
.i_344
	ld	hl,3 % 256	;const
	call	_play_sfx
.i_343
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	inc	hl
.i_340
	jp	i_346
.i_337
	ld	a,(_player+34)
	cp	#(8 % 256)
	jp	z,i_347
	jp	c,i_347
	ld	hl,_player+34
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+35
	inc	(hl)
	ld	hl,2 % 256	;const
	push	hl
	call	sp_Border
	pop	bc
	ld	hl,4 % 256	;const
	call	_play_sfx
	jp	i_348
.i_347
	ld	hl,_player+34
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_348
.i_346
	jp	i_349
.i_334
	ld	a,(_player+35)
	and	a
	jp	z,i_350
	ld	hl,_player+35
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_350
.i_349
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,50	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_351
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_351
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_353
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
	ld	de,50	;const
	ex	de,hl
	call	l_eq
	jr	c,i_354_i_353
.i_353
	jp	i_352
.i_354_i_353
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
.i_352
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_356
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
	ld	de,50	;const
	ex	de,hl
	call	l_eq
	jr	c,i_357_i_356
.i_356
	jp	i_355
.i_357_i_356
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
.i_355
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_359
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_359
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
	ld	de,50	;const
	ex	de,hl
	call	l_eq
	jr	c,i_360_i_359
.i_359
	jp	i_358
.i_360_i_359
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
.i_358
	ld a, (_player+22)
	or a
	jr z, _player_cell_sel_set_rdi
	ld a, 5
	._player_cell_sel_set_rdi
	ld (_rdi), a
	ld	hl,(_player+26)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_362
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_363_i_362
.i_362
	jp	i_361
.i_363_i_362
	ld	hl,(_player+41)
	ld	h,0
	ld	de,3
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_364
.i_361
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_365
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_366
.i_365
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
	jp	nz,i_367
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_367
.i_366
.i_364
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
	ld	a,#(48 % 256 % 256)
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
	ld	a,#(48 % 256 % 256)
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
	ld	a,#(64 % 256)
	ld	(de),a
	ld	hl,_player+12
	push	hl
	pop	de
	ld	a,#(48 % 256)
	ld	(de),a
	ld	hl,_player+39
	ld	(hl),#(256 % 256)
	inc	hl
	ld	(hl),#(256 / 256)
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
	ld	(hl),#(69 % 256)
	inc	hl
	ld	(hl),#(69 / 256)
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
	ld b, 6 * 6
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



._hotspot_paint
	ld a, 240
	ld (_hotspot_y), a
	xor a
	ld (_hotspot_t), a
	ld a, (_n_pant)
	ld b, a
	sla a
	add b
	ld c, a
	ld b, 0
	ld ix, _hotspots
	add ix, bc
	ld a, (ix+2)
	cp 1
	jr nz, hotspot_paint_act_skip
	ld a, (ix+1)
	or a
	jr z, hotspot_paint_act_skip
	ld (_hotspot_t), a
	.hotspot_paint_act_skip
	ld a, (_hotspot_t)
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
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_hotspot_t)
	cp	#(3 % 256)
	jp	nz,i_368
	ld	hl,16	;const
	jp	i_369
.i_368
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	de,16
	add	hl,de
.i_369
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ret



._draw_scr_background
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdy),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,_mapa
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	ld	de,75
	call	l_mult
	pop	de
	add	hl,de
	ld	(_gp_gen),hl
	ld	de,_map_behaviours
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	rrca
	jp	nc,i_370
	ld	hl,32	;const
	jp	i_371
.i_370
	ld	hl,0	;const
.i_371
	ld	h,0
	ld	a,l
	ld	(_tileoffset),a
	xor a
	ld (_rdi), a
	ld (_gpit), a
	.draw_scr_bg_loop
	ld a, (_tileoffset)
	ld c, a
	ld hl, (_gp_gen)
	ld a, (hl)
	inc hl
	ld (_gp_gen), hl
	ld b, a
	srl a
	srl a
	srl a
	srl a
	add c
	ld (_rdt1), a
	ld a, b
	and 15
	add c
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
	call	_hotspot_paint
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
	jp	i_374
.i_372
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_374
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_373
	jp	nc,i_373
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
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
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
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,(__en_t)
	ld	h,0
.i_377
	ld	a,l
	cp	#(1% 256)
	jp	z,i_378
	cp	#(2% 256)
	jp	z,i_379
	cp	#(3% 256)
	jp	z,i_380
	cp	#(4% 256)
	jp	z,i_381
	cp	#(6% 256)
	jp	z,i_382
	jp	i_376
.i_378
.i_379
.i_380
.i_381
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_376
.i_382
	ld	hl,2 % 256	;const
	push	hl
	call	_enems_en_an_calc
	pop	bc
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
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
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
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
.i_376
	jp	i_372
.i_373
	xor a
	ld (_line_of_text_clear+32-2), a
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,40 % 256	;const
	push	hl
	ld	hl,_line_of_text_clear
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_e_scripts+74)
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
	jp	i_385
.i_383
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_385
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_384
	jp	nc,i_384
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
	ld	a,(__en_t)
	and	a
	jp	z,i_386
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
	jp	nc,i_387
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
.i_387
	ld	a,(__en_t)
	cp	#(6 % 256)
	jp	z,i_389
	ld	a,(__en_t)
	cp	#(0 % 256)
	jp	nz,i_388
.i_389
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_391
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
	jp	nc,i_393
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
	ld	hl,128	;const
	call	l_lt
	jr	c,i_394_i_393
.i_393
	jp	i_392
.i_394_i_393
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_395
.i_392
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
	jp	nc,i_397
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
	ld	hl,65408	;const
	call	l_gt
	jr	c,i_398_i_397
.i_397
	jp	i_396
.i_398_i_397
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_pint
.i_396
.i_395
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
	jp	nc,i_400
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
	ld	hl,128	;const
	call	l_lt
	jr	c,i_401_i_400
.i_400
	jp	i_399
.i_401_i_400
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_402
.i_399
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
	jp	nc,i_404
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
	ld	hl,65408	;const
	call	l_gt
	jr	c,i_405_i_404
.i_404
	jp	i_403
.i_405_i_404
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_pint
.i_403
.i_402
.i_391
	ld	a,(_scenery_info+1+1+1)
	and	a
	jp	z,i_406
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
.i_406
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
	jp	nc,i_407
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
.i_407
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
	jp	nc,i_408
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
.i_408
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
	jp	nc,i_409
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
.i_409
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
	jp	nc,i_410
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
.i_410
.i_388
	._en_bg_collision
	ld a, (__en_x)
	srl a
	srl a
	srl a
	srl a
	ld (_en_xx), a
	ld a, (__en_y)
	srl a
	srl a
	srl a
	srl a
	ld (_en_yy), a
	ld a, (__en_mx)
	or a
	jr z, _en_bg_collision_horz_done
	._en_bg_collision_horz
	ld a, (__en_mx)
	call __ctileoff
	ld (_rdi), a
	ld c, a
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
	ld c, a
	xor a
	sub c
	ld (__en_mx), a
	._en_bg_collision_horz_done
	ld a, (__en_my)
	or a
	jr z, _en_bg_collision_vert_done
	._en_bg_collision_vert
	ld a, (__en_my)
	call __ctileoff
	ld (_rdi), a
	ld c, a
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
	ld c, a
	xor a
	sub c
	ld (__en_my), a
	._en_bg_collision_vert_done
	jr _en_bg_collision_end
	._en_bg_collision_check
	ld a, (_ptx1)
	ld c, a
	ld a, (_pty1)
	call _attr_enems
	ld a, l
	and 8
	ret nz
	ld a, (_ptx2)
	ld c, a
	ld a, (_pty2)
	call _attr_enems
	ld a, l
	and 8
	ret
	.__ctileoff
	bit 7, a
	jr z, __ctileoff_1
	xor a
	ret
	.__ctileoff_1
	ld a, 1
	ret
	._en_bg_collision_end
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
	ld	a,(__en_t)
	cp	#(6 % 256)
	jp	nz,i_411
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
	jp	i_412
.i_411
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
.i_412
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_414
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_414
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_415_i_414
.i_414
	jp	i_413
.i_415_i_414
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	z,i_417
	ld	a,(_player+14)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ugt
	jp	nc,i_416
.i_417
	ld	hl,__en_my
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_419
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_420
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,17
	add	hl,bc
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_uge
	jp	nc,i_422
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ule
	jr	c,i_423_i_422
.i_422
	jp	i_421
.i_423_i_422
	call	_platform_get_player
.i_421
	jp	i_424
.i_420
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_uge
	jp	nc,i_426
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ule
	jr	c,i_427_i_426
.i_426
	jp	i_425
.i_427_i_426
	call	_platform_get_player
.i_425
.i_424
.i_419
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_429
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_429
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_en_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_429
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_430_i_429
.i_429
	jp	i_428
.i_430_i_429
	call	_platform_get_player
	ld	hl,__en_mx
	call	l_gchar
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	ld	(_ptgmx),hl
.i_428
.i_416
	jp	i_431
.i_413
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_433
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_433
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_433
	jr	c,i_434_i_433
.i_433
	jp	i_432
.i_434_i_433
	ld	a,(_player+23)
	and	a
	jp	nz,i_435
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2 % 256	;const
	call	_play_sfx
	ld	hl,(_enit)
	ld	h,0
	ld	a,l
	ld	(_enemy_killer),a
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	z,i_436
	jp	c,i_436
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_437
.i_436
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-5
	add	hl,bc
	pop	de
	call	l_pint
.i_437
	call	_player_flicker
.i_435
.i_432
.i_431
.i_386
.i_438
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
	jp	i_383
.i_384
	ret



._main
	di
	ld sp, 61936
	xor a
	ld (_ay_player_on), a
	ld bc, 0x7ffd
	xor a
	out (c), a
	ld a, (0x1)
	ld h, a
	ld a, 0x10
	out (c), a
	ld a, (0x1)
	cp h
	jr z, no128K
	ld sp, 24199
	call arkos_address_call
	ld a, 1
	jr detectionDone
	.no128K
	xor a
	.detectionDone
	ld (_is128k), a
	ld	hl,61937	;const
	push	hl
	call	sp_InitIM2
	pop	bc
	ld	hl,61937	;const
	push	hl
	call	sp_CreateGenericISR
	pop	bc
	ld	hl,255 % 256	;const
	push	hl
	ld	hl,_ISR
	push	hl
	call	sp_RegisterHook
	pop	bc
	pop	bc
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
	ld	hl,50 % 256	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,60690	;const
	push	hl
	call	sp_AddMemory
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ei
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
	jp	i_441
.i_439
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_441
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_440
	jp	nc,i_440
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
	jp	i_439
.i_440
	call	_hook_system_inits
.i_442
	call	_cortina
	call	_title_screen
	ld	a,#(1 % 256 % 256)
	ld	(_playing),a
	ld	hl,_scenery_info+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_init_player
	call	_init_hotspots
	ld	a,#(12 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_result),a
	call	_msc_init_all
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
.i_444
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_445
	call	_hook_init_mainloop
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_on_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_446
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_on_pant),a
.i_446
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_447
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,23 % 256	;const
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
.i_447
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_448
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_449
	or	l
	jp	z,i_449
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_450
.i_449
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_450
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
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_448
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
	ld	a,(_f_zone_ac)
	cp	#(1 % 256)
	jp	nz,i_451
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzx1)
	ld	h,0
	call	l_uge
	jp	nc,i_453
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzx2)
	ld	h,0
	call	l_ule
	jp	nc,i_453
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzy1)
	ld	h,0
	call	l_uge
	jp	nc,i_453
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_fzy2)
	ld	h,0
	call	l_ule
	jr	c,i_454_i_453
.i_453
	jp	i_452
.i_454_i_453
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
.i_452
.i_451
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
.i_457
	ld	a,l
	cp	#(1% 256)
	jp	nz,i_456
.i_458
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6 % 256	;const
	call	_play_sfx
.i_456
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_459
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
.i_459
	._hotspots_done
	call	_hook_mainloop
.i_460
	ld	a,(_isrc)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_ult
	jp	nc,i_461
	halt
	jp	i_460
.i_461
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_isrc),a
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
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_462
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
.i_462
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_464
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_465_i_464
.i_464
	jp	i_463
.i_465_i_464
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	a,#(224 % 256 % 256)
	ld	(_gpx),a
	ld	hl,14336	;const
	ld	(_player),hl
	jp	i_466
.i_463
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_468
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_469_i_468
.i_468
	jp	i_467
.i_469_i_468
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,0	;const
	ld	(_player),hl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
.i_467
.i_466
	ld	hl,(_player+1+1)
	ld	de,65024	;const
	call	l_eq
	jp	nc,i_471
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_471
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_471_uge
	jp	c,i_471
.i_471_uge
	jr	i_472_i_471
.i_471
	jp	i_470
.i_472_i_471
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-6
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
	jp	i_473
.i_470
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_475
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_476_i_475
.i_475
	jp	i_474
.i_476_i_475
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,0	;const
	ld	(_player+1+1),hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
.i_474
.i_473
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_477
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_477
	ld	a,(_player+36)
	and	a
	jp	z,i_478
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_479
	or	l
	jp	z,i_479
.i_479
.i_478
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_481
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	z,i_481
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_480
.i_481
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_480
	jp	i_444
.i_445
	jp	i_442
.i_443
	ret


	.musicstart
	ret
;	SECTION	text

.i_1
	defm	"RAMIRO, EL VAMPIRO"
	defb	0

	defm	"EN EL MISTERIO"
	defb	0

	defm	"DEL PAPIRO"
	defb	0

	defm	"MOJON TWINS 2020"
	defb	0

	defm	"CHURRERA 4.8"
	defb	0

	defm	"EL VAMPIRO RAMIRO"
	defb	0

	defm	"NUNCA GANA . . ."
	defb	0

	defm	"COMPLETADO   /"
	defb	0

	defm	"COMPLETADO 100/"
	defb	0

	defm	"GAME OVER!"
	defb	0

	defm	"CRIPTA ABIERTA! PUEDES PASAR"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._evil_eye_screen	defs	1
._sp_moviles	defs	6
.__en_x1	defs	1
.__en_y1	defs	1
.__en_x2	defs	1
.__en_y2	defs	1
._spritesClip	defs	2
._hotspot_t	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._half_life	defs	1
._en_cx	defs	1
._en_cy	defs	1
._flags	defs	21
._gp_gen_alt	defs	2
._en_xx	defs	1
._water_top_door_x	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._enemy_died	defs	1
._killed_old	defs	1
._ezg_old	defs	1
._t_alt	defs	1
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
._trap_active	defs	1
._pinv_current_frame	defs	2
._on_pant	defs	1
._enoffs	defs	1
._pad_this_frame	defs	1
._water_level	defs	1
._button_jump	defs	1
._water_locks	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._ofrendas_idx	defs	1
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
._evil_eye_state	defs	1
._pofrendas_old	defs	1
._sc_c	defs	1
._scenery_info	defs	4
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
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._pinv	defs	1
._wall	defs	1
._f_zone_ac	defs	1
._cerrojos	defs	2
._pinv_next_frame	defs	2
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._tileoffset	defs	1
._water_ct	defs	1
._next_script	defs	2
._item_old	defs	1
._idx	defs	2
._player	defs	44
._jetpac_frame_counter	defs	1
._evil_eye_counter	defs	1
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
._trap_coins	defs	1
.__trap_bx	defs	1
.__trap_by	defs	1
._enoffsmasi	defs	1
.__trap_bt	defs	1
._rda	defs	1
._rdb	defs	1
._sp_pinv	defs	2
._opscore	defs	1
._game_loop_flag	defs	1
._latest_hotspot	defs	1
._asm_int	defs	2
._script	defs	2
._sc_terminado	defs	1
.__baddies_pointer	defs	2
._is128k	defs	1
._trap_bt	defs	3
._trap_bx	defs	3
._trap_by	defs	3
._sc_continuar	defs	1
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
._trap_screen	defs	1
._which_character	defs	1
._pofrendas	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	__en_t
	XDEF	_read_vbyte
	LIB	sp_ScreenStr
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_ay_player_on
	defc	_ay_player_on	=	23701
	XDEF	_hotspots
	XDEF	_abs_a
	XDEF	_draw_scr
	LIB	sp_PixelUp
	XDEF	_arkos_play_music
	LIB	sp_JoyFuller
	XDEF	_f_scripts
	LIB	sp_MouseAMXInit
	XDEF	_can_move_box
	XDEF	_hook_init_mainloop
	XDEF	_evil_eye_screen
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
	XDEF	_adm_s_n_pant
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23654
	XDEF	_init_falling_box_buffer
	XDEF	_show_text_box
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
	XDEF	_water_top_door_x
	XDEF	_en_yy
	XDEF	_draw_text
	XDEF	_key_1
	XDEF	_key_2
	XDEF	_key_3
	LIB	sp_MoveSprRel
	XDEF	_clear_gamearea
	XDEF	_recuadrius
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
	LIB	sp_ClearRect
	XDEF	_ezg_old
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
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
	XDEF	__n
	XDEF	_title_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	23645
	XDEF	__t
	XDEF	_map_behaviours
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
	XDEF	_text0
	XDEF	_text1
	XDEF	_text2
	XDEF	_text3
	XDEF	_text4
	XDEF	_text5
	XDEF	_text6
	XDEF	_text7
	XDEF	_text8
	XDEF	_text9
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
	XDEF	_msccf_0
	XDEF	_msccf_1
	XDEF	_msccf_2
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_msccf_3
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
	XDEF	_extra_sprite_21_a
	XDEF	_extra_sprite_21_b
	XDEF	_extra_sprite_21_c
	XDEF	_sp_player
	XDEF	_extra_sprite_22_a
	XDEF	_extra_sprite_22_b
	XDEF	_extra_sprite_22_c
	XDEF	_gp_gen
	XDEF	_extra_sprite_23_a
	XDEF	_extra_sprite_23_b
	XDEF	_extra_sprite_23_c
	XDEF	_sprite_18_a
	XDEF	_qtile
	XDEF	_evil_eye_state_tiles
	XDEF	_trap_active
	XDEF	_pinv_current_frame
	LIB	sp_GetTiles
	XDEF	_texts
	XDEF	_adm_s_x
	XDEF	_adm_s_y
	XDEF	_msccf_4
	XDEF	_msccf_5
	XDEF	_msccf_6
	XDEF	_msccf_7
	XDEF	_msccf_8
	XDEF	_msccf_9
	XDEF	_read_byte
	XDEF	_s_marco
	XDEF	_spritesClipValues
	XDEF	_init_player
	XDEF	_draw_and_advance
	XDEF	_on_pant
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_enoffs
	XDEF	_pad_this_frame
	XDEF	_water_level
	XDEF	_button_jump
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	XDEF	_water_locks
	XDEF	_evil_eye_state_cts
	LIB	sp_GetAttrAddr
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_sprite_remove_aid
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_en_j
	XDEF	_redraw_after_text
	XDEF	_draw_falling_block
	XDEF	_en_an_ff
	defc	_en_an_ff	=	23651
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_draw_rectangle
	XDEF	_ISR
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_enit
	XDEF	_collide_enem
	XDEF	_hook_mainloop
	XDEF	_ofrendas_idx
	XDEF	_mapa
	LIB	sp_ListSearch
	LIB	sp_WaitForKey
	XDEF	_main
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
	XDEF	_evil_eye_state
	XDEF	_pofrendas_old
	XDEF	_hook_entering
	LIB	sp_ListNext
	XDEF	_sc_c
	XDEF	_s_title
	XDEF	_scenery_info
	XDEF	_sc_i
	XDEF	_line_of_text_clear
	XDEF	_player_cells
	XDEF	_sc_m
	XDEF	_sc_n
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_enems_calc_frame
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_isrc
	defc	_isrc	=	23700
	XDEF	_sc_x
	XDEF	_sc_y
	XDEF	_objs_old
	XDEF	_gpxx
	XDEF	_gpyy
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_ofrendas_order
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_move
	XDEF	_pinv
	XDEF	_wall
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	XDEF	_f_zone_ac
	LIB	sp_MoveSprAbsNC
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_pinv_next_frame
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	_step
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_hook_init_game
	XDEF	_read_x_y
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_u_free
	XDEF	_tileoffset
	XDEF	_paint_water_strip
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_redraw_from_buffer
	XDEF	_water_ct
	XDEF	_temp_string
	XDEF	_clear_temp_string
	XDEF	_next_script
	XDEF	_run_script
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
	XDEF	_evil_eye_counter
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
	XDEF	_script_result
	LIB	sp_Initialize
	XDEF	_sprite_5_a
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_tileset
	XDEF	_sprite_6_a
	LIB	sp_ComputePos
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
	XDEF	_arkos_stop_sound
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
	XDEF	_trap_coins
	XDEF	__trap_bx
	XDEF	__trap_by
	XDEF	_enoffsmasi
	XDEF	__trap_bt
	XDEF	_rda
	XDEF	_rdb
	XDEF	_sp_pinv
	XDEF	_opscore
	XDEF	_text10
	XDEF	_text11
	XDEF	_text12
	XDEF	_text13
	XDEF	_text14
	XDEF	_text15
	XDEF	_text16
	XDEF	_text17
	XDEF	_game_loop_flag
	XDEF	_text18
	XDEF	_text19
	XDEF	_text20
	XDEF	_text21
	XDEF	_text22
	LIB	sp_IntIntervals
	XDEF	_text23
	XDEF	_my_malloc
	XDEF	_text24
	XDEF	_text25
	XDEF	_text26
	XDEF	_text27
	XDEF	_text28
	XDEF	_text29
	LIB	sp_inp
	XDEF	_text30
	XDEF	_latest_hotspot
	XDEF	_text31
	LIB	sp_IterateSprChar
	XDEF	_text32
	LIB	sp_AddColSpr
	XDEF	_text33
	XDEF	_text34
	XDEF	_text35
	XDEF	_text36
	XDEF	_text37
	LIB	sp_outp
	XDEF	_water_pushplates
	XDEF	_text38
	XDEF	_talk_sounds
	XDEF	_decorate_screen
	XDEF	_mscce_10
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_asm_int
	XDEF	_hotspot_paint
	XDEF	_mscce_13
	XDEF	_e_scripts
	XDEF	_script
	XDEF	_sc_terminado
	XDEF	_msc_init_all
	XDEF	_speech
	XDEF	_get_coin
	XDEF	_player_flicker
	LIB	sp_IntPtInterval
	XDEF	_init_hotspots
	LIB	sp_RegisterHookFirst
	XDEF	__baddies_pointer
	LIB	sp_HashLookup
	XDEF	_trap_kill
	XDEF	_any_key
	LIB	sp_PFill
	XDEF	_is128k
	XDEF	_trap_bt
	LIB	sp_HashRemove
	XDEF	_trap_bx
	XDEF	_trap_by
	LIB	sp_CharUp
	XDEF	_sc_continuar
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
	XDEF	_trap_screen
	XDEF	_object_cells
	XDEF	_which_character
	XDEF	_render_all_sprites
	XDEF	_unpack
	LIB	sp_IterateDList
	XDEF	_pofrendas
	XDEF	_max_screens
	XDEF	_draw_scr_background
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	XDEF	_water_trap_setup
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
