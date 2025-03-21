;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Fri Mar 21 11:18:33 2025



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


	XREF _nametable
	XREF tabla_teclas
	LIB cpc_KeysData
	LIB cpc_UpdTileTable
	LIB cpc_InvalidateRect
	LIB cpc_TestKeyboard
	XDEF viewport_x
	XDEF viewport_y
	defc viewport_x = 1
	defc viewport_y = 0
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
;	SECTION	text

._en_tocado
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pad1
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._pad_this_frame
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


;	SECTION	text

._my_inks
	defm	""
	defb	5

	defm	""
	defb	20

	defm	""
	defb	7

	defm	""
	defb	24

	defm	""
	defb	21

	defm	""
	defb	4

	defm	""
	defb	31

	defm	""
	defb	23

	defm	""
	defb	22

	defm	""
	defb	26

	defm	""
	defb	10

	defm	""
	defb	3

	defm	""
	defb	14

	defm	""
	defb	12

	defm	""
	defb	28

	defm	""
	defb	11

;	SECTION	code


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
	.EFECTO0
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
	.EFECTO1
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
	.EFECTO2
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO3
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO4
	defb 0xC3, 0x0E, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0xE8, 0x1B, 0x00
	defb 0x80, 0x2B, 0x00
	defb 0xFF
	.EFECTO5
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
	.EFECTO6
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
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO9
	defb 0x1F, 0x0B, 0x00
	defb 0xAF, 0x0F, 0x00
	defb 0x8A, 0x0F, 0x00
	defb 0x71, 0x0F, 0x00
	defb 0x64, 0x0F, 0x00
	defb 0x3E, 0x0C, 0x00
	defb 0x25, 0x0C, 0x00
	defb 0x25, 0x0C, 0x00
	defb 0x25, 0x0C, 0x00
	defb 0x25, 0x0A, 0x00
	defb 0x4B, 0x0A, 0x00
	defb 0x4B, 0x0A, 0x00
	defb 0x4B, 0x0A, 0x00
	defb 0x3E, 0x08, 0x00
	defb 0x3E, 0x08, 0x00
	defb 0x3E, 0x08, 0x00
	defb 0x71, 0x08, 0x00
	defb 0x3E, 0x07, 0x00
	defb 0x25, 0x05, 0x00
	defb 0x25, 0x02, 0x00
	defb 0xFF
	.EFECTO10
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
	.EFECTO11
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
	.EFECTO12
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
	defb 12,0,12,0,10,0,10,0,8,0,7,1,7,1,7,-1,6,-1,6,0,6,0,134
	;Instrumento 'Guitar 2'
	.PAUTA_4
	defb 10,0,10,0,9,0,8,0,6,0,5,1,5,0,5,0,5,-1,5,0,5,0,134
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
	defb 47,2,14,4,13,-4,12,3,11,-5,10,0,129
	;Instrumento 'Robo'
	.PAUTA_10
	defb 13,-1,13,-1,29,11,28,3,28,6,28,7,27,3,27,4,27,15,26,11,26,8,26,6,9,0,25,5,25,7,131
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
	defb 71,0,7,0,8,0,9,0,8,0,7,0,6,0,3,0,129
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
	._01_nomo_mus_bin
	BINARY "../ogt/01_nomo.mus.bin"
	._02_ayjo_mus_bin
	BINARY "../ogt/02_ayjo.mus.bin"
	._03_cave_mus_bin
	BINARY "../ogt/03_cave.mus.bin"
	._04_invisible_mus_bin
	BINARY "../ogt/04_invisible.mus.bin"
	._05_coca_mus_bin
	BINARY "../ogt/05_coca.mus.bin"
	._06_pokemos_mus_bin
	BINARY "../ogt/06_pokemos.mus.bin"
	._07_gameover_mus_bin
	BINARY "../ogt/07_gameover.mus.bin"
	._08_silence_mus_bin
	BINARY "../ogt/08_silence.mus.bin"
	._09_ending_mus_bin
	BINARY "../ogt/09_ending.mus.bin"
	._wyz_songs
	defw _00_title_mus_bin, _01_nomo_mus_bin, _02_ayjo_mus_bin, _03_cave_mus_bin
	defw _04_invisible_mus_bin, _05_coca_mus_bin, _06_pokemos_mus_bin, _07_gameover_mus_bin
	defw _08_silence_mus_bin, _09_ending_mus_bin

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
	ld de, 0x8C00
	call depack
	ld a, 0
	call CARGA_CANCION
	ld a, 1
	ld (_isr_player_on), a
	ret



._wyz_play_sound
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
	defw 0x8C00
	.TABLA_EFECTOS
	defw EFECTO0, EFECTO1, EFECTO2, EFECTO3, EFECTO4, EFECTO5, EFECTO6, EFECTO7
	defw EFECTO8, EFECTO9, EFECTO10, EFECTO11, EFECTO12
	.LINE_COUNTER
	defb 0
	._mapa
	BINARY "mapa.map.bin"
	._cerrojos
	XDEF _ts
	XDEF tiles
	._tileset
	.tiles
	._font
	BINARY "font.bin"
	._tspatterns
	defs 3072
	._tilesetc
	BINARY "tilesetc.bin"
	._sprites
	BINARY "sprites.bin"
;	SECTION	text

._sm_cox
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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

._sm_coy
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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

._sm_invfunc
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px
	defw	cpc_PutSpTileMap8x16Px

;	SECTION	code

;	SECTION	text

._sm_updfunc
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx
	defw	cpc_PutTrSp8x16TileMap2bPx

;	SECTION	code

	._sm_sprptr
	defw _sprites + 0x0000, _sprites + 0x0040, _sprites + 0x0080, _sprites + 0x00C0
	defw _sprites + 0x0100, _sprites + 0x0140, _sprites + 0x0180, _sprites + 0x01C0
	defw _sprites + 0x0200, _sprites + 0x0240, _sprites + 0x0280, _sprites + 0x02C0
	defw _sprites + 0x0300, _sprites + 0x0340, _sprites + 0x0380, _sprites + 0x03C0
	defw _sprites + 0x0400
	._sprite_18_a
	defs 96, 0
;	SECTION	text

._malotes
	defb	112
	defb	16
	defb	17
	defb	216
	defb	1
	defb	0
	defb	14
	defb	48
	defb	32
	defb	17
	defb	216
	defb	2
	defb	0
	defb	11
	defb	80
	defb	96
	defb	86
	defb	136
	defb	2
	defb	2
	defb	7
	defb	144
	defb	16
	defb	145
	defb	195
	defb	2
	defb	2
	defb	8
	defb	80
	defb	16
	defb	17
	defb	216
	defb	1
	defb	0
	defb	14
	defb	144
	defb	16
	defb	17
	defb	216
	defb	0
	defb	1
	defb	12
	defb	16
	defb	128
	defb	17
	defb	216
	defb	0
	defb	-1
	defb	12
	defb	128
	defb	32
	defb	130
	defb	210
	defb	1
	defb	0
	defb	2
	defb	80
	defb	128
	defb	88
	defb	200
	defb	2
	defb	0
	defb	2
	defb	96
	defb	32
	defb	98
	defb	194
	defb	1
	defb	0
	defb	1
	defb	16
	defb	64
	defb	20
	defb	100
	defb	2
	defb	0
	defb	4
	defb	128
	defb	96
	defb	134
	defb	198
	defb	1
	defb	0
	defb	2
	defb	208
	defb	112
	defb	17
	defb	216
	defb	-1
	defb	0
	defb	12
	defb	80
	defb	112
	defb	87
	defb	151
	defb	1
	defb	0
	defb	2
	defb	144
	defb	80
	defb	17
	defb	216
	defb	0
	defb	1
	defb	12
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
	defb	16
	defb	48
	defb	19
	defb	72
	defb	2
	defb	2
	defb	10
	defb	192
	defb	64
	defb	116
	defb	200
	defb	-2
	defb	2
	defb	8
	defb	80
	defb	16
	defb	65
	defb	81
	defb	0
	defb	0
	defb	3
	defb	208
	defb	96
	defb	102
	defb	214
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	80
	defb	37
	defb	197
	defb	2
	defb	0
	defb	3
	defb	160
	defb	32
	defb	17
	defb	216
	defb	-1
	defb	1
	defb	12
	defb	176
	defb	16
	defb	177
	defb	180
	defb	0
	defb	2
	defb	1
	defb	176
	defb	64
	defb	17
	defb	216
	defb	-1
	defb	0
	defb	14
	defb	96
	defb	112
	defb	17
	defb	216
	defb	2
	defb	0
	defb	14
	defb	80
	defb	16
	defb	17
	defb	83
	defb	-2
	defb	2
	defb	8
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
	defb	160
	defb	16
	defb	161
	defb	182
	defb	2
	defb	2
	defb	7
	defb	32
	defb	64
	defb	36
	defb	214
	defb	2
	defb	2
	defb	10
	defb	176
	defb	80
	defb	101
	defb	181
	defb	-2
	defb	0
	defb	3
	defb	64
	defb	112
	defb	71
	defb	215
	defb	1
	defb	0
	defb	2
	defb	192
	defb	112
	defb	103
	defb	199
	defb	-2
	defb	0
	defb	3
	defb	144
	defb	48
	defb	17
	defb	216
	defb	1
	defb	0
	defb	12
	defb	48
	defb	32
	defb	50
	defb	72
	defb	1
	defb	1
	defb	8
	defb	80
	defb	64
	defb	17
	defb	216
	defb	1
	defb	0
	defb	11
	defb	32
	defb	64
	defb	17
	defb	216
	defb	0
	defb	1
	defb	11
	defb	160
	defb	16
	defb	17
	defb	216
	defb	0
	defb	2
	defb	11
	defb	16
	defb	112
	defb	17
	defb	216
	defb	1
	defb	0
	defb	11
	defb	144
	defb	80
	defb	17
	defb	216
	defb	0
	defb	1
	defb	11
	defb	80
	defb	16
	defb	81
	defb	194
	defb	1
	defb	1
	defb	8
	defb	96
	defb	80
	defb	17
	defb	216
	defb	1
	defb	0
	defb	12
	defb	48
	defb	16
	defb	49
	defb	69
	defb	2
	defb	2
	defb	8
	defb	80
	defb	96
	defb	86
	defb	198
	defb	2
	defb	0
	defb	3
	defb	208
	defb	64
	defb	20
	defb	212
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	96
	defb	54
	defb	198
	defb	2
	defb	0
	defb	3
	defb	80
	defb	16
	defb	17
	defb	216
	defb	0
	defb	1
	defb	12
	defb	48
	defb	112
	defb	55
	defb	215
	defb	1
	defb	0
	defb	8
	defb	64
	defb	80
	defb	69
	defb	135
	defb	1
	defb	1
	defb	8
	defb	48
	defb	16
	defb	17
	defb	216
	defb	0
	defb	2
	defb	12
	defb	112
	defb	128
	defb	17
	defb	216
	defb	0
	defb	-1
	defb	12
	defb	112
	defb	16
	defb	17
	defb	216
	defb	0
	defb	1
	defb	12
	defb	64
	defb	80
	defb	17
	defb	216
	defb	0
	defb	-1
	defb	11
	defb	16
	defb	96
	defb	22
	defb	168
	defb	2
	defb	2
	defb	8
	defb	192
	defb	16
	defb	161
	defb	197
	defb	-1
	defb	1
	defb	8
	defb	112
	defb	112
	defb	115
	defb	119
	defb	0
	defb	-2
	defb	3
	defb	176
	defb	16
	defb	17
	defb	216
	defb	0
	defb	1
	defb	11
	defb	208
	defb	128
	defb	17
	defb	216
	defb	0
	defb	-2
	defb	13
	defb	128
	defb	16
	defb	17
	defb	216
	defb	2
	defb	0
	defb	13
	defb	48
	defb	128
	defb	17
	defb	216
	defb	0
	defb	-1
	defb	13
	defb	112
	defb	48
	defb	17
	defb	216
	defb	2
	defb	0
	defb	12
	defb	64
	defb	96
	defb	17
	defb	216
	defb	0
	defb	2
	defb	12
	defb	48
	defb	16
	defb	17
	defb	216
	defb	0
	defb	2
	defb	12
	defb	144
	defb	96
	defb	17
	defb	216
	defb	2
	defb	0
	defb	12
	defb	255
	defs	1
	defs	1
	defs	1
	defs	1
	defs	1
	defs	1

;	SECTION	code

;	SECTION	text

._enoffs_index
	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	3

	defm	""
	defb	5

	defm	""
	defb	7

	defm	""
	defb	7

	defm	""
	defb	7

	defm	""
	defb	9

	defm	""
	defb	11

	defm	""
	defb	13

	defm	""
	defb	15

	defm	""
	defb	17

	defm	""
	defb	19

	defm	""
	defb	21

	defm	""
	defb	23

	defm	""
	defb	25

	defm	""
	defb	27

	defm	""
	defb	29

	defm	""
	defb	30

	defm	""
	defb	31

	defm	"!#%')+,.0134468:;=?AAAA"
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
	defb	209
	defb	3
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
	defb	53
	defb	3
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
	defb	18
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
	defb	99
	defb	3
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


._beepet
	ret



.__tile_address
	ld a, (__y)
	add a, a ; 2 4
	add a, a ; 4 4
	add a, a ; 8 4
	ld h, 0 ; 2
	ld l, a ; 4
	add hl, hl ; 16 11
	add hl, hl ; 32 11
	; 44 t-states
	; HL = _y * 32
	ld de, (__x)
	ld d, 0
	add hl, de
	; HL = _y * 32 + _x
	ld de, _nametable
	add hl, de
	ex de, hl
	; DE = buffer address
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
	call __tile_address ; DE = buffer address
	ex de, hl
	ld a, (__t)
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
	ld a, (__x)
	ld e, a
	ld a, (__y)
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



._invalidate_viewport
	ld B, 0
	ld C, 1
	ld D, 0+19
	ld E, 1+29
	call cpc_InvalidateRect
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
	.draw_2_digits_shortcut
	ld d, 0
	ld e, a
	ld hl, 10
	call l_div_u
	ld a, e
	add 16
	ld (__n), a
	ld a, l
	add 16
	ld (__t), a
	call __tile_address ; DE = buffer address
	ld a, (__t)
	ld (de), a
	inc de
	ld a, (__n)
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	inc e
	call cpc_UpdTileTable
	ret



._draw_text
	ld hl, 6
	add hl, sp
	ld a, (hl)
	ld (__x), a
	ld (__t), a
	dec hl
	dec hl
	ld a, (hl)
	ld (__y), a
	dec hl
	ld a, (hl)
	dec hl
	ld l, (hl)
	ld h, a
	.draw_text_pre_loop
	push hl
	xor a
	ld (__n), a ; Strlen
	call __tile_address ; DE = buffer address
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
	ld a, (__n)
	inc a
	ld (__n), a
	jr draw_text_loop
	.print_str_inv
	; Invalidate cells based upon strlen.
	ld a, (__y)
	ld b, a
	ld d, a
	ld a, (__x)
	ld c, a
	ld a, (__n)
	add c
	dec a
	ld e, a
	call cpc_InvalidateRect
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



._espera_activa
.i_18
	call	_pad_read
	halt
	halt
	halt
	halt
	halt
	halt
	ld	a,(_pad_this_frame)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_17
.i_19
.i_16
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_18
.i_17
	ret



._cpc_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_20
	ld b, 0
	._cpc_screen_update_inv_loop
	push bc
	ld a, b
	sla a
	sla a
	sla a
	sla a
	ld d, 0
	ld e, a
	ld hl, _sp_sw
	add hl, de
	ld b, h
	ld c, l
	ld de, _cpc_screen_update_inv_ret
	push de
	ld de, 12
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	ld h, b
	ld l, c
	ret
	._cpc_screen_update_inv_ret
	pop bc
	inc b
	ld a, b
	cp 1 + 3 + 0 + 0 + 0
	jr nz, _cpc_screen_update_inv_loop
.i_20
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_21
	ld b, 1 + 3 + 0 + 0 + 0
	._cpc_screen_update_upd_loop
	dec b
	push bc
	ld a, b
	sla a
	sla a
	sla a
	sla a
	ld d, 0
	ld e, a
	ld hl, _sp_sw
	add hl, de
	ld b, h
	ld c, l
	ld de, _cpc_screen_update_upd_ret
	push de
	ld de, 14
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	ld h, b
	ld l, c
	ret
	._cpc_screen_update_upd_ret
	pop bc
	xor a
	or b
	jr nz, _cpc_screen_update_upd_loop
	._cpc_screen_update_done
.i_21
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



._cpc_Border
	ld a, l
	ld bc, 0x7F11
	out (c), c
	out (c), a
	ret



._pal_set
	ld	hl,16 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_22
	ld	hl,_gpit
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_23
	ld	hl,(_gpit)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_gpit)
	ld	h,0
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	cpc_SetColour
	pop	bc
	pop	bc
	jp	i_22
.i_23
	ret



._cpc_HardPause
	ld a, l
	.cpc_HardPause_outer
	ld b, 6
	.cpc_HardPause_inner
	halt
	djnz cpc_HardPause_inner
	dec a
	jr nz, cpc_HardPause_outer
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

._decos3
	defm	""
	defb	162

	defm	"<"
	defb	255

;	SECTION	code


;	SECTION	text

._decos4
	defm	""
	defb	145

	defm	""
	defb	25

	defm	""
	defb	255

;	SECTION	code


;	SECTION	text

._decos5
	defm	""
	defb	154

	defm	"h"
	defb	255

;	SECTION	code


;	SECTION	text

._decos_ending
	defm	""
	defb	175

	defm	"W"
	defb	170

	defm	"f"
	defb	172

	defm	"g"
	defb	173

	defm	"h"
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
	defm	"_GANDALF%AYUDAME A ENTRAR EN L"
	defm	"A%MONTA/A DE AHI CERCA,%DONDE "
	defm	"HABITA EL DRAGON%CHARMANDER PO"
	defm	"KEMOS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text6
	defm	"_BILBOS%LA MONTA/A ESTA CERRA-"
	defm	"%DA CUAL TOTO DE NANCY.%ES QUE"
	defm	" HAY UN TESORO%DENTRO?"
	defb	0

;	SECTION	code



;	SECTION	text

._text7
	defm	"_GANDALF%BILBOS, TRAE 13 NOMOS"
	defm	"%Y LES OBLIGARE A ABRIR%LA PUE"
	defm	"RTA CON MI MAGIA"
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
	defm	"E-%PRESENTA EL PENSAMIEN-%TO D"
	defm	"E BILBOS"
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

._text17
	defm	"DE PRONTO LLEGA UN%NOMO..."
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
	defm	"%SORO Y SER GRANDES DE%NUEVO *"
	defm	"EN SENTIDO ME-%TAFORICO+ PERO "
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
	defm	"_ENANITO%NO PODRAS PASAR DE EL"
	defm	"%SI PUEDE VERTE ..."
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

._text32
	defm	"_GALLUMB%AH, ERES TU, RUBIO!%K"
	defm	"IERE PELEA, LADRON?%TE REBIENT"
	defm	"O, PAIASO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text33
	defm	"_BILBOS%AY! QUE SOPAPO! CON LO"
	defm	"%BAJITO QUE ES Y COMO%LA SUERT"
	defm	"A EL IOPUTA!%ME TIEMBLAN LOS P"
	defm	"I/OS"
	defb	0

;	SECTION	code



;	SECTION	text

._text34
	defm	"_BILBOS%YA ECHE LAS RABAS...%C"
	defm	"OMO MAREA ESTO... NO%CREO QUE "
	defm	"LO AGUANTE%MUCHAS VECES..."
	defb	0

;	SECTION	code



;	SECTION	text

._text35
	defm	"_BILBOS%HOBBIT, HOBA... CADA%D"
	defm	"IA TE QUIERO MA...%QUE MAREO.."
	defm	". MI MAE%ME DESMAYO..."
	defb	0

;	SECTION	code



;	SECTION	text

._text36
	defm	"_BILBOS%AY... ESTO ES COMO UNA"
	defm	"%RESACA DE LARIOS! NO%DEBO USA"
	defm	"R EL ANILLO%MAS QUE CUANDO SEA"
	defm	" IM-%PRESCINDIBLE HACERLO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text37
	defm	"_GANDALF%ESO AUN NO TE LO PUED"
	defm	"O%DECIR!!"
	defb	0

;	SECTION	code



;	SECTION	text

._text38
	defm	"_CHARMANDER%TE PILLE, INTRUSO!"
	defm	"%QUE QUIERES? VIENES%A ROBAR M"
	defm	"I TESORO?"
	defb	0

;	SECTION	code



;	SECTION	text

._text39
	defm	"_BILBOS%ESO AUN NO TE LO PUEDO"
	defm	"%DECIR!!"
	defb	0

;	SECTION	code



;	SECTION	text

._text40
	defm	"_CHARMANDER%PREPARATE PARA LUC"
	defm	"HAR%POR TU VIDA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text41
	defm	"_BILBOS%BAH. TODOS SABEN QUE%P"
	defm	"LANTA GANA A FUEGO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text42
	defm	"_AMADOR%HAY UN VIEJO QUE NO%ME"
	defm	" DEJA PODAR EL SETO.%ENCUENTRA"
	defm	"LO Y HAZ QUE%SE VAYA, BILBOS!"
	defb	0

;	SECTION	code



;	SECTION	text

._mission0
	defm	"BUSCA AL VIEJO PELLEJO"
	defb	0

;	SECTION	code



;	SECTION	text

._mission1
	defm	"ENCUENTRA LOS 13 NOMOS"
	defb	0

;	SECTION	code



;	SECTION	text

._mission2
	defm	"EXPLORA LA CUEVA GORDA"
	defb	0

;	SECTION	code



;	SECTION	text

._mission3
	defm	"BUSCA EL ANILLO,QUILLO"
	defb	0

;	SECTION	code



;	SECTION	text

._mission4
	defm	"ENCUENTRA EL TESORO!  "
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
	defw	0
	defw	0
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
	defw	_text39
	defw	_text40
	defw	_text41
	defw	_text42

;	SECTION	code

;	SECTION	text

._missions
	defw	_mission0
	defw	_mission1
	defw	_mission2
	defw	_mission3
	defw	_mission4

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



	.cuts0
	defb 46|128, 4, 5, 47|128, 6, 46|128, 37, 255
	.cuts1
	defb 47|128, 22, 23, 34|128, 24, 255
	.cuts2
	defb 17|128, 19, 20, 21, 255
	.cuts3
	defb 33|128, 27, 28, 0|128, 17, 17|128, 30, 33|128, 31, 255
	.cuts4
	defb 27|128, 38, 47|128, 39, 27|128, 40, 47|128, 41, 255
	.run_cutscene
	ld a, (hl)
	inc hl
	cp 0xff
	ret z
	bit 7, a
	jr z, run_cutscene_tb
	and 0x7f
	ld (_rdb), a
	jr run_cutscene
	.run_cutscene_tb
	ld (_rda), a
	push hl
	call _show_text_box
	pop hl
	jr run_cutscene

._print_tile_inv
	call __tile_address
	ld a, (__n)
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ret



._update_mission
	ld a, (_rda)
	sla a
	ld h, 0
	ld l, a
	ld de, _missions
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld a, 5
	ld (__x), a
	ld a, 21
	ld (__y), a
	ld a, 71
	ld (__n), a
	call draw_text_pre_loop
	ret



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



._draw_text_cbc
	.dtcbc_loop
	ld a, (_rdx)
	ld (__x), a
	ld c, a
	inc a
	ld (_rdx), a
	ld a, (hl)
	or a
	jr z, dtcbc_done
	inc hl
	sub 32
	halt
	halt
	jr z, dtcbc_loop
	push hl
	ld (__n), a
	ld a, (_rdy)
	ld (__y), a
	call _print_tile_inv
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	pop hl
	jr dtcbc_loop
	.dtcbc_done
	xor a
	ld (_rdc), a
	ret



._show_text_box
	ld	hl,_texts
	push	hl
	ld	hl,(_rda)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_gp_gen),hl
	ld a, (_rdb)
	or a
	ld a, 6
	jr z, stb_do
	dec a
	.stb_do
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _top_string
	call draw_text_pre_loop
	ld a, 7
	ld (_rdy), a
	.stb_loop
	call _clear_temp_string
	ld a, (_rdb)
	or a
	jr nz, stb_top
	ld a, (_rdy)
	cp 8
	jr c, stb_notop
	.stb_top
	ld a, (_rdy)
	dec a
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _temp_string
	call draw_text_pre_loop
	.stb_notop
	ld a, (_rdy)
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _temp_string
	call draw_text_pre_loop
	ld a, (_rdy)
	inc a
	ld (__y), a
	ld a, 4
	ld (__x), a
	ld hl, _bottom_string
	call draw_text_pre_loop
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
	ld a, 4
	ld (_rdx), a
	ld hl, _temp_string
	call dtcbc_loop
	ld a, (_rdy)
	add 2
	ld (_rdy), a
	ld hl, (_gp_gen)
	ld a, (hl)
	or a
	jr z, stb_exitloop
	inc hl
	ld (_gp_gen), hl
	jp stb_loop
	.stb_exitloop
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,7	;const
	call	_wyz_play_sound
	.stb_waitkey
	call _pad_read
	ld a, (_pad_this_frame)
	inc a
	jr z, stb_waitkey
	ld a, (_redraw_after_text)
	or a
	jr z, stb_redraw_done
	call _redraw_from_buffer
	call _hotspot_paint
	call _render_all_sprites
	ld hl, 1
	push hl
	call _cpc_UpdateNow
	pop hl
	.stb_redraw_done
	ld a, 1
	ld (_redraw_after_text), a
	ret



._recuadrius
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_85
.i_83
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_85
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_84
	jp	nc,i_84
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_88
.i_86
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_88
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
	jp	nc,i_87
	ld a, (_rdi)
	add 0
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdi)
	ld c, a
	ld a, #(0+19)
	sub c
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
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
	jp	nc,i_89
	ld a, (_rdx)
	add 0
	ld (__y), a
	ld a, (_rdi)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdx)
	add 0
	ld (__y), a
	ld a, (_rdi)
	ld c, a
	ld a, #(1+29)
	sub c
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), a
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
.i_89
	jp	i_86
.i_87
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jp	i_83
.i_84
	ret



._draw_cur_screen_decos
	ld a, (_n_pant)
	cp 0
	jr z, dcsd_0
	cp 1
	jr z, dcsd_1
	cp 4
	jr z, dcsd_4
	cp 5
	jr z, dcsd_5
	cp 17
	jr z, dcsd_17
	cp 24
	jr z, dcsd_24
	cp 28
	jp z, dcsd_28
	cp 31
	jp z, dcsd_31
	ret
	.dcsd_0
	ld hl, _decos0
	ld (_gp_gen), hl
	jp _draw_decos
	.dcsd_1
	ld hl, _decos1
	ld (_gp_gen), hl
	jp _draw_decos
	.dcsd_4
	ld a, (_gallumb_flag)
	cp 1
	ret nc
	ld a, 6
	ld c, a
	ld (__x), a
	ld a, 4
	ld (__y), a
	xor a
	ld (__n), a
	ld (__t), a
	call set_map_tile_do
	ld a, 240
	ld (_hotspot_y), a
	ret
	.dcsd_5
	ld hl, _decos2
	ld (_gp_gen), hl
	jp _draw_decos
	.dcsd_17
	ld a, (_sonia_talk)
	ret nz
	ld hl, _decos3
	ld (_gp_gen), hl
	jp _draw_decos
	.dcsd_24
	ld a, (_gandalf_talk)
	cp 2
	ret nz
	ld a, (_dwarf_talk)
	or a
	ld a, 9
	ld c, a
	ld (__x), a
	ld a, 7
	jr nz, dcsd_24_at
	ld (__y), a
	ld a, 17
	ld (__t), a
	jr dcsd_24_end
	.dcsd_24_at
	ld a, 9
	ld (__y), a
	ld a, 15
	ld (__t), a
	jr dcsd_24_end
	.dcsd_24_end
	ld a, 8
	ld (__n), a
	call set_map_tile_do
	ret
	.dcsd_28
	ld a, (_amador_talk)
	or a
	ret nz
	ld hl, _decos5
	ld (_gp_gen), hl
	jp _draw_decos
	.dcsd_31
	ld a, (_gandalf_talk)
	cp 2
	ret z
	ld hl, _decos4
	ld (_gp_gen), hl
	jp _draw_decos
	ret



._launch_comecocos_screen
	ld a, (_n_pant)
	ld (_n_pant_was), a
	ld a, (_gpx)
	ld (_xwas), a
	ld a, (_gpy)
	ld (_ywas), a
	call _recuadrius
	ld a, (_rda)
	add 35
	ld (_n_pant), a
	xor a
	ld (_redraw_after_text), a
	ld (_rdb), a
	ld a, (_rda)
	add 11
	ld (_rda), a
	call _show_text_box
	ld a, 16
	ld (_gpx), a
	ld (_gpy), a
	ld hl, 16*64
	ld (_player), hl
	ld (_player + 2), hl
	ld a, 1
	ld (_comecocos_on), a
	dec a
	ld (_player + 45), a
	ld	hl,5	;const
	call	_wyz_play_music
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
	ld hl, _player + 23
	ld (hl), 2
	inc hl
	ld (hl), 50
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



._bilbos_hangover
	xor a
	ld (_redraw_after_text), a
	call _show_text_box
	call _recuadrius
	ld a, (_inside_gallumb_lair)
	or a
	jr z, no_gallumb_lair
	ld a, 12
	ld (_n_pant), a
	ld hl, 2*1024
	ld (_player), hl
	ld (_player + 2), hl
	.no_gallumb_lair
	ld a, 0xff
	ld (_on_pant), a
	ld a, 1
	ld (_just_passed_out), a
	ret


	._s_pokemon
	BINARY "pokemonc.bin"
	._pokemon_tiles
	BINARY "poketilesc.bin"
	._a_list
	._a_growl defb 0, 255, 33, 8
	defm "AULLIDO%    "
	._a_tackle defb 35, 242, 7, 0
	defm "PLACAJE%    "
	._a_leechseed defb 0, 229, 2, 1
	defm "DRENADORAS% "
	._a_vinewhip defb 35, 255, 1, 0
	defm "LATIGO CEPA%"
	._a_scratch defb 40, 255, 20, 0
	defm "ARA/AZO%    "
	._a_ember defb 40, 255, 10, 2
	defm "BRASAS%     "
	._a_leer defb 0, 255, 5, 4
	defm "MALICIOSO%  "
	._bubasaur
	defb 45, 49, 49, 45, 0, 45
	defm "BUBASAUR% "
	defw _a_growl, _a_tackle, _a_leechseed, _a_vinewhip
	._charmander
	defb 39, 52, 43, 65, 0, 39
	defm "CHRMANDER%"
	defw _a_growl, _a_scratch, _a_ember, _a_leer
;	SECTION	text

._str_wipe
	defm	"               "
	defb	0

;	SECTION	code



;	SECTION	text

._str_used
	defm	" USO"
	defb	0

;	SECTION	code



;	SECTION	text

._str_failed
	defm	"PERO FALLO!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_useless
	defm	"PERO FUE INUTIL"
	defb	0

;	SECTION	code



;	SECTION	text

._str_nomore1
	defm	"NO TIENES"
	defb	0

;	SECTION	code



;	SECTION	text

._str_nomore2
	defm	"MAS POKEMON!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_leech
	defm	"DRENAJE HIERE A"
	defb	0

;	SECTION	code



;	SECTION	text

._str_is
	defm	" ES"
	defb	0

;	SECTION	code



;	SECTION	text

._str_burn
	defm	"QUEMADO!!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_regain
	defm	"RECUPERA SALUD"
	defb	0

;	SECTION	code



;	SECTION	text

._str_infected
	defm	"FUE INFECTADO!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_burning
	defm	"ESTA ARDIENDO"
	defb	0

;	SECTION	code



;	SECTION	text

._str_genitive
	defm	""
	defb	0

;	SECTION	code



;	SECTION	text

._str_low_def
	defm	"BAJA DEFENSA!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_low_attack
	defm	"BAJA ATAQUE!"
	defb	0

;	SECTION	code



;	SECTION	text

._str_defeated
	defm	"HA PERDIDO"
	defb	0

;	SECTION	code



	defc _player_stats = 0xF000 + 0x600
	defc _player_name = 0xF000 + 0x600 + 6
	defc _pk_player_attacks = 0xF000 + 0x600 + 16
	defc _opponent_stats = 0xF000 + 0x600 + 80
	defc _opponent_name = 0xF000 + 0x600 + 86
	defc _opponent_attacks = 0xF000 + 0x600 + 96
;	SECTION	text

._pk_main_menu
	defm	"????ATACAR!%    ????USAR ITEM%"
	defm	"  ????OTRO POKEMON????ESCAPARS"
	defm	"E%  "
	defb	0

;	SECTION	code



;	SECTION	text

._pk_items_menu
	defm	"????GALLINA%    ????ANILLO PEN"
	defm	"E%????LAPIZ%      ????JERINGUI"
	defm	"LLA%"
	defb	0

;	SECTION	code




._pk_calc_stat
	ld	a,(_pk_base)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ex	de,hl
	ld	hl,(_pk_iv)
	ld	h,0
	add	hl,de
	ex	de,hl
	ld	hl,(_pk_effort)
	ld	h,0
	add	hl,de
	ex	de,hl
	ld	hl,(_pk_level)
	ld	h,0
	call	l_mult
	ld	de,100	;const
	ex	de,hl
	call	l_div_u
	ld	bc,5
	add	hl,bc
	ld	(_pk_temp),hl
	ld	de,255	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_108
	ld	hl,255 % 256	;const
	ret


.i_108
	ld	hl,(_pk_temp)
	ld	h,0
	ret



._pk_calc_hp
	ld	a,(_pk_base)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ex	de,hl
	ld	hl,(_pk_iv)
	ld	h,0
	add	hl,de
	ex	de,hl
	ld	hl,(_pk_effort)
	ld	h,0
	add	hl,de
	ex	de,hl
	ld	hl,(_pk_level)
	ld	h,0
	call	l_mult
	ld	de,100	;const
	ex	de,hl
	call	l_div_u
	ex	de,hl
	ld	hl,(_pk_level)
	ld	h,0
	add	hl,de
	ld	bc,10
	add	hl,bc
	ld	(_pk_temp),hl
	ld	de,255	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_109
	ld	hl,255 % 256	;const
	ret


.i_109
	ld	hl,(_pk_temp)
	ld	h,0
	ret



._pk_calc_damage
	ld	a,(_pk_level)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,5	;const
	ex	de,hl
	call	l_div_u
	inc	hl
	inc	hl
	ex	de,hl
	ld	hl,(_pk_at)
	ld	h,0
	call	l_mult
	ex	de,hl
	ld	hl,(_pk_pw)
	ld	h,0
	call	l_mult
	ex	de,hl
	ld	hl,(_pk_df)
	ld	h,0
	call	l_div_u
	ld	de,50	;const
	ex	de,hl
	call	l_div_u
	inc	hl
	inc	hl
	ld	(_pk_temp),hl
	ld	de,255	;const
	ex	de,hl
	call	l_ugt
	jp	nc,i_110
	ld	hl,255 % 256	;const
	ret


.i_110
	ld	hl,(_pk_temp)
	ld	h,0
	ret



._pk_init_pokemon_pa1_from_ptr
	ld	a,#(8 % 256 % 256)
	ld	(_pk_iv),a
	ld	a,#(0 % 256 % 256)
	ld	(_pk_effort),a
	ld	hl,10 % 256	;const
	ld	a,l
	ld	(_pk_level),a
	ld a, (_pa1)
	or a
	jr nz, pk_ip_cs_op
	ld de, _pk_data
	jr pk_ip_cs
	.pk_ip_cs_op
	ld de, _pk_data + 16 + 64
	.pk_ip_cs
	ld hl, (_p_ptr)
	ld a, (hl)
	inc hl
	ld (_pk_base), a
	push hl
	push de
	call _pk_calc_hp
	ld a, l
	pop de
	pop hl
	ld (de), a
	ld (_pa1), a
	inc de
	ld a, (hl)
	inc hl
	ld (_pk_base), a
	push hl
	push de
	call _pk_calc_stat
	ld a, l
	pop de
	pop hl
	ld (de), a
	inc de
	ld a, (hl)
	inc hl
	ld (_pk_base), a
	push hl
	push de
	call _pk_calc_stat
	ld a, l
	pop de
	pop hl
	ld (de), a
	inc de
	ld a, (hl)
	inc hl
	ld (_pk_base), a
	push hl
	push de
	call _pk_calc_stat
	ld a, l
	pop de
	pop hl
	ld (de), a
	inc de
	ldi
	inc hl
	ld a, (_pa1)
	ld (de), a
	inc de
	ld bc, 10
	ldir
	ld b, 4
	.pk_ip_ca_loop
	push bc
	push hl
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld bc, 16
	ldir
	pop hl
	inc hl
	inc hl
	pop bc
	djnz pk_ip_ca_loop
	ret



._pk_display_life
	ld	a,(_pa1)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asl
	ex	de,hl
	ld	hl,(_pa2)
	ld	h,0
	call	l_div_u
	ld	h,0
	ld	a,l
	ld	(_pa1),a
	ld b, 0
	.pk_dl_loop
	push bc
	ld a, (_pa1)
	cp b
	ld a, 8
	jr nc, pk_dl_nobar
	ld a, 9
	.pk_dl_nobar
	ld (__n), a
	call _print_tile_inv
	ld a, (__x)
	inc a
	ld (__x), a
	pop bc
	inc b
	ld a, b
	cp 8
	jr nz, pk_dl_loop
	ret



._pk_update_displays
	ld ix, _pk_data
	ld a, (ix + 0 + 16 + 64)
	ld (_pa1), a
	ld a, (ix + 5 + 16 + 64)
	ld (_pa2), a
	ld	a,#(8 % 256 % 256)
	ld	(__x),a
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(__y),a
	call	_pk_display_life
	ld ix, _pk_data
	ld a, (ix + 0)
	ld (_pa1), a
	ld a, (ix + 5)
	ld (_pa2), a
	ld a, 12
	ld (__y), a
	ld a, 20
	ld (__x), a
	ld a, (_pa1)
	call draw_2_digits_shortcut
	ld a, 24
	ld (__x), a
	ld a, (_pa2)
	call draw_2_digits_shortcut
	ld	a,#(18 % 256 % 256)
	ld	(__x),a
	ld	hl,11 % 256	;const
	ld	a,l
	ld	(__y),a
	call	_pk_display_life
	ret



._pk_portrait
	ld a, (__n)
	sla a
	sla a
	sla a
	sla a
	ld b, a
	sla a
	add b
	add 64
	ld (_gpit), a
	call __tile_address
	ld b, 6
	.pk_portrait_loop
	ld c, 8
	.pk_portrait_loop_row
	push bc
	ld a, (_psk)
	cp b
	jr nc, pk_portrait_paint
	xor a
	ld (de), a
	inc de
	jr pk_portrait_paint_done
	.pk_portrait_paint
	ld a, (_gpit)
	ld (de), a
	inc de
	inc a
	ld (_gpit), a
	.pk_portrait_paint_done
	pop bc
	dec c
	jr nz, pk_portrait_loop_row
	ld hl, 24
	add hl, de
	ex de, hl
	djnz pk_portrait_loop
	ld a, (__x)
	ld c, a
	ld a, (__y)
	ld b, a
	ld a, (__x)
	add 7
	ld e, a
	ld a, (__y)
	add 5
	ld d, a
	call cpc_InvalidateRect
	ret



._pk_delay
	ld b, 8*6
	.pk_delay_loop
	halt
	djnz pk_delay_loop
	ret



._pk_animate_portrait
	ld a, 6
	ld (_psk), a
	ld a, (__n)
	ld (__t), a
	ld a, 2
	ld (__n), a
	call _pk_portrait
	ld a, (_pan)
	ld c, a
	ld a, (__x)
	add c
	ld (__x), a
	ld a, (__t)
	ld (__n), a
	call _pk_portrait
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pk_delay
	ld a, 2
	ld (__n), a
	call _pk_portrait
	ld a, (_pan)
	ld c, a
	ld a, (__x)
	add c
	ld (__x), a
	ld a, (__t)
	ld (__n), a
	call _pk_portrait
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pk_delay
	ld a, 2
	ld (__n), a
	call _pk_portrait
	ld a, (_pan)
	sla a
	ld c, a
	ld a, (__x)
	sub c
	ld (__x), a
	ld a, (__t)
	ld (__n), a
	call _pk_portrait
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pk_delay
	ret



._pk_animate_death
	ld a, 6
	.looper
	ld (_psk), a
	or a
	ret z
	call _pk_portrait
	ld hl, 0
	push hl
	call _cpc_UpdateNow
	ld a, (_psk)
	dec a
	jr looper
	ret



._pk_animate_damaged
	ld	hl,_en_an_next_frame
	push	hl
	ld	hl,_sprites+1024
	pop	de
	call	l_pint
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	ld b, 8
	.pk_andmg_loop
	push bc
	call _rand
	ld a, l
	and 63
	ld c, a
	ld a, (__x)
	dec a
	sla a
	sla a
	sla a
	add c
	ld (_rdx), a
	call _rand
	ld a, l
	and 31
	ld c, a
	ld a, (__y)
	sla a
	sla a
	sla a
	add c
	ld (_rdy), a
	call _render_this_enemy
	halt
	halt
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	pop bc
	djnz pk_andmg_loop
	call	_saca_a_todo_el_mundo_de_aqui
	ld a, (__n)
	ld (__t), a
	ld b, 4
	.pk_andmg_blink_loop
	push bc
	ld a, 2
	ld (__n), a
	call _pk_portrait
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pk_delay
	ld a, (__t)
	ld (__n), a
	call _pk_portrait
	halt
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pk_delay
	pop bc
	djnz pk_andmg_blink_loop
	ret



._pk_simple_menu
	xor a
	ld (_pa2), a
	inc a
	ld (_pa3), a
	.pk_simple_menu_loop
	call _pad_read
	ld a, (_pad_this_frame)
	and 0x04
	jr nz, pk_sm_up_done
	ld a, (_pa1)
	ld c, a
	ld a, (_pa2)
	dec a
	cp c
	jr c, pk_sm_up_set
	jr z, pk_sm_up_set
	ld a, c
	dec a
	.pk_sm_up_set
	ld (_pa2), a
	.pk_sm_up_done
	ld a, (_pad_this_frame)
	and 0x08
	jr nz, pk_sm_down_done
	ld a, (_pa1)
	ld c, a
	ld a, (_pa2)
	inc a
	cp c
	jr c, pk_sm_down_set
	xor a
	.pk_sm_down_set
	ld (_pa2), a
	.pk_sm_down_done
	ld a, (_pad_this_frame)
	and 0x10
	jr z, pk_simple_menu_done
	ld a, (_pa3)
	ld c, a
	ld a, (_pa2)
	cp c
	jr z, pk_simple_menu_loop
	ld a, 17
	ld (__x), a
	ld a, (_pa2)
	add 15
	ld (__y), a
	ld a, 0x3F
	ld (__n), a
	call _print_tile_inv
	ld a, (_pa3)
	add 15
	ld (__y), a
	xor a
	ld (__n), a
	call _print_tile_inv
	ld a, (_pa2)
	ld (_pa3), a
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jr pk_simple_menu_loop
	.pk_simple_menu_done
	ld a, (___y)
	ld (__y), a
	call _pk_clear_rec
	ret



._pk_pad_wait
	ld a, 1
	ld (_rdb), a
	.pk_pad_wait_loop
	call _pad_read
	ld a, (_pad_this_frame)
	and 0x10
	jr nz, pk_pad_wait_nobreak
	xor a
	ld (_rdb), a
	.pk_pad_wait_nobreak
	ld e, 0
	ld a, (_rda)
	inc a
	ld (_rda), a
	and 32
	jr z, pk_pad_wait_skip_arrow
	ld a, (_rdb)
	or a
	jr z, pk_pad_wait_skip_arrow
	ld e, 0x3F
	.pk_pad_wait_skip_arrow
	ld a, e
	ld (__n), a
	ld a, 18
	ld (__y), a
	ld a, 15
	ld (__x), a
	call _print_tile_inv
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld a, (_rdb)
	or a
	jr nz, pk_pad_wait_loop
	ret



._pk_print_menu
	ld a, 15
	ld (_rdy), a
	ld b, 4
	.pk_pa_loop
	push bc
	inc hl
	inc hl
	ld a, (hl)
	ld (_rda), a
	inc hl
	inc hl
	xor a
	ld (__n), a
	ld a, 17
	ld (__x), a
	ld a, (_rdy)
	ld (__y), a
	push hl
	call _print_tile_inv
	ld hl, __x
	inc (hl)
	pop hl
	ld b, 12
	.pk_pa_can
	push bc
	ld a, (hl)
	sub 32
	ld (__n), a
	inc hl
	push hl
	call _print_tile_inv
	ld hl, __x
	inc (hl)
	pop hl
	pop bc
	djnz pk_pa_can
	ld a, (_rdy)
	inc a
	ld (_rdy), a
	pop bc
	djnz pk_pa_loop
	ret



._pk_print_attacks
	ld hl, _pk_player_attacks
	call _pk_print_menu
	ld a, (__y)
	ld (_rdy), a
	ld hl, _pk_data + 16 + 2
	ld a, 29
	ld (__x), a
	ld a, 15
	ld (__y), a
	ld b, 4
	.print_pp_loop
	push bc
	ld a, (hl)
	ld de, 16
	add hl, de
	push hl
	call draw_2_digits_shortcut
	ld hl, __y
	inc (hl)
	pop hl
	pop bc
	djnz print_pp_loop
	ld a, (_rdy)
	ld (__y), a
	ret



._pk_print_main_menu
	ld hl, _pk_main_menu
	jp _pk_print_menu
	ret



._pk_print_items_menu
	ld hl, _pk_items_menu
	jp _pk_print_menu
	ret



._pk_ssp
	ld hl, (_gp_gen)
	.pk_ssp_loop
	ld a, (hl)
	or a
	ret z
	cp '%'
	ret z
	inc hl
	push hl
	sub 32
	ld (__n), a
	ld d, 6*8
	ld a, (_ssp_x)
	ld (__x), a
	inc a
	ld (_ssp_x), a
	ld a, (_ssp_y)
	ld (__y), a
	call _print_tile_inv
	ld a, (_rdc)
	or a
	jr nz, pk_ssp_noupd
	halt
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	.pk_ssp_noupd
	pop hl
	jr pk_ssp_loop
	ret



._pk_clear_rec
	ld a, 15
	ld (_ssp_y), a
	ld b, 4
	.pk_clear_loop
	push bc
	ld a, 17
	ld (_ssp_x), a
	ld (_rdc), a
	ld hl, _str_wipe + 1
	call pk_ssp_loop
	ld hl, _ssp_y
	inc (hl)
	pop bc
	djnz pk_clear_loop
	xor a
	ld (_rdc), a
	ret



._pk_message
	ld a, 1
	ld (_ssp_x), a
	ld a, 15
	ld (_ssp_y), a
	ld hl, (_gp_gen)
	ld a, h
	or l
	jr z, pk_message_name_done
	call _pk_ssp
	.pk_message_name_done
	ld hl, (_pk_ml1)
	ld a, h
	or l
	jr z, pk_message_l1_done
	ld (_gp_gen), hl
	call _pk_ssp
	.pk_message_l1_done
	ld hl, (_pk_ml2)
	ld a, h
	or l
	jr z, pk_message_l2_done
	ld (_gp_gen), hl
	ld a, 1
	ld (_ssp_x), a
	ld a, 15 + 2
	ld (_ssp_y), a
	call _pk_ssp
	.pk_message_l2_done
	ld hl, 0
	ld (_gp_gen), hl
	ret



._pk_message_wipe
	ld hl, _str_wipe
	ld (_pk_ml1), hl
	ld (_pk_ml2), hl
	jr _pk_message
	ret



._pk_message_cycle
	call	_pk_message
	call	_pk_pad_wait
	call	_pk_message_wipe
	ret



._pk_attack
	ld a, (_pa1)
	or a
	jr nz, pka_CPU_attacks
	.pka_PLA_attacks
	ld ix, _pk_data
	ld iy, _pk_data + 16 + 64
	jr pka_setup_done
	.pka_CPU_attacks
	ld ix, _pk_data + 16 + 64
	ld iy, _pk_data
	.pka_setup_done
	ld a, (_pa2)
	cp 0xff
	ret z
	sla a
	sla a
	sla a
	sla a
	add 16
	ld b, 0
	ld c, a
	push ix
	ld de, 6
	add ix, de
	ld (_gp_gen), ix
	pop ix
	ld hl, _str_used
	ld (_pk_ml1), hl
	push ix
	add ix, bc
	ld de, 4
	add ix, de
	ld (_pk_ml2), ix
	push bc
	push iy
	call _pk_message_cycle
	pop iy
	pop bc
	pop ix
	push ix
	add ix, bc
	ld a, (ix + 0)
	ld (_pk_pw), a
	ld a, (ix + 1)
	ld (_pk_accuracy), a
	dec (ix + 2)
	pop ix
	ld a, 8
	ld (_pk_iv), a
	xor a
	ld (_pk_effort), a
	ld a, 10
	ld (_pk_effort), a
	ld a, (ix + 1)
	ld (_pk_at), a
	ld a, (iy + 2)
	ld (_pk_df), a
	ld a, (ix + 4)
	and 8
	jr z, pka_at_nost
	ld a, (_pk_at)
	ld e, a
	srl a
	srl a
	ld d, a
	ld a, e
	sub d
	ld (_pk_at), a
	.pka_at_nost
	ld a, (iy + 4)
	and 4
	jr z, pka_df_nost
	ld a, (_pk_df)
	ld e, a
	srl a
	srl a
	ld d, a
	ld a, e
	sub d
	ld (_pk_df), a
	.pka_df_nost
	push bc
	push ix
	push iy
	ld a, (_pa1)
	or a
	jr z, show_anim_player
	.show_anim_opponent
	call an_set_opponent
	jr show_anim_done
	.show_anim_player
	call an_set_player
	.show_anim_done
	call _pk_animate_portrait
	pop iy
	pop ix
	pop bc
	call _rand
	ld d, l
	ld a, (_pk_accuracy)
	ld e, a
	ld a, d
	cp e
	jr c, pka_nomiss
	ld hl, _str_failed
	ld (_pk_ml1), hl
	ld hl, 0
	ld (_pk_ml2), hl
	call _pk_message_cycle
	ret
	.pka_nomiss
	push bc
	push ix
	push iy
	call _pk_calc_damage
	xor a
	or l
	jr z, damage_animation_done
	push hl
	ld a, (_pa1)
	or a
	jr z, show_damage_player
	.show_damage_opponent
	call an_set_player
	jr show_damage_done
	.show_damage_player
	call an_set_opponent
	.show_damage_done
	call _pk_animate_damaged
	pop hl
	.damage_animation_done
	pop iy
	pop ix
	pop bc
	ld a, (iy + 0)
	cp l
	jr c, pka_hp_zero
	sub l
	jr pka_hp_set
	.pka_hp_zero
	xor a
	.pka_hp_set
	ld (iy + 0), a
	ld hl, 0
	ld (_gp_gen), hl
	ld d, 0
	ld e, 6
	push iy
	add iy, de
	ld (_pk_ml1), iy
	pop iy
	push ix
	add ix, bc
	ld a, (ix + 3)
	pop ix
	cp 1
	jr z, pka_fx_leech
	cp 2
	jr z, pka_fx_burn
	cp 4
	jr z, pka_fx_lower_df
	cp 8
	jr z, pka_fx_lower_at
	ret
	.an_set_opponent
	ld a, 17
	ld (__x), a
	ld a, 1
	ld (__y), a
	xor a
	ld (__n), a
	inc a
	ld (_pan), a
	ret
	.an_set_player
	ld a, 7
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 1
	ld (__n), a
	ld a, 0xFF
	ld (_pan), a
	ret
	.pka_fx_leech
	ld a, (iy + 4)
	ld d, a
	and 1
	ret nz
	ld a, d
	or 1
	ld (iy + 4), a
	ld hl, _str_infected
	ld (_pk_ml2), hl
	jr pka_message
	.pka_fx_burn
	ld a, (iy + 4)
	ld d, a
	and 2
	ret nz
	ld a, d
	or 2
	ld (iy + 4), a
	ld hl, _str_burning
	ld (_pk_ml2), hl
	jr pka_message
	.pka_fx_lower_df
	ld a, 4
	or (iy + 4)
	ld (iy + 4), a
	ld hl, (_pk_ml1)
	ld (_gp_gen), hl
	ld hl, _str_genitive
	ld (_pk_ml1), hl
	ld hl, _str_low_def
	ld (_pk_ml2), hl
	jr pka_message
	.pka_fx_lower_at
	ld a, 8
	or (iy + 4)
	ld (iy + 4), a
	ld hl, (_pk_ml1)
	ld (_gp_gen), hl
	ld hl, _str_genitive
	ld (_pk_ml1), hl
	ld hl, _str_low_def
	ld (_pk_ml2), hl
	.pka_message
	call _pk_message_cycle
	ret



._pk_status_effects
	ld a, (_pa1)
	or a
	jr nz, pks_CPU_attacks
	.pks_PLA_attacks
	ld ix, _pk_data
	ld iy, _pk_data + 16 + 64
	jr pks_setup_done
	.pks_CPU_attacks
	ld ix, _pk_data + 16 + 64
	ld iy, _pk_data
	.pks_setup_done
	ld a, (iy + 0)
	srl a
	srl a
	srl a
	srl a
	or a
	jr nz, pks_dmg_store
	inc a
	.pks_dmg_store
	ld (_pa1), a
	ld a, (iy + 4)
	and 1
	call nz, pks_leech
	ld a, (iy + 4)
	and 2
	ret z
	.pks_burn
	ld a, (_pa1)
	ld c, a
	ld a, (iy + 0)
	sub c
	jr nc, pks_burn_af_store
	xor a
	.pks_burn_af_store
	ld (iy + 0), a
	push iy
	ld de, 6
	add iy, de
	ld (_gp_gen), iy
	pop iy
	ld hl, _str_is
	ld (_pk_ml1), hl
	ld hl, _str_burn
	ld (_pk_ml2), hl
	call _pk_message_cycle
	ret
	.pks_leech
	ld a, (_pa1)
	ld c, a
	ld a, (iy + 0)
	sub c
	jr nc, pks_leech_af_store
	xor a
	.pks_leech_af_store
	ld (iy + 0), a
	ld a, (ix + 0)
	add c
	cp (ix + 5)
	jr c, pks_leech_at_store
	ld a, (ix + 5)
	.pks_leech_at_store
	ld (ix + 0), a
	ld hl, _str_leech
	ld (_pk_ml1), hl
	ld de, 6
	push iy
	add iy, de
	ld (_pk_ml2), iy
	push ix
	call _pk_message_cycle
	pop ix
	pop iy
	ld de, 6
	push ix
	add ix, de
	ld (_pk_ml1), ix
	ld hl, _str_regain
	ld (_pk_ml2), hl
	push iy
	call _pk_message_cycle
	pop iy
	pop ix
	ret
	ret



._pk_op_pickup_attack
	ld b, 8
	.pk_pickup_loop
	push bc
	ld a, 0xff
	ld (_pk_op_attack), a
	call _rand
	ld a, l
	and 3
	ld b, 4
	ld c, a
	.pk_pickup_pp_check
	ld a, c
	sla a
	sla a
	sla a
	sla a
	ld d, 0
	ld e, a
	ld hl, _pk_data + 16 + 64 + 16 + 2
	add hl, de
	ld a, (hl)
	or a
	jr nz, pk_pickup_ok1
	ld a, c
	inc a
	and 3
	ld c, a
	djnz pk_pickup_pp_check
	jr pk_pickup_ret
	.pk_pickup_ok1
	ld a, c
	ld (_pk_op_attack), a
	ld hl, _pk_data + 16 + 64 + 16 + 3
	add hl, de
	ld b, (hl)
	ld a, (_pk_data + 4)
	and b
	jr nz, pk_pickup_continue
	ld a, (_pk_turn)
	dec a
	jr nz, pk_pickup_ret
	ld a, 2
	ld (_pk_turn), a
	xor a
	or b
	jr z, pk_pickup_continue
	.pk_pickup_ret
	pop bc
	ret
	.pk_pickup_continue
	pop bc
	djnz pk_pickup_loop
	ret



._pk_pl_pickup_attack
	.pk_pl_pickup_attack_loop
	ld a, 17
	ld (__x), a
	ld a, 15
	ld (__y), a
	call _pk_print_attacks
	ld a, 4
	ld (_pa1), a
	call _pk_simple_menu
	ld a, (_pa2)
	ld (_pk_pl_attack), a
	sla a
	sla a
	sla a
	sla a
	add 2
	ld h, 0
	ld l, a
	ld de, _pk_player_attacks
	add hl, de
	ld a, (hl)
	or a
	jr z, pk_pl_pickup_attack_loop
	ret



._pk_attack_cycle
	ld a, 0xff
	ld (_pk_item), a
	ld (_pk_pl_attack), a
	ld a, 17
	ld (__x), a
	ld a, 15
	ld (__y), a
	call _pk_print_main_menu
	ld a, 4
	ld (_pa1), a
	call _pk_simple_menu
	ld	hl,(_pa2)
	ld	h,0
.i_113
	ld	a,l
	cp	#(0% 256)
	jp	z,i_114
	cp	#(1% 256)
	jp	z,i_115
	cp	#(2% 256)
	jp	z,i_116
	cp	#(3% 256)
	jp	z,i_117
	jp	i_112
.i_114
	call	_pk_pl_pickup_attack
	jp	i_112
.i_115
	call	_pk_print_items_menu
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_pa1),a
	call	_pk_simple_menu
	ld	hl,(_pa2)
	ld	h,0
	ld	a,l
	ld	(_pk_item),a
	ld hl, _pk_data + 6
	ld (_gp_gen), hl
	ld hl, _str_used
	ld (_pk_ml1), hl
	ld hl, _pk_items_menu
	ld a, (_pa2)
	sla a
	sla a
	sla a
	sla a
	add 4
	ld e, a
	ld d, 0
	add hl, de
	ld (_pk_ml2), hl
	call _pk_message_cycle
	ld hl, _str_useless
	ld (_pk_ml1), hl
	ld hl, 0
	ld (_pk_ml2), hl
	call _pk_message_cycle
	jp	i_112
.i_116
	ld hl, _str_nomore1
	ld (_pk_ml1), hl
	ld hl, _str_nomore2
	ld (_pk_ml2), hl
	call _pk_message_cycle
	jp	i_112
.i_117
	ld hl, _str_useless
	ld (_pk_ml1), hl
	ld hl, 0
	ld (_pk_ml2), hl
	call _pk_message_cycle
.i_112
	call	_pk_op_pickup_attack
	ld	a,#(1 % 256 % 256)
	ld	(_pa1),a
	ld	hl,(_pk_op_attack)
	ld	h,0
	ld	a,l
	ld	(_pa2),a
	call	_pk_attack
	call	_pk_update_displays
	ld	hl,(_pk_data)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_118
	ret


.i_118
	ld	a,#(0 % 256 % 256)
	ld	(_pa1),a
	ld	hl,(_pk_pl_attack)
	ld	h,0
	ld	a,l
	ld	(_pa2),a
	call	_pk_attack
	call	_pk_update_displays
	ld	hl,(_pk_data+80)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_119
	ret


.i_119
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_pa1),a
	call	_pk_status_effects
	call	_pk_update_displays
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pa1),a
	call	_pk_status_effects
	call	_pk_update_displays
	ret



._set_ts
	ld de, _tspatterns
	call dzx0_standard
	ret



._pokemon_combat
	call cpc_ResetTouchedTiles
	xor a
	ld (_rdc), a
	ld hl, _pokemon_tiles
	call _set_ts
	ld hl, _s_pokemon
	ld de, 0x9000
	call depack
	ld	hl,1	;const
	call	cpc_ShowTileMap
	xor a
	ld (_pk_win), a
	ld (_pk_turn), a
	ld (_pa1), a
	ld hl, _bubasaur
	ld (_p_ptr), hl
	call _pk_init_pokemon_pa1_from_ptr
	ld a, 1
	ld (_pa1), a
	ld hl, _charmander
	ld (_p_ptr), hl
	call _pk_init_pokemon_pa1_from_ptr
	ld a, 6
	ld (_psk), a
	ld a, 17
	ld (__x), a
	ld a, 1
	ld (__y), a
	xor a
	ld (__n), a
	call _pk_portrait
	ld a, 7
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 1
	ld (__n), a
	call _pk_portrait
	.pokemon_combat_loop
	call _pk_update_displays
	call _pk_attack_cycle
	ld a, (_pk_data + 0 + 16 + 64)
	or a
	jr nz, pcl1
	ld a, 17
	ld (__x), a
	ld a, 1
	ld (__y), a
	xor a
	ld (__n), a
	call _pk_animate_death
	ld a, 1
	ld (_pk_win), a
	jr pokemon_combat_done
	.pcl1
	ld a, (_pk_data + 0)
	or a
	jr nz, pcl2
	ld a, 7
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 1
	ld (__n), a
	call _pk_animate_death
	jr pokemon_combat_done
	.pcl2
	ld hl, _pk_turn
	inc (hl)
	jr pokemon_combat_loop
	.pokemon_combat_done
	ld hl, _tilesetc
	jp _set_ts
	ret



._hook_system_inits
	ret



._hook_init_game
	xor a
	ld (_gandalf_talk), a
	ld (_dwarf_talk), a
	ld (_sonia_talk), a
	ld (_amador_talk), a
	ld (_comecocos_on), a
	ld (_anillo_flag), a
	ld (_gallumb_flag), a
	ld (_anillo_uses), a
	ld (_smaug_talk), a
	ld (_just_passed_out), a
	inc a
	ld (_anillo_first_time), a
	call	_rand
	ld	de,3	;const
	ex	de,hl
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_dwarf_ct),a
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,19	;const
	push	hl
	ld	hl,22	;const
	push	hl
	ld	hl,0	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,1	;const
	call	_wyz_play_music
	ret



._hook_init_mainloop
	ld a, (_just_passed_out)
	or a
	ret z
	ld a, (_gallumb_flag)
	cp 3
	jr nz, gallumb_not_3
	dec a
	ld (_gallumb_flag), a
	ld a, 33
	jr gallumb_rda_set
	.gallumb_not_3
	ld a, 36
	.gallumb_rda_set
	ld (_rda), a
	xor a
	ld (_anillo_uses), a
	ld (_just_passed_out) , a
	ld (_redraw_after_text), a
	ld a, 47
	ld (_rdb), a
	jp _show_text_box
	ret



._interactions
	ld a, (_n_pant)
	cp 0
	jp z, room_00
	cp 1
	jp z, room_01
	cp 5
	jp z, room_05
	cp 12
	jp z, room_12
	cp 17
	jp z, room_17
	cp 24
	jp z, room_24
	cp 28
	jp z, room_28
	ret
	.no_interact_and_ret
	xor a
	ld (_interact_flag), a
	ret
	.interact_and_ret
	ld a, 1
	ld (_interact_flag), a
	ret
	.room_00
	ld a, 2*16
	ld (__x), a
	ld (__y), a
	call _touch_tile
	ld a, l
	or a
	jr z, no_interact_and_ret
	ld a, (_interact_flag)
	or a
	ret nz
	ld a, (_gandalf_talk)
	cp 1
	jr nz, int_gandalf_t1_done
	ld a, (_player+27)
	cp 13
	jr nc, int_gandalf_t1_done
	ld a, 46
	ld (_rdb), a
	ld a, 7
	ld (_rda), a
	call _show_text_box
	.int_gandalf_t1_done
	ld a, (_gandalf_talk)
	or a
	jr nz, int_gandalf_t2_done
	ld hl, cuts0
	call run_cutscene
	ld a, 1
	ld (_gandalf_talk), a
	xor a
	ld (_dwarf_ct), a
	ld (_rda), a
	call _launch_comecocos_screen
	ld a, 65
	ld (_cocos_count), a
	ld a, 1
	ld (_rda), a
	call _update_mission
	.int_gandalf_t2_done
	ld a, (_gandalf_talk)
	cp 2
	jr nz, int_gandalf_t3_done
	ld a, 46
	ld (_rdb), a
	ld a, 8
	ld (_rda), a
	call _show_text_box
	.int_gandalf_t3_done
	ld a, (_gandalf_talk)
	cp 1
	jr nz, int_gandalf_t4_done
	ld a, (_player+27)
	cp 13
	jr nz, int_gandalf_t4_done
	ld a, 46
	ld (_rdb), a
	ld a, 18
	ld (_rda), a
	call _show_text_box
	ld a, 2
	ld (_gandalf_talk), a
	xor a
	ld (_player+27), a
	ld a, 1
	ld (_rda), a
	call _launch_comecocos_screen
	ld a, 65
	ld (_cocos_count), a
	ld a, 2
	ld (_rda), a
	call _update_mission
	.int_gandalf_t4_done
	jp interact_and_ret
	.room_01
	ld a, (_gpx)
	cp 49
	jp c, no_interact_and_ret
	cp 88
	jp nc, no_interact_and_ret
	ld a, (_gpy)
	cp 32
	jp nc, no_interact_and_ret
	ld a, (_interact_flag)
	or a
	ret nz
	ld a, 35
	ld (_rdb), a
	ld a, 10
	ld (_rda), a
	call _show_text_box
	jp interact_and_ret
	.room_05
	ld a, (_gpx)
	cp 12*16
	ret nc
	ld a, (_smaug_talk)
	or a
	jr nz, smaug_talk_skip
	inc a
	ld (_smaug_talk), a
	ld hl, cuts4
	call run_cutscene
	.smaug_talk_skip
	ld b, 4
	ld hl, _sprite_18_a
	ld ix, _sp_sw
	.custom_clear_sprites_loop
	ld (ix + 0), l
	ld (ix + 1), h
	xor a
	ld (ix + 8), a
	ld (ix + 9), a
	ld (ix + 10), a
	ld (ix + 11), a
	push bc
	ld bc, 16
	add ix, bc
	pop bc
	djnz custom_clear_sprites_loop
	xor a
	ld hl, _nametable
	ld (hl), a
	ld de, _nametable+1
	ld bc, 767
	ldir
	call	_recuadrius
	ld	hl,6	;const
	call	_wyz_play_music
	call	_pokemon_combat
	ld	hl,3	;const
	call	_wyz_play_music
	call	_recuadrius
	ld a, (_pk_win)
	or a
	jr z, pokemon_lose
	.pokemon_win
	ld a, 1
	ld (_game_loop_flag), a
	ret
	.pokemon_lose
	dec a
	ld (_on_pant), a
	ld hl, 256
	ld (_player + 6), hl
	ld a, 1
	ld (_player + 26), a
	ret
	.room_12
	ld a, (_gallumb_flag)
	cp 1
	ret nz
	ld a, 7*16
	ld (__x), a
	ld a, 9*16
	ld (__y), a
	call _touch_tile
	ld a, l
	or a
	jp z, no_interact_and_ret
	ld a, (_interact_flag)
	or a
	ret nz
	ld a, 33
	ld (_rdb), a
	ld a, 29
	ld (_rda), a
	call _show_text_box
	ld a, 2
	ld (_gallumb_flag), a
	ld a, 4
	ld (_rda), a
	call _update_mission
	jp interact_and_ret
	.room_17
	ld a, (_sonia_talk)
	or a
	ret nz
	ld a, 12*16
	ld (__x), a
	ld a, 3*16
	ld (__y), a
	call _touch_tile
	ld a, l
	or a
	jp z, no_interact_and_ret
	ld a, (_interact_flag)
	or a
	ret nz
	ld hl, cuts1
	call run_cutscene
	ld a, 2
	ld (_rda), a
	call _launch_comecocos_screen
	ld a, 65
	ld (_cocos_count), a
	ld a, 1
	ld (_sonia_talk), a
	jp interact_and_ret
	.room_24
	ld a, (_dwarf_talk)
	or a
	ret nz
	ld a, 9*16
	ld (__x), a
	ld a, 7*16
	ld (__y), a
	call _touch_tile
	ld a, l
	or a
	jp z, no_interact_and_ret
	ld a, (_interact_flag)
	or a
	ret nz
	ld hl, cuts2
	call run_cutscene
	ld a, 1
	ld (_dwarf_talk), a
	ld a, 3
	ld (_gandalf_talk), a
	ld a, 0xff
	ld (_on_pant), a
	ld	hl,3	;const
	call	_wyz_play_music
	jp interact_and_ret
	.room_28
	ld a, (_amador_talk)
	or a
	ret nz
	ld a, 8*16
	ld (__x), a
	ld a, 6*16
	ld (__y), a
	call _touch_tile
	ld a, l
	or a
	jp z, no_interact_and_ret
	ld a, 42
	ld (_rda), a
	ld a, 26
	ld (_rdb), a
	call _show_text_box
	ld a, 1
	ld (_amador_talk), a
	ld a, 0xff
	ld (_on_pant), a
	xor a
	ld (_rda), a
	call _update_mission
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
	.delayed_text_do
	ld a, (_tfn_b)
	ld (_rdb), a
	ld a, (_tfn_a)
	ld (_rda), a
	call _show_text_box
	.delayed_text_done
	.comecocos_shit
	ld a, (_comecocos_on)
	or a
	jr z, comecocos_shit_done
	ld a, (_player + 45)
	ld c, a
	ld a, (_cocos_count)
	cp c
	jr nz, comecocos_shit_done
	.comecocos_shit_do
	call _back_from_comecocos_screen
	xor a
	ld (_comecocos_on), a
	ld a, (_n_pant_was)
	cp 0
	jr z, after_comecocos_0
	cp 1
	jr z, after_comecocos_1
	cp 2
	jr z, after_comecocos_2
	cp 3
	jr z, after_comecocos_3
	jr comecocos_shit_done
	.after_comecocos_0
	ld hl, 2
	call _wyz_play_music
	ld a, 46
	ld (_tfn_b), a
	ld a, 7
	ld (_tfn_a), a
	ld a, 3
	ld (_delayed_ct), a
	jr comecocos_shit_done
	.after_comecocos_1
	ld hl, 1
	call _wyz_play_music
	ld a, 46
	ld (_tfn_b), a
	ld a, 8
	ld (_tfn_a), a
	ld a, 3
	ld (_delayed_ct), a
	jr comecocos_shit_done
	.after_comecocos_2
	ld hl, 3
	call _wyz_play_music
	jr comecocos_shit_done
	.after_comecocos_3
	ld hl, 3
	call _wyz_play_music
	ld a, 1
	ld (_anillo_flag), a
	ld a, 18
	ld (_tfn_b), a
	ld a, 26
	ld (_tfn_a), a
	ld a, 3
	ld (_delayed_ct), a
	jr comecocos_shit_done
	.comecocos_shit_done
	call	_interactions
	ld	hl,(_anillo_flag)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_120
	ld a, (_player + 23)
	or a
	jp nz, anillo_done
	ld a, (_last_estado)
	cp 2 | 8
	jp nz, anillo_ct_check
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
	ld a, 32
	ld (__t), a
	xor a
	ld (__n), a
	call set_map_tile_do
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,3	;const
	call	_wyz_play_sound
	ld	hl,20	;const
	push	hl
	call	_espera_activa
	pop	bc
	ld a, (_anillo_first_time)
	or a
	jr z, anillo_not_first_time
	xor a
	ld (_anillo_first_time), a
	ld a, 34
	ld (_rda), a
	ld a, 47
	ld (_rdb), a
	call _show_text_box
	.anillo_not_first_time
	ld a, (_anillo_uses)
	inc a
	ld (_anillo_uses), a
	cp 8
	jr nz, anillo_done
	ld a, 35
	ld (_rda), a
	ld a, 47
	ld (_rdb), a
	call _bilbos_hangover
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
	and 0x10
	jr nz, anillo_done
	ld a, 2 | 8
	ld (_player + 23), a
	ld a, 190
	ld (_player + 24), a
	ld hl, 4
	call _wyz_play_music
	ld hl, 8
	call _wyz_play_sound
	.anillo_done
.i_120
	ld	hl,(_player+23)
	ld	h,0
	ld	a,l
	ld	(_last_estado),a
	ret



._hook_entering
	call	_draw_cur_screen_decos
	ld a, (_n_pant)
	cp 0x05
	jr z, in_gallumb
	cp 0x06
	jr z, in_gallumb
	cp 0x0c
	jr z, in_gallumb
	cp 0x0d
	jr z, in_gallumb
	cp 0x13
	jr z, in_gallumb
	cp 0x14
	jr z, in_gallumb
	cp 0x1a
	jr z, in_gallumb
	cp 0x1b
	jr z, in_gallumb
	cp 0x21
	jr z, in_gallumb
	cp 0x22
	jr z, in_gallumb
	xor a
	jr in_gallumb_set
	.in_gallumb
	ld a, 1
	.in_gallumb_set
	ld (_inside_gallumb_lair), a
	ret



._hook_hotspots
	ld a, (_hotspot_t)
	cp 1
	jr z, hook_hotspots_1
	cp 2
	jr z, hook_hotspots_2
	cp 12
	jr z, hook_hotspots_12
	ret
	.hook_hotspots_1
	ld a, (_gandalf_talk)
	or a
	jr nz, hh_gandalf_talked
	.hh_gandalf_not_talked
	ld a, (_dwarf_ct)
	ld (_rda), a
	inc a
	and 3
	ld (_dwarf_ct), a
	ld a, 47
	ld (_rdb), a
	xor a
	ld (_hotspot_t), a
	jp _show_text_box
	.hh_gandalf_talked
	call _insert_dwarf_name
	ld a, 9
	ld (_rda), a
	ld a, 17
	ld (_rdb), a
	jp _show_text_box
	.hook_hotspots_2
	ld	hl,19	;const
	push	hl
	ld	hl,22	;const
	push	hl
	ld	hl,18	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld a, 18
	ld (_rdb), a
	ld a, 25
	ld (_rda), a
	call _show_text_box
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
	xor a
	ld (_hotspot_t), a
	ld a, 3
	ld (_rda), a
	call _launch_comecocos_screen
	ld a, 55
	ld (_cocos_count), a
	ret
	.hook_hotspots_12
	ld a, (_player + 23)
	or a
	jr nz, hh12_has_estado
	ld a, 2
	ld (_player + 23), a
	ld a, 150
	ld (_player + 24), a
	.hh12_has_estado
	ld	hl,6	;const
	call	_wyz_play_sound
	xor a
	ld (_hotspot_t), a
	ret



._hook_game_over
	ld	hl,1	;const
	ret



._enems_custom_collision
	ld hl, 0
	ld a, (__en_t)
	cp 3
	ret nz
	ld a, (_gallumb_flag)
	cp 2
	jr nz, ecc_gallumb_notangry
	ld a, 32
	ld (_rda), a
	inc a
	ld (_rdb), a
	call _bilbos_hangover
	ld a, 3
	ld (_gallumb_flag), a
	ld hl, 0
	ret
	.ecc_gallumb_notangry
	or a
	jr nz, ecc_gallumb_repel
	ld hl, cuts3
	call run_cutscene
	ld a, 1
	ld (_gallumb_flag), a
	ld a, 3
	ld (_rda), a
	call _update_mission
	ld hl, 0
	ret
	.ecc_gallumb_repel
	ld hl, (_player)
	ld de, -256
	add hl, de
	ld (_player), hl
	ld hl, 1
	ret
	ret


	._s_title
	BINARY "titlec.bin"
	._s_marco
	.str_gameover
	defm "GAME OVER!"
	defb 0

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



._title_screen
	call	_blackout
	ld hl, _s_title
	ld de, 0x9000
	call depack
	ld	hl,11	;const
	push	hl
	ld	hl,13	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,11	;const
	push	hl
	ld	hl,14	;const
	push	hl
	ld	hl,i_1+11
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	call	cpc_UpdScr
	ld	hl,1	;const
	call	cpc_ShowTileMap
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



._game_ending
	call	_blackout
	call cpc_ResetTouchedTiles
	ld hl, _decos_ending
	ld (_gp_gen), hl
	call _draw_decos
	ld	hl,8	;const
	push	hl
	push	hl
	ld	hl,i_1+22
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	push	hl
	ld	hl,16	;const
	push	hl
	ld	hl,i_1+39
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,9	;const
	call	_wyz_play_music
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
	ret



._game_over
	ld	hl,8	;const
	call	_wyz_play_music
	call _recuadrius
	ld a, 11
	ld (__x), a
	ld a, 14
	ld (__y), a
	ld a, 7
	ld (__n), a
	ld hl, str_gameover
	call draw_text_loop
	ld hl, _pokemon_tiles
	call _set_ts
	xor a
	ld (_rda), a
	ld a, 6
	ld (_psk), a
	ld a, 12
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 3
	ld (__n), a
	call _pk_portrait
	ld	hl,7	;const
	call	_wyz_play_music
	ld	hl,(_wyz_beat_ct)
	ld	h,0
	ld	a,l
	ld	(_rdb),a
	ld	hl,32 % 256	;const
	ld	a,l
	ld	(_rdc),a
	.gameover_loop
	ld a, (_rdb)
	ld c, a
	ld a, (_wyz_beat_ct);
	cp c
	jr z, gameover_animate_done
	ld (_rdb), a
	.gameover_animate
	ld a, (_rda)
	ld c, a
	ld a, 6
	ld (_psk), a
	ld a, 12
	sub c
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 2
	ld (__n), a
	call _pk_portrait
	ld a, (_rda)
	ld c, a
	ld a, (_rdc)
	or a
	jr z, gameover_animate_do
	dec a
	ld (_rdc), a
	jr gameover_animate_paint
	.gameover_animate_do
	ld a, 1
	sub c
	ld (_rda), a
	ld c, a
	.gameover_animate_paint
	ld a, 6
	ld (_psk), a
	ld a, 12
	sub c
	ld (__x), a
	ld a, 8
	ld (__y), a
	ld a, 3
	ld (__n), a
	call _pk_portrait
	.gameover_animate_done
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	call _pad_read
	ld a, (_pad_this_frame)
	inc a
	jp z, gameover_loop
	ld	hl,8	;const
	call	_wyz_play_music
	ld hl, _tilesetc
	call _set_ts
	call _recuadrius
	ret



._do_extern_action
	ret


	._player_cells
	defw (_sprites + 0x0000), (_sprites + 0x0040), (_sprites + 0x0080), (_sprites + 0x00C0)
	defw (_sprites + 0x0100), (_sprites + 0x0140), (_sprites + 0x0180), (_sprites + 0x01C0)
	defw 0
	._enem_cells
	defw (_sprites + 0x0200), (_sprites + 0x0240), (_sprites + 0x0280), (_sprites + 0x02C0)
	defw (_sprites + 0x0300), (_sprites + 0x0340), (_sprites + 0x0380), (_sprites + 0x03C0)

._abs_a
	bit 7, a
	ret z
	neg
	ret



._saca_a_todo_el_mundo_de_aqui
	ld de, 15
	ld b, 1 + 3 + 0 + 0 + 0
	ld hl, 0xE000 + 0x600
	.clear_sprites_loop
	ld a, #(_sprite_18_a%256)
	ld (hl), a
	inc hl
	ld a, #(_sprite_18_a/256)
	ld (hl), a
	add hl, de
	djnz clear_sprites_loop
	ret



._get_pointer_to_enem
	ld a, (_enit)
	add 1
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, 0xE000 + 0x600
	add hl, de
	push hl
	pop ix
	ret



._render_this_enemy
	call _get_pointer_to_enem
	ld a, (_rdx)
	add #(1*8)
	add (ix + 6)
	srl a
	ld (ix + 8), a
	ld a, (_rdy)
	add #(0*8)
	add (ix + 7)
	ld (ix + 9), a
	ld a, (_enit)
	sla a
	ld b, 0
	ld c, a
	ld hl, _en_an_next_frame
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (ix + 0), l
	ld (ix + 1), h
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
	jp	i_123
.i_121
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_123
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_122
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
	jp	i_121
.i_122
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
	jp	c,i_125
	ld	a,(_half_life)
	and	a
	jp	z,i_124
.i_125
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_127
.i_124
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_127
	.render_player
	ld ix, #(0xE000 + 0x600 + (0*16))
	ld a, (_gpx)
	add #(1*8)
	add (ix + 6)
	srl a
	ld (ix + 8), a
	ld a, (_gpy)
	add #(0*8)
	add (ix + 7)
	ld (ix + 9), a
	ld a, (_player + 23)
	and 2
	jr z, player_render_graphic
	ld a, (_half_life)
	or a
	jr z, player_render_graphic
	.player_render_empty
	ld hl, _sprite_18_a
	jr player_render_set_sp0
	.player_render_graphic
	ld hl, (_player + 17)
	.player_render_set_sp0
	ld (ix + 0), l
	ld (ix + 1), h
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



._get_coin
	ld	hl,_player+45
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
	xor a
	ld (__t), a
	ld (__n), a
	call set_map_tile_do
	ld	hl,5	;const
	call	_wyz_play_sound
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
	ld a, 2
	ld (_player + 23), a
	ld a, 50
	ld (_player + 24), a
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
	ld	hl,4	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_128
	ld hl, -128
	ld (_player + 8), hl
	ld a, 2
	ld (_player + 22), a
.i_128
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_129
	ld hl, 128
	ld (_player + 8), hl
	ld a, 3
	ld (_player + 22), a
.i_129
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_131
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,8	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	c,i_131
	ld	hl,0	;const
	jr	i_132
.i_131
	ld	hl,1	;const
.i_132
	call	l_lneg
	jp	nc,i_130
	ld hl, 0
	ld (_player + 8), hl
.i_130
	ld a, (_player + 23)
	and 8
	jr z, pl_dizzy_vert_done
	call _rand
	ld a, l
	and #(128 - 1)
	ld d, 0
	ld e, a
	ld hl, (_player + 8)
	sra h
	rr l
	add hl, de
	ld de, #(-(128 / 2))
	add hl, de
	ld (_player + 8), hl
	.pl_dizzy_vert_done
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
	jp	p,i_133
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_133
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_134
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_134
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
	ld	hl,1	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_135
	ld hl, -128
	ld (_player + 6), hl
	ld a, 1
	ld (_player + 22), a
.i_135
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	a,h
	or	l
	jp	nz,i_136
	ld hl, 128
	ld (_player + 6), hl
	ld a, 0
	ld (_player + 22), a
.i_136
	ld	hl,_pad0
	ld	a,(hl)
	and	#(1 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_138
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_139_i_138
.i_138
	jp	i_137
.i_139_i_138
	ld hl, 0
	ld (_player + 6), hl
.i_137
	ld a, (_player + 23)
	and 8
	jr z, pl_dizzy_horz_done
	call _rand
	ld a, l
	and #(128 - 1)
	ld d, 0
	ld e, a
	ld hl, (_player + 6)
	sra h
	rr l
	add hl, de
	ld de, #(-(128 / 2))
	add hl, de
	ld (_player + 6), hl
	.pl_dizzy_horz_done
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
	jp	p,i_140
	ld	hl,0	;const
	ld	(_player),hl
.i_140
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_141
	ld	hl,14336	;const
	ld	(_player),hl
.i_141
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
	jp	z,i_142
	ld	hl,_player+21
	inc	(hl)
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_143
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
.i_143
.i_142
	ld	hl,(_player+20)
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_144
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_145
	ld	hl,(_rdd)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_146
.i_145
	ld	hl,(_rdd)
	ld	h,0
	ld	bc,6
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_146
	jp	i_147
.i_144
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_148
	ld	hl,(_rdd)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdd),a
.i_148
.i_147
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
	ld b, 7 * 5
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
	ld hl, 0xE800 - 4
	ld (_animated_ptr), hl
	ld de, 0xE800 - 4 + 1
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
	._advance_worm
	ld a, (_rdc)
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
	ld b, l
	sla b
	call _get_pointer_to_enem
	ld a, b
	ld hl, (_enit)
	ld h, 0
	ld de, _en_an_base_frame
	add hl, de
	ld (hl), a
	ld b, 0
	ld c, a
	ld hl, _sm_cox
	add hl, bc
	ld a, (hl)
	ld (ix + 6), a
	ld hl, _sm_coy
	add hl, bc
	ld a, (hl)
	add (ix + 7), a
	sla c
	ld hl, _sm_invfunc
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld (ix + 12), e
	ld (ix + 13), d
	ld hl, _sm_updfunc
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld d, (hl)
	ld (ix + 14), e
	ld (ix + 15), d
	jr _enems_calc_frame
	ret



._marrullers_select_direction
	ld hl, (_enit)
	ld h, 0
	ld de, _en_an_ff
	add hl, de
	ld c, (hl)
	xor a
	sub c
	ld b, a
	call _rand
	ld a, l
	and 3
	cp 1
	jr z, msd1
	cp 2
	jr z, msd2
	cp 3
	jr z, msd3
	.msd0
	xor a
	ld (__en_mx), a
	ld a, b
	ld (__en_my), a
	ret
	.msd1
	xor a
	ld (__en_mx), a
	ld a, c
	ld (__en_my), a
	ret
	.msd2
	ld a, c
	ld (__en_mx), a
	xor a
	ld (__en_my), a
	ret
	.msd3
	ld a, b
	ld (__en_mx), a
	xor a
	ld (__en_my), a
	ret
	ret



._draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	call	_draw_scr_background
	._enems_init
	ld hl, (_n_pant)
	ld h, 0
	ld de, _enoffs_index
	add hl, de
	ld a, (hl)
	ld (_enoffs), a
	inc hl
	ld b, a
	ld a, (hl)
	sub b
	ld (_n_enems), a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_151
.i_149
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_151
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_150
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
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_uge
	jp	c,i_149
.i_152
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
.i_155
	ld	a,l
	cp	#(1% 256)
	jp	z,i_156
	cp	#(2% 256)
	jp	z,i_157
	cp	#(3% 256)
	jp	z,i_158
	cp	#(4% 256)
	jp	z,i_159
	cp	#(7% 256)
	jp	z,i_160
	cp	#(8% 256)
	jp	z,i_161
	cp	#(9% 256)
	jp	z,i_162
	cp	#(10% 256)
	jp	z,i_163
	cp	#(11% 256)
	jp	z,i_164
	cp	#(12% 256)
	jp	z,i_165
	cp	#(13% 256)
	jp	z,i_166
	cp	#(14% 256)
	jp	z,i_167
	jp	i_154
.i_156
.i_157
.i_158
.i_159
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_154
.i_160
.i_161
.i_162
.i_163
	ld	de,_en_an_ff
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(__en_t)
	ld	h,0
	ld	bc,-7
	add	hl,bc
	call	_enems_en_an_calc
	jp	i_154
.i_164
.i_165
.i_166
.i_167
	ld	hl,(__en_t)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	call	_enems_en_an_calc
	ld hl, _enoffsmasi
	call _calc_baddies_pointer
	ld a, (hl)
	and 0xf0
	ld (hl), a
	inc hl
	ld a, (hl)
	and 0xf0
	ld (hl), a
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
.i_154
	jp	i_149
.i_150
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
	jp	i_170
.i_168
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_170
	ld	hl,(_enit)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_enems)
	ld	h,0
	call	l_ult
	jp	nc,i_169
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
	jp	z,i_171
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
	jp	c,i_173
	ld	a,(__en_t)
	cp	#(11 % 256)
	jr	z,i_174_uge
	jp	c,i_174
.i_174_uge
	ld	a,(__en_t)
	cp	#(14 % 256)
	jr	z,i_174_ule
	jp	nc,i_174
.i_174_ule
	ld	hl,1	;const
	jr	i_175
.i_174
	ld	hl,0	;const
.i_175
	ld	a,h
	or	l
	jp	nz,i_173
	jr	i_176
.i_173
	ld	hl,1	;const
.i_176
	ld	a,h
	or	l
	jp	z,i_172
	.en_linear_horizontal_axis
	ld a, (__en_mx)
	or a
	jr z, en_linear_horizontal_axis_done
	ld c, a
	ld a, (__en_x)
	add c
	ld (__en_x), a
	.en_linear_horz_bounds
	ld a, (__en_x)
	ld c, a
	ld a, (__en_x1)
	cp c
	jr c, horz_limit_skip_1
	ld a, (__en_x1)
	ld (__en_x), a
	ld a, (__en_t)
	cp 11
	jr nc, en_linear_decide_for_marrullers
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	.horz_limit_skip_1
	ld a, (__en_x2)
	ld c, a
	ld a, (__en_x)
	cp c
	jr c, horz_limit_skip_2
	ld a, (__en_x2)
	ld (__en_x), a
	ld a, (__en_t)
	cp 11
	jr nc, en_linear_decide_for_marrullers
	ld a, (__en_mx)
	call _abs_a
	neg
	ld (__en_mx), a
	.horz_limit_skip_2
	.en_linear_horizontal_axis_done
	.en_linear_vertical_axis
	ld a, (__en_my)
	or a
	jr z, en_linear_vertical_axis_done
	ld c, a
	ld a, (__en_y)
	add c
	ld (__en_y), a
	.en_linear_vert_bounds
	ld a, (__en_y)
	ld c, a
	ld a, (__en_y1)
	cp c
	jr c, vert_limit_skip_1
	ld a, (__en_y1)
	ld (__en_y), a
	ld a, (__en_t)
	cp 11
	jr nc, en_linear_decide_for_marrullers
	ld a, (__en_my)
	call _abs_a
	ld (__en_my), a
	.vert_limit_skip_1
	ld a, (__en_y2)
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, vert_limit_skip_2
	ld a, (__en_y2)
	ld (__en_y), a
	ld a, (__en_t)
	cp 11
	jr nc, en_linear_decide_for_marrullers
	ld a, (__en_my)
	call _abs_a
	neg
	ld (__en_my), a
	.vert_limit_skip_2
	.en_linear_vertical_axis_done
	jr en_linear_done
	.en_linear_decide_for_marrullers
	call _marrullers_select_direction
	jp _en_bg_collision_end
	.en_linear_done
.i_172
	ld	a,(__en_t)
	cp	#(7 % 256)
	jr	z,i_178_uge
	jp	c,i_178
.i_178_uge
	ld	a,(__en_t)
	cp	#(10 % 256)
	jr	z,i_179_i_178
	jr	c,i_179_i_178
.i_178
	jp	i_177
.i_179_i_178
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
.i_177
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
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_181
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_181
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_181
	jr	c,i_182_i_181
.i_181
	jp	i_180
.i_182_i_181
	ld	hl,(_player+23)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_183
	call	_enems_custom_collision
	ld	a,h
	or	l
	jp	nz,i_184
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2	;const
	call	_wyz_play_sound
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
	jp	z,i_185
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccx)
	ld	h,0
	call	l_ult
	jp	nc,i_186
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
	jp	i_187
.i_186
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
.i_187
.i_185
	ld	hl,__en_my
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_188
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_en_ccy)
	ld	h,0
	call	l_ult
	jp	nc,i_189
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
	jp	i_190
.i_189
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
.i_190
.i_188
	call	_player_flicker
.i_184
.i_183
.i_180
.i_171
.i_191
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
	jp	i_168
.i_169
	ret



._main
	call	_wyz_init
	di
	ld a, 195
	ld (0x38), a
	ld hl, _isr
	ld (0x39), hl
	jp isr_done
	._isr
	push af
	ld a, (isr_c1)
	inc a
	cp 6
	jr c, _skip_ay_player
	ld a, (isr_c2)
	inc a
	ld (isr_c2), a
	ld a, (_isr_player_on)
	or a
	jr z, _skip_ay_player
	push hl
	push de
	push bc
	push ix
	push iy
	call WYZ_PLAYER_ISR
	pop iy
	pop ix
	pop bc
	pop de
	pop hl
	xor a
	._skip_ay_player
	ld (isr_c1), a
	pop af
	ei
	ret
	.isr_c1
	defb 0
	.isr_c2
	defb 0
	.isr_done
	ld	hl,84	;const
	call	_cpc_Border
	ld hl, _trpixlutc
	ld de, 0xF800 + 0x600
	call depack
	call	_blackout
	ld	hl,_my_inks
	push	hl
	call	_pal_set
	pop	bc
	.decompress_ts
	ld hl, _tilesetc
	ld de, _tspatterns
	call dzx0_standard
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
	.sprite_creation
	ld ix, #(0xE000 + 0x600+(0*16))
	ld a, (_sm_cox)
	ld (ix + 6), a
	ld a, (_sm_coy)
	ld (ix + 7), a
	ld hl, (_sm_invfunc)
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, (_sm_updfunc)
	ld (ix + 15), h
	ld (ix + 14), l
	ld hl, _sprite_18_a
	ld (ix + 1), h
	ld (ix + 0), l
	ld (ix + 3), h
	ld (ix + 2), l
	ld ix, #(0xE000 + 0x600+(1*16))
	ld de, 16
	ld b, 3
	.sp_sw_init_enems_loop
	ld hl, cpc_PutSpTileMap8x16Px
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, cpc_PutTrSp8x16TileMap2bPx
	ld (ix + 15), h
	ld (ix + 14), l
	add ix, de
	djnz sp_sw_init_enems_loop
	ld ix, 0xE000 + 0x600
	ld de, 16
	ld b, 1 + 3 + 0 + 0 + 0
	.sp_sw_init_turnoff_loop
	ld a, #((1*8)/4)
	ld (ix + 10), a
	ld a, #(0*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	call	_hook_system_inits
	ei
.i_192
	call	_title_screen
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
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
	ld	hl,1	;const
	call	_wyz_play_music
.i_194
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_195
	call	_hook_init_mainloop
	ld	a,#(0 % 256 % 256)
	ld	(_pant_just_rendered),a
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
	ld a, 1
	ld (_pant_just_rendered), a
	.ml_ud_skip
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_196
	ld	hl,9	;const
	push	hl
	ld	hl,23	;const
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
.i_196
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_197
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_198
	or	l
	jp	z,i_198
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_199
.i_198
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_199
	ld	hl,28	;const
	push	hl
	ld	hl,23	;const
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
.i_197
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
	jp	nz,i_200
	ld	a,#(1 % 256 % 256)
	ld	(_hotspot_flag),a
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	a,l
	ld	(_latest_hotspot),a
	call	_hook_hotspots
	ld	a,(_hotspot_t)
	and	a
	jp	z,i_201
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_204
	ld	a,l
	cp	#(1% 256)
	jp	z,i_205
	cp	#(3% 256)
	jp	z,i_206
	jp	i_203
.i_205
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6	;const
	call	_wyz_play_sound
	jp	i_203
.i_206
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
	jp	nc,i_207
	ld	hl,99	;const
	ld	(_player+29),hl
.i_207
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,6	;const
	call	_wyz_play_sound
.i_203
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_208
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1
	add	hl,de
	push	hl
	ld	a,(_hotspot_y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
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
.i_208
.i_201
.i_200
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
	ld hl, 0xE800 - 4
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
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_on_pant)
	ld	h,0
	call	l_eq
	jp	nc,i_209
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
.i_209
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
	jp	nz,i_211
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_212_i_211
.i_211
	jp	i_210
.i_212_i_211
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_213
.i_210
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_215
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_216_i_215
.i_215
	jp	i_214
.i_216_i_215
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_214
.i_213
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_218
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_218
	ld	a,(_n_pant)
	cp	#(7 % 256)
	jr	z,i_218_uge
	jp	c,i_218
.i_218_uge
	jr	i_219_i_218
.i_218
	jp	i_217
.i_219_i_218
	ld a, (_n_pant)
	sub 7
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_220
.i_217
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_222
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_223_i_222
.i_222
	jp	i_221
.i_223_i_222
	ld a, (_n_pant)
	add 7
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_221
.i_220
	ld	a,(_game_loop_flag)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_224
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_224
	ld	a,(_player+36)
	and	a
	jp	z,i_225
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_226
	or	l
	jp	z,i_226
.i_226
.i_225
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_228
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_227
.i_228
	call	_hook_game_over
	ld	a,h
	or	l
	jp	z,i_230
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_230
.i_227
	jp	i_194
.i_195
	call	_wyz_stop_sound
	jp	i_192
.i_193
	ret


;	SECTION	text

.i_1
	defm	"1 KEYBOARD"
	defb	0

	defm	"2 JOYSTICK"
	defb	0

	defm	"SOY RICO POTRICO"
	defb	0

	defm	"ESTA NOCHE PAJA!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

._n_enems	defs	1
.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._isr_player_on	defs	1
._just_passed_out	defs	1
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._pk_accuracy	defs	1
._hotspot_t	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._en_cx	defs	1
._en_cy	defs	1
._anillo_uses	defs	1
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
._p_dst	defs	2
._intro_text	defs	1
._last_estado	defs	1
._pk_df	defs	1
._wyz_beat_ct	defs	1
._t_alt	defs	1
._pk_at	defs	1
._p_ptr	defs	2
._dwarf_talk	defs	1
._pk_iv	defs	1
.__n	defs	1
._pk_base	defs	1
._pk_pw	defs	1
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
._pk_pl_attack	defs	1
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._pk_item	defs	1
._player_just_died	defs	1
._gp_gen	defs	2
._anillo_first_time	defs	1
._ssp_x	defs	1
._ssp_y	defs	1
._on_pant	defs	1
._pk_temp	defs	2
._enoffs	defs	2
._cocos_count	defs	1
._comecocos_on	defs	1
._smaug_talk	defs	1
._gallumb_flag	defs	1
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
._en_x	defs	1
._en_y	defs	1
._inside_gallumb_lair	defs	1
._pk_turn	defs	1
._enit	defs	1
._gpcx	defs	2
._gpcy	defs	2
._rdt1	defs	1
._rdt2	defs	1
._playing	defs	1
._gpit	defs	1
._n_pant_was	defs	1
._seed	defs	2
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._pk_ml1	defs	2
._pk_ml2	defs	2
._maincounter	defs	1
._rdmt	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._pk_op_attack	defs	1
._wall	defs	1
._delayed_ct	defs	1
._pk_effort	defs	1
._hotspot_t_r	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._pa1	defs	1
._pa2	defs	1
._sonia_talk	defs	1
._pa3	defs	1
._pa4	defs	1
._pa5	defs	1
._pa6	defs	1
.___y	defs	1
._pk_win	defs	1
._xwas	defs	1
._ywas	defs	1
._item_old	defs	1
._idx	defs	2
._player	defs	46
._jetpac_frame_counter	defs	1
._pan	defs	1
._rda	defs	1
._rdb	defs	1
._rdc	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdi	defs	1
._rdj	defs	2
._rdn	defs	1
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._enoffsmasi	defs	2
._game_loop_flag	defs	1
._psk	defs	1
._latest_hotspot	defs	1
._amador_talk	defs	1
._asm_int	defs	2
._pant_just_rendered	defs	1
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
._pk_level	defs	1
._coins_old	defs	1
._interact_flag	defs	1
._anillo_flag	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	XDEF	_n_enems
	XDEF	__en_t
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_isr_player_on
	XDEF	_hotspots
	XDEF	_abs_a
	XDEF	_draw_scr
	XDEF	_spr_next
	defc	_spr_next	=	58944
	XDEF	_wyz_play_music
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	XDEF	_sm_invfunc
	XDEF	_can_move_box
	LIB	cpc_PutSpTileMap12x24CA
	XDEF	_str_infected
	LIB	cpc_PrintGphStrStdXY
	XDEF	_hook_init_mainloop
	XDEF	_draw_text_cbc
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_just_passed_out
	XDEF	_interactions
	LIB	cpc_PutTiles
	XDEF	_sprites
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	_def_keys
	XDEF	__en_y2
	XDEF	_pk_accuracy
	XDEF	_a_leer
	LIB	cpc_PrintGphStrM12X
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54838
	XDEF	_init_falling_box_buffer
	XDEF	_show_text_box
	XDEF	_hotspot_t
	XDEF	_wyz_play_sound
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_mission0
	XDEF	_mission1
	XDEF	_mission2
	XDEF	_half_life
	XDEF	_mission3
	LIB	cpc_ShowScrTileMap
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_SetMode
	XDEF	_enoffs_index
	LIB	cpc_ClrScr
	XDEF	_mission4
	XDEF	_draw_decos
	XDEF	_pk_message_wipe
	XDEF	_pk_message_cycle
	XDEF	_en_cx
	LIB	cpc_SetModo
	XDEF	_en_cy
	XDEF	_pk_op_pickup_attack
	LIB	cpc_PutMaskSpriteTileMap2b
	LIB	cpc_PutTrSpriteTileMap2b
	XDEF	_pk_pl_pickup_attack
	XDEF	_en_an_state
	defc	_en_an_state	=	54832
	XDEF	_anillo_uses
	XDEF	_adjust_to_tile_x
	XDEF	_adjust_to_tile_y
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_marrullers_select_direction
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	XDEF	_gandalf_talk
	LIB	cpc_PutTrSp8x16TileMap2bGPxP
	LIB	cpc_PutTrSp8x24TileMap2bGPxP
	XDEF	_pk_portrait
	XDEF	_pk_animate_portrait
	LIB	cpc_ShowTouchedTiles2
	XDEF	_a_ember
	XDEF	_hook_system_inits
	LIB	cpc_SetTile
	XDEF	_missions
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	LIB	cpc_PutSpTileMap8x8PxM1
	LIB	cpc_PutSpTileMap16x16PxM1
	LIB	cpc_PutSpTileMap16x24PxM1
	XDEF	_anillo_ct
	XDEF	_recuadrius
	LIB	cpc_CollSp
	XDEF	_beepet
	LIB	cpc_PutMaskSp4x16
	XDEF	_decos0
	XDEF	_en_an_morido
	defc	_en_an_morido	=	54802
	XDEF	_decos1
	XDEF	_decos2
	XDEF	_decos3
	XDEF	_gp_gen_org
	XDEF	_decos4
	XDEF	_enemy_died
	XDEF	_decos5
	XDEF	_pk_print_menu
	XDEF	_blackout
	XDEF	_map_buff
	defc	_map_buff	=	50838
	LIB	cpc_PrintGphStrStd
	XDEF	_cpc_Border
	XDEF	_killed_old
	XDEF	_ezg_old
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_pal_set
	XDEF	_invalidate_viewport
	XDEF	_insert_dwarf_name
	XDEF	_dwarf_ct
	XDEF	_p_dst
	XDEF	_intro_text
	XDEF	_str_burn
	XDEF	_a_vinewhip
	XDEF	_last_estado
	XDEF	_charmander
	XDEF	_pk_update_displays
	LIB	cpc_ShowTileMap
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_print_tile_inv
	XDEF	_pk_df
	XDEF	_wyz_beat_ct
	XDEF	_hook_hotspots
	XDEF	_t_alt
	XDEF	_pk_at
	LIB	cpc_PutTrSp8x8TileMap2bPxM1
	LIB	cpc_PutTrSp16x16TileMap2bPxM1
	LIB	cpc_PutTrSp16x24TileMap2bPxM1
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_p_ptr
	XDEF	_cpc_UpdateNow
	XDEF	_dwarf_talk
	XDEF	_pk_iv
	XDEF	_espera_activa
	LIB	cpc_SpRLM1
	XDEF	__n
	XDEF	_launch_comecocos_screen
	XDEF	_back_from_comecocos_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	54829
	XDEF	_pk_base
	XDEF	_pk_pw
	XDEF	__t
	XDEF	_title_screen
	XDEF	__x
	XDEF	__y
	XDEF	_player_hidden
	XDEF	_hotspot_flag
	XDEF	_wyz_init
	XDEF	_s_pokemon
	XDEF	_a_growl
	XDEF	_pk_data
	defc	_pk_data	=	62976
	XDEF	_pokemon_combat
	LIB	cpc_PrintGphStrXY2X
	XDEF	_life_old
	XDEF	_en_ccx
	LIB	cpc_PutTrSp4x8TileMap2bG
	LIB	cpc_PutTrSp8x16TileMap2bG
	LIB	cpc_PutTrSp8x24TileMap2bG
	LIB	cpc_SpRRM1
	XDEF	_en_ccy
	XDEF	_tfn_a
	XDEF	_tfn_b
	XDEF	_sm_sprptr
	XDEF	_enems_en_an_calc
	XDEF	_str_regain
	LIB	cpc_PrintGphStrXYM1
	XDEF	_str_wipe
	XDEF	_str_used
	XDEF	_fall_box
	XDEF	_bottom_string
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	LIB	cpc_PutTrSp16x16TileMap2bGPxM1
	LIB	cpc_TestKey
	XDEF	_text0
	LIB	cpc_PutSprite
	XDEF	_text1
	XDEF	_text2
	XDEF	_text3
	XDEF	_text4
	XDEF	_text5
	XDEF	_text6
	LIB	cpc_PutSpTileMap4x8
	XDEF	_text7
	XDEF	_text8
	XDEF	_text9
	XDEF	_pk_clear_rec
	LIB	cpc_PutSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_pk_calc_stat
	XDEF	_animated_ptr
	XDEF	_pk_pl_attack
	XDEF	_s_marco
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	XDEF	_enemy_killer
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_draw_and_advance
	LIB	cpc_TouchTileXY
	LIB	cpc_SetTouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	XDEF	_qtile
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_sprite_18_a
	XDEF	_pk_item
	XDEF	_player_just_died
	XDEF	_texts
	XDEF	_init_player
	XDEF	_gp_gen
	XDEF	_spr_x
	defc	_spr_x	=	58956
	XDEF	_spr_y
	defc	_spr_y	=	58960
	XDEF	_anillo_first_time
	XDEF	_str_useless
	XDEF	_ssp_x
	XDEF	_ssp_y
	XDEF	_on_pant
	XDEF	_render_this_enemy
	XDEF	_pk_temp
	XDEF	_enoffs
	LIB	cpc_PutSpTr
	LIB	cpc_PutTrSp12x24TileMap2bGCA
	XDEF	_pad_this_frame
	LIB	cpc_DisableFirmware
	LIB	cpc_EnableFirmware
	XDEF	_hook_game_over
	XDEF	_pk_attack_cycle
	XDEF	_cocos_count
	XDEF	_comecocos_on
	XDEF	_enem_cells
	XDEF	_smaug_talk
	LIB	cpc_PrintGphStrXYM12X
	XDEF	_gallumb_flag
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	__tile_address
	XDEF	_n_pant
	LIB	cpc_UpdScrM1P
	XDEF	_def_keys_joy
	XDEF	_en_j
	XDEF	_redraw_after_text
	XDEF	_str_leech
	LIB	cpc_SetBorder
	XDEF	_en_an_ff
	defc	_en_an_ff	=	54835
	LIB	cpc_RLI
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_inside_gallumb_lair
	XDEF	_pk_turn
	XDEF	_str_burning
	XDEF	_enems_custom_collision
	LIB	cpc_RRI
	LIB	cpc_GetSp
	LIB	cpc_PutTrSp4x8TileMap2bGPx
	LIB	cpc_PutTrSp8x16TileMap2bGPx
	LIB	cpc_PutTrSp8x24TileMap2bGPx
	XDEF	_enit
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_hook_mainloop
	XDEF	_collide_enem
	XDEF	_mapa
	XDEF	_main
	XDEF	_draw_coloured_tile
	XDEF	_attr
	XDEF	_pk_pad_wait
	XDEF	_player_cells
	LIB	cpc_ResetTouchedTiles
	LIB	cpc_ShowTouchedTiles
	XDEF	_gpcx
	XDEF	_gpcy
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_dwarf_names
	XDEF	_s_title
	XDEF	_playing
	LIB	cpc_PutMaskSp2x8
	XDEF	_en_an_vx
	defc	_en_an_vx	=	54817
	XDEF	_en_an_vy
	defc	_en_an_vy	=	54823
	XDEF	_gpit
	LIB	cpc_ScanKeyboard
	XDEF	_sm_updfunc
	XDEF	_pk_animate_damaged
	XDEF	_hook_entering
	LIB	cpc_SetColour
	XDEF	_n_pant_was
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_pk_animate_death
	XDEF	_pk_items_menu
	XDEF	_pk_print_items_menu
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_gpxx
	XDEF	_gpyy
	XDEF	_pk_ml1
	XDEF	_pk_ml2
	XDEF	_get_pointer_to_enem
	XDEF	_maincounter
	XDEF	_rdmt
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_pk_op_attack
	XDEF	_move
	LIB	cpc_PutMaskSpTileMap2b
	LIB	cpc_PutTrSpTileMap2b
	LIB	cpc_PutORSpTileMap2b
	LIB	cpc_PutSpTileMap2b
	LIB	cpc_PutCpSpTileMap2b
	LIB	cpc_PutTrSp4x8TileMap2b
	LIB	cpc_UpdScr
	LIB	cpc_PutTrSp8x16TileMap2b
	LIB	cpc_PutTrSp8x24TileMap2b
	XDEF	_wall
	XDEF	_delayed_ct
	XDEF	_pk_effort
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	54796
	LIB	cpc_ScrollLeft0
	XDEF	_hotspot_t_r
	XDEF	_my_inks
	XDEF	_update_mission
	XDEF	__x2
	XDEF	__y2
	LIB	cpc_AnyKeyPressed
	XDEF	__en_life
	XDEF	_str_genitive
	XDEF	_cpc_HardPause
	XDEF	_hook_init_game
	LIB	cpc_AssignKey
	XDEF	_prxx
	XDEF	_calc_hotspot_ptr
	XDEF	_pryy
	XDEF	_pa1
	LIB	cpc_TouchTiles
	XDEF	_pa2
	XDEF	_sonia_talk
	LIB	cpc_PutSpTileMap4x8Px
	XDEF	_pa3
	XDEF	_pa4
	XDEF	_pa5
	XDEF	_pa6
	XDEF	___y
	XDEF	_abs
	LIB	cpc_ScrollRight0
	XDEF	_pk_win
	LIB	cpc_PrintGphStr
	XDEF	_a_scratch
	XREF	_s_ending
	XDEF	_game_ending
	XDEF	_pk_ssp
	XDEF	_xwas
	XDEF	_a_tackle
	LIB	cpc_UnExo
	XDEF	_redraw_from_buffer
	XDEF	_top_string
	XDEF	_temp_string
	XDEF	_ywas
	XDEF	_clear_temp_string
	XDEF	_pk_simple_menu
	XDEF	_item_old
	LIB	cpc_SetInkGphStrM1
	XDEF	_idx
	XDEF	_en_an_x
	defc	_en_an_x	=	54805
	XDEF	_en_an_y
	defc	_en_an_y	=	54811
	XDEF	_player
	XDEF	_jetpac_frame_counter
	LIB	cpc_UpdateTileMap
	XDEF	_pk_status_effects
	XDEF	_pan
	XDEF	_rda
	XDEF	_rdb
	XDEF	_rdc
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	XDEF	_text10
	LIB	cpc_PutSpTileMap8x8Px
	XDEF	_rdi
	XDEF	_rdj
	XDEF	_text11
	XDEF	_text12
	XDEF	_text13
	XDEF	_rdn
	XDEF	_text14
	XDEF	_keys_old
	XDEF	_init_player_values
	XDEF	_en_tocado
	LIB	cpc_TestKeyF
	XDEF	_text17
	LIB	cpc_PutTrSp16x16TileMap2bGPxM1P
	LIB	cpc_PutTrSp16x24TileMap2bGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	_draw_2_digits
	XDEF	_text18
	XDEF	_text19
	XDEF	_text20
	LIB	cpc_PutTrSp4x8TileMap2bPx
	LIB	cpc_PutTrSp8x8TileMap2bPx
	LIB	cpc_PutTrSp8x16TileMap2bPx
	LIB	cpc_PutTrSp8x24TileMap2bPx
	XDEF	_pti
	XDEF	_comportamiento_tiles
	XDEF	_ptj
	XDEF	_move_tile
	LIB	cpc_PutSpTileMap8x16
	LIB	cpc_PutSpTileMap8x24
	XDEF	_tileset
	XDEF	_text21
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	XDEF	_text22
	XDEF	_text23
	XDEF	_text24
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_text25
	XDEF	_text26
	XDEF	_text27
	XDEF	_text28
	XDEF	_text29
	XDEF	_text30
	XDEF	_text31
	XDEF	_text32
	LIB	cpc_PutSpTileMapO
	XDEF	_enoffsmasi
	XDEF	_text33
	LIB	cpc_PutSp
	XDEF	_text34
	XDEF	_text35
	LIB	cpc_UpdScrAddresses
	XDEF	_text36
	XDEF	_text37
	XDEF	_text38
	XDEF	_text39
	XDEF	_text40
	XDEF	_text41
	XDEF	_text42
	XDEF	_game_loop_flag
	XDEF	_draw_cur_screen_decos
	XDEF	_psk
	XDEF	_a_leechseed
	XDEF	_bubasaur
	XDEF	_pk_delay
	XDEF	_pk_attack
	XDEF	_set_ts
	XDEF	_player_flicker
	XDEF	_pk_init_pokemon_pa1_from_ptr
	XDEF	_init_hotspots
	XDEF	_get_coin
	XDEF	_latest_hotspot
	XDEF	_str_defeated
	XDEF	_amador_talk
	XDEF	_asm_int
	XDEF	_hotspot_paint
	XDEF	_pant_just_rendered
	XDEF	_pk_print_attacks
	XDEF	__baddies_pointer
	XDEF	_calc_baddies_pointer
	LIB	cpc_TouchTileSpXY
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	XDEF	_pk_display_life
	XDEF	_str_low_def
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	XDEF	_pk_level
	LIB	cpc_RedefineKey
	XDEF	_coins_old
	XDEF	_do_extern_action
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	54787
	XDEF	_touch_tile
	LIB	cpc_GetTiles
	XDEF	_render_all_sprites
	XDEF	_unpack
	XDEF	_spr_on
	defc	_spr_on	=	58952
	XDEF	_interact_flag
	XDEF	_str_failed
	XDEF	_pk_main_menu
	XDEF	_pk_print_main_menu
	LIB	cpc_PutSpXOR
	LIB	cpc_PrintStr
	XDEF	_decos_ending
	XDEF	_draw_scr_background
	LIB	cpc_PrintGphStr2X
	XDEF	_anillo_flag
	XDEF	_game_over
	XDEF	_pk_message
	LIB	cpc_PrintGphStrM1
	XDEF	_str_nomore1
	XDEF	_str_nomore2
	XDEF	_pk_calc_damage
	XDEF	_str_is
	XDEF	_pk_calc_hp
	XDEF	_str_low_attack
	XDEF	_bilbos_hangover


; --- End of Scope Defns ---


; --- End of Compilation ---
