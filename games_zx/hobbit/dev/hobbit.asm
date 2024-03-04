;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Jan 22 13:45:23 2024



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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	.wyz_address_call
	ld b, 1
	call SetRAMBank
	call 0xC018
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
	jr z, skip_wyz
	ld b, 1
	call SetRAMBank
	call 0xC000
	ld b, 0
	call SetRAMBank
	.skip_wyz
	ret



._wyz_play_music
	di
	ld b, 1
	call SetRAMBank
	ld a, l
	call 0xC087
	ld b, 0
	call SetRAMBank
	ei
	ret



._wyz_stop_sound
	di
	ld b, 1
	call SetRAMBank
	call 0xC062
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
	._mapa
	BINARY "mapa.map.bin"
	._cerrojos
	BINARY "mapa.locks.bin"
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
	defb 3, 224
	defb 12, 192
	defb 16, 192
	defb 8, 192
	defb 3, 192
	defb 25, 192
	defb 13, 192
	defb 5, 224
	defb 1, 224
	defb 12, 192
	defb 18, 192
	defb 27, 192
	defb 26, 192
	defb 0, 192
	defb 7, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_1_b
	defb 96, 7
	defb 144, 3
	defb 8, 3
	defb 0, 3
	defb 160, 3
	defb 168, 3
	defb 248, 3
	defb 152, 3
	defb 240, 3
	defb 0, 3
	defb 168, 3
	defb 224, 3
	defb 0, 7
	defb 208, 7
	defb 208, 7
	defb 0, 7
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
	defb 3, 224
	defb 12, 192
	defb 16, 192
	defb 8, 192
	defb 3, 192
	defb 25, 192
	defb 13, 192
	defb 1, 192
	defb 29, 128
	defb 50, 128
	defb 51, 128
	defb 8, 128
	defb 15, 224
	defb 7, 224
	defb 0, 240
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
	defb 96, 7
	defb 144, 3
	defb 8, 3
	defb 0, 3
	defb 160, 3
	defb 168, 3
	defb 248, 3
	defb 152, 1
	defb 244, 1
	defb 12, 1
	defb 224, 1
	defb 12, 1
	defb 92, 1
	defb 56, 1
	defb 0, 131
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
	defb 6, 224
	defb 9, 192
	defb 16, 192
	defb 0, 192
	defb 5, 192
	defb 21, 192
	defb 31, 192
	defb 25, 192
	defb 15, 192
	defb 0, 192
	defb 21, 192
	defb 7, 192
	defb 0, 224
	defb 11, 224
	defb 11, 224
	defb 0, 224
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_3_b
	defb 192, 7
	defb 48, 3
	defb 8, 3
	defb 16, 3
	defb 192, 3
	defb 152, 3
	defb 176, 3
	defb 160, 7
	defb 128, 7
	defb 48, 3
	defb 72, 3
	defb 216, 3
	defb 88, 3
	defb 0, 3
	defb 224, 15
	defb 0, 15
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
	defb 6, 224
	defb 9, 192
	defb 16, 192
	defb 0, 192
	defb 5, 192
	defb 21, 192
	defb 31, 192
	defb 25, 128
	defb 47, 128
	defb 48, 128
	defb 7, 128
	defb 48, 128
	defb 58, 128
	defb 28, 128
	defb 0, 193
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
	defb 192, 7
	defb 48, 3
	defb 8, 3
	defb 16, 3
	defb 192, 3
	defb 152, 3
	defb 176, 3
	defb 128, 3
	defb 184, 1
	defb 76, 1
	defb 204, 1
	defb 16, 1
	defb 240, 7
	defb 224, 7
	defb 0, 15
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
	defb 6, 224
	defb 9, 192
	defb 16, 128
	defb 48, 128
	defb 16, 128
	defb 16, 192
	defb 8, 224
	defb 7, 224
	defb 8, 192
	defb 19, 192
	defb 27, 192
	defb 27, 192
	defb 0, 192
	defb 3, 240
	defb 7, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_5_b
	defb 224, 7
	defb 16, 3
	defb 8, 1
	defb 12, 1
	defb 8, 1
	defb 8, 3
	defb 16, 7
	defb 224, 3
	defb 8, 3
	defb 232, 3
	defb 224, 3
	defb 96, 15
	defb 0, 15
	defb 96, 15
	defb 0, 15
	defb 0, 127
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
	defb 6, 224
	defb 9, 192
	defb 16, 128
	defb 48, 128
	defb 16, 128
	defb 16, 192
	defb 8, 224
	defb 7, 192
	defb 16, 192
	defb 23, 192
	defb 7, 192
	defb 6, 240
	defb 0, 240
	defb 6, 240
	defb 0, 240
	defb 0, 254
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
	defb 16, 3
	defb 8, 1
	defb 12, 1
	defb 8, 1
	defb 8, 3
	defb 16, 7
	defb 224, 7
	defb 16, 3
	defb 200, 3
	defb 216, 3
	defb 216, 3
	defb 0, 3
	defb 192, 15
	defb 224, 15
	defb 0, 15
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
	defb 6, 240
	defb 9, 224
	defb 8, 224
	defb 0, 128
	defb 53, 128
	defb 21, 128
	defb 23, 192
	defb 6, 224
	defb 11, 192
	defb 16, 192
	defb 25, 192
	defb 27, 192
	defb 0, 192
	defb 3, 240
	defb 7, 240
	defb 0, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_7_b
	defb 192, 15
	defb 48, 7
	defb 8, 3
	defb 0, 1
	defb 172, 1
	defb 168, 1
	defb 232, 3
	defb 96, 3
	defb 200, 3
	defb 40, 3
	defb 160, 3
	defb 224, 15
	defb 0, 15
	defb 96, 15
	defb 0, 15
	defb 0, 127
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
	defb 6, 240
	defb 9, 224
	defb 8, 224
	defb 0, 128
	defb 53, 128
	defb 21, 128
	defb 23, 192
	defb 6, 224
	defb 19, 192
	defb 20, 192
	defb 5, 192
	defb 7, 240
	defb 0, 240
	defb 6, 240
	defb 0, 240
	defb 0, 254
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_8_b
	defb 192, 15
	defb 48, 7
	defb 8, 3
	defb 0, 1
	defb 172, 1
	defb 168, 1
	defb 232, 3
	defb 96, 3
	defb 208, 3
	defb 8, 3
	defb 152, 3
	defb 216, 3
	defb 0, 3
	defb 192, 15
	defb 224, 15
	defb 0, 15
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
	defb 0, 255
	defb 0, 241
	defb 14, 224
	defb 31, 192
	defb 27, 192
	defb 31, 192
	defb 14, 224
	defb 1, 224
	defb 31, 192
	defb 63, 128
	defb 62, 128
	defb 31, 192
	defb 31, 192
	defb 15, 224
	defb 3, 240
	defb 0, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_9_b
	defb 0, 255
	defb 0, 255
	defb 0, 207
	defb 48, 7
	defb 120, 3
	defb 88, 3
	defb 120, 3
	defb 184, 3
	defb 196, 1
	defb 254, 0
	defb 30, 0
	defb 254, 0
	defb 252, 1
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
	defb 0, 241
	defb 14, 224
	defb 31, 192
	defb 27, 192
	defb 31, 192
	defb 14, 224
	defb 1, 224
	defb 31, 192
	defb 63, 128
	defb 60, 128
	defb 56, 128
	defb 28, 192
	defb 31, 192
	defb 15, 224
	defb 3, 240
	defb 0, 252
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_10_b
	defb 0, 255
	defb 0, 207
	defb 48, 7
	defb 120, 3
	defb 88, 3
	defb 120, 3
	defb 184, 3
	defb 196, 1
	defb 254, 0
	defb 30, 0
	defb 14, 0
	defb 30, 0
	defb 252, 1
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
	defb 0, 248
	defb 3, 128
	defb 39, 128
	defb 42, 128
	defb 10, 128
	defb 15, 224
	defb 6, 192
	defb 21, 128
	defb 35, 128
	defb 56, 128
	defb 27, 128
	defb 0, 192
	defb 1, 248
	defb 1, 240
	defb 3, 240
	defb 7, 240
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_11_b
	defb 0, 71
	defb 16, 7
	defb 176, 7
	defb 160, 7
	defb 160, 7
	defb 224, 1
	defb 236, 0
	defb 66, 0
	defb 150, 0
	defb 54, 0
	defb 240, 0
	defb 0, 7
	defb 64, 15
	defb 96, 15
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
	defb 0, 226
	defb 8, 224
	defb 13, 224
	defb 5, 224
	defb 5, 224
	defb 7, 128
	defb 55, 0
	defb 66, 0
	defb 105, 0
	defb 108, 0
	defb 15, 0
	defb 0, 224
	defb 2, 240
	defb 6, 240
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
	._sprite_12_b
	defb 0, 31
	defb 192, 1
	defb 228, 1
	defb 84, 1
	defb 80, 1
	defb 240, 7
	defb 96, 3
	defb 168, 1
	defb 196, 1
	defb 28, 1
	defb 216, 1
	defb 0, 3
	defb 128, 31
	defb 128, 15
	defb 192, 15
	defb 224, 15
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
	defb 0, 255
	defb 0, 255
	defb 0, 248
	defb 3, 192
	defb 21, 192
	defb 13, 192
	defb 7, 128
	defb 54, 0
	defb 69, 0
	defb 51, 0
	defb 48, 128
	defb 2, 128
	defb 6, 224
	defb 14, 224
	defb 0, 224
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
	defb 0, 255
	defb 0, 255
	defb 0, 31
	defb 192, 3
	defb 168, 3
	defb 176, 3
	defb 224, 3
	defb 104, 1
	defb 164, 1
	defb 200, 1
	defb 0, 3
	defb 96, 7
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
	defb 0, 255
	defb 0, 255
	defb 0, 248
	defb 3, 192
	defb 21, 192
	defb 13, 192
	defb 7, 192
	defb 22, 128
	defb 37, 128
	defb 19, 128
	defb 0, 192
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
	defb 0, 255
	defb 0, 255
	._sprite_14_b
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 31
	defb 192, 3
	defb 168, 3
	defb 176, 3
	defb 224, 1
	defb 108, 0
	defb 162, 0
	defb 204, 0
	defb 12, 1
	defb 64, 1
	defb 96, 7
	defb 112, 7
	defb 0, 7
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
	defb 1, 248
	defb 3, 248
	defb 2, 128
	defb 59, 0
	defb 122, 0
	defb 123, 0
	defb 92, 0
	defb 87, 0
	defb 111, 0
	defb 111, 0
	defb 15, 0
	defb 3, 128
	defb 56, 128
	defb 48, 3
	defb 112, 7
	defb 0, 7
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_15_b
	defb 128, 31
	defb 192, 3
	defb 140, 0
	defb 222, 0
	defb 26, 0
	defb 186, 0
	defb 122, 0
	defb 230, 0
	defb 246, 0
	defb 240, 0
	defb 112, 7
	defb 192, 7
	defb 0, 3
	defb 24, 195
	defb 24, 195
	defb 28, 192
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
	defb 1, 248
	defb 3, 192
	defb 50, 0
	defb 123, 0
	defb 90, 0
	defb 91, 0
	defb 92, 0
	defb 103, 0
	defb 111, 0
	defb 15, 0
	defb 15, 224
	defb 3, 224
	defb 0, 192
	defb 24, 195
	defb 24, 195
	defb 56, 3
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	defb 0, 255
	._sprite_16_b
	defb 128, 31
	defb 192, 31
	defb 128, 1
	defb 220, 0
	defb 30, 0
	defb 190, 0
	defb 122, 0
	defb 234, 0
	defb 246, 0
	defb 246, 0
	defb 112, 0
	defb 192, 1
	defb 28, 1
	defb 12, 192
	defb 14, 224
	defb 0, 224
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
	defb	112
	defb	16
	defb	113
	defb	129
	defb	1
	defb	0
	defb	14
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	32
	defb	50
	defb	130
	defb	2
	defb	0
	defb	11
	defb	32
	defb	96
	defb	38
	defb	199
	defb	1
	defb	1
	defb	7
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	144
	defb	16
	defb	145
	defb	195
	defb	2
	defb	2
	defb	8
	defb	80
	defb	16
	defb	81
	defb	97
	defb	1
	defb	0
	defb	14
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	144
	defb	16
	defb	145
	defb	150
	defb	0
	defb	1
	defb	12
	defb	16
	defb	128
	defb	24
	defb	17
	defb	0
	defb	-1
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	98
	defb	194
	defb	1
	defb	0
	defb	1
	defb	32
	defb	48
	defb	35
	defb	71
	defb	2
	defb	2
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	128
	defb	96
	defb	134
	defb	198
	defb	1
	defb	0
	defb	2
	defb	208
	defb	112
	defb	215
	defb	135
	defb	-1
	defb	0
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	80
	defb	112
	defb	87
	defb	151
	defb	1
	defb	0
	defb	2
	defb	144
	defb	64
	defb	148
	defb	151
	defb	0
	defb	1
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	16
	defb	16
	defb	17
	defb	209
	defb	1
	defb	0
	defb	2
	defb	176
	defb	64
	defb	20
	defb	180
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
	defb	16
	defb	48
	defb	19
	defb	72
	defb	2
	defb	2
	defb	10
	defb	192
	defb	64
	defb	196
	defb	120
	defb	-2
	defb	2
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	80
	defb	16
	defb	65
	defb	81
	defb	0
	defb	0
	defb	3
	defb	176
	defb	64
	defb	68
	defb	180
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
	defb	32
	defb	80
	defb	37
	defb	197
	defb	1
	defb	0
	defb	2
	defb	160
	defb	32
	defb	162
	defb	19
	defb	-1
	defb	1
	defb	18
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	176
	defb	16
	defb	177
	defb	180
	defb	0
	defb	2
	defb	1
	defb	176
	defb	64
	defb	180
	defb	100
	defb	-1
	defb	0
	defb	14
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	96
	defb	96
	defb	102
	defb	198
	defb	2
	defb	0
	defb	14
	defb	80
	defb	16
	defb	81
	defb	19
	defb	-2
	defb	2
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	160
	defb	96
	defb	166
	defb	214
	defb	1
	defb	0
	defb	2
	defb	80
	defb	32
	defb	82
	defb	119
	defb	1
	defb	1
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	144
	defb	32
	defb	146
	defb	183
	defb	2
	defb	2
	defb	7
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	64
	defb	36
	defb	214
	defb	2
	defb	2
	defb	10
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	85
	defb	181
	defb	-1
	defb	0
	defb	2
	defb	64
	defb	112
	defb	71
	defb	215
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
	defb	192
	defb	80
	defb	117
	defb	197
	defb	-1
	defb	0
	defb	0
	defb	16
	defb	16
	defb	17
	defb	209
	defb	2
	defb	0
	defb	18
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	32
	defb	50
	defb	72
	defb	1
	defb	1
	defb	8
	defb	80
	defb	64
	defb	84
	defb	196
	defb	1
	defb	0
	defb	11
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	32
	defb	64
	defb	36
	defb	40
	defb	0
	defb	1
	defb	11
	defb	160
	defb	16
	defb	161
	defb	168
	defb	0
	defb	2
	defb	11
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	16
	defb	112
	defb	23
	defb	103
	defb	1
	defb	0
	defb	11
	defb	144
	defb	80
	defb	149
	defb	152
	defb	0
	defb	1
	defb	11
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	80
	defb	16
	defb	81
	defb	194
	defb	1
	defb	1
	defb	8
	defb	96
	defb	80
	defb	101
	defb	117
	defb	1
	defb	0
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	16
	defb	49
	defb	72
	defb	1
	defb	1
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	96
	defb	70
	defb	198
	defb	1
	defb	0
	defb	2
	defb	208
	defb	64
	defb	20
	defb	212
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
	defb	48
	defb	96
	defb	54
	defb	198
	defb	1
	defb	0
	defb	11
	defb	80
	defb	16
	defb	81
	defb	84
	defb	0
	defb	1
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	112
	defb	55
	defb	215
	defb	1
	defb	0
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	80
	defb	69
	defb	135
	defb	1
	defb	1
	defb	8
	defb	48
	defb	16
	defb	49
	defb	55
	defb	0
	defb	2
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	112
	defb	128
	defb	120
	defb	117
	defb	0
	defb	-1
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	16
	defb	113
	defb	117
	defb	0
	defb	1
	defb	12
	defb	64
	defb	80
	defb	69
	defb	66
	defb	0
	defb	-1
	defb	11
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	32
	defb	50
	defb	197
	defb	2
	defb	2
	defb	8
	defb	160
	defb	16
	defb	161
	defb	72
	defb	-2
	defb	2
	defb	8
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	112
	defb	48
	defb	115
	defb	120
	defb	0
	defb	1
	defb	12
	defb	176
	defb	16
	defb	177
	defb	183
	defb	0
	defb	1
	defb	11
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	208
	defb	128
	defb	216
	defb	215
	defb	0
	defb	-2
	defb	13
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	16
	defb	129
	defb	145
	defb	2
	defb	0
	defb	13
	defb	48
	defb	128
	defb	56
	defb	55
	defb	0
	defb	-1
	defb	13
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	112
	defb	48
	defb	115
	defb	131
	defb	2
	defb	0
	defb	12
	defb	64
	defb	96
	defb	70
	defb	71
	defb	0
	defb	2
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	48
	defb	16
	defb	49
	defb	50
	defb	0
	defb	2
	defb	12
	defb	144
	defb	96
	defb	150
	defb	166
	defb	2
	defb	0
	defb	12
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	36
	defb	3
	defb	0
	defb	113
	defb	1
	defb	0
	defb	194
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	100
	defb	2
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	86
	defb	1
	defb	0
	defb	165
	defb	1
	defb	0
	defb	86
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
	defb	162
	defb	1
	defb	0
	defb	86
	defb	1
	defb	0
	defb	180
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
	defb	19
	defb	1
	defb	0
	defb	72
	defb	1
	defb	0
	defb	181
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
	defb	83
	defb	3
	defb	0
	defb	131
	defb	1
	defb	0
	defb	166
	defb	1
	defb	0
	defb	147
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
	defb	113
	defb	12
	defb	0
	defb	97
	defb	12
	defb	0
	defb	216
	defb	3
	defb	0
	defb	120
	defb	12
	defb	0
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
	ld b, l
	call 0xC47E
	ld b, 0
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
	ld	bc,i_15
	push	hl
	push	bc
	push	de
	ld	a,1
	ret
.i_15
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
.i_16
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	inc	hl
	ld	a,h
	or	l
	jp	z,i_17
	halt
	call	_any_key
	ld	h,0
	ld	a,l
	ld	(_ptj),a
	and	a
	jp	z,i_19
	ld	a,(_pti)
	cp	#(0 % 256)
	jr	z,i_20_i_19
.i_19
	jp	i_18
.i_20_i_19
	jp	i_17
.i_18
	ld	hl,(_ptj)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_16
.i_17
	ret


;	SECTION	text

._top_string
	defm	"<======================>"
	defb	0

;	SECTION	code



;	SECTION	text

._temp_string
	defm	";                      ["
	defb	0

;	SECTION	code



;	SECTION	text

._bottom_string
	defm	"\]]]]]]]]]]]]]]]]]]]]]]^"
	defb	0

;	SECTION	code



;	SECTION	text

._talk_sounds
	defm	""
	defb	7

	defm	""
	defb	11

;	SECTION	code


;	SECTION	text

._decos0
	defm	""
	defb	174

	defm	""
	defb	34

	defm	""
	defb	255

;	SECTION	code


;	SECTION	text

._decos1
	defm	""
	defb	168

	defm	""
	defb	20

	defm	""
	defb	169

	defm	""
	defb	21

	defm	""
	defb	255

;	SECTION	code


;	SECTION	text

._decos2
	defm	""
	defb	169

	defm	""
	defb	23

	defm	"*"
	defb	3

	defm	""
	defb	21

	defm	"$U+"
	defb	4

	defm	""
	defb	22

	defm	"#%4,"
	defb	3

	defm	""
	defb	23

	defm	")D"
	defb	173

	defm	""
	defb	24

	defm	""
	defb	166

	defm	"6"
	defb	167

	defm	"7"
	defb	164

	defm	"F"
	defb	165

	defm	"G"
	defb	255

;	SECTION	code


;	SECTION	text

._text0
	defm	"_BILBOS%UF, QUE PESTE ECHA...%"
	defm	"LAVARSE NO DEBE SER SU%HOBBIT!"
	defm	""
	defb	0

;	SECTION	code



;	SECTION	text

._text1
	defm	"_BILBOS%ME PREGUNTO QUE HARAN%"
	defm	"TANTOS ENANOS EN HO-%BBITLANDI"
	defm	"A"
	defb	0

;	SECTION	code



;	SECTION	text

._text2
	defm	"_BILBOS%VAYA! OTRO SE/OR BAJI-"
	defm	"%TO Y SUCIO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text3
	defm	"_BILBOS%CUANTO ENANO. DEBE HA-"
	defm	"%BER UN CIRCOS CERCA"
	defb	0

;	SECTION	code



;	SECTION	text

._text4
	defm	"_GANDALF%HOLA, SOY UN SE/OR QU"
	defm	"E%HACE MAGIAS. QUIERES%GANAR U"
	defm	"N TESORO, JOVEN%Y APUESTO ZAGA"
	defm	"LETE?"
	defb	0

;	SECTION	code



;	SECTION	text

._text5
	defm	"_GANDALF%PARA GANAR EL TESORO%"
	defm	"HAY QUE ROBARSELO AL%DRAGON SM"
	defm	"AUG QUE VIVE%EN LA MONTA/A NOS"
	defm	"EQUE"
	defb	0

;	SECTION	code



;	SECTION	text

._text6
	defm	"_BILBOS%ESO YA LO SE PERO LA%M"
	defm	"ONTA/A ESTA CERRADA%CUAL TOTO "
	defm	"DE NANCY"
	defb	0

;	SECTION	code



;	SECTION	text

._text7
	defm	"_GANDALF%LOS ENANITOS DEL BOS-"
	defm	"%QUE SABRAN ABRIRTE LA%MONTA/A"
	defm	". ENCUENTRA LOS%13 Y VUELVE AQ"
	defm	"UIS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text8
	defm	"_GANDALF%LOS ENANOS SAN EMPA-%"
	defm	"RANOIAO Y KIERE PELEA%PERO LA "
	defm	"MONTA/A ESTA%ABIERTA. APROVECH"
	defm	"A!"
	defb	0

;	SECTION	code



;	SECTION	text

._text9
	defm	"_ENANITO%HOLA, SOY           %"
	defm	"KIERE PELEA?"
	defb	0

;	SECTION	code



;	SECTION	text

._text10
	defm	"_CHERIL%VENDO MOTO SEMINUEVA"
	defb	0

;	SECTION	code



;	SECTION	text

._text11
	defm	"BILBOS PIENSA EN LO%QUE DICE G"
	defm	"ANDALF DEL%TESORO. ESTA FASE R"
	defm	"E%PRESENTA EL PENSAMIEN-%TO DE"
	defm	" BILBOS"
	defb	0

;	SECTION	code



;	SECTION	text

._text12
	defm	"LOS ENANITO ABREN LA%COMPLICAD"
	defm	"A PUERTA DE%LA MONTA/A. ESTA F"
	defm	"ASE%REPRESENTA LA ABRI-%SION D"
	defm	"E LA PUERTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text13
	defm	"SONIA LA MOMIA ESTA%MUY CONFUN"
	defm	"DIDA. ESTA%FASE REPRESENTA LA%"
	defm	"CONFUSION DE SONIA"
	defb	0

;	SECTION	code



;	SECTION	text

._text14
	defm	"EL ANILLO TIENE MUCHA%MAGIA Y "
	defm	"BILBOS TENDRA%QUE DOMINARLA. E"
	defm	"STA%FASE ES LA DOMINASION"
	defb	0

;	SECTION	code



;	SECTION	text

._text15
	defm	"PLACEHOLDER"
	defb	0

;	SECTION	code



;	SECTION	text

._text16
	defm	"PLACEHOLDER"
	defb	0

;	SECTION	code



;	SECTION	text

._text17
	defm	"PLACEHOLDER"
	defb	0

;	SECTION	code



;	SECTION	text

._text18
	defm	"_GANDALF%GRACIAS POR LOS ENANO"
	defm	"S%ESTOS, BILBOS. AHORA%JUNTARA"
	defm	"N PICHA PARA%ABRIR LA MONTA/A."
	defm	".."
	defb	0

;	SECTION	code



;	SECTION	text

._text19
	defm	"_ENANITO%IBAMOS A COGER EL TE-"
	defm	"%SORO Y SER GRANDES DE%NUEVO ("
	defm	"EN SENTIDO ME-%TAFORICO) PERO "
	defm	"HAY UN%PROBLEMA..."
	defb	0

;	SECTION	code



;	SECTION	text

._text20
	defm	"_ENANITO%GALLUMB HA LLEGADO DE"
	defm	"L%PLANETA DAGOBAH Y RON-%DA LO"
	defm	"S PASILLOS. DOMI-%NA LA FUERZA"
	defm	"!"
	defb	0

;	SECTION	code



;	SECTION	text

._text21
	defm	"PLACEHOLDER"
	defb	0

;	SECTION	code



;	SECTION	text

._text22
	defm	"_BILBOS%UN ROLLO DE PAPEL DEL%"
	defm	"CULO DOBLE CAPA, QUE%TE DEJA S"
	defm	"UAVITO Y TE%QUITA LA ZURRAPA."
	defb	0

;	SECTION	code



;	SECTION	text

._text23
	defm	"_BILBOS%UN MOMENTO, PERO TU NO"
	defm	"%ERAS DE OTRO JUEGO?"
	defb	0

;	SECTION	code



;	SECTION	text

._text24
	defm	"_SONIA%NO SE, IGUAL SI. COMO%L"
	defm	"OS MOJON TWINS REUTI-%LIZAN TA"
	defm	"NTO CODIGO SE%LES HABRA PASADO"
	defm	" QUI-%TARME..."
	defb	0

;	SECTION	code



;	SECTION	text

._text25
	defm	"_ANILLO%SOY EL ANILLO MAGICO.%"
	defm	"METEME EL DEDO Y YO TE%HARE IN"
	defm	"VISIBLE POR UN%RATO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text26
	defm	"_ANILLO%ME HAS DOMINADO. PULSA"
	defm	"%FIRE PARA PONERTEME!"
	defb	0

;	SECTION	code



;	SECTION	text

._text27
	defm	"_GALLUMB%FURIOSO ESTOY! PERDID"
	defm	"O%MI TESORO HE! Y LA IRA%AL LA"
	defm	"DO OSCURO CONDUCE"
	defb	0

;	SECTION	code



;	SECTION	text

._text28
	defm	"_GALLUMB%EL ANILLO CON EL QUE%"
	defm	"CASARME CON EL ENANO%ROMAYS IB"
	defm	"A... PERDIDO%EN LA CAVERNA EST"
	defm	"A!"
	defb	0

;	SECTION	code



;	SECTION	text

._text29
	defm	"_GALLUMB%AH! ME ENGA/ASTE Y ME"
	defm	"%ROBASTE MI TESORO! LA%PROXIMA"
	defm	" VEZ QUE TE VEA%TE DEVORARE, N"
	defm	"OMO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text30
	defm	"_TASSLEHOFF%PERDONA, ES ESTO T"
	defm	"UYO?%LO ENCONTRE Y LO RECO-%GI"
	defm	" PARA QUE NO SE PER-%DIERA"
	defb	0

;	SECTION	code



;	SECTION	text

._text31
	defm	"_GALLUMB%ESTE NO ES MI TESORO,"
	defm	"%MALDITO ENANO! ESTO ES%MI ANI"
	defm	"LLO DE PENE!"
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

;	SECTION	code

;	SECTION	text

._dwarf_names
	defm	"TORREBRUNOJAIMITO   ESTESSO   "
	defm	"CARABIAS  DABID NOMOBELFI     "
	defm	"LILLIBIT  MEMOLE    GIMLI     "
	defm	"R2-D2     ROMAYS    TASSLEHOFF"
	defm	"GALLOFA   "
	defb	0

;	SECTION	code




._insert_dwarf_name
	ld a, (_dwarf_ct)
	ld b, 0
	ld c, a
	add 10
	ld (_dwarf_ct), a
	ld hl, _dwarf_names
	add hl, bc
	ld de, _text9 + 19
	ld bc, 10
	ldir
	ret



._draw_decos
	ld a, 8
	ld (__n), a
	ld hl, (_gp_gen)
	.deco_loop
	ld a, (hl)
	inc hl
	cp 0xff
	jr z, deco_done
	bit 7, a
	jr z, deco_run
	and 0x7f
	ld (__t), a
	ld b, 1
	jr deco_run_do
	.deco_run
	ld (__t), a
	ld b, (hl)
	inc hl
	.deco_run_do
	push bc
	ld a, (hl)
	inc hl
	ld d, a
	and 0x0f
	ld (__x), a
	ld c, a
	ld a, d
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	push hl
	call set_map_tile_do
	pop hl
	pop bc
	djnz deco_run_do
	jr deco_loop
	.deco_done
	ret



._redraw_from_buffer
	ld a, 1
	ld (__x), a
	ld a, 0
	ld (__y), a
	xor a
	.redraw_from_buffer_loop
	ld (_gpit), a
	ld bc, (_gpit)
	ld b, 0
	ld hl, _map_buff
	add hl, bc
	ld a, (hl)
	cp 16
	jr nc, redraw_set_tile
	.redraw_set_tile
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



._clear_temp_string
	ld hl, _temp_string+1
	ld de, _temp_string+2
	ld bc, 21
	ld a, 32
	ld (hl), a
	ldir
	ret



._sprite_remove_aid
	call	_saca_a_todo_el_mundo_de_aqui
	LIB SPValidate
	ld c, 1
	ld b, 0
	ld d, 0+19
	ld e, 1+29
	ld iy, fsClipStruct
	call SPValidate
	ret



._show_text_box
	call	_sprite_remove_aid
	ld	hl,_texts
	push	hl
	ld	hl,(_rda)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_gp_gen),hl
	ld	hl,4 % 256	;const
	push	hl
	ld	a,(_rdb)
	and	a
	jp	z,i_62
	ld	hl,5	;const
	jp	i_63
.i_62
	ld	hl,6	;const
.i_63
	ld	h,0
	push	hl
	ld	hl,48 % 256	;const
	push	hl
	ld	hl,_top_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,7 % 256	;const
	ld	a,l
	ld	(_rdy),a
.i_64
	call	_clear_temp_string
	ld	a,(_rdy)
	ld	e,a
	ld	d,0
	ld	hl,7	;const
	call	l_ugt
	jp	c,i_67
	ld	a,(_rdb)
	cp	#(0 % 256)
	jp	z,i_66
.i_67
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,48 % 256	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_66
	ld de, _temp_string + 1
	ld a, (_rdb)
	or a
	jr z, fill_buffer_noinc
	ld a, (_rdy)
	cp 7
	jr nz, fill_buffer_noinc
	inc de
	inc de
	.fill_buffer_noinc
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
	ld	hl,48 % 256	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	push	hl
	ld	hl,48 % 256	;const
	push	hl
	ld	hl,_bottom_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_65
.i_69
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	dec	hl
	jp	i_64
.i_65
	ld a, (_rdb)
	or a
	jr z, no_character
	ld a, 5
	ld (__x), a
	ld a, 6
	ld (__y), a
	ld a, (_rdb)
	ld (__t), a
	call _draw_coloured_tile_do
	.no_character
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
.i_70
	call	_any_key
	ld	a,h
	or	l
	jp	nz,i_70
.i_71
.i_72
	call	_any_key
	call	l_lneg
	jp	c,i_72
.i_73
	ld	hl,(_redraw_after_text)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_74
	call	_redraw_from_buffer
	call	_hotspot_paint
	call	_render_all_sprites
	call	sp_UpdateNow
.i_74
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_redraw_after_text),a
	ret



._recuadrius
	call	_sprite_remove_aid
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_77
.i_75
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_77
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_76
	jp	nc,i_76
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_80
.i_78
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_80
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
	jp	nc,i_79
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	add 0
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdx)
	add 1
	ld c, a
	ld a, (_rdi)
	ld b, a
	ld a, 0 + 19
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
	jp	nc,i_81
	ld de, 0x4700
	ld a, (_rdi)
	add 1
	ld c, a
	ld a, (_rdx)
	add 0
	call SPPrintAtInv
	ld de, 0x4700
	ld a, (_rdi)
	ld b, a
	ld a, 1 + 29
	sub b
	ld c, a
	ld a, (_rdx)
	add 0
	call SPPrintAtInv
.i_81
	jp	i_78
.i_79
	halt
	call SPUpdateNow
	jp	i_75
.i_76
	ret



._draw_cur_screen_decos
	ld	hl,(_n_pant)
	ld	h,0
.i_84
	ld	a,l
	cp	#(0% 256)
	jp	z,i_85
	cp	#(1% 256)
	jp	z,i_86
	cp	#(4% 256)
	jp	z,i_87
	cp	#(5% 256)
	jp	z,i_89
	cp	#(17% 256)
	jp	z,i_90
	cp	#(24% 256)
	jp	z,i_92
	cp	#(31% 256)
	jp	z,i_96
	jp	i_83
.i_85
	ld	hl,_decos0
	ld	(_gp_gen),hl
	call	_draw_decos
	jp	i_83
.i_86
	ld	hl,_decos1
	ld	(_gp_gen),hl
	call	_draw_decos
	jp	i_83
.i_87
	ld	a,(_gallumb_flag)
	cp	#(1 % 256)
	jp	z,i_88
	jp	nc,i_88
	ld	hl,6 % 256	;const
	push	hl
	ld	hl,4 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
.i_88
	jp	i_83
.i_89
	ld	hl,_decos2
	ld	(_gp_gen),hl
	call	_draw_decos
	jp	i_83
.i_90
	ld	a,(_sonia_talk)
	and	a
	jp	nz,i_91
	ld	hl,12 % 256	;const
	push	hl
	ld	hl,3 % 256	;const
	push	hl
	ld	hl,34 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_91
	jp	i_83
.i_92
	ld	a,(_gandalf_talk)
	cp	#(2 % 256)
	jp	nz,i_93
	ld	a,(_dwarf_talk)
	and	a
	jp	nz,i_94
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,7 % 256	;const
	push	hl
	ld	hl,17 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_95
.i_94
	ld	hl,9 % 256	;const
	push	hl
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_95
.i_93
	jp	i_83
.i_96
	ld	a,(_gandalf_talk)
	cp	#(2 % 256)
	jp	z,i_97
	ld	hl,9 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,15 % 256	;const
	push	hl
	ld	hl,8 % 256	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_97
.i_83
	ret



._launch_comecocos_screen
	call	_sprite_remove_aid
	ld a, (_n_pant)
	ld (_n_pant_was), a
	ld a, (_gpx)
	ld (_xwas), a
	ld a, (_gpy)
	ld (_ywas), a
	call	_recuadrius
	ld	hl,(_rda)
	ld	h,0
	ld	de,35
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdb),a
	ld	hl,(_rda)
	ld	h,0
	ld	de,11
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,16 % 256	;const
	ld	a,l
	ld	(_gpy),a
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	hl,_player
	push	hl
	inc	hl
	inc	hl
	ld	de,1024	;const
	ex	de,hl
	call	l_pint
	pop	de
	call	l_pint
	ld	hl,5 % 256	;const
	call	_wyz_play_music
	ld	a,#(1 % 256 % 256)
	ld	(_comecocos_on),a
	ld	hl,_player+45
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ret



._back_from_comecocos_screen
	ld a, (_n_pant)
	ld c, a
	ld a, (_n_pant_was)
	ld (_n_pant), a
	ld a, c
	sub 35
	ld (_n_pant_was), a
	ld a, (_xwas)
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), hl
	ld a, (_ywas)
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), hl
	ret



._touch_tile
	ld hl, 0
	ld a, (__x)
	sub 15
	ld c, a
	ld a, (_gpx)
	cp c
	ret c
	ld a, (__x)
	add 16
	ld c, a
	ld a, (_gpx)
	cp c
	ret nc
	ld a, (__y)
	sub 15
	ld c, a
	ld a, (_gpy)
	cp c
	ret c
	ld a, (__y)
	add 16
	ld c, a
	ld a, (_gpy)
	cp c
	ret nc
	ld hl, 1
	ret



._hook_system_inits
	ret



._hook_init_game
	ld	a,#(0 % 256 % 256)
	ld	(_gandalf_talk),a
	ld	a,#(0 % 256 % 256)
	ld	(_dwarf_talk),a
	ld	a,#(0 % 256 % 256)
	ld	(_comecocos_on),a
	ld	a,#(0 % 256 % 256)
	ld	(_anillo_flag),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gallumb_flag),a
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_dwarf_ct),a
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,0 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,1 % 256	;const
	call	_wyz_play_music
	ld	a,#(3 % 256 % 256)
	ld	(_gandalf_talk),a
	ld	a,#(1 % 256 % 256)
	ld	(_dwarf_talk),a
	ld	hl,11 % 256	;const
	ld	a,l
	ld	(_n_pant),a
	ret



._hook_init_mainloop
	ret



._hook_mainloop
	ld a, (_delayed_ct)
	or a
	jr z, delayed_ct_dec_done
	dec a
	ld (_delayed_ct), a
	.delayed_ct_dec_done
	cp 1
	jr nz, delayed_text_done
	ld a, (_tfn_b)
	ld (_rdb), a
	ld a, (_tfn_a)
	ld (_rda), a
	call _show_text_box
	.delayed_text_done
	ld	a,(_comecocos_on)
	and	a
	jp	z,i_99
	ld	hl,(_player+45)
	ld	h,0
	ex	de,hl
	ld	hl,(_cocos_count)
	ld	h,0
	call	l_eq
	jr	c,i_100_i_99
.i_99
	jp	i_98
.i_100_i_99
	call	_back_from_comecocos_screen
	ld	a,#(0 % 256 % 256)
	ld	(_comecocos_on),a
	ld	hl,(_n_pant_was)
	ld	h,0
.i_103
	ld	a,l
	cp	#(0% 256)
	jp	z,i_104
	cp	#(1% 256)
	jp	z,i_105
	cp	#(2% 256)
	jp	z,i_106
	cp	#(3% 256)
	jp	z,i_107
	jp	i_102
.i_104
	ld	hl,2 % 256	;const
	call	_wyz_play_music
	ld	a,#(46 % 256 % 256)
	ld	(_tfn_b),a
	ld	a,#(7 % 256 % 256)
	ld	(_tfn_a),a
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_delayed_ct),a
	jp	i_102
.i_105
	ld	hl,1 % 256	;const
	call	_wyz_play_music
	ld	a,#(46 % 256 % 256)
	ld	(_tfn_b),a
	ld	a,#(8 % 256 % 256)
	ld	(_tfn_a),a
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_delayed_ct),a
	jp	i_102
.i_106
	ld	hl,3 % 256	;const
	call	_wyz_play_music
	jp	i_102
.i_107
	ld	hl,3 % 256	;const
	call	_wyz_play_music
	ld	a,#(18 % 256 % 256)
	ld	(_tfn_b),a
	ld	a,#(26 % 256 % 256)
	ld	(_tfn_a),a
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_delayed_ct),a
.i_102
.i_98
	ld	hl,(_n_pant)
	ld	h,0
.i_110
	ld	a,l
	cp	#(0% 256)
	jp	z,i_111
	cp	#(1% 256)
	jp	z,i_123
	cp	#(12% 256)
	jp	z,i_129
	cp	#(17% 256)
	jp	z,i_134
	cp	#(24% 256)
	jp	z,i_139
	jp	i_109
.i_111
	ld	hl,32 % 256	;const
	ld	a,l
	ld	(__y),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_touch_tile
	ld	a,h
	or	l
	jp	z,i_112
	ld	a,(_interact_flag)
	and	a
	jp	nz,i_113
	ld	a,(_gandalf_talk)
	cp	#(1 % 256)
	jp	nz,i_115
	ld	hl,_player+27
	call	l_gchar
	ld	de,13	;const
	ex	de,hl
	call	l_lt
	jr	c,i_116_i_115
.i_115
	jp	i_114
.i_116_i_115
	ld	a,#(46 % 256 % 256)
	ld	(_rdb),a
	ld	hl,7 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
.i_114
	ld	a,(_gandalf_talk)
	and	a
	jp	nz,i_117
	ld	a,#(46 % 256 % 256)
	ld	(_rdb),a
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,5 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(47 % 256 % 256)
	ld	(_rdb),a
	ld	hl,6 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(1 % 256 % 256)
	ld	(_gandalf_talk),a
	ld	a,#(0 % 256 % 256)
	ld	(_dwarf_ct),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_launch_comecocos_screen
	ld	hl,65 % 256	;const
	ld	a,l
	ld	(_cocos_count),a
.i_117
	ld	a,(_gandalf_talk)
	cp	#(2 % 256)
	jp	nz,i_118
	ld	a,#(46 % 256 % 256)
	ld	(_rdb),a
	ld	hl,8 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
.i_118
	ld	hl,_player+27
	call	l_gchar
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_120
	ld	a,(_gandalf_talk)
	cp	#(1 % 256)
	jr	z,i_121_i_120
.i_120
	jp	i_119
.i_121_i_120
	ld	a,#(46 % 256 % 256)
	ld	(_rdb),a
	ld	hl,18 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(2 % 256 % 256)
	ld	(_gandalf_talk),a
	ld	hl,_player+27
	push	hl
	pop	de
	xor	a
	ld	(de),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_launch_comecocos_screen
	ld	hl,65 % 256	;const
	ld	a,l
	ld	(_cocos_count),a
.i_119
.i_113
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
	jp	i_122
.i_112
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_122
	jp	i_109
.i_123
	ld	a,(_gpx)
	cp	#(48 % 256)
	jp	z,i_125
	jp	c,i_125
	ld	a,(_gpx)
	cp	#(88 % 256)
	jp	z,i_125
	jp	nc,i_125
	ld	a,(_gpy)
	cp	#(32 % 256)
	jp	z,i_125
	jr	c,i_126_i_125
.i_125
	jp	i_124
.i_126_i_125
	ld	a,(_interact_flag)
	and	a
	jp	nz,i_127
	ld	a,#(35 % 256 % 256)
	ld	(_rdb),a
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_127
	jp	i_128
.i_124
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_128
	jp	i_109
.i_129
	ld	a,(_gallumb_flag)
	cp	#(1 % 256)
	jp	nz,i_130
	ld	hl,112 % 256	;const
	ld	a,l
	ld	(__y),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_touch_tile
	ld	a,h
	or	l
	jp	z,i_131
	ld	a,(_interact_flag)
	and	a
	jp	nz,i_132
	ld	a,#(33 % 256 % 256)
	ld	(_rdb),a
	ld	hl,29 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(1 % 256 % 256)
	ld	(_interact_flag),a
	ld	hl,2 % 256	;const
	ld	a,l
	ld	(_gallumb_flag),a
.i_132
	jp	i_133
.i_131
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_133
.i_130
	jp	i_109
.i_134
	ld	a,(_sonia_talk)
	and	a
	jp	nz,i_135
	ld	a,#(192 % 256 % 256)
	ld	(__x),a
	ld	hl,48 % 256	;const
	ld	a,l
	ld	(__y),a
	call	_touch_tile
	ld	a,h
	or	l
	jp	z,i_136
	ld	a,(_interact_flag)
	and	a
	jp	nz,i_137
	ld	a,#(1 % 256 % 256)
	ld	(_interact_flag),a
	ld	a,#(47 % 256 % 256)
	ld	(_rdb),a
	ld	hl,22 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,23 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(34 % 256 % 256)
	ld	(_rdb),a
	ld	hl,24 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,2 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_launch_comecocos_screen
	ld	a,#(65 % 256 % 256)
	ld	(_cocos_count),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_sonia_talk),a
.i_137
	jp	i_138
.i_136
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_138
.i_135
	jp	i_109
.i_139
	ld	a,(_dwarf_talk)
	and	a
	jp	nz,i_140
	ld	a,#(3 % 256 % 256)
	ld	(_gandalf_talk),a
	ld	a,#(144 % 256 % 256)
	ld	(__x),a
	ld	hl,112 % 256	;const
	ld	a,l
	ld	(__y),a
	call	_touch_tile
	ld	a,h
	or	l
	jp	z,i_141
	ld	a,(_interact_flag)
	and	a
	jp	nz,i_142
	ld	a,#(1 % 256 % 256)
	ld	(_interact_flag),a
	ld	a,#(46 % 256 % 256)
	ld	(_rdb),a
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,20 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,21 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(1 % 256 % 256)
	ld	(_dwarf_talk),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	hl,3 % 256	;const
	call	_wyz_play_music
.i_142
	jp	i_143
.i_141
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_interact_flag),a
.i_143
.i_140
.i_109
	ld	a,(_anillo_flag)
	and	a
	jp	z,i_144
	ld	hl,(_player+23)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_145
	ld a, (_player + 23)
	or a
	jr nz, anillo_done
	ld c, a
	ld a, (_last_estado)
	cp c
	jr z, anillo_ct_check
	ld a, 25
	ld (_anillo_ct), a
	ld hl, 3
	call _wyz_play_music
	ld a, (_gpx)
	and 0xfe
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), hl
	ld a, (_gpy)
	and 0xfe
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), hl
	jr anillo_done
	.anillo_ct_check
	ld a, (_anillo_ct)
	or a
	jr z, anillo_ct_zero
	dec a
	ld (_anillo_ct), a
	jr anillo_done
	.anillo_ct_zero
	ld a, (_pad_this_frame)
	and 0x80
	jr nz, anillo_done
	ld a, 2 | 8
	ld (_player + 23), a
	ld a, 190
	ld (_player + 24), a
	ld hl, 4
	call _wyz_play_music
	ld hl, 8
	call _play_sfx
	.anillo_done
.i_145
.i_144
	ld	hl,(_player+23)
	ld	h,0
	ld	a,l
	ld	(_last_estado),a
	ret



._hook_entering
	call	_draw_cur_screen_decos
	ret



._hook_hotspots
	ld	hl,(_hotspot_t)
	ld	h,0
.i_148
	ld	a,l
	cp	#(1% 256)
	jp	z,i_149
	cp	#(2% 256)
	jp	z,i_152
	cp	#(12% 256)
	jp	z,i_153
	jp	i_147
.i_149
	ld	a,(_gandalf_talk)
	and	a
	jp	nz,i_150
	ld	hl,(_dwarf_ct)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,47 % 256	;const
	ld	a,l
	ld	(_rdb),a
	call	_show_text_box
	ld	hl,(_dwarf_ct)
	ld	h,0
	inc	hl
	ld	de,3	;const
	ex	de,hl
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_dwarf_ct),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hotspot_t),a
	jp	i_151
.i_150
	call	_insert_dwarf_name
	ld	a,#(9 % 256 % 256)
	ld	(_rda),a
	ld	hl,17 % 256	;const
	ld	a,l
	ld	(_rdb),a
	call	_show_text_box
.i_151
	jp	i_147
.i_152
	ld	a,#(1 % 256 % 256)
	ld	(_anillo_flag),a
	ld	hl,19 % 256	;const
	push	hl
	ld	hl,22 % 256	;const
	push	hl
	ld	hl,18 % 256	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	a,#(18 % 256 % 256)
	ld	(_rdb),a
	ld	hl,25 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
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
	ld	a,#(0 % 256 % 256)
	ld	(_hotspot_t),a
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_launch_comecocos_screen
	ld	hl,55 % 256	;const
	ld	a,l
	ld	(_cocos_count),a
	jp	i_147
.i_153
	ld	a,(_player+23)
	and	a
	jp	nz,i_154
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(150 % 256 % 256)
.i_154
	ld	hl,6 % 256	;const
	call	_play_sfx
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hotspot_t),a
.i_147
	ret



._enems_custom_collision
	ld	a,(__en_t)
	cp	#(3 % 256)
	jp	nz,i_155
	ld	a,(_gallumb_flag)
	and	a
	jp	nz,i_156
	ld	a,#(33 % 256 % 256)
	ld	(_rdb),a
	ld	hl,27 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,28 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(17 % 256 % 256)
	ld	(_rdb),a
	ld	hl,30 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	a,#(33 % 256 % 256)
	ld	(_rdb),a
	ld	hl,31 % 256	;const
	ld	a,l
	ld	(_rda),a
	call	_show_text_box
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_gallumb_flag),a
.i_156
	ld	a,(_gallumb_flag)
	cp	#(1 % 256)
	jp	nz,i_157
	ld	hl,_player
	push	hl
	call	l_gint	;
	ld	bc,-256
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,1 % 256	;const
	ret


.i_157
.i_155
	ld	hl,0 % 256	;const
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
	ld	hl,11 % 256	;const
	push	hl
	ld	hl,12 % 256	;const
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
	call SPUpdateNow
	ld	a,(_is128k)
	and	a
	jp	z,i_158
	ld	hl,0 % 256	;const
	call	_wyz_play_music
	jp	i_159
.i_158
	; Music generated by beepola
	call musicstart
.i_159
.i_160
	call	_rand
	ld	hl,(_key_1)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_162
	ld	hl,sp_JoyKeyboard
	ld	(_joyfunc),hl
	jp	i_161
.i_162
	ld	hl,(_key_2)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_164
	ld	hl,sp_JoyKempston
	ld	(_joyfunc),hl
	jp	i_161
.i_164
	ld	hl,(_key_3)
	push	hl
	call	sp_KeyPressed
	pop	bc
	ld	a,h
	or	l
	jp	z,i_166
	ld	hl,sp_JoySinclair1
	ld	(_joyfunc),hl
	jp	i_161
.i_166
.i_165
.i_163
	jp	i_160
.i_161
.i_167
	ret



._game_ending
	call SPUpdateNow
	ld	hl,_s_ending
	ld	(_asm_int),hl
	call	_unpack
	call	_beepet
	ld	hl,11 % 256	;const
	call	_play_sfx
	ld	hl,500	;const
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
	ld	hl,i_1+33
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call SPUpdateNow
	call	_beepet
	ld	hl,10 % 256	;const
	call	_play_sfx
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
	add 0
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
	or a
	sbc hl, de
	ld de, _malotes
	add hl, de
	ret



._render_all_sprites
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
	cp	#(3 % 256)
	jp	z,i_172
	jp	nc,i_172
	ld	hl,_malotes
	push	hl
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	c,i_175
	ld	hl,_malotes
	push	hl
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_174
.i_175
	ld a, (_enit)
	sla a
	ld c, a
	ld b, 0
	ld hl, _en_an_x
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	call HLshr6_A
	ld (_rdx), a
	ld hl, _en_an_y
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	call HLshr6_A
	ld (_rdy), a
	jp	i_177
.i_174
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
.i_177
	call _render_this_enemy
	jp	i_171
.i_172
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
	jp	c,i_179
	ld	a,(_half_life)
	and	a
	jp	z,i_178
.i_179
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_181
.i_178
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_181
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
	add 0
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
	add 12
	cp c
	ret c
	ld a, (_en_ccx)
	ld c, a
	ld a, (_gpx)
	add 12
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
	ld	hl,_player+45
	inc	(hl)
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
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
	ld	(hl),#(50 % 256 % 256)
	ld	l,(hl)
	ld	h,0
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
	ld	hl,1	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_182
	ld hl, -128
	ld (_player + 8), hl
	ld a, 2
	ld (_player + 22), a
.i_182
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_183
	ld hl, 128
	ld (_player + 8), hl
	ld a, 3
	ld (_player + 22), a
.i_183
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_185
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_185
	ld	hl,0	;const
	jr	i_186
.i_185
	ld	hl,1	;const
.i_186
	call	l_lneg
	jp	nc,i_184
	ld hl, 0
	ld (_player + 8), hl
.i_184
	ld	hl,_player+23
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_187
	ld	hl,_player+8
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(1 % 256)
	call	l_asr
	pop	de
	call	l_pint
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	push	hl
	call	_rand
	ld	de,127	;const
	ex	de,hl
	call	l_and
	ld	bc,-64
	add	hl,bc
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_187
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
	jp	p,i_188
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_188
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_189
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_189
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
	ld a, (_gpy)
	and 15
	cp 12
	jp nc, vert_collision_done
	.vert_collision_if1
	ld a, (_gpx)
	and 15
	cp 14
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
	cp 2+1
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
	call Ashl16_HL
	ld (_player + 2), hl
	ld a, 1
	ld (_player + 37), a
	ld a, 4
	ld (_wall), a
	jr vert_collision_done
	.vert_collision_positive
	ld a, (_gpy)
	and 15
	cp 5
	jp c, vert_collision_done
	.vert_collision_if3
	ld a, (_gpx)
	and 15
	cp 14
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
	cp 2 + 1
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
	ld a, (_gpyy)
	sla a
	sla a
	sla a
	sla a
	add 4
	ld (_gpy), a
	call Ashl16_HL
	ld (_player+2), hl
	ld a, 1
	ld (_player + 26), a
	ld a, 8
	ld (_wall), a
	.vert_collision_done
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_190
	ld hl, -128
	ld (_player + 6), hl
	ld a, 1
	ld (_player + 22), a
.i_190
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_191
	ld hl, 128
	ld (_player + 6), hl
	ld a, 0
	ld (_player + 22), a
.i_191
	ld	hl,_pad0
	ld	a,(hl)
	and	#(4 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_193
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_194_i_193
.i_193
	jp	i_192
.i_194_i_193
	ld hl, 0
	ld (_player + 6), hl
.i_192
	ld	hl,_player+23
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_195
	ld	hl,_player+6
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,#(1 % 256)
	call	l_asr
	pop	de
	call	l_pint
	ld	hl,_player+6
	push	hl
	call	l_gint	;
	push	hl
	call	_rand
	ld	de,127	;const
	ex	de,hl
	call	l_and
	ld	bc,-64
	add	hl,bc
	pop	de
	add	hl,de
	pop	de
	call	l_pint
.i_195
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
	jp	p,i_196
	ld	hl,0	;const
	ld	(_player),hl
.i_196
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_197
	ld	hl,14336	;const
	ld	(_player),hl
.i_197
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
	cp 14
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
	cp 5
	jp c, horz_collision_done
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
	add 14
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), hl
	ld a, 1
	ld (_wall), a
	jr horz_collision_done
	.horz_collision_positive
	ld a, (_gpx)
	and 15
	cp 2
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
	cp 5
	jp c, horz_collision_done
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
	add 2
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), hl
	ld a, 2
	ld (_wall), a
	.horz_collision_done
	.player_get_coin
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (__x), a
	ld c, a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	call qtile_do
	ld a, l
	cp 29
	jr nz, player_get_coin_done
	call _get_coin
	.player_get_coin_done
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_xor
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	a,h
	or	l
	jp	z,i_198
	ld	hl,_player+21
	inc	(hl)
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_199
	ld	hl,_player+21
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+20
	push	hl
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	pop	de
	ld	a,l
	ld	(de),a
	call	_step
.i_199
.i_198
	ld	hl,(_player+20)
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_200
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_201
	ld	hl,(_rdd)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_202
.i_201
	ld	hl,(_rdd)
	ld	h,0
	ld	bc,6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_202
	jp	i_203
.i_200
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_204
	ld	hl,(_rdd)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_204
.i_203
	ld	hl,_player+17
	push	hl
	ld	hl,_player_cells
	push	hl
	ld	hl,(_rdd)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ret



._init_player_values
	ld	a,#(128 % 256 % 256)
	ld	(_gpx),a
	ld	hl,48 % 256	;const
	ld	a,l
	ld	(_gpy),a
	ld a, (_gpx)
	call Ashl16_HL
	ld (_player), hl
	ld a, (_gpy)
	call Ashl16_HL
	ld (_player + 2), hl
	ld a, 32
	ld (_player+11), a
	ld a, 24
	ld (_player+12), a
	ld hl, 256
	ld (_player+39), hl
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
	ld a, 3
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 5
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 7 * 6
	ld hl, _hotspots + 2
	ld de, 3
	ld a, 1
	.init_hotspots_loop
	ld (hl), a
	add hl, de
	djnz init_hotspots_loop
	ret



._draw_and_advance
	ld a, (__n)
	cp 30
	jr nz, _animated_tiles_add_done
	ld hl, (_animated_ptr)
	ld a, (_rdx)
	srl a
	ld b, a
	ld a, (_rdy)
	;and 0xfe
	sla a
	sla a
	sla a
	or b
	ld (hl), a
	inc hl
	ld (_animated_ptr), hl
	._animated_tiles_add_done
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
	add 0
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
	ld hl, 61440-(40*15)-4
	ld (_animated_ptr), hl
	ld de, 61440-(40*15)-4 + 1
	ld bc, 4 - 1
	ld a, 0xff
	ld (hl), a
	ldir
	xor a
	ld (_rdx), a
	ld (_rdy), a
	ld (_rdi), a
	._draw_scr_get_scr_address
	ld hl, (_n_pant)
	ld h, 0
	add hl, hl
	ld de, _mapa
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
	and 0x1f
	ld (_rdc), a
	._draw_scr_advance_loop
	ld a, (_rdn)
	cp 0x20
	jr c, _draw_scr_advance_loop_done
	sub 0x20
	ld (_rdn), a
	call _advance_worm
	jr _draw_scr_advance_loop
	._draw_scr_advance_loop_done
	call _advance_worm
	jr _draw_scr_loop
	.no_alt_bg_subst
	or a
	ret nz
	call _rand
	ld a, l
	and 15
	cp 2
	jr nc, draw_scr_alt_no
	ld a, 19
	ret
	.draw_scr_alt_no
	xor a
	ret
	._advance_worm
	ld a, (_rdc)
	call no_alt_bg_subst
	ld (__n), a
	call _draw_and_advance
	ret
	._draw_scr_loop_done
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



._marrullers_select_direction
	ld	de,_en_an_ff
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_and
.i_207
	ld	a,l
	cp	#(0% 256)
	jp	z,i_208
	cp	#(1% 256)
	jp	z,i_209
	cp	#(2% 256)
	jp	z,i_210
	cp	#(3% 256)
	jp	z,i_211
	jp	i_206
.i_208
	xor	a
	ld	(__en_mx),a
	ld	hl,(_rdd)
	ld	h,0
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
	jp	i_206
.i_209
	xor	a
	ld	(__en_mx),a
	ld	hl,(_rdd)
	ld	h,0
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
	jp	i_206
.i_210
	ld	hl,(_rdd)
	ld	h,0
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
	jp	i_206
.i_211
	ld	hl,(_rdd)
	ld	h,0
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
	ld	hl,0	;const
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
.i_206
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
	jp	i_214
.i_212
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_214
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_213
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
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	call	l_gchar
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,(__en_t)
	ld	h,0
.i_217
	ld	a,l
	cp	#(1% 256)
	jp	z,i_218
	cp	#(2% 256)
	jp	z,i_219
	cp	#(3% 256)
	jp	z,i_220
	cp	#(4% 256)
	jp	z,i_221
	cp	#(6% 256)
	jp	z,i_222
	cp	#(7% 256)
	jp	z,i_223
	cp	#(8% 256)
	jp	z,i_224
	cp	#(9% 256)
	jp	z,i_225
	cp	#(10% 256)
	jp	z,i_226
	cp	#(11% 256)
	jp	z,i_227
	cp	#(12% 256)
	jp	z,i_228
	cp	#(13% 256)
	jp	z,i_229
	cp	#(14% 256)
	jp	z,i_230
	jp	i_216
.i_218
.i_219
.i_220
.i_221
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_216
.i_222
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
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
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
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
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
	jp	i_216
.i_223
.i_224
.i_225
.i_226
	ld	de,_en_an_ff
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(__en_t)
	ld	h,0
	ld	bc,-7
	add	hl,bc
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_216
.i_227
.i_228
.i_229
.i_230
	ld	hl,(__en_t)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	push	hl
	call	_enems_en_an_calc
	pop	bc
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	push	hl
	ld	a,(hl)
	and	#(240 % 256)
	pop	de
	ld	(de),a
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	inc	hl
	push	hl
	ld	a,(hl)
	and	#(240 % 256)
	pop	de
	ld	(de),a
	ld	de,_en_an_ff
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,4
	add	hl,bc
	call	l_gchar
	push	hl
	ld	hl,_malotes
	push	hl
	ld	hl,(_enoffsmasi)
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,5
	add	hl,bc
	call	l_gchar
	pop	de
	add	hl,de
	call	_abs
	pop	de
	ld	a,l
	ld	(de),a
.i_216
	jp	i_212
.i_213
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
	jp	i_233
.i_231
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_233
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_232
	jp	nc,i_232
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
	ld b, a
	and 0xf0
	ld (__en_x1), a
	ld a, b
	sla a
	sla a
	sla a
	sla a
	ld (__en_y1), a
	inc hl
	ld a, (hl)
	ld b, a
	and 0xf0
	ld (__en_x2), a
	ld a, b
	sla a
	sla a
	sla a
	sla a
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
	jp	z,i_234
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
	jp	c,i_236
	ld	a,(__en_t)
	cp	#(11 % 256)
	jr	z,i_237_uge
	jp	c,i_237
.i_237_uge
	ld	a,(__en_t)
	cp	#(14 % 256)
	jr	z,i_237_ule
	jp	nc,i_237
.i_237_ule
	ld	hl,1	;const
	jr	i_238
.i_237
	ld	hl,0	;const
.i_238
	ld	a,h
	or	l
	jp	nz,i_236
	jr	i_239
.i_236
	ld	hl,1	;const
.i_239
	ld	a,h
	or	l
	jp	z,i_235
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
	ld a, (__en_t)
	cp 11
	jr nc, vert_limit_skip_2
	.en_linear_horz_bounds
	ld a, (__en_x)
	ld c, a
	ld a, (__en_x1)
	cp c
	jr c, horz_limit_skip_1
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	ld a, (__en_x1)
	ld (__en_x), a
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
	ld a, (__en_x2)
	ld (__en_x), a
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
	ld a, (__en_y1)
	ld (__en_y), a
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
	ld a, (__en_y2)
	ld (__en_y), a
	.vert_limit_skip_2
.i_235
	ld	a,(__en_t)
	cp	#(7 % 256)
	jr	z,i_241_uge
	jp	c,i_241
.i_241_uge
	ld	a,(__en_t)
	cp	#(10 % 256)
	jr	z,i_242_i_241
	jr	c,i_242_i_241
.i_241
	jp	i_240
.i_242_i_241
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_ff
	add hl, bc
	ld a, (hl)
	or a
	jr z, _cuadrators_update_y
	._cuadrators_update_x
	ld a, (__en_mx)
	ld c, a
	ld a, (__en_x)
	add c
	ld (__en_x), a
	.cuadrators_horz_bounds
	ld a, (__en_x)
	ld c, a
	ld a, (__en_x1)
	cp c
	jr c, cuadrators_limit_skip_1
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	jr _cuadrators_flipflop
	.cuadrators_limit_skip_1
	ld a, (__en_x2)
	ld c, a
	ld a, (__en_x)
	cp c
	jr c, _cuadrators_update_done
	ld a, (__en_mx)
	call _abs_a
	neg
	ld (__en_mx), a
	jr _cuadrators_flipflop
	._cuadrators_update_y
	ld a, (__en_my)
	ld c, a
	ld a, (__en_y)
	add c
	ld (__en_y), a
	.cuadrators_vert_bounds
	ld a, (__en_y)
	ld c, a
	ld a, (__en_y1)
	cp c
	jr c, cuadrators_limit_skip_2
	ld a, (__en_my)
	call _abs_a
	ld (__en_my), a
	jr _cuadrators_flipflop
	.cuadrators_limit_skip_2
	ld a, (__en_y2)
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, _cuadrators_update_done
	ld a, (__en_my)
	call _abs_a
	neg
	ld (__en_my), a
	._cuadrators_flipflop
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_ff
	add hl, bc
	ld a, (hl)
	xor 1
	ld (hl), a
	._cuadrators_update_done
	jp _en_bg_collision_end
.i_240
	ld	a,(__en_t)
	cp	#(6 % 256)
	jp	z,i_244
	ld	a,(__en_t)
	cp	#(0 % 256)
	jp	nz,i_243
.i_244
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_246
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
	jp	nc,i_248
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
	jr	c,i_249_i_248
.i_248
	jp	i_247
.i_249_i_248
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,16
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_250
.i_247
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
	jp	nc,i_252
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
	jr	c,i_253_i_252
.i_252
	jp	i_251
.i_253_i_252
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_pint
.i_251
.i_250
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
	jp	nc,i_255
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
	jr	c,i_256_i_255
.i_255
	jp	i_254
.i_256_i_255
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,16
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_257
.i_254
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
	jp	nc,i_259
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
	jr	c,i_260_i_259
.i_259
	jp	i_258
.i_260_i_259
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_pint
.i_258
.i_257
.i_246
	ld	a,(_scenery_info+1+1+1)
	and	a
	jp	z,i_261
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
.i_261
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
	jp	nc,i_262
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
.i_262
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
	jp	nc,i_263
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
.i_263
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
	jp	nc,i_264
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
.i_264
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
	jp	nc,i_265
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
.i_265
.i_243
	._en_bg_collision
	call en_xx_calc
	call en_yy_calc
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
	ld a, (__en_t)
	cp 11
	jr c, _en_bg_col_marrh_done
	cp 15
	jr nc, _en_bg_col_marrh_done
	call _marrullers_select_direction
	jp _en_bg_collision_end
	._en_bg_col_marrh_done
	ld a, (__en_mx)
	ld c, a
	xor a
	sub c
	ld (__en_mx), a
	._en_bg_collision_horz_done
	call en_xx_calc
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
	ld a, (__en_t)
	cp 11
	jr c, _en_bg_col_marrv_done
	cp 15
	jr nc, _en_bg_col_marrv_done
	call _marrullers_select_direction
	jr _en_bg_collision_end
	._en_bg_col_marrv_done
	ld a, (__en_my)
	ld c, a
	xor a
	sub c
	ld (__en_my), a
	._en_bg_collision_vert_done
	call en_yy_calc
	jr _en_bg_collision_end
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
	ld	e,a
	ld	d,0
	ld	hl,6	;const
	call	l_eq
	jp	nc,i_266
	ld a, (_enit)
	sla a
	ld c, a
	ld b, 0
	ld hl, _en_an_x
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	call HLshr6_A
	ld (_en_ccx), a
	ld hl, _en_an_y
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	call HLshr6_A
	ld (_en_ccy), a
	jp	i_267
.i_266
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
.i_267
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_269
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_269
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_269
	jr	c,i_270_i_269
.i_269
	jp	i_268
.i_270_i_269
	ld	hl,(_player+23)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_271
	call	_enems_custom_collision
	ld	a,h
	or	l
	jp	nz,i_272
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
	ld	a,#(2 % 256 % 256)
	ld	(_player_just_died),a
	ld	hl,__en_mx
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_273
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccx)
	ld	h,0
	call	l_ult
	jp	nc,i_274
	ld	hl,_player+6
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	add	hl,hl
	call	_abs
	ex	de,hl
	ld	l,#(7 % 256)
	call	l_asl
	call	l_neg
	pop	de
	call	l_pint
	jp	i_275
.i_274
	ld	hl,_player+6
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	push	hl
	ld	hl,__en_mx
	call	l_gchar
	pop	de
	add	hl,de
	call	_abs
	ex	de,hl
	ld	l,#(7 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_275
.i_273
	ld	hl,__en_my
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_276
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ult
	jp	nc,i_277
	ld	hl,_player+8
	push	hl
	ld	hl,__en_my
	call	l_gchar
	add	hl,hl
	call	_abs
	ex	de,hl
	ld	l,#(7 % 256)
	call	l_asl
	call	l_neg
	pop	de
	call	l_pint
	jp	i_278
.i_277
	ld	hl,_player+8
	push	hl
	ld	hl,__en_my
	call	l_gchar
	push	hl
	ld	hl,__en_my
	call	l_gchar
	pop	de
	add	hl,de
	call	_abs
	ex	de,hl
	ld	l,#(7 % 256)
	call	l_asl
	pop	de
	call	l_pint
.i_278
.i_276
	call	_player_flicker
.i_272
.i_271
.i_268
.i_234
.i_279
	ld hl, (__baddies_pointer)
	ld a, (__en_x)
	ld (hl), a
	inc hl
	ld a, (__en_y)
	ld (hl), a
	inc hl
	inc hl
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
	jp	i_231
.i_232
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
	call wyz_address_call
	ld a, 1
	jr detectionDone
	.no128K
	xor a
	.detectionDone
	ld (_is128k), a
	ld a, 1
	ld (_ay_player_on), a
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
	jp	i_282
.i_280
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_282
	ld	a,(_rdi)
	cp	#(3 % 256)
	jp	z,i_281
	jp	nc,i_281
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
	jp	i_280
.i_281
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
	call	_hook_system_inits
.i_283
	call	_cortina
	call	_title_screen
	ld	a,#(1 % 256 % 256)
	ld	(_playing),a
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_init_player
	call	_init_hotspots
	ld	a,#(28 % 256 % 256)
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
.i_285
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_286
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
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_287
	ld	hl,14 % 256	;const
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
.i_287
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_288
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_289
	or	l
	jp	z,i_289
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_290
.i_289
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_290
	ld	hl,28 % 256	;const
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
.i_288
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
	ld	a,#(0 % 256 % 256)
	ld	(_latest_hotspot),a
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
	ld	a,(_hotspot_flag)
	and	a
	jp	nz,i_291
	ld	a,#(1 % 256 % 256)
	ld	(_hotspot_flag),a
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	a,l
	ld	(_latest_hotspot),a
	call	_hook_hotspots
	ld	a,(_hotspot_t)
	and	a
	jp	z,i_292
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_295
	ld	a,l
	cp	#(1% 256)
	jp	z,i_296
	cp	#(3% 256)
	jp	z,i_297
	jp	i_294
.i_296
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6 % 256	;const
	call	_play_sfx
	jp	i_294
.i_297
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
	jp	nc,i_298
	ld	hl,99	;const
	ld	(_player+29),hl
.i_298
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,6 % 256	;const
	call	_play_sfx
.i_294
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_299
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
.i_299
.i_292
.i_291
	jr _hotspots_done
	._hotspots_else
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hotspot_flag),a
	._hotspots_done
	call	_hook_mainloop
	call _rand
	ld a, l
	and 4-1
	ld e, a
	ld d, 0
	ld hl, 61440-(40*15)-4
	add hl, de
	ld a, (hl)
	cp 0xff
	jr z, animated_tiles_done
	ld b, a
	and 0x0f
	ld (__x), a
	ld c, a
	ld a, b
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	call qtile_do
	ld a, l
	xor 0x01
	ld (__t), a
	ld de, _comportamiento_tiles
	add hl, de
	ld a, (hl)
	ld (__n), a
	call set_map_tile_do
	.animated_tiles_done
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
	and 2 | 8
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
	jp	nz,i_301
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_302_i_301
.i_301
	jp	i_300
.i_302_i_301
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_303
.i_300
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_305
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_306_i_305
.i_305
	jp	i_304
.i_306_i_305
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_304
.i_303
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_308
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_308
	ld	a,(_n_pant)
	cp	#(7 % 256)
	jr	z,i_308_uge
	jp	c,i_308
.i_308_uge
	jr	i_309_i_308
.i_308
	jp	i_307
.i_309_i_308
	ld a, (_n_pant)
	sub 7
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_310
.i_307
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_312
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_313_i_312
.i_312
	jp	i_311
.i_313_i_312
	ld a, (_n_pant)
	add 7
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_311
.i_310
	ld	a,(_game_loop_flag)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_314
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_314
	ld	a,(_player+36)
	and	a
	jp	z,i_315
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_316
	or	l
	jp	z,i_316
.i_316
.i_315
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_318
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_317
.i_318
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_317
	jp	i_285
.i_286
	jp	i_283
.i_284
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
	defm	"1 POAQ    %2 KEMPSTON%3 SINCLA"
	defm	"IR"
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
._gandalf_talk	defs	1
._en_xx	defs	1
._en_yy	defs	1
._anillo_ct	defs	1
._gp_gen_org	defs	2
._enemy_died	defs	1
._killed_old	defs	1
._ezg_old	defs	1
._dwarf_ct	defs	1
._intro_text	defs	1
._last_estado	defs	1
._t_alt	defs	1
._dwarf_talk	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._hotspot_flag	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._tfn_a	defs	1
._tfn_b	defs	1
._animated_ptr	defs	2
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._player_just_died	defs	1
._sp_player	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad_this_frame	defs	1
._cocos_count	defs	1
._comecocos_on	defs	1
._gallumb_flag	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
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
._n_pant_was	defs	1
._scenery_info	defs	4
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
._delayed_ct	defs	1
._hotspot_t_r	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._sonia_talk	defs	1
._xwas	defs	1
._ywas	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	46
._jetpac_frame_counter	defs	1
._rda	defs	1
._rdb	defs	1
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
._enoffsmasi	defs	2
._game_loop_flag	defs	1
._latest_hotspot	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._is128k	defs	1
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
._interact_flag	defs	1
._anillo_flag	defs	1
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
	XDEF	_abs_a
	XDEF	_draw_scr
	LIB	sp_PixelUp
	XDEF	_wyz_play_music
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
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	23654
	XDEF	_init_falling_box_buffer
	XDEF	_show_text_box
	XDEF	_spritesClip
	XDEF	_hotspot_t
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_marrullers_select_direction
	LIB	sp_CreateSpr
	LIB	sp_MoveSprAbs
	LIB	sp_BlockCount
	LIB	sp_AddMemory
	XDEF	__en_mx
	XDEF	__en_my
	XDEF	_half_life
	XDEF	_draw_decos
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
	XDEF	_gandalf_talk
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
	XDEF	_anillo_ct
	XDEF	_recuadrius
	XDEF	_beepet
	XDEF	_play_sfx
	XDEF	_decos0
	XDEF	_en_an_morido
	defc	_en_an_morido	=	23618
	XDEF	_decos1
	XDEF	_decos2
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
	XDEF	_insert_dwarf_name
	XDEF	_dwarf_ct
	XDEF	_intro_text
	XDEF	_last_estado
	LIB	sp_ListAppend
	LIB	sp_ListCreate
	LIB	sp_ListConcat
	XDEF	_t_alt
	XDEF	_pad_read
	XDEF	_hook_hotspots
	LIB	sp_JoyKempston
	LIB	sp_UpdateNow
	LIB	sp_MouseKempston
	LIB	sp_PrintString
	LIB	sp_PixelDown
	LIB	sp_MoveSprAbsC
	LIB	sp_PixelLeft
	XDEF	_dwarf_talk
	LIB	sp_InitAlloc
	XDEF	_espera_activa
	LIB	sp_DeleteSpr
	LIB	sp_JoyTimexEither
	XDEF	__n
	XDEF	_launch_comecocos_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	23645
	XDEF	_back_from_comecocos_screen
	XDEF	_title_screen
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_player_hidden
	XDEF	_hotspot_flag
	XDEF	_life_old
	LIB	sp_Invalidate
	XDEF	_en_ccx
	XDEF	_en_ccy
	LIB	sp_CreateGenericISR
	LIB	sp_JoyKeyboard
	XDEF	_tfn_a
	XDEF	_tfn_b
	XDEF	_enems_en_an_calc
	LIB	sp_FreeBlock
	LIB	sp_PrintAtDiff
	XDEF	_fall_box
	XDEF	_bottom_string
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
	XDEF	_animated_ptr
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
	XDEF	_sprite_18_a
	XDEF	_qtile
	XDEF	_draw_and_advance
	LIB	sp_MoveSprRelC
	LIB	sp_InitIM2
	XDEF	_player_just_died
	XDEF	_texts
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
	XDEF	_cocos_count
	XDEF	_comecocos_on
	LIB	sp_GetAttrAddr
	XDEF	_enem_cells
	LIB	sp_HashCreate
	XDEF	_gallumb_flag
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_sprite_remove_aid
	LIB	sp_Random32
	LIB	sp_ListInsert
	XDEF	_n_pant
	LIB	sp_ListFree
	XDEF	_en_j
	XDEF	_redraw_after_text
	XDEF	_en_an_ff
	defc	_en_an_ff	=	23651
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_enems_custom_collision
	XDEF	_draw_rectangle
	XDEF	_ISR
	LIB	sp_IntRect
	LIB	sp_ListLast
	LIB	sp_ListCurr
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
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_dwarf_names
	XDEF	_s_title
	LIB	sp_RemoveDList
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	23633
	XDEF	_en_an_vy
	defc	_en_an_vy	=	23639
	XDEF	_gpit
	XDEF	_line_of_text_clear
	XDEF	_player_cells
	XDEF	_hook_entering
	LIB	sp_ListNext
	XDEF	_n_pant_was
	XDEF	_scenery_info
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
	XDEF	_delayed_ct
	LIB	sp_MoveSprAbsNC
	LIB	sp_HuffDelete
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	23612
	XDEF	_hotspot_t_r
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
	XDEF	_sonia_talk
	XDEF	_abs
	XDEF	_s_ending
	LIB	sp_CharRight
	XDEF	_game_ending
	XDEF	_xwas
	XDEF	_redraw_from_buffer
	XDEF	_top_string
	XDEF	_temp_string
	XDEF	_ywas
	XDEF	_clear_temp_string
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
	XDEF	_rda
	XDEF	_rdb
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
	XDEF	_sprite_2_c
	XDEF	_keys_old
	LIB	sp_HuffEncode
	XDEF	_en_tocado
	XDEF	_init_player_values
	XDEF	_sprite_3_a
	XDEF	_sprite_3_b
	XDEF	_sprite_3_c
	LIB	sp_JoyTimexRight
	LIB	sp_PixelRight
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sprite_4_a
	LIB	sp_Initialize
	XDEF	_sprite_4_b
	XDEF	_sprite_4_c
	XDEF	_sprite_5_a
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	LIB	sp_JoyTimexLeft
	LIB	sp_SetMousePosKempston
	XDEF	_comportamiento_tiles
	XDEF	_tileset
	XDEF	_sprite_5_b
	LIB	sp_ComputePos
	XDEF	_sprite_5_c
	XDEF	_sprite_6_a
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	XDEF	_sprite_6_b
	XDEF	_sprite_6_c
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
	XDEF	_text10
	XDEF	_enoffsmasi
	XDEF	_talk_sounds
	XDEF	_text11
	XDEF	_text12
	XDEF	_text13
	XDEF	_text14
	XDEF	_text15
	XDEF	_text16
	XDEF	_text17
	XDEF	_text18
	XDEF	_text19
	XDEF	_text20
	XDEF	_text21
	XDEF	_text22
	XDEF	_game_loop_flag
	XDEF	_text23
	XDEF	_text24
	XDEF	_text25
	XDEF	_text26
	XDEF	_text27
	LIB	sp_IntIntervals
	XDEF	_text28
	XDEF	_my_malloc
	XDEF	_text29
	XDEF	_text30
	XDEF	_text31
	XDEF	_draw_cur_screen_decos
	XDEF	_get_coin
	XDEF	_player_flicker
	LIB	sp_inp
	XDEF	_init_hotspots
	XDEF	_latest_hotspot
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
	XDEF	_touch_tile
	XDEF	_render_all_sprites
	XDEF	_unpack
	XDEF	_interact_flag
	LIB	sp_IterateDList
	XDEF	_draw_scr_background
	XDEF	_anillo_flag
	XDEF	_game_over
	LIB	sp_LookupKey
	LIB	sp_HeapAdd
	LIB	sp_CompDirtyAddr
	LIB	sp_EmptyISR
	LIB	sp_StackSpace


; --- End of Scope Defns ---


; --- End of Compilation ---
