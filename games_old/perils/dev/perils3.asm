;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Sat Apr 26 09:08:42 2025



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


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
	defb	0

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	128

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
	defb	0

	defm	""
	defb	0

	defm	""
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


	.inks0
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x4A
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x5E
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
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
	defc viewport_x = 1
	defc viewport_y = 4
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
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1
	defw	cpc_PutTrSp16x16TileMap2bPxM1

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
	defw PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5
	; Tabla de efectos
	.TABLA_SONIDOS
	defw SONIDO0,SONIDO1,SONIDO2,SONIDO3
	;Pautas (instrumentos)
	;Instrumento 'Piano'
	.PAUTA_0
	defb 47,0,15,0,13,0,11,0,4,0,129
	;Instrumento 'PICC'
	.PAUTA_1
	defb 76,0,13,0,12,0,11,0,10,0,8,0,7,0,5,0,1,0,129
	;Instrumento 'Flauta vol bajo'
	.PAUTA_2
	defb 12,0,9,0,7,0,9,0,11,0,9,0,10,0,10,0,8,0,10,0,129
	;Instrumento 'Flauta'
	.PAUTA_3
	defb 10,0,12,0,13,0,13,0,13,0,12,0,11,0,11,0,11,0,10,0,10,0,10,0,10,0,10,0,9,0,9,0,9,0,9,0,9,0,138
	;Instrumento 'Picc vol 2'
	.PAUTA_4
	defb 71,0,6,0,7,0,6,0,5,0,129
	;Instrumento 'Eco'
	.PAUTA_5
	defb 6,0,8,0,9,0,8,0,7,0,6,0,129
	;Efectos
	;Efecto 'bass drum'
	.SONIDO0
	defb 209,62,0,186,92,0,255
	;Efecto 'drum'
	.SONIDO1
	defb 139,46,0,232,43,8,255
	;Efecto 'hithat'
	.SONIDO2
	defb 0,11,1,0,6,1,255
	;Efecto 'bass drum vol 2'
	.SONIDO3
	defb 186,58,0,0,102,0,162,131,0,255
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
	.pal_hud
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x53
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x46
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
	.pal_general
	ld b, 0x7f
	ld a, 0
	out (c), a
	ld a, 0x4A
	out (c), a
	ld a, 1
	out (c), a
	ld a, 0x54
	out (c), a
	ld a, 2
	out (c), a
	ld a, 0x5E
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x4B
	out (c), a
	ret
	.palmap
	defw inks0, inks0, inks0, inks0
	defw inks0, inks0, inks0, inks0
	defw inks0, inks0, inks0, inks0
	defw inks0, inks0, inks0, inks0
	defw inks0, inks0, inks0, inks0
	defw inks0, inks0, inks0, inks0

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
	jp isr_done
	._isr
	push af
	push hl
	push de
	push bc
	push ix
	push iy
	ld a, (isr_c1)
	inc a
	cp 3
	jr z, _set_game_pal
	cp 6
	jr c, _skip_ay_player
	ld a, (isr_c2)
	inc a
	ld (isr_c2), a
	ld a, (_isr_player_on)
	or a
	jr z, _skip_ay_player
	call WYZ_PLAYER_ISR
	call pal_hud
	.isr_nohud
	xor a
	._skip_ay_player
	ld (isr_c1), a
	pop iy
	pop ix
	pop bc
	pop de
	pop hl
	pop af
	ei
	ret
	._set_game_pal
	.inject_pal
	call pal_general
	.isr_nosplit
	ld a, 3
	jr _skip_ay_player
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
	; Vertical pos (4), CRTC REG #5
	ld b, 0xbc
	ld c, 5 ; REG = 5
	out (c), c
	inc b
	ld c, 4 ; VALUE = 24
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
	ld a, #(4*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	ei
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



._attr_mk2
	ld a, (_cx1)
	ld c, a
	ld a, (_cy1)
	jp _attr_enems
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
	sub 1
	srl a
	ld (_xx), a
	ld a, (__y)
	sub 4
	srl a
	ld (_yy), a
	ld	hl,(_xx)
	ld	h,0
	push	hl
	ld	hl,(_yy)
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
	jp	nz,i_12
	ld	a,(__t)
	cp	#(16 % 256)
	jr	z,i_13_uge
	jp	c,i_13
.i_13_uge
	ld	a,(__t)
	cp	#(19 % 256)
	jp	z,i_13
	ld	hl,1	;const
	jr	i_14
.i_13
	ld	hl,0	;const
.i_14
	ld	a,h
	or	l
	jp	nz,i_12
	jr	i_15
.i_12
	ld	hl,1	;const
.i_15
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_nocast),a
	ld a, (__t)
	sla a
	sla a
	add 64
	ld (__ta), a
	ld	a,(__t)
	cp	#(19 % 256)
	jp	nz,i_16
	ld	hl,192 % 256	;const
	ld	a,l
	ld	(_t_alt),a
	jp	i_17
.i_16
	ld	hl,(__ta)
	ld	h,0
	ld	de,128
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_t_alt),a
.i_17
	ld a, (_xx)
	dec a
	ld (_cx1), a
	ld a, (_yy)
	or a
	jr z, _dct_1_set_yy
	dec a
	._dct_1_set_yy
	ld (_cy1), a
	ld a, (_nocast)
	or a
	jr z, _dct_a1_set
	call _attr_mk2
	ld a, l
	and 8
	jr z, _dct_a1_set
	ld a, 1
	._dct_a1_set
	ld (_a1), a
	ld a, (_xx)
	ld (_cx1), a
	ld a, (_yy)
	or a
	jr z, _dct_2_set_yy
	dec a
	._dct_2_set_yy
	ld (_cy1), a
	ld a, (_nocast)
	or a
	jr z, _dct_a2_set
	call _attr_mk2
	ld a, l
	and 8
	jr z, _dct_a2_set
	ld a, 1
	._dct_a2_set
	ld (_a2), a
	ld a, (_xx)
	dec a
	ld (_cx1), a
	ld a, (_yy)
	ld (_cy1), a
	ld a, (_nocast)
	or a
	jr z, _dct_a3_set
	call _attr_mk2
	ld a, l
	and 8
	jr z, _dct_a3_set
	ld a, 1
	._dct_a3_set
	ld (_a3), a
	ld a, (_a1)
	or a
	jr nz, _dct_1_shadow
	ld a, (_a2)
	or a
	jr z, _dct_1_no_shadow
	ld a, (_a3)
	or a
	jr z, _dct_1_no_shadow
	._dct_1_shadow
	ld a, (_t_alt)
	ld (_t1), a
	jr _dct_1_increment
	._dct_1_no_shadow
	ld a, (__ta)
	ld (_t1), a
	._dct_1_increment
	ld hl, __ta
	inc (hl)
	ld hl, _t_alt
	inc (hl)
	ld a, (_a2)
	or a
	jr z, _dct_2_no_shadow
	._dct_2_shadow
	ld a, (_t_alt)
	ld (_t2), a
	jr _dct_2_increment
	._dct_2_no_shadow
	ld a, (__ta)
	ld (_t2), a
	._dct_2_increment
	ld hl, __ta
	inc (hl)
	ld hl, _t_alt
	inc (hl)
	ld a, (_a3)
	or a
	jr z, _dct_3_no_shadow
	._dct_3_shadow
	ld a, (_t_alt)
	ld (_t3), a
	jr _dct_3_increment
	._dct_3_no_shadow
	ld a, (__ta)
	ld (_t3), a
	._dct_3_increment
	ld hl, __ta
	inc (hl)
	ld hl, _t_alt
	inc (hl)
	ld a, (__ta)
	ld (_t4), a
	call __tile_address ; DE = buffer address
	ex de, hl
	ld a, (_t1)
	ld (hl), a
	inc hl
	ld a, (_t2)
	ld (hl), a
	ld bc, 31
	add hl, bc
	ld a, (_t3)
	ld (hl), a
	inc hl
	ld a, (_t4)
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
	add 1
	ld (__x), a
	ld a, (__y)
	sla a
	add 4
	ld (__y), a
	jp _draw_coloured_tile_do
	ret



._invalidate_viewport
	ld B, 4
	ld C, 1
	ld D, 4+19
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
	.draw_line_of_text
	;; Entry point called from msc4i
	;; HL should point to string.
	ld a, 4
	ld (__x), a
	ld a, 3
	ld (__y), a
	jr draw_text_pre_loop
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
.i_20
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
	jp	c,i_19
.i_21
.i_18
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_20
.i_19
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
	add #(1*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_rdy)
	add #(4*8)
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
	jp	i_24
.i_22
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_24
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_23
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
	jp	i_22
.i_23
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
	add #(1*8)
	add (ix + 6)
	ld (ix + 8), a
	ld a, (_gpy)
	add #(4*8)
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
	jp	z,i_25
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
.i_25
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_26
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
.i_26
	.ml_min_faps_loop
	ld a, (isr_c2)
	cp 2
	jr c, ml_min_faps_loop
	.ml_min_faps_loop_end
	xor a
	ld (isr_c2), a
	ld a, (_pant_just_rendered)
	or a
	jr z, change_palette_done
	ld hl, (_n_pant)
	ld h, 0
	add hl, hl
	ld de, palmap
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (inject_pal + 1), hl
	.change_palette_done
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



._do_extern_action
	ret



._script
	ld a, l
	ld (_script_n), a
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_script_tx), a
	ld c, a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld (_script_ty), a
	call qtile_do
	ld a, l
	ld (_script_tn), a
	jp _script_do
	ret


	XDEF script_bytecode
	XDEF _attr_2
	XDEF qtile_do
	XDEF set_map_tile_do
	XDEF _peta_el_beeper
	XDEF _cpc_UpdateNow
	XDEF draw_line_of_text
	.script_bytecode
	BINARY "script.spt.bin"
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
	defm	"R0"
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	" "
	defb	221

	defm	"P"
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
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"]"
	defb	210

	defm	" "
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"b"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	" "
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"&"
	defb	0

	defm	"X"
	defb	144

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	137

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"D"
	defb	136

	defm	"HD"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"R"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"%"
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

	defm	""
	defb	34

	defm	"R "
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

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
	defb	210

	defm	""
	defb	0

	defm	""
	defb	0

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

	defm	"'"
	defb	0

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
	defb	208

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ww"
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
	defb	4

	defm	"DDD@"
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
	defb	34

	defm	""
	defb	34

	defm	" "
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
	defb	34

	defm	" "
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
	defb	34

	defm	" "
	defb	0

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

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	" "
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	7

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	7

	defm	"w"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	151

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	9

	defm	""
	defb	144

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
	defb	34

	defm	""
	defb	34

	defm	" p0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	153

	defm	"f"
	defb	153

	defm	"f`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"`"
	defb	0

	defm	""
	defb	153

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

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

	defm	"`"
	defb	144

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
	defb	134

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"h"
	defb	136

	defm	"ff "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	146

	defm	")fff"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"R"
	defb	0

	defm	""
	defb	0

	defm	"DDDDE"
	defb	221

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S"
	defb	13

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	181

	defm	"0"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S "
	defb	0

	defm	""
	defb	221

	defm	""
	defb	204

	defm	""
	defb	205

	defm	""
	defb	221

	defm	""
	defb	213

	defm	"2"
	defb	34

	defm	"!"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"S"
	defb	34

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
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"!"
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"R"
	defb	34

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
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"-"
	defb	221

	defm	""
	defb	220

	defm	""
	defb	205

	defm	""
	defb	221

	defm	"DDDE"
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

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	165

	defm	"wp"
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	221

	defm	""
	defb	204

	defm	""
	defb	218

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"*"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	213

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"*"
	defb	186

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	"w"
	defb	34

	defm	""
	defb	170

	defm	""
	defb	169

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"-"
	defb	204

	defm	""
	defb	141

	defm	""
	defb	170

	defm	"P"
	defb	7

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	7

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	"0"
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
	defb	0

	defm	"s"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	2

	defm	" 7"
	defb	0

	defm	""
	defb	2

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	7

	defm	"w"
	defb	3

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
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	3

	defm	""
	defb	7

	defm	"w"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	"b2 "
	defb	0

	defm	""
	defb	6

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	34

	defm	""
	defb	150

	defm	"ffh"
	defb	136

	defm	""
	defb	136

	defm	"b)"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	"f"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"`"
	defb	9

	defm	""
	defb	9

	defm	"`"
	defb	6

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`"
	defb	0

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"`"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"i"
	defb	0

	defm	""
	defb	9

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"gw"
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

	defm	"h"
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

	defm	"f"
	defb	134

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"iffR"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	213

	defm	""
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

	defm	""
	defb	0

	defm	"R"
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
	defb	5

	defm	""
	defb	0

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	"`P"
	defb	3

	defm	" @"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	2

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	3

	defm	""
	defb	0

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	0

	defm	"0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R"
	defb	34

	defm	""
	defb	0

	defm	"@"
	defb	9

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	4

	defm	""
	defb	17

	defm	""
	defb	129

	defm	""
	defb	129

	defm	""
	defb	17

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	209

	defm	""
	defb	25

	defm	""
	defb	34

	defm	"r"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"r"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"p"
	defb	8

	defm	""
	defb	144

	defm	""
	defb	8

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

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
	defb	34

	defm	"#p"
	defb	0

	defm	""
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

	defm	"0"
	defb	0

	defm	""
	defb	1

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"@"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"#"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"`0"
	defb	0

	defm	"b0"
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	3

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"0"
	defb	2

	defm	"`0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	")"
	defb	3

	defm	""
	defb	7

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

	defm	"`0"
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	3

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	34

	defm	"'ww"
	defb	144

	defm	"0"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	3

	defm	""
	defb	7

	defm	"p"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"`7"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"&h"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	150

	defm	""
	defb	150

	defm	""
	defb	153

	defm	"f"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	134

	defm	""
	defb	152

	defm	""
	defb	136

	defm	"h"
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
	defb	134

	defm	"h"
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
	defb	136

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
	defb	134

	defm	""
	defb	156

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

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
	defb	134

	defm	"l"
	defb	204

	defm	""
	defb	204

	defm	""
	defb	204

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"fffff"
	defb	136

	defm	""
	defb	134

	defm	"fR "
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	""
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	"H"
	defb	154

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	"DJ"
	defb	170

	defm	""
	defb	170

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"H"
	defb	138

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"E "
	defb	0

	defm	""
	defb	4

	defm	""
	defb	139

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"J"
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
	defb	0

	defm	""
	defb	4

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	""
	defb	171

	defm	"R"
	defb	0

	defm	""
	defb	0

	defm	"J"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	4

	defm	"DL"
	defb	196

	defm	"D"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"@"
	defb	3

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
	defb	164

	defm	""
	defb	0

	defm	"0"
	defb	0

	defm	"z"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	169

	defm	"B#"
	defb	34

	defm	""
	defb	0

	defm	"DDD"
	defb	137

	defm	""
	defb	34

	defm	"2"
	defb	34

	defm	""
	defb	10

	defm	""
	defb	186

	defm	""
	defb	186

	defm	""
	defb	136

	defm	""
	defb	146

	defm	"#"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	132

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"*"
	defb	186

	defm	""
	defb	186

	defm	""
	defb	186

	defm	"B"
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	164

	defm	"ww"
	defb	0

	defm	""
	defb	4

	defm	"DD"
	defb	170

	defm	"B "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"`2 "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	"6ww"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"b"
	defb	34

	defm	"'"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"6"
	defb	2

	defm	""
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
	defb	3

	defm	"`"
	defb	0

	defm	"0w"
	defb	12

	defm	""
	defb	7

	defm	"p9"
	defb	12

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
	defb	3

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	192

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
	defb	3

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"w`"
	defb	0

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	")f"
	defb	153

	defm	""
	defb	150

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	150

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	150

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

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	140

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	150

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
	defb	136

	defm	""
	defb	137

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	136

	defm	"f"
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
	defb	200

	defm	""
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	"fhif"
	defb	136

	defm	""
	defb	134

	defm	"f"
	defb	150

	defm	"R"
	defb	34

	defm	" DDDDE"
	defb	34

	defm	""
	defb	34

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

	defm	"R"
	defb	34

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
	defb	5

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R "
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
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	0

	defm	"DA"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	197

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	202

	defm	""
	defb	202

	defm	"]"
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	202

	defm	""
	defb	165

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	4

	defm	"DDDDDDJ"
	defb	164

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"B "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	""
	defb	2

	defm	""
	defb	26

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

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	202

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	12

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"R "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	202

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	165

	defm	""
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	4

	defm	"DDDB"
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
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	144

	defm	""
	defb	0

	defm	"0"
	defb	7

	defm	"w"
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"bwr "
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	2

	defm	"#"
	defb	34

	defm	" "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	144

	defm	""
	defb	2

	defm	"2w"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	"w"
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

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

	defm	"6"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	6

	defm	"0"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	"c"
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"f"
	defb	153

	defm	"f"
	defb	34

	defm	"f"
	defb	134

	defm	"i"
	defb	152

	defm	""
	defb	136

	defm	""
	defb	153

	defm	"ff"
	defb	152

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	137

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
	defb	200

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"f"
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
	defb	134

	defm	""
	defb	150

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

	defm	""
	defb	144

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
	defb	134

	defm	""
	defb	0

	defm	""
	defb	9

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
	defb	146

	defm	""
	defb	34

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	134

	defm	"R"
	defb	34

	defm	" DDDDE"
	defb	34

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
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
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	181

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
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
	defb	0

	defm	"DDDDE"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	"m"
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	186

	defm	""
	defb	171

	defm	""
	defb	170

	defm	""
	defb	176

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	1

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
	defb	192

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	170

	defm	"gwwwwwwy"
	defb	153

	defm	""
	defb	153

	defm	"DDDD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	165

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	170

	defm	"Z"
	defb	170

	defm	""
	defb	161

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	165

	defm	""
	defb	170

	defm	""
	defb	186

	defm	""
	defb	16

	defm	""
	defb	7

	defm	"wwDDDD@"
	defb	0

	defm	""
	defb	0

	defm	"*"
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	16

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
	defb	161

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
	defb	186

	defm	""
	defb	16

	defm	"`"
	defb	0

	defm	""
	defb	0

	defm	"wwwwwv"
	defb	0

	defm	""
	defb	9

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
	defb	151

	defm	"w"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"&"
	defb	153

	defm	""
	defb	153

	defm	"b"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	137

	defm	"f"
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	151

	defm	"r"
	defb	34

	defm	")"
	defb	136

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"i"
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
	defb	34

	defm	"&"
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"h"
	defb	136

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
	defb	6

	defm	""
	defb	136

	defm	""
	defb	136

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"h"
	defb	134

	defm	"h"
	defb	136

	defm	""
	defb	135

	defm	"wwwwwww"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"h"
	defb	136

	defm	""
	defb	136

	defm	"f"
	defb	34

	defm	" "
	defb	6

	defm	""
	defb	6

	defm	"f"
	defb	136

	defm	""
	defb	134

	defm	""
	defb	146

	defm	" "
	defb	6

	defm	""
	defb	150

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	134

	defm	"h"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	136

	defm	""
	defb	137

	defm	""
	defb	150

	defm	""
	defb	136

	defm	""
	defb	153

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

	defm	"h"
	defb	134

	defm	""
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
	defb	136

	defm	""
	defb	136

	defm	"f"
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
	defb	136

	defm	"fgwwwwwww"
;	SECTION	code


;	SECTION	text

._malotes
	defb	32
	defb	0
	defb	32
	defb	0
	defb	32
	defb	48
	defb	0
	defb	2
	defb	2
	defb	96
	defb	48
	defb	96
	defb	48
	defb	96
	defb	80
	defb	0
	defb	1
	defb	1
	defb	144
	defb	48
	defb	144
	defb	48
	defb	176
	defb	48
	defb	10
	defb	0
	defb	3
	defb	80
	defb	80
	defb	80
	defb	16
	defb	80
	defb	80
	defb	0
	defb	-1
	defb	2
	defb	48
	defb	96
	defb	48
	defb	16
	defb	48
	defb	96
	defb	0
	defb	-2
	defb	3
	defb	160
	defb	112
	defb	160
	defb	32
	defb	160
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	32
	defb	112
	defb	32
	defb	112
	defb	176
	defb	112
	defb	2
	defb	0
	defb	3
	defb	192
	defb	16
	defb	192
	defb	16
	defb	192
	defb	96
	defb	0
	defb	1
	defb	1
	defb	80
	defb	80
	defb	80
	defb	80
	defb	112
	defb	80
	defb	1
	defb	0
	defb	2
	defb	80
	defb	32
	defb	48
	defb	32
	defb	80
	defb	32
	defb	-1
	defb	0
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	208
	defb	80
	defb	2
	defb	2
	defb	2
	defb	208
	defb	96
	defb	112
	defb	96
	defb	208
	defb	96
	defb	-1
	defb	0
	defb	4
	defb	96
	defb	48
	defb	96
	defb	48
	defb	208
	defb	48
	defb	1
	defb	0
	defb	2
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	2
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	48
	defb	128
	defb	1
	defb	1
	defb	0
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	1
	defb	3
	defb	48
	defb	80
	defb	16
	defb	80
	defb	48
	defb	128
	defb	-1
	defb	1
	defb	2
	defb	64
	defb	48
	defb	16
	defb	48
	defb	64
	defb	48
	defb	-1
	defb	0
	defb	1
	defb	208
	defb	128
	defb	16
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	4
	defb	128
	defb	64
	defb	96
	defb	64
	defb	128
	defb	64
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	112
	defb	0
	defb	2
	defb	3
	defb	96
	defb	128
	defb	96
	defb	32
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	144
	defb	48
	defb	144
	defb	48
	defb	192
	defb	64
	defb	1
	defb	1
	defb	2
	defb	208
	defb	128
	defb	176
	defb	128
	defb	208
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	208
	defb	32
	defb	1
	defb	0
	defb	2
	defb	112
	defb	48
	defb	112
	defb	48
	defb	208
	defb	96
	defb	1
	defb	1
	defb	2
	defb	176
	defb	48
	defb	176
	defb	48
	defb	176
	defb	112
	defb	0
	defb	1
	defb	3
	defb	64
	defb	128
	defb	64
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	4
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	128
	defb	0
	defb	2
	defb	2
	defb	80
	defb	96
	defb	80
	defb	96
	defb	208
	defb	112
	defb	2
	defb	2
	defb	3
	defb	208
	defb	80
	defb	144
	defb	48
	defb	208
	defb	80
	defb	-1
	defb	-1
	defb	3
	defb	128
	defb	80
	defb	96
	defb	32
	defb	128
	defb	80
	defb	-1
	defb	-1
	defb	2
	defb	64
	defb	112
	defb	64
	defb	48
	defb	64
	defb	112
	defb	0
	defb	-1
	defb	1
	defb	48
	defb	48
	defb	48
	defb	48
	defb	192
	defb	48
	defb	2
	defb	0
	defb	2
	defb	192
	defb	80
	defb	64
	defb	80
	defb	192
	defb	80
	defb	-1
	defb	0
	defb	3
	defb	80
	defb	112
	defb	80
	defb	112
	defb	208
	defb	112
	defb	1
	defb	0
	defb	1
	defb	192
	defb	128
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	144
	defb	128
	defb	112
	defb	64
	defb	144
	defb	128
	defb	-2
	defb	-2
	defb	2
	defb	144
	defb	16
	defb	144
	defb	16
	defb	192
	defb	48
	defb	2
	defb	2
	defb	3
	defb	16
	defb	48
	defb	16
	defb	48
	defb	80
	defb	48
	defb	2
	defb	0
	defb	1
	defb	96
	defb	16
	defb	48
	defb	16
	defb	96
	defb	16
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	128
	defb	16
	defb	128
	defb	48
	defb	128
	defb	-1
	defb	0
	defb	3
	defb	192
	defb	112
	defb	192
	defb	16
	defb	192
	defb	112
	defb	0
	defb	-1
	defb	0
	defb	32
	defb	16
	defb	32
	defb	16
	defb	144
	defb	16
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
	defb	3
	defb	16
	defb	16
	defb	16
	defb	16
	defb	144
	defb	80
	defb	2
	defb	2
	defb	2
	defb	176
	defb	16
	defb	176
	defb	16
	defb	192
	defb	96
	defb	2
	defb	2
	defb	3
	defb	176
	defb	128
	defb	96
	defb	128
	defb	176
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	96
	defb	128
	defb	96
	defb	16
	defb	96
	defb	128
	defb	0
	defb	-2
	defb	4
	defb	64
	defb	128
	defb	64
	defb	64
	defb	64
	defb	128
	defb	0
	defb	-2
	defb	2
	defb	32
	defb	16
	defb	32
	defb	16
	defb	80
	defb	128
	defb	2
	defb	2
	defb	3
	defb	64
	defb	96
	defb	64
	defb	32
	defb	64
	defb	96
	defb	0
	defb	-1
	defb	2
	defb	112
	defb	32
	defb	112
	defb	32
	defb	128
	defb	128
	defb	2
	defb	2
	defb	2
	defb	144
	defb	16
	defb	144
	defb	16
	defb	208
	defb	64
	defb	2
	defb	2
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	96
	defb	80
	defb	2
	defb	2
	defb	3
	defb	112
	defb	32
	defb	112
	defb	32
	defb	112
	defb	96
	defb	0
	defb	2
	defb	4
	defb	48
	defb	96
	defb	48
	defb	96
	defb	208
	defb	128
	defb	1
	defb	1
	defb	2
	defb	208
	defb	48
	defb	96
	defb	48
	defb	208
	defb	48
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	-1
	defb	4
	defb	208
	defb	112
	defb	160
	defb	112
	defb	208
	defb	112
	defb	-1
	defb	0
	defb	2
	defb	48
	defb	16
	defb	48
	defb	16
	defb	80
	defb	48
	defb	1
	defb	1
	defb	3
	defb	144
	defb	112
	defb	144
	defb	16
	defb	144
	defb	112
	defb	0
	defb	-2
	defb	1
	defb	112
	defb	112
	defb	48
	defb	112
	defb	112
	defb	112
	defb	-2
	defb	0
	defb	2
	defb	128
	defb	48
	defb	128
	defb	48
	defb	128
	defb	128
	defb	0
	defb	1
	defb	1
	defb	160
	defb	16
	defb	160
	defb	16
	defb	192
	defb	128
	defb	2
	defb	2
	defb	2
	defb	32
	defb	48
	defb	32
	defb	48
	defb	32
	defb	128
	defb	0
	defb	2
	defb	4
	defb	208
	defb	64
	defb	128
	defb	64
	defb	208
	defb	64
	defb	-2
	defb	0
	defb	2
	defb	48
	defb	96
	defb	48
	defb	96
	defb	192
	defb	112
	defb	1
	defb	1
	defb	3
	defb	16
	defb	32
	defb	16
	defb	32
	defb	64
	defb	32
	defb	1
	defb	0
	defb	1

;	SECTION	code

;	SECTION	text

._hotspots
	defb	0
	defb	0
	defb	0
	defb	88
	defb	3
	defb	0
	defb	211
	defb	3
	defb	0
	defb	52
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	151
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
	defb	0
	defb	0
	defb	0
	defb	0
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



._init_malotes
	ld bc, 72
	ld de, 9
	ld ix, _malotes
	.init_malotes_loop
	ld a, (ix+8)
	and 127
	ld (ix+8), a
	add ix, de
	dec bc
	ld a, b
	or c
	jr nz, init_malotes_loop
	ret



._player_flicker
	ld a, 2
	ld (_player + 23), a
	ld a, 50
	ld (_player + 24), a
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
	ld	hl,(__x)
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
	cp	#(14 % 256)
	jp	nz,i_31
	ld	hl,(_rdx)
	ld	h,0
	ld	a,l
	ld	(_x0),a
	ld	hl,(_rdy)
	ld	h,0
	ld	a,l
	ld	(_y1),a
	ld	h,0
	ld	a,l
	ld	(_y0),a
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_32
	or	l
	jp	z,i_32
	ld	hl,(_x0)
	ld	h,0
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
	jp	i_33
.i_32
	ld	hl,(_x0)
	ld	h,0
	dec	hl
	ld	h,0
	ld	a,l
	ld	(_x1),a
.i_33
	call	_move_tile_with_check
.i_31
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
	ld	hl,(__y)
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
	ret



._move
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_hit),a
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
	jp	nc,i_34
	ld	hl,512	;const
	ld	(_player+8),hl
.i_34
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(16 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	nz,i_36
	inc	hl
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_36
	ld	a,(_player+26)
	and	a
	jp	nz,i_37
	ld	a,(_player+25)
	and	a
	jp	z,i_36
.i_37
	jr	i_39_i_36
.i_36
	jp	i_35
.i_39_i_36
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,3	;const
	call	_peta_el_beeper
.i_35
	ld	hl,_pad0
	ld	a,(hl)
	and	#(16 % 256)
	jp	nz,i_40
	ld	a,(_player+19)
	and	a
	jp	z,i_41
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
	ld	de,184
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
	jp	nc,i_42
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_42
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_43
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_43
.i_41
	jp	i_44
.i_40
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
.i_44
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
	jp	p,i_45
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_45
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_46
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_46
	ld hl, (_player + 2)
	call HLshr6_A
	ld (_gpy), A
	ld	de,(_player+8)
	ld	hl,(_ptgmy)
	add	hl,de
	ld	(_pvy_total),hl
	ld	a,h
	or	l
	jp	z,i_47
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	hl,(_pvy_total)
	xor	a
	or	h
	jp	m,i_48
	or	l
	jp	z,i_48
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_50
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	z,i_49
.i_50
	ld	hl,0	;const
	ld	(_player+8),hl
	ld a, (_gpy)
	and 0xf0
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
	ld	hl,_player+26
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_49
	jp	i_52
.i_48
	ld	hl,(_pvy_total)
	xor	a
	or	h
	jp	p,i_53
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_55
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_54
.i_55
	ld	hl,0	;const
	ld	(_player+8),hl
	ld a, (_gpy)
	and 0xf0
	add 12
	ld (_gpy), a
	call Ashl16_HL
	ld (_player + 2), HL
.i_54
.i_53
.i_52
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_58
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_57
.i_58
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit),a
.i_57
.i_47
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	h,0
	ld	a,l
	ld	(__y),a
	call	_cm_two_points
	ld	hl,_player+26
	push	hl
	ld	hl,_at1
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_60
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_60
	ld	hl,0	;const
	jr	i_61
.i_60
	ld	hl,1	;const
.i_61
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	nc,i_63
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jr	nz,i_64_i_63
.i_63
	jp	i_62
.i_64_i_63
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_65
	or	l
	jp	z,i_65
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
	jp	p,i_66
	ld	hl,0	;const
	ld	(_player+6),hl
.i_66
	jp	i_67
.i_65
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_68
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
	jp	m,i_69
	or	l
	jp	z,i_69
	ld	hl,0	;const
	ld	(_player+6),hl
.i_69
.i_68
.i_67
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_thrusting),a
	jp	i_70
.i_62
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	c,i_71
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
	jp	nc,i_72
	ld	hl,65280	;const
	ld	(_player+6),hl
.i_72
	ld	hl,_player+22
	ld	(hl),#(4 % 256 % 256)
.i_71
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_73
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
	jp	nc,i_74
	ld	hl,256	;const
	ld	(_player+6),hl
.i_74
	ld	hl,_player+22
	ld	(hl),#(0 % 256 % 256)
.i_73
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_thrusting),a
.i_70
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
	jp	p,i_75
	ld	hl,0	;const
	ld	(_player),hl
.i_75
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_76
	ld	hl,14336	;const
	ld	(_player),hl
.i_76
	ld hl, (_player)
	call HLshr6_A
	ld (_gpx), A
	ld	de,(_player+6)
	ld	hl,(_ptgmx)
	add	hl,de
	ld	(_pvx_total),hl
	ld	a,h
	or	l
	jp	z,i_77
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y),a
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__y2),a
	ld	hl,(_pvx_total)
	xor	a
	or	h
	jp	m,i_78
	or	l
	jp	z,i_78
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,12
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_80
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_79
.i_80
	call	_check_lock_or_box_horz
	ld	hl,0	;const
	ld	(_player+6),hl
	ld a, (_gpx)
	and 0xf0
	add 4
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), HL
.i_79
	jp	i_82
.i_78
	ld	hl,(_pvx_total)
	xor	a
	or	h
	jp	p,i_83
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(__x2),a
	ld	h,0
	ld	a,l
	ld	(__x),a
	call	_cm_two_points
	ld	hl,_at1
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_85
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_84
.i_85
	call	_check_lock_or_box_horz
	ld	hl,0	;const
	ld	(_player+6),hl
	ld a, (_gpx)
	and 0xf0
	add 12
	ld (_gpx), a
	call Ashl16_HL
	ld (_player), HL
.i_84
.i_83
.i_82
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_88
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_87
.i_88
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	de,_player+8
	ld	hl,(_pvy_total)
	call	l_pint
.i_87
.i_77
	ld	hl,(_pvx_total)
	call	_abs
	push	hl
	ld	hl,(_pvy_total)
	call	_abs
	pop	de
	call	l_gt
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	a,(_hit)
	and	a
	jp	z,i_90
	ld	a,(_rdi)
	and	a
	jp	z,i_91
	ld	hl,_player+6
	push	hl
	ld	hl,(_pvx_total)
	call	l_neg
	pop	de
	call	l_pint
	jp	i_92
.i_91
	ld	hl,_player+8
	push	hl
	ld	hl,(_pvy_total)
	call	l_neg
	pop	de
	call	l_pint
.i_92
	ld	hl,2	;const
	call	_peta_el_beeper
	ld	hl,_player+46
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_90
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	call _attr_2
	ld a, l
	and 128
	jr z, nospecial
	ld hl, 5
	call _script
	.nospecial
	ld	a,(_player+26)
	and	a
	jp	nz,i_94
	ld	a,(_player+25)
	and	a
	jp	nz,i_94
	ld	hl,0	;const
	jr	i_95
.i_94
	ld	hl,1	;const
.i_95
	call	l_lneg
	jp	nc,i_93
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_96
.i_93
	ld	a,(_thrusting)
	and	a
	jp	z,i_97
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	push	hl
	ld	hl,_player_walk_cycle
	push	hl
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asr_u
	ld	de,1	;const
	ex	de,hl
	call	l_and
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_98
.i_97
	ld	hl,_player+20
	push	hl
	ld	hl,(_player+22)
	ld	h,0
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
.i_98
.i_96
	ld	hl,_player+17
	push	hl
	ld	hl,_player_cells
	push	hl
	ld	hl,(_player+20)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ret



._init_player_values
	ld	a,#(32 % 256 % 256)
	ld	(_gpx),a
	ld	hl,32 % 256	;const
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
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 20
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 4 * 6
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
	add 4
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
	add 1
	ld (__x), a
	ld a, (_rdy)
	sla a
	add 4
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
	call no_alt_bg_subst
	ld (__n), a
	call _draw_and_advance
	ld a, (_rdt2)
	call no_alt_bg_subst
	ld (__n), a
	call _draw_and_advance
	ld a, (_gpit)
	inc a
	ld (_gpit), a
	cp 75
	jr nz, draw_scr_bg_loop
	jr draw_scr_bg_loop_end
	.no_alt_bg_subst
	ld c, a
	call _rand
	ld a, l
	and 15
	cp 2
	jr nc, draw_scr_alt_no
	ld a, c
	or a
	ret nz
	ld a, 16 + 3
	ret
	.draw_scr_alt_no
	ld a, c
	ret
	.draw_scr_bg_loop_end
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
	jp	i_101
.i_99
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_101
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_100
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
.i_104
	ld	a,l
	cp	#(1% 256)
	jp	z,i_105
	cp	#(2% 256)
	jp	z,i_106
	cp	#(3% 256)
	jp	z,i_107
	cp	#(4% 256)
	jp	z,i_108
	jp	i_109
.i_105
.i_106
.i_107
.i_108
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	call	_enems_en_an_calc
	jp	i_103
.i_109
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
.i_103
	jp	i_99
.i_100
	ld	hl,1	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,8
	add	hl,de
	call	_script
	ret



._platform_get_player
	ld a, 1
	ld (_player+25), a
	ld a, (__en_y)
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
	ld a, (__en_my)
	call Ashl16_HL
	call withSign
	ld (_ptgmy), hl
	ret



._enems_kill
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
	ld a, (__en_x)
	ld (_rdx), a
	ld a, (__en_y)
	ld (_rdy), a
	call _render_this_enemy
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	and	a
	jp	z,i_110
	ld	hl,0	;const
	call	_peta_el_beeper
	ld	hl,10	;const
	call	_cpc_HardPause
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
	ld	hl,128	;const
	call	l_or
	ld	h,0
	ld	a,l
	ld	(__en_t),a
	ld	hl,_player+32
	inc	(hl)
	ld	hl,4	;const
	call	_script
	jp	i_111
.i_110
	ld	hl,1	;const
	call	_peta_el_beeper
.i_111
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
	jp	i_114
.i_112
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_114
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_113
	jp	nc,i_113
	ld	de,(_enoffs)
	ld	hl,(_enit)
	ld	h,0
	add	hl,de
	ld	(_enoffsmasi),hl
	call enems_get_values
	ld	hl,__en_t
	ld	a,(hl)
	rlca
	jp	nc,i_115
	ld	l,a
	ld	h,0
	jp	i_116
.i_115
	ld	hl,(__en_t)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_117
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
	jp	nc,i_118
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
	._en_bg_collision_horz
	ld a, (__en_mx)
	or a
	jr z, _en_bg_collision_horz_done
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
	neg
	ld (__en_mx), a
	._en_bg_collision_horz_done
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
	._en_bg_collision_vert
	ld a, (__en_my)
	or a
	jr z, _en_bg_collision_vert_done
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
	neg
	ld (__en_my), a
	._en_bg_collision_vert_done
	.en_linear_done
.i_118
	call	_enems_calc_frame
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_120
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_120
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_121_i_120
.i_120
	jp	i_119
.i_121_i_120
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
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 17
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	jr moving_platforms_vert_done
	.moving_platforms_vert_down
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 20
	cp c
	jr c, moving_platforms_vert_done
	ld a, (_gpy)
	add 13
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_vert_done
	call _platform_get_player
	.moving_platforms_vert_done
	.moving_platforms_horz
	ld a, (__en_mx)
	or a
	jr z, moving_platforms_done
	ld a, (__en_y)
	ld c, a
	ld a, (_gpy)
	add 16
	cp c
	jr c, moving_platforms_done
	ld a, (_gpy)
	add 11
	ld c, a
	ld a, (__en_y)
	cp c
	jr c, moving_platforms_done
	ld a, (_player+9)
	bit 7, a
	jr nz, moving_platforms_done
	call _platform_get_player
	ld a, (__en_mx)
	call Ashl16_HL
	call withSign
	ld (_ptgmx), hl
	.moving_platforms_done
	jp	i_122
.i_119
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_124
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_124
	ld	a,(__en_t)
	cp	#(128 % 256)
	jp	z,i_124
	jr	c,i_125_i_124
.i_124
	jp	i_123
.i_125_i_124
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_127
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_128_i_127
.i_127
	jp	i_126
.i_128_i_127
	ld	hl,_player+8
	ld	(hl),#(65280 % 256)
	inc	hl
	ld	(hl),#(65280 / 256)
	ld	hl,255	;const
	push	hl
	call	_enems_kill
	pop	bc
	jp	i_129
.i_126
	ld	a,(_player+23)
	and	a
	jp	nz,i_130
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
	xor	a
	or	h
	jp	m,i_131
	or	l
	jp	z,i_131
	ld	hl,512	;const
	ld	(_player+6),hl
.i_131
	ld	hl,__en_mx
	call	l_gchar
	xor	a
	or	h
	jp	p,i_132
	ld	hl,65024	;const
	ld	(_player+6),hl
.i_132
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_133
	or	l
	jp	z,i_133
	ld	hl,512	;const
	ld	(_player+8),hl
.i_133
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_134
	ld	hl,65024	;const
	ld	(_player+8),hl
.i_134
.i_130
.i_129
.i_123
.i_122
.i_117
.i_116
.i_135
	.enems_update_values_and_exit
	call enems_update_values_store
	jp	i_112
.i_113
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
	._s_title
	BINARY "titlec.bin"
	._s_marco
	._s_ending
	BINARY "endingc.bin"

._title_screen
	ld hl, pal_general
	ld (inject_pal + 1), hl
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
	ld hl, pal_general
	ld (inject_pal + 1), hl
	call	_blackout
	ld hl, _s_ending
	call _unpack_screen
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
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._main
	call	_system_init
.i_136
	call	_title_screen
	ld hl, _flags
	ld de, _flags + 1
	ld bc, 16 - 1
	xor a
	ld (hl), a
	ldir
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_init_player
	call	_init_hotspots
	call	_init_malotes
	ld	a,#(20 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	a,#(0 % 256 % 256)
	ld	(_script_result),a
	ld	hl,0	;const
	call	_script
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_half_life),a
	ld a, 255
	ld (_objs_old), a
	ld (_life_old), a
	ld (_keys_old), a
	ld (_killed_old), a
	ld (_flag_old), a
	ld (_on_pant), a
	ld	hl,1	;const
	call	_wyz_play_music
.i_138
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_139
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
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_140
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_141
	or	l
	jp	z,i_141
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_142
.i_141
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_142
	ld	hl,4	;const
	push	hl
	ld	hl,1	;const
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
.i_140
	ld	hl,(_player+32)
	ld	h,0
	ex	de,hl
	ld	hl,(_killed_old)
	ld	h,0
	call	l_ne
	jp	nc,i_143
	ld	hl,16	;const
	push	hl
	ld	hl,1	;const
	push	hl
	ld	hl,(_player+32)
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
.i_143
	ld	hl,(_flags)
	ld	h,0
	ex	de,hl
	ld	hl,(_flag_old)
	ld	h,0
	call	l_ne
	jp	nc,i_144
	ld	hl,7	;const
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,(_flags)
	ld	h,0
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags)
	ld	h,0
	ld	a,l
	ld	(_flag_old),a
.i_144
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
	jp	z,i_145
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_148
	ld	a,l
	cp	#(3% 256)
	jp	nz,i_147
.i_149
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
	jp	nc,i_150
	ld	hl,99	;const
	ld	(_player+29),hl
.i_150
	ld	a,#(2 % 256 % 256)
	ld	(_rdi),a
	ld	hl,9	;const
	call	_peta_el_beeper
.i_147
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_151
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
	ld	de,4
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
.i_151
.i_145
	._hotspots_else
	._hotspots_done
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
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
	ld	hl,_pad_this_frame
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_152
	ld	hl,2	;const
	call	_script
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	l,#(1 % 256)
	call	l_asl
	ld	de,9
	add	hl,de
	call	_script
.i_152
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_154
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_155_i_154
.i_154
	jp	i_153
.i_155_i_154
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_156
.i_153
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_158
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_159_i_158
.i_158
	jp	i_157
.i_159_i_158
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_157
.i_156
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_161
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_161
	ld	a,(_n_pant)
	cp	#(4 % 256)
	jr	z,i_161_uge
	jp	c,i_161
.i_161_uge
	jr	i_162_i_161
.i_161
	jp	i_160
.i_162_i_161
	ld a, (_n_pant)
	sub 4
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_163
.i_160
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_165
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_166_i_165
.i_165
	jp	i_164
.i_166_i_165
	ld a, (_n_pant)
	add 4
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_164
.i_163
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_167
	call	_saca_a_todo_el_mundo_de_aqui
	call	_cortina
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
	call	_game_ending
.i_167
	ld	hl,(_player+36)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_168
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
	call	_player_flicker
.i_168
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_170
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_169
.i_170
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_169
	xor a
	ld (_pant_just_rendered), a
	jp	i_138
.i_139
	jp	i_136
.i_137
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
._a1	defs	1
._a2	defs	1
._a3	defs	1
._a4	defs	1
._wyz_beat_ct	defs	1
._t_alt	defs	1
._t1	defs	1
._t2	defs	1
._t3	defs	1
._t4	defs	1
._x0	defs	1
._x1	defs	1
._y0	defs	1
._y1	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._xx	defs	1
._yy	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad0	defs	1
._n_pant	defs	1
._en_j	defs	1
._enit	defs	1
._gpcx	defs	2
._gpcy	defs	2
._rdt1	defs	1
._rdt2	defs	1
._gpit	defs	1
._playing	defs	1
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
._cerrojos	defs	2
._pvx_total	defs	2
._hotspot_t_r	defs	1
._at1	defs	1
._at2	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._nocast	defs	1
._cx1	defs	1
._cx2	defs	1
._cy1	defs	1
._cy2	defs	1
._prxx	defs	1
._pryy	defs	1
.__ta	defs	1
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
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
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
	XDEF	_enems_kill
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54835
	XDEF	_hotspot_t
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_player_walk_cycle
	XDEF	_half_life
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_ShowScrTileMap
	LIB	cpc_SetMode
	LIB	cpc_ClrScr
	XDEF	_get_pointer_to_enem_or_coco
	LIB	cpc_SetModo
	LIB	cpc_PutMaskSpriteTileMap2b
	LIB	cpc_PutTrSpriteTileMap2b
	XDEF	_en_an_state
	defc	_en_an_state	=	54829
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_mueve_bicharracos
	XDEF	_gp_gen_alt
	LIB	cpc_PutTrSp8x16TileMap2bGPxP
	LIB	cpc_PutTrSp8x24TileMap2bGPxP
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
	XDEF	_attr_mk2
	XDEF	_thrusting
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_invalidate_viewport
	LIB	cpc_ShowTileMap
	XDEF	_a1
	XDEF	_a2
	XDEF	_a3
	XDEF	_a4
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_wyz_beat_ct
	XDEF	_t_alt
	LIB	cpc_PutTrSp8x8TileMap2bPxM1
	LIB	cpc_PutTrSp16x16TileMap2bPxM1
	LIB	cpc_PutTrSp16x24TileMap2bPxM1
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_cpc_UpdateNow
	XDEF	_t1
	XDEF	_t2
	XDEF	_t3
	XDEF	_t4
	XDEF	_x0
	XDEF	_x1
	XDEF	_y0
	XDEF	_y1
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
	LIB	cpc_PutTrSp4x8TileMap2bG
	LIB	cpc_PutTrSp8x16TileMap2bG
	LIB	cpc_PutTrSp8x24TileMap2bG
	LIB	cpc_SpRRM1
	XDEF	_enems_en_an_calc
	XDEF	_sm_sprptr
	LIB	cpc_PrintGphStrXYM1
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	LIB	cpc_PutTrSp16x16TileMap2bGPxM1
	LIB	cpc_TestKey
	LIB	cpc_PutSprite
	XDEF	_xx
	LIB	cpc_PutSpTileMap4x8
	XDEF	_yy
	LIB	cpc_PutSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_peta_el_beeper
	XDEF	_s_marco
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_cm_two_points
	XREF	_script_n
	LIB	cpc_TouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	LIB	cpc_SetTouchTileXY
	XDEF	_qtile
	XDEF	_draw_and_advance
	XDEF	_sprite_17_a
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_sprite_18_a
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
	LIB	cpc_PutTrSp12x24TileMap2bGCA
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
	LIB	cpc_RRI
	LIB	cpc_GetSp
	LIB	cpc_PutTrSp4x8TileMap2bGPx
	LIB	cpc_PutTrSp8x16TileMap2bGPx
	XDEF	_enit
	LIB	cpc_PutTrSp8x24TileMap2bGPx
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_collide_enem
	XDEF	_init_malotes
	XDEF	_mapa
	XDEF	_main
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
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_maincounter
	XDEF	_rdmt
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_move
	LIB	cpc_PutMaskSpTileMap2b
	LIB	cpc_PutTrSpTileMap2b
	XDEF	_flag_old
	XDEF	_wall
	LIB	cpc_PutORSpTileMap2b
	LIB	cpc_PutSpTileMap2b
	LIB	cpc_UpdScr
	LIB	cpc_PutCpSpTileMap2b
	LIB	cpc_PutTrSp4x8TileMap2b
	LIB	cpc_PutTrSp8x16TileMap2b
	LIB	cpc_PutTrSp8x24TileMap2b
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
	LIB	cpc_AnyKeyPressed
	XDEF	_step
	XDEF	__en_life
	XDEF	_nocast
	XDEF	_cpc_HardPause
	XDEF	_cx1
	XDEF	_cx2
	XDEF	_cy1
	XDEF	_cy2
	XDEF	_prxx
	LIB	cpc_AssignKey
	XDEF	_pryy
	LIB	cpc_TouchTiles
	XDEF	_calc_hotspot_ptr
	LIB	cpc_PutSpTileMap4x8Px
	XDEF	_abs
	LIB	cpc_ScrollRight0
	XDEF	__ta
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
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
	LIB	cpc_PutTrSp16x16TileMap2bGPxM1P
	LIB	cpc_PutTrSp16x24TileMap2bGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	_draw_2_digits
	XREF	_script_result
	XDEF	_check_lock_or_box_horz
	XDEF	_init_hotspots
	LIB	cpc_PutTrSp4x8TileMap2bPx
	XDEF	_pti
	XDEF	_tileset
	XDEF	_ptj
	LIB	cpc_PutTrSp8x8TileMap2bPx
	XDEF	_comportamiento_tiles
	LIB	cpc_PutTrSp8x16TileMap2bPx
	LIB	cpc_PutTrSp8x24TileMap2bPx
	LIB	cpc_PutSpTileMap8x16
	LIB	cpc_PutSpTileMap8x24
	XDEF	_script
	XDEF	_player_flicker
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	XDEF	_move_tile_with_check
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_enoffsmasi
	LIB	cpc_PutSpTileMapO
	LIB	cpc_PutSp
	LIB	cpc_UpdScrAddresses
	XDEF	_tspatterns
	XDEF	_check_lock_or_box_vert
	XDEF	_hotspot_paint
	XDEF	_pant_just_rendered
	XDEF	__baddies_pointer
	LIB	cpc_TouchTileSpXY
	XREF	_script_do
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XREF	_script_tn
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	LIB	cpc_RedefineKey
	XREF	_script_tx
	XREF	_script_ty
	XDEF	_do_extern_action
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	54787
	XDEF	_render_all_sprites
	LIB	cpc_GetTiles
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
