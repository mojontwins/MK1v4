;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Wed May 14 17:02:23 2025



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


;	SECTION	text

._comportamiento_tiles
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
	defb	9

	defm	""
	defb	9

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	9

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	._sprite_18_a
	defs 96, 0
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


	XREF _nametable
	XREF tabla_teclas
	LIB cpc_KeysData
	LIB cpc_UpdTileTable
	LIB cpc_InvalidateRect
	LIB cpc_TestKeyboard
	XDEF viewport_x
	XDEF viewport_y
	defc viewport_x = 0
	defc viewport_y = 2
	.my_inks
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x5C
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x56
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x5B
	out (c), a
	ld a, 4
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 5
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 6
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 7
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 8
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 9
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 10
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 11
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 12
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 13
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 14
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 15
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
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

;	SECTION	code


;	SECTION	text

._sm_invfunc
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1
	defw	cpc_PutSpTileMap16x16PxM1

;	SECTION	code

;	SECTION	text

._sm_updfunc
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT
	defw	cpc_PutTrSp16x16TileMapPxM1LUT

;	SECTION	code

	._sm_sprptr
	defw _sprites + 0x0000, _sprites + 0x0040, _sprites + 0x0080, _sprites + 0x00C0
	defw _sprites + 0x0100, _sprites + 0x0140, _sprites + 0x0180, _sprites + 0x01C0
	defw _sprites + 0x0200, _sprites + 0x0240, _sprites + 0x0280, _sprites + 0x02C0
	defw _sprites + 0x0300, _sprites + 0x0340, _sprites + 0x0380, _sprites + 0x03C0
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
	._02_gover_mus_bin
	BINARY "../ogt/02_gover.mus.bin"
	._wyz_songs
	defw _00_title_mus_bin, _01_ingame_mus_bin, _02_gover_mus_bin

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
	ld	hl,240 % 256	;const
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
	call	cpc_MakeM1RotationLUTs
	call	_blackout
	call my_inks
	ld	hl,1	;const
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
	ld hl, cpc_PutTrSp8x16TileMapPx
	ld (ix + 15), h
	ld (ix + 14), l
	add ix, de
	djnz sp_sw_init_enems_loop
	ld ix, 0xE000 + 0x600
	ld de, 16
	ld b, 1 + 3 + 0 + 0 + 0
	.sp_sw_init_turnoff_loop
	ld a, #((0*8)/4)
	ld (ix + 10), a
	ld a, #(2*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
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
	.set_map_tile_do_print
	ld a, (__x)
	sla a
	add 0
	ld (__x), a
	ld a, (__y)
	sla a
	add 2
	ld (__y), a
	jp _draw_coloured_tile_do
	ret



._invalidate_viewport
	ld B, 2
	ld C, 0
	ld D, 2+19
	ld E, 0+29
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



._no_break
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_14
.i_12
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_14
	ld	a,(_gpit)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ult
	jp	nc,i_13
	halt
	jp	i_12
.i_13
	ret



._espera_activa
.i_17
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
	jp	c,i_16
.i_18
.i_15
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_17
.i_16
	ret



._cortina
	ret



._step
	ret



._unpack_screen
	ld de, 0x9000
	call depack
	ret



._draw_rectangle
	call __tile_address
	ld a, (__y2)
	inc a
	ld hl, __y
	sub (hl)
	ld b, a
	ld a, (__x)
	add 31
	ld hl, __x2
	sub (hl)
	dec a
	ld (__n), a
	.draw_rectangle_it1
	push bc
	ld a, (__x)
	ld b, a
	.draw_rectangle_it2
	xor a
	ld (de), a
	inc de
	inc b
	ld a, (__x2)
	inc a
	cp b
	jr nc, draw_rectangle_it2
	ld hl, (__n)
	ld h, 0
	add hl, de
	ex de, hl
	pop bc
	djnz draw_rectangle_it1
	ld a, (__y)
	ld b, a
	ld a, (__x)
	ld c, a
	ld a, (__y2)
	ld d, a
	ld a, (__x2)
	ld e, a
	call cpc_InvalidateRect
	ret



._render_this_enemy
	ld d, 1
	call _get_pointer_to_enem_or_coco
	ld a, (_rdx)
	add #(0*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_rdy)
	add #(2*8)
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



._render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_enit),a
	jp	i_21
.i_19
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_21
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_20
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
	jp	i_19
.i_20
	ld a, (_gpy)
	ld (_rdy), a
	ld a, (_player + 23)
	and 2
	jr z, render_player_on_screen
	ld a, (_half_life)
	or a
	jr nz, render_player_on_screen
	.render_player_off_screen
	ld a, 240
	jr render_player_set_x
	.render_player_on_screen
	ld a, (_gpx)
	.render_player_set_x
	ld (_rdx), a
	.render_player
	ld ix, #(0xE000 + 0x600 + (0*16))
	ld a, (_gpx)
	add #(0*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_gpy)
	add #(2*8)
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



._cpc_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_22
	ld a, #((1 + 3 + 0 + 0 + 0)*16)
	._cpc_screen_update_inv_loop
	sub 16
	push af
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
	pop af
	or a
	jr nz, _cpc_screen_update_inv_loop
.i_22
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_23
	ld a, #((1 + 3 + 0 + 0 + 0)*16)
	._cpc_screen_update_upd_loop
	sub 16
	push af
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
	pop af
	or a
	jr nz, _cpc_screen_update_upd_loop
	._cpc_screen_update_done
.i_23
	.ml_min_faps_loop
	ld a, (isr_c2)
	cp 2
	jr nc, ml_min_faps_loop_end
	halt
	jr ml_min_faps_loop
	.ml_min_faps_loop_end
	xor a
	ld (isr_c2), a
	call cpc_ShowTouchedTiles
	call cpc_ResetTouchedTiles
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



._get_pointer_to_enem_or_coco
	ld a, (_enit)
	add d
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



._enems_en_an_calc
	ld b, l
	sla b
	ld d, 1
	call _get_pointer_to_enem_or_coco
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
	jp _enems_calc_frame
	ret



._select_controls
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
	defb	153

	defm	""
	defb	153

	defm	""
	defb	128

	defm	""
	defb	224

	defm	""
	defb	236

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	224

	defm	""
	defb	224

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	140

	defm	""
	defb	236

	defm	""
	defb	225

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	224

	defm	""
	defb	236

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	128

	defm	""
	defb	224

	defm	""
	defb	225

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	236

	defm	""
	defb	224

	defm	""
	defb	201

	defm	""
	defb	153

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	128

	defm	""
	defb	224

	defm	""
	defb	233

	defm	""
	defb	25

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	224

	defm	""
	defb	224

	defm	""
	defb	25

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
	defb	137

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	28

	defm	""
	defb	8

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"y"
	defb	153

	defm	""
	defb	137

	defm	""
	defb	23

	defm	""
	defb	28

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	137

	defm	""
	defb	24

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	137

	defm	""
	defb	145

	defm	"q"
	defb	152

	defm	""
	defb	153

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	145

	defm	""
	defb	153

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
	defb	153

	defm	""
	defb	145

	defm	"w"
	defb	25

	defm	""
	defb	17

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	145

	defm	""
	defb	25

	defm	""
	defb	23

	defm	"q"
	defb	153

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
	defb	34

	defm	""
	defb	212

	defm	"-+"
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	178

	defm	"2$3"
	defb	177

	defm	""
	defb	28

	defm	""
	defb	28

	defm	""
	defb	28

	defm	""
	defb	210

	defm	"!"
	defb	18

	defm	""
	defb	219

	defm	""
	defb	28

	defm	""
	defb	17

	defm	"wrA"
	defb	204

	defm	""
	defb	19

	defm	""
	defb	188

	defm	""
	defb	28

	defm	"p"
	defb	0

	defm	"2"
	defb	204

	defm	"l"
	defb	200

	defm	""
	defb	140

	defm	""
	defb	7

	defm	"`"
	defb	2

	defm	"L``"
	defb	241

	defm	""
	defb	192

	defm	"p"
	defb	7

	defm	"B"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	192

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"t0"
	defb	12

	defm	""
	defb	0

	defm	""
	defb	177

	defm	""
	defb	0

	defm	"p"
	defb	7

	defm	"2"
	defb	0

	defm	""
	defb	192

	defm	";"
	defb	192

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"r"
	defb	192

	defm	""
	defb	204

	defm	"2"
	defb	176

	defm	""
	defb	0

	defm	"p"
	defb	7

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

	defm	""
	defb	188

	defm	""
	defb	192

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
	defb	204

	defm	"www"
	defb	192

	defm	"wwwp"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	204

	defm	""
	defb	201

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	192

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	199

	defm	"wwp"
	defb	7

	defm	"www"
	defb	188

	defm	""
	defb	193

	defm	""
	defb	193

	defm	"w"
	defb	17

	defm	"q"
	defb	17

	defm	""
	defb	27

	defm	"P"
	defb	197

	defm	""
	defb	204

	defm	""
	defb	17

	defm	""
	defb	225

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	176

	defm	""
	defb	192

	defm	""
	defb	204

	defm	"Q"
	defb	225

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	27

	defm	""
	defb	192

	defm	""
	defb	139

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	139

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
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	185

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

	defm	"[wwwww"
	defb	25

	defm	"i"
	defb	185

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	155

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

	defm	"y"
	defb	153

	defm	""
	defb	183

	defm	"wwq"
	defb	153

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	155

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	21

	defm	"y"
	defb	149

	defm	"y"
	defb	153

	defm	""
	defb	177

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	21

	defm	"Ww"
	defb	153

	defm	""
	defb	155

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	25

	defm	""
	defb	25

	defm	""
	defb	145

	defm	"y"
	defb	153

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	184

	defm	""
	defb	187

	defm	"Q"
	defb	151

	defm	""
	defb	153

	defm	""
	defb	27

	defm	"#MB=4"
	defb	210

	defm	"4"
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
	defb	28

	defm	""
	defb	0

	defm	""
	defb	211

	defm	"0"
	defb	12

	defm	""
	defb	192

	defm	""
	defb	10

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"$"
	defb	0

	defm	""
	defb	172

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	172

	defm	""
	defb	3

	defm	" "
	defb	0

	defm	""
	defb	28

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	192

	defm	"C"
	defb	10

	defm	""
	defb	204

	defm	""
	defb	10

	defm	""
	defb	12

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	173

	defm	"@"
	defb	193

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	192

	defm	""
	defb	0

	defm	"3"
	defb	12

	defm	""
	defb	193

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"J"
	defb	0

	defm	""
	defb	160

	defm	""
	defb	193

	defm	""
	defb	160

	defm	""
	defb	202

	defm	""
	defb	0

	defm	"C"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	13

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
	defb	145

	defm	""
	defb	145

	defm	"w"
	defb	25

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	129

	defm	"q"
	defb	145

	defm	""
	defb	25

	defm	""
	defb	153

	defm	""
	defb	153

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
	defb	153

	defm	""
	defb	136

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
	defb	136

	defm	"w"
	defb	153

	defm	""
	defb	17

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	151

	defm	"x"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	17

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	132

	defm	""
	defb	12

	defm	""
	defb	193

	defm	""
	defb	17

	defm	""
	defb	28

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"0"
	defb	12

	defm	""
	defb	193

	defm	""
	defb	28

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D"
	defb	212

	defm	""
	defb	12

	defm	""
	defb	194

	defm	"B2CB1"
	defb	12

	defm	""
	defb	20

	defm	";"
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"t"
	defb	17

	defm	""
	defb	195

	defm	"#"
	defb	176

	defm	""
	defb	0

	defm	"p"
	defb	7

	defm	"2"
	defb	204

	defm	"$;"
	defb	192

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"r@C3"
	defb	176

	defm	""
	defb	0

	defm	"p"
	defb	7

	defm	"2"
	defb	194

	defm	"$+"
	defb	204

	defm	""
	defb	7

	defm	""
	defb	0

	defm	"t<"
	defb	18

	defm	"B"
	defb	188

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	"4"
	defb	28

	defm	""
	defb	18

	defm	";"
	defb	16

	defm	""
	defb	199

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	18

	defm	""
	defb	177

	defm	""
	defb	204

	defm	""
	defb	23

	defm	"wC"
	defb	12

	defm	""
	defb	204

	defm	""
	defb	203

	defm	"Q"
	defb	28

	defm	""
	defb	204

	defm	""
	defb	19

	defm	"B"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	176

	defm	""
	defb	203

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	139

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	14

	defm	"P"
	defb	192

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	27

	defm	""
	defb	17

	defm	""
	defb	190

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	177

	defm	""
	defb	27

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
	defb	14

	defm	""
	defb	0

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

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	12

	defm	""
	defb	193

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	204

	defm	""
	defb	17

	defm	""
	defb	193

	defm	""
	defb	199

	defm	"wwwwwww"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

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
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	153

	defm	"y"
	defb	153

	defm	""
	defb	177

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	185

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	155

	defm	""
	defb	17

	defm	"["
	defb	188

	defm	""
	defb	27

	defm	""
	defb	153

	defm	"q"
	defb	153

	defm	""
	defb	177

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	185

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	155

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	177

	defm	""
	defb	153

	defm	"y"
	defb	25

	defm	""
	defb	177

	defm	""
	defb	145

	defm	""
	defb	145

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	155

	defm	""
	defb	193

	defm	""
	defb	145

	defm	""
	defb	145

	defm	""
	defb	153

	defm	""
	defb	149

	defm	"y"
	defb	145

	defm	""
	defb	183

	defm	"wwwwq"
	defb	150

	defm	""
	defb	155

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
	defb	149

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

	defm	""
	defb	187

	defm	" "
	defb	0

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	192

	defm	"3"
	defb	0

	defm	""
	defb	192

	defm	""
	defb	204

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	192

	defm	""
	defb	2

	defm	"N"
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
	defb	211

	defm	""
	defb	12

	defm	""
	defb	160

	defm	""
	defb	193

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	208

	defm	""
	defb	192

	defm	""
	defb	193

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	210

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
	defb	228

	defm	""
	defb	208

	defm	""
	defb	193

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"-"
	defb	10

	defm	""
	defb	12

	defm	""
	defb	202

	defm	""
	defb	204

	defm	""
	defb	160

	defm	""
	defb	172

	defm	""
	defb	3

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	211

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	195

	defm	"20"
	defb	0

	defm	"C$2"
	defb	212

	defm	"-@"
	defb	0

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

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	"|"
	defb	5

	defm	"BD"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"0"
	defb	192

	defm	""
	defb	206

	defm	""
	defb	0

	defm	""
	defb	28

	defm	""
	defb	204

	defm	""
	defb	206

	defm	""
	defb	3

	defm	""
	defb	193

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	192

	defm	""
	defb	192

	defm	""
	defb	236

	defm	"0"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	16

	defm	""
	defb	12

	defm	"3"
	defb	0

	defm	""
	defb	192

	defm	"P"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	192

	defm	"$."
	defb	224

	defm	""
	defb	210

	defm	"E"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	28

	defm	"="
	defb	192

	defm	"42"
	defb	210

	defm	"4#"
	defb	210

	defm	"=@"
	defb	0

	defm	""
	defb	4

	defm	"C"
	defb	212

	defm	""
	defb	211

	defm	"DD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"BB"
	defb	210

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"D@"
	defb	0

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	192

	defm	""
	defb	13

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	192

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	153

	defm	""
	defb	128

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"L"
	defb	12

	defm	""
	defb	8

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"D"
	defb	220

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	205

	defm	"2@"
	defb	0

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	20

	defm	""
	defb	196

	defm	"$C@"
	defb	12

	defm	""
	defb	196

	defm	"4$"
	defb	212

	defm	""
	defb	212

	defm	"=43"
	defb	210

	defm	"3"
	defb	210

	defm	"D,"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	204

	defm	"C<"
	defb	0

	defm	"2C#"
	defb	0

	defm	""
	defb	204

	defm	""
	defb	211

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	12

	defm	""
	defb	196

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	195

	defm	""
	defb	204

	defm	" "
	defb	204

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	","
	defb	195

	defm	"0"
	defb	205

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	196

	defm	""
	defb	212

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"24 "
	defb	12

	defm	""
	defb	194

	defm	"$"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	204

	defm	""
	defb	195

	defm	"M434"
	defb	211

	defm	"C"
	defb	212

	defm	""
	defb	211

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
	defb	25

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	129

	defm	""
	defb	25

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	153

	defm	"w"
	defb	153

	defm	""
	defb	136

	defm	""
	defb	25

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"w"
	defb	17

	defm	""
	defb	25

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"q"
	defb	25

	defm	""
	defb	24

	defm	""
	defb	137

	defm	"w"
	defb	145

	defm	""
	defb	145

	defm	""
	defb	17

	defm	""
	defb	24

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	145

	defm	""
	defb	145

	defm	""
	defb	25

	defm	""
	defb	31

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
	defb	129

	defm	""
	defb	25

	defm	""
	defb	128

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	193

	defm	""
	defb	24

	defm	""
	defb	24

	defm	""
	defb	25

	defm	""
	defb	24

	defm	""
	defb	200

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
	defb	192

	defm	""
	defb	0

	defm	""
	defb	212

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	5

	defm	"\ "
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
	defb	252

	defm	""
	defb	196

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	12

	defm	"US<"
	defb	12

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	192

	defm	""
	defb	0

	defm	"D"
	defb	10

	defm	""
	defb	16

	defm	""
	defb	10

	defm	""
	defb	28

	defm	""
	defb	12

	defm	""
	defb	172

	defm	""
	defb	2

	defm	"<"
	defb	12

	defm	""
	defb	28

	defm	""
	defb	28

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	192

	defm	""
	defb	210

	defm	""
	defb	12

	defm	""
	defb	10

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	195

	defm	""
	defb	220

	defm	""
	defb	28

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	160

	defm	"D"
	defb	17

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	205

	defm	"0"
	defb	195

	defm	"B"
	defb	211

	defm	""
	defb	211

	defm	"#4 "
	defb	192

	defm	"!"
	defb	16

	defm	"P\"
	defb	16

	defm	"="
	defb	12

	defm	""
	defb	209

	defm	""
	defb	204

	defm	""
	defb	5

	defm	""
	defb	206

	defm	""
	defb	204

	defm	""
	defb	28

	defm	"3,"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	229

	defm	""
	defb	12

	defm	""
	defb	2

	defm	"L"
	defb	199

	defm	""
	defb	192

	defm	""
	defb	197

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	210

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	192

	defm	"P\"
	defb	0

	defm	""
	defb	3

	defm	","
	defb	28

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	5

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	28

	defm	""
	defb	192

	defm	""
	defb	193

	defm	""
	defb	12

	defm	"\"
	defb	12

	defm	""
	defb	0

	defm	"C"
	defb	28

	defm	""
	defb	193

	defm	""
	defb	197

	defm	""
	defb	30

	defm	""
	defb	12

	defm	""
	defb	3

	defm	"=B"
	defb	0

	defm	"3C#M2="
	defb	211

	defm	""
	defb	0

	defm	""
	defb	192

	defm	"4"
	defb	211

	defm	"4= "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	28

	defm	""
	defb	201

	defm	"-@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	28

	defm	""
	defb	17

	defm	""
	defb	28

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	193

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	192

	defm	"\"
	defb	195

	defm	""
	defb	224

	defm	"pp"
	defb	192

	defm	"RR,"
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	206

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	14

	defm	""
	defb	0

	defm	"p"
	defb	192

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"2"
	defb	0

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
	defb	210

	defm	"C4"
	defb	210

	defm	"4"
	defb	211

	defm	"4#"
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
	defb	8

	defm	""
	defb	153

	defm	""
	defb	151

	defm	"w"
	defb	145

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	128

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

	defm	"y"
	defb	144

	defm	""
	defb	8

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	25

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	12

	defm	""
	defb	137

	defm	""
	defb	151

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	128

	defm	""
	defb	204

	defm	""
	defb	12

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	199

	defm	""
	defb	12

	defm	""
	defb	128

	defm	""
	defb	137

	defm	""
	defb	153

	defm	"w"
	defb	153

	defm	""
	defb	128

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	8

	defm	""
	defb	25

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	200

	defm	""
	defb	17

	defm	""
	defb	140

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	129

	defm	""
	defb	129

	defm	""
	defb	24

	defm	""
	defb	24

	defm	""
	defb	17

	defm	""
	defb	16

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	200

	defm	""
	defb	193

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	193

	defm	""
	defb	140

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	129

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	192

	defm	""
	defb	200

	defm	""
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	24

	defm	""
	defb	153

	defm	""
	defb	129

	defm	""
	defb	192

	defm	""
	defb	176

	defm	""
	defb	188

	defm	""
	defb	17

	defm	""
	defb	140

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	192

	defm	""
	defb	200

	defm	""
	defb	200

	defm	""
	defb	8

	defm	""
	defb	24

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	176

	defm	""
	defb	188

	defm	""
	defb	129

	defm	""
	defb	140

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	200

	defm	""
	defb	8

	defm	""
	defb	200

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	188

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	140

	defm	""
	defb	8

	defm	""
	defb	200

	defm	""
	defb	8

	defm	""
	defb	200

	defm	""
	defb	8

	defm	""
	defb	28

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	177

	defm	""
	defb	188

	defm	""
	defb	129

	defm	""
	defb	140

	defm	""
	defb	140

	defm	""
	defb	28

	defm	""
	defb	12

	defm	""
	defb	8

	defm	""
	defb	24

	defm	""
	defb	24

	defm	""
	defb	24

	defm	""
	defb	24

	defm	"<"
	defb	28

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	192

	defm	"2"
	defb	202

	defm	""
	defb	204

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	192

	defm	""
	defb	194

	defm	"<"
	defb	193

	defm	""
	defb	204

	defm	""
	defb	172

	defm	""
	defb	12

	defm	""
	defb	161

	defm	""
	defb	192

	defm	"42C#"
	defb	34

	defm	""
	defb	204

	defm	""
	defb	17

	defm	""
	defb	196

	defm	"<"
	defb	16

	defm	""
	defb	204

	defm	""
	defb	193

	defm	""
	defb	19

	defm	""
	defb	12

	defm	""
	defb	192

	defm	"2"
	defb	12

	defm	"##"
	defb	172

	defm	""
	defb	18

	defm	""
	defb	202

	defm	""
	defb	194

	defm	"L"
	defb	10

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	12

	defm	"2"
	defb	192

	defm	"3"
	defb	12

	defm	"C"
	defb	34

	defm	"<"
	defb	28

	defm	""
	defb	192

	defm	""
	defb	196

	defm	"M"
	defb	12

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	161

	defm	""
	defb	205

	defm	"3$"
	defb	211

	defm	""
	defb	210

	defm	"C"
	defb	212

	defm	"24=@"
	defb	3

	defm	"M3"
	defb	212

	defm	"4M@"
	defb	0

	defm	""
	defb	5

	defm	",0"
	defb	0

	defm	""
	defb	4

	defm	"@"
	defb	192

	defm	""
	defb	1

	defm	""
	defb	206

	defm	""
	defb	192

	defm	"*"
	defb	0

	defm	""
	defb	13

	defm	""
	defb	193

	defm	""
	defb	204

	defm	""
	defb	192

	defm	""
	defb	236

	defm	""
	defb	225

	defm	""
	defb	204

	defm	""
	defb	12

	defm	"0"
	defb	193

	defm	""
	defb	0

	defm	"S"
	defb	3

	defm	""
	defb	204

	defm	""
	defb	28

	defm	""
	defb	13

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	4

	defm	" 0l"
	defb	16

	defm	"@"
	defb	192

	defm	""
	defb	5

	defm	""
	defb	12

	defm	""
	defb	195

	defm	""
	defb	12

	defm	""
	defb	28

	defm	""
	defb	205

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	2

	defm	""
	defb	12

	defm	"0"
	defb	28

	defm	"lL"
	defb	204

	defm	""
	defb	192

	defm	""
	defb	2

	defm	"C"
	defb	12

	defm	""
	defb	28

	defm	""
	defb	205

	defm	"=D"
	defb	212

	defm	"=D=D4"
	defb	212

	defm	"#D4D44"
	defb	0

	defm	""
	defb	192

	defm	"B@"
	defb	0

	defm	""
	defb	0

	defm	"4"
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

	defm	"<"
	defb	28

	defm	"l"
	defb	0

	defm	""
	defb	160

	defm	""
	defb	0

	defm	"`"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"<`"
	defb	192

	defm	"`"
	defb	192

	defm	"`"
	defb	1

	defm	"4"
	defb	204

	defm	""
	defb	1

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	16

	defm	""
	defb	12

	defm	""
	defb	2

	defm	"L"
	defb	16

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	28

	defm	""
	defb	160

	defm	"C"
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
	defb	4

	defm	"4$#CB$4D4"
	defb	140

	defm	""
	defb	129

	defm	""
	defb	28

	defm	""
	defb	204

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	140

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	12

	defm	""
	defb	128

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	17

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	200

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	200

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	128

	defm	""
	defb	8

	defm	""
	defb	192

	defm	""
	defb	128

	defm	""
	defb	0

	defm	"w"
	defb	193

	defm	""
	defb	24

	defm	""
	defb	0

	defm	""
	defb	128

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
	defb	193

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
	defb	7

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	28

	defm	""
	defb	7

	defm	"wp"
	defb	0

	defm	""
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
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	140

	defm	""
	defb	140

	defm	""
	defb	129

	defm	""
	defb	129

	defm	""
	defb	140

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
	defb	200

	defm	""
	defb	24

	defm	""
	defb	202

	defm	""
	defb	192

	defm	""
	defb	160

	defm	""
	defb	140

	defm	""
	defb	140

	defm	""
	defb	128

	defm	""
	defb	140

	defm	""
	defb	128

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
	defb	200

	defm	""
	defb	8

	defm	""
	defb	10

	defm	""
	defb	12

	defm	""
	defb	160

	defm	""
	defb	128

	defm	""
	defb	140

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	128

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
	defb	8

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	128

	defm	""
	defb	128

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	135

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	200

	defm	""
	defb	12

	defm	""
	defb	193

	defm	"x"
	defb	0

	defm	""
	defb	0

	defm	"w"
	defb	0

	defm	""
	defb	204

	defm	""
	defb	17

	defm	"w"
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

;	SECTION	code


;	SECTION	text

._cerrojos
	defb	2
	defb	7
	defb	5
	defb	0
	defb	14
	defb	12
	defb	7
	defb	0
	defb	15
	defb	12
	defb	2
	defb	0

;	SECTION	code

;	SECTION	text

._malotes
	defb	16
	defb	32
	defb	16
	defb	32
	defb	48
	defb	128
	defb	2
	defb	2
	defb	3
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	128
	defb	0
	defb	1
	defb	1
	defb	176
	defb	128
	defb	176
	defb	16
	defb	176
	defb	128
	defb	0
	defb	-1
	defb	2
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	144
	defb	16
	defb	144
	defb	16
	defb	144
	defb	80
	defb	0
	defb	1
	defb	2
	defb	96
	defb	48
	defb	96
	defb	48
	defb	96
	defb	64
	defb	0
	defb	0
	defb	13
	defb	128
	defb	16
	defb	128
	defb	16
	defb	192
	defb	16
	defb	1
	defb	0
	defb	1
	defb	128
	defb	80
	defb	128
	defb	80
	defb	128
	defb	128
	defb	0
	defb	1
	defb	2
	defb	32
	defb	48
	defb	32
	defb	48
	defb	32
	defb	128
	defb	0
	defb	1
	defb	3
	defb	32
	defb	96
	defb	32
	defb	96
	defb	48
	defb	128
	defb	2
	defb	2
	defb	14
	defb	176
	defb	48
	defb	48
	defb	48
	defb	176
	defb	48
	defb	-2
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
	defb	4
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	128
	defb	0
	defb	1
	defb	1
	defb	128
	defb	80
	defb	128
	defb	48
	defb	128
	defb	80
	defb	0
	defb	-1
	defb	2
	defb	16
	defb	112
	defb	16
	defb	112
	defb	64
	defb	112
	defb	1
	defb	0
	defb	4
	defb	96
	defb	64
	defb	96
	defb	16
	defb	96
	defb	64
	defb	0
	defb	-2
	defb	14
	defb	128
	defb	16
	defb	128
	defb	16
	defb	128
	defb	112
	defb	0
	defb	2
	defb	13
	defb	16
	defb	112
	defb	16
	defb	112
	defb	112
	defb	112
	defb	2
	defb	0
	defb	12
	defb	208
	defb	64
	defb	16
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	3
	defb	48
	defb	32
	defb	48
	defb	32
	defb	208
	defb	32
	defb	1
	defb	0
	defb	4
	defb	208
	defb	112
	defb	32
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	0
	defb	-1
	defb	3
	defb	160
	defb	32
	defb	160
	defb	32
	defb	160
	defb	128
	defb	0
	defb	1
	defb	2
	defb	48
	defb	32
	defb	48
	defb	16
	defb	48
	defb	32
	defb	0
	defb	0
	defb	4
	defb	176
	defb	48
	defb	48
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	64
	defb	16
	defb	64
	defb	16
	defb	176
	defb	16
	defb	1
	defb	0
	defb	1
	defb	176
	defb	80
	defb	32
	defb	80
	defb	176
	defb	96
	defb	-1
	defb	1
	defb	3
	defb	128
	defb	96
	defb	128
	defb	32
	defb	128
	defb	96
	defb	0
	defb	-2
	defb	2
	defb	96
	defb	48
	defb	16
	defb	48
	defb	96
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	16
	defb	16
	defb	16
	defb	16
	defb	96
	defb	16
	defb	1
	defb	0
	defb	2
	defb	208
	defb	48
	defb	64
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	11
	defb	16
	defb	96
	defb	16
	defb	96
	defb	192
	defb	96
	defb	2
	defb	0
	defb	12
	defb	16
	defb	16
	defb	16
	defb	16
	defb	32
	defb	16
	defb	0
	defb	0
	defb	3
	defb	32
	defb	16
	defb	32
	defb	16
	defb	192
	defb	128
	defb	2
	defb	2
	defb	3
	defb	160
	defb	16
	defb	16
	defb	16
	defb	160
	defb	96
	defb	-1
	defb	1
	defb	1
	defb	208
	defb	48
	defb	192
	defb	48
	defb	208
	defb	48
	defb	-2
	defb	0
	defb	14
	defb	32
	defb	32
	defb	32
	defb	32
	defb	64
	defb	96
	defb	1
	defb	1
	defb	1
	defb	64
	defb	16
	defb	64
	defb	16
	defb	160
	defb	32
	defb	1
	defb	1
	defb	2
	defb	192
	defb	48
	defb	160
	defb	48
	defb	192
	defb	112
	defb	-1
	defb	1
	defb	3
	defb	48
	defb	16
	defb	48
	defb	16
	defb	160
	defb	16
	defb	2
	defb	0
	defb	1
	defb	176
	defb	128
	defb	32
	defb	128
	defb	176
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	192
	defb	64
	defb	192
	defb	48
	defb	192
	defb	64
	defb	0
	defb	-1
	defb	12
	defb	208
	defb	16
	defb	16
	defb	16
	defb	208
	defb	16
	defb	-2
	defb	0
	defb	3
	defb	16
	defb	112
	defb	16
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	3
	defb	96
	defb	48
	defb	16
	defb	48
	defb	96
	defb	48
	defb	-1
	defb	0
	defb	4
	defb	16
	defb	32
	defb	16
	defb	32
	defb	16
	defb	112
	defb	0
	defb	2
	defb	11
	defb	112
	defb	16
	defb	112
	defb	16
	defb	112
	defb	96
	defb	0
	defb	1
	defb	2
	defb	160
	defb	48
	defb	160
	defb	48
	defb	160
	defb	112
	defb	0
	defb	2
	defb	14
	defb	128
	defb	16
	defb	128
	defb	16
	defb	128
	defb	128
	defb	0
	defb	2
	defb	1
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	128
	defb	0
	defb	2
	defb	2
	defb	16
	defb	64
	defb	16
	defb	64
	defb	96
	defb	112
	defb	1
	defb	1
	defb	3
	defb	32
	defb	32
	defb	32
	defb	32
	defb	192
	defb	32
	defb	1
	defb	0
	defb	1
	defb	160
	defb	48
	defb	160
	defb	48
	defb	192
	defb	128
	defb	2
	defb	2
	defb	2
	defb	176
	defb	112
	defb	32
	defb	112
	defb	176
	defb	128
	defb	-1
	defb	1
	defb	3
	defb	48
	defb	32
	defb	48
	defb	32
	defb	144
	defb	48
	defb	1
	defb	1
	defb	2
	defb	144
	defb	112
	defb	48
	defb	112
	defb	144
	defb	112
	defb	-1
	defb	0
	defb	4
	defb	16
	defb	16
	defb	16
	defb	16
	defb	16
	defb	128
	defb	0
	defb	1
	defb	1
	defb	48
	defb	16
	defb	48
	defb	16
	defb	80
	defb	80
	defb	1
	defb	1
	defb	1
	defb	32
	defb	80
	defb	32
	defb	80
	defb	48
	defb	80
	defb	1
	defb	0
	defb	2
	defb	32
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	0
	defb	0
	defb	4
	defb	16
	defb	64
	defb	16
	defb	64
	defb	32
	defb	64
	defb	2
	defb	0
	defb	13
	defb	96
	defb	96
	defb	96
	defb	96
	defb	112
	defb	96
	defb	2
	defb	0
	defb	11
	defb	208
	defb	112
	defb	208
	defb	16
	defb	208
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	16
	defb	128
	defb	16
	defb	16
	defb	96
	defb	128
	defb	2
	defb	-2
	defb	2
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	128
	defb	0
	defb	1
	defb	1
	defb	160
	defb	128
	defb	160
	defb	48
	defb	160
	defb	128
	defb	0
	defb	-1
	defb	3
	defb	32
	defb	16
	defb	32
	defb	16
	defb	96
	defb	128
	defb	1
	defb	1
	defb	4
	defb	112
	defb	80
	defb	112
	defb	64
	defb	112
	defb	80
	defb	0
	defb	-2
	defb	11
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	112
	defb	0
	defb	1
	defb	3
	defb	32
	defb	112
	defb	32
	defb	112
	defb	208
	defb	112
	defb	1
	defb	0
	defb	4
	defb	208
	defb	80
	defb	208
	defb	16
	defb	208
	defb	80
	defb	0
	defb	-1
	defb	1
	defb	112
	defb	32
	defb	16
	defb	32
	defb	112
	defb	32
	defb	-1
	defb	0
	defb	2
	defb	112
	defb	112
	defb	16
	defb	112
	defb	112
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	32
	defb	80
	defb	32
	defb	16
	defb	32
	defb	80
	defb	0
	defb	-1
	defb	4
	defb	80
	defb	80
	defb	80
	defb	32
	defb	80
	defb	80
	defb	0
	defb	-1
	defb	2

;	SECTION	code

;	SECTION	text

._hotspots
	defb	17
	defb	2
	defb	0
	defb	85
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
	defb	113
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	151
	defb	1
	defb	0
	defb	113
	defb	1
	defb	0
	defb	98
	defb	1
	defb	0
	defb	214
	defb	1
	defb	0
	defb	209
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	1
	defb	0
	defb	210
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	72
	defb	2
	defb	0
	defb	49
	defb	1
	defb	0
	defb	114
	defb	1
	defb	0
	defb	23
	defb	1
	defb	0
	defb	102
	defb	1
	defb	0
	defb	210
	defb	2
	defb	0
	defb	130
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0

;	SECTION	code


._marrullers_select_direction
	ld hl, (_enit)
	ld h, 0
	ld de, _en_an_ff
	add hl, de
	ld c, (hl)
	xor a
	sub c
	ld b, a
	push bc
	.marrullers_pick
	call _rand
	ld a, l
	and 3
	ld hl, (_enit)
	ld h, 0
	ld de, _last_d
	add hl, de
	ld c, (hl)
	cp c
	jr z, marrullers_pick
	ld (hl), a
	pop bc
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



._extra_enems_init
	ld	a,(__en_t)
	cp	#(11 % 256)
	jr	z,i_29_uge
	jp	c,i_29
.i_29_uge
	ld	a,(__en_t)
	cp	#(14 % 256)
	jr	z,i_30_i_29
	jr	c,i_30_i_29
.i_29
	jp	i_28
.i_30_i_29
	ld	hl,(__en_t)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	call	_enems_en_an_calc
	ld a, (__en_x)
	and 0xf0
	ld (__en_x), a
	ld a, (__en_y)
	and 0xf0
	ld (__en_y), a
	ld a, (__en_my)
	ld c, a
	ld a, (__en_mx)
	add c
	call _abs_a
	ld de, (_enit)
	ld d, 0
	ld hl, _en_an_ff
	add hl, de
	ld (hl), a
.i_28
	ret



._extra_enems_move
	ld	a,(__en_t)
	cp	#(11 % 256)
	jr	z,i_32_uge
	jp	c,i_32
.i_32_uge
	ld	a,(__en_t)
	cp	#(14 % 256)
	jr	z,i_33_i_32
	jr	c,i_33_i_32
.i_32
	jp	i_31
.i_33_i_32
	.en_marruller_horizontal_axis
	ld a, (__en_mx)
	or a
	jr z, en_marruller_horizontal_axis_do
	ld c, a
	ld a, (__en_x)
	add c
	ld (__en_x), a
	call en_bg_collision_horz
	xor a
	or l
	jp nz, _marrullers_select_direction
	.en_marruller_horizontal_axis_do
	.en_marruller_vertical_axis
	ld a, (__en_my)
	or a
	jr z, en_marruller_vertical_axis_done
	ld c, a
	ld a, (__en_y)
	add c
	ld (__en_y), a
	call en_bg_collision_vert
	xor a
	or l
	jp nz, _marrullers_select_direction
	.en_marruller_vertical_axis_done
	.en_marruller_done
.i_31
	ret



._extra_enems_checks
	ret



._extra_enems_killed
	ret



._should_collide
	ld	hl,1 % 256	;const
	ret


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
	._abs_a
	bit 7, a
	ret z
	neg
	ret
;	SECTION	text

._player_walk_cycle
	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	1

;	SECTION	code



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



._collide_enem
	ld hl, 0
	ld a, (_gpx)
	ld c, a
	ld a, (__en_x)
	add 12
	cp c
	ret c
	ld a, (__en_x)
	ld c, a
	ld a, (_gpx)
	add 12
	cp c
	ret c
	ld a, (_gpy)
	ld c, a
	ld a, (__en_y)
	add 12
	cp c
	ret c
	ld a, (__en_y)
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
	bit 7, h
	ret z
	call l_neg
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
	jp	nc,i_36
	ld	hl,_player+28
	call	l_gchar
	ld	a,h
	or	l
	jr	nz,i_37_i_36
.i_36
	jp	i_35
.i_37_i_36
	xor a
	ld (__t), a
	ld a, (_comportamiento_tiles) ;; beh [0]
	ld (__n), a
	ld a, (_rdx)
	ld (__x), a
	ld a, (_rdy)
	ld (__y), a
	call set_map_tile_do
	ld b, 3
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
	ld a, (_rdx)
	cp d
	jr nz, clear_cerrojo_loop_continue
	ld a, (_rdy)
	cp e
	jr nz, clear_cerrojo_loop_continue
	xor a
	ld (hl), a
	jr clear_cerrojo_loop_done
	.clear_cerrojo_loop_continue
	inc hl
	djnz clear_cerrojo_loop
	.clear_cerrojo_loop_done
	ld	hl,_player+28
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
.i_35
	ret



._init_cerrojos
	ld b, 3
	ld hl, _cerrojos + 3
	ld de, 4
	ld a, 1
	.init_cerrojos_loop
	ld (hl), a
	add hl, de
	djnz init_cerrojos_loop
	ret



._move_tile_with_check
	ld a, (_x1)
	ld c, a
	ld a, (_y1)
	call _attr_enems
	xor a
	or l
	ret nz
	ld	hl,(_x0)
	ld	h,0
	push	hl
	ld	hl,(_y0)
	ld	h,0
	push	hl
	ld	hl,0	;const
	push	hl
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
	ld	hl,14	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,2	;const
	call	_peta_el_beeper
	ret



._cm_two_points
	ld a, (__x)
	cp 15
	jr nc, _cm_two_points_at1_reset
	ld a, (__y)
	cp 10
	jr c, _cm_two_points_at1_do
	._cm_two_points_at1_reset
	xor a
	jr _cm_two_points_at1_done
	._cm_two_points_at1_do
	ld a, (__y)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (__x)
	add b
	ld e, a
	ld d, 0
	ld hl, _map_attr
	add hl, de
	ld a, (hl)
	._cm_two_points_at1_done
	ld (_at1), a
	ld a, (__x2)
	cp 15
	jr nc, _cm_two_points_at2_reset
	ld a, (__y2)
	cp 10
	jr c, _cm_two_points_at2_do
	._cm_two_points_at2_reset
	xor a
	jr _cm_two_points_at2_done
	._cm_two_points_at2_do
	ld a, (__y2)
	ld b, a
	sla a
	sla a
	sla a
	sla a
	sub b
	ld b, a
	ld a, (__x2)
	add b
	ld e, a
	ld d, 0
	ld hl, _map_attr
	add hl, de
	ld a, (hl)
	._cm_two_points_at2_done
	ld (_at2), a
	ret



._check_lock_or_box_horz
	ld a, (__x)
	ld (_rdx), a
	ld c, a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_rdy), a
	call qtile_do
	ld a, l
	ld (_rda), a
	cp 14
	jr nz, box_horz_done
	ld a, (_rdx)
	ld (_x0), a
	ld a, (_rdy)
	ld (_y0), a
	ld (_y1), a
	ld hl, (_player + 6)
	bit 7, h
	jr nz, box_horz_left
	.box_horz_right
	ld a, (_x0)
	inc a
	ld (_x1), a
	jr box_horz_do
	.box_horz_left
	ld a, (_x0)
	dec a
	ld (_x1), a
	.box_horz_do
	call _move_tile_with_check
	.box_horz_done
	ld a, (_rda)
	cp 15
	jr nz, lock_horz_done
	call _check_and_clear_cerrojo
	.lock_horz_done
	ret



._check_lock_or_box_vert
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_rdx), a
	ld c, a
	ld a, (__y)
	ld (_rdy), a
	call qtile_do
	ld a, l
	ld (_rda), a
	cp 14
	jr nz, box_vert_done
	ld a, (_rdy)
	ld (_y0), a
	ld a, (_rdx)
	ld (_x0), a
	ld (_x1), a
	ld hl, (_player + 8)
	bit 7, h
	jr nz, box_vert_up
	.box_vert_down
	ld a, (_y0)
	inc a
	ld (_y1), a
	jr box_vert_do
	.box_vert_up
	ld a, (_y0)
	dec a
	ld (_y1), a
	.box_vert_do
	call _move_tile_with_check
	.box_vert_done
	ld a, (_rda)
	cp 15
	jr nz, lock_vert_done
	call _check_and_clear_cerrojo
	.lock_vert_done
	ret



._move
	xor a
	ld (_hit), a
	ld (_thrusting), a
	call _pad_read
	ld a, (_pad0)
	ld c, a
	and 0x04
	jr z, m_vert_kp_up_or_down_p
	ld a, c
	and 0x08
	jr z, m_vert_kp_up_or_down_p
	ld hl, (_player + 8)
	ld a, h
	or l
	jr z, m_vert_kp_done
	bit 7, h
	jr nz, m_vert_kp_rx_negative
	.m_vert_kp_rx_positive
	ld de, -24
	add hl, de
	bit 7, h
	jr z, m_vert_kp_vy_write
	ld hl, 0
	jr m_vert_kp_vy_write
	.m_vert_kp_rx_negative
	ld de, 24
	add hl, de
	bit 7, h
	jr nz, m_vert_kp_vy_write
	ld hl, 0
	jr m_vert_kp_vy_write
	.m_vert_kp_up_or_down_p
	ld a, 1
	ld (_thrusting), a
	ld a, c
	and 0x04
	jr nz, m_vert_kp_up_done
	.m_vert_kp_up_do
	ld de, -24
	ld hl, (_player + 8)
	add hl, de
	ld de, -256
	call l_gt
	jr nc, m_vert_kp_up_facing
	ex de, hl
	.m_vert_kp_up_facing
	ld a, 4
	ld (_player + 22), a
	jr m_vert_kp_vy_write
	.m_vert_kp_up_done
	ld a, c
	and 0x08
	jr nz, m_vert_kp_down_done
	.m_vert_kp_down_do
	ld de, 24
	ld hl, (_player + 8)
	add hl, de
	ld de, 256
	call l_lt
	jr nc, m_vert_kp_down_facing
	ex de, hl
	.m_vert_kp_down_facing
	ld a, 6
	ld (_player + 22), a
	.m_vert_kp_down_done
	.m_vert_kp_vy_write
	ld (_player + 8), hl
	.m_vert_kp_done
	ld hl, (_player + 8)
	ex de, hl
	ld hl, (_player + 2)
	add hl, de
	bit 7, h
	jr z, m_vert_thrust_notneg
	ld hl, 0
	jr m_vert_thurst_write
	.m_vert_thrust_notneg
	ld de, 144*64
	call l_lt
	jr nc, m_vert_thurst_write
	ex de, hl
	.m_vert_thurst_write
	ld (_player + 2), hl
	call HLshr6_A
	ld (_gpy), A
	ld hl, (_ptgmy)
	ex de, hl
	ld hl, (_player + 8)
	add hl, de
	ld (_pvy_total), hl
	ld a, h
	or l
	jp z, m_vert_coll_done
	.m_vert_coll_do
	ld a, (_gpx)
	ld c, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (__x), a
	ld a, c
	add 11
	srl a
	srl a
	srl a
	srl a
	ld (__x2), a
	bit 7, h
	jr nz, m_vert_coll_up
	.m_vert_coll_down
	ld a, (_gpy)
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	ld (__y2), a
	call _cm_two_points
	ld a, (_at1)
	and 12
	jr nz, m_vert_coll_down_adjust
	ld a, (_at2)
	and 12
	jr z, m_vert_coll_checks_done
	.m_vert_coll_down_adjust
	call _check_lock_or_box_vert
	ld hl, 0
	ld (_player + 8), hl
	ld a, (_gpy)
	and 0xf0
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	jr m_vert_coll_checks_done
	.m_vert_coll_up
	ld a, (_gpy)
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	ld (__y2), a
	call _cm_two_points
	ld a, (_at1)
	and 8
	jr nz, m_vert_coll_up_adjust
	ld a, (_at2)
	and 8
	jr z, m_vert_coll_checks_done
	.m_vert_coll_up_adjust
	call _check_lock_or_box_vert
	ld hl, 0
	ld (_player + 8), hl
	ld a, (_gpy)
	and 0xf0
	add 12
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	.m_vert_coll_checks_done
	ld a, (_at1)
	and 1
	jr nz, m_vert_coll_sethit
	ld a, (_at2)
	and 1
	jr z, m_vert_coll_done
	.m_vert_coll_sethit
	ld a, 1
	ld (_hit), a
	.m_vert_coll_done
	ld a, (_pad0)
	ld c, a
	and 0x01
	jr z, m_horz_kp_left_or_right_p
	ld a, c
	and 0x02
	jr z, m_horz_kp_left_or_right_p
	ld hl, (_player + 6)
	ld a, h
	or l
	jr z, m_horz_kp_done
	bit 7, h
	jr nz, m_horz_kp_rx_negative
	.m_horz_kp_rx_positive
	ld de, -24
	add hl, de
	bit 7, h
	jr z, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_rx_negative
	ld de, 24
	add hl, de
	bit 7, h
	jr nz, m_horz_kp_vx_write
	ld hl, 0
	jr m_horz_kp_vx_write
	.m_horz_kp_left_or_right_p
	ld a, 1
	ld (_thrusting), a
	ld a, c
	and 0x01
	jr nz, m_horz_kp_left_done
	.m_horz_kp_left_do
	ld de, -24
	ld hl, (_player + 6)
	add hl, de
	ld de, -256
	call l_gt
	jr nc, m_horz_kp_left_facing
	ex de, hl
	.m_horz_kp_left_facing
	ld a, 2
	ld (_player + 22), a
	jr m_horz_kp_vx_write
	.m_horz_kp_left_done
	ld a, c
	and 0x02
	jr nz, m_horz_kp_right_done
	.m_horz_kp_right_do
	ld de, 24
	ld hl, (_player + 6)
	add hl, de
	ld de, 256
	call l_lt
	jr nc, m_horz_kp_right_facing
	ex de, hl
	.m_horz_kp_right_facing
	ld a, 0
	ld (_player + 22), a
	.m_horz_kp_right_done
	.m_horz_kp_vx_write
	ld (_player + 6), hl
	.m_horz_kp_done
	ld hl, (_player + 6)
	ex de, hl
	ld hl, (_player + 0)
	add hl, de
	bit 7, h
	jr z, m_horz_thrust_notneg
	ld hl, 0
	jr m_horz_thurst_write
	.m_horz_thrust_notneg
	ld de, 224*64
	call l_lt
	jr nc, m_horz_thurst_write
	ex de, hl
	.m_horz_thurst_write
	ld (_player + 0), hl
	call HLshr6_A
	ld (_gpx), A
	ld hl, (_ptgmx)
	ex de, hl
	ld hl, (_player + 6)
	add hl, de
	ld (_pvx_total), hl
	ld a, h
	or l
	jp z, m_horz_coll_done
	.m_horz_coll_do
	ld a, (_gpy)
	ld c, a
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (__y), a
	ld a, c
	add 15
	srl a
	srl a
	srl a
	srl a
	ld (__y2), a
	bit 7, h
	jr nz, m_horz_coll_left
	.m_horz_coll_right
	ld a, (_gpx)
	add 12
	srl a
	srl a
	srl a
	srl a
	ld (__x), a
	ld (__x2), a
	call _cm_two_points
	ld a, (_at1)
	and 12
	jr nz, m_horz_coll_right_adjust
	ld a, (_at2)
	and 12
	jr z, m_horz_coll_checks_done
	.m_horz_coll_right_adjust
	call _check_lock_or_box_horz
	ld hl, 0
	ld (_player + 6), hl
	ld a, (_gpx)
	and 0xf0
	add 4
	ld (_gpx), a
	call Ashl16_HL
	ld (_player + 0), HL
	jr m_horz_coll_checks_done
	.m_horz_coll_left
	ld a, (_gpx)
	add 4
	srl a
	srl a
	srl a
	srl a
	ld (__x), a
	ld (__x2), a
	call _cm_two_points
	ld a, (_at1)
	and 8
	jr nz, m_horz_coll_left_adjust
	ld a, (_at2)
	and 8
	jr z, m_horz_coll_checks_done
	.m_horz_coll_left_adjust
	call _check_lock_or_box_horz
	ld hl, 0
	ld (_player + 6), hl
	ld a, (_gpx)
	and 0xf0
	add 12
	ld (_gpx), a
	call Ashl16_HL
	ld (_player + 0), HL
	.m_horz_coll_checks_done
	ld a, (_at1)
	and 1
	jr nz, m_horz_coll_sethit
	ld a, (_at2)
	and 1
	jr z, m_horz_coll_done
	.m_horz_coll_sethit
	ld a, 1
	ld (_hit), a
	ld hl, (_pvy_total)
	ld (_player + 8), hl
	.m_horz_coll_done
	ld hl, (_pvx_total)
	call _abs
	ex de, hl
	ld hl, (_pvy_total)
	call _abs
	call l_gt
	rl a
	and 1
	ld (_rdi), a
	ld a, (_hit)
	or a
	jr z, m_evil_tile_hit_done
	.m_evil_tile_hit_do
	ld a, (_rdi)
	or a
	jr z, m_evil_tile_hit_v
	.m_evil_tile_hit_h
	ld hl, (_pvx_total)
	call l_neg
	ld (_player + 6), hl
	jr m_evil_tile_vel_set
	.m_evil_tile_hit_v
	ld hl, (_pvy_total)
	call l_neg
	ld (_player + 8), hl
	.m_evil_tile_vel_set
	ld l, 2
	call _peta_el_beeper
	ld a, 1
	ld (_player + 46), a
	ld a, 1
	ld (_player + 36), a
	.m_evil_tile_hit_done
	ld c, 0
	ld a, (_thrusting)
	or a
	jr z, m_frame_set
	ld a, (_rdi)
	or a
	ld a, (_gpx)
	jr nz, m_frame_thrust_set
	ld a, (_gpy)
	.m_frame_thrust_set
	srl a
	srl a
	srl a
	and 1
	ld c, a
	.m_frame_set
	ld a, (_player + 22)
	add c
	ld (_player + 20), a
	ld hl, (_player + 20)
	ld h, 0
	add hl, hl
	ld de, _player_cells
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (_player + 17), hl
	ret



._init_player_values
	ld	a,#(128 % 256 % 256)
	ld	(_gpx),a
	ld	hl,80 % 256	;const
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
	ld (_player+36),a
	ld a, 6
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 99
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 5 * 5
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
	add 0
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
	ld a, (_scenery_info + 0)
	or a
	ret nz
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
	ld a, (ix+2)
	or a
	jr nz, hotspot_paint_noact_skip
	call _rand
	ld a, l
	and 3
	cp 2
	jr nz, hotspot_paint_noact_skip
	ld a, 3
	ld (_hotspot_t_r), a
	.hotspot_paint_noact_skip
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
	add 0
	ld (__x), a
	ld a, (_rdy)
	sla a
	add 2
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
	jr draw_scr_bg_loop_end
	.draw_scr_bg_loop_end
	call	_hotspot_paint
	ld hl, _cerrojos
	ld b, 3
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
	jp	i_40
.i_38
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_40
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_39
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
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
.i_43
	ld	a,l
	cp	#(1% 256)
	jp	z,i_44
	cp	#(2% 256)
	jp	z,i_45
	cp	#(3% 256)
	jp	z,i_46
	cp	#(4% 256)
	jp	z,i_47
	jp	i_48
.i_44
.i_45
.i_46
.i_47
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_42
.i_48
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
.i_42
	call	_extra_enems_init
	call enems_update_values_store
	jp	i_38
.i_39
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
	jp	i_51
.i_49
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_51
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_50
	jp	nc,i_50
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_52
	ld a, (_maincounter)
	and 3
	jr nz, enems_animate_done
	ld bc, (_enit)
	ld b, 0
	ld hl, _en_an_frame
	add hl, bc
	ld a, (hl)
	xor 1
	ld (hl), a
	.enems_animate_done
	ld	a,(__en_t)
	ld	e,a
	ld	d,0
	ld	hl,4	;const
	call	l_ule
	jp	nc,i_53
	call en_lineal_do
.i_53
	call	_enems_calc_frame
	call	_extra_enems_move
	call	_should_collide
	ld	a,h
	or	l
	jp	z,i_55
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_55
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_55
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_55
	jr	c,i_56_i_55
.i_55
	jp	i_54
.i_56_i_55
	ld	a,(_player+23)
	and	a
	jp	nz,i_57
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2	;const
	call	_peta_el_beeper
	ld	hl,_player+46
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+36
	ld	(hl),#(2 % 256 % 256)
	ld	hl,__en_mx
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_58
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x)
	ld	h,0
	call	l_ult
	jp	nc,i_59
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
	jp	i_60
.i_59
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
.i_60
.i_58
	ld	hl,__en_my
	call	l_gchar
	ld	a,h
	or	l
	jp	z,i_61
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ult
	jp	nc,i_62
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
	jp	i_63
.i_62
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
.i_63
.i_61
.i_57
.i_54
	call	_extra_enems_checks
.i_52
.i_64
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_49
.i_50
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
	.enems_get_values
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
	ret
	.enems_update_values_store
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
	ret
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
	.en_bg_collision_horz
	ld a, (__en_mx)
	or a
	ld l, a
	ret z
	call __ctileoff
	ld (_rdi), a
	ld c, a
	call en_xx_calc
	call en_yy_calc
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
	ld l, a
	ret z
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
	._en_bg_collision_horz_done
	ld l, 1
	ret
	.en_bg_collision_vert
	ld a, (__en_my)
	or a
	ld l, a
	ret z
	call __ctileoff
	ld (_rdi), a
	ld c, a
	call en_xx_calc
	call en_yy_calc
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
	ld hl, 0
	or a
	ld l, a
	ret z
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
	._en_bg_collision_vert_done
	ld l, 1
	ret
	.en_lineal_do
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
	ld a, (__en_mx)
	call _abs_a
	ld (__en_mx), a
	jr horz_limit_skip_2
	.horz_limit_skip_1
	ld a, (__en_x2)
	ld c, a
	ld a, (__en_x)
	cp c
	jr c, horz_limit_skip_2
	ld a, (__en_x2)
	ld (__en_x), a
	ld a, (__en_mx)
	call _abs_a
	neg
	ld (__en_mx), a
	.horz_limit_skip_2
	.en_linear_horizontal_axis_done
	call en_bg_collision_horz
	xor a
	or l
	jr z, en_linear_horz_no_coll
	ld a, (__en_mx)
	neg
	ld (__en_mx), a
	.en_linear_horz_no_coll
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
	ld a, (__en_my)
	call _abs_a
	ld (__en_my), a
	jr vert_limit_skip_2
	.vert_limit_skip_1
	ld a, (__en_y2)
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, vert_limit_skip_2
	ld a, (__en_y2)
	ld (__en_y), a
	ld a, (__en_my)
	call _abs_a
	neg
	ld (__en_my), a
	.vert_limit_skip_2
	.en_linear_vertical_axis_done
	call en_bg_collision_vert
	xor a
	or l
	jr z, en_linear_vert_no_coll
	ld a, (__en_my)
	neg
	ld (__en_my), a
	.en_linear_vert_no_coll
	.en_linear_done
	ret
	._s_title
	BINARY "titlec.bin"
	._s_marco
	._s_ending
	BINARY "endingc.bin"

._title_screen
	call	_blackout
	ld hl, _s_title
	call _unpack_screen
	ld	hl,12	;const
	push	hl
	ld	hl,13	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,0	;const
	call	_wyz_play_music
	call	_select_controls
	ret



._game_ending
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
	call	_no_break
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld	hl,0	;const
	call	_wyz_play_music
	ld	hl,5000	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
	ret



._game_over
	call	_wyz_stop_sound
	ld a, 10
	ld (__x), a
	ld a, 11
	ld (__y), a
	ld a, 21
	ld (__x2), a
	ld a, 13
	ld (__y2), a
	ld a, 72
	ld (__t), a
	call	_draw_rectangle
	ld	hl,11	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,i_1+9
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	call	_no_break
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,2	;const
	call	_wyz_play_music
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
	ret



._main
	call	_system_init
.i_65
	call	_title_screen
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_cerrojos
	ld	hl,12 % 256	;const
	ld	a,l
	ld	(_n_pant),a
	xor a
	ld (_maincounter), a
	ld (_half_life), a
	ld (_scenery_info + 0), a
	ld (_scenery_info + 1), a
	ld a, 255
	ld (_objs_old), a
	ld (_life_old), a
	ld (_keys_old), a
	ld (_killed_old), a
	ld (_flag_old), a
	ld (_on_pant), a
	ld	hl,1	;const
	call	_wyz_play_music
.i_67
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_68
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
	jp	nc,i_69
	ld	hl,30	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,_player+27
	call	l_gchar
	ld	de,14
	ex	de,hl
	and	a
	sbc	hl,de
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
.i_69
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_70
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_71
	or	l
	jp	z,i_71
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_72
.i_71
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_72
	ld	hl,30	;const
	push	hl
	ld	hl,8	;const
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
.i_70
	ld	hl,_player+28
	call	l_gchar
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_73
	ld a, 30
	ld (__x), a
	ld a, 16
	ld (__y), a
	ld a, (_player + 28)
	ld (_keys_old), a
	call draw_2_digits_shortcut
.i_73
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
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
	ld	a,(_hotspot_t)
	and	a
	jp	z,i_74
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_77
	ld	a,l
	cp	#(1% 256)
	jp	z,i_78
	cp	#(2% 256)
	jp	z,i_79
	cp	#(3% 256)
	jp	z,i_80
	jp	i_76
.i_78
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,7	;const
	call	_peta_el_beeper
	jp	i_76
.i_79
	ld	hl,_player+28
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,8	;const
	call	_peta_el_beeper
	jp	i_76
.i_80
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,25
	add	hl,bc
	pop	de
	call	l_pint
	ld	hl,(_player+29)
	ld	de,99	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_81
	ld	hl,99	;const
	ld	(_player+29),hl
.i_81
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_76
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_82
	ld	a,(_hotspot_x)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,0
	add	hl,de
	push	hl
	ld	a,(_hotspot_y)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,2
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
.i_82
.i_74
	._hotspots_else
	._hotspots_done
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_84
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_85_i_84
.i_84
	jp	i_83
.i_85_i_84
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_86
.i_83
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_88
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_89_i_88
.i_88
	jp	i_87
.i_89_i_88
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_87
.i_86
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_91
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_91
	ld	a,(_n_pant)
	cp	#(5 % 256)
	jr	z,i_91_uge
	jp	c,i_91
.i_91_uge
	jr	i_92_i_91
.i_91
	jp	i_90
.i_92_i_91
	ld a, (_n_pant)
	sub 5
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_93
.i_90
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_95
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_96_i_95
.i_95
	jp	i_94
.i_96_i_95
	ld a, (_n_pant)
	add 5
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_94
.i_93
	ld	hl,_player+27
	call	l_gchar
	ld	de,14	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_97
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_97
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_98
	.player_is_dead
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+29
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl,(_player+46)
	ld	h,0
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	call	l_pint
.i_98
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	p,i_99
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_99
	xor a
	ld (_pant_just_rendered), a
	jp	i_67
.i_68
	jp	i_65
.i_66
	ret


;	SECTION	text

.i_1
	defm	"MK1 V3.2"
	defb	0

	defm	"GAME OVER!"
	defb	0

;	SECTION	code



; --- Start of Static Variables ---

;	SECTION	bss

.__en_t	defs	1
.__en_x	defs	1
.__en_y	defs	1
._isr_player_on	defs	1
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._hotspot_t	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
.__en_mx	defs	1
.__en_my	defs	1
._flags	defs	16
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._killed_old	defs	1
._thrusting	defs	1
._wyz_beat_ct	defs	1
._t_alt	defs	1
._x0	defs	1
._x1	defs	1
._y0	defs	1
._y1	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
._last_d	defs	3
._enit	defs	1
._gpcx	defs	2
._gpcy	defs	2
._rdt1	defs	1
._rdt2	defs	1
._gpit	defs	1
._playing	defs	1
._scenery_info	defs	2
._seed	defs	2
._objs_old	defs	1
._maincounter	defs	1
._rdmt	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._flag_old	defs	1
._wall	defs	1
._pvx_total	defs	2
._hotspot_t_r	defs	1
._at1	defs	1
._at2	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._pvy_total	defs	2
._idx	defs	2
._hit	defs	1
._player	defs	47
._rda	defs	1
._rdb	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdi	defs	1
._keys_old	defs	1
._tat	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._tqt	defs	1
._tpx	defs	1
._tpy	defs	1
._enoffsmasi	defs	2
._pant_just_rendered	defs	1
.__baddies_pointer	defs	2
._orig_tile	defs	1
._success	defs	1
;	SECTION	code



; --- Start of Scope Defns ---

	XDEF	__en_t
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_isr_player_on
	XDEF	_hotspots
	LIB	cpc_PutTrSp8x8TileMapPxM1
	LIB	cpc_PutTrSp16x16TileMapPxM1
	LIB	cpc_PutTrSp16x24TileMapPxM1
	XDEF	_draw_scr
	XDEF	_spr_next
	defc	_spr_next	=	58944
	XDEF	_wyz_play_music
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	XDEF	_sm_invfunc
	LIB	cpc_PutSpTileMap12x24CA
	LIB	cpc_PrintGphStrStdXY
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	XDEF	_sprites
	LIB	cpc_PutTiles
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	__en_y2
	XDEF	_def_keys
	XDEF	_cortina
	LIB	cpc_PrintGphStrM12X
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54835
	XDEF	_extra_enems_init
	XDEF	_hotspot_t
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_marrullers_select_direction
	XDEF	_player_walk_cycle
	XDEF	_half_life
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_ShowScrTileMap
	LIB	cpc_SetMode
	LIB	cpc_ClrScr
	XDEF	_get_pointer_to_enem_or_coco
	LIB	cpc_SetModo
	XDEF	_en_an_state
	defc	_en_an_state	=	54829
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_extra_enems_move
	XDEF	_gp_gen_alt
	XDEF	_mueve_bicharracos
	LIB	cpc_ShowTouchedTiles2
	LIB	cpc_SetTile
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	LIB	cpc_PutSpTileMap8x8PxM1
	LIB	cpc_PutSpTileMap16x16PxM1
	LIB	cpc_PutSpTileMap16x24PxM1
	LIB	cpc_CollSp
	LIB	cpc_PutMaskSp4x16
	XDEF	_gp_gen_org
	XDEF	_blackout
	XDEF	_map_buff
	defc	_map_buff	=	50838
	LIB	cpc_PrintGphStrStd
	XDEF	_cpc_Border
	XDEF	_killed_old
	XDEF	_thrusting
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_invalidate_viewport
	LIB	cpc_ShowTileMap
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_wyz_beat_ct
	XDEF	_t_alt
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_cpc_UpdateNow
	XDEF	_extra_enems_checks
	XDEF	_x0
	XDEF	_x1
	XDEF	_y0
	XDEF	_y1
	LIB	cpc_PutTrSp2Bx8TileMapG
	LIB	cpc_PutTrSp4Bx16TileMapG
	LIB	cpc_PutTrSp4Bx24TileMapG
	XDEF	_espera_activa
	LIB	cpc_SpRLM1
	XDEF	__n
	XDEF	_unpack_screen
	XDEF	_title_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	54826
	XDEF	__t
	XDEF	__x
	XDEF	__y
	XDEF	_wyz_init
	XDEF	_life_old
	LIB	cpc_PrintGphStrXY2X
	LIB	cpc_SpRRM1
	XDEF	_enems_en_an_calc
	XDEF	_sm_sprptr
	LIB	cpc_PrintGphStrXYM1
	LIB	cpc_PutTrSp12x24TileMapGCA
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	LIB	cpc_TestKey
	LIB	cpc_PutSprite
	XDEF	cpc_PutSpTileMap
	LIB	cpc_PutTrSpTileMap
	LIB	cpc_PutORSpTileMap
	LIB	cpc_PutCpSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	LIB	cpc_PutSPTileMap4Bx16
	LIB	cpc_PutSPTileMap4Bx24
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_cm_two_points
	XDEF	_draw_and_advance
	LIB	cpc_TouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	LIB	cpc_SetTouchTileXY
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_sprite_18_a
	LIB	cpc_PutTrSp4x8TileMapGPx
	LIB	cpc_PutTrSp8x16TileMapGPx
	LIB	cpc_PutTrSp8x24TileMapGPx
	XDEF	_init_player
	XDEF	_gp_gen
	XDEF	_spr_x
	defc	_spr_x	=	58956
	XDEF	_spr_y
	defc	_spr_y	=	58960
	XDEF	_on_pant
	XDEF	_render_this_enemy
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
	XDEF	__tile_address
	XDEF	_n_pant
	LIB	cpc_UpdScrM1P
	XDEF	_def_keys_joy
	XDEF	_en_j
	LIB	cpc_SetBorder
	XDEF	_en_an_ff
	defc	_en_an_ff	=	54832
	LIB	cpc_RLI
	XDEF	_system_init
	XDEF	_draw_rectangle
	XDEF	_last_d
	LIB	cpc_RRI
	LIB	cpc_GetSp
	XDEF	_enit
	XDEF	_collide_enem
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_main
	XDEF	_mapa
	XDEF	_draw_coloured_tile
	XDEF	_attr
	XDEF	_player_cells
	LIB	cpc_ResetTouchedTiles
	XDEF	_gpcx
	XDEF	_gpcy
	LIB	cpc_ShowTouchedTiles
	XDEF	_rdt1
	XDEF	_rdt2
	XDEF	_s_title
	XDEF	_gpit
	XDEF	_playing
	XDEF	_en_an_vx
	defc	_en_an_vx	=	54814
	XDEF	_en_an_vy
	defc	_en_an_vy	=	54820
	LIB	cpc_PutMaskSp2x8
	XDEF	_sm_updfunc
	LIB	cpc_ScanKeyboard
	LIB	cpc_SetColour
	XDEF	_scenery_info
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_maincounter
	XDEF	_rdmt
	LIB	cpc_PutTrSp2Bx8TileMap
	LIB	cpc_PutTrSp4Bx16TileMap
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	LIB	cpc_PutTrSp4Bx24TileMap
	XDEF	_extra_enems_killed
	XDEF	_move
	XDEF	_flag_old
	XDEF	_wall
	LIB	cpc_UpdScr
	LIB	cpc_PutTrSp16x16TileMapPxM1LUT
	XDEF	_check_and_clear_cerrojo
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	54796
	XDEF	_pvx_total
	XDEF	_hotspot_t_r
	LIB	cpc_ScrollLeft0
	XDEF	_at1
	XDEF	_at2
	XDEF	__x2
	XDEF	__y2
	LIB	cpc_PutSPTileMap2Bx8
	LIB	cpc_AnyKeyPressed
	XDEF	_step
	XDEF	__en_life
	XDEF	_cpc_HardPause
	LIB	cpc_AssignKey
	XDEF	_prxx
	XDEF	_calc_hotspot_ptr
	XDEF	_pryy
	LIB	cpc_TouchTiles
	LIB	cpc_PutSPTileMap4x8Px
	XDEF	_abs
	LIB	cpc_ScrollRight0
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
	LIB	cpc_MakeM1RotationLUTs
	LIB	cpc_PutTrSp4x8TileMapPx
	LIB	cpc_PutTrSp8x8TileMapPx
	LIB	cpc_PutTrSp8x16TileMapPx
	LIB	cpc_PutTrSp8x24TileMapPx
	LIB	cpc_UnExo
	XDEF	_pvy_total
	LIB	cpc_SetInkGphStrM1
	XDEF	_idx
	XDEF	_hit
	XDEF	_en_an_x
	defc	_en_an_x	=	54802
	XDEF	_player
	XDEF	_en_an_y
	defc	_en_an_y	=	54808
	LIB	cpc_PutMaskSpriteTileMap
	LIB	cpc_PutTrSpriteTileMap
	LIB	cpc_UpdateTileMap
	XDEF	_rda
	XDEF	_rdb
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	LIB	cpc_PutSpTileMap8x8Px
	XDEF	_rdi
	XDEF	_keys_old
	XDEF	_init_player_values
	XDEF	_en_tocado
	LIB	cpc_TestKeyF
	XDEF	_tat
	LIB	cpc_PutTrSp16x16TileMapGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	LIB	cpc_PutTrSp16x24TileMapGPxM1P
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	_draw_2_digits
	XDEF	_check_lock_or_box_horz
	XDEF	_init_hotspots
	XDEF	_pti
	XDEF	_tileset
	XDEF	_ptj
	XDEF	_no_break
	XDEF	_comportamiento_tiles
	XDEF	_should_collide
	XDEF	_move_tile_with_check
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_tqt
	XDEF	_tpx
	XDEF	_tpy
	XDEF	_enoffsmasi
	LIB	cpc_PutSpTileMapO
	LIB	cpc_PutSp
	LIB	cpc_UpdScrAddresses
	XDEF	_tspatterns
	XDEF	_check_lock_or_box_vert
	LIB	cpc_PutTrSp8x8TileMapGPxM1
	LIB	cpc_PutTrSp16x16TileMapGPxM1
	XDEF	_hotspot_paint
	XDEF	_pant_just_rendered
	XDEF	__baddies_pointer
	LIB	cpc_PutMaskSpTileMap
	LIB	cpc_TouchTileSpXY
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	LIB	cpc_RedefineKey
	LIB	cpc_PutTrSp8x16TileMapGPxP
	LIB	cpc_PutTrSp8x24TileMapGPxP
	XDEF	_en_an_count
	defc	_en_an_count	=	54787
	LIB	cpc_GetTiles
	XDEF	_render_all_sprites
	XDEF	_spr_on
	defc	_spr_on	=	58952
	LIB	cpc_PutSpXOR
	LIB	cpc_PrintStr
	XDEF	_draw_scr_background
	LIB	cpc_PrintGphStr2X
	XDEF	_select_controls
	XDEF	_game_over
	LIB	cpc_PrintGphStrM1


; --- End of Scope Defns ---


; --- End of Compilation ---
