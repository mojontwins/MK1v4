;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Wed May 21 12:48:02 2025



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
	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"
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


	XREF _nametable
	XREF tabla_teclas
	LIB cpc_KeysData
	LIB cpc_UpdTileTable
	LIB cpc_InvalidateRect
	LIB cpc_TestKeyboard
	XDEF viewport_x
	XDEF viewport_y
	defc viewport_x = 2
	defc viewport_y = 2
	XDEF _ts
	XDEF tiles
	._tileset
	.tiles
	._font
	BINARY "font.bin"
	._tspatterns
	BINARY "work.bin"
	._sprites
	BINARY "sprites.bin"
	._sprite_17_a
	BINARY "sprites_extra.bin"
	._sprite_18_a
	defs 96, 0
	._sprite_19_a
	BINARY "sprites_bullet.bin"
	.my_inks
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x4E
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x44
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x58
	out (c), a
	ld a, 4
	out (c), a
	ld a, 0x45
	out (c), a
	ld a, 5
	out (c), a
	ld a, 0x4F
	out (c), a
	ld a, 6
	out (c), a
	ld a, 0x5F
	out (c), a
	ld a, 7
	out (c), a
	ld a, 0x5D
	out (c), a
	ld a, 8
	out (c), a
	ld a, 0x4C
	out (c), a
	ld a, 9
	out (c), a
	ld a, 0x4A
	out (c), a
	ld a, 10
	out (c), a
	ld a, 0x43
	out (c), a
	ld a, 11
	out (c), a
	ld a, 0x53
	out (c), a
	ld a, 12
	out (c), a
	ld a, 0x56
	out (c), a
	ld a, 13
	out (c), a
	ld a, 0x5A
	out (c), a
	ld a, 14
	out (c), a
	ld a, 0x57
	out (c), a
	ld a, 15
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
	.EFECTO0
	.EFECTO5
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0x56, 0x0F, 0x00
	defb 0xF6, 0x0F, 0x00
	defb 0x14, 0x0E, 0x00
	defb 0x64, 0x0E, 0x00
	defb 0x62, 0x0D, 0x00
	defb 0xD0, 0x0D, 0x00
	defb 0xF1, 0x0C, 0x00
	defb 0xFF
	.EFECTO1
	.EFECTO4
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO2
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0x56, 0x0F, 0x00
	defb 0xF6, 0x0F, 0x00
	defb 0x14, 0x0E, 0x00
	defb 0x64, 0x0E, 0x00
	defb 0x62, 0x0D, 0x00
	defb 0xD0, 0x0D, 0x00
	defb 0xF1, 0x0C, 0x00
	defb 0xFF
	.EFECTO3
	defb 0xE8, 0x1B, 0x00
	defb 0xB4, 0x0F, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0x90, 0x0D, 0x00
	defb 0x87, 0x0D, 0x00
	defb 0x78, 0x0C, 0x00
	defb 0x6C, 0x0B, 0x00
	defb 0x60, 0x0A, 0x00
	defb 0x5A, 0x09, 0x00
	defb 0xFF
	.EFECTO6
	defb 0x03, 0x2f, 0x1F
	defb 0xea, 0x1f, 0x1f
	defb 0xdd, 0x1c, 0x1F
	defb 0xd0, 0x1c, 0x1F
	defb 0xc4, 0x19, 0x1f
	defb 0xb7, 0x19, 0x1f
	defb 0xb7, 0x18, 0x1f
	defb 0xb7, 0x18, 0x1f
	defb 0xb7, 0x15, 0x1f
	defb 0xb7, 0x15, 0x1f
	defb 0xFF
	.EFECTO7
	defb 0x1F, 0x0B, 0x00
	defb 0x5A, 0x0F, 0x00
	defb 0x3C, 0x0F, 0x00
	defb 0x1E, 0x0A, 0x00
	defb 0x2D, 0x0A, 0x00
	defb 0x5A, 0x05, 0x00
	defb 0x3C, 0x05, 0x00
	defb 0x1E, 0x04, 0x00
	defb 0x2D, 0x02, 0x00
	defb 0xB4, 0x01, 0x00
	defb 0xFF
	.EFECTO8
	defb 0x1F, 0x0B, 0x00
	defb 0x5A, 0x0F, 0x00
	defb 0x3C, 0x0F, 0x00
	defb 0x1E, 0x0A, 0x00
	defb 0x2D, 0x0A, 0x00
	defb 0x5A, 0x05, 0x00
	defb 0x3C, 0x05, 0x00
	defb 0x1E, 0x04, 0x00
	defb 0x2D, 0x02, 0x00
	defb 0xB4, 0x01, 0x00
	defb 0xFF
	.EFECTO9
	defb 0x25, 0x1C, 0x00
	defb 0x3A, 0x0F, 0x00
	defb 0x2D, 0x0F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0xBC, 0x0F, 0x00
	defb 0x96, 0x0D, 0x00
	defb 0x4B, 0x0D, 0x00
	defb 0x32, 0x0D, 0x00
	defb 0x3A, 0x0D, 0x00
	defb 0x2D, 0x0D, 0x00
	defb 0xE2, 0x0D, 0x00
	defb 0xBC, 0x0D, 0x00
	defb 0x96, 0x0D, 0x00
	defb 0x4B, 0x0D, 0x00
	defb 0x32, 0x0D, 0x00
	defb 0x3A, 0x0D, 0x00
	defb 0x2D, 0x0C, 0x00
	defb 0xE2, 0x0C, 0x00
	defb 0xBC, 0x0C, 0x00
	defb 0x96, 0x0B, 0x00
	defb 0x4B, 0x0B, 0x00
	defb 0x32, 0x0B, 0x00
	defb 0x3A, 0x0B, 0x00
	defb 0x2D, 0x0B, 0x00
	defb 0xE2, 0x0B, 0x00
	defb 0xBC, 0x0B, 0x00
	defb 0x96, 0x0B, 0x00
	defb 0x4B, 0x0A, 0x00
	defb 0x32, 0x0A, 0x00
	defb 0x3A, 0x0A, 0x00
	defb 0x2D, 0x09, 0x00
	defb 0xE2, 0x09, 0x00
	defb 0xBC, 0x08, 0x00
	defb 0x96, 0x08, 0x00
	defb 0x4B, 0x08, 0x00
	defb 0x32, 0x07, 0x00
	defb 0x3A, 0x07, 0x00
	defb 0x2D, 0x06, 0x00
	defb 0xE2, 0x06, 0x00
	defb 0xBC, 0x06, 0x00
	defb 0x96, 0x05, 0x00
	defb 0x4B, 0x05, 0x00
	defb 0x32, 0x05, 0x00
	defb 0x3A, 0x04, 0x00
	defb 0x2D, 0x04, 0x00
	defb 0xE2, 0x03, 0x00
	defb 0xBC, 0x03, 0x00
	defb 0x96, 0x03, 0x00
	defb 0x4B, 0x03, 0x00
	defb 0x32, 0x02, 0x00
	defb 0x3A, 0x01, 0x00
	defb 0x2D, 0x01, 0x00
	defb 0xE2, 0x01, 0x00
	defb 0xBC, 0x01, 0x00
	defb 0xFF
	; Tabla de instrumentos
	.TABLA_PAUTAS
	defw PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,0,PAUTA_7,PAUTA_8,PAUTA_9,PAUTA_10,PAUTA_11,PAUTA_12,PAUTA_13,PAUTA_14,PAUTA_15,PAUTA_16
	; Tabla de efectos
	.TABLA_SONIDOS
	defw SONIDO0,SONIDO1,SONIDO2,SONIDO3,SONIDO4,SONIDO5,SONIDO6,SONIDO7,SONIDO8,SONIDO9
	;Pautas (instrumentos)
	;Instrumento 'Piano'
	.PAUTA_0
	defb 6,0,5,0,4,0,3,0,129
	;Instrumento 'Piano Reverb'
	.PAUTA_1
	defb 10,0,11,0,10,0,9,0,8,0,8,0,8,0,8,0,8,0,8,0,7,0,7,0,7,0,7,0,136
	;Instrumento 'Fade In FX'
	.PAUTA_2
	defb 2,0,3,0,4,8,4,-1,5,-4,5,20,5,-24,4,4,132
	;Instrumento 'Guitar 1'
	.PAUTA_3
	defb 14,0,14,0,12,0,12,0,10,0,9,1,9,1,9,-1,8,-1,8,0,8,0,134
	;Instrumento 'Guitar 2'
	.PAUTA_4
	defb 10,0,10,0,8,0,8,0,6,0,6,1,6,0,6,0,6,-1,6,0,6,0,134
	;Instrumento 'Eco guitar'
	.PAUTA_5
	defb 7,0,7,0,7,0,6,0,6,0,6,0,6,0,6,0,5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,3,0,0,0,129
	;Instrumento 'Solo Guitar'
	.PAUTA_7
	defb 76,0,11,0,11,0,11,0,10,0,9,1,9,0,9,-1,9,0,9,0,9,-1,9,0,9,1,9,0,9,0,138
	;Instrumento 'Eco Solo Guitar'
	.PAUTA_8
	defb 70,0,6,0,6,0,5,0,5,0,5,0,5,0,5,0,4,0,4,0,4,0,4,0,4,0,4,0,3,0,3,0,3,0,3,0,3,0,3,0,2,0,2,0,2,0,1,0,129
	;Instrumento 'Slap Bass'
	.PAUTA_9
	defb 47,0,15,4,14,-4,13,3,12,-5,9,0,129
	;Instrumento 'Robo'
	.PAUTA_10
	defb 13,-1,13,-1,29,11,28,3,28,6,28,7,27,3,31,4,27,15,26,11,26,8,26,6,9,0,25,5,25,7,131
	;Instrumento 'Chip'
	.PAUTA_11
	defb 76,0,13,0,46,0,13,0,12,0,11,0,129
	;Instrumento 'Clipclop'
	.PAUTA_12
	defb 12,0,11,0,10,0,9,0,9,0,9,0,9,0,9,0,8,0,8,0,8,0,8,0,8,0,138
	;Instrumento 'Eco'
	.PAUTA_13
	defb 9,0,8,0,7,0,6,0,129
	;Instrumento 'Harmonica'
	.PAUTA_14
	defb 44,0,13,0,14,0,13,0,12,0,11,0,129
	;Instrumento 'Onda'
	.PAUTA_15
	defb 74,0,10,0,11,0,12,0,11,0,10,0,9,0,6,0,129
	;Instrumento 'Teeth'
	.PAUTA_16
	defb 73,0,10,0,42,0,9,0,8,0,7,0,7,0,7,0,7,0,6,0,6,0,6,0,6,0,136
	;Efectos
	;Efecto 'Bass Drum'
	.SONIDO0
	defb 209,60,0,15,124,0,255
	;Efecto 'Bass Drum Vol 2'
	.SONIDO1
	defb 186,58,0,0,102,0,162,131,0,255
	;Efecto 'Drum'
	.SONIDO2
	defb 231,46,0,115,43,1,100,42,2,255
	;Efecto 'Drum 2'
	.SONIDO3
	defb 19,63,0,0,13,1,0,10,1,0,8,1,255
	;Efecto 'Hit hat'
	.SONIDO4
	defb 0,12,1,0,6,1,255
	;Efecto 'Hit Hat 2'
	.SONIDO5
	defb 0,12,1,255
	;Efecto 'Bongo 1'
	.SONIDO6
	defb 186,30,0,232,25,0,0,40,0,69,38,0,255
	;Efecto 'Bongo 2'
	.SONIDO7
	defb 69,46,0,186,41,0,46,56,0,232,54,0,255
	;Efecto 'Drum 3'
	.SONIDO8
	defb 232,44,0,0,92,5,23,108,5,232,124,5,255
	;Efecto 'Mute'
	.SONIDO9
	defb 0,0,0,255
	;Frecuencias para las notas
	._00_title_mus_bin
	BINARY "../ogt/00_title.mus.bin"
	._01_ingame_mus_bin
	BINARY "../ogt/01_ingame.mus.bin"
	._wyz_songs
	defw _00_title_mus_bin, _01_ingame_mus_bin

._wyz_init
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_isr_player_on),a
	call WYZPLAYER_INIT
	ret



._wyz_play_music
	add hl, hl
	ld de, _wyz_songs
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld de, 0x8800
	call depack
	ld a, 0
	call CARGA_CANCION
	ld a, 1
	ld (_isr_player_on), a
	ret



._peta_el_beeper
	; Sound number is in L
	ld a, l
	ld b, 1
	call INICIA_EFECTO
	ret



._wyz_stop_sound
	call PLAYER_OFF
	xor a
	ld (_isr_player_on), a
	ret


	; 1 PSG proPLAYER V 0.47c - WYZ 19.03.2016
	; (WYZTracker 2.0 o superior)
	.WYZPLAYER_INIT
	CALL PLAYER_OFF
	LD DE, 0x0020 ; No. BYTES RESERVADOS POR CANAL
	LD HL, 0xDF80 ;* RESERVAR MEMORIA PARA BUFFER DE SONIDO!!!!!
	LD (CANAL_A), HL
	ADD HL, DE
	LD (CANAL_B), HL
	ADD HL, DE
	LD (CANAL_C), HL
	ADD HL, DE
	LD (CANAL_P), HL
	RET
	.INICIO
	.WYZ_PLAYER_ISR
	CALL ROUT
	LD HL,PSG_REG
	LD DE,PSG_REG_SEC
	LD BC,14
	LDIR
	CALL REPRODUCE_SONIDO
	CALL PLAY
	JP REPRODUCE_EFECTO
	; REPRODUCE UN SONIDO POR EL CANAL ESPECIFICADO
	; IN
	; A = NUMERO DE SONIDO
	; B = CANAL
	.INICIA_SONIDO
	LD HL, TABLA_SONIDOS
	CALL EXT_WORD
	LD (PUNTERO_SONIDO), DE
	LD HL, INTERR
	SET 2, (HL)
	; na_th_an :: Percussion channel is fixed to 1
	;LD A, 1
	;LD HL, TABLA_DATOS_CANAL_SFX
	;CALL EXT_WORD
	;LD (SONIDO_REGS), DE
	RET
	; REPRODUCE UN FX POR EL CANAL ESPECIFICADO
	; IN
	; A = NUMERO DE SONIDO
	; B = CANAL
	.INICIA_EFECTO
	LD HL, TABLA_EFECTOS
	CALL EXT_WORD
	LD (PUNTERO_EFECTO), DE
	LD HL, INTERR
	SET 3, (HL)
	LD A, B
	LD HL, TABLA_DATOS_CANAL_SFX
	CALL EXT_WORD
	LD (EFECTO_REGS), DE
	RET
	;REPRODUCE EFECTOS DE SONIDO
	.REPRODUCE_SONIDO
	LD HL, INTERR
	BIT 2,(HL) ;ESTA ACTIVADO EL EFECTO?
	RET Z
	LD HL, (SONIDO_REGS)
	PUSH HL
	POP IX
	LD HL, (PUNTERO_SONIDO)
	CALL REPRODUCE_SONIDO_O_EFECTO
	OR A
	JR Z, REPRODUCE_SONIDO_LIMPIA_BIT
	LD (PUNTERO_SONIDO), HL
	RET
	.REPRODUCE_SONIDO_LIMPIA_BIT
	LD HL, INTERR
	RES 2, (HL)
	RET
	.REPRODUCE_EFECTO
	LD HL, INTERR
	BIT 3, (HL)
	RET Z
	LD HL, (EFECTO_REGS)
	PUSH HL
	POP IX
	LD HL, (PUNTERO_EFECTO)
	CALL REPRODUCE_SONIDO_O_EFECTO
	OR A
	JR Z, REPRODUCE_EFECTO_LIMPIA_BIT
	LD (PUNTERO_EFECTO), HL
	RET
	.REPRODUCE_EFECTO_LIMPIA_BIT
	LD HL, INTERR
	RES 3, (HL)
	RET
	.REPRODUCE_SONIDO_O_EFECTO
	LD A,(HL)
	CP 0xFF
	JR Z,FIN_SONIDO
	LD E, (IX+0) ; IX+0 -> SFX_L LO
	LD D, (IX+1) ; IX+1 -> SFX_L HI
	LD (DE),A
	INC HL
	LD A,(HL)
	RRCA
	RRCA
	RRCA
	RRCA
	AND 00001111B
	LD E, (IX+2) ; IX+2 -> SFX_H LO
	LD D, (IX+3) ; IX+3 -> SFX_H HI
	LD (DE),A
	LD A,(HL)
	AND 00001111B
	LD E, (IX+4) ; IX+4 -> SFX_V LO
	LD D, (IX+5) ; IX+5 -> SFX_V HI
	LD (DE),A
	INC HL
	LD A,(HL)
	LD B,A
	BIT 7,A ;09.08.13 BIT MAS SIGINIFICATIVO ACTIVA ENVOLVENTES
	JR Z,NO_ENVOLVENTES_SONIDO
	LD A,0x12
	LD (DE),A
	INC HL
	LD A,(HL)
	LD (PSG_REG_SEC+11),A
	INC HL
	LD A,(HL)
	LD (PSG_REG_SEC+12),A
	INC HL
	LD A,(HL)
	CP 1
	JR Z,NO_ENVOLVENTES_SONIDO ;NO ESCRIBE LA ENVOLVENTE SI SU VALOR ES 1
	LD (PSG_REG_SEC+13),A
	.NO_ENVOLVENTES_SONIDO
	LD A,B
	AND 0x7F ; RES 7,A ; AND A
	JR Z,NO_RUIDO
	LD (PSG_REG_SEC+6),A
	LD A, (IX+6) ; IX+6 -> SFX_MIX
	JR SI_RUIDO
	.NO_RUIDO XOR A
	LD (PSG_REG_SEC+6),A
	LD A,10111000B
	.SI_RUIDO LD (PSG_REG_SEC+7),A
	INC HL
	LD A, 1
	RET
	.FIN_SONIDO
	LD A,(ENVOLVENTE_BACK) ;NO RESTAURA LA ENVOLVENTE SI ES 0
	AND A
	JR Z,FIN_NOPLAYER
	;xor a ; ***
	LD (PSG_REG_SEC+13),A ;08.13 RESTAURA LA ENVOLVENTE TRAS EL SFX
	.FIN_NOPLAYER
	LD A,10111000B
	LD (PSG_REG_SEC+7),A
	XOR A
	RET
	;VUELCA BUFFER DE SONIDO AL PSG
	.ROUT
	LD A,(PSG_REG+13)
	AND A ;ES CERO?
	JR Z,NO_BACKUP_ENVOLVENTE
	LD (ENVOLVENTE_BACK),A ;08.13 / GUARDA LA ENVOLVENTE EN EL BACKUP
	XOR A
	.NO_BACKUP_ENVOLVENTE
	;VUELCA BUFFER DE SONIDO AL PSG
	LD HL,PSG_REG_SEC
	.LOUT
	CALL WRITEPSGHL
	INC A
	CP 13
	JR NZ,LOUT
	LD A,(HL)
	AND A
	RET Z
	LD A,13
	CALL WRITEPSGHL
	XOR A
	LD (PSG_REG+13),A
	LD (PSG_REG_SEC+13),A
	RET
	;; A = REGISTER
	;; (HL) = VALUE
	.WRITEPSGHL
	LD B,0xF4
	OUT (C),A
	LD BC,0xF6C0
	OUT (C),C
	DEFB 0xED
	DEFB 0x71
	LD B,0xF5
	OUTI
	LD BC,0xF680
	OUT (C),C
	DEFB 0xED
	DEFB 0x71
	RET
	;PLAYER OFF
	.PLAYER_OFF
	XOR A ;***** IMPORTANTE SI NO HAY MUSICA ****
	LD (INTERR),A
	;LD (FADE),A ;solo si hay fade out
	.CLEAR_PSG_BUFFER
	LD HL,PSG_REG
	LD DE,PSG_REG+1
	LD BC,14
	LD (HL),A
	LDIR
	LD A,10111000B ; **** POR SI ACASO ****
	LD (PSG_REG+7),A
	LD HL,PSG_REG
	LD DE,PSG_REG_SEC
	LD BC,14
	LDIR
	JP ROUT
	;CARGA UNA CANCION
	;.IN(A)=Nº DE CANCION
	.CARGA_CANCION
	LD HL,INTERR ;CARGA CANCION
	SET 1,(HL) ;REPRODUCE CANCION
	LD HL,SONG
	LD (HL),A ;Nº A
	;DECODIFICAR
	;IN-> INTERR 0 ON
	; SONG
	;CARGA CANCION SI/NO
	.DECODE_SONG
	LD A,(SONG)
	;LEE CABECERA DE LA CANCION
	;BYTE 0=TEMPO
	LD HL,TABLA_SONG
	CALL EXT_WORD
	LD A,(DE)
	LD (TEMPO),A
	DEC A
	LD (TTEMPO),A
	;HEADER BYTE 1
	;[-|-|-|-| 3-1 | 0 ]
	;[-|-|-|-|FX CHN|LOOP]
	INC DE ;LOOP 1=ON/0=OFF?
	LD A,(DE)
	BIT 0,A
	JR Z,NPTJP0
	LD HL,INTERR
	SET 4,(HL)
	;SELECCION DEL CANAL DE EFECTOS DE RITMO
	.NPTJP0
	AND 00000110B
	RRA
	;LD (SELECT_CANAL_P),A
	PUSH DE
	; na_th_an :: Percussion channel is fixed to 1
	;LD HL, TABLA_DATOS_CANAL_SFX
	;CALL EXT_WORD
	;LD (SONIDO_REGS), DE
	POP HL
	INC HL ;2 BYTES RESERVADOS
	INC HL
	INC HL
	;BUSCA Y GUARDA INICIO DE LOS CANALES EN EL MODULO MUS (OPTIMIZAR****************)
	;AÑADE OFFSET DEL LOOP
	PUSH HL ;IX INICIO OFFSETS LOOP POR CANAL
	POP IX
	LD DE,0x0008 ;HASTA INICIO DEL CANAL A
	ADD HL,DE
	LD (PUNTERO_P_DECA),HL ;GUARDA PUNTERO INICIO CANAL
	LD E,(IX+0)
	LD D,(IX+1)
	ADD HL,DE
	LD (PUNTERO_L_DECA),HL ;GUARDA PUNTERO INICIO LOOP
	CALL BGICMODBC1
	LD (PUNTERO_P_DECB),HL
	LD E,(IX+2)
	LD D,(IX+3)
	ADD HL,DE
	LD (PUNTERO_L_DECB),HL
	CALL BGICMODBC1
	LD (PUNTERO_P_DECC),HL
	LD E,(IX+4)
	LD D,(IX+5)
	ADD HL,DE
	LD (PUNTERO_L_DECC),HL
	CALL BGICMODBC1
	LD (PUNTERO_P_DECP),HL
	LD E,(IX+6)
	LD D,(IX+7)
	ADD HL,DE
	LD (PUNTERO_L_DECP),HL
	;LEE DATOS DE LAS NOTAS
	;[|][|||||] LONGITUD\NOTA
	.INIT_DECODER
	LD DE,(CANAL_A)
	LD (PUNTERO_A),DE
	LD HL,(PUNTERO_P_DECA)
	CALL DECODE_CANAL ;CANAL A
	LD (PUNTERO_DECA),HL
	LD DE,(CANAL_B)
	LD (PUNTERO_B),DE
	LD HL,(PUNTERO_P_DECB)
	CALL DECODE_CANAL ;CANAL B
	LD (PUNTERO_DECB),HL
	LD DE,(CANAL_C)
	LD (PUNTERO_C),DE
	LD HL,(PUNTERO_P_DECC)
	CALL DECODE_CANAL ;CANAL C
	LD (PUNTERO_DECC),HL
	LD DE,(CANAL_P)
	LD (PUNTERO_P),DE
	LD HL,(PUNTERO_P_DECP)
	CALL DECODE_CANAL ;CANAL P
	LD (PUNTERO_DECP),HL
	RET
	;BUSCA INICIO DEL CANAL
	.BGICMODBC1
	LD E,0x3F ;CODIGO INSTRUMENTO 0
	.BGICMODBC2
	XOR A ;BUSCA EL BYTE 0
	LD B,0xFF ;EL MODULO DEBE TENER UNA LONGITUD MENOR DE 0xFF00 ... o_O!
	CPIR
	DEC HL
	DEC HL
	LD A,E ;ES EL INSTRUMENTO 0??
	CP (HL)
	INC HL
	INC HL
	JR Z,BGICMODBC2
	DEC HL
	DEC HL
	DEC HL
	LD A,E ;ES VOLUMEN 0??
	CP (HL)
	INC HL
	INC HL
	INC HL
	JR Z,BGICMODBC2
	RET
	;DECODIFICA NOTAS DE UN CANAL
	;IN (DE)=DIRECCION DESTINO
	;NOTA=0 FIN CANAL
	;NOTA=1 SILENCIO
	;NOTA=2 PUNTILLO
	;NOTA=3 COMANDO I
	.DECODE_CANAL
	LD A,(HL)
	AND A ;FIN DEL CANAL?
	JR Z,FIN_DEC_CANAL
	CALL GETLEN
	CP 00000001B ;ES SILENCIO?
	JR NZ,NO_SILENCIO
	OR 0x40 ; SET 6,A
	JR NO_MODIFICA
	.NO_SILENCIO
	CP 00111110B ;ES PUNTILLO?
	JR NZ,NO_PUNTILLO
	OR A
	RRC B
	XOR A
	JR NO_MODIFICA
	.NO_PUNTILLO
	CP 00111111B ;ES COMANDO?
	JR NZ,NO_MODIFICA
	BIT 0,B ;COMADO=INSTRUMENTO?
	JR Z,NO_INSTRUMENTO
	LD A,11000001B ;CODIGO DE INSTRUMENTO
	LD (DE),A
	INC HL
	INC DE
	LDI ;Nº DE INSTRUMENTO
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	LDI ;VOLUMEN RELATIVO DEL INSTRUMENTO
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	JR DECODE_CANAL
	.NO_INSTRUMENTO
	BIT 2,B
	JR Z,NO_ENVOLVENTE
	LD A,11000100B ;CODIGO ENVOLVENTE
	LD (DE),A
	INC DE
	INC HL
	LDI
	; LD A,(HL)
	; LD (DE),A
	; INC DE
	; INC HL
	JR DECODE_CANAL
	.NO_ENVOLVENTE
	BIT 1,B
	JR Z,NO_MODIFICA
	LD A,11000010B ;CODIGO EFECTO
	LD (DE),A
	INC HL
	INC DE
	LD A,(HL)
	CALL GETLEN
	.NO_MODIFICA
	LD (DE),A
	INC DE
	XOR A
	DJNZ NO_MODIFICA
	OR 0x81 ; SET 7,A ; SET 0,A
	LD (DE),A
	INC DE
	INC HL
	RET ;** JR DECODE_CANAL
	.FIN_DEC_CANAL
	OR 0x80 ; SET 7,A
	LD (DE),A
	INC DE
	RET
	.GETLEN
	LD B,A
	AND 00111111B
	PUSH AF
	LD A,B
	AND 11000000B
	RLCA
	RLCA
	INC A
	LD B,A
	LD A,10000000B
	.DCBC0
	RLCA
	DJNZ DCBC0
	LD B,A
	POP AF
	RET
	;PLAY _______________________________
	.PLAY
	LD HL,INTERR ;PLAY BIT 1 ON?
	BIT 1,(HL)
	RET Z
	;TEMPO
	LD HL,TTEMPO ;CONTADOR TEMPO
	INC (HL)
	LD A,(TEMPO)
	CP (HL)
	JR NZ,PAUTAS
	LD (HL),0
	;INTERPRETA
	; Lee una nueva linea. Yo voy a incrementar dos contadores:
	; uno de lineas. Otro se incrementará cada 4 lineas. Éste lo "reflejaré" en low ram.
	ld a, (LINE_COUNTER)
	inc a
	cp 4
	jr nz, nonewblack
	; Incrementamos esto en low RAM
	ld hl, _wyz_beat_ct
	inc (hl)
	xor a
	nonewblack:
	ld (LINE_COUNTER), a
	LD IY,PSG_REG
	LD IX,PUNTERO_A
	LD BC,PSG_REG+8
	CALL LOCALIZA_NOTA
	LD IY,PSG_REG+2
	LD IX,PUNTERO_B
	LD BC,PSG_REG+9
	CALL LOCALIZA_NOTA
	LD IY,PSG_REG+4
	LD IX,PUNTERO_C
	LD BC,PSG_REG+10
	CALL LOCALIZA_NOTA
	LD IX,PUNTERO_P ;EL CANAL DE EFECTOS ENMASCARA OTRO CANAL
	CALL LOCALIZA_EFECTO
	;PAUTAS
	.PAUTAS
	LD IY,PSG_REG+0
	LD IX,PUNTERO_P_A
	LD HL,PSG_REG+8
	CALL PAUTA ;PAUTA CANAL A
	LD IY,PSG_REG+2
	LD IX,PUNTERO_P_B
	LD HL,PSG_REG+9
	CALL PAUTA ;PAUTA CANAL B
	LD IY,PSG_REG+4
	LD IX,PUNTERO_P_C
	LD HL,PSG_REG+10
	JP PAUTA ;PAUTA CANAL C
	;LOCALIZA NOTA CANAL A
	;IN (PUNTERO_A)
	;LOCALIZA NOTA CANAL A
	;IN (PUNTERO_A)
	.LOCALIZA_NOTA
	LD L,(IX+PUNTERO_A-PUNTERO_A) ;HL=(PUNTERO_A_C_B)
	LD H,(IX+PUNTERO_A-PUNTERO_A+1)
	LD A,(HL)
	AND 11000000B ;COMANDO?
	CP 11000000B
	JR NZ,LNJP0
	;BIT(0)=INSTRUMENTO
	.COMANDOS
	LD A,(HL)
	BIT 0,A ;INSTRUMENTO
	JR Z,COM_EFECTO
	INC HL
	LD A,(HL) ;Nº DE PAUTA
	INC HL
	LD E,(HL)
	PUSH HL ;;TEMPO ******************
	LD HL,TEMPO
	BIT 5,E
	JR Z,NO_DEC_TEMPO
	DEC (HL)
	.NO_DEC_TEMPO
	BIT 6,E
	JR Z,NO_INC_TEMPO
	INC (HL)
	.NO_INC_TEMPO
	RES 5,E ;SIEMPRE RESETEA LOS BITS DE TEMPO
	RES 6,E
	POP HL
	LD (IX+VOL_INST_A-PUNTERO_A),E ;REGISTRO DEL VOLUMEN RELATIVO
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	LD HL,TABLA_PAUTAS
	CALL EXT_WORD
	LD (IX+PUNTERO_P_A0-PUNTERO_A),E
	LD (IX+PUNTERO_P_A0-PUNTERO_A+1),D
	LD (IX+PUNTERO_P_A-PUNTERO_A),E
	LD (IX+PUNTERO_P_A-PUNTERO_A+1),D
	LD L,C
	LD H,B
	RES 4,(HL) ;APAGA EFECTO ENVOLVENTE
	XOR A
	LD (PSG_REG_SEC+13),A
	LD (PSG_REG+13),A
	;LD (ENVOLVENTE_BACK),A ;08.13 / RESETEA EL BACKUP DE LA ENVOLVENTE
	JR LOCALIZA_NOTA
	.COM_EFECTO
	BIT 1,A ;EFECTO DE SONIDO
	JR Z,COM_ENVOLVENTE
	INC HL
	LD A,(HL)
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	JP INICIA_SONIDO
	.COM_ENVOLVENTE
	BIT 2,A
	RET Z ;IGNORA - ERROR
	INC HL
	LD A,(HL) ;CARGA CODIGO DE ENVOLVENTE
	LD (ENVOLVENTE),A
	INC HL
	LD (IX+PUNTERO_A-PUNTERO_A),L
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	LD L,C
	LD H,B
	LD (HL),00010000B ;ENCIENDE EFECTO ENVOLVENTE
	JR LOCALIZA_NOTA
	.LNJP0
	LD A,(HL)
	INC HL
	BIT 7,A
	JR Z,NO_FIN_CANAL_A ;
	BIT 0,A
	JR Z,FIN_CANAL_A
	.FIN_NOTA_A
	LD E,(IX+CANAL_A-PUNTERO_A)
	LD D,(IX+CANAL_A-PUNTERO_A+1) ;PUNTERO BUFFER AL INICIO
	LD (IX+PUNTERO_A-PUNTERO_A),E
	LD (IX+PUNTERO_A-PUNTERO_A+1),D
	LD L,(IX+PUNTERO_DECA-PUNTERO_A) ;CARGA PUNTERO DECODER
	LD H,(IX+PUNTERO_DECA-PUNTERO_A+1)
	PUSH BC
	CALL DECODE_CANAL ;DECODIFICA CANAL
	POP BC
	LD (IX+PUNTERO_DECA-PUNTERO_A),L ;GUARDA PUNTERO DECODER
	LD (IX+PUNTERO_DECA-PUNTERO_A+1),H
	JP LOCALIZA_NOTA
	.FIN_CANAL_A
	LD HL,INTERR ;LOOP?
	BIT 4,(HL)
	JR NZ,FCA_CONT
	POP AF
	JP PLAYER_OFF
	.FCA_CONT
	LD L,(IX+PUNTERO_L_DECA-PUNTERO_A) ;CARGA PUNTERO INICIAL DECODER
	LD H,(IX+PUNTERO_L_DECA-PUNTERO_A+1)
	LD (IX+PUNTERO_DECA-PUNTERO_A),L
	LD (IX+PUNTERO_DECA-PUNTERO_A+1),H
	JR FIN_NOTA_A
	.NO_FIN_CANAL_A
	LD (IX+PUNTERO_A-PUNTERO_A),L ;(PUNTERO_A_B_C)=HL GUARDA PUNTERO
	LD (IX+PUNTERO_A-PUNTERO_A+1),H
	AND A ;NO REPRODUCE NOTA SI NOTA=0
	JR Z,FIN_RUTINA
	BIT 6,A ;SILENCIO?
	JR Z,NO_SILENCIO_A
	LD A,(BC)
	AND 00010000B
	JR NZ,SILENCIO_ENVOLVENTE
	XOR A
	LD (BC),A ;RESET VOLUMEN DEL CORRESPODIENTE CHIP
	LD (IY+0),A
	LD (IY+1),A
	RET
	.SILENCIO_ENVOLVENTE
	LD A,0xFF
	LD (PSG_REG+11),A
	LD (PSG_REG+12),A
	XOR A
	LD (PSG_REG+13),A
	LD (IY+0),A
	LD (IY+1),A
	RET
	.NO_SILENCIO_A
	LD (IX+REG_NOTA_A-PUNTERO_A),A ;REGISTRO DE LA NOTA DEL CANAL
	CALL NOTA ;REPRODUCE NOTA
	LD L,(IX+PUNTERO_P_A0-PUNTERO_A) ;HL=(PUNTERO_P_A0) RESETEA PAUTA
	LD H,(IX+PUNTERO_P_A0-PUNTERO_A+1)
	LD (IX+PUNTERO_P_A-PUNTERO_A),L ;(PUNTERO_P_A)=HL
	LD (IX+PUNTERO_P_A-PUNTERO_A+1),H
	.FIN_RUTINA
	RET
	;LOCALIZA EFECTO
	;IN HL=(PUNTERO_P)
	.LOCALIZA_EFECTO
	LD L,(IX+0) ;HL=(PUNTERO_P)
	LD H,(IX+1)
	LD A,(HL)
	CP 11000010B
	JR NZ,LEJP0
	INC HL
	LD A,(HL)
	INC HL
	LD (IX+00),L
	LD (IX+01),H
	JP INICIA_SONIDO
	.LEJP0
	INC HL
	BIT 7,A
	JR Z,NO_FIN_CANAL_P ;
	BIT 0,A
	JR Z,FIN_CANAL_P
	.FIN_NOTA_P
	LD DE,(CANAL_P)
	LD (IX+0),E
	LD (IX+1),D
	LD HL,(PUNTERO_DECP) ;CARGA PUNTERO DECODER
	PUSH BC
	CALL DECODE_CANAL ;DECODIFICA CANAL
	POP BC
	LD (PUNTERO_DECP),HL ;GUARDA PUNTERO DECODER
	JP LOCALIZA_EFECTO
	.FIN_CANAL_P
	LD HL,(PUNTERO_L_DECP) ;CARGA PUNTERO INICIAL DECODER
	LD (PUNTERO_DECP),HL
	JR FIN_NOTA_P
	.NO_FIN_CANAL_P
	LD (IX+0),L ;(PUNTERO_A_B_C)=HL GUARDA PUNTERO
	LD (IX+1),H
	RET
	; PAUTA DE LOS 3 CANALES
	; .IN(IX):PUNTERO DE LA PAUTA
	; (HL):REGISTRO DE VOLUMEN
	; (IY):REGISTROS DE FRECUENCIA
	; FORMATO PAUTA
	; 7 6 5 4 3-0 3-0
	; BYTE 1 [LOOP|OCT-1|OCT+1|ORNMT|VOL] - BYTE 2 [ | | | |PITCH/NOTA]
	.PAUTA
	BIT 4,(HL) ;SI LA ENVOLVENTE ESTA ACTIVADA NO ACTUA PAUTA
	RET NZ
	LD A,(IY+0)
	LD B,(IY+1)
	OR B
	RET Z
	PUSH HL
	.PCAJP4
	LD L,(IX+0)
	LD H,(IX+1)
	LD A,(HL)
	BIT 7,A ;LOOP / EL RESTO DE BITS NO AFECTAN
	JR Z,PCAJP0
	AND 00011111B ;MÁXIMO LOOP PAUTA (0,32)X2!!!-> PARA ORNAMENTOS
	RLCA ;X2
	LD D,0
	LD E,A
	SBC HL,DE
	LD A,(HL)
	.PCAJP0
	BIT 6,A ;OCTAVA -1
	JR Z,PCAJP1
	LD E,(IY+0)
	LD D,(IY+1)
	AND A
	RRC D
	RR E
	LD (IY+0),E
	LD (IY+1),D
	JR PCAJP2
	.PCAJP1
	BIT 5,A ;OCTAVA +1
	JR Z,PCAJP2
	LD E,(IY+0)
	LD D,(IY+1)
	AND A
	RLC E
	RL D
	LD (IY+0),E
	LD (IY+1),D
	.PCAJP2
	LD A,(HL)
	BIT 4,A
	JR NZ,PCAJP6 ;ORNAMENTOS SELECCIONADOS
	INC HL ;______________________ FUNCION PITCH DE FRECUENCIA__________________
	PUSH HL
	LD E,A
	LD A,(HL) ;PITCH DE FRECUENCIA
	LD L,A
	AND A
	LD A,E
	JR Z,ORNMJP1
	LD A,(IY+0) ;SI LA FRECUENCIA ES 0 NO HAY PITCH
	ADD A,(IY+1)
	AND A
	LD A,E
	JR Z,ORNMJP1
	BIT 7,L
	JR Z,ORNNEG
	LD H,0xFF
	JR PCAJP3
	.ORNNEG
	LD H,0
	.PCAJP3
	LD E,(IY+0)
	LD D,(IY+1)
	ADC HL,DE
	LD (IY+0),L
	LD (IY+1),H
	JR ORNMJP1
	.PCAJP6
	INC HL ;______________________ FUNCION ORNAMENTOS__________________
	PUSH HL
	PUSH AF
	LD A,(IX+REG_NOTA_A-PUNTERO_P_A) ;RECUPERA REGISTRO DE NOTA EN EL CANAL
	LD E,(HL) ;
	ADC E ;+- NOTA
	CALL TABLA_NOTAS
	POP AF
	.ORNMJP1
	POP HL
	INC HL
	LD (IX+0),L
	LD (IX+1),H
	.PCAJP5
	POP HL
	LD B,(IX+VOL_INST_A-PUNTERO_P_A) ;VOLUMEN RELATIVO
	ADD B
	JP P,PCAJP7
	LD A,1 ;NO SE EXTIGUE EL VOLUMEN
	.PCAJP7
	AND 00001111B ;VOLUMEN FINAL MODULADO
	LD (HL),A
	RET
	;NOTA - REPRODUCE UNA NOTA
	;IN (A)=CODIGO DE LA NOTA
	; (IY)=REGISTROS DE FRECUENCIA
	.NOTA
	LD L,C
	LD H,B
	BIT 4,(HL)
	LD B,A
	JR NZ,EVOLVENTES
	LD A,B
	.TABLA_NOTAS
	LD HL,DATOS_NOTAS ;BUSCA FRECUENCIA
	CALL EXT_WORD
	LD (IY+0),E
	LD (IY+1),D
	RET
	;IN (A)=CODIGO DE LA ENVOLVENTE
	; (IY)=REGISTRO DE FRECUENCIA
	.EVOLVENTES
	LD HL,DATOS_NOTAS
	;SUB 12
	RLCA ;X2
	LD D,0
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	PUSH DE
	LD A,(ENVOLVENTE) ;FRECUENCIA DEL CANAL ON/OFF
	RRA
	JR NC,FRECUENCIA_OFF
	LD (IY+0),E
	LD (IY+1),D
	JR CONT_ENV
	.FRECUENCIA_OFF
	LD DE,0x0000
	LD (IY+0),E
	LD (IY+1),D
	;CALCULO DEL RATIO (OCTAVA ARRIBA)
	.CONT_ENV
	POP DE
	PUSH AF
	PUSH BC
	AND 00000011B
	LD B,A
	;INC B
	;AND A ;1/2
	RR D
	RR E
	.CRTBC0
	;AND A ;1/4 - 1/8 - 1/16
	RR D
	RR E
	DJNZ CRTBC0
	LD A,E
	LD (PSG_REG+11),A
	LD A,D
	AND 00000011B
	LD (PSG_REG+12),A
	POP BC
	POP AF ;SELECCION FORMA DE ENVOLVENTE
	RRA
	AND 00000110B ;0x08,0x0A,0x0C,0x0E
	ADD 8
	LD (PSG_REG+13),A
	LD (ENVOLVENTE_BACK),A
	RET
	;EXTRAE UN WORD DE UNA TABLA
	;.IN(HL)=DIRECCION TABLA
	; (A)= POSICION
	;OUT(DE)=WORD
	.EXT_WORD
	LD D,0
	RLCA
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	RET
	;TABLA DE DATOS DEL SELECTOR DEL CANAL DE EFECTOS DE RITMO
	.TABLA_DATOS_CANAL_SFX
	defw SELECT_CANAL_A,SELECT_CANAL_B,SELECT_CANAL_C
	;BYTE 0:SFX_L
	;BYTE 1:SFX_H
	;BYTE 2:SFX_V
	;BYTE 3:SFX_MIX
	.SELECT_CANAL_A
	defw PSG_REG_SEC+0, PSG_REG_SEC+1, PSG_REG_SEC+8
	defb 10110001B
	.SELECT_CANAL_B
	defw PSG_REG_SEC+2, PSG_REG_SEC+3, PSG_REG_SEC+9
	defb 10101010B
	.SELECT_CANAL_C
	defw PSG_REG_SEC+4, PSG_REG_SEC+5, PSG_REG_SEC+10
	defb 10011100B
	;_______________________________
	.INTERR
	defb 0 ;INTERRUPTORES 1=ON 0=OFF
	;BIT 0=CARGA CANCION ON/OFF
	;BIT 1=PLAYER ON/OFF
	;BIT 2=EFECTOS ON/OFF
	;BIT 3=SFX ON/OFF
	;BIT 4=LOOP
	;MUSICA **** EL ORDEN DE LAS VARIABLES ES FIJO ******
	.SONG defb 0 ;DBNº DE CANCION
	.TEMPO defb 0 ;DB TEMPO
	.TTEMPO defb 0 ;DB CONTADOR TEMPO
	.PUNTERO_A defw 0 ;DW PUNTERO DEL CANAL A
	.PUNTERO_B defw 0 ;DW PUNTERO DEL CANAL B
	.PUNTERO_C defw 0 ;DW PUNTERO DEL CANAL C
	.CANAL_A defw 0 ;DW DIRECION DE INICIO DE LA MUSICA A
	.CANAL_B defw 0 ;DW DIRECION DE INICIO DE LA MUSICA B
	.CANAL_C defw 0 ;DW DIRECION DE INICIO DE LA MUSICA C
	.PUNTERO_P_A defw 0 ;DW PUNTERO PAUTA CANAL A
	.PUNTERO_P_B defw 0 ;DW PUNTERO PAUTA CANAL B
	.PUNTERO_P_C defw 0 ;DW PUNTERO PAUTA CANAL C
	.PUNTERO_P_A0 defw 0 ;DW INI PUNTERO PAUTA CANAL A
	.PUNTERO_P_B0 defw 0 ;DW INI PUNTERO PAUTA CANAL B
	.PUNTERO_P_C0 defw 0 ;DW INI PUNTERO PAUTA CANAL C
	.PUNTERO_P_DECA defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL A
	.PUNTERO_P_DECB defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL B
	.PUNTERO_P_DECC defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL C
	.PUNTERO_DECA defw 0 ;DW PUNTERO DECODER CANAL A
	.PUNTERO_DECB defw 0 ;DW PUNTERO DECODER CANAL B
	.PUNTERO_DECC defw 0 ;DW PUNTERO DECODER CANAL C
	.PUNTERO_EFECTO defw 0 ;DW PUNTERO DEL SONIDO QUE SE REPRODUCE
	.REG_NOTA_A defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL A
	.VOL_INST_A defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL A
	.REG_NOTA_B defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL B
	.VOL_INST_B defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL B ;VACIO
	.REG_NOTA_C defb 0 ;DB REGISTRO DE LA NOTA EN EL CANAL C
	.VOL_INST_C defb 0 ;DB VOLUMEN RELATIVO DEL INSTRUMENTO DEL CANAL C
	.PUNTERO_L_DECA defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL A
	.PUNTERO_L_DECB defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL B
	.PUNTERO_L_DECC defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL C
	;CANAL DE EFECTOS DE RITMO - ENMASCARA OTRO CANAL
	.PUNTERO_P defw 0 ;DW PUNTERO DEL CANAL EFECTOS
	.CANAL_P defw 0 ;DW DIRECION DE INICIO DE LOS EFECTOS
	.PUNTERO_P_DECP defw 0 ;DW PUNTERO DE INICIO DEL DECODER CANAL P
	.PUNTERO_DECP defw 0 ;DW PUNTERO DECODER CANAL P
	.PUNTERO_L_DECP defw 0 ;DW PUNTERO DE INICIO DEL LOOP DEL DECODER CANAL P
	;SELECT_CANAL_P defb INTERR+0x36 ;DB SELECCION DE CANAL DE EFECTOS DE RITMO
	.SFX_L defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO BAJO
	.SFX_H defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO ALTO
	.SFX_V defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO VOLUMEN
	.SFX_MIX defw 0 ;DW DIRECCION BUFFER EFECTOS DE RITMO REGISTRO MIXER
	;EFECTOS DE SONIDO
	.N_SONIDO defb 0 ;DB : NUMERO DE SONIDO
	.PUNTERO_SONIDO defw 0 ;DW : PUNTERO DEL SONIDO QUE SE REPRODUCE
	.EFECTO_REGS defw 0
	.SONIDO_REGS defw SELECT_CANAL_B ; na_th_an :: Percussion channel is fixed to 1
	;DB (13) BUFFERs DE REGISTROS DEL PSG
	.PSG_REG defs 16
	.PSG_REG_SEC defs 16
	.ENVOLVENTE
	defb 0 ;DB : FORMA DE LA ENVOLVENTE
	;BIT 0 : FRECUENCIA CANAL ON/OFF
	;BIT 1-2 : RATIO
	;BIT 3-3 : FORMA
	.ENVOLVENTE_BACK defb 0 ;.defb BACKUP DE LA FORMA DE LA ENVOLENTE
	.DATOS_NOTAS
	defw 0x0000, 0x0000
	defw 964,910,859,811,766,722,682,644,608,573
	defw 541,511,482,455,430,405,383,361,341,322
	defw 304,287,271,255,241,228,215,203,191,180
	defw 170,161,152,143,135,128,121,114,107,101
	defw 96,90,85,81,76,72,68,64,60,57
	defw 54,51,48,45,43,40,38,36,34,32
	.TABLA_SONG
	defw 0x8800
	.TABLA_EFECTOS
	defw EFECTO0, EFECTO1, EFECTO2, EFECTO3, EFECTO4, EFECTO5, EFECTO6, EFECTO7
	defw EFECTO8, EFECTO9
	.LINE_COUNTER
	defb 0
	; LUT for transparent pixels in sprites
	; taken from CPCTelera
	._trpixlutc
	BINARY "trpixlutc.bin"
	._def_keys
	defw $4404 ; LEFT O
	defw $4308 ; RIGHT P
	defw $4808 ; UP Q
	defw $4820 ; DOWN A
	defw $4580 ; BUTTON_A SPACE
	defw $4808 ; BUTTON_B Q
	defw $4801 ; KEY_AUX3 1
	defw $4802 ; KEY_AUX4 2
	defw $4880 ; KEY_AUX1 Z
	defw $4780 ; KEY_AUX2 X
	defw $4204 ; KEY_ENTER
	defw $4804 ; KEY_ESC
	._def_keys_joy
	defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
	defw 0x4801, 0x4802, 0x4880, 0x4780, 0x4204, 0x4804
	._player_cells
	defw (_sprites + 0x0000), (_sprites + 0x0040), (_sprites + 0x0080), (_sprites + 0x00C0)
	defw (_sprites + 0x0100), (_sprites + 0x0140), (_sprites + 0x0180), (_sprites + 0x01C0)
	._enem_cells
	defw (_sprites + 0x0200), (_sprites + 0x0240), (_sprites + 0x0280), (_sprites + 0x02C0)
	defw (_sprites + 0x0300), (_sprites + 0x0340), (_sprites + 0x0380), (_sprites + 0x03C0)

._blackout
	ld	hl,192 % 256	;const
	ld	a,l
	ld	(_rda),a
	ld a, 0xc0
	.bo_l1
	ld h, a
	ld l, 0
	ld b, a
	ld a, (_rda)
	ld (hl), a
	ld a, b
	ld d, a
	ld e, 1
	ld bc, 0x5ff
	ldir
	add 8
	jr nz, bo_l1
	ret



._cpc_Border
	ld a, l
	ld bc, 0x7F11
	out (c), c
	out (c), a
	ret



._system_init
	call	_wyz_init
	di
	ld hl, 0xC000
	xor a
	ld (hl), a
	ld de, 0xC001
	ld bc, 0x3DFF
	ldir
	ld a, 195
	ld (0x38), a
	ld hl, _isr
	ld (0x39), hl
	ld b,0xf5
	.wait_vsync
	in a,(c)
	rra
	jp nc,wait_vsync
	xor a
	ld (isr_c1), a
	ei
	jp after_isr
	._isr
	push af
	push hl
	push de
	push bc
	push ix
	push iy
	ld a, (isr_c1)
	inc a
	cp 6
	jr c, _isr_done
	ld hl, isr_c2
	inc (hl)
	ld a, (_isr_player_on)
	or a
	jr z, _skip_ay_player
	call WYZ_PLAYER_ISR
	._skip_ay_player
	xor a
	._isr_done
	ld (isr_c1), a
	pop iy
	pop ix
	pop bc
	pop de
	pop hl
	pop af
	ei
	ret
	.isr_c1
	defb 0
	.isr_c2
	defb 0
	.after_isr
	ld	hl,84	;const
	call	_cpc_Border
	ld hl, _trpixlutc
	ld de, 0xF800 + 0x600
	call depack
	call	_blackout
	call my_inks
	ld	hl,0	;const
	call	cpc_SetMode
	; Horizontal chars (32), CRTC REG #1
	ld b, 0xbc
	ld c, 1 ; REG = 1
	out (c), c
	inc b
	ld c, 32 ; VALUE = 32
	out (c), c
	; Horizontal pos (42), CRTC REG #2
	ld b, 0xbc
	ld c, 2 ; REG = 2
	out (c), c
	inc b
	ld c, 42 ; VALUE = 42
	out (c), c
	; Vertical chars (24), CRTC REG #6
	ld b, 0xbc
	ld c, 6 ; REG = 6
	out (c), c
	inc b
	ld c, 24 ; VALUE = 24
	out (c), c
	ld ix, 0xE000 + 0x600
	ld de, 16
	ld b, 1 + 3 + 3 + 0 + 0
	.sp_sw_init_turnoff_loop
	ld a, #((2*8)/4)
	ld (ix + 10), a
	ld a, #(2*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	ret



._tile_address
	ld a, (_py)
	add a, a ; 2 4
	add a, a ; 4 4
	add a, a ; 8 4
	ld h, 0 ; 2
	ld l, a ; 4
	add hl, hl ; 16 11
	add hl, hl ; 32 11
	; 44 t-states
	; HL = py * 32
	ld de, (_px)
	ld d, 0
	add hl, de
	; HL = py * 32 + px
	ld de, _nametable
	add hl, de
	ex de, hl
	; DE = buffer address
	ret



._draw_coloured_tile
	; Copy params for speed & size
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (_px), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_py), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_pt), a
	._draw_coloured_tile_do
	call _tile_address ; DE = buffer address
	ex de, hl
	ld a, (_pt)
	sla a
	sla a
	add 64
	ld (hl), a
	inc hl
	inc a
	ld (hl), a
	ld bc, 31
	add hl, bc
	inc a
	ld (hl), a
	inc hl
	inc a
	ld (hl), a
	ld a, (_px)
	ld e, a
	ld a, (_py)
	ld d, a
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	dec e
	inc d
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	ret



._sp_PrintAtInv
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_px),a
	ld	hl,8	;const
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
	call _tile_address
	ld a, (_pt)
	ld (de), a
	ld a, (_px)
	ld e, a
	ld a, (_py)
	ld d, a
	call cpc_UpdTileTable
	ret



._draw_2_digits
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (_px), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_py), a
	dec hl
	dec hl
	ld a, (hl)
	.draw_2_digits_shortcut
	ld d, 0
	ld e, a
	ld hl, 10
	call l_div_u
	ld a, e
	add 16
	ld (_pn), a
	ld a, l
	add 16
	ld (_pt), a
	call _tile_address ; DE = buffer address
	ld a, (_pt)
	ld (de), a
	inc de
	ld a, (_pn)
	ld (de), a
	ld a, (_px)
	ld e, a
	ld a, (_py)
	ld d, a
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	ret



._draw_text
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (_px), a
	ld (_pt), a
	dec hl
	dec hl
	ld a, (hl)
	ld (_py), a
	dec hl
	ld a, (hl)
	dec hl
	ld l, (hl)
	ld h, a
	.draw_text_pre_loop
	push hl
	xor a
	ld (_pn), a ; Strlen
	call _tile_address ; DE = buffer address
	pop hl
	.draw_text_loop
	ld a, (hl)
	or a
	jr z, print_str_inv
	cp 0x25
	jr z, draw_text_loop
	sub 32
	ld (de), a
	inc hl
	inc de
	ld a, (_pn)
	inc a
	ld (_pn), a
	jr draw_text_loop
	.print_str_inv
	; Invalidate cells based upon strlen.
	ld a, (_py)
	ld b, a
	ld d, a
	ld a, (_px)
	ld c, a
	ld a, (_pn)
	add c
	dec a
	ld e, a
	call cpc_InvalidateRect
	ret



._draw_item
	ld	hl,0	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,(_flags+5)
	ld	h,0
	ld	de,21
	add	hl,de
	dec	hl
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ret



._draw_life
	ld	hl,8	;const
	push	hl
	ld	hl,1	;const
	push	hl
	ld	hl,71	;const
	push	hl
	ld	a,(_player+26)
	ld	e,a
	ld	d,0
	ld	hl,100	;const
	call	l_div_u
	ld	de,16
	add	hl,de
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,(_player+26)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ret



._draw_killed
	ld	hl,12	;const
	push	hl
	ld	hl,21	;const
	push	hl
	ld	hl,(_player+30)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ret



._sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_10
.i_8
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_10
	ld	a,(_gpit)
	cp	#(7 % 256)
	jp	z,i_9
	jp	nc,i_9
	ld	a,(_gpit)
	cp	#(4 % 256)
	jr	z,i_11_uge
	jp	c,i_11
.i_11_uge
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	call	cpc_PutSPTileMap2Bx8
	jp	i_12
.i_11
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	call	cpc_PutSPTileMap4Bx16
.i_12
	jp	i_8
.i_9
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
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
	cp	#(7 % 256)
	jp	z,i_14
	jp	nc,i_14
	ld	a,(_gpit)
	cp	#(4 % 256)
	jr	z,i_16_uge
	jp	c,i_16
.i_16_uge
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	call	cpc_PutSPTileMap2Bx8
	jp	i_17
.i_16
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	call	cpc_PutTrSp4Bx16TileMap
.i_17
	jp	i_13
.i_14
	.ml_min_faps_loop
	ld a, (isr_c2)
	cp 2
	jr c, ml_min_faps_loop
	.ml_min_faps_loop_end
	xor a
	ld (isr_c2), a
	call cpc_ShowTouchedTiles
	call cpc_ResetTouchedTiles
	ret



._cpc_MoveSprAbs
	ld	hl,8	;const
	add	hl,sp
	push	hl
	dec	hl
	dec	hl
	call	l_gint	;
	pop	de
	call	l_pint
	ld	hl,8+8	;const
	add	hl,sp
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(2 % 256)
	call	l_asr_u
	ld	de,4
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8+9	;const
	add	hl,sp
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	ret



._pad_read
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld hl, cpc_KeysData + 12
	xor a
	ld (_pad0), a
	ld b, 1
	pad_read_loop:
	push bc
	ld d, (hl)
	inc hl
	ld a, (hl)
	inc hl
	call cpc_TestKeyboard
	and d
	pop bc
	jr z, pad_read_not_pressed
	ld a, (_pad0)
	or b
	ld (_pad0), a
	.pad_read_not_pressed
	sla b
	jr nz, pad_read_loop
	ld a, (_pad0)
	cpl
	ld (_pad0), a
	ld (_pad1), a
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
	ld	hl,0	;const
	call	_wyz_play_music
	.title_loop
	call _pad_read
	ld a, (_pad_this_frame)
	and 0x40
	jr nz, title_not_aux3
	ld hl, _def_keys
	jr copy_keys_to_extern
	.title_not_aux3
	ld a, (_pad_this_frame)
	and 0x80
	jr nz, title_loop
	ld hl, _def_keys_joy
	.copy_keys_to_extern
	ld de, cpc_KeysData + 12
	ld bc, 24
	ldir
	call	_wyz_stop_sound
	ret



._unpack
	push hl
	call _blackout
	pop hl
	ld de, 0x9000
	call depack
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ret


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
	jp	i_24
.i_22
	ld	hl,0	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_24
	ld	hl,0	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(32 % 256)
	jp	z,i_23
	jp	nc,i_23
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
	jp	i_22
.i_23
	ld	hl,0	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_27
.i_25
	ld	hl,0	;const
	add	hl,sp
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_27
	ld	hl,0	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(32 % 256)
	jp	z,i_26
	jp	nc,i_26
	ld	de,_flags
	ld	hl,2-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_25
.i_26
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
	jp	nc,i_28
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


.i_28
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
	jp	nz,i_29
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_29
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_30
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
	jp	c,i_31
.i_32
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
.i_33
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	jp	nc,i_34
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
.i_37
	ld	a,l
	cp	#(16% 256)
	jp	z,i_38
	cp	#(19% 256)
	jp	z,i_40
	cp	#(32% 256)
	jp	z,i_42
	cp	#(240% 256)
	jp	z,i_46
	cp	#(255% 256)
	jp	z,i_47
	jp	i_36
.i_38
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
	jp	nc,i_39
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_39
	jp	i_36
.i_40
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
	jp	nc,i_41
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_41
	jp	i_36
.i_42
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
	jp	nc,i_44
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
	jp	nc,i_44
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
	jp	nc,i_44
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
	jp	nc,i_44
	ld	hl,1	;const
	jr	i_45
.i_44
	ld	hl,0	;const
.i_45
	call	l_lneg
	jp	nc,i_43
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_43
.i_46
	jp	i_36
.i_47
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	hl,7	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_36
	jp	i_33
.i_34
	ld	hl,7	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_48
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
.i_49
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	jp	nc,i_50
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
.i_53
	ld	a,l
	cp	#(1% 256)
	jp	z,i_54
	cp	#(18% 256)
	jp	z,i_55
	cp	#(20% 256)
	jp	z,i_56
	cp	#(32% 256)
	jp	z,i_57
	cp	#(224% 256)
	jp	z,i_58
	cp	#(225% 256)
	jp	z,i_59
	cp	#(226% 256)
	jp	z,i_60
	cp	#(227% 256)
	jp	z,i_61
	cp	#(255% 256)
	jp	z,i_65
	jp	i_52
.i_54
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
	jp	i_52
.i_55
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
	jp	i_52
.i_56
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
	jp	i_52
.i_57
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
	jp	i_52
.i_58
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
	jp	i_52
.i_59
	call	_sp_UpdateNow
	jp	i_52
.i_60
	ld	hl,_player+26
	ld	(hl),#(100 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_52
.i_61
	ld	hl,6	;const
	add	hl,sp
	ld	(hl),#(0 % 256 % 256)
.i_62
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
	jp	c,i_63
.i_64
	ld	hl,23	;const
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	de,1
	add	hl,de
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_sp_PrintAtInv
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
	jp	i_62
.i_63
	jp	i_52
.i_65
	ld	hl,8	;const
	add	hl,sp
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_52
	jp	i_49
.i_50
.i_48
	pop	hl
	push	hl
	ld	(_script),hl
	jp	i_30
.i_31
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



._attr
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,0	;const
	call	l_ult
	jp	c,i_67
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,0	;const
	call	l_ult
	jp	c,i_67
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,14	;const
	call	l_ugt
	jp	c,i_67
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,9	;const
	call	l_ugt
	jp	nc,i_66
.i_67
	ld	hl,0 % 256	;const
	ret


.i_66
	ld	hl,_map_attr
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
	jp	z,i_69
	jp	c,i_69
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-13
	add	hl,bc
	jp	i_70
.i_69
	ld	hl,0	;const
.i_70
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
	jp	z,i_71
	jp	c,i_71
	ld	hl,6	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-13
	add	hl,bc
	jp	i_72
.i_71
	ld	hl,0	;const
.i_72
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
	jp	nc,i_73
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l2x)
	ld	h,0
	call	l_ule
	jp	nc,i_73
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l1y)
	ld	h,0
	call	l_uge
	jp	nc,i_73
	ld	hl,2	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	hl,(_l2y)
	ld	h,0
	call	l_ule
	jp	nc,i_73
	ld	hl,1	;const
	jr	i_74
.i_73
	ld	hl,0	;const
.i_74
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
	ld hl, _asm_int
	ld a, e
	ld (hl), a
	inc hl
	ld a, d
	ld (hl), a
	LD H,0
	ret



._abs
	pop	bc
	pop	hl
	push	hl
	push	bc
	xor	a
	or	h
	jp	p,i_75
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_75
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_76
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



._espera_activa
	ld	a,#(1 % 256 % 256)
	ld	(_res),a
	ld	hl,0	;const
	ld	(_gpint),hl
	jp	i_79
.i_77
	ld	hl,(_gpint)
	inc	hl
	ld	(_gpint),hl
	dec	hl
.i_79
	ld	de,(_gpint)
	ld	hl,4-2	;const
	add	hl,sp
	call	l_gint	;
	call	l_ult
	jp	nc,i_80
	ld	a,(_res)
	and	a
	jr	nz,i_81_i_80
.i_80
	jp	i_78
.i_81_i_80
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpjt),a
	jp	i_84
.i_82
	ld	hl,_gpjt
	ld	a,(hl)
	inc	(hl)
.i_84
	ld	a,(_gpjt)
	cp	#(250 % 256)
	jp	z,i_83
	jp	nc,i_83
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_res),a
	jp	i_82
.i_83
	call	_pad_read
	ld	a,(_pad0)
	cp	#(255 % 256)
	jp	z,i_85
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_res),a
.i_85
	jp	i_77
.i_78
	ld	hl,(_res)
	ld	h,0
	ret



._game_ending
	call	_sp_UpdateNow
	ld	hl,_s_ending
	call	_unpack
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_88
.i_86
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_88
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_87
	jp	nc,i_87
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_86
.i_87
	ld	hl,9	;const
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
	jp	i_91
.i_89
	ld	hl,_gpjt
	ld	a,(hl)
	inc	(hl)
.i_91
	ld	a,(_gpjt)
	cp	#(14 % 256)
	jp	z,i_90
	jp	nc,i_90
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_94
.i_92
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_94
	ld	a,(_gpit)
	cp	#(22 % 256)
	jp	z,i_93
	jp	nc,i_93
	ld	hl,(_gpjt)
	ld	h,0
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,0	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_92
.i_93
	jp	i_89
.i_90
	ld	hl,12	;const
	push	hl
	ld	hl,11	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,39	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,33	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,13	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,45	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,37	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,16	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,47	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,17	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,54	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,18	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,37	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,19	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,50	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,12	;const
	push	hl
	ld	hl,20	;const
	push	hl
	ld	hl,95	;const
	push	hl
	ld	hl,1	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	_sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_97
.i_95
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_97
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_96
	jp	nc,i_96
	ld	hl,7	;const
	call	_peta_el_beeper
	ld	hl,2	;const
	call	_peta_el_beeper
	jp	i_95
.i_96
	ld	hl,9	;const
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
	jp	i_100
.i_98
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_100
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_99
	jp	nc,i_99
	ld	hl,_bullets
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
	jp	i_98
.i_99
	ret



._init_malotes
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
	cp	#(72 % 256)
	jp	z,i_102
	jp	nc,i_102
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
	jp	i_101
.i_102
	ret



._fire_bullet
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_bit),a
	jp	i_106
.i_104
	ld	hl,_bit
	ld	a,(hl)
	inc	(hl)
.i_106
	ld	a,(_bit)
	cp	#(3 % 256)
	jp	z,i_105
	jp	nc,i_105
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	and	a
	jp	nz,i_107
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#(1 % 256 % 256)
	ld	a,(_player+22)
	and	a
	jp	nz,i_108
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	bc,-4
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl),#(65528 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_109
.i_108
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	bc,12
	add	hl,bc
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl),#(8 % 256 % 256)
.i_109
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
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
	ld	hl,6	;const
	call	_peta_el_beeper
	ld	a,(_player+26)
	cp	#(2 % 256)
	jp	z,i_110
	jp	c,i_110
	ld	hl,_player+26
	push	hl
	ld	l,(hl)
	ld	h,0
	dec	hl
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_111
.i_110
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_111
	jp	i_105
.i_107
	jp	i_104
.i_105
	ret



._player_hidden
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
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
	ld	a,(__y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_113
	inc	hl
	ld	hl,(_player+6)
	ld	de,0	;const
	call	l_eq
	jr	c,i_114_i_113
.i_113
	jp	i_112
.i_114_i_113
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
	jp	c,i_116
	ld	hl,(__xx)
	ld	h,0
	ld	de,1
	add	hl,de
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
	jp	nc,i_117
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_117
	ld	hl,1	;const
	jr	i_118
.i_117
	ld	hl,0	;const
.i_118
	ld	a,h
	or	l
	jp	nz,i_116
	jr	i_119
.i_116
	ld	hl,1	;const
.i_119
	ld	a,h
	or	l
	jp	z,i_115
	ld	hl,1 % 256	;const
	ret


.i_115
.i_112
	ld	hl,0 % 256	;const
	ret



._move
	ld	hl,(_player)
	ld	h,0
	ld	a,l
	ld	(_cx),a
	ld	hl,(_player+1+1)
	ld	h,0
	ld	a,l
	ld	(_cy),a
	call	_pad_read
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player+8)
	ld	de,384	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_120
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
	jp	i_121
.i_120
	ld	hl,384	;const
	ld	(_player+8),hl
.i_121
	ld	a,(_player+25)
	and	a
	jp	z,i_122
	ld	hl,0	;const
	ld	(_player+8),hl
.i_122
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
	jp	p,i_123
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_123
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_124
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_124
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
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
	ld	a,(__y)
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
	jp	p,i_125
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
	jp	c,i_127
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_128
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
	jp	nc,i_128
	ld	hl,1	;const
	jr	i_129
.i_128
	ld	hl,0	;const
.i_129
	ld	a,h
	or	l
	jp	nz,i_127
	jr	i_130
.i_127
	ld	hl,1	;const
.i_130
	ld	a,h
	or	l
	jp	z,i_126
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
.i_126
	jp	i_131
.i_125
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_133
	ld	a,(__y)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jr	c,i_134_i_133
.i_133
	jp	i_132
.i_134_i_133
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_135
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
	jp	c,i_137
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_138
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
	jp	nc,i_138
	ld	hl,1	;const
	jr	i_139
.i_138
	ld	hl,0	;const
.i_139
	ld	a,h
	or	l
	jp	nz,i_137
	jr	i_140
.i_137
	ld	hl,1	;const
.i_140
	ld	a,h
	or	l
	jp	z,i_136
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
.i_136
.i_135
.i_132
.i_131
	ld	hl,_gpit
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_141
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
	jp	nc,i_142
	ld	hl,65152	;const
	ld	(_player+8),hl
.i_142
	ld	hl,_jetpac_frame_counter
	ld	a,(hl)
	inc	(hl)
	ld	a,(_jetpac_frame_counter)
	cp	#(11 % 256)
	jp	nz,i_143
	ld	a,#(8 % 256 % 256)
	ld	(_jetpac_frame_counter),a
	ld	hl,_player+26
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_143
	jp	i_144
.i_141
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_jetpac_frame_counter),a
.i_144
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_146
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_146
	ld	hl,0	;const
	jr	i_147
.i_146
	ld	hl,1	;const
.i_147
	call	l_lneg
	jp	nc,i_145
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_148
	or	l
	jp	z,i_148
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
	jp	p,i_149
	ld	hl,0	;const
	ld	(_player+6),hl
.i_149
	jp	i_150
.i_148
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_151
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
	jp	m,i_152
	or	l
	jp	z,i_152
	ld	hl,0	;const
	ld	(_player+6),hl
.i_152
.i_151
.i_150
.i_145
	ld	hl,_gpit
	ld	a,(hl)
	rrca
	jp	c,i_153
	ld	hl,(_player+6)
	ld	de,65280	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_154
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
.i_154
.i_153
	ld	hl,_gpit
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_155
	ld	hl,(_player+6)
	ld	de,256	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_156
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
.i_156
.i_155
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
	jp	p,i_157
	ld	hl,0	;const
	ld	(_player),hl
.i_157
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_158
	ld	hl,14336	;const
	ld	(_player),hl
.i_158
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	a,(__y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	a,(__x)
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
	jp	p,i_159
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
	jp	c,i_161
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_162
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
	jp	nc,i_162
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
	jp	z,i_160
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
.i_160
	jp	i_165
.i_159
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
	jp	c,i_167
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_168
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
	jp	nc,i_168
	ld	hl,1	;const
	jr	i_169
.i_168
	ld	hl,0	;const
.i_169
	ld	a,h
	or	l
	jp	nz,i_167
	jr	i_170
.i_167
	ld	hl,1	;const
.i_170
	ld	a,h
	or	l
	jp	z,i_166
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
.i_166
.i_165
	ld	hl,_gpit
	ld	a,(hl)
	and	#(16 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_172
	inc	hl
	ld	a,(_player+31)
	cp	#(0 % 256)
	jr	z,i_173_i_172
.i_172
	jp	i_171
.i_173_i_172
	ld	hl,_player+31
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_fire_bullet
.i_171
	ld	hl,_gpit
	ld	a,(hl)
	and	#(16 % 256)
	jp	z,i_174
	ld	hl,_player+31
	ld	(hl),#(0 % 256 % 256)
.i_174
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
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__xx),a
	ld	a,(__y)
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
	jp	z,i_176
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_177
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
	jp	nz,i_177
	inc	hl
	jr	i_178
.i_177
	ld	hl,0	;const
.i_178
	ld	a,h
	or	l
	jp	nz,i_176
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_179
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
	jp	nz,i_179
	inc	hl
	jr	i_180
.i_179
	ld	hl,0	;const
.i_180
	ld	a,h
	or	l
	jp	nz,i_176
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_181
	inc	hl
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_181
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
	jp	nz,i_181
	inc	hl
	jr	i_182
.i_181
	ld	hl,0	;const
.i_182
	ld	a,h
	or	l
	jp	nz,i_176
	jr	i_183
.i_176
	ld	hl,1	;const
.i_183
	ld	a,h
	or	l
	jp	z,i_175
	ld	a,(_player+26)
	and	a
	jp	z,i_184
	ld	hl,4	;const
	call	_peta_el_beeper
	ld	hl,_player+26
	dec	(hl)
	ld	de,_player
	ld	hl,(_cx)
	ld	h,0
	call	l_pint
	ld	de,_player+1+1
	ld	hl,(_cy)
	ld	h,0
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
.i_184
.i_175
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	z,i_185
	ld	a,(_player+22)
	and	a
	jp	nz,i_186
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+448
	pop	de
	call	l_pint
	jp	i_187
.i_186
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+192
	pop	de
	call	l_pint
.i_187
	jp	i_188
.i_185
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_189
	ld	a,(_player+22)
	and	a
	jp	nz,i_190
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+320
	pop	de
	call	l_pint
	jp	i_191
.i_190
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+64
	pop	de
	call	l_pint
.i_191
	jp	i_192
.i_189
	ld	hl,_player+21
	inc	(hl)
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_193
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
.i_193
	ld	a,(_player+22)
	and	a
	jp	nz,i_194
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_196
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_195
.i_196
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+320
	pop	de
	call	l_pint
	jp	i_198
.i_195
	ld	a,(_player+20)
	and	a
	jp	nz,i_199
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+256
	pop	de
	call	l_pint
	jp	i_200
.i_199
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_201
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+384
	pop	de
	call	l_pint
.i_201
.i_200
.i_198
	jp	i_202
.i_194
	ld	a,(_player+20)
	cp	#(1 % 256)
	jp	z,i_204
	ld	a,(_player+20)
	cp	#(3 % 256)
	jp	nz,i_203
.i_204
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+64
	pop	de
	call	l_pint
	jp	i_206
.i_203
	ld	a,(_player+20)
	and	a
	jp	nz,i_207
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites
	pop	de
	call	l_pint
	jp	i_208
.i_207
	ld	a,(_player+20)
	cp	#(2 % 256)
	jp	nz,i_209
	ld	hl,_player+17
	push	hl
	ld	hl,_sprites+128
	pop	de
	call	l_pint
.i_209
.i_208
.i_206
.i_202
.i_192
.i_188
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
	jp	i_212
.i_210
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_212
	ld	a,(_gpit)
	cp	#(75 % 256)
	jp	z,i_211
	jp	nc,i_211
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
	jp	nc,i_214
	ld	a,(_rda)
	cp	#(0 % 256)
	jp	nz,i_214
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
	jr	z,i_215_i_214
.i_214
	jp	i_213
.i_215_i_214
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rda),a
.i_213
	ld	hl,(_rdx)
	ld	h,0
	ld	de,2
	add	hl,de
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
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
	jp	nz,i_216
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_216
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
	jp	nc,i_218
	ld	a,(_rdb)
	cp	#(0 % 256)
	jp	nz,i_218
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
	jr	z,i_219_i_218
.i_218
	jp	i_217
.i_219_i_218
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rdb),a
.i_217
	ld	hl,(_rdx)
	ld	h,0
	ld	de,2
	add	hl,de
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	ld	de,2
	add	hl,de
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
	jp	nz,i_220
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,(_rdy)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
.i_220
	jp	i_210
.i_211
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
	jp	i_223
.i_221
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_223
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_222
	jp	nc,i_222
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
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
.i_226
	ld	a,l
	cp	#(1% 256)
	jp	z,i_227
	cp	#(2% 256)
	jp	z,i_228
	cp	#(3% 256)
	jp	z,i_229
	cp	#(4% 256)
	jp	z,i_230
	cp	#(6% 256)
	jp	z,i_231
	jp	i_232
.i_227
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprites+512
	pop	de
	call	l_pint
	jp	i_225
.i_228
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprites+640
	pop	de
	call	l_pint
	jp	i_225
.i_229
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprites+768
	pop	de
	call	l_pint
	jp	i_225
.i_230
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprites+896
	pop	de
	call	l_pint
	jp	i_225
.i_231
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprites+768
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,15
	add	hl,bc
	ld	(hl),#(0 % 256 % 256)
.i_232
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_225
	ld	hl,_enoffsmasi
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	jp	i_221
.i_222
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_235
.i_233
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_235
	ld	a,(_gpit)
	cp	#(30 % 256)
	jp	z,i_234
	jp	nc,i_234
	ld	hl,23	;const
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,0	;const
	push	hl
	call	_sp_PrintAtInv
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_233
.i_234
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
	ld	hl,_bullets
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_bullets
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
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_bullets
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,_bullets
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
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,7	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_239
	ld	hl,_bullets
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
.i_239
	ld	hl,_bullets
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,8	;const
	call	l_ult
	jp	c,i_241
	ld	hl,_bullets
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	e,(hl)
	ld	d,0
	ld	hl,240	;const
	call	l_ugt
	jp	nc,i_240
.i_241
	ld	hl,_bullets
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
.i_240
	jp	i_236
.i_237
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
	jp	nc,i_243
	ld	hl,(_dx)
	ld	h,0
	jp	i_244
.i_243
	ld	hl,(_dy)
	ld	h,0
.i_244
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
	jp	i_247
.i_245
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_247
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_246
	jp	nc,i_246
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
	jp	z,i_248
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
	ld	(_cx),a
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
	ld	(_cy),a
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	(hl)
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_249
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
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
.i_252
	ld	a,l
	cp	#(1% 256)
	jp	z,i_253
	cp	#(2% 256)
	jp	z,i_256
	cp	#(3% 256)
	jp	z,i_259
	cp	#(6% 256)
	jp	z,i_260
	cp	#(4% 256)
	jp	z,i_263
	jp	i_251
.i_253
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_254
	ld	hl,_sprites+512
	jp	i_255
.i_254
	ld	hl,_sprites+576
.i_255
	pop	de
	call	l_pint
	jp	i_251
.i_256
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_257
	ld	hl,_sprites+640
	jp	i_258
.i_257
	ld	hl,_sprites+704
.i_258
	pop	de
	call	l_pint
	jp	i_251
.i_259
.i_260
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_261
	ld	hl,_sprites+768
	jp	i_262
.i_261
	ld	hl,_sprites+832
.i_262
	pop	de
	call	l_pint
	jp	i_251
.i_263
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_264
	ld	hl,_sprites+896
	jp	i_265
.i_264
	ld	hl,_sprites+960
.i_265
	pop	de
	call	l_pint
.i_251
.i_249
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
	jp	nc,i_266
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_ccx),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_ccy),a
	jp	i_267
.i_266
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
.i_267
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
	jp	nc,i_268
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
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
	jp	p,i_269
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_271
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_271
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_271
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_271
	ld	hl,(_player+8)
	ld	de,65504	;const
	ex	de,hl
	call	l_ge
	jr	c,i_272_i_271
.i_271
	jp	i_270
.i_272_i_271
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_ccy)
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
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_player+1+1)
	ld	de,1024	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_273
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
	jp	c,i_275
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_276
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
	jp	nc,i_276
	ld	hl,1	;const
	jr	i_277
.i_276
	ld	hl,0	;const
.i_277
	ld	a,h
	or	l
	jp	nz,i_275
	jr	i_278
.i_275
	ld	hl,1	;const
.i_278
	ld	a,h
	or	l
	jp	z,i_274
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
.i_274
.i_273
.i_270
	jp	i_279
.i_269
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
	jp	m,i_280
	or	l
	jp	z,i_280
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_282
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_282
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-20
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_282
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-14
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_282
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_283_i_282
.i_282
	jp	i_281
.i_283_i_282
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_ccy)
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
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_284
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
	jp	c,i_286
	ld	hl,__x
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_287
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
	jp	nc,i_287
	ld	hl,1	;const
	jr	i_288
.i_287
	ld	hl,0	;const
.i_288
	ld	a,h
	or	l
	jp	nz,i_286
	jr	i_289
.i_286
	ld	hl,1	;const
.i_289
	ld	a,h
	or	l
	jp	z,i_285
	ld	hl,_player+1+1
	push	hl
	ld	a,(__yy)
	ld	e,a
	ld	d,0
	ld	l,#(10 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_285
.i_284
.i_281
.i_280
.i_279
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__yy),a
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
	jp	nc,i_291
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_291
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_291
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_291
	ld	hl,(__y)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_291
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_292_i_291
.i_291
	jp	i_290
.i_292_i_291
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+1+1
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(__yy),a
	ld	hl,(__x)
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
	ld	(__x),a
	ld	hl,_player
	push	hl
	ld	a,(__x)
	ld	e,a
	ld	d,0
	ld	l,#(6 % 256)
	call	l_asl
	pop	de
	call	l_pint
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
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
	jp	p,i_293
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
	jp	c,i_295
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_296
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
	jp	nc,i_296
	ld	hl,1	;const
	jr	i_297
.i_296
	ld	hl,0	;const
.i_297
	ld	a,h
	or	l
	jp	nz,i_295
	jr	i_298
.i_295
	ld	hl,1	;const
.i_298
	ld	a,h
	or	l
	jp	z,i_294
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
.i_294
	jp	i_299
.i_293
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
	jp	m,i_300
	or	l
	jp	z,i_300
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
	jp	c,i_302
	ld	hl,__y
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_303
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
	jp	nc,i_303
	ld	hl,1	;const
	jr	i_304
.i_303
	ld	hl,0	;const
.i_304
	ld	a,h
	or	l
	jp	nz,i_302
	jr	i_305
.i_302
	ld	hl,1	;const
.i_305
	ld	a,h
	or	l
	jp	z,i_301
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
.i_301
.i_300
.i_299
.i_290
	jp	i_306
.i_268
	ld	hl,(_tocado)
	ld	h,0
	call	l_lneg
	jp	nc,i_308
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
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
	jp	z,i_308
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
	jp	nc,i_308
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_309_i_308
.i_308
	jp	i_307
.i_309_i_308
	ld	a,(_player+26)
	and	a
	jp	z,i_310
	ld	a,#(1 % 256 % 256)
	ld	(_tocado),a
	ld	hl,4	;const
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
	jp	nc,i_311
	ld	a,(_player+26)
	cp	#(25 % 256)
	jp	z,i_312
	jp	c,i_312
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(-25 % 256)
	ld	(hl),a
	ld	l,a
	ld	h,0
	jp	i_313
.i_312
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_313
	jp	i_314
.i_311
	ld	a,(_player+26)
	cp	#(10 % 256)
	jp	z,i_315
	jp	c,i_315
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(-10 % 256)
	ld	(hl),a
	ld	l,a
	ld	h,0
	jp	i_316
.i_315
	ld	hl,_player+26
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_316
.i_314
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_310
.i_307
.i_306
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
	jp	nc,i_317
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,15
	add	hl,bc
	ld	l,(hl)
	ld	h,0
.i_320
	ld	a,l
	cp	#(0% 256)
	jp	z,i_321
	cp	#(1% 256)
	jp	z,i_325
	cp	#(2% 256)
	jp	z,i_344
	jp	i_319
.i_321
	ld	hl,(_ccx)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
	ld	h,0
	push	hl
	call	_distance
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,80	;const
	ex	de,hl
	call	l_le
	jp	nc,i_323
	call	_player_hidden
	call	l_lneg
	jr	c,i_324_i_323
.i_323
	jp	i_322
.i_324_i_323
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,15
	add	hl,bc
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_322
	jp	i_319
.i_325
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_326
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_328
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_329_i_328
.i_328
	jp	i_327
.i_329_i_328
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_330
.i_327
	ld	hl,(_player)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_332
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_333_i_332
.i_332
	jp	i_331
.i_333_i_332
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_331
.i_330
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_gt
	jp	nc,i_335
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_336_i_335
.i_335
	jp	i_334
.i_336_i_335
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_337
.i_334
	ld	hl,(_player+1+1)
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_lt
	jp	nc,i_339
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_340_i_339
.i_339
	jp	i_338
.i_340_i_339
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_338
.i_337
.i_326
	ld	hl,(_ccx)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
	ld	h,0
	push	hl
	call	_distance
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,80	;const
	ex	de,hl
	call	l_ge
	jp	c,i_342
	call	_player_hidden
	ld	a,h
	or	l
	jp	nz,i_342
	jr	i_343
.i_342
	ld	hl,1	;const
.i_343
	ld	a,h
	or	l
	jp	z,i_341
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,15
	add	hl,bc
	ld	(hl),#(2 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_341
	jp	i_319
.i_344
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_ugt
	jp	nc,i_346
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_347_i_346
.i_346
	jp	i_345
.i_347_i_346
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_348
.i_345
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_ult
	jp	nc,i_350
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_351_i_350
.i_350
	jp	i_349
.i_351_i_350
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_349
.i_348
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_ugt
	jp	nc,i_353
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,256	;const
	call	l_lt
	jr	c,i_354_i_353
.i_353
	jp	i_352
.i_354_i_353
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_355
.i_352
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
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	call	l_gint	;
	pop	de
	call	l_ult
	jp	nc,i_357
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,65280	;const
	call	l_gt
	jr	c,i_358_i_357
.i_357
	jp	i_356
.i_358_i_357
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
	add	hl,bc
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
.i_356
.i_355
	ld	hl,(_ccx)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
	ld	h,0
	push	hl
	call	_distance
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,80	;const
	ex	de,hl
	call	l_le
	jp	nc,i_360
	call	_player_hidden
	call	l_lneg
	jr	c,i_361_i_360
.i_360
	jp	i_359
.i_361_i_360
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,15
	add	hl,bc
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_359
.i_319
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,13
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
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,15360	;const
	call	l_gt
	jp	nc,i_362
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	de,15360	;const
	ex	de,hl
	call	l_pint
.i_362
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_363
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_363
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,10240	;const
	call	l_gt
	jp	nc,i_364
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	de,10240	;const
	ex	de,hl
	call	l_pint
.i_364
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,64512	;const
	call	l_lt
	jp	nc,i_365
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	de,64512	;const
	ex	de,hl
	call	l_pint
.i_365
	jp	i_366
.i_317
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
	jp	c,i_368
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
	jp	nc,i_367
.i_368
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
.i_367
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
	jp	c,i_371
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
	jp	nc,i_370
.i_371
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
.i_370
.i_366
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
	jp	nc,i_373
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_bit),a
	jp	i_376
.i_374
	ld	hl,_bit
	ld	a,(hl)
	inc	(hl)
.i_376
	ld	a,(_bit)
	cp	#(3 % 256)
	jp	z,i_375
	jp	nc,i_375
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_377
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_379
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,(_ccy)
	ld	h,0
	ld	bc,12
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_379
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
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
	jp	nc,i_379
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
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
	jr	c,i_380_i_379
.i_379
	jp	i_378
.i_380_i_379
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
	jp	nc,i_381
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,11
	add	hl,bc
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,_bullets
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	ld	a,(hl)
	cp	#(0 % 256)
	jp	z,i_382
	jp	c,i_382
	ld	hl,128	;const
	jp	i_383
.i_382
	ld	hl,65408	;const
.i_383
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_381
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	push	hl
	ld	hl,_sprite_17_a
	pop	de
	call	l_pint
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_bullets
	push	hl
	ld	hl,(_bit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
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
	jp	nc,i_384
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
.i_384
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
	jp	nz,i_385
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_enit)
	ld	h,0
	ld	de,1
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_17_a
	pop	de
	call	l_pint
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,5	;const
	call	_peta_el_beeper
	ld	hl,20	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld	hl,_en_an
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
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
.i_385
.i_378
.i_377
	jp	i_374
.i_375
.i_373
.i_248
	jp	i_245
.i_246
	ret



._do_game
.i_386
	call	_sp_UpdateNow
	ld	hl,_s_title
	call	_unpack
	call	_select_joyfunc
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
.i_388
	ld	a,(_playing)
	and	a
	jp	z,i_389
	ld	hl,(_player+26)
	ld	h,0
	ex	de,hl
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_390
	call	_draw_life
	ld	hl,(_player+26)
	ld	h,0
	ld	a,l
	ld	(_life_old),a
.i_390
	ld	hl,(_flags+5)
	ld	h,0
	ex	de,hl
	ld	hl,(_item_old)
	ld	h,0
	call	l_ne
	jp	nc,i_391
	call	_draw_item
	ld	hl,(_flags+5)
	ld	h,0
	ld	a,l
	ld	(_item_old),a
.i_391
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
	jp	nc,i_392
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_move
	pop	bc
.i_392
.i_393
	ld	hl,(_n_pant)
	ld	h,0
	push	hl
	call	_mueve_bicharracos
	pop	bc
	call	_mueve_bullets
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_396
.i_394
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_396
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_395
	jp	nc,i_395
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
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_397
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,7
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_enx),a
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,9
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_eny),a
	jp	i_398
.i_397
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
.i_398
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_enx)
	ld	h,0
	push	hl
	ld	hl,(_eny)
	ld	h,0
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_394
.i_395
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
	jp	c,i_400
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_399
.i_400
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_player+17)
	push	hl
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
	ld	h,0
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_402
.i_399
	ld	hl,_sp_sw
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_402
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_405
.i_403
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_405
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_404
	jp	nc,i_404
	ld	hl,_bullets
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
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_406
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,4
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_19_a
	push	hl
	ld	hl,_bullets
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_bullets
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
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_407
.i_406
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,4
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_407
	jp	i_403
.i_404
	call	_sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_410
.i_408
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_410
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_409
	jp	nc,i_409
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_411
	ld	hl,1	;const
	call	_peta_el_beeper
	ld	hl,_en_an
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_411
	jp	i_408
.i_409
	ld	a,(_player+23)
	cp	#(2 % 256)
	jp	nz,i_412
	ld	hl,_player+24
	dec	(hl)
	ld	a,(hl)
	and	a
	jp	nz,i_413
	ld	hl,_player+23
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_413
.i_412
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,_gpit
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_414
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
	jp	nc,i_415
	ld	hl,4	;const
	call	_peta_el_beeper
.i_415
.i_418
	call	_pad_read
	ld	hl,(_pad0)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
.i_416
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	a,h
	or	l
	jp	z,i_418
.i_417
.i_414
	ld	hl,(_player)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_420
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_421_i_420
.i_420
	jp	i_419
.i_421_i_420
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
.i_419
	ld	hl,(_player)
	ld	de,14336	;const
	call	l_eq
	jp	nc,i_423
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_424_i_423
.i_423
	jp	i_422
.i_424_i_423
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
.i_422
	ld	hl,(_player+1+1)
	ld	de,0	;const
	call	l_eq
	jp	nc,i_426
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_426
	ld	a,(_n_pant)
	cp	#(8 % 256)
	jr	z,i_426_uge
	jp	c,i_426
.i_426_uge
	jr	i_427_i_426
.i_426
	jp	i_425
.i_427_i_426
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
.i_425
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	call	l_eq
	jp	nc,i_429
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_430_i_429
.i_429
	jp	i_428
.i_430_i_429
	ld	a,(_n_pant)
	cp	#(16 % 256)
	jp	z,i_431
	jp	nc,i_431
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
	jp	i_432
.i_431
	ld	hl,_player+8
	ld	(hl),#(65152 % 256)
	inc	hl
	ld	(hl),#(65152 / 256)
	ld	a,(_player+26)
	and	a
	jp	z,i_433
	ld	hl,4	;const
	call	_peta_el_beeper
	ld	hl,_player+26
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_433
.i_432
.i_428
	ld	a,(_player+27)
	cp	#(99 % 256)
	jp	z,i_435
	ld	a,(_n_pant)
	cp	#(7 % 256)
	jp	z,i_435
	ld	a,(_script_result)
	cp	#(1 % 256)
	jp	nz,i_434
.i_435
	ld	a,#(0 % 256 % 256)
	ld	(_success),a
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_437
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_439
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(10 % 256)
	call	l_asr
	ld	de,4	;const
	ex	de,hl
	call	l_eq
	jr	c,i_440_i_439
.i_439
	jp	i_438
.i_440_i_439
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_438
	jp	i_441
.i_437
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	nz,i_442
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_success),a
.i_442
.i_441
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_443
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_443
.i_434
	ld	a,(_player+26)
	cp	#(0 % 256)
	jp	z,i_445
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_444
.i_445
	ld	hl,_sp_sw
	push	hl
	ld	hl,_sprite_18_a
	push	hl
	ld	hl,0	;const
	push	hl
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_449
.i_447
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_449
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_448
	jp	nc,i_448
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
	jp	z,i_450
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_sprite_18_a
	push	hl
	ld	hl,0	;const
	push	hl
	push	hl
	call	_cpc_moveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_450
	jp	i_447
.i_448
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_cortina
.i_444
	jp	i_388
.i_389
	jp	i_386
.i_387
	ret



._main
	call	_system_init
	call	_do_game
	ret




; --- Start of Static Variables ---

;	SECTION	bss

._isr_player_on	defs	1
._bullets	defs	12
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
._wyz_beat_ct	defs	1
._items	defs	160
._x0	defs	1
._x1	defs	1
._y0	defs	1
._y1	defs	1
.__x	defs	1
.__y	defs	1
._cx	defs	1
._cy	defs	1
._dx	defs	1
._dy	defs	1
._life_old	defs	1
._mn	defs	1
._pn	defs	1
._pt	defs	1
._px	defs	1
._py	defs	1
._sp_player	defs	2
._sp_bullets	defs	6
._spritesClipValues	defs	0
._enoffs	defs	1
._pad_this_frame	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._enit	defs	1
._gpit	defs	1
._gpjt	defs	1
._playing	defs	1
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
.__yy	defs	1
._player	defs	32
._enx	defs	1
._eny	defs	1
._jetpac_frame_counter	defs	1
._rda	defs	1
._rdb	defs	1
._rdd	defs	1
._rdm	defs	1
._keys_old	defs	1
._res	defs	1
._rdx	defs	1
._rdy	defs	1
._pt_alt	defs	1
._script	defs	2
._pxx	defs	1
._enoffsmasi	defs	1
._pyy	defs	1
._tocado	defs	1
._pptr_alt	defs	2
._allpurposepuntero	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	XDEF	_read_vbyte
	XDEF	_hotspots
	XDEF	_isr_player_on
	LIB	cpc_PutTrSp8x8TileMapPxM1
	LIB	cpc_PutTrSp16x16TileMapPxM1
	LIB	cpc_PutTrSp16x24TileMapPxM1
	XDEF	_draw_scr
	XDEF	_wyz_play_music
	XDEF	_fire_bullet
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	XDEF	_f_scripts
	LIB	cpc_PutSpTileMap12x24CA
	LIB	cpc_PrintGphStrStdXY
	XDEF	_bullets
	XDEF	_sp_moviles
	LIB	cpc_PutTiles
	XDEF	_sprites
	XDEF	_def_keys
	XDEF	_cortina
	XDEF	_draw_life
	LIB	cpc_PrintGphStrM12X
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_draw_item
	XDEF	_half_life
	XDEF	_en_an
	defc	_en_an	=	54784
	LIB	cpc_ShowScrTileMap
	XDEF	_cpc_MoveSprAbs
	LIB	cpc_SetMode
	LIB	cpc_ClrScr
	XREF	_cpc_moveSprAbs
	LIB	cpc_SetModo
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_mueve_bicharracos
	LIB	cpc_ShowTouchedTiles2
	LIB	cpc_SetTile
	XDEF	_malotes
	XDEF	_draw_text
	LIB	cpc_PutSpTileMap8x8PxM1
	LIB	cpc_PutSpTileMap16x16PxM1
	LIB	cpc_PutSpTileMap16x24PxM1
	XDEF	_mueve_bullets
	LIB	cpc_CollSp
	LIB	cpc_PutMaskSp4x16
	XDEF	_blackout
	XDEF	_map_buff
	defc	_map_buff	=	50838
	LIB	cpc_PrintGphStrStd
	XDEF	_cpc_Border
	XDEF	_killed_old
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_gpint
	XDEF	_key_m
	XDEF	_script_something_done
	LIB	cpc_ShowTileMap
	XDEF	_kempston_is_attached
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_wyz_beat_ct
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_items
	XDEF	_sp_UpdateNow
	XREF	_cpc_UpdateNow
	XDEF	_x0
	XDEF	_x1
	XDEF	_y0
	XDEF	_y1
	LIB	cpc_PutTrSp2Bx8TileMapG
	LIB	cpc_PutTrSp4Bx16TileMapG
	LIB	cpc_PutTrSp4Bx24TileMapG
	XDEF	_espera_activa
	LIB	cpc_SpRLM1
	XDEF	__x
	XDEF	__y
	XDEF	_wyz_init
	XDEF	_player_hidden
	XDEF	_cx
	XDEF	_cy
	XDEF	_dx
	XDEF	_dy
	LIB	cpc_PrintGphStrXY2X
	LIB	cpc_SpRRM1
	XDEF	_life_old
	XDEF	_mn
	XDEF	_pn
	LIB	cpc_PrintGphStrXYM1
	LIB	cpc_PutTrSp12x24TileMapGCA
	XDEF	_pt
	XDEF	_px
	XDEF	_py
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	LIB	cpc_TestKey
	LIB	cpc_PutSprite
	XDEF	_mscce_0
	XDEF	_mscce_1
	XDEF	_mscce_2
	XDEF	_mscce_3
	XDEF	_pant_final
	XDEF	cpc_PutSpTileMap
	LIB	cpc_PutTrSpTileMap
	LIB	cpc_PutORSpTileMap
	LIB	cpc_PutCpSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	XDEF	_mscce_4
	XDEF	_mscce_5
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	XDEF	_mscce_6
	XDEF	_mscce_7
	XDEF	_mscce_8
	XDEF	_mscce_9
	XDEF	_msccf_0
	XDEF	_msccf_1
	XDEF	_msccf_2
	XDEF	_msccf_3
	XDEF	_msccf_4
	XDEF	_msccf_5
	XDEF	_msccf_6
	XDEF	_msccf_7
	XDEF	_msccf_8
	XDEF	_msccf_9
	LIB	cpc_PutSPTileMap4Bx16
	LIB	cpc_PutSPTileMap4Bx24
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_read_byte
	XDEF	_srand
	LIB	cpc_TouchTileXY
	LIB	cpc_SetTouchTileXY
	XDEF	_qtile
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_sprite_19_a
	XREF	_sprite_19_b
	LIB	cpc_PutTrSp4x8TileMapGPx
	LIB	cpc_PutTrSp8x16TileMapGPx
	LIB	cpc_PutTrSp8x24TileMapGPx
	XDEF	_sp_player
	XDEF	_init_player
	XDEF	_sp_bullets
	XDEF	_init_bullets
	XDEF	_spritesClipValues
	XDEF	_enoffs
	LIB	cpc_PutSpTr
	XDEF	_pad_this_frame
	LIB	cpc_DisableFirmware
	LIB	cpc_EnableFirmware
	XDEF	_enem_cells
	LIB	cpc_PrintGphStrXYM12X
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_tile_address
	XDEF	_n_pant
	LIB	cpc_UpdScrM1P
	XDEF	_def_keys_joy
	LIB	cpc_SetBorder
	LIB	cpc_RLI
	XDEF	_system_init
	LIB	cpc_RRI
	LIB	cpc_GetSp
	XDEF	_init_malotes
	XDEF	_enit
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_main
	XDEF	_mapa
	XDEF	_draw_coloured_tile
	XDEF	_attr
	XDEF	_player_cells
	XDEF	_s_title
	LIB	cpc_ResetTouchedTiles
	LIB	cpc_ShowTouchedTiles
	XDEF	_gpit
	XDEF	_gpjt
	LIB	cpc_PutMaskSp2x8
	XDEF	_playing
	LIB	cpc_ScanKeyboard
	LIB	cpc_SetColour
	XDEF	_rand
	XDEF	_seed
	XDEF	_asm_int_2
	LIB	cpc_DeleteKeys
	XDEF	_objs_old
	XDEF	_maincounter
	LIB	cpc_PutTrSp2Bx8TileMap
	LIB	cpc_PutTrSp4Bx16TileMap
	LIB	cpc_PutTrSp4Bx24TileMap
	XDEF	_draw_killed
	XDEF	_move
	XDEF	_asm_number
	LIB	cpc_UpdScr
	LIB	cpc_PutTrSp16x16TileMapPxM1LUT
	XDEF	_l1x
	XDEF	_l1y
	XDEF	_l2x
	XDEF	_l2y
	XDEF	_cerrojos
	LIB	cpc_ScrollLeft0
	XDEF	_pptr
	LIB	cpc_PutSPTileMap2Bx8
	LIB	cpc_AnyKeyPressed
	XDEF	_step
	XDEF	_sp_PrintAtInv
	LIB	cpc_AssignKey
	LIB	cpc_TouchTiles
	LIB	cpc_PutSPTileMap4x8Px
	XDEF	_abs
	LIB	cpc_ScrollRight0
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
	XDEF	_ccx
	XDEF	_ccy
	XDEF	_do_game
	XDEF	_bit
	LIB	cpc_MakeM1RotationLUTs
	LIB	cpc_PutTrSp4x8TileMapPx
	LIB	cpc_PutTrSp8x8TileMapPx
	LIB	cpc_PutTrSp8x16TileMapPx
	LIB	cpc_PutTrSp8x24TileMapPx
	LIB	cpc_UnExo
	XDEF	_run_script
	XDEF	_item_old
	LIB	cpc_SetInkGphStrM1
	XDEF	__xx
	XDEF	__yy
	XDEF	_player
	XDEF	_enx
	XDEF	_eny
	XDEF	_jetpac_frame_counter
	LIB	cpc_PutMaskSpriteTileMap
	LIB	cpc_PutTrSpriteTileMap
	LIB	cpc_UpdateTileMap
	XDEF	_rda
	XDEF	_rdb
	XDEF	_rdd
	LIB	cpc_PutSpTileMap8x8Px
	XDEF	_rdm
	XDEF	_keys_old
	LIB	cpc_TestKeyF
	XDEF	_res
	LIB	cpc_PutTrSp16x16TileMapGPxM1P
	LIB	cpc_PutTrSp16x24TileMapGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_script_result
	XDEF	_pt_alt
	XDEF	_draw_2_digits
	XDEF	_mscce_10
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_mscce_13
	XDEF	_mscce_14
	XDEF	_tileset
	XDEF	_comportamiento_tiles
	XDEF	_script
	XDEF	_wyz_stop_sound
	XDEF	_msc_init_all
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_e_scripts
	XDEF	_pxx
	XDEF	_enoffsmasi
	XDEF	_pyy
	LIB	cpc_PutSpTileMapO
	LIB	cpc_PutSp
	LIB	cpc_UpdScrAddresses
	XDEF	_tspatterns
	XDEF	_tocado
	LIB	cpc_PutTrSp8x8TileMapGPxM1
	XDEF	_asm_int
	LIB	cpc_PutTrSp16x16TileMapGPxM1
	XDEF	_pptr_alt
	LIB	cpc_PutMaskSpTileMap
	LIB	cpc_TouchTileSpXY
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	XDEF	_allpurposepuntero
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_success
	LIB	cpc_RedefineKey
	LIB	cpc_PutTrSp8x16TileMapGPxP
	LIB	cpc_PutTrSp8x24TileMapGPxP
	XDEF	_select_joyfunc
	LIB	cpc_GetTiles
	XDEF	_unpack
	LIB	cpc_PutSpXOR
	LIB	cpc_PrintStr
	XDEF	_distance
	LIB	cpc_PrintGphStr2X
	XDEF	_game_over
	LIB	cpc_PrintGphStrM1


; --- End of Scope Defns ---


; --- End of Compilation ---
