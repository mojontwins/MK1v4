;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon May 26 10:44:59 2025



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
	._player_frames
	defw (_sprites + 0x0000), (_sprites + 0x0040), (_sprites + 0x0080), (_sprites + 0x00C0)
	defw (_sprites + 0x0100), (_sprites + 0x0140), (_sprites + 0x0180), (_sprites + 0x01C0)
	._enem_frames
	defw (_sprites + 0x0200), (_sprites + 0x0240), (_sprites + 0x0280), (_sprites + 0x02C0)
	defw (_sprites + 0x0300), (_sprites + 0x0340), (_sprites + 0x0380), (_sprites + 0x03C0)
;	SECTION	text

._level
	defm	""
	defb	0

;	SECTION	code


;	SECTION	text

._spacer
	defw	i_1+0
;	SECTION	code

	.EFECTO0
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
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO2
	defb 0xC3, 0x0E, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0xE8, 0x1B, 0x00
	defb 0x80, 0x2B, 0x00
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
	.EFECTO4
	defb 0xC3, 0x0E, 0x08
	defb 0x5F, 0x1F, 0x08
	defb 0xA6, 0x2F, 0x00
	defb 0xE8, 0x1B, 0x08
	defb 0x80, 0x2B, 0x00
	defb 0xFF
	.EFECTO5
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x1F, 0x00
	defb 0xE2, 0x0F, 0x00
	defb 0x56, 0x3F, 0x00
	defb 0xF6, 0x1F, 0x00
	defb 0x14, 0x1E, 0x00
	defb 0x64, 0x0E, 0x00
	defb 0x62, 0x3D, 0x00
	defb 0xD0, 0x1D, 0x00
	defb 0xF1, 0x2C, 0x00
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
	.EFECTO9
	defb 0x1A, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xB4, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0xA0, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x87, 0x0E, 0x00
	defb 0x78, 0x0E, 0x00
	defb 0x78, 0x0E, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0D, 0x00
	defb 0x78, 0x0C, 0x00
	defb 0x78, 0x09, 0x00
	defb 0x78, 0x06, 0x00
	defb 0x78, 0x05, 0x00
	defb 0xFF
	.EFECTO10
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x1F, 0x00
	defb 0xA6, 0x2F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
	defb 0xFF
	.EFECTO11
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
	.EFECTO12
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
	.EFECTO13
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
	.EFECTO14
	defb 0xE8, 0x1B, 0x00
	defb 0x5F, 0x0F, 0x00
	defb 0xA6, 0x0F, 0x00
	defb 0x00, 0x00, 0x00
	defb 0x80, 0x0F, 0x00
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
	defb 45,0,12,0,10,0,7,0,4,0,129
	;Instrumento 'PICC'
	.PAUTA_1
	defb 74,0,4,0,6,0,9,0,7,0,5,0,9,0,6,0,1,0,129
	;Instrumento 'Flauta vol bajo'
	.PAUTA_2
	defb 12,0,9,0,7,0,9,0,11,0,9,0,10,0,10,0,8,0,10,0,129
	;Instrumento 'Flauta'
	.PAUTA_3
	defb 8,0,10,0,11,0,11,0,11,0,10,0,9,0,8,0,9,0,8,0,8,0,8,0,8,0,8,0,8,0,7,0,7,0,7,0,7,0,138
	;Instrumento 'Picc vol 2'
	.PAUTA_4
	defb 71,0,6,0,7,0,6,0,5,0,129
	;Instrumento 'Eco'
	.PAUTA_5
	defb 3,0,7,0,9,0,6,0,7,0,6,0,129
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
	defw 0x8800
	.TABLA_EFECTOS
	defw EFECTO0, EFECTO1, EFECTO2, EFECTO3, EFECTO4, EFECTO5, EFECTO6, EFECTO7
	defw EFECTO8, EFECTO9, EFECTO10,EFECTO11,EFECTO12,EFECTO13,EFECTO14
	.LINE_COUNTER
	defb 0
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
	jp	z,i_6
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
.i_6
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
	ld a, 0x45
	out (c), a
	ld a, 3
	out (c), a
	ld a, 0x58
	out (c), a
	ld a, 4
	out (c), a
	ld a, 0x5D
	out (c), a
	ld a, 5
	out (c), a
	ld a, 0x55
	out (c), a
	ld a, 6
	out (c), a
	ld a, 0x44
	out (c), a
	ld a, 7
	out (c), a
	ld a, 0x5F
	out (c), a
	ld a, 8
	out (c), a
	ld a, 0x57
	out (c), a
	ld a, 9
	out (c), a
	ld a, 0x46
	out (c), a
	ld a, 10
	out (c), a
	ld a, 0x52
	out (c), a
	ld a, 11
	out (c), a
	ld a, 0x4A
	out (c), a
	ld a, 12
	out (c), a
	ld a, 0x47
	out (c), a
	ld a, 13
	out (c), a
	ld a, 0x4B
	out (c), a
	ld a, 14
	out (c), a
	ld a, 0x5B
	out (c), a
	ld a, 15
	out (c), a
	ld a, 0x4F
	out (c), a
	ret
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
	defb	216
	defb	1
	defb	0
	defb	145
	defb	1
	defb	0
	defb	24
	defb	1
	defb	0
	defb	113
	defb	1
	defb	0
	defb	115
	defb	2
	defb	0
	defb	214
	defb	1
	defb	0
	defb	210
	defb	1
	defb	0
	defb	17
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
	defb	84
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



._sp_UpdateNow
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_13
.i_11
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_13
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_12
	jp	nc,i_12
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
	jp	i_11
.i_12
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_16
.i_14
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_16
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_15
	jp	nc,i_15
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
	jp	i_14
.i_15
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
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_px),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_py),a
	ld	hl,8	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_pt),a
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	ld	(_pptr),hl
	ld a, (_pt)
	sla a
	sla a
	sla a
	sla a
	ld ixh, #((0xE000 + 0x600)/256)
	ld ixl, a
	ld a, (_px)
	srl a
	srl a
	add #(0*2)
	ld (ix + 8), a
	ld a, (_py)
	add #(2*8)
	ld (ix + 9), a
	ld a, (_pptr)
	ld (ix + 0), a
	ld a, (_pptr + 1)
	ld (ix + 1), a
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
	ld	hl,84 % 256	;const
	call	_cpc_Border
	ld hl, _trpixlutc
	ld de, 0xF800 + 0x600
	call depack
	call	_blackout
	call my_inks
	ld	hl,0 % 256	;const
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
	ld b, 1 + 3 + 0 + 0 + 0
	.sp_sw_init_turnoff_loop
	ld a, #((0*8)/4)
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



._print_number2
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



._print_str
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



._saca_a_todo_el_mundo_de_aqui
	ld de, 15
	ld b, 1 + 3 + 0 + 0 + 0
	.clear_sprites_loop
	ld hl, 0xE000 + 0x600
	ld a, #(_sprite_18_a%256)
	ld (hl), a
	inc hl
	ld a, #(_sprite_18_a/256)
	ld (hl), a
	add hl, de
	djnz clear_sprites_loop
	ret



._update_this_enemy
	ld	hl,(_gpit)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
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
	ld	hl,(__en_x)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret



._render_sprites
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
	jp	i_17
.i_18
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	call	l_lneg
	jp	c,i_21
	ld	hl,(_half_life)
	ld	h,0
	call	l_lneg
	jp	nc,i_20
.i_21
	ld	hl,0 % 256	;const
	push	hl
	ld	hl,(_player+17)
	push	hl
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	call	_cpc_MoveSprAbs
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_23
.i_20
	ld	hl,_sp_sw
	push	hl
	ld	hl,_sprite_18_a
	pop	de
	call	l_pint
.i_23
	ret



._cortina
	ret



._espera_activa
.i_26
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
	jp	c,i_25
.i_27
.i_24
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_26
.i_25
	ret



._select_joyfunc
	call	cpc_UpdScr
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld	hl,0 % 256	;const
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



._unpack_screen
	ld	hl,2	;const
	call	l_gintspsp	;
	ld	hl,36864	;const
	push	hl
	call	_unpack
	pop	bc
	pop	bc
	ret



._sp_WaitForNoKey
.i_30
	call	_pad_read
.i_28
	ld	a,(_pad0)
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_ne
	jp	c,i_30
.i_29
	ret


	._s_title
	BINARY "title.bin"
	._s_marco
	._s_ending
	BINARY "ending.bin"

._game_ending
	call	_sp_UpdateNow
	call	_blackout
	ld	hl,_s_ending
	push	hl
	call	_unpack_screen
	pop	bc
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_33
	ld	hl,7 % 256	;const
	call	_wyz_play_sound
	ld	hl,2 % 256	;const
	call	_wyz_play_sound
.i_31
	ld	hl,(_gpit)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpit),a
	ld	a,h
	or	l
	jp	nz,i_33
.i_32
	ld	hl,9 % 256	;const
	call	_wyz_play_sound
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
	call	_sp_UpdateNow
	ld	hl,4 % 256	;const
	ld	a,l
	ld	(_gpit),a
.i_36
	ld	hl,7 % 256	;const
	call	_wyz_play_sound
	ld	hl,2 % 256	;const
	call	_wyz_play_sound
.i_34
	ld	hl,(_gpit)
	ld	h,0
	dec	hl
	ld	a,l
	ld	(_gpit),a
	ld	a,h
	or	l
	jp	nz,i_36
.i_35
	ld	hl,9 % 256	;const
	call	_wyz_play_sound
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	ret



._attr
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_38
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,0	;const
	pop	de
	call	l_lt
	jp	c,i_38
	ld	hl,4	;const
	call	l_gcharspsp	;
	ld	hl,14	;const
	pop	de
	call	l_gt
	jp	c,i_38
	ld	hl,2	;const
	call	l_gcharspsp	;
	ld	hl,9	;const
	pop	de
	call	l_gt
	jp	nc,i_37
.i_38
	ld	hl,0	;const
	ret


.i_37
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



._cm_two_points
	ld	a,(_cx1)
	ld	e,a
	ld	d,0
	ld	hl,14	;const
	call	l_ugt
	jp	c,i_41
	ld	a,(_cy1)
	ld	e,a
	ld	d,0
	ld	hl,9	;const
	call	l_ugt
	jp	nc,i_40
.i_41
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_at1),a
	jp	i_43
.i_40
	ld	hl,_map_attr
	push	hl
	ld	hl,(_cx1)
	ld	h,0
	push	hl
	ld	a,(_cy1)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_cy1)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_at1),a
.i_43
	ld	a,(_cx2)
	ld	e,a
	ld	d,0
	ld	hl,14	;const
	call	l_ugt
	jp	c,i_45
	ld	a,(_cy2)
	ld	e,a
	ld	d,0
	ld	hl,9	;const
	call	l_ugt
	jp	nc,i_44
.i_45
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_at2),a
	jp	i_47
.i_44
	ld	hl,_map_attr
	push	hl
	ld	hl,(_cx2)
	ld	h,0
	push	hl
	ld	a,(_cy2)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_cy2)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_at2),a
.i_47
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
	jp	nc,i_48
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
	jp	nc,i_48
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
	jp	nc,i_48
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
	jp	nc,i_48
	ld	hl,1	;const
	jr	i_49
.i_48
	ld	hl,0	;const
.i_49
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
	jp	p,i_50
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_50
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_51
	ret



._addsign
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	xor	a
	or	h
	jp	m,i_52
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


.i_52
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_neg
	ret


.i_53
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
	ld	e,(hl)
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,8-2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
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
	jp	i_56
.i_54
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_56
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_55
	jp	nc,i_55
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
	jp	i_54
.i_55
	ret



._init_hotspots
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_59
.i_57
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_59
	ld	hl,(_gpit)
	ld	h,0
	ex	de,hl
	ld	hl,(_gpit)
	ld	h,0
	call	l_ult
	ld	de,30	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_58
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
	jp	i_57
.i_58
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
	jp	z,i_60
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
	jp	nz,i_61
	ld	hl,_player+26
	ld	a,(hl)
	add	a,#(15 % 256)
	ld	(hl),a
	ld	a,(_player+26)
	cp	#(99 % 256)
	jp	z,i_62
	jp	c,i_62
	ld	hl,_player+26
	ld	(hl),#(99 % 256 % 256)
.i_62
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
	call	_wyz_play_sound
	jp	i_63
.i_61
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
.i_66
	ld	a,l
	cp	#(1% 256)
	jp	z,i_67
	cp	#(2% 256)
	jp	z,i_68
	jp	i_65
.i_67
	ld	hl,_player+27
	inc	(hl)
	ld	hl,7 % 256	;const
	call	_wyz_play_sound
	jp	i_65
.i_68
	ld	hl,_player+28
	inc	(hl)
	ld	hl,8 % 256	;const
	call	_wyz_play_sound
.i_65
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
.i_63
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_hotspot_y),a
	ld	h,0
	ld	a,l
	ld	(_hotspot_x),a
.i_60
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
	jp	nc,i_70
	ld	a,(_player+28)
	and	a
	jr	nz,i_71_i_70
.i_70
	jp	i_69
.i_71_i_70
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
	jp	i_74
.i_72
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_74
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_73
	jp	nc,i_73
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
	jp	nz,i_76
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
	jp	nz,i_76
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
	jr	z,i_77_i_76
.i_76
	jp	i_75
.i_77_i_76
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
	call	_wyz_play_sound
.i_75
	jp	i_72
.i_73
.i_69
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
	jp	i_80
.i_78
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_80
	ld	a,(_gpit)
	cp	#(150 % 256)
	jp	z,i_79
	jp	nc,i_79
	ld	hl,_gpit
	ld	a,(hl)
	rrca
	jp	nc,i_81
	ld	a,(_rdc)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_82
.i_81
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
.i_82
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
	jp	nc,i_84
	call	_rand
	ld	de,15	;const
	ex	de,hl
	call	l_and
	dec	hl
	ld	a,h	
	or	l
	jp	nz,i_84
	inc	hl
	jr	i_85
.i_84
	ld	hl,0	;const
.i_85
	ld	a,h
	or	l
	jp	z,i_83
	ld	hl,19 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_83
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
	jp	nz,i_86
	ld	a,#(0 % 256 % 256)
	ld	(_rdx),a
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
.i_86
	jp	i_78
.i_79
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
	ld	(_rdx),a
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
	ld	(_rdy),a
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
	and	a
	jp	nz,i_87
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
	jp	nc,i_88
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdt),a
.i_88
.i_87
	ld	a,(_rdt)
	and	a
	jp	z,i_89
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
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
	ld	hl,(_rdy)
	ld	h,0
	ld	de,15
	call	l_mult
	ex	de,hl
	ld	hl,(_rdx)
	ld	h,0
	add	hl,de
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
	jp	nz,i_90
	ld	hl,0	;const
	jp	i_91
.i_90
	ld	hl,(_rdt)
	ld	h,0
.i_91
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
.i_89
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_gpit),a
	jp	i_94
.i_92
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_94
	ld	a,(_gpit)
	cp	#(4 % 256)
	jp	z,i_93
	jp	nc,i_93
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
	jp	nz,i_96
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
	jr	z,i_97_i_96
.i_96
	jp	i_95
.i_97_i_96
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
.i_95
	jp	i_92
.i_93
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
.i_103
	ld	a,l
	cp	#(1% 256)
	jp	z,i_104
	cp	#(2% 256)
	jp	z,i_105
	cp	#(3% 256)
	jp	z,i_106
	cp	#(4% 256)
	jp	z,i_107
	jp	i_108
.i_104
.i_105
.i_106
.i_107
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
	jp	i_102
.i_108
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
.i_102
	ld	hl,(_enoffsmasi)
	ld	h,0
	inc	hl
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_enoffsmasi),a
	jp	i_98
.i_99
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
	jp	nz,i_109
	ret


.i_109
	ld	hl,_player+26
	dec	(hl)
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	call	_wyz_play_sound
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
.i_110
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
.i_111
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
	jp	nc,i_112
	ld	hl,512	;const
	ld	(_player+8),hl
.i_112
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_114
	ld	a,(_possee)
	and	a
	jp	nz,i_115
	ld	a,(_player+25)
	and	a
	jp	nz,i_115
	ld	a,(_hit_v)
	and	a
	jp	z,i_114
.i_115
	jr	i_117_i_114
.i_114
	jp	i_113
.i_117_i_114
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,3 % 256	;const
	call	_wyz_play_sound
.i_113
	ld	a,(_player+19)
	and	a
	jp	z,i_118
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
	jp	nc,i_119
	ld	hl,65216	;const
	ld	(_player+8),hl
.i_119
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_120
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_120
.i_118
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
	jp	p,i_121
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_121
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_122
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_122
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
	jp	z,i_123
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
	jp	p,i_124
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
	jp	nz,i_126
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_125
.i_126
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
.i_125
	jp	i_128
.i_124
	ld	hl,(_rds)
	xor	a
	or	h
	jp	m,i_129
	or	l
	jp	z,i_129
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
	jp	nz,i_131
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_131
	ld	hl,(_gpy)
	ld	h,0
	dec	hl
	ld	de,15	;const
	ex	de,hl
	call	l_and
	ld	de,8	;const
	ex	de,hl
	call	l_ult
	jp	nc,i_132
	ld	hl,_at1
	ld	a,(hl)
	and	#(4 % 256)
	jp	nz,i_133
	ld	hl,_at2
	ld	a,(hl)
	and	#(4 % 256)
	jp	z,i_132
.i_133
	ld	hl,1	;const
	jr	i_135
.i_132
	ld	hl,0	;const
.i_135
	ld	a,h
	or	l
	jp	nz,i_131
	jr	i_136
.i_131
	ld	hl,1	;const
.i_136
	ld	a,h
	or	l
	jp	z,i_130
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
.i_130
.i_129
.i_128
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_138
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_137
.i_138
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_v),a
.i_137
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
	jp	nz,i_140
	ld	hl,_at2
	ld	a,(hl)
	and	#(12 % 256)
	jp	nz,i_140
	ld	hl,0	;const
	jr	i_141
.i_140
	ld	hl,1	;const
.i_141
	ld	h,0
	ld	a,l
	ld	(_possee),a
.i_123
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	nc,i_143
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jr	nz,i_144_i_143
.i_143
	jp	i_142
.i_144_i_143
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_145
	or	l
	jp	z,i_145
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
	jp	p,i_146
	ld	hl,0	;const
	ld	(_player+6),hl
.i_146
	jp	i_147
.i_145
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_148
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
	jp	m,i_149
	or	l
	jp	z,i_149
	ld	hl,0	;const
	ld	(_player+6),hl
.i_149
.i_148
.i_147
	jp	i_150
.i_142
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	c,i_151
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
	jp	nc,i_152
	ld	hl,65280	;const
	ld	(_player+6),hl
.i_152
.i_151
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_153
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
	jp	nc,i_154
	ld	hl,256	;const
	ld	(_player+6),hl
.i_154
.i_153
.i_150
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
	jp	p,i_155
	ld	hl,0	;const
	ld	(_player),hl
.i_155
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_156
	ld	hl,14336	;const
	ld	(_player),hl
.i_156
	ld	hl,(_player)
	ex	de,hl
	ld	l,#(6 % 256)
	call	l_asr
	ld	h,0
	ld	a,l
	ld	(_gpx),a
	ld	de,(_player+6)
	ld	hl,(_ptgmx)
	add	hl,de
	ld	(_rds),hl
	ld	a,h
	or	l
	jp	z,i_157
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
	jp	p,i_158
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
	jp	nz,i_160
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_159
.i_160
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
.i_159
	jp	i_162
.i_158
	ld	hl,(_rds)
	xor	a
	or	h
	jp	m,i_163
	or	l
	jp	z,i_163
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
	jp	nz,i_165
	ld	hl,_at2
	ld	a,(hl)
	and	#(8 % 256)
	jp	z,i_164
.i_165
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
.i_164
.i_163
.i_162
	ld	hl,_at1
	ld	a,(hl)
	rrca
	jp	c,i_168
	ld	hl,_at2
	ld	a,(hl)
	rrca
	jp	nc,i_167
.i_168
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_hit_h),a
.i_167
.i_157
	ld	a,#(0 % 256 % 256)
	ld	(_hit),a
	ld	a,(_hit_v)
	and	a
	jp	z,i_170
	ld	a,#(1 % 256 % 256)
	ld	(_hit),a
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_172
	ld	a,(_player+14)
	cp	#(1 % 256)
	jp	z,i_172
	jp	c,i_172
	jr	i_173_i_172
.i_172
	jp	i_171
.i_173_i_172
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
.i_171
	jp	i_174
.i_170
	ld	a,(_hit_h)
	and	a
	jp	z,i_175
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
.i_175
.i_174
	ld	a,(_hit)
	and	a
	jp	z,i_176
	ld	hl,10 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_176
	ld	hl,(_player+22)
	ld	h,0
	ld	a,l
	ld	(_gpit),a
	ld	hl,(_player+8)
	ld	a,h
	or	l
	jp	nz,i_177
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
	jp	i_178
.i_177
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	p,i_179
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
	jp	i_180
.i_179
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
.i_180
.i_178
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
	jp	i_183
.i_181
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
.i_183
	ld	a,(_gpit)
	cp	#(3 % 256)
	jp	z,i_182
	jp	nc,i_182
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
	jp	nz,i_184
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
	jp	nz,i_185
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
	jp	i_181
.i_185
.i_184
	ld	hl,(__en_t)
	ld	h,0
.i_188
	ld	a,l
	cp	#(1% 256)
	jp	z,i_189
	cp	#(2% 256)
	jp	z,i_190
	cp	#(3% 256)
	jp	z,i_191
	cp	#(4% 256)
	jp	z,i_192
	jp	i_187
.i_189
.i_190
.i_191
.i_192
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
	jp	c,i_194
	ld	hl,(__en_x)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_x2)
	ld	h,0
	call	l_eq
	jp	nc,i_193
.i_194
	ld	hl,__en_mx
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_mx),a
.i_193
	ld	hl,(__en_y)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y1)
	ld	h,0
	call	l_eq
	jp	c,i_197
	ld	hl,(__en_y)
	ld	h,0
	ex	de,hl
	ld	hl,(__en_y2)
	ld	h,0
	call	l_eq
	jp	nc,i_196
.i_197
	ld	hl,__en_my
	call	l_gchar
	call	l_neg
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(__en_my),a
.i_196
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_gpen_cx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_gpen_cy),a
.i_187
	ld	a,(_active)
	and	a
	jp	z,i_199
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	inc	(hl)
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(4 % 256)
	jp	nz,i_200
	ld	de,_en_an_count
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	de,_en_an_frame
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_en_an_frame
	ld	hl,(_gpit)
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
.i_200
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_201
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_x)
	ld	h,0
	call	l_uge
	jp	nc,i_203
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(__en_x)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_204_i_203
.i_203
	jp	i_202
.i_204_i_203
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	p,i_205
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,16
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_uge
	jp	nc,i_207
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,9
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ule
	jp	nc,i_207
	ld	hl,(_player+8)
	ld	de,65488	;const
	ex	de,hl
	call	l_ge
	jr	c,i_208_i_207
.i_207
	jp	i_206
.i_208_i_207
	call	_platform_get_player
.i_206
	jp	i_209
.i_205
	ld	hl,__en_my
	call	l_gchar
	xor	a
	or	h
	jp	m,i_210
	or	l
	jp	z,i_210
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,20
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_uge
	jp	nc,i_212
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,13
	add	hl,bc
	ex	de,hl
	ld	hl,(__en_y)
	ld	h,0
	call	l_ule
	jp	nc,i_212
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_213_i_212
.i_212
	jp	i_211
.i_213_i_212
	call	_platform_get_player
.i_211
.i_210
.i_209
	ld	hl,__en_mx
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_ne
	jp	nc,i_215
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-16
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_215
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	hl,(__en_y)
	ld	h,0
	ld	bc,-11
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_215
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_ge
	jr	c,i_216_i_215
.i_215
	jp	i_214
.i_216_i_215
	call	_platform_get_player
	ld	hl,(__en_x)
	ld	h,0
	ld	de,64
	call	l_mult
	ld	(_ptgmx),hl
.i_214
.i_202
	jp	i_217
.i_201
	ld	hl,(_tocado)
	ld	h,0
	call	l_lneg
	jp	nc,i_219
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
	jp	z,i_219
	ld	a,(_player+23)
	cp	#(0 % 256)
	jr	z,i_220_i_219
.i_219
	jp	i_218
.i_220_i_219
	ld	a,#(1 % 256 % 256)
	ld	(_tocado),a
	ld	hl,(_lasttimehit)
	ld	h,0
	call	l_lneg
	jp	c,i_222
	ld	a,(_maincounter)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_and
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_221
.i_222
	ld	hl,4 % 256	;const
	push	hl
	call	_kill_player
	pop	bc
.i_221
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
.i_218
.i_217
.i_199
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
	jp	i_181
.i_182
	ld	hl,(_tocado)
	ld	h,0
	ld	a,l
	ld	(_lasttimehit),a
	ret



._main
	call	_cortina
	call	_system_init
.i_224
	call	_sp_UpdateNow
	call	_blackout
	ld	hl,_s_title
	push	hl
	call	_unpack_screen
	pop	bc
	call	_select_joyfunc
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_mlplaying),a
.i_226
	ld	a,(_mlplaying)
	and	a
	jp	z,i_227
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
	ld	hl,1 % 256	;const
	call	_wyz_play_music
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_success),a
.i_228
	ld	a,(_playing)
	and	a
	jp	z,i_229
	ld	hl,(_o_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_n_pant)
	ld	h,0
	call	l_ne
	jp	nc,i_230
	call	_draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	ld	a,l
	ld	(_o_pant),a
.i_230
	ld	hl,(_player+27)
	ld	h,0
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jp	nc,i_231
	call	_draw_objs
	ld	hl,(_player+27)
	ld	h,0
	ld	a,l
	ld	(_objs_old),a
.i_231
	ld	hl,(_player+26)
	ld	h,0
	ex	de,hl
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_232
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
.i_232
	ld	hl,(_player+28)
	ld	h,0
	ex	de,hl
	ld	hl,(_keys_old)
	ld	h,0
	call	l_ne
	jp	nc,i_233
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
.i_233
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
	call	_sp_UpdateNow
	call	_do_hotspots
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_235
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_236_i_235
.i_235
	jp	i_234
.i_236_i_235
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
.i_234
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_238
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_239_i_238
.i_238
	jp	i_237
.i_239_i_238
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
.i_237
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_241
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_241
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_241_uge
	jp	c,i_241
.i_241_uge
	jr	i_242_i_241
.i_241
	jp	i_240
.i_242_i_241
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
.i_240
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_244
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_245_i_244
.i_244
	jp	i_243
.i_245_i_244
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
	jp	nc,i_246
	ld	hl,256	;const
	ld	(_player+8),hl
.i_246
.i_243
	ld	a,(_player+27)
	cp	#(25 % 256)
	jp	nz,i_247
	ld	a,(_pant_final)
	cp	#(99 % 256)
	jp	z,i_249
	ld	hl,(_n_pant)
	ld	h,0
	ex	de,hl
	ld	hl,(_pant_final)
	ld	h,0
	call	l_eq
	jp	nc,i_250
	ld	a,(_gpx)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_251
	ld	a,(_gpy)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	de,99	;const
	ex	de,hl
	call	l_eq
	jr	c,i_252_i_251
.i_251
	jp	i_250
.i_252_i_251
	ld	hl,1	;const
	jr	i_253
.i_250
	ld	hl,0	;const
.i_253
	ld	a,h
	or	l
	jp	nz,i_249
	jr	i_254
.i_249
	ld	hl,1	;const
.i_254
	ld	a,h
	or	l
	jp	z,i_248
	ld	a,#(1 % 256 % 256)
	ld	(_success),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_248
.i_247
	ld	a,(_player+26)
	and	a
	jp	nz,i_255
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_255
	jp	i_228
.i_229
	call	_sp_WaitForNoKey
	call	_wyz_stop_sound
	call	_saca_a_todo_el_mundo_de_aqui
	call	_sp_UpdateNow
	ld	hl,(_success)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_256
	call	_game_ending
	jp	i_257
.i_256
	call	_game_over
.i_257
	jp	i_226
.i_227
	call	_cortina
	jp	i_224
.i_225
	ret


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
._isr_player_on	defs	1
._gpen_cx	defs	1
._gpen_cy	defs	1
.__en_x1	defs	1
.__en_x2	defs	1
.__en_y1	defs	1
.__en_y2	defs	1
._hotspot_x	defs	1
._hotspot_y	defs	1
._half_life	defs	1
._gpen_xx	defs	1
._gpen_yy	defs	1
._map_pointer	defs	2
.__en_mx	defs	1
.__en_my	defs	1
._hit_h	defs	1
._hit_v	defs	1
._killed_old	defs	1
._gpaux	defs	1
._active	defs	1
._wyz_beat_ct	defs	1
._mlplaying	defs	1
._life_old	defs	1
._pn	defs	1
._pt	defs	1
._px	defs	1
._py	defs	1
._pant_final	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._enoffs	defs	1
._pad_this_frame	defs	1
._pad0	defs	1
._pad1	defs	1
._lasttimehit	defs	1
._n_pant	defs	1
._o_pant	defs	1
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

	XDEF	__en_t
	XDEF	__en_x
	XDEF	__en_y
	XDEF	_isr_player_on
	XDEF	_hotspots
	LIB	cpc_PutTrSp8x8TileMapPxM1
	LIB	cpc_PutTrSp16x16TileMapPxM1
	LIB	cpc_PutTrSp16x24TileMapPxM1
	XDEF	_draw_scr
	XDEF	_wyz_play_music
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	LIB	cpc_PutSpTileMap12x24CA
	LIB	cpc_PrintGphStrStdXY
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	LIB	cpc_PutTiles
	XDEF	_sprites
	XDEF	_gpen_cx
	XDEF	_gpen_cy
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	_def_keys
	XDEF	__en_y2
	XDEF	_cortina
	LIB	cpc_PrintGphStrM12X
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54844
	XDEF	_draw_objs
	XDEF	_wyz_play_sound
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_half_life
	XDEF	_gpen_xx
	XDEF	_gpen_yy
	XDEF	_map_pointer
	XDEF	_cpc_MoveSprAbs
	LIB	cpc_ShowScrTileMap
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_SetMode
	LIB	cpc_ClrScr
	XDEF	_ctileoff
	LIB	cpc_SetModo
	XDEF	_en_an_state
	defc	_en_an_state	=	54832
	XDEF	_mueve_bicharracos
	LIB	cpc_SetInkGphStr
	LIB	cpc_ShowTouchedTiles2
	LIB	cpc_SetTile
	XDEF	_malotes
	LIB	cpc_PutSpTileMap8x8PxM1
	LIB	cpc_PutSpTileMap16x16PxM1
	LIB	cpc_PutSpTileMap16x24PxM1
	LIB	cpc_CollSp
	LIB	cpc_PutMaskSp4x16
	XDEF	_hit_h
	XDEF	_blackout
	XDEF	_map_buff
	defc	_map_buff	=	50838
	LIB	cpc_PrintGphStrStd
	XDEF	_hit_v
	XDEF	_cpc_Border
	XDEF	_killed_old
	XDEF	_gpaux
	XDEF	_map_attr
	defc	_map_attr	=	50688
	XDEF	_active
	LIB	cpc_ShowTileMap
	XDEF	_level
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_wyz_beat_ct
	XDEF	_do_hotspots
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_sp_UpdateNow
	XDEF	_enem_frames
	XDEF	_espera_activa
	LIB	cpc_PutTrSp2Bx8TileMapG
	LIB	cpc_PutTrSp4Bx16TileMapG
	LIB	cpc_PutTrSp4Bx24TileMapG
	LIB	cpc_SpRLM1
	XDEF	_get_resource
	XDEF	_unpack_screen
	XDEF	_wyz_init
	XDEF	_mlplaying
	LIB	cpc_PrintGphStrXY2X
	XDEF	_life_old
	LIB	cpc_SpRRM1
	XDEF	_pn
	LIB	cpc_PrintGphStrXYM1
	LIB	cpc_PutTrSp12x24TileMapGCA
	XDEF	_pt
	LIB	cpc_UpdScrP
	LIB	cpc_PutSpriteXOR
	XDEF	_px
	XDEF	_py
	LIB	cpc_TestKey
	LIB	cpc_PutSprite
	XDEF	cpc_PutSpTileMap
	LIB	cpc_PutTrSpTileMap
	LIB	cpc_PutORSpTileMap
	LIB	cpc_PutCpSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_pant_final
	XDEF	_s_marco
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	XDEF	_addsign
	XDEF	_address
	defc	_address	=	23296
	LIB	cpc_PutSPTileMap4Bx16
	LIB	cpc_PutSPTileMap4Bx24
	XDEF	_sp_sw
	defc	_sp_sw	=	58880
	XDEF	_cm_two_points
	LIB	cpc_TouchTileXY
	LIB	cpc_SetTouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	XDEF	_qtile
	XDEF	_init_cerrojos
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_sprite_17_a
	XDEF	_sprite_18_a
	XDEF	_player_frames
	LIB	cpc_PutTrSp4x8TileMapGPx
	LIB	cpc_PutTrSp8x16TileMapGPx
	LIB	cpc_PutTrSp8x24TileMapGPx
	XDEF	_init_player
	XDEF	_update_this_enemy
	XDEF	_sp_WaitForNoKey
	XDEF	_enoffs
	LIB	cpc_PutSpTr
	XDEF	_pad_this_frame
	LIB	cpc_DisableFirmware
	LIB	cpc_EnableFirmware
	LIB	cpc_PrintGphStrXYM12X
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	_lasttimehit
	XDEF	_tile_address
	XDEF	_n_pant
	LIB	cpc_UpdScrM1P
	XDEF	_def_keys_joy
	LIB	cpc_SetBorder
	LIB	cpc_RLI
	XDEF	_system_init
	LIB	cpc_RRI
	LIB	cpc_GetSp
	XDEF	_o_pant
	LIB	cpc_SpUpdX
	LIB	cpc_SpUpdY
	LIB	cpc_PutTile4x16
	XDEF	_print_number2
	XDEF	_main
	XDEF	_mapa
	XDEF	_draw_coloured_tile
	XDEF	_attr
	LIB	cpc_ResetTouchedTiles
	LIB	cpc_ShowTouchedTiles
	XDEF	_s_title
	XDEF	_playing
	LIB	cpc_PutMaskSp2x8
	XDEF	_gpit
	XDEF	_gpjt
	LIB	cpc_ScanKeyboard
	LIB	cpc_SetColour
	XDEF	_rand
	XDEF	_seed
	XDEF	_print_str
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_maincounter
	LIB	cpc_PutTrSp2Bx8TileMap
	LIB	cpc_PutTrSp4Bx16TileMap
	LIB	cpc_PutTrSp4Bx24TileMap
	XDEF	_move
	LIB	cpc_UpdScr
	LIB	cpc_PutTrSp16x16TileMapPxM1LUT
	XDEF	_check_and_clear_cerrojo
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	54796
	LIB	cpc_ScrollLeft0
	XDEF	_pptr
	XDEF	_at1
	XDEF	_at2
	LIB	cpc_PutSPTileMap2Bx8
	LIB	cpc_AnyKeyPressed
	XDEF	__en_life
	XDEF	_sp_PrintAtInv
	XDEF	_kill_player
	XDEF	_cx1
	XDEF	_cx2
	LIB	cpc_AssignKey
	XDEF	_cy1
	XDEF	_cy2
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
	LIB	cpc_SetInkGphStrM1
	XDEF	_hit
	XDEF	_player
	LIB	cpc_PutMaskSpriteTileMap
	LIB	cpc_PutTrSpriteTileMap
	LIB	cpc_UpdateTileMap
	XDEF	_rda
	XDEF	_rdc
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	LIB	cpc_PutSpTileMap8x8Px
	XDEF	_keys_old
	XDEF	_rds
	LIB	cpc_TestKeyF
	XDEF	_rdt
	LIB	cpc_PutTrSp16x16TileMapGPxM1P
	LIB	cpc_PutTrSp16x24TileMapGPxM1P
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_pt_alt
	XDEF	_init_hotspots
	XDEF	_check_lock_or_box_horz
	XDEF	_tileset
	XDEF	_comportamiento_tiles
	XDEF	_wyz_stop_sound
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_pxx
	LIB	cpc_PutSpTileMapO
	XDEF	_enoffsmasi
	XDEF	_pyy
	LIB	cpc_PutSp
	XDEF	_spacer
	LIB	cpc_UpdScrAddresses
	XDEF	_tspatterns
	XDEF	_tocado
	XDEF	_check_lock_or_box_vert
	LIB	cpc_PutTrSp8x8TileMapGPxM1
	LIB	cpc_PutTrSp16x16TileMapGPxM1
	XDEF	_pptr_alt
	LIB	cpc_PutMaskSpTileMap
	LIB	cpc_TouchTileSpXY
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	XDEF	_possee
	XDEF	_allpurposepuntero
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XDEF	_collide
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	LIB	cpc_RedefineKey
	LIB	cpc_PutTrSp8x16TileMapGPxP
	LIB	cpc_PutTrSp8x24TileMapGPxP
	XDEF	_destination
	defc	_destination	=	23298
	XDEF	_platform_get_player
	XDEF	_en_an_count
	defc	_en_an_count	=	54787
	XDEF	_select_joyfunc
	LIB	cpc_GetTiles
	XDEF	_unpack
	XDEF	_render_sprites
	LIB	cpc_PutSpXOR
	LIB	cpc_PrintStr
	XDEF	_draw_scr_background
	XDEF	_recuadre
	LIB	cpc_PrintGphStr2X
	XDEF	_game_over
	LIB	cpc_PrintGphStrM1
	XDEF	_set_player_at


; --- End of Scope Defns ---


; --- End of Compilation ---
