;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Jun 02 16:24:52 2025



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
	defb	9

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
;	SECTION	text

._level
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._spacer
	defw	i_1+0
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
	defw sound4
	defw sound8
	defw sound3
	defw sound7
	defw sound3

._peta_el_beeper
	ld a, l
	call playsfx
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

._unpack
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	ld	a,h
	or	l
	jp	z,i_9
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
.i_9
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
	defb	18

	defm	"3"
	defb	0

	defm	"#3333"
	defb	17

	defm	" "
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

	defm	"a333"
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

	defm	"3331"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	217

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
	defb	0

	defm	""
	defb	217

	defm	""
	defb	145

	defm	""
	defb	19

	defm	"33"
	defb	17

	defm	"!"
	defb	18

	defm	""
	defb	18

	defm	""
	defb	17

	defm	"33"
	defb	19

	defm	"3332#333333"
	defb	17

	defm	"333333"
	defb	193

	defm	""
	defb	28

	defm	"33333"
	defb	17

	defm	"!"
	defb	188

	defm	"333339"
	defb	17

	defm	""
	defb	17

	defm	"33333"
	defb	146

	defm	"333#339"
	defb	19

	defm	"333333"
	defb	145

	defm	"333313:"
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
	defb	208

	defm	""
	defb	20

	defm	"H@"
	defb	8

	defm	""
	defb	0

	defm	""
	defb	8

	defm	"J"
	defb	9

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	157

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	217

	defm	""
	defb	167

	defm	"y"
	defb	154

	defm	""
	defb	153

	defm	""
	defb	157

	defm	""
	defb	144

	defm	""
	defb	9

	defm	""
	defb	162

	defm	""
	defb	18

	defm	""
	defb	170

	defm	":"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	13

	defm	""
	defb	144

	defm	""
	defb	16

	defm	""
	defb	10

	defm	"3:"
	defb	170

	defm	""
	defb	173

	defm	""
	defb	153

	defm	""
	defb	1

	defm	""
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

	defm	"331 "
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

	defm	"3333"
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

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	18

	defm	"!"
	defb	17

	defm	"!"
	defb	17

	defm	"!"
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

	defm	"#333"
	defb	29

	defm	""
	defb	153

	defm	""
	defb	10

	defm	""
	defb	1

	defm	"333"
	defb	17

	defm	""
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

	defm	"3231"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	19

	defm	"333"
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
	defb	17

	defm	"!#3"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"#3333#3"
	defb	161

	defm	"3333333,33333#1"
	defb	19

	defm	"33333"
	defb	18

	defm	"#33333313332333#13333313333333"
	defm	""
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

	defm	""
	defb	163

	defm	"3"
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
	defb	3

	defm	"33333"
	defb	17

	defm	""
	defb	0

	defm	"33333; "
	defb	1

	defm	"#3332"
	defb	17

	defm	""
	defb	0

	defm	"333333 "
	defb	3

	defm	"333331"
	defb	0

	defm	"333333 "
	defb	3

	defm	"333331"
	defb	0

	defm	"ww"
	defb	183

	defm	"www"
	defb	16

	defm	""
	defb	2

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	"!"
	defb	18

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	2

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

	defm	"#33333"
	defb	16

	defm	""
	defb	1

	defm	"333331"
	defb	0

	defm	"#33333"
	defb	16

	defm	""
	defb	1

	defm	"3"
	defb	23

	defm	"wwwq"
	defb	0

	defm	"#2"
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
	defb	18

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	16

	defm	""
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

	defm	"!"
	defb	18

	defm	"31"
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
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"!"
	defb	17

	defm	"!"
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

	defm	"!"
	defb	18

	defm	""
	defb	17

	defm	"!"
	defb	18

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

	defm	"!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	0

	defm	"#33333 "
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

	defm	"332"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	0

	defm	"!#3333"
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
	defb	0

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

	defm	"!33331"
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
	defb 7, 192
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 6, 240
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
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 6, 240
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
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 7, 240
	defb 6, 240
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
	defb 0, 255
	defb 0, 255
	defb 0, 240
	defb 7, 0
	defb 111, 0
	defb 78, 0
	defb 125, 0
	defb 49, 0
	defb 1, 128
	defb 6, 224
	defb 8, 224
	defb 6, 224
	defb 1, 240
	defb 7, 240
	defb 7, 240
	defb 6, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_4_b
	defb 0, 255
	defb 0, 255
	defb 0, 63
	defb 192, 15
	defb 224, 7
	defb 0, 7
	defb 80, 7
	defb 80, 7
	defb 224, 7
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
	defb 224, 3
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 96, 15
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
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 96, 15
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
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 224, 15
	defb 96, 15
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
	defb 0, 252
	defb 3, 240
	defb 7, 224
	defb 0, 224
	defb 10, 224
	defb 10, 224
	defb 7, 224
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
	._sprite_8_b
	defb 0, 255
	defb 0, 255
	defb 0, 15
	defb 224, 0
	defb 246, 0
	defb 114, 0
	defb 190, 0
	defb 140, 0
	defb 128, 1
	defb 96, 7
	defb 16, 7
	defb 96, 7
	defb 128, 15
	defb 224, 15
	defb 224, 15
	defb 96, 15
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
	defb	144
	defb	112
	defb	144
	defb	112
	defb	208
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
	defb	80
	defb	160
	defb	16
	defb	160
	defb	80
	defb	0
	defb	-1
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
	defb	128
	defb	48
	defb	128
	defb	48
	defb	128
	defb	112
	defb	0
	defb	1
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
	defb	32
	defb	64
	defb	32
	defb	32
	defb	192
	defb	64
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
	defb	64
	defb	64
	defb	32
	defb	64
	defb	64
	defb	0
	defb	-1
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
	defb	80
	defb	64
	defb	80
	defb	96
	defb	96
	defb	-1
	defb	1
	defb	3
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
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
	defb	48
	defb	32
	defb	48
	defb	176
	defb	48
	defb	1
	defb	0
	defb	4
	defb	96
	defb	0
	defb	96
	defb	0
	defb	96
	defb	48
	defb	0
	defb	1
	defb	4
	defb	176
	defb	48
	defb	112
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	32
	defb	32
	defb	32
	defb	64
	defb	96
	defb	2
	defb	2
	defb	2
	defb	192
	defb	16
	defb	32
	defb	16
	defb	192
	defb	48
	defb	-1
	defb	1
	defb	1
	defb	176
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	-1
	defb	0
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
	defb	96
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
	defb	32
	defb	112
	defb	32
	defb	192
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
	defb	216
	defb	1
	defb	0
	defb	145
	defb	1
	defb	0
	defb	24
	defb	2
	defb	0
	defb	113
	defb	1
	defb	0
	defb	115
	defb	2
	defb	0
	defb	104
	defb	1
	defb	0
	defb	210
	defb	1
	defb	0
	defb	136
	defb	2
	defb	0
	defb	97
	defb	2
	defb	0
	defb	165
	defb	1
	defb	0
	defb	115
	defb	1
	defb	0
	defb	130
	defb	1
	defb	0
	defb	17
	defb	1
	defb	0
	defb	162
	defb	1
	defb	0
	defb	194
	defb	1
	defb	0
	defb	102
	defb	1
	defb	0
	defb	115
	defb	1
	defb	0
	defb	40
	defb	1
	defb	0
	defb	134
	defb	1
	defb	0
	defb	180
	defb	1
	defb	0
	defb	195
	defb	1
	defb	0
	defb	101
	defb	1
	defb	0
	defb	113
	defb	1
	defb	0
	defb	211
	defb	1
	defb	0
	defb	20
	defb	1
	defb	0
	defb	115
	defb	1
	defb	0
	defb	100
	defb	3
	defb	0
	defb	114
	defb	1
	defb	0
	defb	151
	defb	1
	defb	0
	defb	97
	defb	1
	defb	0

;	SECTION	code


._blackout
	ld hl, 22528
	ld (hl), 0
	push hl
	pop de
	inc de
	ld bc, 767
	ldir
	ret



._system_init
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
	ld	hl,_tileset
	ld	(_allpurposepuntero),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_16
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
.i_14
	ld	hl,(_gpit)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_16
.i_15
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
	jp	i_19
.i_17
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_19
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_18
	jp	nc,i_18
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
	jp	i_17
.i_18
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
	inc	hl
	ld	(_pptr),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_pt
	ld	a,(hl)
	inc	(hl)
	ld	l,a
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
	ld	(_pptr),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_pt
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
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
	ld	(_pptr),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,_pt
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
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



._print_str
.i_20
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,(hl)
	and	a
	jp	z,i_21
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
	jp	i_20
.i_21
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



._pad_read
	ld	hl,(_pad1)
	ld	h,0
	ld	a,l
	ld	(_pad_this_frame),a
	ld	hl,(_joyfunc)
	push	hl
	ld	hl,_keys
	pop	de
	ld	bc,i_22
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_22
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
	jp	i_25
.i_23
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_25
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_24
	jp	nc,i_24
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
	jp	i_23
.i_24
	ret



._update_this_enemy
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
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(__en_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	a,(__en_x)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_and
	push	hl
	ld	a,(__en_y)
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
	ret



._render_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_28
.i_26
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_28
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_27
	jp	nc,i_27
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
	ld	(__en_x),a
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
	ld	(__en_y),a
	call	_update_this_enemy
	jp	i_26
.i_27
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	c,i_30
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_29
.i_30
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
	jp	i_32
.i_29
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
.i_32
	ld	de,_player+15
	ld	hl,(_player+17)
	call	l_pint
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
.i_35
	ld	hl,250 % 256	;const
	ld	a,l
	ld	(_gpjt),a
.i_38
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_36
	ld	hl,(_gpjt)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpjt),a
	ld	a,h
	or	l
	jp	nz,i_38
.i_37
	call	sp_GetKey
	ld	a,h
	or	l
	jp	nz,i_34
.i_39
.i_33
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_35
.i_34
	ret



._select_joyfunc
	; Music generated by beepola
	call musicstart
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_40
	ld	hl,(_gpit)
	ld	h,0
	call	l_lneg
	jp	nc,i_41
	call	sp_GetKey
	ld	h,0
	ld	a,l
	ld	(_gpjt),a
	ld	hl,(_gpjt)
	ld	h,0
.i_44
	ld	a,l
	cp	#(49% 256)
	jp	z,i_45
	cp	#(50% 256)
	jp	z,i_46
	cp	#(51% 256)
	jp	z,i_47
	jp	i_43
.i_45
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_43
.i_46
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_43
.i_47
	ld	a,#(1 % 256 % 256)
	ld	(_gpit),a
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
.i_43
	jp	i_40
.i_41
	di
	ret



._unpack_screen
	ld	hl,2	;const
	call	l_gintspsp	;
	ld	hl,16384	;const
	push	hl
	call	_unpack
	pop	bc
	pop	bc
	ret


;	SECTION	text

._player_frames
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

	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"

._title
	call	sp_UpdateNow
	call	_blackout
	ld	hl,_s_title
	push	hl
	call	_unpack_screen
	pop	bc
	call	_select_joyfunc
	ret



._game_ending
	call	sp_UpdateNow
	call	_blackout
	ld	hl,_s_ending
	push	hl
	call	_unpack_screen
	pop	bc
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_52
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	ld	hl,2 % 256	;const
	call	_peta_el_beeper
.i_50
	ld	hl,(_gpit)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpit),a
	ld	a,h
	or	l
	jp	nz,i_52
.i_51
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._recuadre
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
	ld	hl,8	;const
	add	hl,sp
	call	l_gint	;
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
	ret



._game_over
	ld	hl,i_1+13
	push	hl
	call	_recuadre
	pop	bc
	call	sp_UpdateNow
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_55
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	ld	hl,2 % 256	;const
	call	_peta_el_beeper
.i_53
	ld	hl,(_gpit)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpit),a
	ld	a,h
	or	l
	jp	nz,i_55
.i_54
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._bufidx
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,4-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	ret



._attr
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_57
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_57
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,14	;const
	pop	de
	call	l_gt
	jp	c,i_57
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,9	;const
	pop	de
	call	l_gt
	jp	nc,i_56
.i_57
	ld	hl,0	;const
	ret


.i_56
	ld	hl,_map_attr
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gchar
	ld	h,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	l_gchar
	ld	h,0
	push	hl
	call	_bufidx
	pop	bc
	pop	bc
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
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_bufidx
	pop	bc
	pop	bc
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ret



._cm_two_points
	ld	a,(_cx1)
	ld	e,a
	ld	d,0
	ld	hl,14	;const
	call	l_ugt
	jp	c,i_60
	ld	a,(_cy1)
	ld	e,a
	ld	d,0
	ld	hl,9	;const
	call	l_ugt
	jp	nc,i_59
.i_60
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_at1),a
	jp	i_62
.i_59
	ld	hl,_map_attr
	push	hl
	ld	hl,(_cx1)
	ld	h,0
	push	hl
	ld	hl,(_cy1)
	ld	h,0
	push	hl
	call	_bufidx
	pop	bc
	pop	bc
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_at1),a
.i_62
	ld	a,(_cx2)
	ld	e,a
	ld	d,0
	ld	hl,14	;const
	call	l_ugt
	jp	c,i_64
	ld	a,(_cy2)
	ld	e,a
	ld	d,0
	ld	hl,9	;const
	call	l_ugt
	jp	nc,i_63
.i_64
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_at2),a
	jp	i_66
.i_63
	ld	hl,_map_attr
	push	hl
	ld	hl,(_cx2)
	ld	h,0
	push	hl
	ld	hl,(_cy2)
	ld	h,0
	push	hl
	call	_bufidx
	pop	bc
	pop	bc
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_at2),a
.i_66
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
	jp	nc,i_67
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
	jp	nc,i_67
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
	jp	nc,i_67
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
	jp	nc,i_67
	ld	hl,1	;const
	jr	i_68
.i_67
	ld	hl,0	;const
.i_68
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
	jp	p,i_69
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_69
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_70
	ret



._addsign
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	xor	a
	or	h
	jp	m,i_71
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_71
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_72
	ret



._set_map_tile
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,0
	add	hl,de
	ld	h,0
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	e,(hl)
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,2
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
	call	_bufidx
	pop	bc
	pop	bc
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	de,_map_attr
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	de,_map_buff
	ld	hl,(_gpit)
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
	ret



._init_cerrojos
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_75
.i_73
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_75
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_74
	jp	nc,i_74
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
	jp	i_73
.i_74
	ret



._init_hotspots
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_78
.i_76
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_78
	ld	a,(_gpit)
	cp	#(30 % 256)
	jp	z,i_77
	jp	nc,i_77
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
	jp	i_76
.i_77
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
	jp	z,i_79
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	a,(_hotspot_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_orig_tile)
	ld	h,0
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
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
	jp	nz,i_80
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(15 % 256)
	ld	(hl),a
	ld	a,(_player+26)
	cp	#(99 % 256)
	jp	z,i_81
	jp	c,i_81
	ld	hl,_player+26
	ld	(hl),#(99 % 256 % 256)
.i_81
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
	ld	hl,9 % 256	;const
	call	_peta_el_beeper
	jp	i_82
.i_80
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
.i_85
	ld	a,l
	cp	#(1% 256)
	jp	z,i_86
	cp	#(2% 256)
	jp	z,i_87
	jp	i_84
.i_86
	ld	hl,_player+27
	inc	(hl)
	ld	hl,7 % 256	;const
	call	_peta_el_beeper
	jp	i_84
.i_87
	ld	hl,_player+28
	inc	(hl)
	ld	hl,8 % 256	;const
	call	_peta_el_beeper
.i_84
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
.i_82
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
.i_79
	ret



._check_and_clear_cerrojo
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,15	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_89
	ld	a,(_player+28)
	and	a
	jr	nz,i_90_i_89
.i_89
	jp	i_88
.i_90_i_89
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
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
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_93
.i_91
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_93
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_92
	jp	nc,i_92
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
	jp	nz,i_95
	ld	hl,_cerrojos
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	inc	hl
	ld	a,(_rdx)
	cp	(hl)
	jp	nz,i_95
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
	ld	a,(_rdy)
	cp	(hl)
	jr	z,i_96_i_95
.i_95
	jp	i_94
.i_96_i_95
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
	ld	hl,14 % 256	;const
	call	_peta_el_beeper
.i_94
	jp	i_91
.i_92
.i_88
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
	ld	(_seed),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdy),a
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_99
.i_97
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_99
	ld	a,(_gpit)
	cp	#(150 % 256)
	jp	z,i_98
	jp	nc,i_98
	ld	hl,_gpit
	ld	a,(hl)
	rrca
	jp	nc,i_100
	ld	a,(_rdc)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_101
.i_100
	ld	hl,(_map_pointer)
	inc	hl
	ld	(_map_pointer),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdc),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_101
	ld	de,_comportamiento_tiles
	ld	hl,(_rdd)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	a,(_rdd)
	ld	e,a
	ld	d,0
	ld	hl,0	;const
	call	l_eq
	jp	nc,i_103
	call	_rand
	ld	de,15	;const
	ex	de,hl
	call	l_and
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_103
	inc	hl
	jr	i_104
.i_103
	ld	hl,0	;const
.i_104
	ld	a,h
	or	l
	jp	z,i_102
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_102
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,(_rdd)
	ld	h,0
	push	hl
	ld	hl,(_rda)
	ld	h,0
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
	ld	a,(_rdx)
	cp	#(15 % 256)
	jp	nz,i_105
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
.i_105
	jp	i_97
.i_98
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdt),a
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
	jp	z,i_106
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdt),a
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_and
	ld	de,2	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_107
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdt),a
.i_107
.i_106
	ld	a,(_rdt)
	and	a
	jp	z,i_108
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
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
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
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_bufidx
	pop	bc
	pop	bc
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_orig_tile),a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	a,(_rdt)
	cp	#(3 % 256)
	jp	nz,i_109
	ld	hl,0	;const
	jp	i_110
.i_109
	ld	hl,(_rdt)
	ld	h,0
.i_110
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
.i_108
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_113
.i_111
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_113
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_112
	jp	nc,i_112
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
	jp	nz,i_115
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
	ld	a,(hl)
	cp	#(0 % 256)
	jr	z,i_116_i_115
.i_115
	jp	i_114
.i_116_i_115
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
.i_114
	jp	i_111
.i_112
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
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_119
.i_117
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_119
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_118
	jp	nc,i_118
	ld	de,_en_an_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(3 % 256 % 256)
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
.i_122
	ld	a,l
	cp	#(1% 256)
	jp	z,i_123
	cp	#(2% 256)
	jp	z,i_124
	cp	#(3% 256)
	jp	z,i_125
	cp	#(4% 256)
	jp	z,i_126
	jp	i_127
.i_123
.i_124
.i_125
.i_126
	ld	de,_en_an_base_frame
	ld	hl,(_gpit)
	ld	h,0
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
	jp	i_121
.i_127
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
.i_121
	ld	hl,(_enoffsmasi)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	jp	i_117
.i_118
	ret



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
	ld	(hl),#(0 % 256 % 256)
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



._kill_player
	ld	hl,(_player+26)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_128
	ret


.i_128
	ld	hl,_player+26
	dec	(hl)
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	_peta_el_beeper
	ret



._check_lock_or_box_horz
	ld	hl,(_cx1)
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
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_eq
	call	c,_check_and_clear_cerrojo
.i_129
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
	ld	hl,(_cy1)
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
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_eq
	call	c,_check_and_clear_cerrojo
.i_130
	ret



._move
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
	jp	nc,i_131
	ld	hl,512	;const
	ld	(_player+8),hl
.i_131
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_133
	ld	a,(_possee)
	and	a
	jp	nz,i_134
	ld	a,(_player+25)
	and	a
	jp	nz,i_134
	ld	a,(_hit_v)
	and	a
	jp	z,i_133
.i_134
	jr	i_136_i_133
.i_133
	jp	i_132
.i_136_i_133
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	a,(_hit)
	and	a
	jp	nz,i_137
	ld	hl,3 % 256	;const
	call	_peta_el_beeper
.i_137
.i_132
	ld	a,(_player+19)
	and	a
	jp	z,i_138
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
	jp	nc,i_139
	ld	hl,65216	;const
	ld	(_player+8),hl
.i_139
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_140
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_140
.i_138
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_141
	ld	hl,(_player+8)
	ld	de,65408	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_142
	ld	hl,65408	;const
	ld	(_player+8),hl
.i_142
	ld	hl,_player+13
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_143
.i_141
	ld	hl,_player+13
	ld	(hl),#(0 % 256 % 256)
.i_143
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
	jp	p,i_144
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_144
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_145
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_145
	ld	hl,(_player+1+1)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	a,#(0 % 256 % 256)
	ld	(_possee),a
	ld	a,#(0 % 256 % 256)
	ld	(_hit_v),a
	ld	de,(_player+8)
	ld	hl,(_ptgmy)
	add	hl,de
	ld	(_rds),hl
	ld	a,h
	or	l
	jp	z,i_146
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cx1),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cx2),a
	ld	hl,(_rds)
	xor	a
	or	h
	jp	p,i_147
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cy2),a
	ld	h,0
	ld	a,l
	ld	(_cy1),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_149
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_148
.i_149
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
	ld	bc,8
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
.i_148
	jp	i_151
.i_147
	ld	hl,(_rds)
	xor	a
	or	h
	jp	m,i_152
	or	l
	jp	z,i_152
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cy2),a
	ld	h,0
	ld	a,l
	ld	(_cy1),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_154
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_154
	ld	hl,(_gpy)
	ld	h,0
	dec	hl
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_155
	ld	hl,_at1
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_156
	ld	hl,_at2
	ld	a,(hl)
	and	#(4 % 256)
	jp	z,i_155
.i_156
	ld	hl,1	;const
	jr	i_158
.i_155
	ld	hl,0	;const
.i_158
	ld	a,h
	or	l
	jp	nz,i_154
	jr	i_159
.i_154
	ld	hl,1	;const
.i_159
	ld	a,h
	or	l
	jp	z,i_153
	ld	hl,_player+8
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
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
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_possee),a
.i_153
.i_152
.i_151
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_161
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_160
.i_161
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_v),a
.i_160
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cy2),a
	ld	h,0
	ld	a,l
	ld	(_cy1),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_163
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_163
	ld	hl,0	;const
	jr	i_164
.i_163
	ld	hl,1	;const
.i_164
	ld	h,0
	ld	a,l
	ld	(_possee),a
.i_146
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	z,i_166
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jr	nz,i_167_i_166
.i_166
	jp	i_165
.i_167_i_166
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_168
	or	l
	jp	z,i_168
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
	jp	p,i_169
	ld	hl,0	;const
	ld	(_player+6),hl
.i_169
	jp	i_170
.i_168
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_171
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
	jp	m,i_172
	or	l
	jp	z,i_172
	ld	hl,0	;const
	ld	(_player+6),hl
.i_172
.i_171
.i_170
	jp	i_173
.i_165
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_174
	ld	hl,_player+22
	ld	(hl),#(4 % 256 % 256)
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
	jp	nc,i_175
	ld	hl,65280	;const
	ld	(_player+6),hl
.i_175
.i_174
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_176
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
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
	jp	nc,i_177
	ld	hl,256	;const
	ld	(_player+6),hl
.i_177
.i_176
.i_173
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
	jp	p,i_178
	ld	hl,0	;const
	ld	(_player),hl
.i_178
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_179
	ld	hl,14336	;const
	ld	(_player),hl
.i_179
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	a,#(0 % 256 % 256)
	ld	(_hit_h),a
	ld	de,(_player+6)
	ld	hl,(_ptgmx)
	add	hl,de
	ld	(_rds),hl
	ld	a,h
	or	l
	jp	z,i_180
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,8
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cy1),a
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cy2),a
	ld	hl,(_rds)
	xor	a
	or	h
	jp	p,i_181
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cx2),a
	ld	h,0
	ld	a,l
	ld	(_cx1),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_183
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_182
.i_183
	call	_check_lock_or_box_horz
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
	ld	bc,12
	add	hl,bc
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
.i_182
	jp	i_185
.i_181
	ld	hl,(_rds)
	xor	a
	or	h
	jp	m,i_186
	or	l
	jp	z,i_186
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,12
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_cx2),a
	ld	h,0
	ld	a,l
	ld	(_cx1),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_188
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_187
.i_188
	call	_check_lock_or_box_horz
	ld	hl,_player+6
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	hl,240	;const
	call	l_and
	ld	bc,4
	add	hl,bc
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
.i_187
.i_186
.i_185
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_191
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_190
.i_191
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_h),a
.i_190
.i_180
	ld	a,#(0 % 256 % 256)
	ld	(_hit),a
	ld	a,(_hit_v)
	and	a
	jp	z,i_193
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_195
	ld	a,(_player+14)
	cp	#(1 % 256)
	jp	z,i_195
	jp	c,i_195
	jr	i_196_i_195
.i_195
	jp	i_194
.i_196_i_195
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
.i_194
	jp	i_197
.i_193
	ld	a,(_hit_h)
	and	a
	jp	z,i_198
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
.i_198
.i_197
	ld	a,(_hit)
	and	a
	jp	z,i_199
	ld	hl,10 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_199
	ld	a,(_player+13)
	and	a
	jp	z,i_200
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	jp	i_201
.i_200
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	nz,i_202
	ld	hl,(_player+22)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	jp	i_203
.i_202
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_204
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	jp	i_205
.i_204
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_gpit),a
.i_205
.i_203
.i_201
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
	ret



._mons_col_sc_x
	ld	hl,(_gpen_xx)
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
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_gpaux),a
	ld	hl,(_gpaux)
	ld	h,0
	push	hl
	ld	hl,(_gpen_yy)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_206
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
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_207
	ld	hl,(_gpaux)
	ld	h,0
	push	hl
	ld	hl,(_gpen_yy)
	ld	h,0
	inc	hl
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_207
	ld	hl,1	;const
	jr	i_208
.i_207
	ld	hl,0	;const
.i_208
	ld	a,h
	or	l
	jp	nz,i_206
	jr	i_209
.i_206
	ld	hl,1	;const
.i_209
	ld	h,0
	ret



._mons_col_sc_y
	ld	hl,(_gpen_yy)
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
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	ld	hl,0	;const
	rl	l
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_gpaux),a
	ld	hl,(_gpen_xx)
	ld	h,0
	push	hl
	ld	hl,(_gpaux)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_210
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
	ld	a,(hl)
	and	#(15 % 256)
	jp	z,i_211
	ld	hl,(_gpen_xx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpaux)
	ld	h,0
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_211
	ld	hl,1	;const
	jr	i_212
.i_211
	ld	hl,0	;const
.i_212
	ld	a,h
	or	l
	jp	nz,i_210
	jr	i_213
.i_210
	ld	hl,1	;const
.i_213
	ld	h,0
	ret



._platform_get_player
	ld	hl,_player+25
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(__en_y)
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
	ld	hl,__en_mx
	call	l_gchar
	ld	de,64
	call	l_mult
	ld	(_ptgmy),hl
	ret



._mueve_bicharracos
	ld	a,#(0 % 256 % 256)
	ld	(_tocado),a
	ld	hl,_player+25
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_216
.i_214
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_216
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_215
	jp	nc,i_215
	ld	hl,0	;const
	ld	(_ptgmy),hl
	ld	(_ptgmx),hl
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
	ld	(_allpurposepuntero),hl
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_x),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_y),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_x1),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_y1),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_x2),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_y2),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	call	l_gchar
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	call	l_gchar
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	de,_en_an_state
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_217
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	dec	(hl)
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	and	a
	jp	nz,i_218
	ld	de,_en_an_state
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
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
	jp	i_214
.i_218
.i_217
	ld	hl,(__en_t)
	ld	h,0
.i_221
	ld	a,l
	cp	#(1% 256)
	jp	z,i_222
	cp	#(2% 256)
	jp	z,i_223
	cp	#(3% 256)
	jp	z,i_224
	cp	#(4% 256)
	jp	z,i_225
	jp	i_220
.i_222
.i_223
.i_224
.i_225
	ld	a,#(1 % 256 % 256)
	ld	(_active),a
	ld	hl,(__en_x)
	ld	h,0
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(__en_x),a
	ld	hl,(__en_y)
	ld	h,0
	push	hl
	ld	hl,__en_my
	call	l_gchar
	pop	de
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(__en_y),a
	ld	a,(__en_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpen_xx),a
	ld	a,(__en_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_gpen_yy),a
	ld	hl,(__en_x)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x1)
	ld	h,0
	call	l_eq
	jp	c,i_227
	ld	hl,(__en_x)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x2)
	ld	h,0
	call	l_eq
	jp	c,i_227
	call	_mons_col_sc_x
	ld	a,h
	or	l
	jp	nz,i_227
	jr	i_228
.i_227
	ld	hl,1	;const
.i_228
	ld	a,h
	or	l
	jp	z,i_226
	ld	hl,__en_mx
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
.i_226
	ld	hl,(__en_y)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y1)
	ld	h,0
	call	l_eq
	jp	c,i_230
	ld	hl,(__en_y)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y2)
	ld	h,0
	call	l_eq
	jp	c,i_230
	call	_mons_col_sc_y
	ld	a,h
	or	l
	jp	nz,i_230
	jr	i_231
.i_230
	ld	hl,1	;const
.i_231
	ld	a,h
	or	l
	jp	z,i_229
	ld	hl,__en_my
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
.i_229
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_gpen_cx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_gpen_cy),a
.i_220
	ld	a,(_active)
	and	a
	jp	z,i_232
	ld	hl,_maincounter
	ld	a,(hl)
	and	#(3 % 256)
	jp	nz,i_233
	ld	de,_en_an_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	a,(hl)
	xor	#(1 % 256)
	pop	de
	ld	(de),a
.i_233
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,(_gpit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,_enem_frames
	push	hl
	ld	de,_en_an_base_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_gpit)
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
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_234
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_x)
	ld	h,0
	call	l_uge
	jp	nc,i_236
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_237_i_236
.i_236
	jp	i_235
.i_237_i_236
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_238
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_uge
	jp	nc,i_240
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,9
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ule
	jp	nc,i_240
	ld	hl,(_player+8)
	ld	de,65488	;const
	ex	de,hl
	call	l_ge
	jr	c,i_241_i_240
.i_240
	jp	i_239
.i_241_i_240
	call	_platform_get_player
.i_239
	jp	i_242
.i_238
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_243
	or	l
	jp	z,i_243
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_uge
	jp	nc,i_245
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ule
	jp	nc,i_245
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_246_i_245
.i_245
	jp	i_244
.i_246_i_245
	call	_platform_get_player
.i_244
.i_243
.i_242
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_248
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_248
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_248
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_249_i_248
.i_248
	jp	i_247
.i_249_i_248
	call	_platform_get_player
	ld	hl,(__en_x)
	ld	h,0
	ld	de,64
	call	l_mult
	ld	(_ptgmx),hl
.i_247
.i_235
	jp	i_250
.i_234
	ld	hl,(_tocado)
	ld	h,0
	call	l_lneg
	jp	nc,i_252
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
	jp	z,i_252
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_253_i_252
.i_252
	jp	i_251
.i_253_i_252
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	dec	hl
	dec	hl
	pop	de
	call	l_ult
	jp	nc,i_255
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_256_i_255
.i_255
	jp	i_254
.i_256_i_255
	ld	hl,3 % 256	;const
	call	_peta_el_beeper
	ld	a,(__en_y)
	cp	#(16 % 256)
	jr	z,i_257_uge
	jp	c,i_257
.i_257_uge
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	jp	i_258
.i_257
	ld	hl,0	;const
.i_258
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
	ld	hl,65280	;const
	ld	(_player+8),hl
	jp	i_259
.i_254
	ld	a,#(1 % 256 % 256)
	ld	(_tocado),a
	ld	hl,(_lasttimehit)
	ld	h,0
	call	l_lneg
	jp	c,i_261
	ld	a,(_maincounter)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_260
.i_261
	ld	hl,4 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_260
	ld	hl,_player+6
	push	hl
	ld	hl,__en_mx
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
	ld	hl,__en_my
	call	l_gchar
	push	hl
	ld	hl,256	;const
	push	hl
	call	_addsign
	pop	bc
	pop	bc
	pop	de
	call	l_pint
.i_259
.i_251
.i_250
.i_232
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
	ld	(_allpurposepuntero),hl
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_x
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_y
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_x1
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_y1
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_x2
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_y2
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_my
	call	l_gchar
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,(_allpurposepuntero)
	inc	hl
	ld	(_allpurposepuntero),hl
	dec	hl
	push	hl
	ld	hl,__en_t
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	l,a
	ld	h,0
	jp	i_214
.i_215
	ld	hl,(_tocado)
	ld	h,0
	ld	a,l
	ld	(_lasttimehit),a
	ret



._main
	ld sp, 61952
	call	_cortina
	call	_system_init
.i_263
	call	_title
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_mlplaying),a
.i_265
	ld	a,(_mlplaying)
	and	a
	jp	z,i_266
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_mlplaying),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	ld	a,#(1 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(255 % 256 % 256)
	ld	(_o_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_half_life),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	a,#(0 % 256 % 256)
	ld	(_success),a
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
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_267
	ld	a,(_playing)
	and	a
	jp	z,i_268
	ld	hl,(_o_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_269
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_o_pant),a
.i_269
	ld	hl,(_player+27)
	ld	h,0
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_270
	call	_draw_objs
	ld	hl,(_player+27)
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_270
	ld	hl,(_player+26)
	ld	h,0
	ex	de,hl
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_271
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
.i_271
	ld	hl,(_player+28)
	ld	h,0
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_272
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
.i_272
	ld	hl,_maincounter
	ld	a,(hl)
	inc	(hl)
	ld	a,(_half_life)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_xor
	ld	h,0
	ld	a,l
	ld	(_half_life),a
	call	_move
	call	_mueve_bicharracos
	call	_render_sprites
	call	sp_UpdateNow
	call	_do_hotspots
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_274
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_275_i_274
.i_274
	jp	i_273
.i_275_i_274
	ld	hl,_n_pant
	ld	a,(hl)
	dec	(hl)
	ld	hl,_player
	ld	(hl),#(14336 % 256)
	inc	hl
	ld	(hl),#(14336 / 256)
	ld	hl,224 % 256	;const
	ld	a,l
	ld	(_gpx),a
.i_273
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_277
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_278_i_277
.i_277
	jp	i_276
.i_278_i_277
	ld	hl,_n_pant
	ld	a,(hl)
	inc	(hl)
	ld	hl,_player
	ld	(hl),#(0 % 256)
	inc	hl
	ld	(hl),#(0 / 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpx),a
.i_276
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_280
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_280
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_280_uge
	jp	c,i_280
.i_280_uge
	jr	i_281_i_280
.i_280
	jp	i_279
.i_281_i_280
	ld	hl,(_n_pant)
	ld	h,0
	ld	bc,-6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	hl,_player+1+1
	ld	(hl),#(9216 % 256)
	inc	hl
	ld	(hl),#(9216 / 256)
	ld	hl,144 % 256	;const
	ld	a,l
	ld	(_gpy),a
.i_279
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_283
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_284_i_283
.i_283
	jp	i_282
.i_284_i_283
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
	ld	a,#(0 % 256 % 256)
	ld	(_gpy),a
	ld	hl,(_player+8)
	ld	de,256	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_285
	ld	hl,256	;const
	ld	(_player+8),hl
.i_285
.i_282
	ld	a,(_player+27)
	cp	#(25 % 256)
	jp	nz,i_286
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	z,i_288
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_289
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_290
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jr	c,i_291_i_290
.i_290
	jp	i_289
.i_291_i_290
	ld	hl,1	;const
	jr	i_292
.i_289
	ld	hl,0	;const
.i_292
	ld	a,h
	or	l
	jp	nz,i_288
	jr	i_293
.i_288
	ld	hl,1	;const
.i_293
	ld	a,h
	or	l
	jp	z,i_287
	ld	a,#(1 % 256 % 256)
	ld	(_success),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_287
.i_286
	ld	a,(_player+26)
	and	a
	jp	nz,i_294
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_294
	jp	i_267
.i_268
	call	sp_WaitForNoKey
	call	_saca_a_todo_el_mundo_de_aqui
	call	sp_UpdateNow
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_295
	call	_game_ending
	jp	i_296
.i_295
	call	_game_over
.i_296
	jp	i_265
.i_266
	call	_cortina
	jp	i_263
.i_264
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

.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._sp_moviles	defs	6
._gpen_cx	defs	1
._gpen_cy	defs	1
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._map_pointer	defs	2
.__en_mx	defs	1
.__en_my	defs	1
._half_life	defs	1
._gpen_xx	defs	1
._gpen_yy	defs	1
._hit_h	defs	1
._hit_v	defs	1
._killed_old	defs	1
._gpaux	defs	1
._active	defs	1
._mlplaying	defs	1
._life_old	defs	1
._pt	defs	1
._px	defs	1
._py	defs	1
._pant_final	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._sp_player	defs	2
._enoffs	defs	1
._pad_this_frame	defs	1
._pad0	defs	1
._pad1	defs	1
._lasttimehit	defs	1
._n_pant	defs	1
._o_pant	defs	1
._joyfunc	defs	2
._playing	defs	1
._gpit	defs	1
._gpjt	defs	1
._seed	defs	2
._objs_old	defs	1
._maincounter	defs	1
._pptr	defs	2
._at1	defs	1
._at2	defs	1
.__en_life	defs	1
._cx1	defs	1
._cx2	defs	1
._cy1	defs	1
._cy2	defs	1
._hit	defs	1
._player	defs	34
._rda	defs	1
._rdc	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._keys_old	defs	1
._rds	defs	2
._rdt	defs	1
._rdx	defs	1
._rdy	defs	1
._pt_alt	defs	1
._pxx	defs	1
._enoffsmasi	defs	1
._pyy	defs	1
._tocado	defs	1
._pptr_alt	defs	2
._possee	defs	1
._allpurposepuntero	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	LIB	sp_GetKey
	LIB	sp_BlockAlloc
	XDEF	__en_t
	LIB	sp_ScreenStr
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_hotspots
	XDEF	_mons_col_sc_x
	XDEF	_mons_col_sc_y
	XDEF	_draw_scr
	LIB	sp_PixelUp
	LIB	sp_JoyFuller
	LIB	sp_MouseAMXInit
	LIB	sp_MouseAMX
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sp_moviles
	XDEF	_gpen_cx
	XDEF	_gpen_cy
	XDEF	__en_x1
	LIB	sp_SetMousePosAMX
	XDEF	__en_x2
	XDEF	_u_malloc
	LIB	sp_Validate
	LIB	sp_HashAdd
	XDEF	__en_y1
	XDEF	__en_y2
	XDEF	_cortina
	LIB	sp_Border
	LIB	sp_Inkey
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23660
	XDEF	_draw_objs
	XDEF	_spritesClip
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	_map_pointer
	XDEF	__en_mx
	XDEF	__en_my
	XDEF	_half_life
	XDEF	_gpen_xx
	XDEF	_gpen_yy
	XDEF	_en_an_state
	defc	_en_an_state	=	23648
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
	defc	_map_buff	=	23450
	XDEF	_hit_v
	LIB	sp_HeapExtract
	LIB	sp_HuffExtract
	XDEF	_killed_old
	LIB	sp_SetMousePosSim
	XDEF	_gpaux
	LIB	sp_ClearRect
	LIB	sp_HuffGetState
	XDEF	_map_attr
	defc	_map_attr	=	23300
	XDEF	_active
	LIB	sp_ListAppend
	XDEF	_level
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_pad_read
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
	XDEF	_unpack_screen
	XDEF	_mlplaying
	XDEF	_life_old
	LIB	sp_Invalidate
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	LIB	sp_FreeBlock
	XDEF	_pt
	LIB	sp_PrintAtDiff
	XDEF	_px
	XDEF	_py
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
	defc	_address	=	23663
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
	XDEF	_sprite_18_a
	XDEF	_player_frames
	XDEF	_title
	XDEF	_qtile
	XDEF	_cm_two_points
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_init_cerrojos
	XDEF	_bufidx
	XDEF	_sp_player
	XDEF	_init_player
	LIB	sp_GetTiles
	LIB	sp_Pallette
	LIB	sp_WaitForNoKey
	XDEF	_update_this_enemy
	XDEF	_enoffs
	XDEF	_pad_this_frame
	LIB	sp_JoySinclair1
	LIB	sp_JoySinclair2
	LIB	sp_ListPrepend
	LIB	sp_GetAttrAddr
	LIB	sp_HashCreate
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_lasttimehit
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_system_init
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
	XDEF	_s_title
	XDEF	_attr
	LIB	sp_RemoveDList
	XDEF	_playing
	XDEF	_gpit
	XDEF	_gpjt
	LIB	sp_ListNext
	LIB	sp_HuffDecode
	XDEF	_keys
	XDEF	_rand
	LIB	sp_Swap
	XDEF	_seed
	XDEF	_print_str
	XDEF	_objs_old
	LIB	sp_ListPrev
	XDEF	_maincounter
	XDEF	_move
	LIB	sp_RegisterHook
	LIB	sp_ListRemove
	LIB	sp_ListTrim
	LIB	sp_MoveSprAbsNC
	XDEF	_check_and_clear_cerrojo
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_pptr
	XDEF	_at1
	XDEF	_at2
	LIB	sp_ListAdd
	LIB	sp_KeyPressed
	XDEF	__en_life
	LIB	sp_PrintAtInv
	XDEF	_kill_player
	XDEF	_cx1
	XDEF	_cx2
	XDEF	_cy1
	XDEF	_cy2
	LIB	sp_CompDListAddr
	XDEF	_u_free
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	LIB	sp_InstallISR
	LIB	sp_HuffAccumulate
	LIB	sp_HuffSetState
	XDEF	_hit
	XDEF	_player
	XDEF	_sprite_1_a
	XDEF	_sprite_1_b
	XDEF	_sprite_1_c
	XDEF	_sprite_2_a
	XDEF	_sprite_2_b
	XDEF	_rda
	XDEF	_sprite_2_c
	XDEF	_rdc
	LIB	sp_SwapEndian
	LIB	sp_CharLeft
	XDEF	_gpx
	XDEF	_gpy
	LIB	sp_CharDown
	LIB	sp_HeapSiftDown
	LIB	sp_HuffCreate
	XDEF	_rdd
	XDEF	_sprite_3_a
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	XDEF	_sprite_4_a
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_rds
	XDEF	_rdt
	XDEF	_sprite_4_b
	XDEF	_sprite_4_c
	XDEF	_ram_page
	defc	_ram_page	=	23667
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sprite_5_a
	LIB	sp_Initialize
	XDEF	_sprite_5_b
	XDEF	_sprite_5_c
	XDEF	_sprite_6_a
	XDEF	_sprite_6_b
	XDEF	_tileset
	XDEF	_sprite_6_c
	LIB	sp_JoyTimexLeft
	XDEF	_comportamiento_tiles
	LIB	sp_SetMousePosKempston
	XDEF	_sprite_7_a
	XDEF	_sprite_7_b
	LIB	sp_ComputePos
	XDEF	_sprite_7_c
	XDEF	_sprite_8_a
	XDEF	_sprite_8_b
	XDEF	_sprite_8_c
	XDEF	_sprite_9_a
	XDEF	_sprite_9_b
	XDEF	_sprite_9_c
	XDEF	_pt_alt
	XDEF	_init_hotspots
	XDEF	_check_lock_or_box_horz
	XDEF	_pxx
	XDEF	_enoffsmasi
	XDEF	_pyy
	XDEF	_spacer
	LIB	sp_IntIntervals
	XDEF	_my_malloc
	XDEF	_tocado
	LIB	sp_inp
	LIB	sp_IterateSprChar
	XDEF	_check_lock_or_box_vert
	LIB	sp_AddColSpr
	LIB	sp_outp
	LIB	sp_IntPtInterval
	XDEF	_pptr_alt
	LIB	sp_RegisterHookFirst
	LIB	sp_HashLookup
	LIB	sp_PFill
	XDEF	_possee
	LIB	sp_HashRemove
	XDEF	_allpurposepuntero
	LIB	sp_CharUp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_en_an_frame
	defc	_en_an_frame	=	23600
	XDEF	_success
	LIB	sp_MoveSprRelNC
	XDEF	_destination
	defc	_destination	=	23665
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	23603
	XDEF	_select_joyfunc
	XDEF	_unpack
	XDEF	_render_sprites
	LIB	sp_IterateDList
	XDEF	_draw_scr_background
	XDEF	_recuadre
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	XDEF	_set_player_at
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
