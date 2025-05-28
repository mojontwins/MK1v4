;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Tue May 27 22:15:54 2025



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
	defb	4

	defm	""
	defb	1

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	._asm_number
	defb 0
	._asm_int
	defw 0
	._asm_int_2
	defw 0
	._seed
	defw 0
;	SECTION	text

._pant_final
	defm	""
	defb	7

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
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	29

	defm	""
	defb	17

	defm	""
	defb	17

	defm	" "
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	"1"
	defb	18

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	1

	defm	""
	defb	0

	defm	"!"
	defb	0

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	18

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	" "
	defb	2

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
	defb	2

	defm	""
	defb	13

	defm	""
	defb	16

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

	defm	"1"
	defb	247

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

	defm	"1"
	defb	19

	defm	"3@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	16

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
	defb	1

	defm	""
	defb	18

	defm	"!"
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
	defb	18

	defm	""
	defb	0

	defm	"!!"
	defb	18

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	17

	defm	""
	defb	0

	defm	"!!"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	16

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

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

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
	defb	3

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	16

	defm	"!"
	defb	2

	defm	""
	defb	17

	defm	" "
	defb	2

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	0

	defm	" "
	defb	2

	defm	" "
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	11

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
	defb	211

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	"3"
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	17

	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	1

	defm	"!"
	defb	16

	defm	"! !!  "
	defb	18

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"  "
	defb	0

	defm	""
	defb	2

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	3

	defm	"30"
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
	defb	17

	defm	"!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	"!"
	defb	17

	defm	"! "
	defb	18

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"!  "
	defb	2

	defm	""
	defb	0

	defm	"!"
	defb	0

	defm	""
	defb	0

	defm	" "
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	12

	defm	"0"
	defb	0

	defm	""
	defb	3

	defm	"?"
	defb	13

	defm	"?"
	defb	13

	defm	"1"
	defb	240

	defm	""
	defb	3

	defm	""
	defb	17

	defm	"3131"
	defb	19

	defm	"3!!"
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	16

	defm	" !"
	defb	18

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	2

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

	defm	""
	defb	1

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

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

	defm	"p"
	defb	7

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"333"
	defb	0

	defm	""
	defb	26

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!!"
	defb	18

	defm	""
	defb	1

	defm	" "
	defb	1

	defm	""
	defb	17

	defm	"  "
	defb	34

	defm	""
	defb	0

	defm	" "
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	17

	defm	"!!"
	defb	17

	defm	""
	defb	34

	defm	""
	defb	18

	defm	"("
	defb	130

	defm	"  ! "
	defb	2

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

	defm	" "
	defb	0

	defm	""
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
	defb	192

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

	defm	"C38"
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"!"
	defb	17

	defm	""
	defb	24

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

	defm	"!!"
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

	defm	" "
	defb	24

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
	defb	162

	defm	""
	defb	170

	defm	""
	defb	1

	defm	""
	defb	18

	defm	""
	defb	0

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
	defb	18

	defm	""
	defb	0

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
	defb	209

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	189

	defm	""
	defb	19

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

	defm	"C1"
	defb	17

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	239

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"!"
	defb	17

	defm	" "
	defb	0

	defm	"C@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

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
	defb	9

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	20

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	31

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	2

	defm	""
	defb	17

	defm	""
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
	defb	1

	defm	""
	defb	16

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
	defb	17

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
	defb	1

	defm	""
	defb	19

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
	defb	17

	defm	""
	defb	16

	defm	""
	defb	0

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
	defb	18

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
	defb	9

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
	defb	3

	defm	""
	defb	17

	defm	""
	defb	27

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	34

	defm	""
	defb	17

	defm	"0"
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	16

	defm	""
	defb	2

	defm	""
	defb	17

	defm	":"
	defb	167

	defm	""
	defb	170

	defm	""
	defb	163

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"!333"
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
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
	defb	1

	defm	"!"
	defb	34

	defm	""
	defb	18

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	16

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
	defb	13

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
	defb	13

	defm	"33"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"1!"
	defb	17

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
	defb	128

	defm	"!#"
	defb	240

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

	defm	" "
	defb	19

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	19

	defm	""
	defb	192

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
	defb	18

	defm	""
	defb	19

	defm	""
	defb	170

	defm	""
	defb	163

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	1

	defm	"#3"
	defb	16

	defm	""
	defb	6

	defm	""
	defb	13

	defm	""
	defb	240

	defm	""
	defb	0

	defm	" "
	defb	17

	defm	""
	defb	17

	defm	""
	defb	0

	defm	"m3"
	defb	240

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"!"
	defb	16

	defm	""
	defb	6

	defm	"2#"
	defb	176

	defm	""
	defb	0

	defm	" !3q"
	defb	0

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	17

	defm	""
	defb	24

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
	defb	133

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	6

	defm	"`"
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"f"
	defb	0

	defm	""
	defb	0

	defm	"x"
	defb	136

	defm	"p"
	defb	0

	defm	""
	defb	6

	defm	"`"
	defb	0

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	6

	defm	"}"
	defb	238

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	222

	defm	"x"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	0

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
	defb	2

	defm	""
	defb	18

	defm	""
	defb	17

	defm	" "
	defb	1

	defm	""
	defb	21

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	1

	defm	" "
	defb	0

	defm	""
	defb	18

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	2

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
	defb	0

	defm	""
	defb	6

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

	defm	"?"
	defb	0

	defm	""
	defb	127

	defm	""
	defb	0

	defm	""
	defb	211

	defm	"0"
	defb	192

	defm	""
	defb	209

	defm	"?"
	defb	8

	defm	"33"
	defb	17

	defm	"33"
	defb	17

	defm	"3!!"
	defb	17

	defm	"!"
	defb	18

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	16

	defm	" ! "
	defb	34

	defm	""
	defb	2

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	0

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	0

	defm	""
	defb	222

	defm	"<;"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"110"
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
	defb	18

	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"!!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" !"
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

	defm	"!!"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"@"
	defb	0

	defm	""
	defb	4

	defm	"331"
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
	defb	17

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
	defb	1

	defm	""
	defb	16

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

	defm	""
	defb	17

	defm	"0"
	defb	144

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	209

	defm	"!"
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
	defb	3

	defm	""
	defb	16

	defm	""
	defb	31

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
	defb	18

	defm	""
	defb	2

	defm	"?"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D1"
	defb	0

	defm	""
	defb	1

	defm	"?"
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
	defb	18

	defm	"0"
	defb	0

	defm	"0"
	defb	3

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	162

	defm	""
	defb	170

	defm	""
	defb	18

	defm	""
	defb	0

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
	defb	13

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
	defb	136

	defm	""
	defb	17

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"Q"
	defb	31

	defm	""
	defb	0

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

	defm	"!0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	17

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
	defb	6

	defm	""
	defb	2

	defm	""
	defb	19

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	144

	defm	"`"
	defb	2

	defm	""
	defb	19

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
	defb	2

	defm	""
	defb	29

	defm	""
	defb	238

	defm	""
	defb	240

	defm	""
	defb	13

	defm	""
	defb	238

	defm	"p"
	defb	0

	defm	""
	defb	1

	defm	"33338"
	defb	17

	defm	""
	defb	31

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	209

	defm	"("
	defb	130

	defm	"33333"
	defb	24

	defm	"P"
	defb	2

	defm	"!"
	defb	34

	defm	""
	defb	17

	defm	"!!"
	defb	134

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	1

	defm	"  (`"
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
	defb	134

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	6

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	222

	defm	""
	defb	245

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	"x"
	defb	136

	defm	"p"
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
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	" "
	defb	2

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	18

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	5

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
	defb	0

	defm	""
	defb	0

	defm	"x"
	defb	0

	defm	""
	defb	0

	defm	" "
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
	defb	0

	defm	""
	defb	13

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

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	133

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"x"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	216

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	216

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
	defb	239

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	142

	defm	""
	defb	252

	defm	""
	defb	176

	defm	""
	defb	216

	defm	""
	defb	143

	defm	""
	defb	12

	defm	""
	defb	0

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

	defm	""
	defb	130

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	21

	defm	""
	defb	1

	defm	"!"
	defb	2

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	1

	defm	"!p  "
	defb	0

	defm	""
	defb	1

	defm	"  ("
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
	defb	0

	defm	""
	defb	0

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
	defb	0

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	222

	defm	""
	defb	239

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	170

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	" "
	defb	34

	defm	""
	defb	19

	defm	"?"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	18

	defm	"?"
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
	defb	2

	defm	""
	defb	2

	defm	"3"
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
	defb	1

	defm	"#"
	defb	239

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	" "
	defb	19

	defm	">"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	2

	defm	"!0"
	defb	5

	defm	""
	defb	192

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	13

	defm	"x"
	defb	136

	defm	"p"
	defb	222

	defm	""
	defb	240

	defm	""
	defb	222

	defm	""
	defb	232

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
	defb	131

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
	defb	2

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
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	31

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	18

	defm	""
	defb	0

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
	defb	225

	defm	""
	defb	238

	defm	""
	defb	239

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	19

	defm	"3:"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	161

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
	defb 3, 240
	defb 6, 240
	defb 5, 240
	defb 5, 240
	defb 5, 240
	defb 6, 240
	defb 7, 192
	defb 27, 128
	defb 61, 128
	defb 62, 128
	defb 63, 128
	defb 63, 128
	defb 59, 128
	defb 28, 128
	defb 6, 192
	defb 30, 192
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_9_b
	defb 224, 7
	defb 48, 7
	defb 208, 7
	defb 80, 7
	defb 208, 7
	defb 48, 7
	defb 240, 3
	defb 104, 1
	defb 220, 1
	defb 60, 0
	defb 249, 0
	defb 249, 0
	defb 255, 0
	defb 15, 0
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
	defb 7, 224
	defb 12, 224
	defb 11, 224
	defb 10, 224
	defb 11, 224
	defb 12, 224
	defb 15, 192
	defb 22, 128
	defb 59, 128
	defb 60, 0
	defb 159, 0
	defb 159, 0
	defb 255, 0
	defb 240, 0
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
	._sprite_10_b
	defb 192, 15
	defb 96, 15
	defb 160, 15
	defb 160, 15
	defb 160, 15
	defb 96, 15
	defb 224, 3
	defb 216, 1
	defb 188, 1
	defb 124, 1
	defb 252, 1
	defb 252, 1
	defb 220, 1
	defb 56, 1
	defb 96, 3
	defb 120, 3
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
	defb 0, 255
	defb 0, 255
	defb 3, 252
	defb 4, 248
	defb 10, 240
	defb 16, 224
	defb 19, 224
	defb 21, 224
	defb 23, 224
	defb 16, 224
	defb 35, 192
	defb 88, 128
	defb 168, 16
	defb 73, 176
	defb 16, 224
	defb 31, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_11_b
	defb 0, 255
	defb 0, 255
	defb 224, 31
	defb 16, 15
	defb 136, 7
	defb 4, 3
	defb 132, 3
	defb 68, 3
	defb 194, 1
	defb 1, 0
	defb 129, 0
	defb 1, 0
	defb 5, 0
	defb 197, 0
	defb 133, 0
	defb 250, 5
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
	defb 0, 255
	defb 0, 255
	defb 7, 248
	defb 8, 240
	defb 17, 224
	defb 32, 192
	defb 33, 192
	defb 34, 192
	defb 67, 128
	defb 128, 0
	defb 129, 0
	defb 128, 0
	defb 160, 0
	defb 163, 0
	defb 161, 0
	defb 95, 160
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_12_b
	defb 0, 255
	defb 0, 255
	defb 192, 63
	defb 32, 31
	defb 80, 15
	defb 8, 7
	defb 200, 7
	defb 168, 7
	defb 232, 7
	defb 8, 7
	defb 196, 3
	defb 26, 1
	defb 21, 8
	defb 146, 13
	defb 8, 7
	defb 248, 7
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



._system_init
	halt
	in a, (31)
	inc a
	ld (_kempston_is_attached), a
	di
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
	ld	hl,_keys+8
	push	hl
	ld	hl,113 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_keys+6
	push	hl
	ld	hl,97 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_keys+4
	push	hl
	ld	hl,111 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_keys+1+1
	push	hl
	ld	hl,112 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	pop	de
	call	l_pint
	ld	hl,_keys
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	pop	de
	call	l_pint
	ld	hl,109 % 256	;const
	push	hl
	call	sp_LookupKey
	pop	bc
	ld	(_key_m),hl
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	ld	hl,_tileset
	ld	(_allpurposepuntero),hl
	ld	hl,0	;const
	ld	(_gpint),hl
	jp	i_12
.i_10
	ld	hl,(_gpint)
	inc	hl
	ld	(_gpint),hl
	dec	hl
.i_12
	ld	hl,(_gpint)
	ld	de,256	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_11
	ld	hl,(_gpint)
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
	jp	i_10
.i_11
	ld	hl,_spritesClipValues
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_spritesClipValues+1
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_spritesClipValues+1+1
	ld	(hl),#(20 % 256 % 256)
	ld	hl,_spritesClipValues+1+1+1
	ld	(hl),#(30 % 256 % 256)
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
	ld	(_gpit),a
	jp	i_15
.i_13
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_15
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_14
	jp	nc,i_14
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
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_9_a
	pop	de
	call	l_pint
	jp	i_13
.i_14
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_18
.i_16
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_18
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_17
	jp	nc,i_17
	ld	hl,_sp_bullets
	push	hl
	ld	hl,(_gpit)
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
	ld	hl,(_gpit)
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
	jp	i_16
.i_17
	ret



._draw_coloured_tile
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_px),a
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_py),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_pt),a
	ld	e,a
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asl
	ld	de,64
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_pt),a
	ld	de,_tileset+2048
	ld	hl,(_pt)
	ld	h,0
	add	hl,de
	ld	(_pptr),hl
	ld	hl,(_py)
	ld	h,0
	push	hl
	ld	hl,(_px)
	ld	h,0
	push	hl
	ld	hl,(_pptr)
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_pt)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_py)
	ld	h,0
	push	hl
	ld	hl,(_px)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_pptr)
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_pt)
	ld	h,0
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_py)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_px)
	ld	h,0
	push	hl
	ld	hl,(_pptr)
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_pt)
	ld	h,0
	inc	hl
	inc	hl
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_py)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_px)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_pptr)
	inc	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_pt)
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
	ret



._draw_item
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,14 % 256	;const
	push	hl
	ld	hl,(_flags+5)
	ld	h,0
	ld	de,21
	add	hl,de
	dec	hl
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ret



._draw_life
	ld	hl,8 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	a,(_player+26)
	ld	e,a
	ld	d,0
	ld	hl,100	;const
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
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	a,(_player+26)
	ld	e,a
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
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	a,(_player+26)
	ld	e,a
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



._draw_killed
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	a,(_player+30)
	ld	e,a
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
	ld	hl,21 % 256	;const
	push	hl
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	a,(_player+30)
	ld	e,a
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



._pad_read
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_19
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_19
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



._select_joyfunc
	; Music generated by beepola
	call musicstart
.i_20
	ld	hl,503	;const
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_22
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_21
.i_22
	ld	hl,759	;const
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_24
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_21
.i_24
	ld	hl,1271	;const
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_26
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_21
.i_26
.i_25
.i_23
	jp	i_20
.i_21
	di
	ret



._blackout
	ld hl, 22528
	ld (hl), 0
	push hl
	pop de
	inc de
	ld bc, 767
	ldir
	ret



._unpack
	push hl
	call _blackout
	pop hl
	ld de, 16384
	call depack
	ret



._draw_text
	ld hl, 8
	add hl, sp
	ld a, (hl)
	ld (_px), a
	ld (_pt), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_py), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_pt_alt), a
	dec hl
	ld a, (hl)
	dec hl
	ld l, (hl)
	ld h, a
	.draw_text_loop
	ld a, (_px)
	ld c, a
	inc a
	ld (_px), a
	ld a, (_pt_alt)
	ld d, a
	ld a, (hl)
	or a
	ret z
	inc hl
	cp 0x25
	jr z, draw_text_nl
	sub 32
	ld e, a
	ld a, (_py)
	push hl
	LIB SPPrintAtInv
	call SPPrintAtInv
	pop hl
	jr draw_text_loop
	.draw_text_nl
	ld a, (_pt)
	ld (_px), a
	ld a, (_py)
	inc a
	ld (_py), a
	jr draw_text_loop
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
	ld de, 22528
	ld b, 3
	.clearb1
	push bc
	ld b, 255
	.clearb2
	ld a, (de)
	and 199
	ld (de), a
	inc de
	djnz clearb2
	pop bc
	djnz clearb1
	ld a, 8
	.repitatodo
	ld c, a
	ld hl, 16384
	ld a, 12
	.bucle
	ld b, a
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
	ld a, b
	dec a
	jr nz, bucle
	ld a, c
	dec a
	jr nz, repitatodo
	ret


	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"
;	SECTION	text

._malotes
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
	defb	192
	defb	128
	defb	32
	defb	128
	defb	192
	defb	128
	defb	-2
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
	defb	208
	defb	128
	defb	208
	defb	112
	defb	208
	defb	128
	defb	0
	defb	-1
	defb	6
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
	defb	128
	defb	16
	defb	128
	defb	16
	defb	128
	defb	32
	defb	0
	defb	0
	defb	6
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
	defb	96
	defb	176
	defb	80
	defb	176
	defb	96
	defb	0
	defb	-1
	defb	6
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
	defb	16
	defb	144
	defb	16
	defb	144
	defb	80
	defb	0
	defb	1
	defb	2
	defs	1
	defb	96
	defb	32
	defb	96
	defb	32
	defb	96
	defb	80
	defb	0
	defb	1
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
	defb	112
	defb	16
	defb	112
	defb	208
	defb	112
	defb	2
	defb	0
	defb	4
	defs	1
	defb	80
	defb	16
	defb	80
	defb	0
	defb	80
	defb	16
	defb	0
	defb	0
	defb	6
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
	defb	176
	defb	32
	defb	176
	defb	16
	defb	176
	defb	32
	defb	0
	defb	0
	defb	6
	defs	1
	defb	160
	defb	96
	defb	160
	defb	80
	defb	160
	defb	96
	defb	0
	defb	0
	defb	6
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
	defb	80
	defb	96
	defb	64
	defb	96
	defb	80
	defb	0
	defb	0
	defb	6
	defs	1
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	112
	defb	0
	defb	1
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
	defb	32
	defb	80
	defb	32
	defb	80
	defb	32
	defb	128
	defb	0
	defb	1
	defb	2
	defs	1
	defb	208
	defb	48
	defb	208
	defb	48
	defb	208
	defb	128
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
	defb	176
	defb	48
	defb	112
	defb	48
	defb	176
	defb	48
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
	defb	64
	defb	128
	defb	64
	defb	64
	defb	64
	defb	128
	defb	0
	defb	-1
	defb	4
	defs	1
	defb	80
	defb	48
	defb	80
	defb	48
	defb	144
	defb	48
	defb	2
	defb	0
	defb	2
	defs	1
	defb	16
	defb	112
	defb	16
	defb	112
	defb	208
	defb	128
	defb	1
	defb	1
	defb	3
	defs	1
	defb	16
	defb	16
	defb	16
	defb	16
	defb	16
	defb	112
	defb	0
	defb	2
	defb	4
	defs	1
	defb	192
	defb	16
	defb	176
	defb	16
	defb	192
	defb	16
	defb	0
	defb	0
	defb	6
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
	defb	32
	defb	96
	defb	32
	defb	192
	defb	64
	defb	2
	defb	2
	defb	3
	defs	1
	defb	80
	defb	32
	defb	80
	defb	32
	defb	80
	defb	128
	defb	0
	defb	1
	defb	2
	defs	1
	defb	32
	defb	16
	defb	32
	defb	16
	defb	32
	defb	112
	defb	0
	defb	2
	defb	2
	defs	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	96
	defb	0
	defb	1
	defb	2
	defs	1
	defb	128
	defb	96
	defb	128
	defb	48
	defb	128
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
	defb	192
	defb	80
	defb	160
	defb	80
	defb	192
	defb	80
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	32
	defb	32
	defb	32
	defb	32
	defb	32
	defb	80
	defb	0
	defb	1
	defb	2
	defs	1
	defb	208
	defb	48
	defb	208
	defb	32
	defb	208
	defb	48
	defb	0
	defb	0
	defb	2
	defs	1
	defb	208
	defb	128
	defb	80
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	144
	defb	48
	defb	128
	defb	48
	defb	144
	defb	48
	defb	0
	defb	0
	defb	6
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
	defb	128
	defb	144
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	48
	defb	128
	defb	16
	defb	128
	defb	48
	defb	128
	defb	-1
	defb	0
	defb	2
	defs	1
	defb	16
	defb	80
	defb	16
	defb	80
	defb	208
	defb	96
	defb	1
	defb	1
	defb	3
	defs	1
	defb	16
	defb	128
	defb	16
	defb	128
	defb	112
	defb	128
	defb	2
	defb	0
	defb	1
	defs	1
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	1
	defb	0
	defb	1
	defs	1
	defb	96
	defb	48
	defb	96
	defb	32
	defb	96
	defb	48
	defb	0
	defb	0
	defb	6
	defs	1
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	48
	defb	0
	defb	1
	defb	2
	defs	1
	defb	32
	defb	48
	defb	32
	defb	48
	defb	48
	defb	128
	defb	2
	defb	2
	defb	3
	defs	1
	defb	208
	defb	128
	defb	144
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	1
	defs	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	64
	defb	48
	defb	0
	defb	0
	defb	6
	defs	1
	defb	192
	defb	64
	defb	192
	defb	64
	defb	208
	defb	64
	defb	0
	defb	0
	defb	6
	defs	1
	defb	16
	defb	16
	defb	16
	defb	16
	defb	16
	defb	128
	defb	0
	defb	4
	defb	2
	defs	1
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	80
	defb	1
	defb	1
	defb	3
	defs	1
	defb	112
	defb	48
	defb	112
	defb	48
	defb	112
	defb	128
	defb	0
	defb	1
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
	defb	144
	defb	48
	defb	144
	defb	48
	defb	160
	defb	48
	defb	0
	defb	0
	defb	6
	defs	1
	defb	80
	defb	16
	defb	80
	defb	16
	defb	96
	defb	16
	defb	0
	defb	0
	defb	6
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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

._e_scripts
	defw	_mscce_8
	defw	0
	defw	_mscce_7
	defw	0
	defw	_mscce_13
	defw	_mscce_5
	defw	0
	defw	_mscce_2
	defw	0
	defw	_mscce_14
	defw	0
	defw	_mscce_4
	defw	_mscce_10
	defw	0
	defw	0
	defw	_mscce_3
	defw	_mscce_12
	defw	0
	defw	_mscce_9
	defw	0
	defw	0
	defw	0
	defw	_mscce_11
	defw	_mscce_6
	defw	_mscce_0
	defw	_mscce_1

;	SECTION	code

;	SECTION	text

._f_scripts
	defw	_msccf_6
	defw	0
	defw	_msccf_5
	defw	0
	defw	0
	defw	_msccf_3
	defw	0
	defw	_msccf_0
	defw	0
	defw	0
	defw	0
	defw	_msccf_2
	defw	_msccf_8
	defw	0
	defw	0
	defw	_msccf_1
	defw	0
	defw	0
	defw	_msccf_7
	defw	0
	defw	0
	defw	0
	defw	_msccf_9
	defw	_msccf_4
	defw	0

;	SECTION	code

	._mscce_0
	defb 0x0F, 0xF0, 0xFF, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x01, 0x03, 0x03, 0x01, 0x04, 0x04, 0xFF, 0xFF
	._mscce_1
	defb 0x2A, 0x10, 0x06, 0x00, 0x10, 0x08, 0x01, 0x10, 0x09, 0x01, 0x10, 0x0A, 0x01, 0xFF, 0x01, 0x06, 0x01, 0xE3, 0x21, 0x00, 0x22, 0x2F, 0x2C, 0x34, 0x00, 0x33, 0x28, 0x2F, 0x37, 0x25, 0x24, 0x00, 0x33, 0x2F, 0x2D, 0x25, 0x37, 0x28, 0x25, 0x32, 0x25, 0xEE, 0xFF, 0xFF
	._mscce_2
	defb 0x0D, 0x13, 0x07, 0x01, 0xFF, 0x20, 0x0D, 0x03, 0x1D, 0x20, 0x0D, 0x04, 0x1E, 0xFF, 0x09, 0x10, 0x06, 0x01, 0xFF, 0x20, 0x0A, 0x05, 0x1C, 0xFF, 0xFF
	._mscce_3
	defb 0x07, 0xF0, 0xFF, 0x20, 0x0B, 0x07, 0x1F, 0xFF, 0xFF
	._mscce_4
	defb 0x07, 0xF0, 0xFF, 0x20, 0x0C, 0x08, 0x1F, 0xFF, 0xFF
	._mscce_5
	defb 0x0F, 0x13, 0x01, 0x00, 0xFF, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x01, 0x20, 0x06, 0x06, 0x8B, 0xFF, 0xFF
	._mscce_6
	defb 0x0F, 0x13, 0x02, 0x00, 0xFF, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x02, 0x20, 0x0C, 0x07, 0x8B, 0xFF, 0xFF
	._mscce_7
	defb 0x0F, 0x13, 0x03, 0x00, 0xFF, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x03, 0x20, 0x07, 0x06, 0x8B, 0xFF, 0xFF
	._mscce_8
	defb 0x0F, 0x13, 0x04, 0x00, 0xFF, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x04, 0x20, 0x02, 0x05, 0x8B, 0xFF, 0xFF
	._mscce_9
	defb 0x07, 0xF0, 0xFF, 0x20, 0x06, 0x08, 0x19, 0xFF, 0xFF
	._mscce_10
	defb 0x07, 0xF0, 0xFF, 0x20, 0x07, 0x05, 0x1A, 0xFF, 0xFF
	._mscce_11
	defb 0x07, 0xF0, 0xFF, 0x20, 0x04, 0x08, 0x1B, 0xFF, 0xFF
	._mscce_12
	defb 0x1F, 0xF0, 0xFF, 0xE3, 0x29, 0x2E, 0x00, 0x34, 0x28, 0x25, 0x00, 0x30, 0x32, 0x2F, 0x36, 0x29, 0x2E, 0x23, 0x25, 0x00, 0x2F, 0x26, 0x00, 0x22, 0x21, 0x24, 0x21, 0x2A, 0x2F, 0x3A, 0xEE, 0xFF, 0xFF
	._mscce_13
	defb 0x1B, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x36, 0x25, 0x2E, 0x24, 0x2F, 0x00, 0x2D, 0x2F, 0x34, 0x2F, 0x00, 0x33, 0x25, 0x2D, 0x29, 0x2E, 0x35, 0x25, 0x36, 0x21, 0xEE, 0xFF, 0xFF
	._mscce_14
	defb 0x1A, 0xF0, 0xFF, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x21, 0x32, 0x2F, 0x27, 0x21, 0x33, 0x00, 0x25, 0x2E, 0x34, 0x32, 0x25, 0x27, 0x21, 0x27, 0x21, 0x33, 0xEE, 0xFF, 0xFF
	._msccf_0
	defb 0x3A, 0x20, 0x0A, 0x04, 0x10, 0x06, 0x01, 0x13, 0x07, 0x01, 0x10, 0x05, 0x04, 0xFF, 0x01, 0x07, 0x01, 0x20, 0x0D, 0x03, 0x00, 0x20, 0x0D, 0x04, 0x1D, 0xE1, 0xE0, 0x09, 0x20, 0x0D, 0x04, 0x00, 0xE1, 0xE0, 0x09, 0xE3, 0x22, 0x25, 0x23, 0x2F, 0x2D, 0x25, 0x00, 0x21, 0x00, 0x34, 0x32, 0x35, 0x25, 0x00, 0x27, 0x2F, 0x24, 0x24, 0x25, 0x33, 0x33, 0xEE, 0xFF, 0xFF
	._msccf_1
	defb 0x08, 0x20, 0x0B, 0x06, 0xFF, 0xE2, 0xE0, 0x02, 0xFF, 0xFF
	._msccf_2
	defb 0x08, 0x20, 0x0C, 0x07, 0xFF, 0xE2, 0xE0, 0x02, 0xFF, 0xFF
	._msccf_3
	defb 0x14, 0x20, 0x06, 0x06, 0xFF, 0xE0, 0x06, 0x14, 0x01, 0x05, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x01, 0x20, 0x06, 0x06, 0x8B, 0xFF, 0xFF
	._msccf_4
	defb 0x14, 0x20, 0x0C, 0x07, 0xFF, 0xE0, 0x06, 0x14, 0x02, 0x05, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x02, 0x20, 0x0C, 0x07, 0x8B, 0xFF, 0xFF
	._msccf_5
	defb 0x14, 0x20, 0x07, 0x06, 0xFF, 0xE0, 0x06, 0x14, 0x03, 0x05, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x03, 0x20, 0x07, 0x06, 0x8B, 0xFF, 0xFF
	._msccf_6
	defb 0x14, 0x20, 0x02, 0x05, 0xFF, 0xE0, 0x06, 0x14, 0x04, 0x05, 0x01, 0x0B, 0x14, 0x12, 0x0B, 0x04, 0x20, 0x02, 0x05, 0x8B, 0xFF, 0xFF
	._msccf_7
	defb 0x2B, 0x20, 0x06, 0x07, 0x10, 0x05, 0x02, 0xFF, 0xE0, 0x07, 0xE3, 0x00, 0x00, 0x00, 0x00, 0x32, 0x2F, 0x23, 0x2B, 0x00, 0x34, 0x25, 0x2D, 0x30, 0x2C, 0x25, 0x00, 0x21, 0x23, 0x34, 0x29, 0x36, 0x21, 0x34, 0x25, 0x24, 0xEE, 0x01, 0x08, 0x01, 0x01, 0x05, 0x00, 0xFF, 0xFF
	._msccf_8
	defb 0x2B, 0x20, 0x07, 0x04, 0x10, 0x05, 0x03, 0xFF, 0xE0, 0x07, 0xE3, 0x00, 0x00, 0x00, 0x30, 0x21, 0x30, 0x25, 0x32, 0x00, 0x34, 0x25, 0x2D, 0x30, 0x2C, 0x25, 0x00, 0x21, 0x23, 0x34, 0x29, 0x36, 0x21, 0x34, 0x25, 0x24, 0xEE, 0x01, 0x09, 0x01, 0x01, 0x05, 0x00, 0xFF, 0xFF
	._msccf_9
	defb 0x2D, 0x20, 0x04, 0x07, 0x10, 0x05, 0x01, 0xFF, 0xE0, 0x07, 0xE3, 0x00, 0x00, 0x33, 0x23, 0x29, 0x33, 0x33, 0x2F, 0x32, 0x33, 0x00, 0x34, 0x25, 0x2D, 0x30, 0x2C, 0x25, 0x00, 0x21, 0x23, 0x34, 0x29, 0x36, 0x21, 0x34, 0x25, 0x24, 0xEE, 0x01, 0x0A, 0x01, 0x01, 0x05, 0x00, 0xFF, 0xFF

._msc_init_all
	dec	sp
	ld	hl,0	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_33
.i_31
	ld	hl,0	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_33
	ld	hl,0	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(32 % 256)
	jp	z,i_32
	jp	nc,i_32
	ld	hl,_items
	push	hl
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_31
.i_32
	ld	hl,0	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_36
.i_34
	ld	hl,0	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_36
	ld	hl,0	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(32 % 256)
	jp	z,i_35
	jp	nc,i_35
	ld	de,_flags
	ld	hl,2-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_34
.i_35
	inc	sp
	ret



._read_byte
	dec	sp
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,(_script)
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_script)
	inc	hl
	ld	(_script),hl
	ld	hl,0	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	sp
	ret



._read_vbyte
	dec	sp
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	_read_byte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	ld	a,(hl)
	rlca
	jp	nc,i_37
	ld	hl,_flags
	push	hl
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	and	#(127 % 256)
	ld	l,a
	ld	h,0
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	inc	sp
	ret


.i_37
	ld	hl,0	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	inc	sp
	ret



._run_script
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	dec	sp
	ld	a,l
	pop	hl
	ld	l,a
	push	hl
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	dec	sp
	ld	a,l
	pop	hl
	ld	l,a
	push	hl
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	dec	sp
	ld	a,l
	pop	hl
	ld	l,a
	push	hl
	push	bc
	push	bc
	push	bc
	dec	sp
	ld	hl,(_script)
	ld	a,h
	or	l
	jp	nz,i_38
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_38
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_39
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	_read_byte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,255	;const
	call	l_eq
	jp	c,i_40
.i_41
	ld	de,(_script)
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	pop	bc
	push	hl
	ld	hl,8	;const
	add	hl,sp
	push	hl
	ld	hl,9	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	pop	de
	ld	a,l
	ld	(de),a
.i_42
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	jp	nc,i_43
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	_read_byte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
.i_46
	ld	a,l
	cp	#(16% 256)
	jp	z,i_47
	cp	#(19% 256)
	jp	z,i_49
	cp	#(32% 256)
	jp	z,i_51
	cp	#(240% 256)
	jp	z,i_55
	cp	#(255% 256)
	jp	z,i_56
	jp	i_45
.i_47
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_flags
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_ne
	jp	nc,i_48
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_48
	jp	i_45
.i_49
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_flags
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,6-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_eq
	jp	nc,i_50
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_50
	jp	i_45
.i_51
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,5	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_ge
	jp	nc,i_53
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_le
	jp	nc,i_53
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_ge
	jp	nc,i_53
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_le
	jp	nc,i_53
	ld	hl,1	;const
	jr	i_54
.i_53
	ld	hl,0	;const
.i_54
	call	l_lneg
	jp	nc,i_52
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_52
.i_55
	jp	i_45
.i_56
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	hl,7	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_45
	jp	i_42
.i_43
	ld	hl,7	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_57
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
.i_58
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	jp	nc,i_59
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	_read_byte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
.i_62
	ld	a,l
	cp	#(1% 256)
	jp	z,i_63
	cp	#(18% 256)
	jp	z,i_64
	cp	#(20% 256)
	jp	z,i_65
	cp	#(32% 256)
	jp	z,i_66
	cp	#(224% 256)
	jp	z,i_67
	cp	#(225% 256)
	jp	z,i_68
	cp	#(226% 256)
	jp	z,i_69
	cp	#(227% 256)
	jp	z,i_70
	cp	#(255% 256)
	jp	z,i_74
	jp	i_61
.i_63
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_flags
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	jp	i_61
.i_64
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,5	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_flags
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_flags
	ld	hl,10-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_flags
	ld	hl,11-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_61
.i_65
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,5	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	de,_flags
	ld	hl,10-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	de,_flags
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_flags
	ld	hl,9-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	de,_flags
	ld	hl,7-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	jp	i_61
.i_66
	ld	hl,6	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,5	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_map_buff
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,9	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,9-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,_map_attr
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,9	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,9-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,7	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,2
	add	hl,de
	ex	de,hl
	ld	hl,9-2	;const
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
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	jp	i_61
.i_67
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	_peta_el_beeper
	jp	i_61
.i_68
	call	sp_UpdateNow
	jp	i_61
.i_69
	ld	hl,_player+26
	ld	(hl),#(100 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_61
.i_70
	ld	hl,6	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
.i_71
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	_read_byte
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,238	;const
	call	l_eq
	jp	c,i_72
.i_73
	ld	hl,23 % 256	;const
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
	ld	hl,10	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,6	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
	jp	i_71
.i_72
	jp	i_61
.i_74
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_61
	jp	i_58
.i_59
.i_57
	pop	hl
	push	hl
	ld	(_script),hl
	jp	i_39
.i_40
	ld	hl,9	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret



._clear_gamearea_tiles
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_77
.i_75
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_77
	ld	a,(_gpit)
	cp	#(10 % 256)
	jp	z,i_76
	jp	nc,i_76
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpjt),a
	jp	i_80
.i_78
	ld	hl,_gpjt
	ld	a,(hl)
	inc	(hl)
.i_80
	ld	a,(_gpjt)
	cp	#(15 % 256)
	jp	z,i_79
	jp	nc,i_79
	ld	a,(_gpjt)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,47 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	jp	i_78
.i_79
	jp	i_75
.i_76
	ret



._attr
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_82
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_82
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,14	;const
	pop	de
	call	l_gt
	jp	c,i_82
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,9	;const
	pop	de
	call	l_gt
	jp	nc,i_81
.i_82
	ld	hl,0 % 256	;const
	ret


.i_81
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



._collide
	ld	hl,8	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(13 % 256)
	jp	z,i_84
	jp	c,i_84
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-13
	add	hl,bc
	jp	i_85
.i_84
	ld	hl,0	;const
.i_85
	ld	h,0
	ld	a,l
	ld	(_l1x),a
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_l2x),a
	ld	hl,6	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(13 % 256)
	jp	z,i_86
	jp	c,i_86
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-13
	add	hl,bc
	jp	i_87
.i_86
	ld	hl,0	;const
.i_87
	ld	h,0
	ld	a,l
	ld	(_l1y),a
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_l2y),a
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l1x)
	ld	h,0
	call	l_uge
	jp	nc,i_88
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l2x)
	ld	h,0
	call	l_ule
	jp	nc,i_88
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l1y)
	ld	h,0
	call	l_uge
	jp	nc,i_88
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l2y)
	ld	h,0
	call	l_ule
	jp	nc,i_88
	ld	hl,1	;const
	jr	i_89
.i_88
	ld	hl,0	;const
.i_89
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
	pop	bc
	pop	hl
	push	hl
	push	bc
	xor	a
	or	h
	jp	p,i_90
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_90
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_91
	ret



._espera_activa
	ld	a,#(1 % 256 % 256)
	ld	(_res),a
	ld	hl,0	;const
	ld	(_gpint),hl
	jp	i_94
.i_92
	ld	hl,(_gpint)
	inc	hl
	ld	(_gpint),hl
	dec	hl
.i_94
	ld	de,(_gpint)
	ld	hl,4-2	;const
	add	hl,sp
	call	l_gint	;
	call	l_ult
	jp	nc,i_95
	ld	a,(_res)
	and	a
	jr	nz,i_96_i_95
.i_95
	jp	i_93
.i_96_i_95
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpjt),a
	jp	i_99
.i_97
	ld	hl,_gpjt
	ld	a,(hl)
	inc	(hl)
.i_99
	ld	a,(_gpjt)
	cp	#(250 % 256)
	jp	z,i_98
	jp	nc,i_98
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_res),a
	jp	i_97
.i_98
	call	_pad_read
	ld	a,(_pad0)
	cp	#(255 % 256)
	jp	z,i_100
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_res),a
.i_100
	jp	i_92
.i_93
	ld	hl,(_res)
	ld	h,0
	ld	a,l
	call	l_sxt
	ret



._game_ending
	call	sp_UpdateNow
	ld	hl,_s_ending
	call	_unpack
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_103
.i_101
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_103
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_102
	jp	nc,i_102
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	ld	hl,2 % 256	;const
	call	_peta_el_beeper
	jp	i_101
.i_102
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._game_over
	ld	hl,11 % 256	;const
	ld	a,l
	ld	(_gpjt),a
	jp	i_106
.i_104
	ld	hl,_gpjt
	ld	a,(hl)
	inc	(hl)
.i_106
	ld	a,(_gpjt)
	cp	#(14 % 256)
	jp	z,i_105
	jp	nc,i_105
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_109
.i_107
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_109
	ld	a,(_gpit)
	cp	#(22 % 256)
	jp	z,i_108
	jp	nc,i_108
	ld	hl,(_gpjt)
	ld	h,0
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_107
.i_108
	jp	i_104
.i_105
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,39 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,33 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,45 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,14 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,37 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,16 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,47 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,17 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,54 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,18 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,37 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,50 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,20 % 256	;const
	push	hl
	ld	hl,95 % 256	;const
	push	hl
	ld	hl,1 % 256	;const
	push	hl
	call	sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_112
.i_110
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_112
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_111
	jp	nc,i_111
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	ld	hl,2 % 256	;const
	call	_peta_el_beeper
	jp	i_110
.i_111
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._init_bullets
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_115
.i_113
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_115
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_114
	jp	nc,i_114
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_113
.i_114
	ret



._init_malotes
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_118
.i_116
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_118
	ld	a,(_gpit)
	cp	#(72 % 256)
	jp	z,i_117
	jp	nc,i_117
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
	ld	l,(hl)
	ld	h,0
	jp	i_116
.i_117
	ret



._fire_bullet
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_bit),a
	jp	i_121
.i_119
	ld	hl,_bit
	ld	a,(hl)
	inc	(hl)
.i_121
	ld	a,(_bit)
	cp	#(3 % 256)
	jp	z,i_120
	jp	nc,i_120
	ld	de,_bullets_estado
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	nz,i_122
	ld	de,_bullets_estado
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	a,(_player+22)
	and	a
	jp	nz,i_123
	ld	de,_bullets_x
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_bullets_mx
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,65528	;const
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_124
.i_123
	ld	de,_bullets_x
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,12
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	de,_bullets_mx
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,8	;const
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_124
	ld	de,_bullets_y
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	bc,4
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6 % 256	;const
	call	_peta_el_beeper
	ld	a,(_player+26)
	cp	#(2 % 256)
	jp	z,i_125
	jp	c,i_125
	ld	hl,_player+26
	push	hl
	ld	l,(hl)
	ld	h,0
	dec	hl
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_126
.i_125
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_126
	jp	i_120
.i_122
	jp	i_119
.i_120
	ret



._player_hidden
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_128
	inc	hl
	ld	hl,(_player+6)
	ld	de,0	;const
	call	l_eq
	jr	c,i_129_i_128
.i_128
	jp	i_127
.i_129_i_128
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,2	;const
	ex	de,hl
	call	l_eq
	jp	c,i_131
	ld	hl,(__xx)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	a,l
	call	l_sxt
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,2	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_132
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_132
	ld	hl,1	;const
	jr	i_133
.i_132
	ld	hl,0	;const
.i_133
	ld	a,h
	or	l
	jp	nz,i_131
	jr	i_134
.i_131
	ld	hl,1	;const
.i_134
	ld	a,h
	or	l
	jp	z,i_130
	ld	hl,1	;const
	ld	a,l
	call	l_sxt
	ret


.i_130
.i_127
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	ret



._move
	ld	hl,(_player)
	ld	(_cx),hl
	ld	hl,(_player+1+1)
	ld	(_cy),hl
	call	_pad_read
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player+8)
	ld	de,384	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_135
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
	jp	i_136
.i_135
	ld	hl,384	;const
	ld	(_player+8),hl
.i_136
	ld	a,(_player+25)
	and	a
	jp	z,i_137
	ld	hl,0	;const
	ld	(_player+8),hl
.i_137
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
	jp	p,i_138
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_138
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_139
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_139
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
	ld	(__xx),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_140
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_142
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_143
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_143
	ld	hl,1	;const
	jr	i_144
.i_143
	ld	hl,0	;const
.i_144
	ld	a,h
	or	l
	jp	nz,i_142
	jr	i_145
.i_142
	ld	hl,1	;const
.i_145
	ld	a,h
	or	l
	jp	z,i_141
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_141
	jp	i_146
.i_140
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_148
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jr	c,i_149_i_148
.i_148
	jp	i_147
.i_149_i_148
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_150
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	c,i_152
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_153
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_153
	ld	hl,1	;const
	jr	i_154
.i_153
	ld	hl,0	;const
.i_154
	ld	a,h
	or	l
	jp	nz,i_152
	jr	i_155
.i_152
	ld	hl,1	;const
.i_155
	ld	a,h
	or	l
	jp	z,i_151
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player+1+1
	push	hl
	ld	a,(__yy)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_151
.i_150
.i_147
.i_146
	ld	hl,_gpit
	ld	a,(hl)
	rrca
	jp	c,i_156
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	ld	bc,-48
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+8)
	ld	de,65152	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_157
	ld	hl,65152	;const
	ld	(_player+8),hl
.i_157
	ld	hl,_jetpac_frame_counter
	ld	a,(hl)
	inc	(hl)
	ld	a,(_jetpac_frame_counter)
	cp	#(11 % 256)
	jp	nz,i_158
	ld	a,#(8 % 256 % 256)
	ld	(_jetpac_frame_counter),a
	ld	hl,_player+26
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_158
	jp	i_159
.i_156
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_jetpac_frame_counter),a
.i_159
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_161
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_161
	ld	hl,0	;const
	jr	i_162
.i_161
	ld	hl,1	;const
.i_162
	call	l_lneg
	jp	nc,i_160
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_163
	or	l
	jp	z,i_163
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
	jp	p,i_164
	ld	hl,0	;const
	ld	(_player+6),hl
.i_164
	jp	i_165
.i_163
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_166
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
	jp	m,i_167
	or	l
	jp	z,i_167
	ld	hl,0	;const
	ld	(_player+6),hl
.i_167
.i_166
.i_165
.i_160
	ld	hl,_gpit
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_168
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_169
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
.i_169
.i_168
	ld	hl,_gpit
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_170
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_171
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
.i_171
.i_170
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
	jp	p,i_172
	ld	hl,0	;const
	ld	(_player),hl
.i_172
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_173
	ld	hl,14336	;const
	ld	(_player),hl
.i_173
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
	ld	(__yy),a
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_174
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_176
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_177
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_177
	ld	hl,1	;const
	jr	i_178
.i_177
	ld	hl,0	;const
.i_178
	ld	a,h
	or	l
	jp	nz,i_176
	jr	i_179
.i_176
	ld	hl,1	;const
.i_179
	ld	a,h
	or	l
	jp	z,i_175
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_175
	jp	i_180
.i_174
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_182
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_183
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_183
	ld	hl,1	;const
	jr	i_184
.i_183
	ld	hl,0	;const
.i_184
	ld	a,h
	or	l
	jp	nz,i_182
	jr	i_185
.i_182
	ld	hl,1	;const
.i_185
	ld	a,h
	or	l
	jp	z,i_181
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,_player
	push	hl
	ld	a,(__xx)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_181
.i_180
	ld	hl,_gpit
	ld	a,(hl)
	and	#(128 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_187
	inc	hl
	ld	a,(_player+31)
	cp	#(0 % 256)
	jr	z,i_188_i_187
.i_187
	jp	i_186
.i_188_i_187
	ld	hl,_player+31
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_fire_bullet
.i_186
	ld	hl,_gpit
	ld	a,(hl)
	rlca
	jp	nc,i_189
	ld	hl,_player+31
	ld	(hl),#(0 % 256 % 256)
.i_189
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
	ld	(__xx),a
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h
	or	l
	jp	z,i_191
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_192
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_192
	inc	hl
	jr	i_193
.i_192
	ld	hl,0	;const
.i_193
	ld	a,h
	or	l
	jp	nz,i_191
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_194
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_194
	inc	hl
	jr	i_195
.i_194
	ld	hl,0	;const
.i_195
	ld	a,h
	or	l
	jp	nz,i_191
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_196
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_196
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_196
	inc	hl
	jr	i_197
.i_196
	ld	hl,0	;const
.i_197
	ld	a,h
	or	l
	jp	nz,i_191
	jr	i_198
.i_191
	ld	hl,1	;const
.i_198
	ld	a,h
	or	l
	jp	z,i_190
	ld	a,(_player+26)
	and	a
	jp	z,i_199
	ld	hl,4 % 256	;const
	call	_peta_el_beeper
	ld	hl,_player+26
	dec	(hl)
	ld	de,_player
	ld	hl,(_cx)
	call	l_pint
	ld	de,_player+1+1
	ld	hl,(_cy)
	call	l_pint
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	l_neg
	pop	de
	call	l_pint
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	call	l_neg
	pop	de
	call	l_pint
.i_199
.i_190
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
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	z,i_200
	ld	a,(_player+22)
	and	a
	jp	nz,i_201
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_8_a
	pop	de
	call	l_pint
	jp	i_202
.i_201
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_4_a
	pop	de
	call	l_pint
.i_202
	jp	i_203
.i_200
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_204
	ld	a,(_player+22)
	and	a
	jp	nz,i_205
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_6_a
	pop	de
	call	l_pint
	jp	i_206
.i_205
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_2_a
	pop	de
	call	l_pint
.i_206
	jp	i_207
.i_204
	ld	hl,_player+21
	inc	(hl)
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_208
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
.i_208
	ld	a,(_player+22)
	and	a
	jp	nz,i_209
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_211
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_210
.i_211
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_6_a
	pop	de
	call	l_pint
	jp	i_213
.i_210
	ld	a,(_player+20)
	and	a
	jp	nz,i_214
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_5_a
	pop	de
	call	l_pint
	jp	i_215
.i_214
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_216
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_7_a
	pop	de
	call	l_pint
.i_216
.i_215
.i_213
	jp	i_217
.i_209
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_219
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_218
.i_219
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_2_a
	pop	de
	call	l_pint
	jp	i_221
.i_218
	ld	a,(_player+20)
	and	a
	jp	nz,i_222
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_1_a
	pop	de
	call	l_pint
	jp	i_223
.i_222
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_224
	ld	hl,_player+17
	push	hl
	ld	hl,_sprite_3_a
	pop	de
	call	l_pint
.i_224
.i_223
.i_221
.i_217
.i_207
.i_203
	ret



._init_player
	ld	hl,_player
	ld	(hl),#(8192 % 256)
	inc	hl
	ld	(hl),#(8192 / 256)
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
	ld	a,#(24 % 256)
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
	ld	hl,_player+26
	ld	(hl),#(100 % 256 % 256)
	ld	hl,_player+27
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+28
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+30
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+31
	ld	(hl),#(0 % 256 % 256)
	ld	hl,7 % 256	;const
	ld	a,l
	ld	(_pant_final),a
	ret



._draw_scr
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdm),a
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,75
	call	l_mult
	ld	(_gpint),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_227
.i_225
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_227
	ld	a,(_gpit)
	cp	#(75 % 256)
	jp	z,i_226
	jp	nc,i_226
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
	ld	(_rdm),a
	ld	hl,_mapa
	push	hl
	ld	hl,(_gpint)
	inc	hl
	ld	(_gpint),hl
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
	ld	(_rda),a
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdb),a
	ld	de,_map_attr
	ld	hl,(_rdm)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	call	_rand
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	de,2	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_229
	ld	a,(_rda)
	cp	#(0 % 256)
	jp	nz,i_229
	ld	hl,_map_buff
	push	hl
	ld	hl,(_rdm)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	cp	#(0 % 256)
	jr	z,i_230_i_229
.i_229
	jp	i_228
.i_230_i_229
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rda),a
.i_228
	ld	hl,(_rdx)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rda)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	de,_map_buff
	ld	hl,(_rdm)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_rda
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
	jp	nz,i_231
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_231
	ld	hl,_rdm
	ld	a,(hl)
	inc	(hl)
	ld	de,_map_attr
	ld	hl,(_rdm)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_rdb)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	call	_rand
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	de,2	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_233
	ld	a,(_rdb)
	cp	#(0 % 256)
	jp	nz,i_233
	ld	hl,_map_buff
	push	hl
	ld	hl,(_rdm)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	cp	#(0 % 256)
	jr	z,i_234_i_233
.i_233
	jp	i_232
.i_234_i_233
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rdb),a
.i_232
	ld	hl,(_rdx)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,(_rdb)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	de,_map_buff
	ld	hl,(_rdm)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_rdb
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
	jp	nz,i_235
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_235
	jp	i_225
.i_226
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_enoffs),a
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_238
.i_236
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_238
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_237
	jp	nc,i_237
	ld	de,_en_an_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_count
	ld	hl,(_gpit)
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
	cp	#(6% 256)
	jp	z,i_246
	jp	i_247
.i_242
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_9_a
	pop	de
	call	l_pint
	jp	i_240
.i_243
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_11_a
	pop	de
	call	l_pint
	jp	i_240
.i_244
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_13_a
	pop	de
	call	l_pint
	jp	i_240
.i_245
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_15_a
	pop	de
	call	l_pint
	jp	i_240
.i_246
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_13_a
	pop	de
	call	l_pint
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_gpit)
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
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
	ld	hl,(_gpit)
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
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
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
	pop	de
	call	l_pint
	ld	de,_en_an_state
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
.i_247
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
.i_240
	ld	hl,_enoffsmasi
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	jp	i_236
.i_237
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
	ld	hl,23 % 256	;const
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,71 % 256	;const
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
	ld	hl,(_e_scripts+50)
	ld	(_script),hl
	call	_run_script
	ld	hl,_e_scripts
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
	call	_init_bullets
	ret



._mueve_bullets
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
	cp	#(3 % 256)
	jp	z,i_252
	jp	nc,i_252
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
	push	hl
	ld	de,_bullets_y
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_254
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
.i_254
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,8	;const
	call	l_ult
	jp	c,i_256
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,240	;const
	call	l_ugt
	jp	nc,i_255
.i_256
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_255
	jp	i_251
.i_252
	ret



._distance
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,10-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	call	_abs
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_dx),a
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	call	_abs
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_dy),a
	ld	hl,(_dx)
	ld	h,0
	ex	de,hl
	ld	hl,(_dy)
	ld	h,0
	call	l_ult
	jp	nc,i_258
	ld	hl,(_dx)
	ld	h,0
	jp	i_259
.i_258
	ld	hl,(_dy)
	ld	h,0
.i_259
	ld	h,0
	ld	a,l
	ld	(_mn),a
	ld	hl,(_dx)
	ld	h,0
	ex	de,hl
	ld	hl,(_dy)
	ld	h,0
	add	hl,de
	push	hl
	ld	a,(_mn)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asr_u
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,(_mn)
	ld	e,a
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asr_u
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,(_mn)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	pop	de
	add	hl,de
	ld	h,0
	ret



._mueve_bicharracos
	ld	hl,_player+25
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_262
.i_260
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_262
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_261
	jp	nc,i_261
	ld	hl,(_enoffs)
	ld	h,0
	ex	de,hl
	ld	hl,(_enit)
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_263
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
	ld	l,(hl)
	ld	h,0
	ld	(_cx),hl
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
	ld	l,(hl)
	ld	h,0
	ld	(_cy),hl
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
	ld	l,(hl)
	ld	h,0
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
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
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	inc	(hl)
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_264
	ld	de,_en_an_count
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
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
.i_267
	ld	a,l
	cp	#(1% 256)
	jp	z,i_268
	cp	#(2% 256)
	jp	z,i_271
	cp	#(3% 256)
	jp	z,i_274
	cp	#(6% 256)
	jp	z,i_275
	cp	#(4% 256)
	jp	z,i_278
	jp	i_266
.i_268
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_269
	ld	hl,_sprite_9_a
	jp	i_270
.i_269
	ld	hl,_sprite_10_a
.i_270
	pop	de
	call	l_pint
	jp	i_266
.i_271
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_272
	ld	hl,_sprite_11_a
	jp	i_273
.i_272
	ld	hl,_sprite_12_a
.i_273
	pop	de
	call	l_pint
	jp	i_266
.i_274
.i_275
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_276
	ld	hl,_sprite_13_a
	jp	i_277
.i_276
	ld	hl,_sprite_14_a
.i_277
	pop	de
	call	l_pint
	jp	i_266
.i_278
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_279
	ld	hl,_sprite_15_a
	jp	i_280
.i_279
	ld	hl,_sprite_16_a
.i_280
	pop	de
	call	l_pint
.i_266
.i_264
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_281
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
	ld	(_ccx),a
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
	ld	(_ccy),a
	jp	i_282
.i_281
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_ccx),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_ccy),a
.i_282
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
	ld	de,4	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_283
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_284
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_286
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_286
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_286
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_286
	ld	hl,(_player+8)
	ld	de,65504	;const
	ex	de,hl
	call	l_ge
	jr	c,i_287_i_286
.i_286
	jp	i_285
.i_287_i_286
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(_ccy)
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_player+1+1)
	ld	de,1024	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_288
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_290
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_291
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_291
	ld	hl,1	;const
	jr	i_292
.i_291
	ld	hl,0	;const
.i_292
	ld	a,h
	or	l
	jp	nz,i_290
	jr	i_293
.i_290
	ld	hl,1	;const
.i_293
	ld	a,h
	or	l
	jp	z,i_289
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	ex	de,hl
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
.i_289
.i_288
.i_285
	jp	i_294
.i_284
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	m,i_295
	or	l
	jp	z,i_295
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_297
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_297
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_297
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-14
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_297
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_298_i_297
.i_297
	jp	i_296
.i_298_i_297
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(_ccy)
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_299
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_301
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_302
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_302
	ld	hl,1	;const
	jr	i_303
.i_302
	ld	hl,0	;const
.i_303
	ld	a,h
	or	l
	jp	nz,i_301
	jr	i_304
.i_301
	ld	hl,1	;const
.i_304
	ld	a,h
	or	l
	jp	z,i_300
	ld	a,(__yy)
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
.i_300
.i_299
.i_296
.i_295
.i_294
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_306
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_306
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_306
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_306
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_306
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_307_i_306
.i_306
	jp	i_305
.i_307_i_306
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_ccy)
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
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_gpx)
	ld	h,0
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
	ld	(__xx),a
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	p,i_308
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_310
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_311
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_311
	ld	hl,1	;const
	jr	i_312
.i_311
	ld	hl,0	;const
.i_312
	ld	a,h
	or	l
	jp	nz,i_310
	jr	i_313
.i_310
	ld	hl,1	;const
.i_313
	ld	a,h
	or	l
	jp	z,i_309
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	ex	de,hl
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
.i_309
	jp	i_314
.i_308
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	xor	a
	or	h
	jp	m,i_315
	or	l
	jp	z,i_315
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	c,i_317
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_318
	inc	hl
	ld	hl,(__xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(__yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_318
	ld	hl,1	;const
	jr	i_319
.i_318
	ld	hl,0	;const
.i_319
	ld	a,h
	or	l
	jp	nz,i_317
	jr	i_320
.i_317
	ld	hl,1	;const
.i_320
	ld	a,h
	or	l
	jp	z,i_316
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(__xx)
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
.i_316
.i_315
.i_314
.i_305
	jp	i_321
.i_283
	ld	hl,(_tocado)
	ld	h,0
	call	l_lneg
	jp	nc,i_323
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	push	hl
	call	_collide
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_323
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
	ld	de,16	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_323
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_324_i_323
.i_323
	jp	i_322
.i_324_i_323
	ld	a,(_player+26)
	and	a
	jp	z,i_325
	ld	a,#(1 % 256 % 256)
	ld	(_tocado),a
	ld	hl,4 % 256	;const
	call	_peta_el_beeper
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
	ld	de,4	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_326
	ld	a,(_player+26)
	cp	#(25 % 256)
	jp	z,i_327
	jp	c,i_327
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(-25 % 256)
	ld	(hl),a
	ld	l,a
	ld	h,0
	jp	i_328
.i_327
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_328
	jp	i_329
.i_326
	ld	a,(_player+26)
	cp	#(10 % 256)
	jp	z,i_330
	jp	c,i_330
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(-10 % 256)
	ld	(hl),a
	ld	l,a
	ld	h,0
	jp	i_331
.i_330
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_331
.i_329
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_325
.i_322
.i_321
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_332
	ld	hl,(_ccx)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	push	hl
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	call	_distance
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
.i_335
	ld	a,l
	cp	#(0% 256)
	jp	z,i_336
	cp	#(1% 256)
	jp	z,i_340
	cp	#(2% 256)
	jp	z,i_359
	jp	i_334
.i_336
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,80	;const
	call	l_ule
	jp	nc,i_338
	call	_player_hidden
	call	l_lneg
	jr	c,i_339_i_338
.i_338
	jp	i_337
.i_339_i_338
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_337
	jp	i_334
.i_340
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_341
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
	jp	nc,i_343
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
	jr	c,i_344_i_343
.i_343
	jp	i_342
.i_344_i_343
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
	jp	i_345
.i_342
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
	jp	nc,i_347
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
	jr	c,i_348_i_347
.i_347
	jp	i_346
.i_348_i_347
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
.i_346
.i_345
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
	jp	nc,i_350
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
	jr	c,i_351_i_350
.i_350
	jp	i_349
.i_351_i_350
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
	jp	i_352
.i_349
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
	jp	nc,i_354
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
	jr	c,i_355_i_354
.i_354
	jp	i_353
.i_355_i_354
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
.i_353
.i_352
.i_341
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,80	;const
	call	l_uge
	jp	c,i_357
	call	_player_hidden
	ld	a,h
	or	l
	jp	nz,i_357
	jr	i_358
.i_357
	ld	hl,1	;const
.i_358
	ld	a,h
	or	l
	jp	z,i_356
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(2 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_356
	jp	i_334
.i_359
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
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
	call	l_ugt
	jp	nc,i_361
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
	jr	c,i_362_i_361
.i_361
	jp	i_360
.i_362_i_361
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
	jp	i_363
.i_360
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
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
	call	l_ult
	jp	nc,i_365
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
	jr	c,i_366_i_365
.i_365
	jp	i_364
.i_366_i_365
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
.i_364
.i_363
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
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
	call	l_ugt
	jp	nc,i_368
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
	jr	c,i_369_i_368
.i_368
	jp	i_367
.i_369_i_368
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
	jp	i_370
.i_367
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
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
	call	l_ult
	jp	nc,i_372
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
	jr	c,i_373_i_372
.i_372
	jp	i_371
.i_373_i_372
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
.i_371
.i_370
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,80	;const
	call	l_ule
	jp	nc,i_375
	call	_player_hidden
	call	l_lneg
	jr	c,i_376_i_375
.i_375
	jp	i_374
.i_376_i_375
	ld	de,_en_an_state
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_374
.i_334
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
	jp	nc,i_377
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
.i_377
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
	jp	nc,i_378
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
.i_378
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
	jp	nc,i_379
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
.i_379
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
	jp	nc,i_380
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
.i_380
	jp	i_381
.i_332
	ld	hl,(_ccx)
	ld	h,0
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
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_383
	ld	hl,(_ccx)
	ld	h,0
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
	ld	bc,4
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_382
.i_383
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
	ld	bc,6
	add	hl,bc
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
	ld	bc,6
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_382
	ld	hl,(_ccy)
	ld	h,0
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
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	c,i_386
	ld	hl,(_ccy)
	ld	h,0
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
	ld	bc,5
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	pop	de
	call	l_eq
	jp	nc,i_385
.i_386
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
	ld	bc,7
	add	hl,bc
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
	ld	bc,7
	add	hl,bc
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_385
.i_381
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
	ld	de,16	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_388
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_bit),a
	jp	i_391
.i_389
	ld	hl,_bit
	ld	a,(hl)
	inc	(hl)
.i_391
	ld	a,(_bit)
	cp	#(3 % 256)
	jp	z,i_390
	jp	nc,i_390
	ld	de,_bullets_estado
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_392
	ld	de,_bullets_y
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_394
	ld	de,_bullets_y
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_394
	ld	de,_bullets_x
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_394
	ld	de,_bullets_x
	ld	hl,(_bit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_395_i_394
.i_394
	jp	i_393
.i_395_i_394
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_396
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
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_397
	ld	hl,128	;const
	jp	i_398
.i_397
	ld	hl,65408	;const
.i_398
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_396
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
	ld	hl,(_bit)
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
	ld	de,4	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_399
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
	ld	bc,9
	add	hl,bc
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_399
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
	ld	bc,9
	add	hl,bc
	ld	a,(hl)
	and	a
	jp	nz,i_400
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
	ld	a,(_ccy)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_ccx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(_ccx)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(_ccy)
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
	ld	hl,5 % 256	;const
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
	ld	hl,_player+30
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_400
.i_393
.i_392
	jp	i_389
.i_390
.i_388
.i_263
	jp	i_260
.i_261
	ret



._do_game
.i_401
	call	sp_UpdateNow
	ld	hl,_s_title
	call	_unpack
	call	_select_joyfunc
	call	_clear_gamearea_tiles
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
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
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,5 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+22
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+44
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+62
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+83
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,13 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+108
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+134
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,17 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+159
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+182
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,21 % 256	;const
	push	hl
	ld	hl,71 % 256	;const
	push	hl
	ld	hl,i_1+209
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	sp_UpdateNow
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_malotes
	call	_init_bullets
	ld	a,#(16 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_result),a
	call	_msc_init_all
	ld	hl,(_e_scripts+48)
	ld	(_script),hl
	call	_run_script
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_draw_scr
	pop	bc
	call	_draw_life
	call	_draw_item
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_half_life),a
.i_403
	ld	a,(_playing)
	and	a
	jp	z,i_404
	ld	hl,(_player+26)
	ld	h,0
	ex	de,hl
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_405
	call	_draw_life
	ld	hl,(_player+26)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_405
	ld	hl,(_flags+5)
	ld	h,0
	ex	de,hl
	ld	hl,(_item_old)
	ld	h,0
	call	l_ne
	jp	nc,i_406
	call	_draw_item
	ld	hl,(_flags+5)
	ld	h,0
	ld	a,l
	ld	(_item_old),a
.i_406
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
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	call	l_lneg
	jp	nc,i_407
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_move
	pop	bc
.i_407
.i_408
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_mueve_bicharracos
	pop	bc
	call	_mueve_bullets
	ld	hl,(_enoffs)
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_411
.i_409
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_411
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_410
	jp	nc,i_410
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_412
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_gpit)
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
	ld	(_enx),a
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_gpit)
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
	ld	(_eny),a
	jp	i_413
.i_412
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_enx),a
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_eny),a
.i_413
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
	ld	hl,_en_an_next_frame
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
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_gpit)
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
	ld	de,2
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
	ld	hl,_en_an_current_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ld	hl,_enoffsmasi
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	jp	i_409
.i_410
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	c,i_415
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_414
.i_415
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
	ld	a,(__y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(__y)
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
	jp	i_417
.i_414
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
.i_417
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_420
.i_418
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_420
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_419
	jp	nc,i_419
	ld	de,_bullets_estado
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_421
	ld	hl,_sp_bullets
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
	ld	de,_bullets_y
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	de,_bullets_x
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	#(7 % 256)
	ld	l,a
	ld	h,0
	push	hl
	ld	de,_bullets_y
	ld	hl,(_gpit)
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
	jp	i_422
.i_421
	ld	hl,_sp_bullets
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
.i_422
	jp	i_418
.i_419
	call	sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_425
.i_423
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_425
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_424
	jp	nc,i_424
	ld	de,_en_an_morido
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_426
	ld	hl,1 % 256	;const
	call	_peta_el_beeper
	ld	de,_en_an_morido
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_426
	jp	i_423
.i_424
	ld	a,(_player+23)
	cp	#(2 % 256)
	jp	nz,i_427
	ld	hl,_player+24
	dec	(hl)
	ld	a,(hl)
	and	a
	jp	nz,i_428
	ld	hl,_player+23
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_428
.i_427
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,_gpit
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_429
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
	jp	nc,i_430
	ld	hl,4 % 256	;const
	call	_peta_el_beeper
.i_430
.i_433
	call	_pad_read
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
.i_431
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	a,h
	or	l
	jp	z,i_433
.i_432
.i_429
	ld	hl,(_player)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_435
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_436_i_435
.i_435
	jp	i_434
.i_436_i_435
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_draw_scr
	pop	bc
	ld	hl,14336	;const
	ld	(_player),hl
.i_434
	ld	hl,(_player)
	ld	de,14336	;const
	call	l_eq
	jp	nc,i_438
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_439_i_438
.i_438
	jp	i_437
.i_439_i_438
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_draw_scr
	pop	bc
	ld	hl,0	;const
	ld	(_player),hl
.i_437
	ld	hl,(_player+1+1)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_441
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_441
	ld	a,(_n_pant)
	cp	#(8 % 256)
	jr	z,i_441_uge
	jp	c,i_441
.i_441_uge
	jr	i_442_i_441
.i_441
	jp	i_440
.i_442_i_441
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-8
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_draw_scr
	pop	bc
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_440
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	call	l_eq
	jp	nc,i_444
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_445_i_444
.i_444
	jp	i_443
.i_445_i_444
	ld	a,(_n_pant)
	cp	#(16 % 256)
	jp	z,i_446
	jp	nc,i_446
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_draw_scr
	pop	bc
	ld	hl,0	;const
	ld	(_player+1+1),hl
	jp	i_447
.i_446
	ld	hl,_player+8
	ld	(hl),#(65152 % 256)
	inc	hl
	ld	(hl),#(65152 / 256)
	ld	a,(_player+26)
	and	a
	jp	z,i_448
	ld	hl,4 % 256	;const
	call	_peta_el_beeper
	ld	hl,_player+26
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_448
.i_447
.i_443
	ld	a,(_player+27)
	cp	#(99 % 256)
	jp	z,i_450
	ld	a,(_n_pant)
	cp	#(7 % 256)
	jp	z,i_450
	ld	a,(_script_result)
	cp	#(1 % 256)
	jp	nz,i_449
.i_450
	ld	a,#(0 % 256 % 256)
	ld	(_success),a
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_452
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_454
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,4	;const
	ex	de,hl
	call	l_eq
	jr	c,i_455_i_454
.i_454
	jp	i_453
.i_455_i_454
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_453
	jp	i_456
.i_452
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	nz,i_457
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_457
.i_456
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_458
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_458
.i_449
	ld	a,(_player+26)
	cp	#(0 % 256)
	jp	z,i_460
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_459
.i_460
	ld	hl,(_sp_player)
	push	hl
	ld	hl,(_spritesClip)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,32 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
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
	jp	i_464
.i_462
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_464
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_463
	jp	nc,i_463
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
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_465
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
	ld	hl,22 % 256	;const
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
.i_465
	jp	i_462
.i_463
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_459
	jp	i_403
.i_404
	jp	i_401
.i_402
	ret



._main
	ld sp, 61952
	call	_system_init
	call	_do_game
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
	DI
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
	EI
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
	DEFB 8 ; Song length * 2
	DEFW 4 ; Offset to start of song (length of instrument table)
	DEFB 2 ; Multiple
	DEFW 0 ; Detune
	DEFB 4 ; Phase
	.patterndata DEFW PAT0
	DEFW PAT0
	DEFW PAT1
	DEFW PAT1
	; *** Pattern data - $00 marks the end of a pattern ***
	.pat0
	DEFB $BD,0
	DEFB 190
	DEFB 152
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 149
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 149
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB $00
	.pat1
	DEFB $BD,0
	DEFB 232
	DEFB 152
	DEFB 118
	DEFB 6
	DEFB 254
	DEFB 147
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 254
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 173
	DEFB 149
	DEFB 118
	DEFB 6
	DEFB 171
	DEFB 147
	DEFB 7
	DEFB 164
	DEFB 152
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 152
	DEFB 7
	DEFB 190
	DEFB 151
	DEFB 7
	DEFB 159
	DEFB 149
	DEFB 118
	DEFB 6
	DEFB 190
	DEFB 147
	DEFB 7
	DEFB $00
;	SECTION	text

.i_1
	defm	"PULSA [Q] PARA VOLAR!"
	defb	0

	defm	"ESTO MATA UN POQUITO,"
	defb	0

	defm	"PERO MATARA MENOS"
	defb	0

	defm	"SI VUELAS DESPACITO."
	defb	0

	defm	"CON [SPACE] LANZAS BOLAS"
	defb	0

	defm	"PERO HACEN PUPA, NO MOLA."
	defb	0

	defm	"LAS COSAS DE INTERACTUAR"
	defb	0

	defm	"SE HACEN PULSANDO [A]."
	defb	0

	defm	"VENCE AL TEMPLO TRIFUERZA!"
	defb	0

	defm	"CURATE EN LOS CORAZONES!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._sp_moviles	defs	6
._spritesClip	defs	2
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
._flags	defs	32
._killed_old	defs	1
._gpint	defs	2
._key_m	defs	2
._kempston_is_attached	defs	1
._items	defs	160
._x0	defs	1
._y0	defs	1
._x1	defs	1
._y1	defs	1
.__x	defs	1
.__y	defs	1
._cx	defs	2
._cy	defs	2
._dx	defs	1
._dy	defs	1
._life_old	defs	1
._mn	defs	1
._pt	defs	1
._px	defs	1
._py	defs	1
._sp_player	defs	2
._sp_bullets	defs	6
._spritesClipValues	defs	4
._enoffs	defs	1
._pad_this_frame	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._enit	defs	1
._joyfunc	defs	2
._gpit	defs	1
._gpjt	defs	1
._playing	defs	1
._keys	defs	10
._objs_old	defs	1
._maincounter	defs	1
._l1x	defs	1
._l1y	defs	1
._l2x	defs	1
._l2y	defs	1
._cerrojos	defs	2
._pptr	defs	2
._ccx	defs	1
._ccy	defs	1
._bit	defs	1
._item_old	defs	1
.__xx	defs	1
._player	defs	32
.__yy	defs	1
._enx	defs	1
._eny	defs	1
._jetpac_frame_counter	defs	1
._rda	defs	1
._rdb	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdm	defs	1
._keys_old	defs	1
._res	defs	1
._rdx	defs	1
._rdy	defs	1
._pt_alt	defs	1
._pxx	defs	1
._script	defs	2
._enoffsmasi	defs	1
._pyy	defs	1
._tocado	defs	1
._pptr_alt	defs	2
._allpurposepuntero	defs	2
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
	XDEF	_clear_gamearea_tiles
	LIB	sp_JoyFuller
	XDEF	_fire_bullet
	XDEF	_f_scripts
	LIB	sp_MouseAMXInit
	LIB	sp_MouseAMX
	XDEF	_sp_moviles
	LIB	sp_SetMousePosAMX
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_HashAdd
	XDEF	_cortina
	XDEF	_draw_life
	XDEF	_bullets_mx
	defc	_bullets_mx	=	23657
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_draw_item
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	_half_life
	XDEF	_en_an_state
	defc	_en_an_state	=	23648
	XDEF	_flags
	LIB	sp_PrintAt
	LIB	sp_Pause
	XDEF	_mueve_bicharracos
	LIB	sp_ListFirst
	LIB	sp_HeapSiftUp
	LIB	sp_ListCount
	LIB	sp_Heapify
	XDEF	_malotes
	XDEF	_draw_text
	LIB	sp_MoveSprRel
	XDEF	_mueve_bullets
	XDEF	_en_an_morido
	defc	_en_an_morido	=	23618
	XDEF	_blackout
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
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	XDEF	_gpint
	XDEF	_key_m
	XDEF	_script_something_done
	LIB	sp_ListAppend
	XDEF	_kempston_is_attached
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_pad_read
	XDEF	_items
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
	XDEF	__x
	XDEF	__y
	XDEF	_player_hidden
	XDEF	_cx
	XDEF	_cy
	XDEF	_dx
	LIB	sp_Invalidate
	XDEF	_dy
	XDEF	_life_old
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_mn
	LIB	sp_FreeBlock
	XDEF	_pt
	LIB	sp_PrintAtDiff
	XDEF	_px
	XDEF	_py
	XDEF	_mscce_0
	XDEF	_bullets_estado
	defc	_bullets_estado	=	23660
	XDEF	_mscce_1
	XDEF	_mscce_2
	XDEF	_pant_final
	XDEF	_mscce_3
	XDEF	_mscce_4
	XDEF	_mscce_5
	XDEF	_mscce_6
	XDEF	_mscce_7
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	XDEF	_mscce_8
	XDEF	_sprite_10_a
	XDEF	_sprite_10_b
	XDEF	_sprite_10_c
	XDEF	_mscce_9
	XDEF	_sprite_11_a
	XDEF	_sprite_11_b
	XDEF	_sprite_11_c
	XDEF	_msccf_0
	XDEF	_sprite_12_a
	XDEF	_sprite_12_b
	XDEF	_sprite_12_c
	XDEF	_msccf_1
	XDEF	_sprite_13_a
	XDEF	_sprite_13_b
	XDEF	_sprite_13_c
	XDEF	_msccf_2
	XDEF	_sprite_14_a
	XDEF	_sprite_14_b
	XDEF	_sprite_14_c
	XDEF	_msccf_3
	XDEF	_sprite_15_a
	XDEF	_sprite_15_b
	XDEF	_sprite_15_c
	LIB	sp_RegisterHookLast
	LIB	sp_IntLargeRect
	LIB	sp_IntPtLargeRect
	LIB	sp_HashDelete
	LIB	sp_GetCharAddr
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	23606
	XDEF	_sprite_16_a
	LIB	sp_RemoveHook
	XDEF	_sprite_16_b
	XDEF	_sprite_16_c
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_msccf_4
	XDEF	_sprite_19_a
	XDEF	_sprite_19_b
	XDEF	_msccf_5
	XDEF	_msccf_6
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_msccf_7
	XDEF	_msccf_8
	XDEF	_msccf_9
	XDEF	_read_byte
	XDEF	_qtile
	XDEF	_srand
	XDEF	_sp_player
	XDEF	_init_player
	XDEF	_sp_bullets
	XDEF	_init_bullets
	LIB	sp_GetTiles
	XDEF	_spritesClipValues
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_enoffs
	XDEF	_pad_this_frame
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	XDEF	_bullets_x
	defc	_bullets_x	=	23651
	XDEF	_bullets_y
	defc	_bullets_y	=	23654
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_system_init
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
	XDEF	_init_malotes
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
	XDEF	_s_title
	XDEF	_attr
	LIB	sp_RemoveDList
	XDEF	_gpit
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23633
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23639
	XDEF	_gpjt
	XDEF	_playing
	LIB	sp_ListNext
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_asm_int_2
	XDEF	_objs_old
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_draw_killed
	XDEF	_move
	XDEF	_asm_number
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	XDEF	_l1x
	LIB	sp_MoveSprAbsNC
	XDEF	_l1y
	XDEF	_l2x
	XDEF	_l2y
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_pptr
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	_step
	LIB	sp_PrintAtInv
	LIB	sp_CompDListAddr
	XDEF	_u_free
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_ccx
	XDEF	_ccy
	XDEF	_do_game
	XDEF	_bit
	XDEF	_run_script
	LIB	sp_InstallISR
	XDEF	_item_old
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	__xx
	XDEF	_en_an_x
	defc	_en_an_x	=	23621
	XDEF	_en_an_y
	defc	_en_an_y	=	23627
	XDEF	_player
	XDEF	__yy
	XDEF	_enx
	XDEF	_eny
	XDEF	_jetpac_frame_counter
	XDEF	_sprite_1_a
	XDEF	_sprite_1_b
	XDEF	_sprite_1_c
	XDEF	_sprite_2_a
	XDEF	_rda
	XDEF	_rdb
	XDEF	_sprite_2_b
	LIB	sp_SwapEndian
	LIB	sp_CharLeft
	XDEF	_gpx
	XDEF	_gpy
	LIB	sp_CharDown
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	XDEF	_rdd
	XDEF	_sprite_2_c
	XDEF	_rdm
	XDEF	_sprite_3_a
	XDEF	_sprite_3_b
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_sprite_3_c
	XDEF	_sprite_4_a
	XDEF	_res
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
	XDEF	_sprite_6_a
	XDEF	_tileset
	XDEF	_sprite_6_b
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_sprite_6_c
	XDEF	_sprite_7_a
	LIB	sp_ComputePos
	XDEF	_sprite_7_b
	XDEF	_sprite_7_c
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_sprite_8_c
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	XDEF	_sprite_9_c
	XDEF	_pt_alt
	XDEF	_mscce_10
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_mscce_13
	XDEF	_mscce_14
	XDEF	_pxx
	XDEF	_e_scripts
	XDEF	_script
	XDEF	_enoffsmasi
	XDEF	_pyy
	XDEF	_msc_init_all
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	XDEF	_tocado
	LIB	sp_inp
	LIB	sp_IterateSprChar
	LIB	sp_AddColSpr
	LIB	sp_outp
	XDEF	_asm_int
	LIB	sp_IntPtInterval
	XDEF	_pptr_alt
	LIB	sp_RegisterHookFirst
	LIB	sp_HashLookup
	LIB	sp_PFill
	LIB	sp_HashRemove
	XDEF	_allpurposepuntero
	LIB	sp_CharUp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_en_an_frame
	defc	_en_an_frame	=	23600
	XDEF	_success
	LIB	sp_MoveSprRelNC
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_select_joyfunc
	XDEF	_unpack
	LIB	sp_IterateDList
	XDEF	_distance
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
