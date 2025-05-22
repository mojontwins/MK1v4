;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu May 22 18:15:36 2025



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
	defb	4

	defm	""
	defb	1

	defm	""
	defb	8

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
	defb	4

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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

	._spritesClip
	defb 2, 0, 20, 30
	._asm_number
	defb 0
	._asm_int
	defw 0
	._asm_int_2
	defw 0
	._seed
	defw 0
;	SECTION	text

._level
	defm	""
	defb	0

;	SECTION	code


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

._unpack
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	ld	a,h
	or	l
	jp	z,i_8
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	ld	(_address),hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_destination),hl
	ld hl, (_address)
	ld de, (_destination)
	call depack
.i_8
	ret


	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"

._blackout
	ld hl, 22528
	ld (hl), 0
	push hl
	pop de
	inc de
	ld bc, 767
	ldir
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

	defm	"3331331"
	defb	19

	defm	"333"
	defb	243

	defm	"33"
	defb	18

	defm	"331"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	5

	defm	""
	defb	0

	defm	""
	defb	4

	defm	" "
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

	defm	"awww "
	defb	1

	defm	"@"
	defb	0

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	0

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
	defb	148

	defm	""
	defb	4

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
	defb	9

	defm	""
	defb	208

	defm	""
	defb	217

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	"UUUP"
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

	defm	"!"
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
	defb	0

	defm	"3331330"
	defb	3

	defm	"333!"
	defb	17

	defm	"3"
	defb	0

	defm	"#3333"
	defb	17

	defm	"0"
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
	defb	6

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
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

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

	defm	"`"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"`"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	212

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
	defb	217

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
	defb	5

	defm	"UUP@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"UUU"
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"UUUP"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"UUUU"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	"`"
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"#3330"
	defb	0

	defm	""
	defb	0

	defm	"a3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	17

	defm	"UUP"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	21

	defm	"UUP"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"UUUP"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	21

	defm	"UUU"
	defb	16

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	209

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	217

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	217

	defm	""
	defb	145

	defm	""
	defb	19

	defm	"33"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"33"
	defb	19

	defm	"3331#333333"
	defb	17

	defm	"333333"
	defb	193

	defm	""
	defb	28

	defm	"33333"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	188

	defm	"333333"
	defb	17

	defm	""
	defb	17

	defm	"3333323333333"
	defb	19

	defm	"333333"
	defb	17

	defm	"3333333"
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

	defm	"D"
	defb	132

	defm	"D"
	defb	132

	defm	"D"
	defb	132

	defm	""
	defb	0

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
	defb	212

	defm	""
	defb	1

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
	defb	208

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
	defb	26

	defm	""
	defb	3

	defm	"333331"
	defb	0

	defm	"333333"
	defb	23

	defm	"s333331"
	defb	17

	defm	""
	defb	19

	defm	"33333"
	defb	16

	defm	""
	defb	3

	defm	"333331"
	defb	0

	defm	""
	defb	1

	defm	"33333"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	17

	defm	"33333 "
	defb	1

	defm	"33"
	defb	19

	defm	"331"
	defb	0

	defm	"#33333"
	defb	16

	defm	""
	defb	3

	defm	"3333"
	defb	19

	defm	"1"
	defb	0

	defm	"333333"
	defb	16

	defm	"s33"
	defb	19

	defm	"33"
	defb	193

	defm	""
	defb	1

	defm	""
	defb	19

	defm	"3333U"
	defb	16

	defm	""
	defb	2

	defm	"3"
	defb	19

	defm	"332"
	defb	18

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"33333"
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
	defb	12

	defm	""
	defb	12

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
	defb	176

	defm	""
	defb	176

	defm	""
	defb	0

	defm	"`"
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
	defb	19

	defm	"3330"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"3333"
	defb	0

	defm	"d"
	defb	0

	defm	""
	defb	19

	defm	"3130"
	defb	0

	defm	"`"
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	28

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	225

	defm	""
	defb	19

	defm	"333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#3230"
	defb	0

	defm	"@"
	defb	1

	defm	"3332"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"33333333"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	154

	defm	""
	defb	19

	defm	"3330"
	defb	13

	defm	""
	defb	153

	defm	""
	defb	1

	defm	"3333"
	defb	13

	defm	""
	defb	154

	defm	""
	defb	144

	defm	"#"
	defb	19

	defm	"33"
	defb	29

	defm	""
	defb	153

	defm	""
	defb	10

	defm	""
	defb	1

	defm	"3331"
	defb	154

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"#333)"
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3331"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	19

	defm	"13"
	defb	25

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3331"
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"#33333313333333"
	defb	28

	defm	"3333331"
	defb	19

	defm	"33333"
	defb	17

	defm	""
	defb	19

	defm	"33333313333333#13333313333333"
	defb	19

	defm	"33"
	defb	23

	defm	"wwwq33"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"333333"
	defb	16

	defm	""
	defb	3

	defm	"33333"
	defb	17

	defm	""
	defb	0

	defm	"33333;"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	19

	defm	"3331"
	defb	17

	defm	""
	defb	0

	defm	"333333"
	defb	16

	defm	""
	defb	3

	defm	"333331"
	defb	0

	defm	"333333"
	defb	16

	defm	""
	defb	3

	defm	"333331"
	defb	0

	defm	"ww"
	defb	183

	defm	"www"
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
	defb	18

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"333331"
	defb	0

	defm	""
	defb	19

	defm	"33333 "
	defb	2

	defm	"333331"
	defb	0

	defm	""
	defb	19

	defm	"33332"
	defb	16

	defm	""
	defb	1

	defm	"33c331"
	defb	0

	defm	""
	defb	19

	defm	"33333"
	defb	16

	defm	""
	defb	1

	defm	"333331"
	defb	0

	defm	""
	defb	19

	defm	"33333"
	defb	16

	defm	""
	defb	1

	defm	"3"
	defb	23

	defm	"wwwq"
	defb	0

	defm	"#1"
	defb	17

	defm	"!"
	defb	17

	defm	"!"
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
	defb	7

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	7

	defm	""
	defb	217

	defm	""
	defb	0

	defm	""
	defb	13

	defm	"p"
	defb	0

	defm	"t"
	defb	215

	defm	""
	defb	218

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	173

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	217

	defm	""
	defb	217

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	157

	defm	""
	defb	13

	defm	""
	defb	154

	defm	""
	defb	169

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	160

	defm	""
	defb	170

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	225

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	"`#3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"33"
	defb	19

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	27

	defm	"3330"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	17

	defm	"332"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	"B3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	23

	defm	"wwr0"
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

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#331 "
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

	defm	""
	defb	19

	defm	"3'w"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"31"
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
	defb	17

	defm	"333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"3332"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	19

	defm	"3"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	20

	defm	""
	defb	0

	defm	""
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
	defb	208

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

	defm	"! "
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	""
	defb	14

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
	defb	13

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
	defb	157

	defm	""
	defb	183

	defm	"wq"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	218

	defm	""
	defb	154

	defm	""
	defb	221

	defm	""
	defb	221

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

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
	defb	9

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"ww"
	defb	221

	defm	"}"
	defb	157

	defm	""
	defb	169

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	169

	defm	""
	defb	154

	defm	""
	defb	144

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3"
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
	defb	0

	defm	""
	defb	19

	defm	"33333 "
	defb	1

	defm	"333331"
	defb	0

	defm	"#33333"
	defb	16

	defm	""
	defb	1

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"1!"
	defb	18

	defm	""
	defb	0

	defm	"#33333"
	defb	16

	defm	""
	defb	1

	defm	"333332"
	defb	0

	defm	"#33333"
	defb	16

	defm	""
	defb	1

	defm	"31"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"#33333"
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

	defm	"@"
	defb	0

	defm	"d"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	198

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"d"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"F"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"d"
	defb	180

	defm	"LF"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"fff"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	18

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
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	4

	defm	""
	defb	226

	defm	"3>33"
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3333"
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	21

	defm	"335P"
	defb	6

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	"31"
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	"31"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"33"
	defb	227

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3331"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	19

	defm	"33>"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	">331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	16

	defm	""
	defb	7

	defm	"w"
	defb	1

	defm	"UWwq"
	defb	0

	defm	"UP"
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
	defb	2

	defm	""
	defb	20

	defm	"@"
	defb	0

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	170

	defm	""
	defb	161

	defm	""
	defb	221

	defm	"@"
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	160

	defm	""
	defb	0

	defm	")"
	defb	157

	defm	"D"
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
	defb	170

	defm	""
	defb	166

	defm	"`"
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
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"DHD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	4

	defm	"M"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	212

	defm	"HB"
	defb	4

	defm	""
	defb	221

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	169

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	20

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	169

	defm	""
	defb	160

	defm	""
	defb	169

	defm	""
	defb	154

	defm	""
	defb	145

	defm	""
	defb	218

	defm	""
	defb	154

	defm	""
	defb	160

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	160

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	132

	defm	"D"
	defb	132

	defm	"D"
	defb	132

	defm	"@-"
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

	defm	"!"
	defb	153

	defm	""
	defb	170

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	170

	defm	""
	defb	157

	defm	""
	defb	217

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	153

	defm	""
	defb	1

	defm	"333331"
	defb	0

	defm	"!"
	defb	19

	defm	"3333 "
	defb	1

	defm	"3#3331"
	defb	0

	defm	""
	defb	19

	defm	"333"
	defb	195

	defm	"3 "
	defb	1

	defm	"333;31"
	defb	0

	defm	""
	defb	243

	defm	"3;<"
	defb	188

	defm	"3"
	defb	240

	defm	""
	defb	17

	defm	""
	defb	19

	defm	";"
	defb	188

	defm	""
	defb	188

	defm	""
	defb	187

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	28

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
	defb	217

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
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	170

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

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	132

	defm	"H@"
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
	defb	221

	defm	""
	defb	221

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	157

	defm	"@$"
	defb	132

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	157

	defm	"M"
	defb	221

	defm	""
	defb	217

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	157

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

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
	defb	170

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	19

	defm	"3"
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3"
	defb	227

	defm	"33"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	19

	defm	"3330`"
	defb	0

	defm	""
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3"
	defb	19

	defm	"30"
	defb	0

	defm	""
	defb	0

	defm	"O3333"
	defb	132

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	17

	defm	"333="
	defb	212

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"3L"
	defb	177

	defm	"D"
	defb	153

	defm	""
	defb	212

	defm	"D"
	defb	28

	defm	"M"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	153

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	170

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

	defm	"#333"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"33<"
	defb	177

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"1"
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
	defb	1

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	20

	defm	"HHL"
	defb	20

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

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

	defm	""
	defb	132

	defm	""
	defb	132

	defm	")"
	defb	170

	defm	""
	defb	169

	defm	""
	defb	153

	defm	""
	defb	170

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	209

;	SECTION	code


;	SECTION	text

._cerrojos
	defb	0
	defb	8
	defb	8
	defb	0
	defb	26
	defb	1
	defb	5
	defb	0
	defb	26
	defb	13
	defb	5
	defb	0
	defb	28
	defb	6
	defb	5
	defb	0

;	SECTION	code

	._tileset
	BINARY "ts.bin"
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_a
	defb 15, 224
	defb 15, 0
	defb 220, 0
	defb 154, 0
	defb 250, 0
	defb 99, 0
	defb 4, 0
	defb 11, 192
	defb 19, 192
	defb 16, 192
	defb 3, 192
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 2, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_b
	defb 128, 31
	defb 192, 15
	defb 0, 15
	defb 160, 15
	defb 160, 15
	defb 192, 15
	defb 0, 15
	defb 96, 15
	defb 64, 15
	defb 0, 31
	defb 192, 31
	defb 192, 31
	defb 192, 7
	defb 240, 3
	defb 248, 3
	defb 240, 3
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
	defb 7, 224
	defb 15, 224
	defb 12, 0
	defb 218, 0
	defb 154, 0
	defb 243, 0
	defb 100, 0
	defb 11, 0
	defb 11, 224
	defb 8, 224
	defb 11, 224
	defb 3, 224
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 2, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_2_b
	defb 128, 31
	defb 192, 15
	defb 0, 15
	defb 160, 15
	defb 160, 15
	defb 192, 15
	defb 0, 31
	defb 64, 15
	defb 96, 15
	defb 0, 15
	defb 192, 31
	defb 192, 31
	defb 192, 7
	defb 240, 3
	defb 248, 3
	defb 240, 3
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
	defb 15, 0
	defb 223, 0
	defb 156, 0
	defb 250, 0
	defb 98, 0
	defb 3, 0
	defb 12, 192
	defb 19, 192
	defb 19, 192
	defb 0, 192
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 3, 248
	defb 2, 248
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 128, 31
	defb 192, 15
	defb 0, 15
	defb 160, 15
	defb 160, 15
	defb 192, 15
	defb 0, 15
	defb 96, 15
	defb 64, 15
	defb 0, 31
	defb 192, 31
	defb 192, 31
	defb 192, 7
	defb 240, 3
	defb 248, 3
	defb 240, 3
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
	defb 28, 128
	defb 54, 128
	defb 62, 128
	defb 29, 128
	defb 7, 128
	defb 59, 0
	defb 127, 0
	defb 95, 0
	defb 111, 0
	defb 95, 0
	defb 111, 0
	defb 59, 0
	defb 7, 128
	defb 11, 224
	defb 5, 224
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_4_b
	defb 0, 7
	defb 112, 3
	defb 248, 1
	defb 236, 1
	defb 212, 1
	defb 236, 1
	defb 248, 1
	defb 224, 1
	defb 252, 0
	defb 246, 0
	defb 234, 0
	defb 182, 0
	defb 188, 0
	defb 216, 1
	defb 128, 3
	defb 0, 63
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
	defb 1, 248
	defb 3, 240
	defb 0, 240
	defb 5, 240
	defb 5, 240
	defb 3, 240
	defb 0, 240
	defb 6, 240
	defb 2, 240
	defb 0, 248
	defb 3, 248
	defb 3, 248
	defb 3, 224
	defb 15, 192
	defb 31, 192
	defb 15, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_5_b
	defb 240, 7
	defb 240, 0
	defb 59, 0
	defb 89, 0
	defb 95, 0
	defb 198, 0
	defb 32, 0
	defb 208, 3
	defb 200, 3
	defb 8, 3
	defb 192, 3
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 64, 31
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
	defb 1, 248
	defb 3, 240
	defb 0, 240
	defb 5, 240
	defb 5, 240
	defb 3, 240
	defb 0, 248
	defb 2, 240
	defb 6, 240
	defb 0, 240
	defb 3, 248
	defb 3, 248
	defb 3, 224
	defb 15, 192
	defb 31, 192
	defb 15, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_6_b
	defb 224, 7
	defb 240, 7
	defb 48, 0
	defb 91, 0
	defb 89, 0
	defb 207, 0
	defb 38, 0
	defb 208, 0
	defb 208, 7
	defb 16, 7
	defb 208, 7
	defb 192, 7
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 64, 31
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
	defb 1, 248
	defb 3, 240
	defb 0, 240
	defb 5, 240
	defb 5, 240
	defb 3, 240
	defb 0, 240
	defb 6, 240
	defb 2, 240
	defb 0, 248
	defb 3, 248
	defb 3, 248
	defb 3, 224
	defb 15, 192
	defb 31, 192
	defb 15, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_7_b
	defb 240, 0
	defb 251, 0
	defb 57, 0
	defb 95, 0
	defb 70, 0
	defb 192, 0
	defb 48, 3
	defb 200, 3
	defb 200, 3
	defb 0, 3
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 192, 31
	defb 64, 31
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
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 254
	defb 0, 224
	defb 13, 192
	defb 31, 192
	defb 29, 192
	defb 10, 192
	defb 13, 224
	defb 15, 224
	defb 7, 224
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
	defb 0, 255
	defb 0, 255
	._sprite_8_b
	defb 0, 255
	defb 0, 255
	defb 0, 15
	defb 96, 7
	defb 208, 3
	defb 248, 3
	defb 80, 3
	defb 160, 7
	defb 224, 15
	defb 64, 7
	defb 144, 3
	defb 56, 3
	defb 16, 3
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
	defb	144
	defb	112
	defb	144
	defb	112
	defb	208
	defb	112
	defb	2
	defb	0
	defb	2
	defb	128
	defb	0
	defb	128
	defb	0
	defb	224
	defb	0
	defb	1
	defb	0
	defb	2
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	0
	defb	1
	defb	2
	defb	160
	defb	0
	defb	160
	defb	0
	defb	160
	defb	80
	defb	0
	defb	1
	defb	1
	defb	128
	defb	0
	defb	128
	defb	0
	defb	128
	defb	64
	defb	0
	defb	1
	defb	1
	defb	64
	defb	0
	defb	16
	defb	0
	defb	64
	defb	80
	defb	-2
	defb	2
	defb	2
	defb	128
	defb	112
	defb	128
	defb	112
	defb	176
	defb	112
	defb	1
	defb	0
	defb	3
	defb	176
	defb	0
	defb	176
	defb	0
	defb	176
	defb	32
	defb	0
	defb	1
	defb	1
	defb	16
	defb	0
	defb	16
	defb	0
	defb	16
	defb	64
	defb	0
	defb	2
	defb	1
	defb	208
	defb	32
	defb	128
	defb	32
	defb	208
	defb	32
	defb	-2
	defb	0
	defb	1
	defb	80
	defb	96
	defb	80
	defb	0
	defb	80
	defb	96
	defb	0
	defb	-1
	defb	3
	defb	48
	defb	0
	defb	48
	defb	0
	defb	48
	defb	80
	defb	0
	defb	1
	defb	2
	defb	96
	defb	0
	defb	96
	defb	0
	defb	96
	defb	64
	defb	0
	defb	1
	defb	2
	defb	80
	defb	16
	defb	48
	defb	16
	defb	80
	defb	96
	defb	-2
	defb	2
	defb	2
	defb	128
	defb	0
	defb	128
	defb	0
	defb	128
	defb	32
	defb	0
	defb	1
	defb	2
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	128
	defb	0
	defb	4
	defb	3
	defb	16
	defb	16
	defb	16
	defb	16
	defb	128
	defb	16
	defb	2
	defb	0
	defb	1
	defb	32
	defb	0
	defb	32
	defb	0
	defb	112
	defb	0
	defb	2
	defb	0
	defb	1
	defb	208
	defb	128
	defb	64
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	176
	defb	112
	defb	176
	defb	64
	defb	176
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	144
	defb	48
	defb	64
	defb	48
	defb	144
	defb	96
	defb	-2
	defb	2
	defb	2
	defb	160
	defb	128
	defb	16
	defb	128
	defb	160
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	16
	defb	112
	defb	16
	defb	112
	defb	112
	defb	112
	defb	1
	defb	0
	defb	1
	defb	160
	defb	16
	defb	128
	defb	16
	defb	160
	defb	16
	defb	-1
	defb	0
	defb	3
	defb	128
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	80
	defb	16
	defb	48
	defb	16
	defb	80
	defb	112
	defb	-2
	defb	2
	defb	3
	defb	112
	defb	48
	defb	112
	defb	16
	defb	192
	defb	48
	defb	2
	defb	-2
	defb	1
	defb	176
	defb	32
	defb	80
	defb	32
	defb	176
	defb	32
	defb	-2
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
	defb	64
	defb	96
	defb	64
	defb	0
	defb	64
	defb	96
	defb	0
	defb	-2
	defb	3
	defb	208
	defb	80
	defb	128
	defb	48
	defb	208
	defb	80
	defb	-1
	defb	-1
	defb	1
	defb	208
	defb	16
	defb	128
	defb	16
	defb	208
	defb	16
	defb	-2
	defb	0
	defb	2
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	144
	defb	0
	defb	2
	defb	3
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	128
	defb	0
	defb	2
	defb	3
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	112
	defb	0
	defb	1
	defb	1
	defb	208
	defb	96
	defb	144
	defb	96
	defb	208
	defb	128
	defb	-4
	defb	4
	defb	2
	defb	32
	defb	48
	defb	32
	defb	48
	defb	192
	defb	48
	defb	1
	defb	0
	defb	4
	defb	208
	defb	32
	defb	96
	defb	32
	defb	208
	defb	32
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	64
	defb	112
	defb	64
	defb	208
	defb	112
	defb	-2
	defb	2
	defb	2
	defb	32
	defb	48
	defb	32
	defb	48
	defb	144
	defb	48
	defb	1
	defb	0
	defb	4
	defb	112
	defb	32
	defb	48
	defb	32
	defb	112
	defb	32
	defb	-1
	defb	0
	defb	3
	defb	160
	defb	80
	defb	32
	defb	80
	defb	160
	defb	112
	defb	-2
	defb	2
	defb	2
	defb	64
	defb	112
	defb	64
	defb	64
	defb	64
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	32
	defb	32
	defb	32
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	4
	defb	160
	defb	0
	defb	48
	defb	0
	defb	160
	defb	16
	defb	-1
	defb	1
	defb	3
	defb	208
	defb	0
	defb	112
	defb	0
	defb	208
	defb	32
	defb	-1
	defb	1
	defb	2
	defb	16
	defb	0
	defb	16
	defb	0
	defb	48
	defb	48
	defb	2
	defb	2
	defb	3
	defb	160
	defb	64
	defb	128
	defb	0
	defb	160
	defb	64
	defb	-1
	defb	-1
	defb	1
	defb	160
	defb	0
	defb	112
	defb	0
	defb	160
	defb	48
	defb	-2
	defb	2
	defb	1
	defb	208
	defb	64
	defb	144
	defb	64
	defb	208
	defb	112
	defb	-1
	defb	1
	defb	2
	defb	16
	defb	16
	defb	16
	defb	16
	defb	32
	defb	128
	defb	2
	defb	2
	defb	3
	defb	16
	defb	112
	defb	16
	defb	112
	defb	96
	defb	112
	defb	1
	defb	0
	defb	3
	defb	16
	defb	80
	defb	16
	defb	16
	defb	16
	defb	80
	defb	0
	defb	-1
	defb	2
	defb	208
	defb	16
	defb	128
	defb	16
	defb	208
	defb	128
	defb	-4
	defb	4
	defb	3
	defb	208
	defb	48
	defb	16
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	128
	defb	64
	defb	128
	defb	64
	defb	128
	defb	128
	defb	0
	defb	1
	defb	1
	defb	16
	defb	80
	defb	16
	defb	80
	defb	96
	defb	128
	defb	2
	defb	2
	defb	3
	defb	16
	defb	80
	defb	16
	defb	80
	defb	192
	defb	80
	defb	1
	defb	0
	defb	4
	defb	160
	defb	64
	defb	48
	defb	64
	defb	160
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	208
	defb	0
	defb	208
	defb	0
	defb	224
	defb	144
	defb	3
	defb	3
	defb	2
	defb	192
	defb	112
	defb	32
	defb	112
	defb	192
	defb	112
	defb	-2
	defb	0
	defb	4
	defb	32
	defb	32
	defb	32
	defb	32
	defb	176
	defb	32
	defb	2
	defb	0
	defb	4
	defb	48
	defb	80
	defb	48
	defb	80
	defb	176
	defb	80
	defb	1
	defb	0
	defb	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	192
	defb	48
	defb	1
	defb	0
	defb	1
	defb	48
	defb	64
	defb	48
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	1
	defb	208
	defb	0
	defb	32
	defb	0
	defb	208
	defb	32
	defb	-2
	defb	2
	defb	2
	defb	208
	defb	112
	defb	112
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	1
	defb	32
	defb	128
	defb	32
	defb	16
	defb	32
	defb	128
	defb	0
	defb	-1
	defb	4
	defb	112
	defb	48
	defb	112
	defb	48
	defb	208
	defb	48
	defb	2
	defb	0
	defb	3
	defb	16
	defb	64
	defb	16
	defb	64
	defb	96
	defb	64
	defb	1
	defb	0
	defb	2
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	80
	defb	0
	defb	2
	defb	1
	defb	160
	defb	32
	defb	160
	defb	32
	defb	160
	defb	80
	defb	0
	defb	2
	defb	3
	defb	112
	defb	16
	defb	112
	defb	16
	defb	208
	defb	80
	defb	2
	defb	2
	defb	3
	defb	48
	defb	64
	defb	48
	defb	64
	defb	48
	defb	96
	defb	0
	defb	1
	defb	1
	defb	16
	defb	80
	defb	16
	defb	80
	defb	16
	defb	128
	defb	0
	defb	1
	defb	1
	defb	16
	defb	48
	defb	16
	defb	48
	defb	192
	defb	48
	defb	1
	defb	0
	defb	4
	defb	160
	defb	32
	defb	32
	defb	32
	defb	160
	defb	32
	defb	-1
	defb	0
	defb	2
	defb	144
	defb	96
	defb	112
	defb	96
	defb	144
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	192
	defb	80
	defb	192
	defb	16
	defb	192
	defb	80
	defb	0
	defb	-2
	defb	1
	defb	32
	defb	80
	defb	32
	defb	32
	defb	32
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
	defb	64
	defb	32
	defb	32
	defb	32
	defb	64
	defb	80
	defb	-2
	defb	2
	defb	1
	defb	128
	defb	48
	defb	128
	defb	0
	defb	128
	defb	48
	defb	0
	defb	-1
	defb	2
	defb	80
	defb	144
	defb	80
	defb	144
	defb	176
	defb	144
	defb	1
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
	defb	176
	defb	96
	defb	176
	defb	0
	defb	176
	defb	96
	defb	0
	defb	-2
	defb	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	2
	defb	3
	defb	128
	defb	32
	defb	128
	defb	32
	defb	128
	defb	96
	defb	0
	defb	2
	defb	1
	defb	96
	defb	80
	defb	0
	defb	80
	defb	96
	defb	80
	defb	-2
	defb	0
	defb	4
	defb	128
	defb	16
	defb	128
	defb	16
	defb	144
	defb	16
	defb	1
	defb	0
	defb	13

;	SECTION	code

;	SECTION	text

._hotspots
	defb	1
	defb	7
	defb	0
	defb	1
	defb	1
	defb	0
	defb	7
	defb	3
	defb	0
	defb	2
	defb	13
	defb	0
	defb	6
	defb	1
	defb	0
	defb	13
	defb	2
	defb	0
	defb	1
	defb	1
	defb	0
	defb	1
	defb	2
	defb	0
	defb	6
	defb	1
	defb	0
	defb	2
	defb	10
	defb	0
	defb	5
	defb	1
	defb	0
	defb	7
	defb	3
	defb	0
	defb	1
	defb	8
	defb	0
	defb	2
	defb	1
	defb	0
	defb	1
	defb	1
	defb	0
	defb	1
	defb	10
	defb	0
	defb	2
	defb	1
	defb	0
	defb	12
	defb	2
	defb	0
	defb	1
	defb	5
	defb	0
	defb	4
	defb	1
	defb	0
	defb	8
	defb	4
	defb	0
	defb	1
	defb	2
	defb	0
	defb	8
	defb	1
	defb	0
	defb	9
	defb	7
	defb	0
	defb	1
	defb	10
	defb	0
	defb	6
	defb	1
	defb	0
	defb	12
	defb	3
	defb	0
	defb	1
	defb	6
	defb	0
	defb	5
	defb	1
	defb	0
	defb	7
	defb	1
	defb	0

;	SECTION	code

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
	ld	de,_asm_int
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_pint
	ld a, (_asm_int)
	call playsfx
	ret



._attr
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_14
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_14
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,14	;const
	pop	de
	call	l_gt
	jp	c,i_14
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,9	;const
	pop	de
	call	l_gt
	jp	nc,i_13
.i_14
	ld	hl,0	;const
	ret


.i_13
	ld	hl,_map_attr
	push	hl
	ld	hl,6	;const
	call	l_gcharspsp	;
	ld	hl,6	;const
	call	l_gcharspsp	;
	ld	hl,4	;const
	pop	de
	call	l_asl
	pop	de
	add	hl,de
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gchar
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ret



._qtile
	ld	hl,_map_buff
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ret



._draw_coloured_tile
	push	bc
	push	bc
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,8	;const
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
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2048
	add	hl,de
	pop	de
	add	hl,de
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	inc	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	l,(hl)
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
	pop	bc
	pop	bc
	ret



._print_number2
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
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
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
	inc	hl
	push	hl
	ld	hl,7 % 256	;const
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



._draw_objs
	ld	hl,30 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,(_player+27)
	ld	h,0
	push	hl
	call	_print_number2
	pop	bc
	pop	bc
	pop	bc
	ret



._print_str
.i_16
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,(hl)
	and	a
	jp	z,i_17
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
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	bc,-32
	add	hl,bc
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_16
.i_17
	ret



._saca_a_todo_el_mundo_de_aqui
	ld	hl,(_sp_player)
	push	hl
	ld	hl,_spritesClip
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
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
	jp	i_20
.i_18
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_20
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_19
	jp	nc,i_19
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
	ld	hl,_spritesClip
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
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
	jp	i_18
.i_19
	ret



._render_sprites
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
	cp	#(3 % 256)
	jp	z,i_22
	jp	nc,i_22
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_enx),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_eny),a
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
	ld	hl,_spritesClip
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	call	l_gint	;
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,(_eny)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_enx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_enx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_eny)
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
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_pint
	jp	i_21
.i_22
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	c,i_25
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_24
.i_25
	ld	hl,(_sp_player)
	push	hl
	ld	hl,_spritesClip
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
	ld	de,0
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
	jp	i_27
.i_24
	ld	hl,(_sp_player)
	push	hl
	ld	hl,_spritesClip
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
.i_27
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ret


;	SECTION	text

._player_frames
	defw	_sprite_5_a
	defw	_sprite_6_a
	defw	_sprite_7_a
	defw	_sprite_8_a
	defw	_sprite_1_a
	defw	_sprite_2_a
	defw	_sprite_3_a
	defw	_sprite_4_a

;	SECTION	code

;	SECTION	text

._enem_frames
	defw	_sprite_9_a
	defw	_sprite_10_a
	defw	_sprite_11_a
	defw	_sprite_12_a
	defw	_sprite_13_a
	defw	_sprite_14_a
	defw	_sprite_15_a
	defw	_sprite_16_a

;	SECTION	code


._set_player_at
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	hl,_player
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
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



._init_player
	ld	hl,80 % 256	;const
	push	hl
	ld	hl,16 % 256	;const
	push	hl
	call	_set_player_at
	pop	bc
	pop	bc
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
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
	ld	hl,_player+26
	ld	(hl),#(99 % 256 % 256)
	ld	hl,_player+27
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+28
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+30
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+31
	ld	(hl),#(0 % 256 % 256)
	ld	hl,99 % 256	;const
	ld	a,l
	ld	(_pant_final),a
	ret



._collide
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_uge
	jp	nc,i_30
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_30
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_uge
	jp	nc,i_30
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_30
	ld	hl,1	;const
	jr	i_31
.i_30
	ld	hl,0	;const
.i_31
	ld	h,0
	ret



._srand
	ld	de,_seed
	ld	hl,4-2	;const
	add	hl,sp
	call	l_gint	;
	call	l_pint
	ret



._rand
	dec	sp
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
	ld hl, _asm_int
	ld a, e
	ld (hl), a
	inc hl
	ld a, d
	ld (hl), a
	;; Ahora [ASM_INT] = HL
	ld	hl,0	;const
	add	hl,sp
	ex	de,hl
	ld	hl,(_asm_int)
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	sp
	ret



._abs
	pop	bc
	pop	hl
	push	hl
	push	bc
	xor	a
	or	h
	jp	p,i_32
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_32
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_33
	ret



._cortina
	;; Antes que nada vamos a limpiar el PAPER de toda la pantalla
	;; para que no queden artefactos feos
	ld de, 22528 ; Apuntamos con DE a la zona de atributos
	ld b, 3 ; Procesamos 3 tercios
	.clearb1
	push bc
	ld b, 0 ; Procesamos los 256 atributos de cada tercio
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
	ld a, 0
	.bucle1
	sla (hl)
	inc hl
	dec a
	jr nz, bucle1
	ld a, 0
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



._game_ending
	call	sp_UpdateNow
	call	_blackout
	ld	hl,_s_ending
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_unpack
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_bs),a
.i_36
	ld	hl,7 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,2 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_34
	ld	hl,(_bs)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_bs),a
	ld	a,h
	or	l
	jp	nz,i_36
.i_35
	ld	hl,9 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret


;	SECTION	text

._spacer
	defw	i_1+0
;	SECTION	code


._game_over
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,79 % 256	;const
	push	hl
	ld	hl,(_spacer)
	push	hl
	call	_print_str
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,79 % 256	;const
	push	hl
	ld	hl,i_1+13
	push	hl
	call	_print_str
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,79 % 256	;const
	push	hl
	ld	hl,(_spacer)
	push	hl
	call	_print_str
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_bs),a
.i_40
	ld	hl,7 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,2 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_38
	ld	hl,(_bs)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_bs),a
	ld	a,h
	or	l
	jp	nz,i_40
.i_39
	ld	hl,9 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._addsign
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	xor	a
	or	h
	jp	m,i_41
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_41
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_42
	ret



._ctileoff
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_gt
	ld	hl,0	;const
	rl	l
	ld	h,0
	ret



._espera_activa
.i_45
	ld	hl,250 % 256	;const
	ld	a,l
	ld	(_gpjt),a
.i_48
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_46
	ld	hl,(_gpjt)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpjt),a
	ld	a,h
	or	l
	jp	nz,i_48
.i_47
	call	sp_GetKey
	ld	a,h
	or	l
	jp	nz,i_44
.i_49
.i_43
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_45
.i_44
	ret



._init_cerrojos
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_52
.i_50
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_52
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_51
	jp	nc,i_51
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
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_50
.i_51
	ret



._init_hotspots
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_53
	ld	a,(_gpit)
	cp	#(30 % 256)
	jp	z,i_54
	jp	nc,i_54
	ld	hl,_hotspots
	push	hl
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
	ld	l,a
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
	jp	i_53
.i_54
	ret



._process_tile
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,15	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_56
	ld	a,(_player+28)
	and	a
	jr	nz,i_57_i_56
.i_56
	jp	i_55
.i_57_i_56
	ld	hl,_map_attr
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,12-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_map_buff
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,12-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_60
.i_58
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_60
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_59
	jp	nc,i_59
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
	ld	hl,10-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_eq
	jp	nc,i_62
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
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_eq
	jp	nc,i_62
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
	jr	z,i_63_i_62
.i_62
	jp	i_61
.i_63_i_62
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
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_59
.i_61
	jp	i_58
.i_59
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,0
	add	hl,de
	ex	de,hl
	ld	hl,10-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,10-2	;const
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
	ld	hl,_player+28
	dec	(hl)
	ld	hl,8 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_55
	ret



._kill_player
	ld	hl,(_player+26)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_64
	ret


.i_64
	ld	hl,_player+26
	dec	(hl)
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_peta_el_beeper
	pop	bc
	ret



._move
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_wall_h),a
	ld	h,0
	ld	a,l
	ld	(_wall_v),a
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_65
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_65
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player+8)
	ld	de,512	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_66
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	ld	bc,32
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_67
.i_66
	ld	hl,512	;const
	ld	(_player+8),hl
.i_67
	ld	a,(_player+25)
	and	a
	jp	z,i_68
	ld	hl,0	;const
	ld	(_player+8),hl
.i_68
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
	jp	p,i_69
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_69
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_70
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_70
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
	ld	a,#(0 % 256 % 256)
	ld	(_possee),a
	ld	a,#(0 % 256 % 256)
	ld	(_hit_v),a
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_71
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_72
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_74
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
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
	jp	z,i_74
	ld	hl,1	;const
	jr	i_75
.i_74
	ld	hl,0	;const
.i_75
	ld	a,h
	or	l
	jp	nz,i_76
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_77
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_77
	ld	hl,1	;const
	jr	i_78
.i_77
	ld	hl,0	;const
.i_78
	ld	a,h
	or	l
	jp	nz,i_76
	jr	i_79
.i_76
	ld	hl,1	;const
.i_79
	ld	a,h
	or	l
	jp	z,i_73
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	ld	bc,-512
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_wall_v),a
	jp	i_80
.i_73
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_82
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_82
	ld	hl,1	;const
	jr	i_83
.i_82
	ld	hl,0	;const
.i_83
	ld	a,h
	or	l
	jp	nz,i_84
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_85
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_85
	ld	hl,1	;const
	jr	i_86
.i_85
	ld	hl,0	;const
.i_86
	ld	a,h
	or	l
	jp	nz,i_84
	jr	i_87
.i_84
	ld	hl,1	;const
.i_87
	ld	a,h
	or	l
	jp	z,i_81
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_v),a
.i_81
.i_80
.i_72
	jp	i_88
.i_71
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_90
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jr	c,i_91_i_90
.i_90
	jp	i_89
.i_91_i_90
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_92
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_94
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
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_94
	ld	hl,1	;const
	jr	i_95
.i_94
	ld	hl,0	;const
.i_95
	ld	a,h
	or	l
	jp	nz,i_96
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_97
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
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_97
	ld	hl,1	;const
	jr	i_98
.i_97
	ld	hl,0	;const
.i_98
	ld	a,h
	or	l
	jp	nz,i_96
	jr	i_99
.i_96
	ld	hl,1	;const
.i_99
	ld	a,h
	or	l
	jp	z,i_93
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+1+1
	push	hl
	ld	a,(_gpyy)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	a,#(2 % 256 % 256)
	ld	(_wall_v),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_possee),a
	jp	i_100
.i_93
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_102
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_102
	ld	hl,1	;const
	jr	i_103
.i_102
	ld	hl,0	;const
.i_103
	ld	a,h
	or	l
	jp	nz,i_104
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_105
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_105
	ld	hl,1	;const
	jr	i_106
.i_105
	ld	hl,0	;const
.i_106
	ld	a,h
	or	l
	jp	nz,i_104
	jr	i_107
.i_104
	ld	hl,1	;const
.i_107
	ld	a,h
	or	l
	jp	z,i_101
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_v),a
.i_101
.i_100
.i_92
.i_89
.i_88
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_109
	ld	a,(_possee)
	and	a
	jp	nz,i_110
	ld	a,(_player+25)
	and	a
	jp	nz,i_110
	ld	a,(_hit_v)
	and	a
	jp	z,i_109
.i_110
	jr	i_112_i_109
.i_109
	jp	i_108
.i_112_i_109
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,3 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_108
	ld	a,(_player+19)
	and	a
	jp	z,i_113
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
	jp	nc,i_114
	ld	hl,65216	;const
	ld	(_player+8),hl
.i_114
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_115
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_115
.i_113
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_117
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_117
	ld	hl,0	;const
	jr	i_118
.i_117
	ld	hl,1	;const
.i_118
	call	l_lneg
	jp	nc,i_116
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_119
	or	l
	jp	z,i_119
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
	jp	p,i_120
	ld	hl,0	;const
	ld	(_player+6),hl
.i_120
	jp	i_121
.i_119
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_122
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
	jp	m,i_123
	or	l
	jp	z,i_123
	ld	hl,0	;const
	ld	(_player+6),hl
.i_123
.i_122
.i_121
.i_116
	ld	hl,_gpit
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_124
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_125
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,-48
	add	hl,bc
	pop	de
	call	l_pint
.i_125
.i_124
	ld	hl,_gpit
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_126
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_127
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	ld	bc,48
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,_player+22
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_127
.i_126
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
	jp	p,i_128
	ld	hl,0	;const
	ld	(_player),hl
.i_128
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_129
	ld	hl,14336	;const
	ld	(_player),hl
.i_129
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpxx),a
	ld	a,#(0 % 256 % 256)
	ld	(_hit_h),a
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_131
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jr	c,i_132_i_131
.i_131
	jp	i_130
.i_132_i_131
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_134
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
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
	jp	z,i_134
	ld	hl,1	;const
	jr	i_135
.i_134
	ld	hl,0	;const
.i_135
	ld	a,h
	or	l
	jp	nz,i_136
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_137
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_137
	ld	hl,1	;const
	jr	i_138
.i_137
	ld	hl,0	;const
.i_138
	ld	a,h
	or	l
	jp	nz,i_136
	jr	i_139
.i_136
	ld	hl,1	;const
.i_139
	ld	a,h
	or	l
	jp	z,i_133
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	ld	bc,-256
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_wall_h),a
	jp	i_140
.i_133
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_142
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_142
	ld	hl,1	;const
	jr	i_143
.i_142
	ld	hl,0	;const
.i_143
	ld	a,h
	or	l
	jp	nz,i_144
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_145
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_145
	ld	hl,1	;const
	jr	i_146
.i_145
	ld	hl,0	;const
.i_146
	ld	a,h
	or	l
	jp	nz,i_144
	jr	i_147
.i_144
	ld	hl,1	;const
.i_147
	ld	a,h
	or	l
	jp	z,i_141
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_h),a
.i_141
.i_140
	jp	i_148
.i_130
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_uge
	jp	nc,i_149
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_151
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_151
	ld	hl,1	;const
	jr	i_152
.i_151
	ld	hl,0	;const
.i_152
	ld	a,h
	or	l
	jp	nz,i_153
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_154
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_154
	ld	hl,1	;const
	jr	i_155
.i_154
	ld	hl,0	;const
.i_155
	ld	a,h
	or	l
	jp	nz,i_153
	jr	i_156
.i_153
	ld	hl,1	;const
.i_156
	ld	a,h
	or	l
	jp	z,i_150
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	a,(_gpxx)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	ld	bc,256
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_wall_h),a
	jp	i_157
.i_150
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_159
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_159
	ld	hl,1	;const
	jr	i_160
.i_159
	ld	hl,0	;const
.i_160
	ld	a,h
	or	l
	jp	nz,i_161
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_162
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
	ld	de,1	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_162
	ld	hl,1	;const
	jr	i_163
.i_162
	ld	hl,0	;const
.i_163
	ld	a,h
	or	l
	jp	nz,i_161
	jr	i_164
.i_161
	ld	hl,1	;const
.i_164
	ld	a,h
	or	l
	jp	z,i_158
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_h),a
.i_158
.i_157
.i_149
.i_148
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
	ld	a,(_wall_h)
	cp	#(4 % 256)
	jp	nz,i_165
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
	ld	de,10	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_166
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_process_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_166
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_167
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
	ld	de,10	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_168
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_process_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_168
.i_167
	jp	i_169
.i_165
	ld	a,(_wall_h)
	cp	#(3 % 256)
	jp	nz,i_170
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,10	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_171
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_process_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_171
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_172
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
	ld	de,10	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_173
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_process_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_173
.i_172
.i_170
.i_169
	ld	a,#(0 % 256 % 256)
	ld	(_hit),a
	ld	a,(_hit_v)
	and	a
	jp	z,i_174
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	l_neg
	push	hl
	ld	hl,256	;const
	push	hl
	call	_addsign
	pop	bc
	pop	bc
	pop	de
	call	l_pint
	jp	i_175
.i_174
	ld	a,(_hit_h)
	and	a
	jp	z,i_176
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	call	l_neg
	push	hl
	ld	hl,256	;const
	push	hl
	call	_addsign
	pop	bc
	pop	bc
	pop	de
	call	l_pint
.i_176
.i_175
	ld	a,(_hit)
	and	a
	jp	z,i_177
	ld	hl,4 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_177
	ld	a,(_player+22)
	ld	e,a
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	nz,i_178
	ld	hl,_player+17
	push	hl
	ld	hl,_player_frames
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	jp	i_179
.i_178
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_180
	ld	hl,_player+17
	push	hl
	ld	hl,_player_frames
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	inc	hl
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	jp	i_181
.i_180
	ld	hl,_player+17
	push	hl
	ld	hl,_player_frames
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	inc	hl
	inc	hl
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
.i_181
.i_179
	ret



._draw_scr_background
	ld	hl,_mapa
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	ld	de,75
	call	l_mult
	pop	de
	add	hl,de
	ld	(_map_pointer),hl
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_srand
	pop	bc
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpy),a
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_184
.i_182
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_184
	ld	a,(_gpit)
	cp	#(150 % 256)
	jp	z,i_183
	jp	nc,i_183
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_and
	call	l_lneg
	jp	nc,i_185
	ld	hl,(_map_pointer)
	inc	hl
	ld	(_map_pointer),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpc),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpd),a
	jp	i_186
.i_185
	ld	a,(_gpc)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_gpd),a
.i_186
	ld	de,_map_attr
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_gpd)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	a,(_gpd)
	ld	e,a
	ld	d,0
	ld	hl,0	;const
	call	l_eq
	jp	nc,i_188
	call	_rand
	ld	de,15	;const
	ex	de,hl
	call	l_and
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
	jp	z,i_187
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_gpd),a
.i_187
	ld	de,_map_buff
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_gpd
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_gpx)
	ld	h,0
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_gpd)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gpx)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	cp	#(30 % 256)
	jp	nz,i_190
	ld	a,#(0 % 256 % 256)
	ld	(_gpx),a
	ld	hl,(_gpy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
.i_190
	jp	i_182
.i_183
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpx),a
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
	ld	(_gpy),a
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
	jp	nz,i_192
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
	jp	z,i_192
	ld	hl,1	;const
	jr	i_193
.i_192
	ld	hl,0	;const
.i_193
	ld	a,h
	or	l
	jp	nz,i_194
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
	ld	e,(hl)
	ld	d,0
	ld	hl,0	;const
	call	l_eq
	jp	nc,i_195
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,2	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_195
	ld	hl,1	;const
	jr	i_196
.i_195
	ld	hl,0	;const
.i_196
	ld	a,h
	or	l
	jp	nz,i_194
	jr	i_197
.i_194
	ld	hl,1	;const
.i_197
	ld	a,h
	or	l
	jp	z,i_191
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	h,0
	ld	a,l
	ld	(_hotspot_y),a
	ld	hl,_map_buff
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,(_gpx)
	ld	h,0
	add	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_orig_tile),a
	ld	hl,(_gpx)
	ld	h,0
	ld	de,0
	add	hl,de
	ex	de,hl
	ld	hl,(_gpx)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,(_gpy)
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
	inc	hl
	ld	a,(hl)
	and	a
	jp	z,i_198
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
	jp	i_199
.i_198
	ld	hl,0	;const
.i_199
	ld	de,16
	add	hl,de
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_191
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_202
.i_200
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_202
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_201
	jp	nc,i_201
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
	jp	nz,i_204
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
	call	l_lneg
	jr	c,i_205_i_204
.i_204
	jp	i_203
.i_205_i_204
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
	ld	a,l
	ld	(_gpx),a
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
	ld	a,l
	ld	(_gpy),a
	ld	hl,(_gpx)
	ld	h,0
	ld	de,0
	add	hl,de
	ex	de,hl
	ld	hl,(_gpx)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,(_gpy)
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
	ld	hl,(_gpy)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,(_gpx)
	ld	h,0
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_gpd),a
	ld	de,_map_attr
	ld	hl,(_gpd)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_map_buff
	ld	hl,(_gpd)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_203
	jp	i_200
.i_201
	ret



._draw_scr
	call	_draw_scr_background
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
	jp	i_208
.i_206
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_208
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_207
	jp	nc,i_207
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl),#(3 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
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
.i_211
	ld	a,l
	cp	#(1% 256)
	jp	z,i_212
	cp	#(2% 256)
	jp	z,i_213
	cp	#(3% 256)
	jp	z,i_214
	cp	#(4% 256)
	jp	z,i_215
	jp	i_216
.i_212
.i_213
.i_214
.i_215
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
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
	add	hl,hl
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_210
.i_216
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_210
	jp	i_206
.i_207
	ret



._select_joyfunc
	; Music generated by beepola
	call musicstart
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_217
	ld	hl,(_gpit)
	ld	h,0
	call	l_lneg
	jp	nc,i_218
	call	sp_GetKey
	ld	h,0
	ld	a,l
	ld	(_gpjt),a
	ld	hl,(_gpjt)
	ld	h,0
.i_221
	ld	a,l
	cp	#(49% 256)
	jp	z,i_222
	cp	#(50% 256)
	jp	z,i_223
	cp	#(51% 256)
	jp	z,i_224
	jp	i_220
.i_222
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_220
.i_223
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_220
.i_224
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
.i_220
	jp	i_217
.i_218
	di
	ret



._do_hotspots
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_x)
	ld	h,0
	push	hl
	ld	hl,(_hotspot_y)
	ld	h,0
	push	hl
	call	_collide
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_225
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
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
	ld	a,#(0 % 256 % 256)
	ld	(_gpit),a
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
	jp	nz,i_226
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(15 % 256)
	ld	(hl),a
	ld	a,(_player+26)
	cp	#(99 % 256)
	jp	z,i_227
	jp	c,i_227
	ld	hl,_player+26
	ld	(hl),#(99 % 256 % 256)
.i_227
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
	ld	hl,8 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	jp	i_228
.i_226
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
.i_231
	ld	a,l
	cp	#(1% 256)
	jp	z,i_232
	cp	#(2% 256)
	jp	z,i_233
	jp	i_230
.i_232
	ld	hl,_player+27
	inc	(hl)
	ld	hl,9 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
	jp	i_230
.i_233
	ld	hl,_player+28
	inc	(hl)
	ld	hl,7 % 256	;const
	push	hl
	call	_peta_el_beeper
	pop	bc
.i_230
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
	ld	hl,_gpit
	ld	a,(hl)
	pop	de
	ld	(de),a
.i_228
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
.i_225
	ret



._mueve_bicharracos
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
	ld	a,#(0 % 256 % 256)
	ld	(_tocado),a
	ld	hl,_player+25
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_236
.i_234
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_236
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_235
	jp	nc,i_235
	ld	a,#(0 % 256 % 256)
	ld	(_active),a
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpen_x),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpen_y),a
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
	ld	(_gpt),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_237
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	dec	(hl)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	a,(hl)
	and	a
	jp	nz,i_238
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
	jp	i_234
.i_238
.i_237
	ld	hl,(_gpt)
	ld	h,0
.i_241
	ld	a,l
	cp	#(1% 256)
	jp	z,i_242
	cp	#(2% 256)
	jp	z,i_243
	cp	#(3% 256)
	jp	z,i_244
	cp	#(4% 256)
	jp	z,i_245
	jp	i_240
.i_242
.i_243
.i_244
.i_245
	ld	a,#(1 % 256 % 256)
	ld	(_active),a
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
	push	hl
	ld	l,(hl)
	ld	h,0
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
	push	hl
	ld	l,(hl)
	ld	h,0
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpen_cx),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_gpen_cy),a
	ld	a,(_gpen_cx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpen_xx),a
	ld	a,(_gpen_cy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpen_yy),a
	ld	hl,(_gpen_cx)
	ld	h,0
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
	inc	hl
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_247
	ld	hl,(_gpen_cx)
	ld	h,0
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
	ld	bc,4
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_246
.i_247
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
	ld	bc,6
	add	hl,bc
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_246
	ld	hl,(_gpen_cy)
	ld	h,0
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
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_250
	ld	hl,(_gpen_cy)
	ld	h,0
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
	ld	bc,5
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_249
.i_250
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
	ld	bc,7
	add	hl,bc
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_249
.i_240
	ld	a,(_active)
	and	a
	jp	z,i_252
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	(hl)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_253
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	push	hl
	ld	hl,_enem_frames
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
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
.i_253
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
	ld	de,4	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_254
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpxx),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cx)
	ld	h,0
	call	l_uge
	jp	nc,i_256
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpen_cx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_257_i_256
.i_256
	jp	i_255
.i_257_i_256
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_258
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_uge
	jp	nc,i_260
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,9
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_ule
	jp	nc,i_260
	ld	hl,(_player+8)
	ld	de,65488	;const
	ex	de,hl
	call	l_ge
	jr	c,i_261_i_260
.i_260
	jp	i_259
.i_261_i_260
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_gpen_cy)
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_262
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_264
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
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
	jp	z,i_264
	ld	hl,1	;const
	jr	i_265
.i_264
	ld	hl,0	;const
.i_265
	ld	a,h
	or	l
	jp	nz,i_266
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_267
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_267
	ld	hl,1	;const
	jr	i_268
.i_267
	ld	hl,0	;const
.i_268
	ld	a,h
	or	l
	jp	nz,i_266
	jr	i_269
.i_266
	ld	hl,1	;const
.i_269
	ld	a,h
	or	l
	jp	z,i_263
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_263
.i_262
.i_259
	jp	i_270
.i_258
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	m,i_271
	or	l
	jp	z,i_271
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_uge
	jp	nc,i_273
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,14
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_ule
	jp	nc,i_273
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_274_i_273
.i_273
	jp	i_272
.i_274_i_273
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_gpen_cy)
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_275
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_277
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
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_277
	ld	hl,1	;const
	jr	i_278
.i_277
	ld	hl,0	;const
.i_278
	ld	a,h
	or	l
	jp	nz,i_279
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_280
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
	ld	de,12	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_280
	ld	hl,1	;const
	jr	i_281
.i_280
	ld	hl,0	;const
.i_281
	ld	a,h
	or	l
	jp	nz,i_279
	jr	i_282
.i_279
	ld	hl,1	;const
.i_282
	ld	a,h
	or	l
	jp	z,i_276
	ld	hl,_player+1+1
	push	hl
	ld	a,(_gpyy)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_276
.i_275
.i_272
.i_271
.i_270
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpy),a
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_284
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_uge
	jp	nc,i_284
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	hl,(_gpen_cy)
	ld	h,0
	call	l_ule
	jp	nc,i_284
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_285_i_284
.i_284
	jp	i_283
.i_285_i_284
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_gpen_cy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpyy),a
	ld	hl,(_gpx)
	ld	h,0
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
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
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpxx),a
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_286
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,12	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_287
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_289
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
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
	jp	z,i_289
	ld	hl,1	;const
	jr	i_290
.i_289
	ld	hl,0	;const
.i_290
	ld	a,h
	or	l
	jp	nz,i_291
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_292
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_292
	ld	hl,1	;const
	jr	i_293
.i_292
	ld	hl,0	;const
.i_293
	ld	a,h
	or	l
	jp	nz,i_291
	jr	i_294
.i_291
	ld	hl,1	;const
.i_294
	ld	a,h
	or	l
	jp	z,i_288
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_288
.i_287
	jp	i_295
.i_286
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,4	;const
	ex	de,hl
	call	l_uge
	jp	nc,i_296
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_298
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_298
	ld	hl,1	;const
	jr	i_299
.i_298
	ld	hl,0	;const
.i_299
	ld	a,h
	or	l
	jp	nz,i_300
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_301
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
	ld	de,8	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_301
	ld	hl,1	;const
	jr	i_302
.i_301
	ld	hl,0	;const
.i_302
	ld	a,h
	or	l
	jp	nz,i_300
	jr	i_303
.i_300
	ld	hl,1	;const
.i_303
	ld	a,h
	or	l
	jp	z,i_297
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	a,(_gpxx)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_297
.i_296
.i_295
.i_283
.i_255
	jp	i_304
.i_254
	ld	hl,(_tocado)
	ld	h,0
	call	l_lneg
	jp	nc,i_306
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_gpen_cx)
	ld	h,0
	push	hl
	ld	hl,(_gpen_cy)
	ld	h,0
	push	hl
	call	_collide
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_306
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_307_i_306
.i_306
	jp	i_305
.i_307_i_306
	ld	a,#(1 % 256 % 256)
	ld	(_tocado),a
	ld	hl,(_lasttimehit)
	ld	h,0
	call	l_lneg
	jp	c,i_309
	ld	a,(_maincounter)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_308
.i_309
	ld	hl,4 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_308
	ld	hl,_player+6
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	push	hl
	ld	hl,256	;const
	push	hl
	call	_addsign
	pop	bc
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_player+8
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	push	hl
	ld	hl,256	;const
	push	hl
	call	_addsign
	pop	bc
	pop	bc
	pop	de
	call	l_pint
.i_305
.i_304
.i_252
	jp	i_234
.i_235
	ld	hl,(_tocado)
	ld	h,0
	ld	a,l
	ld	(_lasttimehit),a
	ret



._main
	di
	call	_cortina
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
	ld	hl,60840	;const
	push	hl
	call	sp_AddMemory
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	ld	hl,_tileset
	ld	(_allpurposepuntero),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_313
	ld	hl,(_gpit)
	ld	h,0
	push	hl
	ld	hl,(_allpurposepuntero)
	push	hl
	call	sp_TileArray
	pop	bc
	pop	bc
	ld	hl,(_allpurposepuntero)
	ld	bc,8
	add	hl,bc
	ld	(_allpurposepuntero),hl
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_311
	ld	hl,(_gpit)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_313
.i_312
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
	ld	(_gpit),a
	jp	i_316
.i_314
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_316
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_315
	jp	nc,i_315
	ld	hl,_sp_moviles
	push	hl
	ld	hl,(_gpit)
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
	ld	hl,(_gpit)
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
	ld	hl,(_gpit)
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	push	hl
	ld	hl,_sprite_9_a
	pop	de
	call	l_pint
	pop	de
	call	l_pint
	jp	i_314
.i_315
.i_317
	call	sp_UpdateNow
	call	_blackout
	ld	hl,_s_title
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_unpack
	pop	bc
	pop	bc
	call	_select_joyfunc
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_mlplaying),a
.i_319
	ld	a,(_mlplaying)
	and	a
	jp	z,i_320
	ld	a,#(0 % 256 % 256)
	ld	(_mlplaying),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	ld	a,#(1 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	a,#(0 % 256 % 256)
	ld	(_half_life),a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(_killed_old),a
	ld	h,0
	ld	a,l
	ld	(_life_old),a
	ld	h,0
	ld	a,l
	ld	(_keys_old),a
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_success),a
.i_321
	ld	a,(_playing)
	and	a
	jp	z,i_322
	ld	hl,(_o_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_323
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_o_pant),a
.i_323
	ld	hl,(_player+27)
	ld	h,0
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_324
	call	_draw_objs
	ld	hl,(_player+27)
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_324
	ld	hl,(_player+26)
	ld	h,0
	ex	de,hl
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_325
	ld	hl,30 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,(_player+26)
	ld	h,0
	push	hl
	call	_print_number2
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+26)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_325
	ld	hl,(_player+28)
	ld	h,0
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_326
	ld	hl,30 % 256	;const
	push	hl
	ld	hl,16 % 256	;const
	push	hl
	ld	hl,(_player+28)
	ld	h,0
	push	hl
	call	_print_number2
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+28)
	ld	h,0
	ld	a,l
	ld	(_keys_old),a
.i_326
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
	call	_render_sprites
	call	sp_UpdateNow
	call	_do_hotspots
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_327
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_327
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_329
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_330_i_329
.i_329
	jp	i_328
.i_330_i_329
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	hl,14336	;const
	ld	(_player),hl
.i_328
	ld	hl,(_player)
	ld	de,14336	;const
	call	l_eq
	jp	nc,i_332
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_333_i_332
.i_332
	jp	i_331
.i_333_i_332
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,0	;const
	ld	(_player),hl
.i_331
	ld	hl,(_player+1+1)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_335
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_336_i_335
.i_335
	jp	i_334
.i_336_i_335
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_334
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	call	l_eq
	jp	nc,i_338
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_339_i_338
.i_338
	jp	i_337
.i_339_i_338
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,_player+1+1
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(_player+8)
	ld	de,256	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_340
	ld	hl,256	;const
	ld	(_player+8),hl
.i_340
.i_337
	ld	a,(_player+27)
	cp	#(25 % 256)
	jp	nz,i_341
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	z,i_343
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_344
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_345
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jr	c,i_346_i_345
.i_345
	jp	i_344
.i_346_i_345
	ld	hl,1	;const
	jr	i_347
.i_344
	ld	hl,0	;const
.i_347
	ld	a,h
	or	l
	jp	nz,i_343
	jr	i_348
.i_343
	ld	hl,1	;const
.i_348
	ld	a,h
	or	l
	jp	z,i_342
	ld	a,#(1 % 256 % 256)
	ld	(_success),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_342
.i_341
	ld	a,(_player+26)
	and	a
	jp	nz,i_349
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_349
	jp	i_321
.i_322
	call	sp_WaitForNoKey
	call	_saca_a_todo_el_mundo_de_aqui
	call	sp_UpdateNow
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_350
	call	_game_ending
	jp	i_351
.i_350
	call	_game_over
.i_351
	jp	i_319
.i_320
	call	_cortina
	jp	i_317
.i_318
	ret


	; *****************************************************************************
	; * Phaser1 Engine, with synthesised drums
	; *
	; * Original code by Shiru - .http
	; * Modified by Chris Cowley
	; *
	; * Produced by Beepola v1.05.01
	; ******************************************************************************
	.musicstart
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
	.player
	;DI
	PUSH IY
	;LD A,BORDER_COL
	xor a
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
	.next_pattern
	LD A,(PATTERN_PTR)
	INC A
	INC A
	DEFB $FE ; CP n
	.pattern_loop_end DEFB 0
	JR NZ,NO_PATTERN_LOOP
	; Handle Pattern Looping at and of song
	DEFB $3E ; LD A,n
	.pattern_loop_begin DEFB 0
	.no_pattern_loop LD (PATTERN_PTR),A
	LD HL,$0000
	LD (NOTE_PTR),HL ; Start of pattern (NOTE_PTR = 0)
	.main_loop
	LD IYL,0 ; Set channel = 0
	.read_loop
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
	.current_inst
	DEFW $0000
	LD A,(IX+$00)
	OR A
	JR Z,L809B ; Original code jumps into byte 2 of the DJNZ (invalid opcode FD)
	LD B,A
	.l8098 ADD HL,HL
	DJNZ L8098
	.l809b LD E,(IX+$01)
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
	.set_note2
	LD (DIV_2),DE
	LD A,IYH
	LD HL,OUT_2
	RES 4,(HL)
	LD HL,$0000
	LD (CNT_2),HL
	JP READ_LOOP
	.set_stop
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
	.set_stop2
	; Stop channel 2 note
	LD (DIV_2),HL
	LD HL,OUT_2
	RES 4,(HL)
	JP READ_LOOP
	.other CP $3C
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
	.instrum_tbl
	DEFW $0000
	ADD HL,BC
	LD (CURRENT_INST),HL
	JP READ_LOOP
	.skip_ch1
	LD IYL,$01
	JP READ_LOOP
	.exit_player
	LD HL,$2758
	EXX
	POP IY
	;EI
	RET
	.render
	AND $7F ; L813A
	CP $76
	JP NC,DRUMS
	LD D,A
	EXX
	DEFB $21 ; LD HL,nn
	.cnt_1a DEFW $0000
	DEFB $DD,$21 ; LD IX,nn
	.cnt_1b DEFW $0000
	DEFB $01 ; LD BC,nn
	.div_1a DEFW $0000
	DEFB $11 ; LD DE,nn
	.div_1b DEFW $0000
	DEFB $3E ; LD A,n
	.out_1 DEFB $0
	EXX
	EX AF,AF ; beware!
	DEFB $21 ; LD HL,nn
	.cnt_2 DEFW $0000
	DEFB $01 ; LD BC,nn
	.div_2 DEFW $0000
	DEFB $3E ; LD A,n
	.out_2 DEFB $00
	.play_note
	; Read keyboard
	LD E,A
	XOR A
	IN A,($FE)
	OR $E0
	INC A
	.player_wait_key
	JR NZ,EXIT_PLAYER
	LD A,E
	LD E,0
	.l8168 EXX
	EX AF,AF ; beware!
	ADD HL,BC
	OUT ($FE),A
	JR C,L8171
	JR L8173
	.l8171 XOR $10
	.l8173 ADD IX,DE
	JR C,L8179
	JR L817B
	.l8179 XOR $10
	.l817b EX AF,AF ; beware!
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L8184
	JR L8186
	.l8184 XOR $10
	.l8186 NOP
	JP L818A
	.l818a EXX
	EX AF,AF ; beware!
	ADD HL,BC
	OUT ($FE),A
	JR C,L8193
	JR L8195
	.l8193 XOR $10
	.l8195 ADD IX,DE
	JR C,L819B
	JR L819D
	.l819b XOR $10
	.l819d EX AF,AF ; beware!
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81A6
	JR L81A8
	.l81a6 XOR $10
	.l81a8 NOP
	JP L81AC
	.l81ac EXX
	EX AF,AF ; beware!
	ADD HL,BC
	OUT ($FE),A
	JR C,L81B5
	JR L81B7
	.l81b5 XOR $10
	.l81b7 ADD IX,DE
	JR C,L81BD
	JR L81BF
	.l81bd XOR $10
	.l81bf EX AF,AF ; beware!
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81C8
	JR L81CA
	.l81c8 XOR $10
	.l81ca NOP
	JP L81CE
	.l81ce EXX
	EX AF,AF ; beware!
	ADD HL,BC
	OUT ($FE),A
	JR C,L81D7
	JR L81D9
	.l81d7 XOR $10
	.l81d9 ADD IX,DE
	JR C,L81DF
	JR L81E1
	.l81df XOR $10
	.l81e1 EX AF,AF ; beware!
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L81EA
	JR L81EC
	.l81ea XOR $10
	.l81ec DEC E
	JP NZ,L8168
	EXX
	EX AF,AF ; beware!
	ADD HL,BC
	OUT ($FE),A
	JR C,L81F9
	JR L81FB
	.l81f9 XOR $10
	.l81fb ADD IX,DE
	JR C,L8201
	JR L8203
	.l8201 XOR $10
	.l8203 EX AF,AF ; beware!
	OUT ($FE),A
	EXX
	ADD HL,BC
	JR C,L820C
	JR L820E
	.l820c XOR $10
	.l820e DEC D
	JP NZ,PLAY_NOTE
	LD (CNT_2),HL
	LD (OUT_2),A
	EXX
	EX AF,AF ; beware!
	LD (CNT_1A),HL
	LD (CNT_1B),IX
	LD (OUT_1),A
	JP MAIN_LOOP
	; ************************************************************
	; * DRUMS - Synthesised
	; ************************************************************
	.drums
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
	.drum_tone1 LD L,16
	JR DRUM_TONE
	.drum_tone2 LD L,12
	JR DRUM_TONE
	.drum_tone3 LD L,8
	JR DRUM_TONE
	.drum_tone4 LD L,6
	JR DRUM_TONE
	.drum_tone5 LD L,4
	JR DRUM_TONE
	.drum_tone6 LD L,2
	.drum_tone
	LD DE,3700
	LD BC,$0101
	xor a
	.dt_loop0 OUT ($FE),A
	DEC B
	JR NZ,DT_LOOP1
	XOR 16
	LD B,C
	EX AF,AF ; beware!
	LD A,C
	ADD A,L
	LD C,A
	EX AF,AF ; beware!
	.dt_loop1 DEC E
	JR NZ,DT_LOOP0
	DEC D
	JR NZ,DT_LOOP0
	JP MAIN_LOOP
	.drum_noise1 LD DE,2480
	LD IXL,1
	JR DRUM_NOISE
	.drum_noise2 LD DE,1070
	LD IXL,10
	JR DRUM_NOISE
	.drum_noise3 LD DE,365
	LD IXL,101
	.drum_noise
	LD H,D
	LD L,E
	xor a
	LD C,A
	.dn_loop0 LD A,(HL)
	AND 16
	OR C
	OUT ($FE),A
	LD B,IXL
	.dn_loop1 DJNZ DN_LOOP1
	INC HL
	DEC E
	JR NZ,DN_LOOP0
	DEC D
	JR NZ,DN_LOOP0
	JP MAIN_LOOP
	.pattern_addr DEFW $0000
	.pattern_ptr DEFB 0
	.note_ptr DEFW $0000
	; **************************************************************
	; * Frequency Table
	; **************************************************************
	.freq_table
	DEFW 178,189,200,212,225,238,252,267,283,300,318,337
	DEFW 357,378,401,425,450,477,505,535,567,601,637,675
	DEFW 715,757,802,850,901,954,1011,1071,1135,1202,1274,1350
	DEFW 1430,1515,1605,1701,1802,1909,2023,2143,2270,2405,2548,2700
	DEFW 2860,3030,3211,3402,3604,3818,4046,4286,4541,4811,5097,5400
	; *****************************************************************
	; * Synth Drum Lookup Table
	; *****************************************************************
	.drum_table
	DEFW DRUM_TONE1,DRUM_TONE2,DRUM_TONE3,DRUM_TONE4,DRUM_TONE5,DRUM_TONE6
	DEFW DRUM_NOISE1,DRUM_NOISE2,DRUM_NOISE3
	.musicdata
	DEFB 0 ; Pattern loop begin * 2
	DEFB 2 ; Song length * 2
	DEFW 4 ; Offset to start of song (length of instrument table)
	DEFB 2 ; Multiple
	DEFW 0 ; Detune
	DEFB 0 ; Phase
	.PATTERNDATA DEFW PAT0
	; *** Pattern data - $00 marks the end of a pattern ***
	.PAT0
	DEFB $BD,0
	DEFB 232
	DEFB 156
	DEFB 118
	DEFB 21
	DEFB 168
	DEFB 124
	DEFB 10
	DEFB 169
	DEFB 11
	DEFB 168
	DEFB 122
	DEFB 10
	DEFB 166
	DEFB 122
	DEFB 10
	DEFB 164
	DEFB 124
	DEFB 10
	DEFB 168
	DEFB 124
	DEFB 10
	DEFB 164
	DEFB 152
	DEFB 118
	DEFB 21
	DEFB 164
	DEFB 124
	DEFB 10
	DEFB 166
	DEFB 11
	DEFB 168
	DEFB 122
	DEFB 10
	DEFB 166
	DEFB 123
	DEFB 10
	DEFB 164
	DEFB 124
	DEFB 10
	DEFB 163
	DEFB 118
	DEFB 10
	DEFB 161
	DEFB 154
	DEFB 118
	DEFB 21
	DEFB 166
	DEFB 124
	DEFB 10
	DEFB 164
	DEFB 11
	DEFB 163
	DEFB 123
	DEFB 10
	DEFB 161
	DEFB 11
	DEFB 163
	DEFB 125
	DEFB 10
	DEFB 159
	DEFB 11
	DEFB 156
	DEFB 151
	DEFB 118
	DEFB 21
	DEFB 156
	DEFB 125
	DEFB 10
	DEFB 159
	DEFB 125
	DEFB 10
	DEFB 163
	DEFB 122
	DEFB 10
	DEFB 164
	DEFB 124
	DEFB 10
	DEFB 163
	DEFB 124
	DEFB 10
	DEFB 159
	DEFB 11
	DEFB 168
	DEFB 156
	DEFB 118
	DEFB 21
	DEFB 171
	DEFB 124
	DEFB 10
	DEFB 169
	DEFB 124
	DEFB 10
	DEFB 168
	DEFB 123
	DEFB 10
	DEFB 166
	DEFB 124
	DEFB 10
	DEFB 164
	DEFB 124
	DEFB 10
	DEFB 168
	DEFB 124
	DEFB 10
	DEFB 171
	DEFB 152
	DEFB 118
	DEFB 21
	DEFB 171
	DEFB 124
	DEFB 10
	DEFB 173
	DEFB 124
	DEFB 10
	DEFB 176
	DEFB 122
	DEFB 10
	DEFB 171
	DEFB 124
	DEFB 10
	DEFB 176
	DEFB 125
	DEFB 10
	DEFB 180
	DEFB 124
	DEFB 10
	DEFB 178
	DEFB 154
	DEFB 118
	DEFB 21
	DEFB 178
	DEFB 124
	DEFB 10
	DEFB 173
	DEFB 11
	DEFB 175
	DEFB 123
	DEFB 10
	DEFB 176
	DEFB 11
	DEFB 178
	DEFB 125
	DEFB 10
	DEFB 180
	DEFB 125
	DEFB 10
	DEFB 180
	DEFB 151
	DEFB 118
	DEFB 21
	DEFB 178
	DEFB 124
	DEFB 10
	DEFB 176
	DEFB 124
	DEFB 10
	DEFB 181
	DEFB 118
	DEFB 10
	DEFB 180
	DEFB 124
	DEFB 10
	DEFB 178
	DEFB 124
	DEFB 10
	DEFB 175
	DEFB 123
	DEFB 10
	DEFB $00
;	SECTION	text

.i_1
	defm	"            "
	defb	0

	defm	" GAME OVER! "
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._sp_moviles	defs	6
._gpen_cx	defs	1
._gpen_cy	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
._en_an	defs	24
._gpen_xx	defs	1
._gpen_yy	defs	1
._map_pointer	defs	2
._hit_h	defs	1
._hit_v	defs	1
._killed_old	defs	1
._gpaux	defs	1
._map_attr	defs	150
._active	defs	1
._bs	defs	1
._mlplaying	defs	1
._life_old	defs	1
._pant_final	defs	1
._sp_player	defs	2
._enoffs	defs	1
._gpen_x	defs	1
._gpen_y	defs	1
._lasttimehit	defs	1
._n_pant	defs	1
._o_pant	defs	1
._joyfunc	defs	2
._gpcx	defs	1
._gpcy	defs	1
._gpit	defs	1
._gpjt	defs	1
._playing	defs	1
._gpxx	defs	1
._objs_old	defs	1
._gpyy	defs	1
._maincounter	defs	1
._gpc	defs	1
._gpd	defs	1
._hit	defs	1
._player	defs	34
._enx	defs	1
._eny	defs	1
._gpt	defs	1
._gpx	defs	1
._gpy	defs	1
._itj	defs	2
._keys_old	defs	1
._wall_h	defs	1
._enoffsmasi	defs	1
._wall_v	defs	1
._tocado	defs	1
._possee	defs	1
._allpurposepuntero	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	LIB	sp_ScreenStr
	XDEF	_hotspots
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	LIB	sp_MouseAMXInit
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_sp_moviles
	XDEF	_gpen_cx
	XDEF	_gpen_cy
	LIB	sp_SetMousePosAMX
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_HashAdd
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_draw_objs
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	_half_life
	XDEF	_en_an
	XDEF	_gpen_xx
	XDEF	_gpen_yy
	XDEF	_map_pointer
	XDEF	_ctileoff
	XDEF	_mueve_bicharracos
	LIB	sp_PrintAt
	LIB	sp_Pause
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
	LIB	sp_Heapify
	XDEF	_malotes
	LIB	sp_MoveSprRel
	XDEF	_hit_h
	XDEF	_blackout
	LIB	sp_TileArray
	LIB	sp_MouseSim
	LIB	sp_BlockFit
	XDEF	_map_buff
	defc	_map_buff	=	61440
	XDEF	_hit_v
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	XDEF	_gpaux
	LIB	sp_ClearRect
	LIB	sp_HuffGetState
	XDEF	_map_attr
	XDEF	_active
	LIB	sp_ListAppend
	XDEF	_level
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_do_hotspots
	LIB	sp_JoyKempston
	LIB	sp_UpdateNow
	LIB	sp_MouseKempston
	LIB	sp_PrintString
	LIB	sp_PixelDown
	LIB	sp_MoveSprAbsC
	LIB	sp_PixelLeft
	XDEF	_enem_frames
	LIB	sp_InitAlloc
	XDEF	_espera_activa
	LIB	sp_DeleteSpr
	LIB	sp_JoyTimexEither
	XDEF	_bs
	XDEF	_mlplaying
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_pant_final
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_addsign
	XDEF	_sprite_11_a
	XDEF	_sprite_11_b
	XDEF	_address
	defc	_address	=	23296
	XDEF	_sprite_11_c
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_sprite_12_c
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_srand
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
	XDEF	_sprite_16_a
	XDEF	_sprite_16_b
	LIB	sp_RemoveHook
	XDEF	_sprite_16_c
	XDEF	_sprite_18_a
	XDEF	_qtile
	XDEF	_player_frames
	XDEF	_init_cerrojos
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_sp_player
	XDEF	_init_player
	LIB	sp_GetTiles
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_enoffs
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	XDEF	_gpen_x
	XDEF	_gpen_y
	LIB	sp_HashCreate
	XDEF	_lasttimehit
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_o_pant
	XDEF	_print_number2
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
	XDEF	_s_title
	XDEF	_attr
	LIB	sp_RemoveDList
	XDEF	_gpit
	XDEF	_gpjt
	XDEF	_playing
	LIB	sp_ListNext
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_print_str
	XDEF	_asm_int_2
	XDEF	_gpxx
	XDEF	_objs_old
	XDEF	_gpyy
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_move
	XDEF	_asm_number
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	LIB	sp_MoveSprAbsNC
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	LIB	sp_PrintAtInv
	XDEF	_kill_player
	LIB	sp_CompDListAddr
	XDEF	_u_free
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	LIB	sp_InstallISR
	XDEF	_gpc
	XDEF	_gpd
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	_hit
	XDEF	_player
	XDEF	_enx
	XDEF	_eny
	XDEF	_sprite_1_a
	XDEF	_sprite_1_b
	XDEF	_sprite_1_c
	XDEF	_sprite_2_a
	XDEF	_gpt
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
	XDEF	_itj
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	XDEF	_sprite_4_a
	XDEF	_sprite_4_b
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_sprite_4_c
	XDEF	_sprite_5_a
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_sprite_6_a
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
	XDEF	_sprite_7_a
	LIB	sp_Initialize
	XDEF	_sprite_7_b
	XDEF	_sprite_7_c
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_tileset
	XDEF	_sprite_8_c
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	LIB	sp_ComputePos
	XDEF	_sprite_9_c
	XDEF	_init_hotspots
	XDEF	_process_tile
	XDEF	_wall_h
	XDEF	_enoffsmasi
	XDEF	_spacer
	XDEF	_wall_v
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	XDEF	_tocado
	LIB	sp_inp
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_asm_int
	LIB	sp_IntPtInterval
	LIB	sp_RegisterHookFirst
	LIB	sp_HashLookup
	LIB	sp_PFill
	XDEF	_possee
	LIB	sp_HashRemove
	XDEF	_allpurposepuntero
	LIB	sp_CharUp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_success
	LIB	sp_MoveSprRelNC
	XDEF	_destination
	defc	_destination	=	23298
	XDEF	_select_joyfunc
	XDEF	_unpack
	XDEF	_render_sprites
	LIB	sp_IterateDList
	XDEF	_draw_scr_background
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	XDEF	_set_player_at
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
