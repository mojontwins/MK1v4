;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Sun Jul 16 09:14:24 2023



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


	LIB SPInvalidate
	LIB SPCompDListAddr
	LIB SPMoveSprAbs
	LIB SPTileArray
	LIB SPPrintAtInv
	LIB SPUpdateNow
	LIB SPInitialize
	LIB SPNullSprPtr
	XREF SProtatetblInitialize
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	24

	defm	""
	defb	24

	defm	""
	defb	8

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
	defb	8

	defm	""
	defb	4

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	10

	defm	""
	defb	11

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


	; -----------------------------------------------------------------------------
	; ZX0 decoder by Einar Saukas & Urusergi
	; "Standard" version (68 bytes only)
	; -----------------------------------------------------------------------------
	; .Parameters
	; .HL source address (compressed data)
	; .DE destination address (decompressing)
	; -----------------------------------------------------------------------------
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
	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDE"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	34

	defm	"^"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	229

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" B-"
	defb	220

	defm	""
	defb	197

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	"%"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	224

	defm	"U"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	224

	defm	"R"
	defb	34

	defm	""
	defb	224

	defm	""
	defb	5

	defm	"R"
	defb	226

	defm	""
	defb	224

	defm	""
	defb	229

	defm	"DDDE"
	defb	227

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"^"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P0"
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
	defb	14

	defm	""
	defb	34

	defm	""
	defb	224

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"P"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	14

	defm	"%"
	defb	34

	defm	""
	defb	14

	defm	""
	defb	5

	defm	"r"
	defb	34

	defm	""
	defb	226

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	".^ "
	defb	0

	defm	""
	defb	34

	defm	"%wr%"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	"DDDGu"
	defb	226

	defm	""
	defb	226

	defm	" "
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	230

	defm	"P"
	defb	226

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	230

	defm	""
	defb	149

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	4

	defm	"DDDDDDD"
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
	defb	226

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	226

	defm	""
	defb	14

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"."
	defb	34

	defm	""
	defb	226

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

	defm	""
	defb	224

	defm	"wp"
	defb	0

	defm	"wr"
	defb	34

	defm	"r."
	defb	0

	defm	""
	defb	0

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	224

	defm	""
	defb	238

	defm	""
	defb	238

	defm	".."
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	2

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	226

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	4

	defm	"DDDD@"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	34

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"i"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	158

	defm	""
	defb	34

	defm	""
	defb	233

	defm	""
	defb	144

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

	defm	"b"
	defb	152

	defm	""
	defb	137

	defm	"i"
	defb	150

	defm	"b"
	defb	34

	defm	")n"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"w"
	defb	34

	defm	""
	defb	233

	defm	"("
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	158

	defm	""
	defb	238

	defm	"$"
	defb	226

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	226

	defm	"i"
	defb	226

	defm	"("
	defb	150

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	144

	defm	""
	defb	230

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	226

	defm	")x"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	150

	defm	"f`iwx"
	defb	137

	defm	"DDDDDDDD."
	defb	225

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	30

	defm	""
	defb	226

	defm	""
	defb	238

	defm	"N"
	defb	0

	defm	""
	defb	0

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

	defm	"N"
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
	defb	224

	defm	"D"
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
	defb	238

	defm	""
	defb	4

	defm	"N"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	227

	defm	""
	defb	0

	defm	"D"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"I"
	defb	224

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

	defm	"Dgw"
	defb	0

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDDDDN"
	defb	224

	defm	"."
	defb	225

	defm	"."
	defb	30

	defm	"."
	defb	30

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"d"
	defb	230

	defm	""
	defb	230

	defm	""
	defb	237

	defm	"w"
	defb	0

	defm	""
	defb	0

	defm	"n"
	defb	238

	defm	"^nn"
	defb	0

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	13

	defm	"}"
	defb	230

	defm	"w"
	defb	4

	defm	"pN"
	defb	0

	defm	"nn^"
	defb	0

	defm	"N"
	defb	0

	defm	"U"
	defb	230

	defm	""
	defb	229

	defm	""
	defb	230

	defm	"D"
	defb	228

	defm	""
	defb	187

	defm	""
	defb	204

	defm	""
	defb	190

	defm	""
	defb	206

	defm	"K"
	defb	188

	defm	""
	defb	203

	defm	"L"
	defb	206

	defm	""
	defb	5

	defm	"U"
	defb	228

	defm	""
	defb	204

	defm	""
	defb	238

	defm	""
	defb	196

	defm	""
	defb	227

	defm	""
	defb	3

	defm	""
	defb	187

	defm	"DN"
	defb	224

	defm	""
	defb	14

	defm	"DL"
	defb	188

	defm	"DDDDN"
	defb	225

	defm	""
	defb	236

	defm	""
	defb	225

	defm	""
	defb	226

	defm	""
	defb	18

	defm	""
	defb	238

	defm	""
	defb	30

	defm	""
	defb	11

	defm	""
	defb	198

	defm	""
	defb	224

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
	defb	190

	defm	""
	defb	231

	defm	""
	defb	13

	defm	""
	defb	236

	defm	""
	defb	224

	defm	"p"
	defb	0

	defm	""
	defb	12

	defm	"g"
	defb	0

	defm	""
	defb	222

	defm	""
	defb	206

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"n"
	defb	229

	defm	""
	defb	237

	defm	""
	defb	229

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	224

	defm	"n"
	defb	238

	defm	"U^"
	defb	0

	defm	""
	defb	11

	defm	""
	defb	196

	defm	""
	defb	229

	defm	""
	defb	235

	defm	""
	defb	204

	defm	""
	defb	203

	defm	"kU"
	defb	206

	defm	"JT"
	defb	206

	defm	""
	defb	238

	defm	""
	defb	206

	defm	""
	defb	196

	defm	"^"
	defb	4

	defm	"DN"
	defb	0

	defm	""
	defb	14

	defm	""
	defb	14

	defm	"DDDDDDDDN!"
	defb	226

	defm	""
	defb	225

	defm	""
	defb	226

	defm	""
	defb	30

	defm	""
	defb	226

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

	defm	"n"
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
	defb	14

	defm	"p"
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
	defb	13

	defm	""
	defb	221

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"E"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"a."
	defb	0

	defm	""
	defb	4

	defm	"Z"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	14

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
	defb	158

	defm	""
	defb	4

	defm	"DDDDDDDGig"
	defb	150

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"i"
	defb	153

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

	defm	"0"
	defb	6

	defm	"a"
	defb	0

	defm	"3#20"
	defb	0

	defm	""
	defb	150

	defm	""
	defb	145

	defm	"2"
	defb	136

	defm	""
	defb	34

	defm	""
	defb	26

	defm	""
	defb	17

	defm	""
	defb	25

	defm	"yyw"
	defb	183

	defm	"ivii"
	defb	9

	defm	""
	defb	7

	defm	""
	defb	155

	defm	""
	defb	153

	defm	""
	defb	9

	defm	""
	defb	153

	defm	"F"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	144

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	145

	defm	""
	defb	3

	defm	"#+3"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	166

	defm	"d"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	"GDDDDDDD@"
	defb	0

	defm	""
	defb	0

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
	defb	34

	defm	""
	defb	34

	defm	""
	defb	130

	defm	" "
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	"200"
	defb	4

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	17

	defm	"GL"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	196

	defm	"tD"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"D@"
	defb	0

	defm	" 2"
	defb	34

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"*1:1"
	defb	17

	defm	""
	defb	17

	defm	"7gyvwyvtDDDDDDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@#"
	defb	34

	defm	" "
	defb	0

	defm	"3"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	3

	defm	""
	defb	34

	defm	"0"
	defb	1

	defm	""
	defb	3

	defm	"$D@2 0"
	defb	144

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	3

	defm	"0"
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	3

	defm	"@#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"DD@"
	defb	2

	defm	"00"
	defb	0

	defm	"DDD220"
	defb	4

	defm	"DDDDD"
	defb	187

	defm	""
	defb	180

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"DDDDD"
	defb	153

	defm	"vp"
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
	defb	6

	defm	""
	defb	150

	defm	""
	defb	3

	defm	"0P"
	defb	3

	defm	""
	defb	2

	defm	"#"
	defb	6

	defm	"tDD"
	defb	221

	defm	""
	defb	208

	defm	"2"
	defb	34

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	2

	defm	"#0"
	defb	146

	defm	"0"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"#"
	defb	0

	defm	"5DDD"
	defb	2

	defm	""
	defb	3

	defm	""
	defb	13

	defm	""
	defb	221

	defm	"TDDJ"
	defb	16

	defm	""
	defb	34

	defm	"0"
	defb	5

	defm	"Fv"
	defb	150

	defm	""
	defb	221

	defm	""
	defb	3

	defm	"2"
	defb	0

	defm	"T"
	defb	150

	defm	""
	defb	144

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	5

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

	defm	"^0"
	defb	213

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	3

	defm	""
	defb	224

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	213

	defm	"^0"
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
	defb	224

	defm	"]"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	5

	defm	"R"
	defb	34

	defm	""
	defb	229

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	".U"
	defb	226

	defm	" P"
	defb	0

	defm	""
	defb	150

	defm	".%R."
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
	defb	14

	defm	""
	defb	0

	defm	"P"
	defb	4

	defm	"DDDDDDDDDD@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"R."
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	213

	defm	"."
	defb	14

	defm	"%"
	defb	208

	defm	""
	defb	13

	defm	""
	defb	14

	defm	""
	defb	34

	defm	"R."
	defb	2

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	"%."
	defb	2

	defm	""
	defb	229

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"^"
	defb	0

	defm	""
	defb	224

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

	defm	"P@"
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

	defm	"DDDDM"
	defb	221

	defm	""
	defb	214

	defm	"DDDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	146

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	224

	defm	""
	defb	9

	defm	""
	defb	153

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"."
	defb	224

	defm	""
	defb	14

	defm	"b"
	defb	231

	defm	"wr."
	defb	224

	defm	""
	defb	14

	defm	"&"
	defb	34

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	226

	defm	""
	defb	224

	defm	""
	defb	231

	defm	""
	defb	34

	defm	"`"
	defb	226

	defm	""
	defb	226

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	238

	defm	"&"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	224

	defm	"p"
	defb	226

	defm	""
	defb	226

	defm	".`"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	226

	defm	""
	defb	233

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	153

	defm	""
	defb	0

	defm	"DDDDDI"
	defb	150

	defm	"i"
	defb	153

	defm	""
	defb	137

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
	defb	134

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

	defm	"De"
	defb	0

	defm	"330"
	defb	0

	defm	""
	defb	4

	defm	"CD"
	defb	227

	defm	"33"
	defb	0

	defm	""
	defb	0

	defm	"DDN"
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

	defm	"wwDDN"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"N"
	defb	228

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	224

	defm	"D"
	defb	224

	defm	"N"
	defb	0

	defm	"N"
	defb	238

	defm	""
	defb	215

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	"p"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	13

	defm	""
	defb	224

	defm	"DpN"
	defb	0

	defm	"Nw"
	defb	222

	defm	"tN"
	defb	0

	defm	""
	defb	11

	defm	""
	defb	196

	defm	"D"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	20

	defm	""
	defb	224

	defm	""
	defb	5

	defm	""
	defb	206

	defm	""
	defb	18

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"Gwp"
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
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	164

	defm	""
	defb	203

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	"DL"
	defb	180

	defm	"D"
	defb	196

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	238

	defm	""
	defb	236

	defm	"!"
	defb	238

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	""
	defb	238

	defm	""
	defb	0

	defm	"D"
	defb	224

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	11

	defm	""
	defb	224

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	""
	defb	197

	defm	""
	defb	224

	defm	""
	defb	228

	defm	""
	defb	224

	defm	"Ntw{"
	defb	180

	defm	"D"
	defb	0

	defm	"DD"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	14

	defm	""
	defb	30

	defm	"."
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	225

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	8

	defm	""
	defb	224

	defm	"N"
	defb	4

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	190

	defm	""
	defb	14

	defm	""
	defb	224

	defm	"DDDDL"
	defb	203

	defm	"G"
	defb	14

	defm	""
	defb	225

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	225

	defm	""
	defb	238

	defm	""
	defb	196

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

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	4

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
	defb	153

	defm	"DDDDDD"
	defb	224

	defm	"A"
	defb	226

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
	defb	136

	defm	""
	defb	141

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

	defm	"K"
	defb	204

	defm	""
	defb	196

	defm	"DD"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	228

	defm	""
	defb	206

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	"N"
	defb	222

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	235

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	201

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	148

	defm	"DD"
	defb	203

	defm	"TDDDDDDE"
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	34

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	2

	defm	"0"
	defb	130

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	213

	defm	"P0"
	defb	130

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	0

	defm	""
	defb	130

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	21

	defm	"P"
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	167

	defm	"E"
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
	defb	7

	defm	""
	defb	148

	defm	"Q"
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	25

	defm	""
	defb	17

	defm	""
	defb	150

	defm	"E"
	defb	144

	defm	""
	defb	7

	defm	"vwfv"
	defb	148

	defm	"DDDDDDD@"
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

	defm	"P"
	defb	3

	defm	""
	defb	34

	defm	"0#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	211

	defm	""
	defb	3

	defm	""
	defb	130

	defm	"0"
	defb	2

	defm	""
	defb	0

	defm	"3P"
	defb	3

	defm	""
	defb	2

	defm	""
	defb	136

	defm	" #0%"
	defb	0

	defm	""
	defb	163

	defm	""
	defb	3

	defm	"3320@"
	defb	9

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	3

	defm	"#($"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	208

	defm	"00P"
	defb	4

	defm	""
	defb	156

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	197

	defm	"DDK"
	defb	187

	defm	"D"
	defb	3

	defm	"#0@"
	defb	0

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	176

	defm	"2"
	defb	34

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"D"
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0@0"
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	"4#"
	defb	3

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"B"
	defb	130

	defm	"3"
	defb	3

	defm	""
	defb	0

	defm	"D"
	defb	1

	defm	""
	defb	20

	defm	""
	defb	3

	defm	""
	defb	130

	defm	"#0DD"
	defb	153

	defm	"C "
	defb	4

	defm	"DD"
	defb	0

	defm	"B0"
	defb	0

	defm	""
	defb	0

	defm	"["
	defb	176

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"0"
	defb	20

	defm	"DD"
	defb	187

	defm	"DI"
	defb	144

	defm	"9I"
	defb	153

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

	defm	"T"
	defb	9

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	213

	defm	"@3 0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"T"
	defb	2

	defm	""
	defb	2

	defm	" "
	defb	3

	defm	"0"
	defb	0

	defm	""
	defb	5

	defm	"@"
	defb	0

	defm	"0 "
	defb	3

	defm	"00T"
	defb	0

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
	defb	5

	defm	"@"
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

	defm	"P"
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
	defb	5

	defm	""
	defb	16

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

	defm	"Y"
	defb	0

	defm	""
	defb	156

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	197

	defm	"P"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	170

	defm	"DDDE"
	defb	0

	defm	""
	defb	14

	defm	"V"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	2

	defm	"%j"
	defb	186

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"Y"
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
	defb	229

	defm	""
	defb	150

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
	defb	224

	defm	"V"
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	224

	defm	""
	defb	229

	defm	"DDDDE"
	defb	226

	defm	""
	defb	226

	defm	"Z"
	defb	171

	defm	""
	defb	170

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

	defm	"Z"
	defb	164

	defm	"DDDDDDDD"
	defb	0

	defm	""
	defb	14

	defm	"j"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	226

	defm	")"
	defb	170

	defm	""
	defb	186

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	"."
	defb	226

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	"R"
	defb	226

	defm	"&"
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
	defb	226

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	"^"
	defb	34

	defm	"&DDDJ"
	defb	165

	defm	""
	defb	34

	defm	"."
	defb	154

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	170

	defm	"^>"
	defb	6

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

	defm	""
	defb	148

	defm	"DDDD@0"
	defb	4

	defm	"`"
	defb	4

	defm	"DDDDD"
	defb	150

	defm	"~0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	230

	defm	""
	defb	146

	defm	"#"
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	6

	defm	""
	defb	150

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	14

	defm	""
	defb	150

	defm	""
	defb	151

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"~"
	defb	14

	defm	">"
	defb	230

	defm	"i"
	defb	34

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"."
	defb	34

	defm	""
	defb	226

	defm	""
	defb	153

	defm	"b"
	defb	224

	defm	""
	defb	14

	defm	"."
	defb	34

	defm	"b&"
	defb	153

	defm	""
	defb	224

	defm	""
	defb	14

	defm	"."
	defb	34

	defm	"i"
	defb	34

	defm	""
	defb	230

	defm	""
	defb	144

	defm	""
	defb	226

	defm	"."
	defb	34

	defm	""
	defb	233

	defm	"b"
	defb	226

	defm	""
	defb	148

	defm	"DD"
	defb	0

	defm	"DDDI"
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
	defb	150

	defm	"ii"
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

	defm	"f"
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

	defm	"yN"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	224

	defm	""
	defb	13

	defm	""
	defb	224

	defm	"D"
	defb	231

	defm	"N"
	defb	7

	defm	"DN"
	defb	215

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	238

	defm	""
	defb	228

	defm	""
	defb	224

	defm	"DpE"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"NtN"
	defb	4

	defm	"U"
	defb	0

	defm	""
	defb	5

	defm	"T"
	defb	224

	defm	"D"
	defb	231

	defm	"DDDDG"
	defb	4

	defm	"N"
	defb	14

	defm	""
	defb	225

	defm	""
	defb	238

	defm	""
	defb	225

	defm	"."
	defb	224

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

	defm	"tN"
	defb	6

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	158

	defm	""
	defb	6

	defm	""
	defb	0

	defm	"D"
	defb	224

	defm	" "
	defb	14

	defm	""
	defb	238

	defm	""
	defb	224

	defm	" "
	defb	4

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	""
	defb	204

	defm	""
	defb	180

	defm	"D"
	defb	224

	defm	"G"
	defb	4

	defm	""
	defb	224

	defm	"q"
	defb	236

	defm	""
	defb	238

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	238

	defm	"D"
	defb	224

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"0"
	defb	3

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	""
	defb	231

	defm	"G"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	224

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	"pN"
	defb	3

	defm	""
	defb	0

	defm	"0D"
	defb	224

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	4

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	181

	defm	"D"
	defb	224

	defm	"NtN"
	defb	4

	defm	"L"
	defb	196

	defm	"DDDDDDDN"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	226

	defm	""
	defb	238

	defm	"N"
	defb	188

	defm	""
	defb	203

	defm	""
	defb	206

	defm	""
	defb	12

	defm	""
	defb	224

	defm	""
	defb	12

	defm	"D"
	defb	236

	defm	""
	defb	235

	defm	""
	defb	206

	defm	""
	defb	224

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	235

	defm	"N"
	defb	238

	defm	""
	defb	206

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	196

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	"N"
	defb	0

	defm	""
	defb	0

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

	defm	"P"
	defb	0

	defm	""
	defb	203

	defm	""
	defb	203

	defm	""
	defb	188

	defm	""
	defb	219

	defm	""
	defb	220

	defm	"EP"
	defb	4

	defm	""
	defb	196

	defm	""
	defb	204

	defm	"K"
	defb	220

	defm	"DDDDD"
	defb	196

	defm	""
	defb	204

	defm	"DDDDDDDD"
	defb	190

	defm	"!."
	defb	226

	defm	""
	defb	228

	defm	""
	defb	34

	defm	""
	defb	18

	defm	"+N"
	defb	11

	defm	""
	defb	236

	defm	""
	defb	190

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	196

	defm	""
	defb	224

	defm	""
	defb	206

	defm	""
	defb	235

	defm	""
	defb	238

	defm	""
	defb	227

	defm	""
	defb	3

	defm	""
	defb	11

	defm	""
	defb	187

	defm	""
	defb	238

	defm	""
	defb	236

	defm	""
	defb	206

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	188

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	238

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	0

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	"k"
	defb	188

	defm	""
	defb	187

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	204

	defm	"K"
	defb	206

	defm	""
	defb	0

	defm	"N00DD"
	defb	196

	defm	"p"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"Y"
	defb	16

	defm	""
	defb	153

	defm	"f"
	defb	151

	defm	"f"
	defb	150

	defm	"E"
	defb	150

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	151

	defm	""
	defb	151

	defm	"dTD"
	defb	221

	defm	""
	defb	147

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"E"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"22"
	defb	4

	defm	"P"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"2#U"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"32"
	defb	5

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"00U"
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"3"
	defb	4

	defm	"Q"
	defb	154

	defm	""
	defb	10

	defm	""
	defb	154

	defm	""
	defb	17

	defm	""
	defb	161

	defm	""
	defb	0

	defm	"Ev"
	defb	155

	defm	""
	defb	150

	defm	"v"
	defb	150

	defm	"p"
	defb	4

	defm	"DDDDDDDD"
	defb	3

	defm	" 2#22"
	defb	4

	defm	"C#2"
	defb	3

	defm	""
	defb	0

	defm	"0#d# 0D"
	defb	0

	defm	"0&S#"
	defb	3

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	149

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"DP0"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	145

	defm	""
	defb	25

	defm	""
	defb	21

	defm	""
	defb	20

	defm	""
	defb	17

	defm	""
	defb	0

	defm	"D"
	defb	183

	defm	"wwwGp"
	defb	4

	defm	"DDK"
	defb	180

	defm	"D"
	defb	153

	defm	""
	defb	0

	defm	""
	defb	148

	defm	""
	defb	160

	defm	""
	defb	9

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	20

	defm	"iy"
	defb	155

	defm	"p&"
	defb	0

	defm	"6I"
	defb	9

	defm	""
	defb	9

	defm	""
	defb	153

	defm	""
	defb	3

	defm	""
	defb	144

	defm	"1tc"
	defb	1

	defm	""
	defb	26

	defm	""
	defb	161

	defm	""
	defb	26

	defm	""
	defb	26

	defm	"yD"
	defb	187

	defm	"i"
	defb	151

	defm	"g"
	defb	151

	defm	"idK"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	153

	defm	""
	defb	155

	defm	""
	defb	153

	defm	""
	defb	185

	defm	"D"
	defb	153

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

	defm	"Ii"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	"Dgg"
	defb	153

	defm	"g"
	defb	150

	defm	""
	defb	150

	defm	""
	defb	148

	defm	""
	defb	144

	defm	""
	defb	6

	defm	"DDDDDT"
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
	defb	5

	defm	"M"
	defb	217

	defm	""
	defb	0

	defm	"200"
	defb	0

	defm	"T"
	defb	0

	defm	"02"
	defb	130

	defm	"0"
	defb	13

	defm	""
	defb	213

	defm	"M"
	defb	2

	defm	"2"
	defb	130

	defm	" "
	defb	3

	defm	""
	defb	0

	defm	"T"
	defb	3

	defm	"("
	defb	136

	defm	""
	defb	130

	defm	"3"
	defb	0

	defm	""
	defb	5

	defm	"@"
	defb	34

	defm	"223-"
	defb	221

	defm	"T"
	defb	0

	defm	"03020"
	defb	5

	defm	"@"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"T"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	"@"
	defb	13

	defm	""
	defb	213

	defm	"^.%"
	defb	170

	defm	"DDDE"
	defb	14

	defm	""
	defb	34

	defm	"]"
	defb	160

	defm	""
	defb	226

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"P"
	defb	3

	defm	""
	defb	229

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"%"
	defb	0

	defm	"0Z"
	defb	160

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	224

	defm	"P"
	defb	3

	defm	""
	defb	13

	defm	""
	defb	212

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	229

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
	defb	227

	defm	""
	defb	224

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
	defb	34

	defm	""
	defb	34

	defm	""
	defb	226

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	170

	defm	"^"
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
	defb	14

	defm	""
	defb	34

	defm	"L"
	defb	204

	defm	""
	defb	196

	defm	"J"
	defb	164

	defm	"DDDDD"
	defb	3

	defm	""
	defb	0

	defm	"B"
	defb	34

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	14

	defm	"^>"
	defb	0

	defm	"."
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"%"
	defb	34

	defm	"."
	defb	14

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	226

	defm	"R"
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"]"
	defb	221

	defm	""
	defb	221

	defm	"%"
	defb	226

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	"R."
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	226

	defm	"%."
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

	defm	"^"
	defb	14

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

	defm	"DDDDIifDD@"
	defb	4

	defm	"DDD"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"~"
	defb	0

	defm	""
	defb	14

	defm	""
	defb	238

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	238

	defm	""
	defb	14

	defm	".&"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	226

	defm	""
	defb	34

	defm	"."
	defb	14

	defm	">i"
	defb	14

	defm	"ww"
	defb	226

	defm	"."
	defb	3

	defm	""
	defb	0

	defm	"n"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	".0"
	defb	9

	defm	""
	defb	14

	defm	".."
	defb	231

	defm	"r"
	defb	227

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	14

	defm	"."
	defb	0

	defm	""
	defb	224

	defm	">"
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
	defb	226

	defm	""
	defb	34

	defm	"f"
	defb	153

	defm	""
	defb	150

	defm	"i"
	defb	153

	defm	""
	defb	150

	defm	".)"
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

	defm	"wwviN"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D`"
	defb	0

	defm	"000"
	defb	0

	defm	"dN"
	defb	7

	defm	"w"
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	14

	defm	"D"
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
	defb	4

	defm	"G"
	defb	224

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

	defm	"D"
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

	defm	"$N"
	defb	0

	defm	"zwzp"
	defb	0

	defm	"D^"
	defb	0

	defm	" "
	defb	0

	defm	" "
	defb	0

	defm	"TK^"
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

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	"D"
	defb	224

	defm	"DDD"
	defb	224

	defm	"G"
	defb	1

	defm	"N"
	defb	0

	defm	"!"
	defb	238

	defm	"N"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	190

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	224

	defm	"N"
	defb	0

	defm	"L"
	defb	224

	defm	""
	defb	220

	defm	""
	defb	204

	defm	"N"
	defb	11

	defm	"p"
	defb	4

	defm	""
	defb	187

	defm	""
	defb	206

	defm	"!"
	defb	237

	defm	""
	defb	224

	defm	""
	defb	206

	defm	""
	defb	0

	defm	","
	defb	190

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	222

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	236

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	205

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	226

	defm	""
	defb	225

	defm	""
	defb	226

	defm	""
	defb	218

	defm	""
	defb	173

	defm	""
	defb	224

	defm	""
	defb	188

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	221

	defm	""
	defb	188

	defm	""
	defb	189

	defm	""
	defb	220

	defm	""
	defb	187

	defm	""
	defb	219

	defm	""
	defb	187

	defm	"DDDDDDDN"
	defb	238

	defm	""
	defb	226

	defm	""
	defb	238

	defm	"."
	defb	226

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	220

	defm	""
	defb	222

	defm	""
	defb	0

	defm	""
	defb	205

	defm	""
	defb	221

	defm	""
	defb	203

	defm	""
	defb	204

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	194

	defm	"."
	defb	206

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	204

	defm	""
	defb	204

	defm	"P"
	defb	0

	defm	""
	defb	204

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	206

	defm	""
	defb	238

	defm	""
	defb	236

	defm	""
	defb	224

	defm	""
	defb	14

	defm	""
	defb	226

	defm	""
	defb	18

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	238

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	219

	defm	""
	defb	221

	defm	""
	defb	203

	defm	""
	defb	205

	defm	""
	defb	188

	defm	"DDN"
	defb	0

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	"N"
	defb	238

	defm	""
	defb	228

	defm	""
	defb	224

	defm	"t"
	defb	227

	defm	""
	defb	3

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"N"
	defb	0

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	"L"
	defb	205

	defm	""
	defb	205

	defm	"p"
	defb	4

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	176

	defm	"N"
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	180

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	198

	defm	"N00N"
	defb	238

	defm	""
	defb	226

	defm	""
	defb	30

	defm	""
	defb	238

	defm	""
	defb	224

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
	defb	13

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	187

	defm	""
	defb	188

	defm	"DTD"
	defb	180

	defm	"DDD"
	defb	0

	defm	"E"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	"R0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	151

	defm	"e"
	defb	161

	defm	""
	defb	161

	defm	""
	defb	0

	defm	" "
	defb	2

	defm	""
	defb	0

	defm	""
	defb	151

	defm	"Wi"
	defb	147

	defm	" "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	149

	defm	"i"
	defb	3

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	" Y"
	defb	0

	defm	"00000%"
	defb	2

	defm	"1"
	defb	0

	defm	"0"
	defb	16

	defm	"1"
	defb	0

	defm	"["
	defb	187

	defm	""
	defb	155

	defm	""
	defb	187

	defm	""
	defb	185

	defm	""
	defb	187

	defm	"{"
	defb	181

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
	defb	182

	defm	""
	defb	187

	defm	"KDDDDD"
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

	defm	"v"
	defb	148

	defm	""
	defb	217

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"F"
	defb	144

	defm	"P"
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
	defb	144

	defm	""
	defb	5

	defm	""
	defb	3

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	3

	defm	"P"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	3

	defm	"%"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"@"
	defb	2

	defm	"P"
	defb	160

	defm	"02"
	defb	10

	defm	""
	defb	4

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	161

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"zK"
	defb	187

	defm	""
	defb	151

	defm	"g"
	defb	150

	defm	""
	defb	151

	defm	"yvDDDDDDDD"
	defb	0

	defm	""
	defb	0

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

	defm	"@:"
	defb	3

	defm	""
	defb	34

	defm	"*"
	defb	19

	defm	""
	defb	0

	defm	"D"
	defb	3

	defm	"`"
	defb	2

	defm	"1"
	defb	150

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	5

	defm	"0"
	defb	160

	defm	""
	defb	144

	defm	""
	defb	144

	defm	"=D"
	defb	10

	defm	"P"
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"J"
	defb	153

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"*"
	defb	26

	defm	""
	defb	26

	defm	"D"
	defb	153

	defm	"0"
	defb	3

	defm	"0wwwA"
	defb	161

	defm	""
	defb	0

	defm	""
	defb	28

	defm	""
	defb	201

	defm	"ii"
	defb	151

	defm	"w"
	defb	156

	defm	""
	defb	201

	defm	"if"
	defb	153

	defm	"fDDDDD"
	defb	0

	defm	""
	defb	0

	defm	"Q"
	defb	26

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
	defb	213

	defm	"Fi"
	defb	3

	defm	""
	defb	3

	defm	""
	defb	34

	defm	"2#Ti"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	5

	defm	"I3"
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	"="
	defb	208

	defm	"T0"
	defb	3

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	5

	defm	"J"
	defb	3

	defm	""
	defb	34

	defm	"0020Vq"
	defb	3

	defm	""
	defb	34

	defm	"##"
	defb	0

	defm	"5"
	defb	150

	defm	""
	defb	145

	defm	""
	defb	3

	defm	""
	defb	34

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"0V"
	defb	150

	defm	"s"
	defb	3

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"P"
	defb	3

	defm	""
	defb	4

	defm	"DDD"
	defb	170

	defm	"E"
	defb	14

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
	defb	171

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	186

	defm	"U"
	defb	226

	defm	""
	defb	226

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

	defm	""
	defb	225

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

	defm	""
	defb	224

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

	defm	"^0"
	defb	1

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	186

	defm	"U"
	defb	3

	defm	""
	defb	224

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

	defm	"^."
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

	defm	".DDDDDDDDDD"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	149

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
	defb	238

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
	defb	226

	defm	".]"
	defb	221

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	161

	defm	""
	defb	226

	defm	""
	defb	226

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
	defb	226

	defm	""
	defb	226

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
	defb	227

	defm	""
	defb	229

	defm	""
	defb	170

	defm	""
	defb	173

	defm	""
	defb	218

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	0

	defm	">Z"
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
	defb	226

	defm	""
	defb	228

	defm	"DDDD@"
	defb	0

	defm	"w"
	defb	153

	defm	"i"
	defb	150

	defm	""
	defb	150

	defm	""
	defb	150

	defm	""
	defb	146

	defm	""
	defb	34

	defm	""
	defb	158

	defm	".."
	defb	3

	defm	""
	defb	238

	defm	""
	defb	34

	defm	""
	defb	238

	defm	""
	defb	150

	defm	"www~"
	defb	14

	defm	""
	defb	226

	defm	""
	defb	150

	defm	""
	defb	146

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	227

	defm	""
	defb	0

	defm	"wwv"
	defb	226

	defm	""
	defb	34

	defm	".0"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	14

	defm	"b.."
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

	defm	"."
	defb	0

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"9i"
	defb	34

	defm	"."
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	6

	defm	"igwwww"
	defb	153

	defm	""
	defb	153

	defm	"i"
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

	defm	"f"
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
	defb	224

	defm	"DDDDD"
	defb	238

	defm	""
	defb	238

	defm	"~"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	".@"
	defb	0

	defm	""
	defb	0

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

	defm	"G"
	defb	0

	defm	""
	defb	188

	defm	"D"
	defb	187

	defm	""
	defb	224

	defm	"K!"
	defb	224

	defm	""
	defb	12

	defm	""
	defb	236

	defm	","
	defb	181

	defm	""
	defb	228

	defm	""
	defb	206

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	254

	defm	""
	defb	236

	defm	"DN"
	defb	224

	defm	""
	defb	136

	defm	""
	defb	224

	defm	""
	defb	203

	defm	""
	defb	224

	defm	""
	defb	226

	defm	""
	defb	228

	defm	"P"
	defb	14

	defm	""
	defb	238

	defm	"T"
	defb	197

	defm	"^"
	defb	0

	defm	"EP"
	defb	0

	defm	"UDU^"
	defb	4

	defm	"L"
	defb	187

	defm	""
	defb	188

	defm	"DDDDMDDDDDDN"
	defb	226

	defm	""
	defb	238

	defm	""
	defb	30

	defm	""
	defb	238

	defm	""
	defb	225

	defm	"."
	defb	238

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
	defb	0

	defm	""
	defb	234

	defm	""
	defb	170

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"dD"
	defb	180

	defm	"DK"
	defb	196

	defm	"DD"
	defb	225

	defm	""
	defb	236

	defm	"ff"
	defb	194

	defm	""
	defb	238

	defm	"."
	defb	224

	defm	""
	defb	0

	defm	""
	defb	238

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	0

	defm	"fn"
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ffdDDDDDDDDDDDDDDN."
	defb	238

	defm	""
	defb	30

	defm	""
	defb	226

	defm	""
	defb	225

	defm	""
	defb	238

	defm	"."
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

	defm	"f"
	defb	170

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	172

	defm	""
	defb	180

	defm	"DDDDDDD"
	defb	226

	defm	""
	defb	230

	defm	"f"
	defb	238

	defm	"."
	defb	30

	defm	""
	defb	238

	defm	"`"
	defb	0

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	238

	defm	""
	defb	14

	defm	"n"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"f"
	defb	224

	defm	""
	defb	4

	defm	"DDDDDDDD"
	defb	224

	defm	"DDL"
	defb	188

	defm	"DN."
	defb	1

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	28

	defm	""
	defb	226

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
	defb	224

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
	defb	231

	defm	"n."
	defb	238

	defm	""
	defb	6

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	238

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"n"
	defb	0

	defm	"N"
	defb	0

	defm	"dDDDD"
	defb	228

	defm	"wt["
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
	defb	155

	defm	""
	defb	181

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
	defb	187

	defm	""
	defb	187

	defm	"Yv"
	defb	187

	defm	"i"
	defb	153

	defm	""
	defb	153

	defm	"y"
	defb	149

	defm	""
	defb	0

	defm	""
	defb	155

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	9

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	21

	defm	""
	defb	9

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	151

	defm	""
	defb	16

	defm	""
	defb	6

	defm	"S"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	151

	defm	""
	defb	221

	defm	""
	defb	149

	defm	"#"
	defb	3

	defm	"2"
	defb	144

	defm	" "
	defb	144

	defm	"&b#"
	defb	34

	defm	"0"
	defb	3

	defm	"&"
	defb	3

	defm	"yDDDDD"
	defb	157

	defm	"&"
	defb	187

	defm	""
	defb	180

	defm	"DDDDik"
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"v"
	defb	150

	defm	""
	defb	153

	defm	"i"
	defb	0

	defm	"20"
	defb	6

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"20`"
	defb	3

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	"0"
	defb	9

	defm	""
	defb	3

	defm	"'"
	defb	0

	defm	"0"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	3

	defm	"("
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	6

	defm	""
	defb	19

	defm	"#'"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	182

	defm	""
	defb	3

	defm	"gw"
	defb	187

	defm	"k"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	147

	defm	")f"
	defb	151

	defm	"y"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	196

	defm	"#D"
	defb	150

	defm	"if"
	defb	150

	defm	""
	defb	150

	defm	"i"
	defb	150

	defm	""
	defb	153

	defm	"i"
	defb	153

	defm	"fii"
	defb	0

	defm	""
	defb	144

	defm	""
	defb	153

	defm	""
	defb	9

	defm	""
	defb	9

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"07"
	defb	0

	defm	"s"
	defb	0

	defm	""
	defb	3

	defm	"#"
	defb	34

	defm	"#"
	defb	144

	defm	"'##((('"
	defb	211

	defm	""
	defb	146

	defm	"(((2"
	defb	137

	defm	"`'"
	defb	130

	defm	"(3"
	defb	144

	defm	"8'"
	defb	3

	defm	""
	defb	155

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
	defb	150

	defm	""
	defb	185

	defm	"w"
	defb	203

	defm	""
	defb	203

	defm	""
	defb	203

	defm	""
	defb	203

	defm	""
	defb	201

	defm	""
	defb	155

	defm	""
	defb	185

	defm	"wwwwwww"
	defb	150

	defm	""
	defb	150

	defm	""
	defb	160

	defm	"0"
	defb	34

	defm	"0"
	defb	0

	defm	"Y"
	defb	0

	defm	""
	defb	151

	defm	""
	defb	1

	defm	""
	defb	3

	defm	""
	defb	34

	defm	"#%p0"
	defb	0

	defm	"q"
	defb	3

	defm	"3"
	defb	3

	defm	"Y"
	defb	34

	defm	"29p"
	defb	3

	defm	""
	defb	1

	defm	""
	defb	21

	defm	"h"
	defb	130

	defm	""
	defb	221

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	150

	defm	"V2"
	defb	128

	defm	"w"
	defb	1

	defm	""
	defb	3

	defm	" "
	defb	149

	defm	"b"
	defb	136

	defm	")a"
	defb	144

	defm	""
	defb	3

	defm	"0Y"
	defb	187

	defm	"ii"
	defb	144

	defm	""
	defb	3

	defm	""
	defb	0

	defm	"5"
	defb	187

	defm	"iy"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	"1Wvt"
	defb	151

	defm	""
	defb	221

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	149

	defm	"R"
	defb	34

	defm	""
	defb	4

	defm	"DDDDE"
	defb	34

	defm	""
	defb	224

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

	defm	"^0"
	defb	1

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	165

	defm	""
	defb	3

	defm	""
	defb	226

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
	defb	226

	defm	""
	defb	228

	defm	"DDDDE"
	defb	226

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
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	150

	defm	""
	defb	14

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"gwi"
	defb	151

	defm	"wwwy"
	defb	238

	defm	""
	defb	233

	defm	"f"
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
	defb	136

	defm	"DDDDD"
	defb	0

	defm	""
	defb	14

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
	defb	9

	defm	"."
	defb	171

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	171

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
	defb	226

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
	defb	16

	defm	""
	defb	224

	defm	""
	defb	224

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
	defb	34

	defm	" "
	defb	7

	defm	"wwwwwv."
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
	defb	231

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
	defb	238

	defm	""
	defb	226

	defm	""
	defb	226

	defm	""
	defb	34

	defm	"."
	defb	233

	defm	"ff"
	defb	146

	defm	""
	defb	226

	defm	".."
	defb	230

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	"wr.&"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	142

	defm	".."
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	".."
	defb	34

	defm	"9"
	defb	200

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"n>"
	defb	14

	defm	""
	defb	230

	defm	""
	defb	150

	defm	"li"
	defb	136

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	14

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

	defm	"wwwv"
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
	defb	137

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

	defm	""
	defb	152

	defm	""
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
	defb	137

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
	defb	137

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
	defb	140

	defm	""
	defb	150

	defm	""
	defb	151

	defm	"wwwwww"
	defb	153

	defm	"DDDDDDDD"
	defb	226

	defm	""
	defb	225

	defm	""
	defb	226

	defm	""
	defb	238

	defm	""
	defb	30

	defm	"..N"
	defb	0

	defm	"0"
	defb	0

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

	defm	"N"
	defb	0

	defm	"0"
	defb	0

	defm	"0"
	defb	0

	defm	"7"
	defb	4

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

	defm	""
	defb	221

	defm	""
	defb	222

	defm	"0"
	defb	0

	defm	"0"
	defb	0

	defm	"0"
	defb	14

	defm	""
	defb	234

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	208

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

	defm	"DDDDDDDDDDDDDDN"
	defb	226

	defm	""
	defb	225

	defm	"."
	defb	238

	defm	""
	defb	30

	defm	"."
	defb	238

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

	defm	"LLD"
	defb	196

	defm	"DDDDDDDN."
	defb	225

	defm	""
	defb	238

	defm	"."
	defb	30

	defm	"."
	defb	238

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
	defb	204

	defm	""
	defb	203

	defm	""
	defb	205

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	204

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	227

	defm	""
	defb	206

	defm	""
	defb	224

	defm	""
	defb	4

	defm	""
	defb	194

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	238

	defm	""
	defb	14

	defm	""
	defb	224

	defm	""
	defb	5

	defm	"L"
	defb	238

	defm	""
	defb	6

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	224

	defm	""
	defb	4

	defm	"DDDDDDDDDDDNN"
	defb	0

	defm	"N"
	defb	226

	defm	""
	defb	225

	defm	""
	defb	238

	defm	"."
	defb	224

	defm	""
	defb	222

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

	defm	">"
	defb	237

	defm	"@"
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	166

	defm	""
	defb	224

	defm	""
	defb	228

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
	defb	0

	defm	"M."
	defb	225

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	30

	defm	""
	defb	222

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

	defm	">"
	defb	224

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
	defb	224

	defm	""
	defb	13

	defm	"DDDDDDDDdDDDDI"
	defb	3

	defm	""
	defb	150

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
	defb	157

	defm	"&"
	defb	150

	defm	""
	defb	160

	defm	"2##"
	defb	166

	defm	""
	defb	3

	defm	"f"
	defb	150

	defm	""
	defb	16

	defm	""
	defb	3

	defm	"#"
	defb	166

	defm	""
	defb	144

	defm	""
	defb	137

	defm	"f"
	defb	151

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	7

	defm	""
	defb	150

	defm	""
	defb	211

	defm	"i"
	defb	150

	defm	""
	defb	144

	defm	"2:"
	defb	150

	defm	""
	defb	144

	defm	"9f"
	defb	144

	defm	"0"
	defb	10

	defm	"v"
	defb	150

	defm	""
	defb	3

	defm	""
	defb	6

	defm	""
	defb	155

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	144

	defm	""
	defb	9

	defm	""
	defb	0

	defm	"cfw{"
	defb	0

	defm	"2"
	defb	0

	defm	"9)vf"
	defb	150

	defm	"i"
	defb	150

	defm	"i"
	defb	153

	defm	"DDDC$DDI*#"
	defb	17

	defm	""
	defb	161

	defm	""
	defb	17

	defm	""
	defb	161

	defm	""
	defb	17

	defm	"ss"
	defb	9

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"g"
	defb	153

	defm	""
	defb	150

	defm	""
	defb	22

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
	defb	151

	defm	""
	defb	151

	defm	""
	defb	16

	defm	"02"
	defb	0

	defm	"#"
	defb	6

	defm	""
	defb	144

	defm	""
	defb	151

	defm	""
	defb	26

	defm	""
	defb	17

	defm	"03 "
	defb	144

	defm	"0"
	defb	153

	defm	"yz"
	defb	17

	defm	""
	defb	161

	defm	""
	defb	16

	defm	"20"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	217

	defm	""
	defb	217

	defm	""
	defb	153

	defm	"2"
	defb	130

	defm	"22"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"iif"
	defb	153

	defm	"f"
	defb	150

	defm	""
	defb	150

	defm	"DDDDDDDJ"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	161

	defm	""
	defb	17

	defm	""
	defb	153

	defm	""
	defb	3

	defm	""
	defb	151

	defm	"y"
	defb	3

	defm	""
	defb	153

	defm	"y"
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	"##0"
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	3

	defm	"#"
	defb	3

	defm	""
	defb	2

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	26

	defm	""
	defb	26

	defm	""
	defb	17

	defm	""
	defb	161

	defm	""
	defb	161

	defm	""
	defb	169

	defm	""
	defb	155

	defm	""
	defb	151

	defm	"w"
	defb	155

	defm	"wy"
	defb	150

	defm	""
	defb	15

	defm	""
	defb	182

	defm	""
	defb	153

	defm	"g"
	defb	185

	defm	"i)"
	defb	150

	defm	""
	defb	153

	defm	"h"
	defb	135

	defm	""
	defb	150

	defm	""
	defb	153

	defm	"("
	defb	34

	defm	"DDI"
	defb	144

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"Q"
	defb	161

	defm	""
	defb	21

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"2"
	defb	5

	defm	"yy"
	defb	153

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	3

	defm	"#"
	defb	153

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#  0"
	defb	26

	defm	"`"
	defb	2

	defm	"0"
	defb	3

	defm	""
	defb	0

	defm	"0"
	defb	7

	defm	"y"
	defb	17

	defm	""
	defb	26

	defm	"0"
	defb	0

	defm	"0"
	defb	161

	defm	""
	defb	153

	defm	"y"
	defb	151

	defm	""
	defb	155

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	185

	defm	"yf"
	defb	34

	defm	""
	defb	150

	defm	""
	defb	155

	defm	""
	defb	185

	defm	""
	defb	151

	defm	"vi"
	defb	152

	defm	""
	defb	130

	defm	""
	defb	150

	defm	""
	defb	157

	defm	"v"
	defb	150

	defm	"iveUQ"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	199

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	13

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
	defb	0

	defm	""
	defb	11

	defm	""
	defb	6

	defm	"wT"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	28

	defm	""
	defb	174

	defm	""
	defb	158

	defm	"p"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	28

	defm	""
	defb	218

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	217

	defm	""
	defb	160

	defm	""
	defb	0

	defm	"2 "
	defb	1

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	9

	defm	""
	defb	153

	defm	""
	defb	131

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	";"
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
	defb	187

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	137

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
	defb	11

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
	defb	133

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
	defb	11

	defm	""
	defb	0

	defm	"@"
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
	defb	128

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	186

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	4

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
	defb	0

	defm	""
	defb	12

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
	defb	0

	defm	""
	defb	0

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
	defb	11

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
	defb	0

	defm	""
	defb	128

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
	defb	187

	defm	""
	defb	184

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	171

	defm	""
	defb	186

	defm	""
	defb	187

	defm	""
	defb	171

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"fffff"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	4

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
	defb	11

	defm	""
	defb	186

	defm	""
	defb	187

	defm	""
	defb	171

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	"fffa"
	defb	17

	defm	""
	defb	22

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	133

	defm	""
	defb	132

	defm	""
	defb	133

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	186

	defm	""
	defb	187

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	"fff"
	defb	176

	defm	""
	defb	0

	defm	""
	defb	186

	defm	""
	defb	187

	defm	"gwwv"
	defb	187

	defm	""
	defb	182

	defm	"fgTUEvgwwUTUEw"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"k"
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	4

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
	defb	0

	defm	"T"
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
	defb	0

	defm	""
	defb	0

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

	defm	"DM"
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
	defb	0

	defm	"EETTEEDTC33333TS"
	defb	34

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#T#"
	defb	34

	defm	"#"
	defb	34

	defm	""
	defb	220

	defm	""
	defb	210

	defm	"%B"
	defb	34

	defm	"-"
	defb	34

	defm	"#"
	defb	211

	defm	""
	defb	34

	defm	"E"
	defb	34

	defm	""
	defb	34

	defm	"22##%B-"
	defb	34

	defm	"2#"
	defb	34

	defm	""
	defb	34

	defm	"C"
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"."
	defb	213

	defm	""
	defb	221

	defm	""
	defb	34

	defm	"#."
	defb	238

	defm	""
	defb	238

	defm	""
	defb	196

	defm	"@"
	defb	13

	defm	""
	defb	205

	defm	""
	defb	220

	defm	""
	defb	220

	defm	""
	defb	220

	defm	""
	defb	221

	defm	""
	defb	196

	defm	"EEB2-"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"33"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"B2"
	defb	34

	defm	"(,"
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

	defm	"3"
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"B"
	defb	34

	defm	""
	defb	130

	defm	""
	defb	34

	defm	""
	defb	211

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	194

	defm	"#"
	defb	34

	defm	"#("
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	205

	defm	""
	defb	192

	defm	"M"
	defb	205

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	205

	defm	""
	defb	205

	defm	"M"
	defb	0

	defm	"M"
	defb	205

	defm	""
	defb	220

	defm	""
	defb	221

	defm	"M@"
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

	defm	"H@"
	defb	0

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

	defm	"("
	defb	0

	defm	""
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
	defb	205

	defm	""
	defb	212

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	11

	defm	""
	defb	171

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	171

	defm	""
	defb	0

	defm	""
	defb	11

	defm	"fj"
	defb	187

	defm	""
	defb	171

	defm	"f`"
	defb	171

	defm	"gwffgw"
	defb	166

	defm	"gEGwwEF"
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"TTT@@"
	defb	0

	defm	""
	defb	5

	defm	"M323U"
	defb	0

	defm	""
	defb	0

	defm	"C22#$@"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#T"
	defb	0

	defm	""
	defb	0

	defm	"M"
	defb	220

	defm	""
	defb	34

	defm	""
	defb	34

	defm	",P"
	defb	0

	defm	""
	defb	5

	defm	"2"
	defb	211

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	212

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	13

	defm	""
	defb	220

	defm	""
	defb	213

	defm	"F"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	204

	defm	""
	defb	213

	defm	""
	defb	4

	defm	""
	defb	205

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
	defb	205

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"fk"
	defb	0

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

	defm	"wfj"
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"TWwff"
	defb	171

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"TTWwvff"
	defb	205

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	12

	defm	""
	defb	220

	defm	""
	defb	221

	defm	""
	defb	0

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
	defb	208

	defm	""
	defb	13

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

	defm	""
	defb	11

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
	defb	186

	defm	"`"
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
	defb	166

	defm	"g"
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"fwFv"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	231

	defm	"tU"
	defb	0

	defm	""
	defb	6

	defm	"ffffk"
	defb	0

	defm	""
	defb	11

	defm	"wwwwwk"
	defb	0

	defm	"eEUDTW`"
	defb	23

	defm	"C3333G"
	defb	0

	defm	"C#223#:"
	defb	191

	defm	"3"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"3fs"
	defb	34

	defm	"(#"
	defb	34

	defm	""
	defb	34

	defm	"'t#"
	defb	34

	defm	"2#2"
	defb	34

	defm	"C2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"ef"
	defb	238

	defm	""
	defb	238

	defm	"fffg"
	defb	0

	defm	""
	defb	183

	defm	"www"
	defb	0

	defm	""
	defb	0

	defm	"z"
	defb	182

	defm	"333133fs#"
	defb	34

	defm	"#2"
	defb	34

	defm	"'s2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	132

	defm	""
	defb	130

	defm	"3"
	defb	34

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	131

	defm	""
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	34

	defm	"2"
	defb	130

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"2"
	defb	34

	defm	"#"
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"("
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	"2"
	defb	34

	defm	"2"
	defb	34

	defm	"'n"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	"fTTETEEUCTS3333D32##23#R2"
	defb	34

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"-"
	defb	221

	defm	""
	defb	194

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

	defm	"3="
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	194

	defm	""
	defb	34

	defm	"2R"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"-"
	defb	194

	defm	""
	defb	34

	defm	"$"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&L"
	defb	205

	defm	""
	defb	34

	defm	"Ffffs"
	defb	221

	defm	"M"
	defb	197

	defm	"W"
	defb	0

	defm	""
	defb	0

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

	defm	"V"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"Tp"
	defb	0

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

	defm	"4"
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
	defb	6

	defm	""
	defb	210

	defm	"6"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"u"
	defb	34

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"tQ#`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"fT2'"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"uR"
	defb	34

	defm	""
	defb	202

	defm	""
	defb	187

	defm	""
	defb	170

	defm	""
	defb	182

	defm	"TD"
	defb	221

	defm	""
	defb	205

	defm	"ffft]"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	6

	defm	"ff"
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"wwvg"
	defb	0

	defm	""
	defb	0

	defm	"VdS4w@"
	defb	0

	defm	""
	defb	4

	defm	"wR"
	defb	34

	defm	"43"
	defb	0

	defm	""
	defb	0

	defm	"4T"
	defb	34

	defm	""
	defb	34

	defm	"23#23"
	defb	210

	defm	"-#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#-"
	defb	221

	defm	""
	defb	205

	defm	""
	defb	204

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	205

	defm	""
	defb	0

	defm	""
	defb	13

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
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	"t"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	"d"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"fgS"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"WwC"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3#0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#"
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

	defm	"m"
	defb	220

	defm	""
	defb	205

	defm	""
	defb	220

	defm	""
	defb	204

	defm	""
	defb	214

	defm	"fg"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	128

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
	defb	128

	defm	"f"
	defb	0

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
	defb	7

	defm	"v"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	"f"
	defb	0

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
	defb	176

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	186

	defm	"f"
	defb	164

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	166

	defm	"gv@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"vwEs"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"TuEE "
	defb	0

	defm	"ETT322"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	131

	defm	"3"
	defb	34

	defm	"22 "
	defb	0

	defm	""
	defb	15

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	"ff"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	214

	defm	"gw~"
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	"wEEETEEuE32C3C4ES2"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#S22#"
	defb	34

	defm	""
	defb	34

	defm	"#%2"
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	34

	defm	""
	defb	210

	defm	""
	defb	34

	defm	"B"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	34

	defm	"$"
	defb	34

	defm	""
	defb	34

	defm	"-"
	defb	194

	defm	"#"
	defb	34

	defm	",R"
	defb	34

	defm	""
	defb	34

	defm	"="
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	212

	defm	""
	defb	204

	defm	""
	defb	34

	defm	"#2"
	defb	34

	defm	""
	defb	34

	defm	"fM"
	defb	206

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	231

	defm	"v{"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"]"
	defb	208

	defm	""
	defb	0

	defm	"D`"
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

	defm	"G"
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
	defb	0

	defm	""
	defb	0

	defm	"EH"
	defb	0

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
	defb	160

	defm	"Ep"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"dT"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"fwF["
	defb	187

	defm	""
	defb	187

	defm	""
	defb	166

	defm	"gtVvfffwET"
;	SECTION	code


;	SECTION	text

._cerrojos
	defb	0
	defb	7
	defb	8
	defb	0
	defb	11
	defb	4
	defb	5
	defb	0
	defb	52
	defb	9
	defb	5
	defb	0
	defb	62
	defb	6
	defb	7
	defb	0
	defb	70
	defb	1
	defb	8
	defb	0
	defb	81
	defb	3
	defb	5
	defb	0
	defb	86
	defb	2
	defb	5
	defb	0
	defb	93
	defb	4
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
	; Sprite #0 y máscara
	; Primera columna
	._sprite_1_a
	defb 0x00, 0xFF
	defb 0x07, 0xF8
	defb 0x08, 0xF0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x60, 0x80
	defb 0x92, 0x00
	defb 0x90, 0x00
	defb 0xA0, 0x00
	defb 0x80, 0x00
	defb 0x61, 0x80
	defb 0x1D, 0xE0
	defb 0x01, 0xF8
	defb 0x03, 0xF0
	defb 0x06, 0xE0
	defb 0x0F, 0xE0
	defb 0x0F, 0xE0
	defb 0x07, 0xE0
	defb 0x03, 0xF0
	defb 0x03, 0xF0
	defb 0x06, 0xC0
	defb 0x1E, 0xC0
	defb 0x10, 0xC0
	defb 0x00, 0xC7
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_1_b
	defb 0x00, 0xFF
	defb 0xE0, 0x1F
	defb 0x18, 0x07
	defb 0x04, 0x03
	defb 0x04, 0x03
	defb 0x70, 0x07
	defb 0xD0, 0x07
	defb 0xD0, 0x07
	defb 0x60, 0x07
	defb 0x80, 0x0F
	defb 0xC0, 0x0F
	defb 0xA0, 0x07
	defb 0xB0, 0x07
	defb 0x80, 0x07
	defb 0xF0, 0x07
	defb 0x70, 0x07
	defb 0x80, 0x07
	defb 0xA0, 0x07
	defb 0xB0, 0x07
	defb 0x30, 0x03
	defb 0x18, 0x03
	defb 0x18, 0x03
	defb 0x08, 0x41
	defb 0x0C, 0x61
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #1 y máscara
	; Primera columna
	._sprite_2_a
	defb 0x07, 0xF8
	defb 0x08, 0xF0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x62, 0x80
	defb 0x90, 0x00
	defb 0x90, 0x00
	defb 0xA0, 0x00
	defb 0x80, 0x00
	defb 0x65, 0x80
	defb 0x1D, 0xE0
	defb 0x01, 0xF8
	defb 0x03, 0xF0
	defb 0x06, 0xF0
	defb 0x06, 0xF0
	defb 0x06, 0xF0
	defb 0x03, 0xF0
	defb 0x01, 0xF8
	defb 0x00, 0xFC
	defb 0x01, 0xFC
	defb 0x01, 0xFC
	defb 0x00, 0xFC
	defb 0x00, 0xFE
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_2_b
	defb 0xE0, 0x1F
	defb 0x18, 0x07
	defb 0x04, 0x03
	defb 0x04, 0x03
	defb 0x70, 0x07
	defb 0xD0, 0x07
	defb 0xD0, 0x07
	defb 0x60, 0x07
	defb 0x80, 0x0F
	defb 0xC0, 0x1F
	defb 0xA0, 0x07
	defb 0xB0, 0x07
	defb 0xB0, 0x07
	defb 0x80, 0x07
	defb 0xA0, 0x0F
	defb 0xC0, 0x0F
	defb 0xC0, 0x1F
	defb 0x00, 0x1F
	defb 0xC0, 0x1F
	defb 0xC0, 0x1F
	defb 0x80, 0x1F
	defb 0x80, 0x3F
	defb 0x80, 0x0F
	defb 0xE0, 0x0F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #2 y máscara
	; Primera columna
	._sprite_3_a
	defb 0x00, 0xFF
	defb 0x07, 0xF8
	defb 0x08, 0xF0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x60, 0x80
	defb 0x92, 0x00
	defb 0x90, 0x00
	defb 0xA0, 0x00
	defb 0x80, 0x00
	defb 0x63, 0x80
	defb 0x17, 0xE0
	defb 0x0C, 0xE0
	defb 0x0D, 0xE0
	defb 0x06, 0xE0
	defb 0x06, 0xF0
	defb 0x01, 0xF0
	defb 0x03, 0xF8
	defb 0x01, 0xF8
	defb 0x00, 0xF8
	defb 0x03, 0xE0
	defb 0x0F, 0xE0
	defb 0x08, 0xE0
	defb 0x00, 0xE3
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_3_b
	defb 0x00, 0xFF
	defb 0xE0, 0x1F
	defb 0x18, 0x07
	defb 0x04, 0x03
	defb 0x04, 0x03
	defb 0x70, 0x07
	defb 0xD0, 0x07
	defb 0xD0, 0x07
	defb 0x60, 0x07
	defb 0x80, 0x0F
	defb 0xC0, 0x0F
	defb 0x60, 0x07
	defb 0xF0, 0x07
	defb 0xB0, 0x07
	defb 0xC0, 0x07
	defb 0xC0, 0x0F
	defb 0xE0, 0x07
	defb 0xF0, 0x03
	defb 0xF8, 0x03
	defb 0x18, 0x01
	defb 0x8C, 0x01
	defb 0x0C, 0x21
	defb 0x04, 0x60
	defb 0x06, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #3 y máscara
	; Primera columna
	._sprite_4_a
	defb 0x07, 0xF8
	defb 0x08, 0xF0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x10, 0xE0
	defb 0x62, 0x80
	defb 0x90, 0x00
	defb 0x90, 0x00
	defb 0xA3, 0x00
	defb 0x87, 0x00
	defb 0x64, 0x80
	defb 0x15, 0xE0
	defb 0x06, 0xF0
	defb 0x06, 0xF0
	defb 0x01, 0xF0
	defb 0x03, 0xF8
	defb 0x03, 0xF8
	defb 0x01, 0xF0
	defb 0x06, 0xC0
	defb 0x1F, 0xC0
	defb 0x10, 0xC0
	defb 0x00, 0xC7
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_4_b
	defb 0xE0, 0x1F
	defb 0x18, 0x07
	defb 0x04, 0x03
	defb 0x04, 0x03
	defb 0x70, 0x07
	defb 0xD0, 0x07
	defb 0xD0, 0x07
	defb 0x60, 0x07
	defb 0x80, 0x0F
	defb 0xC0, 0x0F
	defb 0x60, 0x07
	defb 0xF0, 0x07
	defb 0xB0, 0x07
	defb 0xC0, 0x0F
	defb 0xE0, 0x07
	defb 0xF8, 0x03
	defb 0xF8, 0x01
	defb 0xEC, 0x01
	defb 0x0C, 0x01
	defb 0x0C, 0x61
	defb 0x04, 0xE0
	defb 0x06, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #4 y máscara
	; Primera columna
	._sprite_5_a
	defb 0x00, 0xFF
	defb 0x07, 0xF8
	defb 0x18, 0xE0
	defb 0x20, 0xC0
	defb 0x20, 0xC0
	defb 0x0E, 0xE0
	defb 0x0B, 0xE0
	defb 0x0B, 0xE0
	defb 0x06, 0xE0
	defb 0x01, 0xF0
	defb 0x03, 0xF0
	defb 0x06, 0xE0
	defb 0x0F, 0xE0
	defb 0x0D, 0xE0
	defb 0x03, 0xE0
	defb 0x03, 0xF0
	defb 0x07, 0xE0
	defb 0x0F, 0xC0
	defb 0x1F, 0xC0
	defb 0x18, 0x80
	defb 0x31, 0x80
	defb 0x30, 0x84
	defb 0x20, 0x06
	defb 0x60, 0x0F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_5_b
	defb 0x00, 0xFF
	defb 0xE0, 0x1F
	defb 0x10, 0x0F
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x06, 0x01
	defb 0x49, 0x00
	defb 0x09, 0x00
	defb 0x05, 0x00
	defb 0x01, 0x00
	defb 0xC6, 0x01
	defb 0xE8, 0x07
	defb 0x30, 0x07
	defb 0xB0, 0x07
	defb 0x60, 0x07
	defb 0x60, 0x0F
	defb 0x80, 0x0F
	defb 0xC0, 0x1F
	defb 0x80, 0x1F
	defb 0x00, 0x1F
	defb 0xC0, 0x07
	defb 0xF0, 0x07
	defb 0x10, 0x07
	defb 0x00, 0xC7
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #5 y máscara
	; Primera columna
	._sprite_6_a
	defb 0x07, 0xF8
	defb 0x18, 0xE0
	defb 0x20, 0xC0
	defb 0x20, 0xC0
	defb 0x0E, 0xE0
	defb 0x0B, 0xE0
	defb 0x0B, 0xE0
	defb 0x06, 0xE0
	defb 0x01, 0xF0
	defb 0x03, 0xF8
	defb 0x05, 0xE0
	defb 0x0D, 0xE0
	defb 0x0D, 0xE0
	defb 0x01, 0xE0
	defb 0x05, 0xF0
	defb 0x03, 0xF0
	defb 0x03, 0xF8
	defb 0x00, 0xF8
	defb 0x03, 0xF8
	defb 0x03, 0xF8
	defb 0x01, 0xF8
	defb 0x01, 0xFC
	defb 0x01, 0xF0
	defb 0x07, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_6_b
	defb 0xE0, 0x1F
	defb 0x10, 0x0F
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x46, 0x01
	defb 0x09, 0x00
	defb 0x09, 0x00
	defb 0x05, 0x00
	defb 0x01, 0x00
	defb 0xA6, 0x01
	defb 0xB8, 0x07
	defb 0x80, 0x1F
	defb 0xC0, 0x0F
	defb 0x60, 0x0F
	defb 0x60, 0x0F
	defb 0x60, 0x0F
	defb 0xC0, 0x0F
	defb 0x80, 0x1F
	defb 0x00, 0x3F
	defb 0x80, 0x3F
	defb 0x80, 0x3F
	defb 0x00, 0x3F
	defb 0x00, 0x7F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #6 y máscara
	; Primera columna
	._sprite_7_a
	defb 0x00, 0xFF
	defb 0x07, 0xF8
	defb 0x18, 0xE0
	defb 0x20, 0xC0
	defb 0x20, 0xC0
	defb 0x0E, 0xE0
	defb 0x0B, 0xE0
	defb 0x0B, 0xE0
	defb 0x06, 0xE0
	defb 0x01, 0xF0
	defb 0x03, 0xF0
	defb 0x05, 0xE0
	defb 0x0D, 0xE0
	defb 0x01, 0xE0
	defb 0x0F, 0xE0
	defb 0x0E, 0xE0
	defb 0x01, 0xE0
	defb 0x05, 0xE0
	defb 0x0D, 0xE0
	defb 0x0C, 0xC0
	defb 0x18, 0xC0
	defb 0x18, 0xC0
	defb 0x10, 0x82
	defb 0x30, 0x86
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_7_b
	defb 0x00, 0xFF
	defb 0xE0, 0x1F
	defb 0x10, 0x0F
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x06, 0x01
	defb 0x49, 0x00
	defb 0x09, 0x00
	defb 0x05, 0x00
	defb 0x01, 0x00
	defb 0x86, 0x01
	defb 0xB8, 0x07
	defb 0x80, 0x1F
	defb 0xC0, 0x0F
	defb 0x60, 0x07
	defb 0xF0, 0x07
	defb 0xF0, 0x07
	defb 0xE0, 0x07
	defb 0xC0, 0x0F
	defb 0xC0, 0x0F
	defb 0x60, 0x03
	defb 0x78, 0x03
	defb 0x08, 0x03
	defb 0x00, 0xE3
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #7 y máscara
	; Primera columna
	._sprite_8_a
	defb 0x07, 0xF8
	defb 0x18, 0xE0
	defb 0x20, 0xC0
	defb 0x20, 0xC0
	defb 0x0E, 0xE0
	defb 0x0B, 0xE0
	defb 0x0B, 0xE0
	defb 0x06, 0xE0
	defb 0x01, 0xF0
	defb 0x03, 0xF0
	defb 0x06, 0xE0
	defb 0x0F, 0xE0
	defb 0x0D, 0xE0
	defb 0x03, 0xF0
	defb 0x07, 0xE0
	defb 0x1F, 0xC0
	defb 0x1F, 0x80
	defb 0x37, 0x80
	defb 0x30, 0x80
	defb 0x30, 0x86
	defb 0x20, 0x07
	defb 0x60, 0x0F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_8_b
	defb 0xE0, 0x1F
	defb 0x10, 0x0F
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x08, 0x07
	defb 0x46, 0x01
	defb 0x09, 0x00
	defb 0x09, 0x00
	defb 0xC5, 0x00
	defb 0xE1, 0x00
	defb 0x26, 0x01
	defb 0xA8, 0x07
	defb 0x60, 0x0F
	defb 0x60, 0x0F
	defb 0x80, 0x0F
	defb 0xC0, 0x1F
	defb 0xC0, 0x1F
	defb 0x80, 0x0F
	defb 0x60, 0x03
	defb 0xF8, 0x03
	defb 0x08, 0x03
	defb 0x00, 0xE3
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #8 y máscara
	; Primera columna
	._sprite_9_a
	defb 0x01, 0xF8
	defb 0x03, 0x18
	defb 0x42, 0x08
	defb 0xA2, 0x00
	defb 0x22, 0x00
	defb 0x23, 0x00
	defb 0x1B, 0x80
	defb 0x01, 0xC0
	defb 0x00, 0xF8
	defb 0x01, 0xF8
	defb 0x00, 0xF8
	defb 0x01, 0xE0
	defb 0x0C, 0xC0
	defb 0x13, 0xC0
	defb 0x10, 0x00
	defb 0x70, 0x07
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_9_b
	defb 0x80, 0x1F
	defb 0xC0, 0x08
	defb 0xA3, 0x00
	defb 0xA5, 0x00
	defb 0xA4, 0x00
	defb 0xE5, 0x00
	defb 0x68, 0x00
	defb 0x20, 0x03
	defb 0x00, 0x07
	defb 0xF0, 0x00
	defb 0x46, 0x00
	defb 0xEA, 0x00
	defb 0x52, 0x00
	defb 0xE3, 0x00
	defb 0x00, 0x08
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #9 y máscara
	; Primera columna
	._sprite_10_a
	defb 0x01, 0xF8
	defb 0x03, 0x10
	defb 0xC5, 0x00
	defb 0xA5, 0x00
	defb 0x25, 0x00
	defb 0xA7, 0x00
	defb 0x16, 0x00
	defb 0x04, 0xC0
	defb 0x00, 0xE0
	defb 0x0F, 0x00
	defb 0x62, 0x00
	defb 0x57, 0x00
	defb 0x4A, 0x00
	defb 0xC7, 0x00
	defb 0x00, 0x10
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_10_b
	defb 0x80, 0x1F
	defb 0xC0, 0x18
	defb 0x42, 0x10
	defb 0x45, 0x00
	defb 0x44, 0x00
	defb 0xC4, 0x00
	defb 0xD8, 0x01
	defb 0x80, 0x03
	defb 0x00, 0x1F
	defb 0x80, 0x1F
	defb 0x00, 0x1F
	defb 0x80, 0x07
	defb 0x30, 0x03
	defb 0xC8, 0x03
	defb 0x08, 0x00
	defb 0x0E, 0xE0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #10 y máscara
	; Primera columna
	._sprite_11_a
	defb 0x02, 0xFC
	defb 0x34, 0xC8
	defb 0x48, 0x80
	defb 0x8B, 0x00
	defb 0x85, 0x00
	defb 0x85, 0x00
	defb 0x87, 0x00
	defb 0x83, 0x00
	defb 0x80, 0x00
	defb 0x8C, 0x00
	defb 0x8C, 0x00
	defb 0x83, 0x00
	defb 0x4A, 0x80
	defb 0x50, 0x80
	defb 0x22, 0xD8
	defb 0x06, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_11_b
	defb 0xA0, 0x1F
	defb 0x1C, 0x03
	defb 0x52, 0x01
	defb 0xD1, 0x00
	defb 0x41, 0x00
	defb 0x41, 0x00
	defb 0xC1, 0x00
	defb 0x81, 0x00
	defb 0x01, 0x00
	defb 0x31, 0x00
	defb 0x31, 0x00
	defb 0xC1, 0x00
	defb 0x52, 0x01
	defb 0x0A, 0x01
	defb 0x44, 0x0B
	defb 0x60, 0x0F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #11 y máscara
	; Primera columna
	._sprite_12_a
	defb 0x00, 0xFF
	defb 0x05, 0xF8
	defb 0x38, 0xC0
	defb 0x4A, 0x80
	defb 0x83, 0x00
	defb 0x82, 0x00
	defb 0x82, 0x00
	defb 0x83, 0x00
	defb 0x81, 0x00
	defb 0x98, 0x00
	defb 0x98, 0x00
	defb 0x80, 0x00
	defb 0x87, 0x00
	defb 0x44, 0x80
	defb 0x50, 0x81
	defb 0x2C, 0xD1
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_12_b
	defb 0x00, 0xFF
	defb 0x40, 0x3F
	defb 0x2C, 0x13
	defb 0x12, 0x01
	defb 0xC1, 0x00
	defb 0xA1, 0x00
	defb 0xA1, 0x00
	defb 0xE1, 0x00
	defb 0xC1, 0x00
	defb 0x19, 0x00
	defb 0x19, 0x00
	defb 0x01, 0x00
	defb 0xE1, 0x00
	defb 0x22, 0x01
	defb 0x0A, 0x81
	defb 0x34, 0x8B
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #12 y máscara
	; Primera columna
	._sprite_13_a
	defb 0x00, 0xFF
	defb 0x0F, 0xC0
	defb 0x19, 0x80
	defb 0x36, 0x80
	defb 0x33, 0x80
	defb 0x36, 0x80
	defb 0x19, 0x80
	defb 0x0F, 0xC0
	defb 0x00, 0x80
	defb 0x35, 0x00
	defb 0x4D, 0x00
	defb 0x41, 0x00
	defb 0x21, 0x08
	defb 0x02, 0x80
	defb 0x04, 0xF0
	defb 0x02, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_13_b
	defb 0x00, 0xFF
	defb 0xF0, 0x03
	defb 0x38, 0x01
	defb 0xDC, 0x01
	defb 0x5C, 0x01
	defb 0xD8, 0x01
	defb 0x38, 0x01
	defb 0xF0, 0x03
	defb 0x00, 0x01
	defb 0x48, 0x01
	defb 0x24, 0x01
	defb 0x24, 0x01
	defb 0x18, 0x01
	defb 0x00, 0x43
	defb 0x00, 0x7F
	defb 0x00, 0x7F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #13 y máscara
	; Primera columna
	._sprite_14_a
	defb 0x0F, 0xC0
	defb 0x19, 0x80
	defb 0x36, 0x80
	defb 0x35, 0x80
	defb 0x36, 0x80
	defb 0x19, 0x80
	defb 0x0F, 0xC0
	defb 0x00, 0xC0
	defb 0x05, 0xE0
	defb 0x09, 0xE0
	defb 0x09, 0xE0
	defb 0x09, 0xE0
	defb 0x05, 0xE0
	defb 0x05, 0xE0
	defb 0x09, 0xE0
	defb 0x00, 0xF0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_14_b
	defb 0xF0, 0x03
	defb 0x38, 0x01
	defb 0xDC, 0x01
	defb 0x9C, 0x01
	defb 0xD8, 0x01
	defb 0x38, 0x01
	defb 0xF0, 0x03
	defb 0x00, 0x07
	defb 0x40, 0x0F
	defb 0x20, 0x0F
	defb 0x20, 0x0F
	defb 0x40, 0x0F
	defb 0x40, 0x0F
	defb 0x40, 0x0F
	defb 0x20, 0x0F
	defb 0x00, 0x1F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #14 y máscara
	; Primera columna
	._sprite_15_a
	defb 0xFF, 0x00
	defb 0xFF, 0x00
	defb 0xAA, 0x00
	defb 0x00, 0x00
	defb 0x07, 0xE0
	defb 0x07, 0xE0
	defb 0x00, 0xF0
	defb 0x03, 0xF0
	defb 0x03, 0xF0
	defb 0x00, 0xE0
	defb 0x03, 0xE0
	defb 0x04, 0xE0
	defb 0x04, 0xE0
	defb 0x02, 0xE0
	defb 0x01, 0xF0
	defb 0x00, 0xF8
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_15_b
	defb 0xFF, 0x00
	defb 0xFF, 0x00
	defb 0xAB, 0x00
	defb 0x00, 0x00
	defb 0xE0, 0x07
	defb 0xE0, 0x07
	defb 0x00, 0x0F
	defb 0xC0, 0x0F
	defb 0xC0, 0x0F
	defb 0x00, 0x07
	defb 0xC0, 0x07
	defb 0x20, 0x07
	defb 0x20, 0x07
	defb 0x40, 0x07
	defb 0x00, 0x0F
	defb 0x00, 0x1F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #15 y máscara
	; Primera columna
	._sprite_16_a
	defb 0xFF, 0x00
	defb 0xFF, 0x00
	defb 0xAA, 0x00
	defb 0x00, 0x00
	defb 0x07, 0xE0
	defb 0x07, 0xE0
	defb 0x00, 0xF0
	defb 0x03, 0xF0
	defb 0x03, 0xF0
	defb 0x00, 0xF0
	defb 0x01, 0xF8
	defb 0x01, 0xF8
	defb 0x00, 0xF8
	defb 0x00, 0xFC
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._sprite_16_b
	defb 0xFF, 0x00
	defb 0xFF, 0x00
	defb 0xAB, 0x00
	defb 0x00, 0x00
	defb 0xE0, 0x07
	defb 0xE0, 0x07
	defb 0x00, 0x0F
	defb 0xC0, 0x0F
	defb 0xC0, 0x0F
	defb 0x00, 0x0F
	defb 0x80, 0x1F
	defb 0x00, 0x1F
	defb 0x80, 0x1F
	defb 0x00, 0x3F
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #16 y máscara
	; Primera columna
	._extra_sprite_17_a
	defb 0x05, 0xE0
	defb 0x17, 0xC0
	defb 0x1F, 0x80
	defb 0x3F, 0x00
	defb 0x7C, 0x00
	defb 0x79, 0x00
	defb 0xF2, 0x00
	defb 0x74, 0x01
	defb 0xF4, 0x01
	defb 0x72, 0x00
	defb 0xF9, 0x00
	defb 0x3C, 0x00
	defb 0x5F, 0x00
	defb 0x1F, 0x80
	defb 0x0B, 0xC0
	defb 0x02, 0xE0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._extra_sprite_17_b
	defb 0x40, 0x07
	defb 0xF0, 0x03
	defb 0xF8, 0x01
	defb 0xFE, 0x00
	defb 0x3C, 0x00
	defb 0x9F, 0x00
	defb 0x4E, 0x00
	defb 0x2F, 0x80
	defb 0x2E, 0x80
	defb 0x4F, 0x00
	defb 0x9E, 0x00
	defb 0x3E, 0x00
	defb 0xFC, 0x00
	defb 0xF8, 0x01
	defb 0xE8, 0x03
	defb 0xA0, 0x07
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Sprite #17 y máscara
	; Primera columna
	._extra_sprite_18_a
	defb 0x03, 0xFC
	defb 0x0C, 0xF0
	defb 0x14, 0xE8
	defb 0x07, 0xF8
	defb 0x08, 0xF0
	defb 0x10, 0xE0
	defb 0x1C, 0xE0
	defb 0x32, 0xC0
	defb 0x40, 0x80
	defb 0x42, 0x80
	defb 0x22, 0xC0
	defb 0x7D, 0x80
	defb 0x80, 0x00
	defb 0x80, 0x00
	defb 0x40, 0x80
	defb 0x3F, 0xC0
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	; Segunda columna
	._extra_sprite_18_b
	defb 0x80, 0x7F
	defb 0x40, 0x3F
	defb 0x20, 0x1F
	defb 0x20, 0x1F
	defb 0x10, 0x0F
	defb 0x08, 0x07
	defb 0x38, 0x07
	defb 0x4C, 0x03
	defb 0x02, 0x01
	defb 0x42, 0x01
	defb 0x44, 0x03
	defb 0xBE, 0x01
	defb 0x01, 0x00
	defb 0x01, 0x00
	defb 0x02, 0x01
	defb 0xFC, 0x03
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
	defb 0x00, 0xFF
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
	defb	208
	defb	80
	defb	128
	defb	80
	defb	208
	defb	80
	defb	-2
	defb	0
	defb	3
	defb	96
	defb	128
	defb	96
	defb	32
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	1
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	1
	defb	0
	defb	2
	defb	128
	defb	80
	defb	16
	defb	80
	defb	128
	defb	80
	defb	-2
	defb	0
	defb	3
	defb	32
	defb	128
	defb	32
	defb	128
	defb	96
	defb	128
	defb	1
	defb	0
	defb	2
	defb	160
	defb	112
	defb	160
	defb	32
	defb	160
	defb	112
	defb	0
	defb	-1
	defb	0
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	128
	defb	-2
	defb	0
	defb	3
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	96
	defb	0
	defb	2
	defb	1
	defb	80
	defb	64
	defb	80
	defb	64
	defb	112
	defb	80
	defb	1
	defb	1
	defb	2
	defb	48
	defb	80
	defb	48
	defb	32
	defb	48
	defb	80
	defb	0
	defb	-2
	defb	3
	defb	176
	defb	80
	defb	128
	defb	80
	defb	176
	defb	80
	defb	-1
	defb	0
	defb	2
	defb	208
	defb	96
	defb	112
	defb	96
	defb	208
	defb	96
	defb	-1
	defb	0
	defb	0
	defb	112
	defb	112
	defb	96
	defb	112
	defb	112
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	80
	defb	128
	defb	80
	defb	144
	defb	80
	defb	2
	defb	0
	defb	1
	defb	176
	defb	48
	defb	160
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	80
	defb	64
	defb	80
	defb	80
	defb	80
	defb	1
	defb	0
	defb	2
	defb	160
	defb	48
	defb	160
	defb	48
	defb	160
	defb	96
	defb	0
	defb	1
	defb	3
	defb	32
	defb	96
	defb	32
	defb	48
	defb	32
	defb	96
	defb	0
	defb	-2
	defb	0
	defb	80
	defb	48
	defb	80
	defb	48
	defb	80
	defb	96
	defb	0
	defb	1
	defb	2
	defb	112
	defb	96
	defb	112
	defb	48
	defb	112
	defb	96
	defb	0
	defb	-2
	defb	3
	defb	144
	defb	80
	defb	144
	defb	80
	defb	160
	defb	80
	defb	1
	defb	0
	defb	1
	defb	144
	defb	80
	defb	112
	defb	80
	defb	144
	defb	80
	defb	-2
	defb	0
	defb	2
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	80
	defb	0
	defb	2
	defb	3
	defb	32
	defb	128
	defb	32
	defb	128
	defb	144
	defb	128
	defb	2
	defb	0
	defb	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	192
	defb	128
	defb	2
	defb	0
	defb	4
	defb	64
	defb	64
	defb	64
	defb	64
	defb	208
	defb	64
	defb	1
	defb	0
	defb	2
	defb	192
	defb	48
	defb	80
	defb	32
	defb	192
	defb	48
	defb	-1
	defb	-1
	defb	3
	defb	16
	defb	64
	defb	16
	defb	64
	defb	192
	defb	64
	defb	2
	defb	0
	defb	4
	defb	32
	defb	128
	defb	32
	defb	128
	defb	176
	defb	128
	defb	2
	defb	0
	defb	2
	defb	32
	defb	32
	defb	32
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	3
	defb	64
	defb	144
	defb	64
	defb	144
	defb	64
	defb	128
	defb	0
	defb	0
	defb	5
	defb	112
	defb	80
	defb	32
	defb	80
	defb	112
	defb	96
	defb	-2
	defb	2
	defb	3
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	64
	defb	0
	defb	1
	defb	1
	defb	112
	defb	32
	defb	80
	defb	32
	defb	112
	defb	32
	defb	-1
	defb	0
	defb	1
	defb	176
	defb	80
	defb	176
	defb	80
	defb	208
	defb	80
	defb	1
	defb	0
	defb	2
	defb	96
	defb	64
	defb	96
	defb	64
	defb	96
	defb	112
	defb	0
	defb	1
	defb	3
	defb	96
	defb	48
	defb	96
	defb	48
	defb	192
	defb	48
	defb	2
	defb	0
	defb	2
	defb	48
	defb	32
	defb	16
	defb	32
	defb	48
	defb	32
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	48
	defb	16
	defb	48
	defb	64
	defb	112
	defb	-2
	defb	2
	defb	0
	defb	64
	defb	80
	defb	64
	defb	80
	defb	128
	defb	80
	defb	2
	defb	0
	defb	2
	defb	128
	defb	128
	defb	48
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	32
	defb	16
	defb	32
	defb	64
	defb	32
	defb	-1
	defb	0
	defb	1
	defb	32
	defb	32
	defb	32
	defb	32
	defb	80
	defb	32
	defb	2
	defb	0
	defb	3
	defb	208
	defb	128
	defb	96
	defb	128
	defb	208
	defb	128
	defb	-2
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
	defb	0
	defb	144
	defb	64
	defb	32
	defb	64
	defb	144
	defb	64
	defb	-2
	defb	0
	defb	1
	defb	192
	defb	96
	defb	192
	defb	32
	defb	192
	defb	96
	defb	0
	defb	-1
	defb	2
	defb	160
	defb	128
	defb	96
	defb	128
	defb	160
	defb	128
	defb	-2
	defb	0
	defb	3
	defb	112
	defb	80
	defb	112
	defb	80
	defb	176
	defb	80
	defb	1
	defb	0
	defb	2
	defb	208
	defb	48
	defb	144
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	48
	defb	64
	defb	48
	defb	80
	defb	48
	defb	1
	defb	0
	defb	3
	defb	144
	defb	128
	defb	112
	defb	128
	defb	144
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	176
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	-1
	defb	0
	defb	4
	defb	80
	defb	128
	defb	80
	defb	48
	defb	80
	defb	128
	defb	0
	defb	-2
	defb	2
	defb	176
	defb	48
	defb	64
	defb	48
	defb	176
	defb	48
	defb	-2
	defb	0
	defb	4
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	112
	defb	0
	defb	2
	defb	2
	defb	160
	defb	128
	defb	80
	defb	128
	defb	160
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	48
	defb	48
	defb	48
	defb	128
	defb	48
	defb	-2
	defb	0
	defb	4
	defb	112
	defb	128
	defb	64
	defb	128
	defb	112
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
	defb	208
	defb	48
	defb	208
	defb	48
	defb	208
	defb	80
	defb	0
	defb	1
	defb	1
	defb	128
	defb	128
	defb	80
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	160
	defb	64
	defb	160
	defb	64
	defb	160
	defb	128
	defb	0
	defb	2
	defb	3
	defb	112
	defb	128
	defb	112
	defb	128
	defb	176
	defb	128
	defb	1
	defb	0
	defb	3
	defb	80
	defb	128
	defb	16
	defb	128
	defb	80
	defb	128
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
	defb	176
	defb	80
	defb	176
	defb	80
	defb	208
	defb	80
	defb	1
	defb	0
	defb	2
	defb	128
	defb	32
	defb	128
	defb	32
	defb	208
	defb	64
	defb	2
	defb	2
	defb	3
	defb	112
	defb	96
	defb	64
	defb	96
	defb	112
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	32
	defb	208
	defb	32
	defb	208
	defb	128
	defb	0
	defb	2
	defb	4
	defb	64
	defb	112
	defb	64
	defb	112
	defb	192
	defb	112
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
	defb	80
	defb	96
	defb	80
	defb	16
	defb	80
	defb	96
	defb	0
	defb	-1
	defb	0
	defb	128
	defb	80
	defb	128
	defb	80
	defb	192
	defb	80
	defb	1
	defb	0
	defb	2
	defb	144
	defb	128
	defb	144
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	3
	defb	112
	defb	128
	defb	48
	defb	128
	defb	112
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	80
	defb	32
	defb	80
	defb	64
	defb	80
	defb	1
	defb	0
	defb	1
	defb	112
	defb	16
	defb	112
	defb	16
	defb	112
	defb	128
	defb	0
	defb	2
	defb	3
	defb	208
	defb	128
	defb	176
	defb	96
	defb	208
	defb	128
	defb	-1
	defb	-1
	defb	3
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	48
	defb	0
	defb	1
	defb	2
	defb	32
	defb	128
	defb	32
	defb	64
	defb	32
	defb	128
	defb	0
	defb	-2
	defb	3
	defb	128
	defb	48
	defb	96
	defb	48
	defb	128
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	192
	defb	80
	defb	192
	defb	32
	defb	192
	defb	80
	defb	0
	defb	-1
	defb	3
	defb	208
	defb	112
	defb	64
	defb	112
	defb	208
	defb	112
	defb	-2
	defb	0
	defb	4
	defb	96
	defb	112
	defb	96
	defb	112
	defb	128
	defb	112
	defb	1
	defb	0
	defb	2
	defb	128
	defb	64
	defb	96
	defb	64
	defb	128
	defb	64
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
	defb	112
	defb	80
	defb	112
	defb	80
	defb	112
	defb	128
	defb	0
	defb	2
	defb	1
	defb	208
	defb	48
	defb	208
	defb	48
	defb	208
	defb	112
	defb	0
	defb	2
	defb	2
	defb	160
	defb	64
	defb	160
	defb	64
	defb	160
	defb	128
	defb	0
	defb	2
	defb	3
	defb	80
	defb	96
	defb	80
	defb	96
	defb	176
	defb	96
	defb	2
	defb	0
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	64
	defb	0
	defb	2
	defb	1
	defb	192
	defb	32
	defb	192
	defb	32
	defb	192
	defb	96
	defb	0
	defb	2
	defb	2
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	64
	defb	0
	defb	2
	defb	2
	defb	144
	defb	96
	defb	144
	defb	96
	defb	208
	defb	96
	defb	2
	defb	0
	defb	1
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	80
	defb	0
	defb	1
	defb	1
	defb	80
	defb	64
	defb	16
	defb	64
	defb	80
	defb	64
	defb	-2
	defb	0
	defb	3
	defb	112
	defb	128
	defb	112
	defb	128
	defb	160
	defb	128
	defb	2
	defb	0
	defb	2
	defb	96
	defb	48
	defb	96
	defb	48
	defb	96
	defb	112
	defb	0
	defb	2
	defb	1
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	112
	defb	0
	defb	2
	defb	2
	defb	80
	defb	48
	defb	80
	defb	48
	defb	80
	defb	112
	defb	0
	defb	1
	defb	3
	defb	64
	defb	128
	defb	48
	defb	128
	defb	64
	defb	128
	defb	-2
	defb	0
	defb	1
	defb	48
	defb	64
	defb	48
	defb	64
	defb	192
	defb	64
	defb	2
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
	defb	16
	defb	80
	defb	16
	defb	80
	defb	160
	defb	80
	defb	2
	defb	0
	defb	4
	defb	144
	defb	16
	defb	144
	defb	16
	defb	144
	defb	112
	defb	0
	defb	2
	defb	3
	defb	208
	defb	80
	defb	176
	defb	80
	defb	208
	defb	80
	defb	-1
	defb	0
	defb	1
	defb	144
	defb	128
	defb	80
	defb	128
	defb	144
	defb	128
	defb	-2
	defb	0
	defb	2
	defb	128
	defb	64
	defb	128
	defb	64
	defb	176
	defb	80
	defb	1
	defb	1
	defb	3
	defb	128
	defb	16
	defb	128
	defb	16
	defb	208
	defb	16
	defb	1
	defb	0
	defb	0
	defb	96
	defb	128
	defb	32
	defb	128
	defb	96
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	112
	defb	48
	defb	48
	defb	48
	defb	112
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	160
	defb	128
	defb	160
	defb	128
	defb	192
	defb	128
	defb	1
	defb	0
	defb	1
	defb	192
	defb	112
	defb	192
	defb	16
	defb	192
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	32
	defb	32
	defb	32
	defb	32
	defb	160
	defb	32
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
	defb	4
	defb	32
	defb	64
	defb	32
	defb	64
	defb	192
	defb	64
	defb	2
	defb	0
	defb	4
	defb	176
	defb	128
	defb	112
	defb	128
	defb	176
	defb	128
	defb	-2
	defb	0
	defb	3
	defb	64
	defb	48
	defb	64
	defb	48
	defb	160
	defb	48
	defb	1
	defb	0
	defb	2
	defb	64
	defb	128
	defb	64
	defb	128
	defb	80
	defb	128
	defb	1
	defb	0
	defb	1
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	2
	defb	0
	defb	2
	defb	96
	defb	32
	defb	96
	defb	32
	defb	96
	defb	112
	defb	0
	defb	2
	defb	3
	defb	32
	defb	80
	defb	32
	defb	80
	defb	64
	defb	80
	defb	1
	defb	0
	defb	2
	defb	192
	defb	80
	defb	128
	defb	80
	defb	192
	defb	80
	defb	-1
	defb	0
	defb	3
	defb	192
	defb	32
	defb	112
	defb	32
	defb	192
	defb	32
	defb	-2
	defb	0
	defb	1
	defb	144
	defb	96
	defb	144
	defb	96
	defb	208
	defb	96
	defb	2
	defb	0
	defb	4
	defb	208
	defb	64
	defb	144
	defb	64
	defb	208
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	32
	defb	32
	defb	32
	defb	48
	defb	32
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	80
	defb	48
	defb	80
	defb	208
	defb	80
	defb	2
	defb	0
	defb	4
	defb	16
	defb	48
	defb	16
	defb	48
	defb	64
	defb	48
	defb	2
	defb	0
	defb	2
	defb	96
	defb	112
	defb	96
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	3
	defb	208
	defb	128
	defb	208
	defb	64
	defb	208
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	96
	defb	128
	defb	96
	defb	128
	defb	176
	defb	128
	defb	2
	defb	0
	defb	2
	defb	96
	defb	48
	defb	96
	defb	48
	defb	128
	defb	96
	defb	2
	defb	2
	defb	3
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	80
	defb	0
	defb	2
	defb	1
	defb	144
	defb	96
	defb	144
	defb	96
	defb	208
	defb	96
	defb	2
	defb	0
	defb	2
	defb	64
	defb	48
	defb	64
	defb	48
	defb	112
	defb	64
	defb	1
	defb	1
	defb	3
	defb	176
	defb	48
	defb	176
	defb	48
	defb	192
	defb	48
	defb	1
	defb	0
	defb	1
	defb	128
	defb	48
	defb	128
	defb	48
	defb	160
	defb	64
	defb	1
	defb	1
	defb	2
	defb	32
	defb	64
	defb	32
	defb	64
	defb	32
	defb	112
	defb	0
	defb	1
	defb	3
	defb	112
	defb	48
	defb	112
	defb	48
	defb	192
	defb	48
	defb	2
	defb	0
	defb	2
	defb	192
	defb	128
	defb	112
	defb	128
	defb	192
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	208
	defb	128
	defb	208
	defb	16
	defb	208
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	80
	defb	16
	defb	64
	defb	16
	defb	80
	defb	96
	defb	-2
	defb	2
	defb	1
	defb	16
	defb	128
	defb	16
	defb	128
	defb	128
	defb	128
	defb	2
	defb	0
	defb	2
	defb	48
	defb	48
	defb	16
	defb	48
	defb	48
	defb	48
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	48
	defb	64
	defb	48
	defb	64
	defb	112
	defb	0
	defb	2
	defb	2
	defb	128
	defb	32
	defb	112
	defb	32
	defb	128
	defb	112
	defb	-2
	defb	2
	defb	2
	defb	176
	defb	32
	defb	144
	defb	32
	defb	176
	defb	32
	defb	-1
	defb	0
	defb	3
	defb	96
	defb	32
	defb	96
	defb	32
	defb	160
	defb	32
	defb	2
	defb	0
	defb	2
	defb	32
	defb	80
	defb	32
	defb	80
	defb	192
	defb	112
	defb	1
	defb	1
	defb	2
	defb	32
	defb	112
	defb	32
	defb	112
	defb	208
	defb	128
	defb	1
	defb	1
	defb	0
	defb	80
	defb	128
	defb	48
	defb	128
	defb	80
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	16
	defb	32
	defb	16
	defb	32
	defb	48
	defb	32
	defb	1
	defb	0
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	2
	defb	0
	defb	1
	defb	64
	defb	64
	defb	32
	defb	64
	defb	64
	defb	64
	defb	-2
	defb	0
	defb	3
	defb	144
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	-2
	defb	0
	defb	2
	defb	144
	defb	64
	defb	144
	defb	64
	defb	208
	defb	64
	defb	1
	defb	0
	defb	1
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	128
	defb	-2
	defb	0
	defb	3
	defb	64
	defb	48
	defb	64
	defb	48
	defb	160
	defb	48
	defb	2
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
	defb	176
	defb	80
	defb	176
	defb	80
	defb	208
	defb	80
	defb	1
	defb	0
	defb	1
	defb	96
	defb	64
	defb	80
	defb	64
	defb	96
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	64
	defb	128
	defb	32
	defb	128
	defb	64
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	16
	defb	128
	defb	16
	defb	128
	defb	96
	defb	128
	defb	2
	defb	0
	defb	2
	defb	112
	defb	128
	defb	112
	defb	128
	defb	160
	defb	128
	defb	1
	defb	0
	defb	3
	defb	112
	defb	48
	defb	112
	defb	48
	defb	112
	defb	96
	defb	0
	defb	1
	defb	1
	defb	16
	defb	96
	defb	16
	defb	96
	defb	80
	defb	96
	defb	1
	defb	0
	defb	2
	defb	160
	defb	96
	defb	160
	defb	96
	defb	208
	defb	96
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
	defb	144
	defb	112
	defb	144
	defb	112
	defb	144
	defb	96
	defb	0
	defb	0
	defb	5
	defb	96
	defb	32
	defb	96
	defb	32
	defb	96
	defb	80
	defb	0
	defb	1
	defb	3
	defb	80
	defb	96
	defb	32
	defb	96
	defb	80
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	64
	defb	96
	defb	48
	defb	96
	defb	64
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	64
	defb	48
	defb	64
	defb	48
	defb	80
	defb	48
	defb	1
	defb	0
	defb	2
	defb	112
	defb	80
	defb	112
	defb	80
	defb	192
	defb	80
	defb	2
	defb	0
	defb	3
	defb	192
	defb	48
	defb	96
	defb	48
	defb	192
	defb	48
	defb	-2
	defb	0
	defb	1
	defb	64
	defb	112
	defb	64
	defb	16
	defb	64
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	160
	defb	112
	defb	96
	defb	112
	defb	160
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	16
	defb	32
	defb	16
	defb	128
	defb	48
	defb	-1
	defb	1
	defb	3
	defb	160
	defb	96
	defb	160
	defb	32
	defb	160
	defb	96
	defb	0
	defb	-2
	defb	1
	defb	144
	defb	96
	defb	32
	defb	96
	defb	144
	defb	96
	defb	-2
	defb	0
	defb	2
	defb	80
	defb	32
	defb	48
	defb	32
	defb	80
	defb	112
	defb	-2
	defb	2
	defb	3
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	2
	defb	0
	defb	1
	defb	192
	defb	64
	defb	144
	defb	64
	defb	192
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	208
	defb	64
	defb	128
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	2
	defb	80
	defb	80
	defb	80
	defb	80
	defb	128
	defb	112
	defb	2
	defb	2
	defb	3
	defb	128
	defb	32
	defb	64
	defb	32
	defb	128
	defb	32
	defb	-1
	defb	0
	defb	1
	defb	192
	defb	96
	defb	128
	defb	96
	defb	192
	defb	96
	defb	-2
	defb	0
	defb	2
	defb	96
	defb	48
	defb	96
	defb	48
	defb	96
	defb	112
	defb	0
	defb	2
	defb	4
	defb	48
	defb	112
	defb	48
	defb	112
	defb	96
	defb	112
	defb	1
	defb	0
	defb	1
	defb	48
	defb	32
	defb	48
	defb	32
	defb	176
	defb	32
	defb	2
	defb	0
	defb	2
	defb	160
	defb	96
	defb	64
	defb	96
	defb	160
	defb	96
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
	defb	128
	defb	64
	defb	64
	defb	64
	defb	128
	defb	64
	defb	-2
	defb	0
	defb	1
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	0
	defb	2
	defb	3
	defb	112
	defb	112
	defb	112
	defb	112
	defb	176
	defb	112
	defb	1
	defb	0
	defb	2
	defb	48
	defb	112
	defb	48
	defb	112
	defb	128
	defb	112
	defb	1
	defb	0
	defb	4
	defb	64
	defb	32
	defb	64
	defb	32
	defb	128
	defb	32
	defb	1
	defb	0
	defb	1
	defb	192
	defb	32
	defb	192
	defb	32
	defb	192
	defb	128
	defb	0
	defb	2
	defb	2
	defb	48
	defb	96
	defb	48
	defb	96
	defb	112
	defb	96
	defb	1
	defb	0
	defb	1
	defb	128
	defb	80
	defb	128
	defb	32
	defb	128
	defb	80
	defb	0
	defb	-2
	defb	2
	defb	48
	defb	48
	defb	48
	defb	32
	defb	144
	defb	48
	defb	2
	defb	-2
	defb	3
	defb	64
	defb	32
	defb	64
	defb	32
	defb	64
	defb	64
	defb	0
	defb	1
	defb	2
	defb	80
	defb	80
	defb	80
	defb	80
	defb	128
	defb	80
	defb	2
	defb	0
	defb	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	160
	defb	128
	defb	2
	defb	0
	defb	3
	defb	48
	defb	96
	defb	48
	defb	96
	defb	112
	defb	96
	defb	2
	defb	0
	defb	3
	defb	128
	defb	112
	defb	128
	defb	112
	defb	128
	defb	96
	defb	0
	defb	0
	defb	5
	defb	128
	defb	32
	defb	128
	defb	32
	defb	128
	defb	64
	defb	0
	defb	2
	defb	2
	defb	96
	defb	128
	defb	96
	defb	128
	defb	96
	defb	112
	defb	0
	defb	0
	defb	5
	defb	208
	defb	64
	defb	192
	defb	64
	defb	208
	defb	64
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
	defb	48
	defb	96
	defb	48
	defb	144
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	80
	defb	48
	defb	80
	defb	48
	defb	80
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
	defb	176
	defb	80
	defb	96
	defb	80
	defb	176
	defb	80
	defb	-2
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	96
	defb	0
	defb	2
	defb	3
	defb	192
	defb	0
	defb	192
	defb	0
	defb	192
	defb	48
	defb	0
	defb	2
	defb	1
	defb	192
	defb	32
	defb	160
	defb	32
	defb	192
	defb	32
	defb	-2
	defb	0
	defb	2
	defb	48
	defb	32
	defb	48
	defb	32
	defb	80
	defb	0
	defb	0
	defb	0
	defb	15
	defb	64
	defb	128
	defb	64
	defb	128
	defb	176
	defb	128
	defb	2
	defb	0
	defb	3
	defb	160
	defb	48
	defb	160
	defb	48
	defb	192
	defb	0
	defb	0
	defb	0
	defb	15
	defb	144
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	-2
	defb	0
	defb	1
	defb	112
	defb	16
	defb	16
	defb	16
	defb	112
	defb	32
	defb	-2
	defb	2
	defb	3
	defb	176
	defb	80
	defb	96
	defb	80
	defb	176
	defb	80
	defb	-2
	defb	0
	defb	2
	defb	128
	defb	16
	defb	16
	defb	16
	defb	128
	defb	16
	defb	-2
	defb	0
	defb	1
	defb	80
	defb	112
	defb	80
	defb	112
	defb	80
	defb	96
	defb	0
	defb	0
	defb	5
	defb	96
	defb	48
	defb	96
	defb	48
	defb	160
	defb	48
	defb	2
	defb	0
	defb	1
	defb	32
	defb	0
	defb	32
	defb	0
	defb	32
	defb	80
	defb	0
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
	defb	80
	defb	0
	defb	80
	defb	0
	defb	80
	defb	80
	defb	0
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
	defb	96
	defb	80
	defb	96
	defb	80
	defb	64
	defb	0
	defb	0
	defb	0
	defb	15
	defb	32
	defb	80
	defb	32
	defb	80
	defb	64
	defb	0
	defb	0
	defb	0
	defb	15
	defb	96
	defb	128
	defb	32
	defb	128
	defb	96
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	16
	defb	32
	defb	16
	defb	32
	defb	96
	defb	48
	defb	1
	defb	1
	defb	2
	defb	48
	defb	48
	defb	48
	defb	48
	defb	80
	defb	0
	defb	0
	defb	0
	defb	15
	defb	176
	defb	96
	defb	48
	defb	96
	defb	176
	defb	96
	defb	-2
	defb	0
	defb	4
	defb	16
	defb	112
	defb	16
	defb	112
	defb	208
	defb	112
	defb	2
	defb	0
	defb	4
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	80
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
	defb	96
	defb	112
	defb	96
	defb	112
	defb	160
	defb	112
	defb	1
	defb	0
	defb	1
	defb	208
	defb	96
	defb	176
	defb	96
	defb	208
	defb	96
	defb	-2
	defb	0
	defb	2
	defb	144
	defb	32
	defb	144
	defb	32
	defb	144
	defb	112
	defb	0
	defb	1
	defb	4
	defb	144
	defb	112
	defb	144
	defb	112
	defb	192
	defb	112
	defb	2
	defb	0
	defb	2
	defb	112
	defb	48
	defb	112
	defb	48
	defb	112
	defb	80
	defb	0
	defb	1
	defb	3
	defb	128
	defb	128
	defb	128
	defb	48
	defb	128
	defb	128
	defb	0
	defb	-2
	defb	1
	defb	64
	defb	48
	defb	64
	defb	48
	defb	96
	defb	0
	defb	0
	defb	0
	defb	15
	defb	160
	defb	48
	defb	160
	defb	48
	defb	208
	defb	64
	defb	2
	defb	2
	defb	2
	defb	192
	defb	144
	defb	192
	defb	144
	defb	192
	defb	128
	defb	0
	defb	0
	defb	5
	defb	112
	defb	112
	defb	112
	defb	112
	defb	80
	defb	0
	defb	0
	defb	0
	defb	15
	defb	160
	defb	64
	defb	160
	defb	64
	defb	160
	defb	112
	defb	0
	defb	1
	defb	2
	defb	192
	defb	32
	defb	192
	defb	32
	defb	192
	defb	96
	defb	0
	defb	2
	defb	3
	defb	48
	defb	96
	defb	48
	defb	96
	defb	96
	defb	112
	defb	2
	defb	2
	defb	1
	defb	208
	defb	128
	defb	112
	defb	128
	defb	208
	defb	128
	defb	-2
	defb	0
	defb	2
	defb	96
	defb	80
	defb	96
	defb	80
	defb	128
	defb	0
	defb	0
	defb	0
	defb	15
	defb	112
	defb	128
	defb	112
	defb	128
	defb	80
	defb	0
	defb	0
	defb	0
	defb	15
	defb	176
	defb	32
	defb	176
	defb	32
	defb	208
	defb	32
	defb	1
	defb	0
	defb	1
	defb	48
	defb	32
	defb	48
	defb	32
	defb	144
	defb	48
	defb	2
	defb	2
	defb	2
	defb	96
	defb	128
	defb	32
	defb	128
	defb	96
	defb	128
	defb	-2
	defb	0
	defb	3
	defb	128
	defb	16
	defb	128
	defb	16
	defb	128
	defb	80
	defb	0
	defb	2
	defb	2
	defb	176
	defb	48
	defb	176
	defb	48
	defb	208
	defb	48
	defb	1
	defb	0
	defb	1
	defb	48
	defb	128
	defb	16
	defb	128
	defb	48
	defb	128
	defb	-2
	defb	0
	defb	1
	defb	128
	defb	144
	defb	128
	defb	144
	defb	128
	defb	112
	defb	0
	defb	0
	defb	5
	defb	192
	defb	80
	defb	64
	defb	48
	defb	192
	defb	80
	defb	-2
	defb	-2
	defb	3
	defb	112
	defb	128
	defb	112
	defb	128
	defb	192
	defb	128
	defb	2
	defb	0
	defb	4
	defb	128
	defb	48
	defb	128
	defb	48
	defb	176
	defb	80
	defb	2
	defb	2
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
	defb	96
	defb	80
	defb	96
	defb	80
	defb	96
	defb	128
	defb	0
	defb	1
	defb	2
	defb	128
	defb	48
	defb	128
	defb	48
	defb	128
	defb	128
	defb	0
	defb	2
	defb	4
	defb	208
	defb	128
	defb	32
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	64
	defb	32
	defb	64
	defb	32
	defb	96
	defb	96
	defb	2
	defb	2
	defb	3
	defb	160
	defb	32
	defb	128
	defb	32
	defb	160
	defb	96
	defb	-2
	defb	2
	defb	1
	defb	128
	defb	80
	defb	128
	defb	80
	defb	96
	defb	0
	defb	0
	defb	0
	defb	15
	defb	208
	defb	128
	defb	96
	defb	128
	defb	208
	defb	128
	defb	-2
	defb	0
	defb	4
	defb	128
	defb	32
	defb	128
	defb	32
	defb	128
	defb	48
	defb	0
	defb	0
	defb	1
	defb	32
	defb	128
	defb	32
	defb	128
	defb	32
	defb	112
	defb	0
	defb	0
	defb	5
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	48
	defb	0
	defb	1
	defb	2
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	80
	defb	0
	defb	2
	defb	3
	defb	176
	defb	128
	defb	32
	defb	128
	defb	176
	defb	128
	defb	-2
	defb	0
	defb	1
	defb	64
	defb	64
	defb	64
	defb	64
	defb	64
	defb	128
	defb	0
	defb	1
	defb	4
	defb	128
	defb	128
	defb	48
	defb	128
	defb	128
	defb	128
	defb	-2
	defb	0
	defb	2
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	48
	defb	0
	defb	1
	defb	3

;	SECTION	code

;	SECTION	text

._hotspots
	defb	88
	defb	4
	defb	0
	defb	179
	defb	2
	defb	0
	defb	147
	defb	4
	defb	0
	defb	97
	defb	33
	defb	0
	defb	56
	defb	4
	defb	0
	defb	197
	defb	3
	defb	0
	defb	98
	defb	4
	defb	0
	defb	133
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	4
	defb	0
	defb	194
	defb	4
	defb	0
	defb	98
	defb	4
	defb	0
	defb	136
	defb	4
	defb	0
	defb	101
	defb	4
	defb	0
	defb	101
	defb	4
	defb	0
	defb	100
	defb	4
	defb	0
	defb	152
	defb	2
	defb	0
	defb	17
	defb	33
	defb	0
	defb	40
	defb	4
	defb	0
	defb	216
	defb	3
	defb	0
	defb	151
	defb	4
	defb	0
	defb	199
	defb	4
	defb	0
	defb	168
	defb	3
	defb	0
	defb	55
	defb	4
	defb	0
	defb	55
	defb	3
	defb	0
	defb	69
	defb	4
	defb	0
	defb	99
	defb	2
	defb	0
	defb	38
	defb	4
	defb	0
	defb	116
	defb	4
	defb	0
	defb	182
	defb	4
	defb	0
	defb	22
	defb	4
	defb	0
	defb	83
	defb	3
	defb	0
	defb	24
	defb	3
	defb	0
	defb	114
	defb	4
	defb	0
	defb	200
	defb	2
	defb	0
	defb	194
	defb	4
	defb	0
	defb	168
	defb	4
	defb	0
	defb	83
	defb	3
	defb	0
	defb	83
	defb	4
	defb	0
	defb	23
	defb	3
	defb	0
	defb	39
	defb	4
	defb	0
	defb	55
	defb	4
	defb	0
	defb	34
	defb	3
	defb	0
	defb	152
	defb	4
	defb	0
	defb	71
	defb	4
	defb	0
	defb	87
	defb	4
	defb	0
	defb	22
	defb	2
	defb	0
	defb	99
	defb	4
	defb	0
	defb	54
	defb	3
	defb	0
	defb	86
	defb	4
	defb	0
	defb	198
	defb	4
	defb	0
	defb	98
	defb	4
	defb	0
	defb	72
	defb	4
	defb	0
	defb	167
	defb	4
	defb	0
	defb	113
	defb	3
	defb	0
	defb	115
	defb	4
	defb	0
	defb	36
	defb	4
	defb	0
	defb	149
	defb	4
	defb	0
	defb	195
	defb	33
	defb	0
	defb	195
	defb	4
	defb	0
	defb	147
	defb	4
	defb	0
	defb	51
	defb	4
	defb	0
	defb	131
	defb	3
	defb	0
	defb	88
	defb	4
	defb	0
	defb	34
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	100
	defb	4
	defb	0
	defb	151
	defb	4
	defb	0
	defb	34
	defb	4
	defb	0
	defb	51
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	38
	defb	4
	defb	0
	defb	152
	defb	34
	defb	0
	defb	149
	defb	4
	defb	0
	defb	120
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	198
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	167
	defb	4
	defb	0
	defb	162
	defb	2
	defb	0
	defb	38
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	161
	defb	4
	defb	0
	defb	85
	defb	51
	defb	0
	defb	135
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	168
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	216
	defb	4
	defb	0
	defb	136
	defb	2
	defb	0
	defb	24
	defb	2
	defb	0
	defb	88
	defb	4
	defb	0
	defb	115
	defb	4
	defb	0
	defb	0
	defb	0
	defb	0
	defb	213
	defb	4
	defb	0
	defb	104
	defb	4
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
	ld a, 1
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
	add 3
	ld (__y), a
	jp _draw_coloured_tile_do
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
	ld d, 0
	ld e, a
	ld hl, 10
	call l_div_u
	ld a, e
	ld (__n), a
	ld a, l
	add 16
	ld e, a
	ld d, 71
	ld a, (__x)
	ld c, a
	ld a, (__y)
	call SPPrintAtInv
	ld a, (__n)
	add 16
	ld e, a
	ld d, 71
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
	ld	bc,i_18
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_18
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
.i_19
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_20
	halt
	call	_any_key
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	and	a
	jp	z,i_22
	ld	a,(_pti)
	cp	#(0 % 256)
	jr	z,i_23_i_22
.i_22
	jp	i_21
.i_23_i_22
	jp	i_20
.i_21
	ld	hl,(_ptj)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_19
.i_20
	ret


;	SECTION	text

._new_level_string
	defm	"LEVEL 00"
	defb	0

;	SECTION	code



;	SECTION	text

._scr_ini
	defm	"<@GTH"
;	SECTION	code


;	SECTION	text

._ini_x
	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	11

	defm	""
	defb	7

	defm	""
	defb	7

;	SECTION	code


;	SECTION	text

._ini_y
	defm	""
	defb	4

	defm	""
	defb	4

	defm	""
	defb	4

	defm	""
	defb	4

	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._tilemaps
	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	25

	defm	""
	defb	5

	defm	""
	defb	6

	defm	""
	defb	7

	defm	""
	defb	8

	defm	""
	defb	9

	defm	""
	defb	10

	defm	""
	defb	11

	defm	""
	defb	12

	defm	""
	defb	13

	defm	""
	defb	14

	defm	""
	defb	15

	defm	" !"
	defb	34

	defm	""
	defb	11

	defm	"$%&'()"
	defb	12

	defm	""
	defb	23

	defm	""
	defb	24

	defm	"-"
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	17

	defm	"./+,#"
	defb	6

	defm	""
	defb	26

	defm	""
	defb	9

	defm	""
	defb	19

	defm	""
	defb	22

	defm	""
	defb	27

	defm	"'"
	defb	25

	defm	""
	defb	15

	defm	"*'./"
	defb	4

	defm	""
	defb	28

	defm	""
	defb	29

	defm	""
	defb	30

	defm	""
	defb	31

	defm	""
	defb	7

	defm	""
	defb	19

	defm	""
	defb	17

	defm	""
	defb	23

	defm	""
	defb	24

	defm	""
	defb	12

	defm	""
	defb	15

	defm	""
	defb	0

	defm	"*"
	defb	7

	defm	""
	defb	25

	defm	"'+"
	defb	23

	defm	""
	defb	24

	defm	"#"
	defb	9

	defm	""
	defb	22

	defm	""
	defb	17

	defm	""
	defb	29

	defm	""
	defb	30

	defm	""
	defb	31

	defm	""
	defb	15

;	SECTION	code


;	SECTION	text

._hub_signs_x
	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	13

	defm	""
	defb	12

;	SECTION	code


;	SECTION	text

._hub_signs_y
	defm	""
	defb	5

	defm	""
	defb	2

	defm	""
	defb	5

	defm	""
	defb	2

;	SECTION	code


;	SECTION	text

._level_finished
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

._power_name0
	defm	"CERROJO"
	defb	0

;	SECTION	code



;	SECTION	text

._power_name1
	defm	"VIENTO"
	defb	0

;	SECTION	code



;	SECTION	text

._power_name2
	defm	"PODER"
	defb	0

;	SECTION	code



;	SECTION	text

._power_name3
	defm	"TIEMPO"
	defb	0

;	SECTION	code



;	SECTION	text

._power_name4
	defm	"AGARRE"
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc0
	defm	"  ABRE CERROJOS SIN LLAVES "
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc1
	defm	" FLOTA MIENTRAS CAES CON > "
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc2
	defm	" MALOS PARALIZADOS NO MATAN"
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc3
	defm	" RESONADORES VAN MAS LENTOS"
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc4
	defm	" CHERIL NO RESBALA EN HIELO"
	defb	0

;	SECTION	code



;	SECTION	text

._power_desc5
	defm	"                           "
	defb	0

;	SECTION	code



;	SECTION	text

._power_names
	defw	_power_name0
	defw	_power_name1
	defw	_power_name2
	defw	_power_name3
	defw	_power_name4

;	SECTION	code

;	SECTION	text

._power_descs
	defw	_power_desc0
	defw	_power_desc1
	defw	_power_desc2
	defw	_power_desc3
	defw	_power_desc4
	defw	_power_desc5

;	SECTION	code

;	SECTION	text

._power_on
	defm	""
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

._pezon_incs
	defm	""
	defb	244

	defm	""
	defb	246

	defm	""
	defb	247

	defm	""
	defb	248

	defm	""
	defb	248

	defm	""
	defb	250

	defm	""
	defb	251

	defm	""
	defb	252

	defm	""
	defb	252

	defm	""
	defb	254

	defm	""
	defb	255

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	4

	defm	""
	defb	4

	defm	""
	defb	5

	defm	""
	defb	6

	defm	""
	defb	7

	defm	""
	defb	8

	defm	""
	defb	9

	defm	""
	defb	10

	defm	""
	defb	11

;	SECTION	code



._clear_game_area
	LIB SPClearRect
	ld hl, #(3*256+1)
	ld bc, #((3+19)*256+1+29)
	ld de, 0
	ld a, 0x03
	ex af, af
	call SPClearRect
	ld a, 1
	ld c, a
	ld a, 3
	ld b, a
	ld de, #((3+19)*256+1+29)
	ld iy, fsClipStruct
	call SPInvalidate
	ret



._paralyze_everyone
	xor a
	ld (_player_min_killable), a
	ld bc, 3
	.paralyze_do
	dec c
	ld hl, _enem_may_be_paralyzed
	add hl, bc
	ld a, (hl)
	or a
	jr z, paralyze_next
	ld a, 0xff
	ld hl, _en_an_count
	add hl, bc
	ld (hl), a
	ld a, 32
	ld hl, _en_an_state
	add hl, bc
	ld (hl), a
	.paralyze_next
	xor a
	or c
	jr nz, paralyze_do
	ret



._restore_everyone
	ld a, 6
	ld (_player_min_killable), a
	ld hl, _en_an_count
	ld de, _en_an_state
	xor a
	ld b, 3
	.deparalyze_do
	ld (hl), a
	ld (de), a
	inc hl
	inc de
	djnz deparalyze_do
	ret



._set_hotspot
	call _calc_hotspot_ptr
	ld hl, _hotspots
	add hl, de
	ld c, (hl)
	inc hl
	ld a, (_hotspot_t)
	ld (hl), a
	inc hl
	ld a, 1
	ld (hl), a
	ld a, c
	srl a
	srl a
	srl a
	srl a
	ld (_rdx), a
	ld a, c
	and 0xf0
	ld (_hotspot_x), a
	ld a, c
	and 15
	ld (_rdy), a
	sla a
	sla a
	sla a
	sla a
	ld (_hotspot_y), a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_t)
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



._paint_sign
	ld a, (__x)
	ld c, a
	ld a, (__y)
	inc a
	ld de, #((2+64)*256+62)
	call SPPrintAtInv
	ld a, (__x)
	inc a
	ld c, a
	ld a, (__y)
	inc a
	ld de, #((2+64)*256+63)
	call SPPrintAtInv
	ld d, 7
	ld a, (__x)
	cp #(1+2*2)
	jr nz, paint_sign_right
	.paint_sign_left
	ld c, a
	ld a, (__y)
	ld e, 59
	call SPPrintAtInv
	ld a, (__x)
	inc a
	jr paint_sign_body
	.paint_sign_right
	inc a
	ld c, a
	ld a, (__y)
	ld e, 61
	call SPPrintAtInv
	ld a, (__x)
	.paint_sign_body
	ld c, a
	ld a, (_ls)
	ld e, a
	ld a, (__y)
	ld d, 0x7
	call SPPrintAtInv
	ret



._set_block
	ld a, (__x)
	cp 2
	jr nz, set_block_right
	.set_block_left
	xor a
	jr set_block_do
	.set_block_right
	ld a, 14
	.set_block_do
	ld (__x), a
	ld c, a
	ld a, 4
	ld (__t), a
	ld a, 8
	ld (__n), a
	call set_map_tile_do
	ret



._reset_game
	xor a
	ld (_levels_finished), a
	ld hl, _level_finished
	ld de, _level_finished + 1
	ld bc, 3
	ld (hl), a
	ldir
	ld hl, _power_on
	ld de, _power_on + 1
	ld bc, 4
	ld (hl), a
	ldir
	ld (_master_of_keys), a
	ld (_ramiro_hover), a
	ld (_paralyzed_dont_kill), a
	ld (_disable_slippery), a
	ld (_p_bellotas), a
	ld a, 25
	ld (_resonators_frames), a
	ret



._enable_power
	ld bc, (_rdy)
	ld b, 0
	ld hl, _power_on
	add hl, bc
	ld a, 1
	ld (hl), a
	ld a, c
	cp 4
	jr z, enable_grip
	cp 3
	jr z, enable_time
	cp 2
	jr z, enable_strength
	cp 1
	jr z, enable_wind
	.enable_locks
	ld a, 1
	ld (_master_of_keys), a
	ret
	.enable_wind
	ld a, 1
	ld (_ramiro_hover), a
	ret
	.enable_strength
	ld a, 1
	ld (_paralyzed_dont_kill), a
	ret
	.enable_time
	ld a, 35
	ld (_resonators_frames), a
	ret
	.enable_grip
	ld a, 1
	ld (_disable_slippery), a
	ret



._update_bellotas
	ld a, (_p_bellotas)
	add 16
	ld e, a
	ld a, 1
	ld c, 30
	ld d, 71
	call SPPrintAtInv
	ret



._select_power
	call	_clear_game_area
	ld	hl,5 % 256	;const
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
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_49
.i_47
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_49
	ld	a,(_gpit)
	cp	#(5 % 256)
	jp	z,i_48
	jp	nc,i_48
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,8
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,i_1+23
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,17 % 256	;const
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,_power_names
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld hl, _power_on
	ld bc, (_gpit)
	ld b, 0
	add hl, bc
	ld a, (hl)
	or a
	jr z, select_power_no_tick
	ld a, (_rdy)
	ld c, 25
	ld de, #((64+4)*256 + 60)
	call SPPrintAtInv
	.select_power_no_tick
	jp	i_47
.i_48
	ld	hl,7 % 256	;const
	push	hl
	ld	de,18 % 256	;const
	push	de
	push	hl
	ld	hl,i_1+33
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,#(0 % 256 % 256)
	ld	(_rdy),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_50
	ld	hl,(_rdy)
	ld	h,0
	ex	de,hl
	ld	hl,(_rdx)
	ld	h,0
	call	l_ne
	jp	nc,i_52
	ld c, 5
	ld a, (_rdx)
	sla a
	add 3+5
	ld de, 0
	call SPPrintAtInv
	ld c, 5
	ld a, (_rdy)
	sla a
	add 3+5
	ld de, #((6+64)*256 + 15)
	call SPPrintAtInv
	ld	hl,(_rdy)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,2 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,_power_descs
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	hl,9 % 256	;const
	call	_play_sfx
.i_52
	call _pad_read
	ld a, (_pad_this_frame)
	ld c, a
	and 0x01
	jr nz, select_power_up_done
	.select_power_up
	ld a, (_rdy)
	or a
	jr nz, select_power_up_dec
	ld a, 5
	jr select_power_up_set
	.select_power_up_dec
	dec a
	.select_power_up_set
	ld (_rdy), a
	jr select_power_continue
	.select_power_up_done
	ld a, c
	and 0x02
	jr nz, select_power_down_done
	.select_power_down
	ld a, (_rdy)
	cp 5
	jr c, select_power_down_inc
	xor a
	jr select_power_down_set
	.select_power_down_inc
	inc a
	.select_power_down_set
	ld (_rdy), a
	jr select_power_continue
	.select_power_down_done
	ld a, c
	and 0x80
	jr nz, select_power_continue
	ld a, (_rdy)
	cp 5
	ret z
	ld a, (_p_bellotas)
	or a
	jr nz, select_has_bellotas
	ld hl, 2
	call _play_sfx
	jr select_power_continue
	.select_has_bellotas
	ld hl, _power_on
	ld c, a
	ld b, 0
	add hl, bc
	ld a, (hl)
	or a
	jr nz, select_power_continue
	ld hl, _p_bellotas
	dec (hl)
	call _update_bellotas
	call SPUpdateNow
	ld hl, 8
	call _play_sfx
	jp _enable_power
	.select_power_continue
	jp	i_50
.i_51
	ret



._hook_system_inits
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_continue_on),a
	ret



._hook_init_game
	ld	a,#(0 % 256 % 256)
	ld	(_resonators_on),a
	ld	a,#(0 % 256 % 256)
	ld	(_resct_old),a
	ld	a,#(4 % 256 % 256)
	ld	(_player_min_killable),a
	ld	a,#(1 % 256 % 256)
	ld	(_new_level),a
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_level),a
	call	_update_bellotas
	ret



._hook_init_mainloop
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_54
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jr	nz,i_55_i_54
.i_54
	jp	i_53
.i_55_i_54
	ld	hl,_player+32
	ld	(hl),#(60 % 256 % 256)
.i_53
	ld	a,(_player+32)
	ld	e,a
	ld	d,0
	ld	hl,60	;const
	call	l_eq
	jp	nc,i_56
	ld a, 9
	ld (__x), a
	ld a, 11
	ld (__y), a
	ld a, 22
	ld (__x2), a
	ld a, 13
	ld (__y2), a
	ld a, 15
	ld (__t), a
	call	_draw_rectangle
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,i_1+39
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_57
	ld	a,(_levels_finished)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_eq
	ld	de,7
	add	hl,de
	ld	h,0
	call	_arkos_play_music
	jp	i_58
.i_57
	call	_beepet
	ld	hl,10 % 256	;const
	call	_play_sfx
.i_58
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld bc, (_level)
	ld b, 0
	ld hl, _level_finished
	add hl, bc
	ld a, 1
	ld (hl), a
	ld a, (_levels_finished)
	inc a
	ld (_levels_finished), a
	cp 4
	jr z, win_game_check_won
	ld a, 4
	ld (_level), a
	ld a, 1
	ld (_new_level), a
	jr win_game_check_done
	.win_game_check_won
	ld a, 1
	ld (_game_loop_flag), a
	.win_game_check_done
.i_56
	xor a
	ld hl, _new_level
	or (hl)
	ret z
	xor a
	ld (hl), a
	ld a, (_level)
	cp 4
	jr z, level_screen_done
	add 0x31
	ld (_new_level_string + 7), a
	call _clear_game_area
	ld	a,(_is128k)
	and	a
	jp	z,i_59
	ld	hl,2 % 256	;const
	call	_arkos_play_music
.i_59
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
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+52
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld hl, 10
	call _play_sfx
	ld hl, 150
	push hl
	call _espera_activa
	pop bc
	.level_screen_done
	ld bc, (_level)
	ld b, 0
	ld hl, _scr_ini
	add hl, bc
	ld a, (hl)
	ld (_n_pant), a
	call _init_player_values
	xor a
	ld (_player + 32), a
	ld (_resonators_on), a
	ld (_p_got_bellota), a
	ld a, (_level)
	sla a
	sla a
	sla a
	sla a
	ld c, a
	ld b, 0
	ld hl, _tilemaps
	add hl, bc
	ld (_tileset_mappings), hl
	ld	a,(_is128k)
	and	a
	jp	z,i_60
	ld	a,(_level)
	cp	#(4 % 256)
	jp	nz,i_61
	ld	hl,1	;const
	jp	i_62
.i_61
	ld	hl,(_level)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
.i_62
	call	_arkos_play_music
.i_60
	ret



._hook_mainloop
	ld	hl,(_player+32)
	ld	h,0
	ex	de,hl
	ld	hl,(_killed_old)
	ld	h,0
	call	l_ne
	jp	nc,i_63
	ld	hl,16 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,(_player+32)
	ld	h,0
	ld	de,60
	ex	de,hl
	and	a
	sbc	hl,de
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
.i_63
	ld	a,(_latest_hotspot)
	cp	#(33 % 256)
	jp	nz,i_64
	ld	hl,_p_bellotas
	ld	a,(hl)
	inc	(hl)
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_p_got_bellota),a
	call	_update_bellotas
	jp	i_65
.i_64
	ld	a,(_latest_hotspot)
	cp	#(34 % 256)
	jp	nz,i_66
	ld	hl,(_hotspots_semaphore)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_67
	call	_saca_a_todo_el_mundo_de_aqui
	call	_select_power
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
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(_on_pant),a
.i_67
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hotspots_semaphore),a
.i_66
.i_65
	ld	a,(_latest_hotspot)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_uge
	jp	nc,i_68
	ld a, (_latest_hotspot)
	cp 4
	jr nz, activate_resonator_done
	ld hl, (_player+8)
	bit 7, h
	jr nz, activate_resonator_done
	ld a, h
	or l
	jr z, activate_resonator_done
	ld a, (_gpy)
	add 8
	ld c, a
	ld a, (_hotspot_y)
	cp c
	jr c, activate_resonator_done
	.activate_resonator
	ld hl, 6
	call _play_sfx
	ld a, 10
	ld (_resonators_on), a
	xor a
	ld (_resonators_ct), a
	ld a, 5
	ld (_latest_hotspot), a
	ld hl, #(-320)
	ld (_player+8), hl
	.activate_resonator_done
	ld a, (_latest_hotspot)
	ld (_hotspot_t), a
	call _set_hotspot
	jp	i_69
.i_68
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hotspots_semaphore),a
.i_69
	.resonators_do
	ld a, (_resonators_on)
	ld c, a
	or a
	jr z, resonators_done
	ld a, (_resonators_ct)
	or a
	jr z, resonators_tick
	dec a
	ld (_resonators_ct), a
	jr resonators_done
	.resonators_tick
	ld a, c
	dec a
	ld (_resonators_on), a
	jr nz, resonators_next_tick
	.resonators_last_tick
	ld hl, 3
	call _play_sfx
	call update_resonator_hud
	call _restore_everyone
	ld a, (_hotspot_t)
	cp 4
	jr c, resonators_done
	cp 6
	jr nc, resonators_done
	ld a, 4
	ld (_hotspot_t), a
	call _set_hotspot
	jr resonators_done
	.update_resonator_hud
	ld hl, 22
	push hl
	ld hl, 1
	push hl
	ld hl, (_resonators_on)
	push hl
	call _draw_2_digits
	pop bc
	pop bc
	pop bc
	ret
	.resonators_next_tick
	ld hl, 4
	call _play_sfx
	call update_resonator_hud
	ld a, (_resonators_frames)
	ld (_resonators_ct), a
	call _paralyze_everyone
	.resonators_done
	ret



._hook_entering
	ld	a,(_hotspot_t)
	cp	#(4 % 256)
	jp	z,i_71
	ld	a,(_hotspot_t)
	cp	#(5 % 256)
	jp	nz,i_70
.i_71
	ld a, (_resonators_on)
	or a
	ld a, 4
	jr z, he_res_set
	inc a
	.he_res_set
	ld (_hotspot_t), a
	call _set_hotspot
.i_70
	ld	hl,(_resonators_on)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_paralyze_everyone
.i_73
	ld a, (_n_pant)
	cp 72
	ret nz
	ld bc, 0x0004
	.hub_screen_loop
	dec bc
	push bc
	ld a, c
	add 26
	ld (_ls), a
	ld hl, _hub_signs_x
	add hl, bc
	ld a, (hl)
	ld (_rdx), a
	ld (__x), a
	ld hl, _hub_signs_y
	add hl, bc
	ld a, (hl)
	ld (_rdy), a
	ld (__y), a
	ld hl, _level_finished
	add hl, bc
	ld a, (hl)
	or a
	jr z, hub_screen_level_finished_done
	.hub_screen_level_finished
	call _set_block
	.hub_screen_level_finished_done
	ld a, (_rdx)
	sla a
	ld c, 1
	add c
	ld (__x), a
	ld a, (_rdy)
	sla a
	ld c, 3
	add c
	ld (__y), a
	call _paint_sign
	pop bc
	ld a, c
	or b
	jr nz, hub_screen_loop
	ret



._extra_enems_init
	ld	de,_enem_may_be_paralyzed
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ld hl, (_enoffsmasi)
	call _calc_baddies_pointer
	push hl
	pop ix
	ld a, (__en_t)
	cp 4
	jr z, enems_init_platforms
	cp 5
	jr z, enems_init_zurulli
	cp 15
	ret nz
	ld c, (ix+4)
	ld a, (ix+2)
	cp c
	jr c, gyrosaw_clockwise
	.gyrosaw_counter_clockwise
	xor a
	jr gyrosaw_direction_set
	.gyrosaw_clockwise
	ld a, 1
	.gyrosaw_direction_set
	ld (ix+7), a
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_extra_sprite_17_a
	pop	de
	call	l_pint
	.enems_init_platforms
	ld	de,_enem_may_be_paralyzed
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret
	.enems_init_zurulli
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_extra_sprite_18_a
	pop	de
	call	l_pint
	ret



._extra_enems_move
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,5	;const
	call	l_eq
	jp	nc,i_74
	ld a, (__en_mx)
	ld c, a
	cp 24
	jr nc, pezons_idle
	.pezons_moving
	ld b, 0
	ld hl, _pezon_incs
	add hl, bc
	ld d, (hl)
	ld a, (__en_y)
	add d
	jr pezons_move_done
	.pezons_idle
	ld a, (__en_y1)
	.pezons_move_done
	ld (__en_y), a
	ld a, c
	inc a
	and 63
	ld (__en_mx), a
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_extra_sprite_18_a
	pop	de
	call	l_pint
.i_74
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_eq
	jp	nc,i_75
	ld hl, __en_y2
	ld d, (hl)
	.gyrosaw_sign
	ld b, d
	srl b
	ld a, (__en_my)
	or a
	ld a, b
	jr nz, gyrosaw_sign_done
	xor 1
	.gyrosaw_sign_done
	.gyrosaw_velocity
	or a
	jr nz, gyrosaw_adv_negative
	.gyrosaw_adv_positive
	ld c, 2
	jr gyrosaw_velocity_set
	.gyrosaw_adv_negative
	ld c, -2
	.gyrosaw_velocity_set
	.gyrosaw_advance
	ld a, d
	and 1
	ld b, a
	ld a, (__en_my)
	or a
	ld a, b
	jr nz, gyrosaw_advance_do
	xor 1
	.gyrosaw_advance_do
	or a
	jr z, gyrosaw_horizontal
	.gyrosaw_vertical
	ld a, (__en_y)
	add c
	ld (__en_y), a
	jr gyrosaw_advance_done
	.gyrosaw_horizontal
	ld a, (__en_x)
	add c
	ld (__en_x), a
	.gyrosaw_advance_done
	.gyrosaw_state_change
	ld a, (__en_mx)
	add 2
	and 31
	ld (__en_mx), a
	jr nz, gyrosaw_done
	ld a, d
	inc a
	and 3
	ld (hl), a
	.gyrosaw_done
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_extra_sprite_17_a
	pop	de
	call	l_pint
.i_75
	ret



._extra_enems_checks
	ret



._extra_enems_killed
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
	jp dzx0_standard
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
	call SPUpdateNow
	ld	hl,_s_title
	ld	(_asm_int),hl
	call	_unpack
	ld	a,(_continue_on)
	and	a
	jp	z,i_76
	ld	a,(_p_got_bellota)
	and	a
	jp	z,i_77
	ld	hl,_p_got_bellota
	ld	a,(hl)
	dec	(hl)
.i_77
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+63
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
.i_78
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_81
.i_80
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_79
.i_83
.i_82
	jp	i_78
.i_79
.i_76
.i_84
	call	_any_key
	ld	a,h
	or	l
	jp	nz,i_84
.i_85
	call	_reset_game
	ld	a,#(1 % 256 % 256)
	ld	(_continue_on),a
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+91
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_86
	ld	hl,0 % 256	;const
	call	_arkos_play_music
	jp	i_87
.i_86
	; Music generated by beepola
	di
	call musicstart
	ei
.i_87
.i_88
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_90
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_89
.i_90
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_92
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_89
.i_92
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_94
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_89
.i_94
.i_93
.i_91
	jp	i_88
.i_89
.i_81
.i_95
	ret



._game_ending
	call SPUpdateNow
	ld	hl,_s_ending
	ld	(_asm_int),hl
	call	_unpack
	ld	hl,5 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+120
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_96
	ld	hl,10 % 256	;const
	call	_arkos_play_music
	jp	i_97
.i_96
	call	_beepet
	ld	hl,11 % 256	;const
	call	_play_sfx
.i_97
	ld	hl,32767	;const
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
	ld a, 15
	ld (__t), a
	call	_draw_rectangle
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,i_1+187
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_98
	ld	hl,9 % 256	;const
	call	_arkos_play_music
	jp	i_99
.i_98
	call	_beepet
	ld	hl,10 % 256	;const
	call	_play_sfx
.i_99
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



._render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_105
.i_103
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_105
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_104
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
	jp	i_103
.i_104
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,-8
	add	hl,bc
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
	jp	c,i_107
	ld	a,(_half_life)
	and	a
	jp	z,i_106
.i_107
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_109
.i_106
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_109
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
	ld a, 3-1
	jr ras_rdi_calc_done
	.ras_player_on_screen
	ld a, (_rdy)
	srl a
	srl a
	srl a
	add 3
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



._clear_cerrojo
	ld hl, 4
	add hl, sp
	ld a, (hl)
	ld (__x), a
	ld (_rdx), a
	ld c, a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	ld (_rdy), a
	xor a
	ld (__t), a
	ld a, (_comportamiento_tiles) ;; beh [0]
	ld (__n), a
	call set_map_tile_do
	ld a, (_rdx)
	ld (__x), a
	ld a, (_rdy)
	ld (__y), a
	ld b, 8
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
	ld b, 8
	ld hl, _cerrojos + 3
	ld de, 4
	ld a, 1
	.init_cerrojos_loop
	ld (hl), a
	add hl, de
	djnz init_cerrojos_loop
	ret



._init_malotes
	ld bc, 12 * 8 * 3
	ld de, 9
	ld ix, _malotes
	.init_malotes_loop
	ld a, (ix+8)
	and 15
	ld (ix+8), a
	add ix, de
	dec bc
	ld a, b
	or c
	jr nz, init_malotes_loop
	ret



._adjust_to_tile_x
	ld a, (_gpxx)
	sla a
	sla a
	sla a
	sla a
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), hl
	ret



._adjust_to_tile_y
	ld a, (_gpyy)
	sla a
	sla a
	sla a
	sla a
	ld (_gpy), a
	call Ashl16_HL
	ld (_player+2), hl
	ret



._player_flicker
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(70 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret



._two_points_attr
	ld a, (_gpx)
	add 4
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld a, (_pty1)
	call _attr_2
	ld a, l
	ld (_rdt1), a
	ld a, (_gpx)
	add 11
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld a, (_pty1)
	call _attr_2
	ld a, l
	ld (_rdt2), a
	ret



._move
	ld	hl,(_player)
	ld	(_gpcx),hl
	ld	hl,(_player+1+1)
	ld	(_gpcy),hl
	call	_pad_read
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
	and	a
	jp	z,i_110
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_112
	ld	a,(_player+42)
	cp	#(0 % 256)
	jr	z,i_113_i_112
.i_112
	jp	i_111
.i_113_i_112
	ld	a,(_player+26)
	and	a
	jp	nz,i_115
	ld	a,(_player+25)
	and	a
	jp	z,i_114
.i_115
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1 % 256	;const
	call	_play_sfx
.i_114
.i_111
	ld	a,(_player+19)
	and	a
	jp	z,i_117
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
	ld	de,112
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
	jp	nc,i_118
	ld	hl,65216	;const
	ld	(_player+8),hl
.i_118
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_119
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_119
.i_117
	jp	i_120
.i_110
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(0 % 256 % 256)
.i_120
	ld	hl,(_player+41)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,_player+41
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_122
	inc	hl
	ld	a,(_ramiro_hover)
	and	a
	jr	nz,i_123_i_122
.i_122
	jp	i_121
.i_123_i_122
	ld	hl,_player+42
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	m,i_124
	or	l
	jp	z,i_124
	ld	a,(_rda)
	cp	#(0 % 256)
	jp	nz,i_126
	ld	a,(_is128k)
	and	a
	jr	nz,i_127_i_126
.i_126
	jp	i_125
.i_127_i_126
	ld	hl,12 % 256	;const
	call	_play_sfx
.i_125
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
.i_124
	jp	i_128
.i_121
	ld	hl,_player+42
	ld	(hl),#(0 % 256 % 256)
.i_128
	ld	hl,(_player+41)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_129
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
.i_129
	ld	a,(_player+25)
	and	a
	jp	z,i_130
	ld	hl,0	;const
	ld	(_player+8),hl
.i_130
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
	jp	nc,i_131
	ld	hl,65024	;const
	ld	(_player+1+1),hl
.i_131
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_132
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_132
	ld hl, (_player + 0)
	call HLshr6_A
	ld (_gpx), a
	srl a
	srl a
	srl a
	srl a
	ld (_gpxx), a
	ld hl, (_player + 2)
	call HLshr6_A
	ld (_gpy), a
	srl a
	srl a
	srl a
	srl a
	ld (_gpyy), a
	.vert_collision
	xor a
	ld (_player + 26), a
	ld (_player + 37), a
	ld (_wall), a
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
	ld hl, _gpyy
	inc (hl)
	call _adjust_to_tile_y
	ld a, 1
	ld (_player + 37), a
	ld a, 4
	ld (_wall), a
	jr vert_collision_done
	.vert_collision_positive
	ld a, (_gpy)
	and 15
	ld c, a
	ld hl, (_player + 8)
	call HLshr6_A
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
	ld	hl,_player+11
	push	hl
	pop	de
	ld	a,#(32 % 256)
	ld	(de),a
	ld	hl,_player+12
	push	hl
	pop	de
	ld	a,#(48 % 256)
	ld	(de),a
	ld	hl,200	;const
	ld	(_player+39),hl
	ld a, (_gpy)
	add 16
	srl a
	srl a
	srl a
	srl a
	ld (_pty1), a
	call _two_points_attr
	ld	hl,_rdt1
	ld	a,(hl)
	and	#(64 % 256)
	jp	nz,i_134
	ld	hl,_rdt2
	ld	a,(hl)
	and	#(64 % 256)
	jp	z,i_133
.i_134
	ld	hl,(_rdj)
	xor	a
	or	h
	jp	p,i_136
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_137
.i_136
	ld	hl,_player+8
	ld	(hl),#(4 % 256)
	inc	hl
	ld	(hl),#(4 / 256)
	ld	hl,_player+26
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+11
	push	hl
	pop	de
	ld	a,#(8 % 256)
	ld	(de),a
	ld	hl,_player+12
	push	hl
	pop	de
	ld	a,#(64 % 256)
	ld	(de),a
	ld	hl,64	;const
	ld	(_player+39),hl
.i_137
.i_133
	ld a, (_gpy)
	add 16
	srl a
	srl a
	srl a
	srl a
	ld (_pty1), a
	call _two_points_attr
	ld	hl,(_player+26)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_138
	ld a, (_rdt1)
	and 16
	jr nz, slippery_check_do
	ld a, (_rdt2)
	and 16
	jr z, slippery_check_done
	.slippery_check_do
	ld a, (_disable_slippery)
	or a
	jr nz, slippery_check_done
	ld a, 8
	ld (_player+11), a
	ld a, 8
	ld (_player+12), a
	.slippery_check_done
	ld c, 0
	ld a, (_rdt1)
	bit 1, a
	call nz, conveyor_add_to_rdj
	ld a, (_rdt2)
	bit 1, a
	call nz, conveyor_add_to_rdj
	xor a
	or c
	jr z, conveyor_check_done
	bit 7, a
	ld hl, (_ptgmx)
	ld bc, 128
	jr z, conveyor_right
	.conveyor_left
	sbc hl, bc
	jr conveyor_set_ptgmx
	.conveyor_add_to_rdj
	and 1
	sla a
	dec a
	add c
	ld c, a
	ret
	.conveyor_right
	add hl, bc
	.conveyor_set_ptgmx
	ld (_ptgmx), hl
	.conveyor_check_done
.i_138
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_140
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_141_i_140
.i_140
	jp	i_139
.i_141_i_140
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_142
	or	l
	jp	z,i_142
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
	jp	p,i_143
	ld	hl,0	;const
	ld	(_player+6),hl
.i_143
	jp	i_144
.i_142
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_145
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
	jp	m,i_146
	or	l
	jp	z,i_146
	ld	hl,0	;const
	ld	(_player+6),hl
.i_146
.i_145
.i_144
.i_139
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_147
	ld	hl,(_player+6)
	push	hl
	ld	hl,(_player+39)
	call	l_neg
	pop	de
	call	l_gt
	jp	nc,i_148
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
.i_148
.i_147
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_149
	ld	de,(_player+6)
	ld	hl,(_player+39)
	call	l_lt
	jp	nc,i_150
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
.i_150
.i_149
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
	jp	p,i_151
	ld	hl,0	;const
	ld	(_player),hl
.i_151
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_152
	ld	hl,14336	;const
	ld	(_player),hl
.i_152
	ld hl, (_player + 0)
	call HLshr6_A
	ld (_gpx), a
	srl a
	srl a
	srl a
	srl a
	ld (_gpxx), a
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
	call Ashl16_HL
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
	call Ashl16_HL
	ld (_player), hl
	ld a, 2
	ld (_wall), a
	.horz_collision_done
	ld	a,(_wall)
	and	a
	jp	z,i_154
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_154
	inc	hl
	ld	hl,_player+28
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	c,i_155
	ld	a,(_master_of_keys)
	and	a
	jp	z,i_154
.i_155
	jr	i_157_i_154
.i_154
	jp	i_153
.i_157_i_154
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
	jp	nc,i_158
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
	call	_play_sfx
	jp	i_159
.i_158
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
	jp	nc,i_160
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
	call	_play_sfx
.i_160
.i_159
.i_153
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
	jp	nz,i_161
	ld	hl,2 % 256	;const
	call	_play_sfx
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
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_player_just_died),a
.i_161
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
	or a
	jr z, _player_cell_sel_set_rdi
	ld a, 4
	._player_cell_sel_set_rdi
	ld (_rdi), a
	ld	hl,(_player+26)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_163
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_164_i_163
.i_163
	jp	i_162
.i_164_i_163
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_165
.i_162
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_167
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_168_i_167
.i_167
	jp	i_166
.i_168_i_167
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_169
.i_166
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
	jp	nz,i_170
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_170
.i_169
.i_165
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
	ld (_player+33),a
	ld (_player+34),a
	ld (_player+35),a
	ld (_player+36),a
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 10
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 12 * 8
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
	ld (_hotspot_t), a
	call _calc_hotspot_ptr
	ld ix, _hotspots
	add ix, de
	ld a, (ix+2)
	cp 1
	jr nz, hotspot_paint_act_skip
	ld a, (ix+1)
	or a
	jr z, hotspot_paint_act_skip
	cp 2
	jr nz, hotspot_paint_mok_done
	ld a, (_master_of_keys)
	or a
	jr z, hotspot_paint_mok_set2
	ld a, 3
	jr hotspot_paint_mok_done
	.hotspot_paint_mok_set2
	ld a, 2
	.hotspot_paint_mok_done
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
	ld a, (_rdx)
	sla a
	add 1
	ld (__x), a
	ld a, (_rdy)
	sla a
	add 3
	ld (__y), a
	ld a, (_hotspot_t)
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
	ld bc, (_rdt1)
	call tile_lookup
	ld (__n), a
	call _draw_and_advance
	ld bc, (_rdt2)
	call tile_lookup
	ld (__n), a
	call _draw_and_advance
	ld a, (_gpit)
	inc a
	ld (_gpit), a
	cp 75
	jr nz, draw_scr_bg_loop
	jr draw_scr_bg_loop_end
	.tile_lookup
	ld b, 0
	ld hl, (_tileset_mappings)
	add hl, bc
	ld a, (hl)
	ret
	ret
	.draw_scr_bg_loop_end
	call	_hotspot_paint
	ld hl, _cerrojos
	ld b, 8
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
	jp	i_173
.i_171
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_173
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_172
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
.i_176
	ld	a,l
	cp	#(1% 256)
	jp	z,i_177
	cp	#(2% 256)
	jp	z,i_178
	cp	#(3% 256)
	jp	z,i_179
	cp	#(4% 256)
	jp	z,i_180
	jp	i_181
.i_177
.i_178
.i_179
.i_180
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_175
.i_181
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
.i_175
	call	_extra_enems_init
	jp	i_171
.i_172
	call	_hook_entering
	ret



._platform_get_player
	ld a, 1
	ld (_player+25), a
	ld a, (_en_ccy)
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
	ld (_gpyy), a
	ld a, (__en_my)
	call Ashl16_HL
	call withSign
	ld (_ptgmy), hl
	ret



._enems_kill
	ld	hl,(__en_t)
	ld	h,0
	ld	a,l
	ld	(_enemy_died),a
	ld a, (_en_ccx)
	ld (_rdx), a
	ld a, (_en_ccy)
	ld (_rdy), a
	call _render_this_enemy
	call SPUpdateNow
	ld	hl,10 % 256	;const
	call	_play_sfx
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
	jp	i_184
.i_182
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_184
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_183
	jp	nc,i_183
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
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
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(32 % 256)
	jp	nz,i_185
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
	jp	nz,i_186
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_186
.i_185
	ld	hl,__en_t
	ld	a,(hl)
	and	#(16 % 256)
	jp	z,i_187
	ld	l,a
	ld	h,0
	jp	i_188
.i_187
	ld	a,(__en_t)
	and	a
	jp	z,i_189
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
	jp	z,i_190
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ule
	jp	nc,i_191
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
.i_191
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
.i_190
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
	jp	nz,i_193
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_193
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_194_i_193
.i_193
	jp	i_192
.i_194_i_193
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
	ld a, (_en_ccy)
	ld c, a
	ld a, (_gpy)
	add 17
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (_en_ccy)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	jr moving_platforms_vert_done
	.moving_platforms_vert_down
	ld a, (_en_ccy)
	ld c, a
	ld a, (_gpy)
	add 20
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 13
	ld c, a
	ld a, (_en_ccy)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	.moving_platforms_vert_done
	.moving_platforms_horz
	ld a, (__en_mx)
	or a
	jr z, moving_platforms_done
	ld a, (_en_ccy)
	ld c, a
	ld a, (_gpy)
	add 16
	cp c
	jr c, moving_platforms_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (_en_ccy)
	cp c
	jr c, moving_platforms_done
	ld a, (_player+9)
	bit 7, a
	jr nz, moving_platforms_done
	call _platform_get_player
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_state
	add hl, bc
	ld a, (hl)
	cp 32
	jr z, moving_platforms_done
	ld a, (__en_mx)
	call Ashl16_HL
	call withSign
	ld (_ptgmx), hl
	.moving_platforms_done
	jp	i_195
.i_192
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_197
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_197
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_197
	jr	c,i_198_i_197
.i_197
	jp	i_196
.i_198_i_197
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ult
	jp	nc,i_200
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jp	nc,i_200
	ld	hl,(__en_t)
	ld	h,0
	ex	de,hl
	ld	hl,(_player_min_killable)
	ld	h,0
	call	l_uge
	jp	nc,i_200
	ld	a,(__en_t)
	cp	#(6 % 256)
	jr	z,i_201_i_200
	jr	c,i_201_i_200
.i_200
	jp	i_199
.i_201_i_200
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
	ld	hl,65216	;const
	ld	(_player+8),hl
	call	_enems_kill
	jp	i_202
.i_199
	ld	a,(_player+23)
	cp	#(0 % 256)
	jp	nz,i_204
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(32 % 256)
	jp	nz,i_205
	ld	a,(_paralyzed_dont_kill)
	cp	#(0 % 256)
	jp	nz,i_204
.i_205
	jr	i_207_i_204
.i_204
	jp	i_203
.i_207_i_204
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
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,2 % 256	;const
	ld	a,l
	ld	(_player_just_died),a
	call	_player_flicker
.i_203
.i_202
.i_196
.i_195
	call	_extra_enems_checks
.i_189
.i_188
.i_208
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
	jp	i_182
.i_183
	ret



._override_flick_up
	ld hl, 0
	ld a, (_n_pant)
	cp 72
	ret c
	cp 84
	ret nc
	ld (_player + 8), hl
	inc hl
	; ret
	ret



._override_flick_down
	ld	hl,0 % 256	;const
	ret



._override_flick_left
	ld hl, 0
	ld a, (_n_pant)
	cp 72
	jr nz, ofl_nothub
	.ofl_hub
	ld hl, 1
	ld a, l
	ld (_new_level), a
	ld a, (_gpy)
	cp 48
	jr c, jump_level_1
	.jump_level_0
	xor a
	ld (_level), a
	ret
	.jump_level_1
	ld a, 1
	ld (_level), a
	ret
	.ofl_nothub
	cp 84
	ret nz
	.ofl_do
	add 11
	ld (_n_pant), a
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	ld hl, 1
	;ret
	ret



._override_flick_right
	ld hl, 0
	ld a, (_n_pant)
	cp 72
	jr nz, ofr_nothub
	.ofr_hub
	ld hl, 1
	ld a, l
	ld (_new_level), a
	ld a, (_gpy)
	cp 48
	jr c, jump_level_3
	.jump_level_2
	ld a, 2
	ld (_level), a
	ret
	.jump_level_3
	ld a, 3
	ld (_level), a
	ret
	.ofr_nothub
	cp 95
	ret nz
	.ofr_do
	sub 11
	ld (_n_pant), a
	xor a
	ld (_gpx), a
	ld (_player), hl
	inc hl
	; ret
	ret



._main
	di
	ld sp, 61936
	call musicstart
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
	ld	hl,43 % 256	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,60795	;const
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
	ld	hl,4 % 256	;const
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
	jp	i_211
.i_209
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_211
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_210
	jp	nc,i_210
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
	jp	i_209
.i_210
	.fix_sprites
	ld b, 8
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
	call	_hook_system_inits
.i_212
	call	_cortina
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
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_game_loop_flag),a
	call	_hook_init_game
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_half_life),a
	ld a, 255
	ld (_objs_old), a
	ld (_life_old), a
	ld (_keys_old), a
	ld (_killed_old), a
	ld (_item_old), a
	ld (_ezg_old), a
	ld (_coins_old), a
	ld (_on_pant), a
.i_214
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_215
	call	_hook_init_mainloop
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_player_just_died),a
	ld a, (_n_pant)
	ld c, a
	ld a, (_on_pant)
	cp c
	jr z, ml_ud_skip
	call _draw_scr
	ld a, (_n_pant)
	ld (_on_pant), a
	.ml_ud_skip
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_216
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_217
	or	l
	jp	z,i_217
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_218
.i_217
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_218
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
.i_216
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_219
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
.i_219
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
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
.i_222
	ld	a,l
	cp	#(2% 256)
	jp	z,i_223
	cp	#(3% 256)
	jp	z,i_224
	jp	i_221
.i_223
	ld	hl,_player+28
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6 % 256	;const
	call	_play_sfx
	jp	i_221
.i_224
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	inc	hl
	inc	hl
	inc	hl
	pop	de
	call	l_pint
	ld	hl,(_player+29)
	ld	de,99	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_225
	ld	hl,99	;const
	ld	(_player+29),hl
.i_225
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,6 % 256	;const
	call	_play_sfx
.i_221
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_226
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
	push	hl
	ld	hl,_rdi
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
.i_226
	._hotspots_done
	call	_hook_mainloop
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
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_228
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_229_i_228
.i_228
	jp	i_227
.i_229_i_228
	call _override_flick_left
	xor a
	or l
	jr nz, flick_left_done
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_230
.i_227
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_232
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_233_i_232
.i_232
	jp	i_231
.i_233_i_232
	call _override_flick_right
	xor a
	or l
	jr nz, flick_right_done
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_231
.i_230
	ld	hl,(_player+1+1)
	ld	de,65024	;const
	call	l_eq
	jp	nc,i_235
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_235
	ld	a,(_n_pant)
	cp	#(12 % 256)
	jr	z,i_235_uge
	jp	c,i_235
.i_235_uge
	jr	i_236_i_235
.i_235
	jp	i_234
.i_236_i_235
	ld	hl,_player+8
	ld	(hl),#(65216 % 256)
	inc	hl
	ld	(hl),#(65216 / 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call _override_flick_up
	xor a
	or l
	jr nz, flick_up_done
	ld a, (_n_pant)
	sub 12
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_237
.i_234
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_239
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_240_i_239
.i_239
	jp	i_238
.i_240_i_239
	call _override_flick_down
	xor a
	or l
	jr nz, flick_down_done
	ld a, (_n_pant)
	add 12
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_238
.i_237
	ld	a,(_game_loop_flag)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_241
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_241
	ld	a,(_player+36)
	and	a
	jp	z,i_242
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_243
	or	l
	jp	z,i_243
.i_243
.i_242
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_245
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_244
.i_245
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_244
	jp	i_214
.i_215
	jp	i_212
.i_213
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
	DEFB 8 ; Song length * 2
	DEFW 12 ; Offset to start of song (length of instrument table)
	DEFB 1 ; Multiple
	DEFW 10 ; Detune
	DEFB 0 ; Phase
	DEFB 1 ; Multiple
	DEFW 5 ; Detune
	DEFB 1 ; Phase
	DEFB 0 ; Multiple
	DEFW 20 ; Detune
	DEFB 0 ; Phase
	.PATTERNDATA DEFW PAT0
	DEFW PAT0
	DEFW PAT1
	DEFW PAT1
	; *** Pattern data - $00 marks the end of a pattern ***
	PAT0:
	DEFB $BD,0
	DEFB 154
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 154
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 154
	DEFB 147
	DEFB 124
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 154
	DEFB 147
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 154
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 154
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 124
	DEFB 2
	DEFB 152
	DEFB 145
	DEFB 3
	DEFB 152
	DEFB 145
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 152
	DEFB 145
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB $BD,2
	DEFB 152
	DEFB 145
	DEFB 120
	DEFB 2
	DEFB 157
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 124
	DEFB 2
	DEFB 157
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 157
	DEFB 150
	DEFB 126
	DEFB 2
	DEFB 157
	DEFB 150
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 157
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 159
	DEFB 152
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 120
	DEFB 2
	DEFB 159
	DEFB 152
	DEFB 3
	DEFB $BD,0
	DEFB 159
	DEFB 152
	DEFB 121
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 126
	DEFB 2
	DEFB 159
	DEFB 152
	DEFB 122
	DEFB 2
	DEFB 159
	DEFB 152
	DEFB 124
	DEFB 2
	DEFB 188
	DEFB 152
	DEFB 122
	DEFB 2
	DEFB 159
	DEFB 152
	DEFB 123
	DEFB 2
	DEFB $00
	PAT1:
	DEFB $BD,4
	DEFB 166
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 166
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 166
	DEFB 147
	DEFB 124
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 166
	DEFB 147
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 166
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 166
	DEFB 147
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 124
	DEFB 2
	DEFB 164
	DEFB 145
	DEFB 3
	DEFB 164
	DEFB 145
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 164
	DEFB 145
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 164
	DEFB 145
	DEFB 120
	DEFB 2
	DEFB 169
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 124
	DEFB 2
	DEFB 169
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 169
	DEFB 150
	DEFB 126
	DEFB 2
	DEFB 169
	DEFB 150
	DEFB 126
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 3
	DEFB 169
	DEFB 150
	DEFB 120
	DEFB 2
	DEFB 171
	DEFB 152
	DEFB 120
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 120
	DEFB 2
	DEFB 171
	DEFB 152
	DEFB 3
	DEFB 171
	DEFB 152
	DEFB 121
	DEFB 2
	DEFB 188
	DEFB 188
	DEFB 126
	DEFB 2
	DEFB 171
	DEFB 152
	DEFB 122
	DEFB 2
	DEFB 171
	DEFB 152
	DEFB 124
	DEFB 2
	DEFB 188
	DEFB 152
	DEFB 122
	DEFB 2
	DEFB 171
	DEFB 152
	DEFB 123
	DEFB 2
	DEFB $00
;	SECTION	text

.i_1
	defm	"ELIGE UN NUEVO PODEWWR"
	defb	0

	defm	"REINA DEL"
	defb	0

	defm	"SALIR"
	defb	0

	defm	"LEVEL CLEAR!"
	defb	0

	defm	"KICK ASSES"
	defb	0

	defm	"CONTINUE ?%  1/ YES%  2/ NO"
	defb	0

	defm	"1 POAQ%2 KEMPSTON%3 SINCLAIR"
	defb	0

	defm	" OLE ESE TOTO RUMBOSO%LAS HORD"
	defm	"AS MONSTRUOSAS% AHORA CHUPAN B"
	defm	"ALDOSA"
	defb	0

	defm	"GAME OVER!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._disable_slippery	defs	1
._hotspots_semaphore	defs	1
._sp_moviles	defs	6
.__en_x1	defs	1
.__en_y1	defs	1
.__en_x2	defs	1
.__en_y2	defs	1
._master_of_keys	defs	1
._spritesClip	defs	2
._hotspot_t	defs	1
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
._ramiro_hover	defs	1
._enem_may_be_paralyzed	defs	3
._gp_gen_org	defs	2
._enemy_died	defs	1
._player_min_killable	defs	1
._killed_old	defs	1
._resonators_ct	defs	1
._ezg_old	defs	1
._resonators_on	defs	1
._level	defs	1
._levels_finished	defs	1
._tileset_mappings	defs	2
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._ls	defs	1
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._player_just_died	defs	1
._sp_player	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad_this_frame	defs	1
._button_jump	defs	1
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
._rdt1	defs	1
._rdt2	defs	1
._playing	defs	1
._gpit	defs	1
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
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._resct_old	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	44
._jetpac_frame_counter	defs	1
._rda	defs	1
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
._resonators_frames	defs	1
._new_level	defs	1
._enoffsmasi	defs	2
._game_loop_flag	defs	1
._continue_on	defs	1
._latest_hotspot	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._is128k	defs	1
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
._paralyzed_dont_kill	defs	1
._p_got_bellota	defs	1
._p_bellotas	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	__en_t
	LIB	sp_ScreenStr
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_ay_player_on
	defc	_ay_player_on	=	23297
	XDEF	_hotspots
	XDEF	_power_desc0
	XDEF	_draw_scr
	XDEF	_power_desc1
	XDEF	_power_desc2
	XDEF	_power_desc3
	XDEF	_power_desc4
	XDEF	_disable_slippery
	LIB	sp_PixelUp
	XDEF	_power_desc5
	XDEF	_abs_a
	XDEF	_arkos_play_music
	LIB	sp_JoyFuller
	XDEF	_hotspots_semaphore
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
	XDEF	_master_of_keys
	XDEF	_cortina
	LIB	sp_Border
	XDEF	_power_descs
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
	XDEF	_power_name0
	XDEF	_power_name1
	XDEF	_en_cx
	XDEF	_en_cy
	XDEF	_power_name2
	XDEF	_power_name3
	XDEF	_power_name4
	XDEF	_adjust_to_tile_x
	XDEF	_en_an_state
	defc	_en_an_state	=	23648
	XDEF	_adjust_to_tile_y
	XDEF	_override_flick_up
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
	XDEF	_ramiro_hover
	XDEF	_enable_power
	XDEF	_beepet
	XDEF	_play_sfx
	XDEF	_power_names
	XDEF	_en_an_morido
	defc	_en_an_morido	=	23618
	XDEF	_enem_may_be_paralyzed
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
	XDEF	_resonators_ct
	LIB	sp_SetMousePosSim
	XDEF	_ini_x
	XDEF	_ini_y
	LIB	sp_ClearRect
	XDEF	_ezg_old
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	XDEF	_resonators_on
	XDEF	_select_power
	LIB	sp_ListAppend
	XDEF	_level
	XDEF	_levels_finished
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_tileset_mappings
	XDEF	_t_alt
	XDEF	_pad_read
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
	XDEF	_ls
	XDEF	_clear_game_area
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_fall_box
	XDEF	_pant_final
	XDEF	_s_marco
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_11_a
	XDEF	_enemy_killer
	XDEF	_sprite_11_b
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_two_points_attr
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_draw_and_advance
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
	XDEF	_extra_sprite_17_a
	XDEF	_extra_sprite_17_b
	XDEF	_extra_sprite_18_a
	XDEF	_extra_sprite_18_b
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_qtile
	XDEF	_player_just_died
	XDEF	_init_cerrojos
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
	XDEF	_button_jump
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_update_bellotas
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
	XDEF	_ISR
	LIB	sp_IntRect
	LIB	sp_ListLast
	XDEF	_scr_ini
	LIB	sp_ListCurr
	XDEF	_init_malotes
	XDEF	_enit
	XDEF	_collide_enem
	XDEF	_hook_mainloop
	XDEF	_reset_game
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
	XDEF	_line_of_text_clear
	LIB	sp_RemoveDList
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23633
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23639
	XDEF	_gpit
	XDEF	_hub_signs_x
	XDEF	_hub_signs_y
	XDEF	_player_cells
	XDEF	_hook_entering
	LIB	sp_ListNext
	XDEF	_tilemaps
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
	XDEF	_override_flick_right
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
	LIB	sp_MoveSprAbsNC
	XDEF	_clear_cerrojo
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	__x2
	LIB	sp_ListAdd
	XDEF	__y2
	LIB	sp_KeyPressed
	XDEF	_step
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_hook_init_game
	XDEF	_prxx
	LIB	sp_CompDListAddr
	XDEF	_pryy
	XDEF	_calc_hotspot_ptr
	XDEF	_u_free
	XDEF	_abs
	XDEF	_override_flick_left
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_override_flick_down
	XDEF	_set_block
	XDEF	_resct_old
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
	XDEF	_sprite_2_a
	XDEF	_sprite_2_b
	XDEF	_rda
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
	XDEF	_sprite_4_a
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_en_tocado
	XDEF	_init_player_values
	XDEF	_sprite_4_b
	XDEF	_sprite_5_a
	XDEF	_sprite_5_b
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sprite_6_a
	LIB	sp_Initialize
	XDEF	_sprite_6_b
	XDEF	_sprite_7_a
	XDEF	_sprite_7_b
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_tileset
	XDEF	_sprite_8_a
	LIB	sp_ComputePos
	XDEF	_sprite_8_b
	XDEF	_sprite_9_a
	XDEF	_arkos_stop_sound
	XDEF	_bitmask
	XDEF	_sprite_9_b
	XDEF	_draw_2_digits
	XDEF	_resonators_frames
	XDEF	_new_level
	XDEF	_level_finished
	XDEF	_player_flicker
	XDEF	_init_hotspots
	XDEF	_enoffsmasi
	XDEF	_game_loop_flag
	LIB	sp_IntIntervals
	XDEF	_continue_on
	XDEF	_my_malloc
	LIB	sp_inp
	XDEF	_power_on
	XDEF	_latest_hotspot
	XDEF	_set_hotspot
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_asm_int
	XDEF	_hotspot_paint
	LIB	sp_IntPtInterval
	LIB	sp_RegisterHookFirst
	XDEF	__baddies_pointer
	XDEF	_calc_baddies_pointer
	LIB	sp_HashLookup
	XDEF	_any_key
	LIB	sp_PFill
	XDEF	_is128k
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
	XDEF	_pezon_incs
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_paralyzed_dont_kill
	XDEF	_render_all_sprites
	XDEF	_unpack
	LIB	sp_IterateDList
	XDEF	_p_got_bellota
	XDEF	_draw_scr_background
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	XDEF	_paint_sign
	XDEF	_p_bellotas
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
