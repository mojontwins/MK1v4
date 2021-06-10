;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Jun 10 13:56:24 2021



	MODULE	churromain.c


	INCLUDE "z80_crt0.hdr"


	XREF _nametable
	XREF tabla_teclas
	LIB cpc_KeysData
	LIB cpc_UpdTileTable
	LIB cpc_InvalidateRect
	LIB cpc_TestKeyboard
;	SECTION	text

._comportamiento_tiles
	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	4

	defm	""
	defb	8

	defm	""
	defb	8

	defm	""
	defb	4

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
	defb	1

	defm	""
	defb	4

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
	defb	4

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

;	SECTION	code


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
	defw $4204 ; KEY_ENTER
	defw $4804 ; KEY_ESC
	defw $4880 ; KEY_AUX1 Z
	defw $4780 ; KEY_AUX2 X
	defw $4801 ; KEY_AUX3 1
	defw $4802 ; KEY_AUX4 2
	._def_keys_joy
	defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
	defw 0x4004, 0x4804, 0x4880, 0x4780, 0x4801, 0x4802
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


;	SECTION	text

._my_inks
	defm	""
	defb	4

	defm	""
	defb	20

	defm	""
	defb	24

	defm	""
	defb	31

	defm	""
	defb	6

	defm	""
	defb	27

	defm	""
	defb	18

	defm	""
	defb	22

	defm	""
	defb	25

	defm	""
	defb	26

	defm	""
	defb	10

	defm	""
	defb	0

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


	; aPPack decompressor
	; original source by dwedit
	; very slightly adapted by utopian
	; optimized by Metalbrain
	;hl = source
	;de = dest
	.depack
	ld ixl,128
	.apbranch1
	ldi
	.aploop0
	ld ixh,1 ;LWM = 0
	.aploop
	call ap_getbit
	jr nc,apbranch1
	call ap_getbit
	jr nc,apbranch2
	ld b,0
	call ap_getbit
	jr nc,apbranch3
	ld c,16 ;get an offset
	.apget4bits
	call ap_getbit
	rl c
	jr nc,apget4bits
	jr nz,apbranch4
	ld a,b
	.apwritebyte
	ld (de),a ;write a 0
	inc de
	jr aploop0
	.apbranch4
	and a
	ex de,hl ;write a previous byte (1-15 away from dest)
	sbc hl,bc
	ld a,(hl)
	add hl,bc
	ex de,hl
	jr apwritebyte
	.apbranch3
	ld c,(hl) ;use 7 bit offset, length = 2 or 3
	inc hl
	rr c
	ret z ;if a zero is encountered here, it is EOF
	ld a,2
	adc a,b
	push hl
	ld iyh,b
	ld iyl,c
	ld h,d
	ld l,e
	sbc hl,bc
	ld c,a
	jr ap_finishup2
	.apbranch2
	call ap_getgamma ;use a gamma code * 256 for offset, another gamma code for length
	dec c
	ld a,c
	sub ixh
	jr z,ap_r0_gamma ;if gamma code is 2, use old r0 offset,
	dec a
	;do I even need this code?
	;bc=bc*256+(hl), lazy 16bit way
	ld b,a
	ld c,(hl)
	inc hl
	ld iyh,b
	ld iyl,c
	push bc
	call ap_getgamma
	ex (sp),hl ;bc = len, hl=offs
	push de
	ex de,hl
	ld a,4
	cp d
	jr nc,apskip2
	inc bc
	or a
	.apskip2
	ld hl,127
	sbc hl,de
	jr c,apskip3
	inc bc
	inc bc
	.apskip3
	pop hl ;bc = len, de = offs, hl=junk
	push hl
	or a
	.ap_finishup
	sbc hl,de
	pop de ;hl=dest-offs, bc=len, de = dest
	.ap_finishup2
	ldir
	pop hl
	ld ixh,b
	jr aploop
	.ap_r0_gamma
	call ap_getgamma ;and a new gamma code for length
	push hl
	push de
	ex de,hl
	ld d,iyh
	ld e,iyl
	jr ap_finishup
	.ap_getbit ld a,ixl
	add a,a
	ld ixl,a
	ret nz
	ld a,(hl)
	inc hl
	rla
	ld ixl,a
	ret
	.ap_getgamma
	ld bc,1
	.ap_getgammaloop
	call ap_getbit
	rl c
	rl b
	call ap_getbit
	jr c,ap_getgammaloop
	ret
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
	defb 77,0,6,0,8,0,13,0,8,0,6,0,12,0,7,0,3,0,129
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
	defw EFECTO8, EFECTO9, EFECTO10, EFECTO11, EFECTO12
;	SECTION	text

._mapa
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	177

	defm	"!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!*"
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
	defb	147

	defm	"#"
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

	defm	"3:"
	defb	0

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

	defm	"3"
	defb	160

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

	defm	"3:"
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
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

	defm	"33:CCZCT3C"
	defb	165

	defm	"EE"
	defb	165

	defm	"ESEJUUZUUE#!"
	defb	34

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	""
	defb	18

	defm	""
	defb	19

	defm	"3#22"
	defb	18

	defm	"223333233333"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	155

	defm	"33<30"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	""
	defb	195

	defm	"333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"3333"
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"444:"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"TTTT"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	165

	defm	"UUUU"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"UU!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##;2#33333"
	defb	169

	defm	""
	defb	153

	defm	""
	defb	147

	defm	"3<33:"
	defb	0

	defm	""
	defb	0

	defm	"33333"
	defb	144

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"33<30"
	defb	0

	defm	""
	defb	11

	defm	"4C44C"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"U4TY"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"UTUUUUUUU!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##32#33"
	defb	195

	defm	"3333"
	defb	195

	defm	"3333"
	defb	195

	defm	"333333333333333344C44C44TU4TUD"
	defm	"TUVdUUUUUfw"
	defb	18

	defm	"!!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	18

	defm	"3#"
	defb	34

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	""
	defb	18

	defm	"3332"
	defb	19

	defm	"!23"
	defb	195

	defm	"3323#3336339"
	defb	153

	defm	"333sLC"
	defb	0

	defm	""
	defb	3

	defm	"CCgEE0"
	defb	0

	defm	"5EgueT"
	defb	0

	defm	""
	defb	4

	defm	"fgwgfP"
	defb	0

	defm	"Wwwwwvff"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	"!!"
	defb	17

	defm	""
	defb	18

	defm	""
	defb	17

	defm	"#2"
	defb	19

	defm	"#"
	defb	18

	defm	"&2#32323s333343733339"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	179

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"CC3C@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	165

	defm	"EDEE"
	defb	0

	defm	""
	defb	0

	defm	"gUUUUffgvfffgwww"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	161

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	161

	defm	""
	defb	17

	defm	"!"
	defb	34

	defm	""
	defb	26

	defm	""
	defb	34

	defm	""
	defb	177

	defm	"*"
	defb	17

	defm	"##b"
	defb	163

	defm	":#"
	defb	161

	defm	"#37"
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	136

	defm	""
	defb	131

	defm	"33p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"337"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3"
	defb	195

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"437"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"T3y"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	"ESGeUUUUUE#! "
	defb	0

	defm	""
	defb	0

	defm	""
	defb	162

	defm	""
	defb	18

	defm	""
	defb	19

	defm	"3#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"22330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	"3333"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"33330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	163

	defm	"33<3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	"33330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"4444"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	154

	defm	"TTTTUDU"
	defb	149

	defm	"VeUUUUUVw!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!"
	defb	19

	defm	"!!#2"
	defb	17

	defm	"#"
	defb	34

	defm	"3##32#33333c3333337<333336s333"
	defm	"333w36dC4fgt6wUfgwwfwvgwwwwwww"
	defm	"!"
	defb	17

	defm	""
	defb	17

	defm	""
	defb	34

	defm	""
	defb	17

	defm	""
	defb	23

	defm	"ws!!#2fww3##3gw"
	defb	239

	defm	""
	defb	227

	defm	"3<3>"
	defb	254

	defm	""
	defb	240

	defm	""
	defb	0

	defm	"333"
	defb	195

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"3330"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"D4"
	defb	179

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"TZC;"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"ff"
	defb	165

	defm	"D"
	defb	171

	defm	""
	defb	0

	defm	""
	defb	6

	defm	"gwvffffw"
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

	defm	""
	defb	144

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

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
	defb	1

	defm	""
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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	0

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

	defm	"fo"
	defb	191

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	14

	defm	"wwf`"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"gwwwDDDGww"
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

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	192

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	0

	defm	"`"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	143

	defm	""
	defb	183

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	8

	defm	"f|"
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
	defb	135

	defm	"w"
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
	defb	8

	defm	"wp"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	12

	defm	""
	defb	135

	defm	"wDDD"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"w!"
	defb	18

	defm	""
	defb	17

	defm	""
	defb	17

	defm	""
	defb	17

	defm	"!'s"
	defb	34

	defm	"1!"
	defb	28

	defm	"##w33#!#"
	defb	195

	defm	"7v333#33ws333337w333333wv"
	defb	0

	defm	""
	defb	0

	defm	"f437wp"
	defb	12

	defm	""
	defb	7

	defm	"vf3ww"
	defb	0

	defm	""
	defb	0

	defm	"wwvgw|"
	defb	0

	defm	""
	defb	7

	defm	"www#!"
	defb	34

	defm	""
	defb	18

	defm	""
	defb	17

	defm	""
	defb	18

	defm	"ws3#22"
	defb	18

	defm	"gw333327ws<3336ww333<3wws33339"
	defm	""
	defb	153

	defm	""
	defb	155

	defm	"33;3C"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	164

	defm	"44"
	defb	163

	defm	"5@"
	defb	0

	defm	""
	defb	10

	defm	"ffZDVffgwvffwww"
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

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	8

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"U"
	defb	1

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	16

	defm	""
	defb	5

	defm	"UU"
	defb	141

	defm	""
	defb	213

	defm	""
	defb	136

	defm	""
	defb	254

	defm	""
	defb	191

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	133

	defm	"UP"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	"."
	defb	241

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	136

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

	defm	""
	defb	34

	defm	"("
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

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	128

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	15

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
	defb	133

	defm	"UUUDEUX"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	128

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
	defb	16

	defm	""
	defb	8

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
	defb	16

	defm	""
	defb	128

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	191

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	248

	defm	"H"
	defb	132

	defm	"FdDDf"
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

	defm	""
	defb	144

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"UDEUU"
	defb	0

	defm	""
	defb	5

	defm	"P"
	defb	2

	defm	""
	defb	34

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
	defb	16

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
	defb	16

	defm	""
	defb	0

	defm	"30"
	defb	254

	defm	""
	defb	179

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	"336ff`"
	defb	0

	defm	"fff"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	200

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	251

	defm	""
	defb	240

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	200

	defm	"UUUU"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	14

	defm	""
	defb	128

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
	defb	200

	defm	""
	defb	1

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	200

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	15

	defm	""
	defb	190

	defm	""
	defb	240

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	134

	defm	"ffffDDH"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	136

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
	defb	15

	defm	""
	defb	240

	defm	""
	defb	128

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	136

	defm	""
	defb	1

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
	defb	168

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	136

	defm	"0"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	131

	defm	"6"
	defb	0

	defm	""
	defb	6

	defm	""
	defb	180

	defm	"N"
	defb	255

	defm	""
	defb	136

	defm	"ftDvff("
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

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	24

	defm	""
	defb	129

	defm	""
	defb	0

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
	defb	128

	defm	""
	defb	1

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

	defm	"("
	defb	128

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	136

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	131

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

	defm	""
	defb	136

	defm	"3"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	131

	defm	"3"
	defb	255

	defm	""
	defb	255

	defm	""
	defb	239

	defm	""
	defb	255

	defm	""
	defb	239

	defm	""
	defb	136

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

	defm	""
	defb	34

	defm	"("
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

	defm	""
	defb	152

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	160

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	" "
	defb	1

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"("
	defb	128

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	28

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	143

	defm	""
	defb	254

	defm	""
	defb	255

	defm	""
	defb	0

	defm	""
	defb	254

	defm	""
	defb	251

	defm	""
	defb	1

	defm	""
	defb	136

	defm	"UUP"
	defb	21

	defm	"UP"
	defb	0

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	27

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	136

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

	defm	""
	defb	34

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
	defb	152

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	129

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	132

	defm	"H"
	defb	132

	defm	"DDD"
	defb	0

	defm	""
	defb	8

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
	defb	128

	defm	""
	defb	160

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	134

	defm	""
	defb	240

	defm	""
	defb	15

	defm	""
	defb	235

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	235

	defm	""
	defb	8

	defm	"vDfdFff"
	defb	153

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	153

	defm	""
	defb	153

	defm	""
	defb	144

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	8

	defm	""
	defb	0

	defm	""
	defb	16

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
	defb	128

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"H"
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
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	168

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

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
	defb	16

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	255

	defm	""
	defb	235

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	246

	defm	""
	defb	134

	defm	"ffdDffx"
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

	defm	""
	defb	152

	defm	""
	defb	1

	defm	""
	defb	10

	defm	""
	defb	0

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	26

	defm	""
	defb	8

	defm	""
	defb	141

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	1

	defm	""
	defb	136

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"!"
	defb	208

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	128

	defm	""
	defb	160

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	2

	defm	""
	defb	34

	defm	""
	defb	34

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	209

	defm	""
	defb	0

	defm	""
	defb	160

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	3

	defm	"3"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"UX"
	defb	136

	defm	"33"
	defb	228

	defm	""
	defb	16

	defm	""
	defb	14

	defm	""
	defb	250

	defm	""
	defb	136

	defm	""
	defb	130

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

	defm	"("
;	SECTION	code


;	SECTION	text

._cerrojos
	defb	11
	defb	13
	defb	2
	defb	0
	defb	11
	defb	9
	defb	3
	defb	0
	defb	11
	defb	11
	defb	3
	defb	0
	defb	12
	defb	11
	defb	5
	defb	0
	defb	12
	defb	14
	defb	5
	defb	0
	defb	12
	defb	0
	defb	7
	defb	0
	defb	12
	defb	2
	defb	7
	defb	0
	defb	13
	defb	2
	defb	3
	defb	0
	defb	13
	defb	11
	defb	4
	defb	0
	defb	13
	defb	0
	defb	5
	defb	0
	defb	13
	defb	3
	defb	5
	defb	0
	defb	17
	defb	5
	defb	3
	defb	0
	defb	17
	defb	8
	defb	3
	defb	0
	defb	17
	defb	9
	defb	3
	defb	0
	defb	17
	defb	10
	defb	3
	defb	0
	defb	17
	defb	1
	defb	5
	defb	0
	defb	17
	defb	4
	defb	5
	defb	0
	defb	17
	defb	8
	defb	8
	defb	0
	defb	18
	defb	4
	defb	3
	defb	0
	defb	18
	defb	7
	defb	8
	defb	0
	defb	18
	defb	14
	defb	8
	defb	0
	defb	19
	defb	0
	defb	8
	defb	0
	defb	20
	defb	5
	defb	3
	defb	0
	defb	20
	defb	7
	defb	3
	defb	0
	defb	20
	defb	5
	defb	8
	defb	0
	defb	20
	defb	8
	defb	8
	defb	0
	defb	22
	defb	12
	defb	3
	defb	0
	defb	22
	defb	13
	defb	3
	defb	0
	defb	22
	defb	12
	defb	8
	defb	0
	defb	22
	defb	13
	defb	8
	defb	0
	defb	23
	defb	4
	defb	8
	defb	0
	defb	23
	defb	5
	defb	8
	defb	0
	defb	23
	defb	6
	defb	8
	defb	0
	defb	23
	defb	7
	defb	8
	defb	0
	defb	23
	defb	9
	defb	8
	defb	0
	defb	23
	defb	10
	defb	8
	defb	0
	defb	23
	defb	11
	defb	8
	defb	0
	defb	23
	defb	13
	defb	8
	defb	0
	defb	24
	defb	1
	defb	6
	defb	0
	defb	24
	defb	2
	defb	6
	defb	0
	defb	24
	defb	4
	defb	6
	defb	0
	defb	24
	defb	5
	defb	6
	defb	0
	defb	24
	defb	8
	defb	6
	defb	0
	defb	24
	defb	10
	defb	6
	defb	0
	defb	25
	defb	2
	defb	8
	defb	0
	defb	25
	defb	5
	defb	8
	defb	0
	defb	26
	defb	2
	defb	8
	defb	0
	defb	26
	defb	3
	defb	8
	defb	0
	defb	26
	defb	12
	defb	8
	defb	0
	defb	27
	defb	12
	defb	8
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
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16
	defw	cpc_PutSpTileMap8x16

;	SECTION	code

;	SECTION	text

._sm_updfunc
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b
	defw	cpc_PutTrSp8x16TileMap2b

;	SECTION	code

	._sm_sprptr
	defw _sprites + 0x0000, _sprites + 0x0040, _sprites + 0x0080, _sprites + 0x00C0
	defw _sprites + 0x0100, _sprites + 0x0140, _sprites + 0x0180, _sprites + 0x01C0
	defw _sprites + 0x0200, _sprites + 0x0240, _sprites + 0x0280, _sprites + 0x02C0
	defw _sprites + 0x0300, _sprites + 0x0340, _sprites + 0x0380, _sprites + 0x03C0
	._sprite_18_a
	defs 96, 0
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	16
	defb	80
	defb	176
	defb	80
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
	defb	0
	defb	0
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
	defb	32
	defb	80
	defb	32
	defb	160
	defb	32
	defb	1
	defb	0
	defb	2
	defb	64
	defb	0
	defb	64
	defb	0
	defb	64
	defb	80
	defb	0
	defb	1
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
	defb	32
	defb	128
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	1
	defb	96
	defb	0
	defb	80
	defb	0
	defb	96
	defb	112
	defb	-1
	defb	1
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
	defb	112
	defb	0
	defb	112
	defb	0
	defb	160
	defb	128
	defb	2
	defb	2
	defb	3
	defb	80
	defb	0
	defb	32
	defb	0
	defb	80
	defb	96
	defb	-2
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
	defb	160
	defb	16
	defb	160
	defb	16
	defb	160
	defb	128
	defb	0
	defb	2
	defb	3
	defb	128
	defb	0
	defb	128
	defb	0
	defb	128
	defb	64
	defb	0
	defb	1
	defb	1
	defb	32
	defb	0
	defb	32
	defb	0
	defb	32
	defb	112
	defb	0
	defb	2
	defb	3
	defb	128
	defb	64
	defb	128
	defb	64
	defb	128
	defb	112
	defb	0
	defb	1
	defb	1
	defb	112
	defb	128
	defb	16
	defb	128
	defb	112
	defb	128
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	32
	defb	16
	defb	32
	defb	144
	defb	32
	defb	2
	defb	0
	defb	2
	defb	160
	defb	16
	defb	160
	defb	16
	defb	176
	defb	128
	defb	1
	defb	1
	defb	3
	defb	144
	defb	112
	defb	16
	defb	112
	defb	144
	defb	112
	defb	-1
	defb	0
	defb	1
	defb	176
	defb	16
	defb	176
	defb	16
	defb	192
	defb	128
	defb	1
	defb	1
	defb	3
	defb	144
	defb	96
	defb	80
	defb	96
	defb	144
	defb	96
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
	defb	0
	defb	0
	defb	128
	defb	112
	defb	128
	defb	16
	defb	128
	defb	112
	defb	0
	defb	-2
	defb	3
	defb	80
	defb	96
	defb	48
	defb	96
	defb	80
	defb	96
	defb	-1
	defb	0
	defb	1
	defb	96
	defb	64
	defb	96
	defb	64
	defb	96
	defb	80
	defb	0
	defb	0
	defb	0
	defb	112
	defb	32
	defb	80
	defb	32
	defb	112
	defb	128
	defb	-2
	defb	2
	defb	3
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
	defb	1
	defb	0
	defb	4
	defb	160
	defb	112
	defb	48
	defb	96
	defb	160
	defb	112
	defb	-1
	defb	-1
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
	defb	64
	defb	32
	defb	64
	defb	32
	defb	128
	defb	128
	defb	2
	defb	2
	defb	3
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	80
	defb	0
	defb	1
	defb	3
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	64
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
	defb	64
	defb	48
	defb	64
	defb	112
	defb	80
	defb	1
	defb	1
	defb	3
	defb	192
	defb	96
	defb	128
	defb	96
	defb	192
	defb	96
	defb	-1
	defb	0
	defb	0
	defb	32
	defb	32
	defb	32
	defb	16
	defb	32
	defb	32
	defb	0
	defb	0
	defb	0
	defb	144
	defb	48
	defb	144
	defb	48
	defb	144
	defb	112
	defb	0
	defb	2
	defb	3
	defb	128
	defb	128
	defb	64
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	160
	defb	32
	defb	160
	defb	32
	defb	160
	defb	48
	defb	0
	defb	0
	defb	0
	defb	192
	defb	128
	defb	192
	defb	112
	defb	192
	defb	128
	defb	0
	defb	0
	defb	6
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
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
	defb	48
	defb	48
	defb	48
	defb	48
	defb	112
	defb	48
	defb	1
	defb	0
	defb	1
	defb	96
	defb	80
	defb	96
	defb	80
	defb	112
	defb	128
	defb	1
	defb	1
	defb	3
	defb	208
	defb	80
	defb	208
	defb	80
	defb	208
	defb	128
	defb	0
	defb	1
	defb	3
	defb	160
	defb	128
	defb	160
	defb	128
	defb	208
	defb	128
	defb	1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	16
	defb	128
	defb	80
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	80
	defb	16
	defb	80
	defb	16
	defb	144
	defb	48
	defb	1
	defb	1
	defb	3
	defb	128
	defb	128
	defb	16
	defb	128
	defb	128
	defb	128
	defb	-1
	defb	0
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
	defb	144
	defb	16
	defb	144
	defb	16
	defb	192
	defb	128
	defb	2
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	0
	defb	1
	defb	4
	defb	112
	defb	64
	defb	112
	defb	64
	defb	176
	defb	64
	defb	1
	defb	0
	defb	4
	defb	48
	defb	16
	defb	48
	defb	16
	defb	48
	defb	112
	defb	0
	defb	2
	defb	3
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	1
	defb	4
	defb	208
	defb	64
	defb	208
	defb	64
	defb	208
	defb	80
	defb	0
	defb	0
	defb	6
	defb	208
	defb	16
	defb	208
	defb	16
	defb	208
	defb	32
	defb	0
	defb	0
	defb	6
	defb	16
	defb	96
	defb	16
	defb	80
	defb	16
	defb	96
	defb	0
	defb	0
	defb	6
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	48
	defb	80
	defb	48
	defb	176
	defb	48
	defb	1
	defb	0
	defb	4
	defb	192
	defb	48
	defb	192
	defb	48
	defb	192
	defb	128
	defb	0
	defb	1
	defb	4
	defb	80
	defb	96
	defb	80
	defb	96
	defb	112
	defb	128
	defb	1
	defb	1
	defb	3
	defb	112
	defb	128
	defb	112
	defb	32
	defb	112
	defb	128
	defb	0
	defb	-1
	defb	4
	defb	192
	defb	128
	defb	144
	defb	128
	defb	192
	defb	128
	defb	-1
	defb	0
	defb	1
	defb	80
	defb	128
	defb	16
	defb	128
	defb	80
	defb	128
	defb	-1
	defb	0
	defb	2
	defb	112
	defb	112
	defb	112
	defb	48
	defb	112
	defb	112
	defb	0
	defb	-1
	defb	4
	defb	208
	defb	16
	defb	192
	defb	16
	defb	208
	defb	16
	defb	0
	defb	0
	defb	6
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
	defb	0
	defb	0
	defb	0
	defb	52
	defb	1
	defb	0
	defb	119
	defb	1
	defb	0
	defb	151
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	195
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	39
	defb	1
	defb	0
	defb	150
	defb	1
	defb	0
	defb	135
	defb	1
	defb	0
	defb	184
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
	defb	72
	defb	1
	defb	0
	defb	199
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	add 2
	ld (__y), a
	jp _draw_coloured_tile_do
	ret



._invalidate_viewport
	ld B, 2
	ld C, 1
	ld D, 2+19
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
	push hl
	xor a
	ld (__n), a ; Strlen
	call __tile_address ; DE = buffer address
	pop hl
	.print_str_loop
	ld a, (hl)
	or a
	jr z, print_str_inv
	sub 32
	ld (de), a
	inc hl
	inc de
	ld a, (__n)
	inc a
	ld (__n), a
	jr print_str_loop
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



._any_key
	call	cpc_AnyKeyPressed
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
.i_17
	call	cpc_AnyKeyPressed
	ld	a,h
	or	l
	jp	nz,i_17
.i_18
.i_21
	halt
	halt
	halt
	halt
	halt
	halt
	call	cpc_AnyKeyPressed
	ld	a,h
	or	l
	jp	nz,i_20
.i_22
.i_19
	pop	de
	pop	hl
	dec	hl
	push	hl
	push	de
	ld	a,h
	or	l
	jp	nz,i_21
.i_20
	ret



._cpc_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_23
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
.i_23
	._cpc_screen_update_upd_buffer
	call cpc_UpdScr
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_24
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
.i_24
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
.i_25
	ld	hl,_gpit
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_26
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
	jp	i_25
.i_26
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

._map_behaviours
	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	1

;	SECTION	code


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

._text0
	defm	"HAY SETAS A RAUDALES!%PERO PAP"
	defm	"I, YA LO PETAS%SI CON LAS NORM"
	defm	"ALES%TRAES SETAS CON TETAS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text1
	defm	"SOY AMIGA DE TU HIJA,%NO SOY N"
	defm	"ADA MOJIGATA.%LUEGO, SI NO SE "
	defm	"FIJA,%TE VOY A DAR, PIRATA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text2
	defm	"(TAMARA LA TIA RARA)%BUSCO NOV"
	defm	"IO VERSADO%EN TEMAS DEL QUERER"
	defm	"%ERES ALGO ESMIRRIADO%PERO ME "
	defm	"PUEDES VALER"
	defb	0

;	SECTION	code



;	SECTION	text

._text3
	defm	"(RAMIRO EL VAMPIRO)%YO ESTARIA"
	defm	" INTERESADO%EN BUSCAR UN CAMAS"
	defm	"TRO%PERO ANDO MUY CANSADO%Y TE"
	defm	"NGO UN PADRASTRO"
	defb	0

;	SECTION	code



;	SECTION	text

._text4
	defm	"(ALBERTO EL TUERTO)%TE MIRO SI"
	defm	"N COMPLEJOS%DESDE HACE UN RATI"
	defm	"TO%NO SE SI ESTAS LEJOS%O ERES"
	defm	" MUY BAJITO."
	defb	0

;	SECTION	code



;	SECTION	text

._text5
	defm	"(RAMIRO EL VAMPIRO)%PERDONA SI"
	defm	" TE GRITO%ESTO ES LO QUE HAY.%"
	defm	"AUNQUE YO SEA BAJITO%TU TAMPOC"
	defm	"O ERES ROMAY!"
	defb	0

;	SECTION	code



;	SECTION	text

._text6
	defm	"(DONOSO EL SEBOSO)%COMO HABRAS"
	defm	" NOTADO%SOY UN TIPO MUY FINO%M"
	defm	"E GUSTA COMER HELADO%CUBIERTO "
	defm	"DE TOCINO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text7
	defm	"(RAMIRO EL VAMPIRO)%VAYA MEZCL"
	defm	"A SIN PAR%BAJA POR TUS CONDUCT"
	defm	"OS%NI ME QUIERO IMAGINAR%EL OL"
	defm	"OR DE TUS ERUCTOS"
	defb	0

;	SECTION	code



;	SECTION	text

._text8
	defm	"(CAMILA LA WILA)%ME GUSTA CAZA"
	defm	"R VARONES%COMO A BRUJAS Y MAGA"
	defm	"S%PERO NO HAGO POCIONES%YO ME "
	defm	"BAJO LAS BRAGAS"
	defb	0

;	SECTION	code



;	SECTION	text

._text9
	defm	"(RAMIRO EL VAMPIRO)%APARTA DE "
	defm	"MI, SIRENA%QUE ANDO DE MISION%"
	defm	"AY, VAYA UNA CONDENA%SER VAMPI"
	defm	"RO GUAPETON!"
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

;	SECTION	code


._redraw_from_buffer
	ld a, 1
	ld (__x), a
	ld a, 2
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
	ld c, a
	ld a, (_tileoffset)
	add c
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



._show_text_box
	ld	hl,_texts
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_gp_gen),hl
	ld	hl,4	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,40	;const
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
.i_43
	call	_clear_temp_string
	ld	a,(_rdy)
	cp	#(7 % 256)
	jp	z,i_45
	jp	c,i_45
	ld	hl,4	;const
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	dec	hl
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_45
	ld de, _temp_string + 1
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
	ld	hl,4	;const
	push	hl
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,_temp_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,4	;const
	push	hl
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,_bottom_string
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
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
	call	_wyz_play_sound
	ld b, #(20*6)
	.textbox_delay
	halt
	djnz textbox_delay
	ld	hl,(_gp_gen)
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_44
.i_46
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	dec	hl
	jp	i_43
.i_44
.i_47
	call	_any_key
	ld	a,h
	or	l
	jp	nz,i_47
.i_48
.i_49
	call	_any_key
	call	l_lneg
	jp	c,i_49
.i_50
	ld	hl,(_redraw_after_text)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_51
	call	_redraw_from_buffer
	call	_hotspot_paint
	call	_render_all_sprites
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
.i_51
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_redraw_after_text),a
	ret


;	SECTION	text

._e_scripts
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_2
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_3
	defw	0
	defw	0
	defw	0
	defw	_mscce_4
	defw	0
	defw	_mscce_6
	defw	_mscce_5
	defw	0
	defw	0
	defw	0
	defw	_mscce_11
	defw	_mscce_12
	defw	_mscce_8
	defw	_mscce_7
	defw	_mscce_9
	defw	_mscce_10
	defw	_mscce_0
	defw	_mscce_1

;	SECTION	code

;	SECTION	text

._f_scripts
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_1
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_3
	defw	_msccf_2
	defw	0
	defw	0
	defw	0
	defw	_msccf_8
	defw	_msccf_9
	defw	_msccf_5
	defw	_msccf_4
	defw	_msccf_6
	defw	_msccf_7
	defw	0
	defw	_msccf_0
	defw	0

;	SECTION	code

	._mscce_0
	defb 0x08, 0xF0, 0xFF, 0x01, 0x03, 0x01, 0x62, 0x65, 0xFF, 0xFF
	._mscce_1
	defb 0x05, 0x10, 0x02, 0x04, 0xFF, 0xFF, 0xFF
	._mscce_2
	defb 0x0F, 0xF0, 0xFF, 0x20, 0xC7, 0x17, 0x20, 0xD6, 0x18, 0x01, 0x06, 0x00, 0x01, 0x07, 0x00, 0xFF, 0xFF
	._mscce_3
	defb 0x09, 0xF0, 0xFF, 0x20, 0x72, 0x19, 0x20, 0x73, 0x1A, 0xFF, 0xFF
	._mscce_4
	defb 0x0F, 0xF0, 0xFF, 0x20, 0x46, 0x1B, 0x20, 0x47, 0x1C, 0x20, 0x76, 0x19, 0x20, 0x77, 0x1A, 0xFF, 0xFF
	._mscce_5
	defb 0x06, 0xF0, 0xFF, 0x20, 0x27, 0x15, 0xFF, 0x08, 0x13, 0x08, 0x02, 0xFF, 0x20, 0x03, 0x1F, 0xFF, 0x08, 0x13, 0x08, 0x01, 0xFF, 0x20, 0x37, 0x1E, 0xFF, 0x08, 0x10, 0x08, 0x01, 0xFF, 0x20, 0x37, 0x1D, 0xFF, 0xFF
	._mscce_6
	defb 0x11, 0x10, 0x09, 0x00, 0xFF, 0x61, 0x01, 0x06, 0x00, 0x20, 0x22, 0x12, 0x51, 0x20, 0x20, 0x2F, 0x2F, 0xFF, 0xFF
	._mscce_7
	defb 0x06, 0xF0, 0xFF, 0x20, 0x32, 0x13, 0xFF, 0x08, 0x13, 0x0A, 0x02, 0xFF, 0x20, 0x07, 0x1F, 0xFF, 0x08, 0x13, 0x0A, 0x01, 0xFF, 0x20, 0x42, 0x1E, 0xFF, 0x08, 0x10, 0x0A, 0x01, 0xFF, 0x20, 0x42, 0x1D, 0xFF, 0xFF
	._mscce_8
	defb 0x11, 0x10, 0x0B, 0x00, 0xFF, 0x61, 0x01, 0x06, 0x00, 0x20, 0x64, 0x12, 0x51, 0x60, 0x40, 0x6F, 0x4F, 0xFF, 0xFF
	._mscce_9
	defb 0x06, 0xF0, 0xFF, 0x20, 0xD2, 0x14, 0xFF, 0x08, 0x13, 0x0C, 0x02, 0xFF, 0x20, 0xE7, 0x1F, 0xFF, 0x08, 0x13, 0x0C, 0x01, 0xFF, 0x20, 0xC2, 0x1E, 0xFF, 0x08, 0x10, 0x0C, 0x01, 0xFF, 0x20, 0xC2, 0x1D, 0xFF, 0xFF
	._mscce_10
	defb 0x11, 0x10, 0x0D, 0x00, 0xFF, 0x61, 0x01, 0x06, 0x00, 0x20, 0xD8, 0x12, 0x51, 0xD0, 0x80, 0xDF, 0x8F, 0xFF, 0xFF
	._mscce_11
	defb 0x06, 0xF0, 0xFF, 0x20, 0xD8, 0x16, 0xFF, 0x08, 0x13, 0x0E, 0x02, 0xFF, 0x20, 0xE3, 0x1F, 0xFF, 0x08, 0x13, 0x0E, 0x01, 0xFF, 0x20, 0xC8, 0x1E, 0xFF, 0x08, 0x10, 0x0E, 0x01, 0xFF, 0x20, 0xC8, 0x1D, 0xFF, 0xFF
	._mscce_12
	defb 0x11, 0x10, 0x0F, 0x00, 0xFF, 0x61, 0x01, 0x06, 0x00, 0x20, 0xD8, 0x12, 0x51, 0xD0, 0x80, 0xDF, 0x8F, 0xFF, 0xFF
	._msccf_0
	defb 0x05, 0xF0, 0xFF, 0x30, 0x01, 0xFF, 0x0A, 0x10, 0x01, 0x14, 0xFF, 0xE0, 0x08, 0x65, 0x61, 0x6E, 0xFF, 0xFF
	._msccf_1
	defb 0x0B, 0x21, 0xC0, 0xDF, 0x22, 0x60, 0x7F, 0x41, 0x0E, 0xFF, 0xF1, 0xFF, 0x0F, 0x20, 0x0C, 0x07, 0x10, 0x06, 0x00, 0xFF, 0xE4, 0x00, 0xE0, 0x07, 0x01, 0x06, 0x01, 0xFF, 0x0F, 0x20, 0x0D, 0x06, 0x10, 0x07, 0x00, 0xFF, 0xE4, 0x01, 0xE0, 0x0B, 0x01, 0x07, 0x01, 0xFF, 0xFF
	._msccf_2
	defb 0x13, 0x20, 0x03, 0x07, 0x10, 0x08, 0x01, 0xFF, 0x01, 0x08, 0x02, 0x20, 0x37, 0x1E, 0x20, 0x03, 0x00, 0xE0, 0x08, 0xFF, 0x14, 0x20, 0x02, 0x07, 0x10, 0x08, 0x00, 0xFF, 0x01, 0x08, 0x01, 0xE4, 0x02, 0xE4, 0x03, 0x20, 0x37, 0x1D, 0xE0, 0x0B, 0xFF, 0xFF
	._msccf_3
	defb 0x25, 0x10, 0x09, 0x00, 0x10, 0x06, 0x00, 0x20, 0x02, 0x02, 0xFF, 0x01, 0x01, 0x00, 0x01, 0x06, 0x01, 0x01, 0x09, 0x01, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0xE3, 0x10, 0x20, 0x22, 0x00, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_4
	defb 0x13, 0x20, 0x04, 0x02, 0x10, 0x0A, 0x01, 0xFF, 0x01, 0x0A, 0x02, 0x20, 0x42, 0x1E, 0x20, 0x07, 0x00, 0xE0, 0x08, 0xFF, 0x14, 0x20, 0x03, 0x02, 0x10, 0x0A, 0x00, 0xFF, 0x01, 0x0A, 0x01, 0xE4, 0x04, 0xE4, 0x05, 0x20, 0x42, 0x1D, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_5
	defb 0x25, 0x10, 0x0B, 0x00, 0x10, 0x06, 0x00, 0x20, 0x06, 0x04, 0xFF, 0x01, 0x01, 0x00, 0x01, 0x06, 0x01, 0x01, 0x0B, 0x01, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0xE7, 0x10, 0x20, 0x64, 0x00, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_6
	defb 0x13, 0x20, 0x0C, 0x02, 0x10, 0x0C, 0x01, 0xFF, 0x01, 0x0C, 0x02, 0x20, 0xC2, 0x1E, 0x20, 0xE7, 0x00, 0xE0, 0x08, 0xFF, 0x14, 0x20, 0x0D, 0x02, 0x10, 0x0C, 0x00, 0xFF, 0x01, 0x0C, 0x01, 0xE4, 0x06, 0xE4, 0x07, 0x20, 0xC2, 0x1D, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_7
	defb 0x25, 0x10, 0x0D, 0x00, 0x10, 0x06, 0x00, 0x20, 0x0D, 0x08, 0xFF, 0x01, 0x01, 0x00, 0x01, 0x06, 0x01, 0x01, 0x0D, 0x01, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x07, 0x10, 0x20, 0xD8, 0x00, 0xE1, 0xE0, 0x06, 0xFF, 0xFF
	._msccf_8
	defb 0x13, 0x20, 0x0C, 0x08, 0x10, 0x0E, 0x01, 0xFF, 0x01, 0x0E, 0x02, 0x20, 0xC8, 0x1E, 0x20, 0xE3, 0x00, 0xE0, 0x08, 0xFF, 0x14, 0x20, 0x0D, 0x08, 0x10, 0x0E, 0x00, 0xFF, 0x01, 0x0F, 0x01, 0xE4, 0x08, 0xE4, 0x09, 0x20, 0xC8, 0x1D, 0xE0, 0x07, 0xFF, 0xFF
	._msccf_9
	defb 0x25, 0x10, 0x0F, 0x00, 0x10, 0x06, 0x00, 0x20, 0x0D, 0x08, 0xFF, 0x01, 0x01, 0x00, 0x01, 0x06, 0x01, 0x01, 0x0F, 0x01, 0x10, 0x02, 0x01, 0x40, 0x01, 0x60, 0x64, 0x6E, 0x20, 0x03, 0x10, 0x20, 0xD8, 0x00, 0xE1, 0xE0, 0x06, 0xFF, 0xFF

._msc_init_all
	ld hl, _flags
	ld de, _flags+1
	ld bc, 16-1
	xor a
	ld (hl), a
	ldir
	ret



._read_byte
	ld hl, (_script)
	ld a, (hl)
	inc hl
	ld (_script), hl
	ld l, a
	ld h, 0
	and 0xF0
	ld (_sc_i), a
	ld a, l
	and 0x0f
	ld (_sc_m), a
	ret



._read_vbyte
	call _read_byte
	;ld a, l
	bit 7, a
	ret z
	and 127
	ld d, 0
	ld e, a
	ld hl, _flags
	add hl, de
	ld l, (hl)
	ld h, 0
	ret



._read_x_y
	call _read_vbyte
	ld a, l
	ld (_sc_x), a
	call _read_vbyte
	ld a, l
	ld (_sc_y), a
	ret



._run_script
	ld	a,#(0 % 256 % 256)
	ld	(_script_result),a
	ld	hl,(_script)
	ld	a,h
	or	l
	jp	nz,i_54
	ret


.i_54
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_55
	ld	hl,(_script_result)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_56
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_eq
	jp	c,i_56
.i_57
	ld	de,(_script)
	ld	hl,(_sc_c)
	ld	h,0
	add	hl,de
	ld	(_next_script),hl
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_continuar),a
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
.i_58
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_59
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	hl,(_sc_c)
	ld	h,0
.i_62
	ld	a,l
	cp	#(16% 256)
	jp	z,i_63
	cp	#(19% 256)
	jp	z,i_64
	cp	#(32% 256)
	jp	z,i_65
	cp	#(33% 256)
	jp	z,i_68
	cp	#(34% 256)
	jp	z,i_71
	cp	#(65% 256)
	jp	z,i_74
	cp	#(240% 256)
	jp	z,i_75
	cp	#(255% 256)
	jp	z,i_76
	jp	i_61
.i_63
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_read_vbyte
	pop	de
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_61
.i_64
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_read_vbyte
	pop	de
	call	l_eq
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_61
.i_65
	call	_read_x_y
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	a,(_sc_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_66
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	a,(_sc_x)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_66
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_66
	ld	hl,(_gpy)
	ld	h,0
	push	hl
	ld	a,(_sc_y)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jp	nc,i_66
	ld	hl,1	;const
	jr	i_67
.i_66
	ld	hl,0	;const
.i_67
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_61
.i_68
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_x),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_y),a
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_x)
	ld	h,0
	call	l_uge
	jp	nc,i_69
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_ule
	jp	nc,i_69
	ld	hl,1	;const
	jr	i_70
.i_69
	ld	hl,0	;const
.i_70
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_61
.i_71
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_x),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_y),a
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_x)
	ld	h,0
	call	l_uge
	jp	nc,i_72
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_ule
	jp	nc,i_72
	ld	hl,1	;const
	jr	i_73
.i_72
	ld	hl,0	;const
.i_73
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_61
.i_74
	ld	hl,_player+27
	call	l_gchar
	push	hl
	call	_read_vbyte
	pop	de
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
.i_75
	jp	i_61
.i_76
	ld a, 1
	ld (_sc_terminado), a
	ld (_sc_continuar), a
	ld (_script_something_done), a
.i_61
	jp	i_58
.i_59
	ld	a,(_sc_continuar)
	and	a
	jp	z,i_77
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_78
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_79
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	hl,(_sc_c)
	ld	h,0
.i_82
	ld	a,l
	cp	#(1% 256)
	jp	z,i_83
	cp	#(16% 256)
	jp	z,i_84
	cp	#(32% 256)
	jp	z,i_85
	cp	#(48% 256)
	jp	z,i_86
	cp	#(64% 256)
	jp	z,i_87
	cp	#(81% 256)
	jp	z,i_88
	cp	#(96% 256)
	jp	z,i_89
	cp	#(97% 256)
	jp	z,i_90
	cp	#(98% 256)
	jp	z,i_91
	cp	#(100% 256)
	jp	z,i_92
	cp	#(101% 256)
	jp	z,i_93
	cp	#(110% 256)
	jp	z,i_94
	cp	#(224% 256)
	jp	z,i_95
	cp	#(225% 256)
	jp	z,i_96
	cp	#(228% 256)
	jp	z,i_97
	cp	#(241% 256)
	jp	z,i_98
	cp	#(255% 256)
	jp	z,i_99
	jp	i_81
.i_83
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	push	hl
	call	_read_vbyte
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_81
.i_84
	ld	hl,_flags
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	push	hl
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_81
.i_85
	call	_read_byte
	ld	a,(_sc_i)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_sc_m)
	ld	h,0
	push	hl
	call	_read_vbyte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(_sc_n)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	jp	i_81
.i_86
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	pop	de
	call	l_pint
	jp	i_81
.i_87
	ld	hl,_player+27
	push	hl
	call	l_gchar
	push	hl
	call	_read_vbyte
	pop	de
	add	hl,de
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_81
.i_88
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzx1),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzy1),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzx2),a
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_fzy2),a
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_f_zone_ac),a
	jp	i_81
.i_89
	ld	hl,_scenery_info
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_81
.i_90
	ld	hl,_scenery_info
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_81
.i_91
	ld	hl,_scenery_info+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_81
.i_92
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_81
.i_93
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_81
.i_94
	call	_draw_scr_background
	jp	i_81
.i_95
	call	_read_vbyte
	ld	h,0
	call	_wyz_play_sound
	jp	i_81
.i_96
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jp	i_81
.i_97
	call	_read_byte
	ld	h,0
	push	hl
	call	_do_extern_action
	pop	bc
	jp	i_81
.i_98
	ld a, 1
	ld (_sc_terminado), a
	ld (_script_result), a
	jp	i_81
.i_99
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_81
	jp	i_78
.i_79
.i_77
	ld	hl,(_next_script)
	ld	(_script),hl
	jp	i_55
.i_56
	ret


	._s_title
	BINARY "titlec.bin"
	._s_marco
	._s_ending
	BINARY "endingc.bin"

._blackout
	ld	hl,1 % 256	;const
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
	ld	hl,17	;const
	push	hl
	ld	hl,7	;const
	push	hl
	ld	hl,i_1+0
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,11	;const
	push	hl
	ld	hl,18	;const
	push	hl
	ld	hl,7	;const
	push	hl
	ld	hl,i_1+11
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	call	cpc_UpdScr
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld	hl,0	;const
	call	_wyz_play_music
.i_100
	ld	hl,10	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_102
	ld	hl,_def_keys
	ld	(_gp_gen),hl
	jp	i_101
.i_102
	ld	hl,11	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_103
	ld	hl,_def_keys_joy
	ld	(_gp_gen),hl
	jp	i_101
.i_103
	jp	i_100
.i_101
	call	_wyz_stop_sound
	._copy_keys_to_extern
	ld hl, (_gp_gen)
	ld de, cpc_KeysData + 12
	ld bc, 24
	ldir
	ret



._game_ending
	call	_blackout
	ld hl, _s_ending
	ld de, 0x9000
	call depack
	ld	hl,1	;const
	call	cpc_ShowTileMap
	ld	hl,0	;const
	call	_wyz_play_music
	ld	hl,500	;const
	push	hl
	call	_espera_activa
	pop	bc
	call	_wyz_stop_sound
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
	call	_draw_rectangle
	ld	hl,11	;const
	push	hl
	ld	hl,12	;const
	push	hl
	ld	hl,96	;const
	push	hl
	ld	hl,i_1+22
	push	hl
	call	_draw_text
	pop	bc
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



._do_extern_action
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
	ret


;	SECTION	text

._line_of_text_clear
	defm	"                              "
	defm	"  "
	defb	0

;	SECTION	code



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



._render_this_enemy
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
	ld a, (_rdx)
	add #(1*8)
	add (ix + 6)
	srl a
	srl a
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
	jp	i_107
.i_105
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_107
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_106
	jp	nc,i_106
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
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,6	;const
	ex	de,hl
	call	l_eq
	jp	c,i_109
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
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	pop	de
	add	hl,de
	ld	bc,8
	add	hl,bc
	call	l_gchar
	ld	de,0	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_108
.i_109
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
	jp	i_111
.i_108
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
.i_111
	call _render_this_enemy
	jp	i_105
.i_106
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
	jp	c,i_113
	ld	a,(_half_life)
	and	a
	jp	z,i_112
.i_113
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_115
.i_112
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_115
	.render_player
	ld ix, #(0xE000 + 0x600 + (0*16))
	ld a, (_gpx)
	add #(1*8)
	add (ix + 6)
	srl a
	srl a
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



._get_coin
	ld	hl,_flags+1
	inc	(hl)
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	l,(hl)
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
	ld	hl,5	;const
	call	_wyz_play_sound
	ld	hl,(_f_scripts+58)
	ld	(_script),hl
	call	_run_script
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
	ld	hl,20	;const
	call	l_and
	ld	de,20	;const
	ex	de,hl
	call	l_ne
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_button_jump),a
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
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
	jp	nz,i_116
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,11
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
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
	jp	nz,i_116
	jr	i_117
.i_116
	ld	hl,1	;const
.i_117
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	a,(_button_jump)
	and	a
	jp	z,i_118
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_120
	ld	a,(_player+42)
	cp	#(0 % 256)
	jr	z,i_121_i_120
.i_120
	jp	i_119
.i_121_i_120
	ld	a,(_rdi)
	and	a
	jp	nz,i_123
	ld	a,(_player+25)
	and	a
	jp	z,i_122
.i_123
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1	;const
	call	_wyz_play_sound
.i_122
.i_119
	ld	a,(_player+19)
	and	a
	jp	z,i_125
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
	ld	de,144
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
	jp	nc,i_126
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_126
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_127
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_127
.i_125
	jp	i_128
.i_118
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(0 % 256 % 256)
.i_128
	ld	hl,_player+41
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_129
	ld	hl,_player+42
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	m,i_130
	or	l
	jp	z,i_130
	ld	hl,_player+41
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	._player_hover
	ld a, (_pad0)
	or 0x08
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
.i_130
	jp	i_131
.i_129
	ld	hl,_player+42
	ld	(hl),#(0 % 256 % 256)
.i_131
	ld	hl,(_player+41)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_132
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
.i_132
	ld	a,(_player+25)
	and	a
	jp	z,i_133
	ld	hl,0	;const
	ld	(_player+8),hl
.i_133
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
	jp	p,i_134
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_134
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_135
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_135
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
	ld	hl,_pad0
	ld	a,(hl)
	and	#(1 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_137
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_138_i_137
.i_137
	jp	i_136
.i_138_i_137
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_139
	or	l
	jp	z,i_139
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
	jp	p,i_140
	ld	hl,0	;const
	ld	(_player+6),hl
.i_140
	jp	i_141
.i_139
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_142
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
	jp	m,i_143
	or	l
	jp	z,i_143
	ld	hl,0	;const
	ld	(_player+6),hl
.i_143
.i_142
.i_141
.i_136
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	c,i_144
	ld	hl,(_player+6)
	push	hl
	ld	hl,(_player+39)
	call	l_neg
	pop	de
	call	l_gt
	jp	nc,i_145
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
.i_145
.i_144
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_146
	ld	de,(_player+6)
	ld	hl,(_player+39)
	call	l_lt
	jp	nc,i_147
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
.i_147
.i_146
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
	jp	p,i_148
	ld	hl,0	;const
	ld	(_player),hl
.i_148
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_149
	ld	hl,14336	;const
	ld	(_player),hl
.i_149
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
	ld a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld a, (_gpy)
	add 14
	srl a
	srl a
	srl a
	srl a
	call _attr_2
	ld a, l
	dec a
	jr nz, evil_tile_collision_done
	.evil_tile_collision
	ld	a,(_player+23)
	and	a
	jp	nz,i_150
	ld	hl,2	;const
	call	_wyz_play_sound
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
	call	_player_flicker
.i_150
	ld	de,_player
	ld	hl,(_gpcx)
	call	l_pint
	ld	de,_player+1+1
	ld	hl,(_gpcy)
	call	l_pint
	ld	hl,_player+8
	push	hl
	call	l_gint	;
	call	_abs
	call	l_neg
	pop	de
	call	l_pint
	ld	hl,(_player+8)
	ld	de,65248	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_151
	ld	hl,65248	;const
	ld	(_player+8),hl
.i_151
	.evil_tile_collision_done
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	call	_attr
	pop	bc
	pop	bc
	ld	de,3	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_152
	ld	a,(_player+35)
	ld	e,a
	ld	d,0
	ld	hl,32	;const
	call	l_uge
	jp	c,i_154
	ld	hl,(_scenery_info+1)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_153
.i_154
	ld	hl,_player+23
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_156
	ld	hl,_player+34
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
	ld	a,(_player+34)
	and	a
	jp	nz,i_157
	ld	hl,3	;const
	call	_wyz_play_sound
.i_157
	ld	hl,_player+29
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp  255
	jr	nz,ASMPC+3
	dec	(hl)
	ld	h,(hl)
	ld	l,a
	inc	hl
.i_156
	jp	i_158
.i_153
	ld	a,(_player+34)
	cp	#(8 % 256)
	jp	z,i_159
	jp	c,i_159
	ld	hl,_player+34
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+35
	inc	(hl)
	ld	hl,76	;const
	call	_cpc_Border
	ld	hl,4	;const
	call	_wyz_play_sound
	jp	i_160
.i_159
	ld	hl,_player+34
	inc	(hl)
	ld	hl,84	;const
	call	_cpc_Border
.i_160
.i_158
	jp	i_161
.i_152
	ld	a,(_player+35)
	and	a
	jp	z,i_162
	ld	hl,_player+35
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_162
.i_161
	.player_get_coin
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jp	nc,i_163
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_163
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_165
	inc	hl
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
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_166_i_165
.i_165
	jp	i_164
.i_166_i_165
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_164
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_168
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_169_i_168
.i_168
	jp	i_167
.i_169_i_168
	ld	hl,(_gpxx)
	ld	h,0
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_167
	ld	hl,_gpx
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_171
	inc	hl
	ld	hl,_gpy
	ld	a,(hl)
	and	#(15 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jp	z,i_171
	inc	hl
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,13	;const
	ex	de,hl
	call	l_eq
	jr	c,i_172_i_171
.i_171
	jp	i_170
.i_172_i_171
	ld	hl,(_gpxx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,(_gpyy)
	ld	h,0
	inc	hl
	push	hl
	call	_get_coin
	pop	bc
	pop	bc
.i_170
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
	jp	nc,i_174
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_175_i_174
.i_174
	jp	i_173
.i_175_i_174
	ld	hl,3 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_176
.i_173
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_177
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_178
.i_177
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
	jp	nz,i_179
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_179
.i_178
.i_176
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
	ld	a,#(160 % 256 % 256)
	ld	(_gpx),a
	ld	hl,112 % 256	;const
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
	ld (_player+22),a
	ret



._init_player
	call	_init_player_values
	ld hl, 69
	ld (_player+29), hl
	xor a
	ld (_player+27), a
	ld (_player+28), a
	ld (_player+32), a
	ret



._init_hotspots
	ld b, 7 * 4
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
	ld a, (__t)
	ld (hl), a
	ld a, (_rdx)
	add 1
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
	add 2
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
	ld	de,_map_behaviours
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	rrca
	jp	nc,i_180
	ld	hl,32	;const
	jp	i_181
.i_180
	ld	hl,0	;const
.i_181
	ld	h,0
	ld	a,l
	ld	(_tileoffset),a
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
	call coins_check
	ld (_rdt1), a
	ld a, b
	and 15
	call coins_check
	ld (_rdt2), a
	ld a, (_tileoffset)
	ld c, a
	ld a, (_rdt1)
	ld (__t), a
	add c
	ld (__n), a
	call _draw_and_advance
	ld a, (_tileoffset)
	ld c, a
	ld a, (_rdt2)
	ld (__t), a
	add c
	ld (__n), a
	call _draw_and_advance
	ld a, (_gpit)
	inc a
	ld (_gpit), a
	cp 75
	jr nz, draw_scr_bg_loop
	jr draw_scr_bg_loop_end
	.coins_check
	cp 13
	ret nz
	ld a, (_scenery_info + 0)
	or a
	ret nz
	ld a, 0
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
	ld	h,0
	ld	a,l
	ld	(_rdb),a
	ld	hl,(_enit)
	ld	h,0
	ld	de,1
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_rda)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,6
	add	hl,bc
	push	hl
	ld	de,_sm_cox
	ld	hl,(_rdb)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_rda)
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
	ld	de,_sm_coy
	ld	hl,(_rdb)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_rda)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,12
	add	hl,bc
	push	hl
	ld	hl,_sm_invfunc
	push	hl
	ld	hl,(_rdb)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	ld	hl,_sp_sw
	push	hl
	ld	hl,(_rda)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	bc,14
	add	hl,bc
	push	hl
	ld	hl,_sm_updfunc
	push	hl
	ld	hl,(_rdb)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	pop	de
	call	l_pint
	call	_enems_calc_frame
	ret



._draw_scr
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	call	_draw_scr_background
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_f_zone_ac),a
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
	jp	i_184
.i_182
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_184
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_183
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
.i_187
	ld	a,l
	cp	#(1% 256)
	jp	z,i_188
	cp	#(2% 256)
	jp	z,i_189
	cp	#(3% 256)
	jp	z,i_190
	cp	#(4% 256)
	jp	z,i_191
	cp	#(6% 256)
	jp	z,i_192
	jp	i_186
.i_188
.i_189
.i_190
.i_191
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_186
.i_192
	ld	hl,2	;const
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
	ld	b,h
	ld	c,l
	add	hl,bc
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
	ld	b,h
	ld	c,l
	add	hl,bc
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
.i_186
	jp	i_182
.i_183
	ld	hl,(_e_scripts+58)
	ld	(_script),hl
	call	_run_script
	ld	hl,_e_scripts
	push	hl
	ld	hl,(_n_pant)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	ld	(_script),hl
	call	_run_script
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
	jp	i_195
.i_193
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_195
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_194
	jp	nc,i_194
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
	ld	a,(__en_t)
	and	a
	jp	z,i_196
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
	jp	nc,i_197
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
.i_197
	ld	a,(__en_t)
	cp	#(6 % 256)
	jp	z,i_199
	ld	a,(__en_t)
	cp	#(0 % 256)
	jp	nz,i_198
.i_199
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_201
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
	jp	nc,i_203
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
	jr	c,i_204_i_203
.i_203
	jp	i_202
.i_204_i_203
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
	jp	i_205
.i_202
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
	jp	nc,i_207
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
	jr	c,i_208_i_207
.i_207
	jp	i_206
.i_208_i_207
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
.i_206
.i_205
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
	jp	nc,i_210
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
	jr	c,i_211_i_210
.i_210
	jp	i_209
.i_211_i_210
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
	jp	i_212
.i_209
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
	jp	nc,i_214
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
	jr	c,i_215_i_214
.i_214
	jp	i_213
.i_215_i_214
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
.i_213
.i_212
.i_201
	ld	a,(_scenery_info+1+1+1)
	and	a
	jp	z,i_216
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
.i_216
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
	ld	hl,14336	;const
	call	l_gt
	jp	nc,i_217
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,14336	;const
	ex	de,hl
	call	l_pint
.i_217
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	xor	a
	or	h
	jp	p,i_218
	ld	hl,_en_an_x
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
.i_218
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
	ld	hl,9216	;const
	call	l_gt
	jp	nc,i_219
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,9216	;const
	ex	de,hl
	call	l_pint
.i_219
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint	;
	xor	a
	or	h
	jp	p,i_220
	ld	hl,_en_an_y
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	ld	de,0	;const
	ex	de,hl
	call	l_pint
.i_220
.i_198
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
	jp	nc,i_221
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
	jp	i_222
.i_221
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
.i_222
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_224
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_224
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_225_i_224
.i_224
	jp	i_223
.i_225_i_224
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
	ld a, (__en_mx)
	call Ashl16_HL
	call withSign
	ld (_ptgmx), hl
	.moving_platforms_done
	jp	i_226
.i_223
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_228
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_228
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_228
	jr	c,i_229_i_228
.i_228
	jp	i_227
.i_229_i_228
	ld	a,(_player+23)
	and	a
	jp	nz,i_230
	ld	a,#(1 % 256 % 256)
	ld	(_en_tocado),a
	ld	hl,_player+36
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2	;const
	call	_wyz_play_sound
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	z,i_231
	jp	c,i_231
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-12
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_232
.i_231
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
.i_232
	call	_player_flicker
.i_230
.i_227
.i_226
.i_196
.i_233
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
	jp	i_193
.i_194
	ret



._main
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
	ld hl, (_sm_sprptr)
	ld (ix + 1), h
	ld (ix + 0), l
	ld (ix + 3), h
	ld (ix + 2), l
	ld ix, #(0xE000 + 0x600+(1*16))
	ld de, 16
	ld b, 3
	.sp_sw_init_enems_loop
	ld hl, cpc_PutSpTileMap4x8
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, cpc_PutTrSp4x8TileMap2b
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
	ld a, #(2*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	ei
.i_234
	call	_title_screen
	ld	a,#(1 % 256 % 256)
	ld	(_playing),a
	ld	hl,_scenery_info+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	call	_init_player
	call	_init_hotspots
	ld	a,#(6 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_result),a
	call	_msc_init_all
	ld	hl,_flags+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_e_scripts+56)
	ld	(_script),hl
	call	_run_script
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
.i_236
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_237
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
	jp	nc,i_238
	ld	hl,29	;const
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
.i_238
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_239
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_240
	or	l
	jp	z,i_240
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_241
.i_240
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_241
	ld	hl,3	;const
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
.i_239
	ld	hl,(_player+35)
	ld	h,0
	ex	de,hl
	ld	hl,(_ezg_old)
	ld	h,0
	call	l_ne
	jp	nc,i_242
	ld	hl,21	;const
	push	hl
	ld	hl,23	;const
	push	hl
	ld	hl,(_player+35)
	ld	h,0
	ld	de,32
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_player+35)
	ld	h,0
	ld	a,l
	ld	(_ezg_old),a
.i_242
	ld	hl,(_flags+1)
	ld	h,0
	ex	de,hl
	ld	hl,(_coins_old)
	ld	h,0
	call	l_ne
	jp	nc,i_243
	ld	hl,12	;const
	push	hl
	ld	hl,23	;const
	push	hl
	ld	hl,(_flags+1)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags+1)
	ld	h,0
	ld	a,l
	ld	(_coins_old),a
.i_243
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
	ld a, (_f_zone_ac)
	dec a
	jr nz, ml_f_zone_skip
	ld a, (_fzx1)
	ld c, a
	ld a, (_gpx)
	cp c
	jr c, ml_f_zone_skip
	ld a, (_gpx)
	ld c, a
	ld a, (_fzx2)
	cp c
	jr c, ml_f_zone_skip
	ld a, (_fzy1)
	ld c, a
	ld a, (_gpy)
	cp c
	jr c, ml_f_zone_skip
	ld a, (_gpy)
	ld c, a
	ld a, (_fzy2)
	cp c
	jr c, ml_f_zone_skip
	ld a, (_n_pant)
	sla a
	ld c, a
	ld b, 0
	ld hl, _f_scripts
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld (_script), hl
	call _run_script
	.ml_f_zone_skip
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
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_246
	ld	a,l
	cp	#(1% 256)
	jp	nz,i_245
.i_247
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6	;const
	call	_wyz_play_sound
	ld	hl,_flags+1+1
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_245
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_248
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
.i_248
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
	ld	hl,3	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_249
	ld	hl,(_f_scripts+56)
	ld	(_script),hl
	call	_run_script
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
.i_249
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_251
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_252_i_251
.i_251
	jp	i_250
.i_252_i_251
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_253
.i_250
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_255
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_256_i_255
.i_255
	jp	i_254
.i_256_i_255
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_254
.i_253
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_258
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_258
	ld	a,(_n_pant)
	cp	#(7 % 256)
	jr	z,i_258_uge
	jp	c,i_258
.i_258_uge
	jr	i_259_i_258
.i_258
	jp	i_257
.i_259_i_258
	ld a, (_n_pant)
	sub 7
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_260
.i_257
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_262
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_263_i_262
.i_262
	jp	i_261
.i_263_i_262
	ld a, (_n_pant)
	add 7
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_261
.i_260
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_264
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_264
	ld	a,(_player+36)
	and	a
	jp	z,i_265
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_266
	or	l
	jp	z,i_266
.i_266
.i_265
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_268
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	nz,i_267
.i_268
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_267
	jp	i_236
.i_237
	call	_wyz_stop_sound
	jp	i_234
.i_235
	ret


;	SECTION	text

.i_1
	defm	"1 KEYBOARD"
	defb	0

	defm	"2 JOYSTICK"
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
._en_cx	defs	1
._en_cy	defs	1
._flags	defs	16
._gp_gen_alt	defs	2
._en_xx	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._killed_old	defs	1
._ezg_old	defs	1
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad_this_frame	defs	1
._button_jump	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._gpcx	defs	2
._gpcy	defs	2
._fzx1	defs	1
._fzx2	defs	1
._fzy1	defs	1
._fzy2	defs	1
._rdt1	defs	1
._playing	defs	1
._gpit	defs	1
._rdt2	defs	1
._sc_c	defs	1
._scenery_info	defs	4
._sc_i	defs	1
._sc_m	defs	1
._sc_n	defs	1
._seed	defs	2
._sc_x	defs	1
._sc_y	defs	1
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._maincounter	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._wall	defs	1
._f_zone_ac	defs	1
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._tileoffset	defs	1
._next_script	defs	2
._item_old	defs	1
._idx	defs	2
._player	defs	44
._jetpac_frame_counter	defs	1
._rda	defs	1
._rdb	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdi	defs	1
._rdj	defs	2
._keys_old	defs	1
._rdx	defs	1
._rdy	defs	1
._pti	defs	1
._ptj	defs	1
._script	defs	2
._enoffsmasi	defs	2
._sc_terminado	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._sc_continuar	defs	1
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
._ram_destination	defs	2
._ram_address	defs	2
;	SECTION	code



; --- Start of Scope Defns ---

	XDEF	_read_vbyte
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
	XDEF	_f_scripts
	XDEF	_can_move_box
	LIB	cpc_PrintGphStrStdXY
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	LIB	cpc_PutTiles
	XDEF	_sprites
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	_def_keys
	XDEF	__en_y2
	LIB	cpc_PrintGphStrM12X
	XDEF	_en_an_base_frame
	defc	_en_an_base_frame	=	54838
	XDEF	_init_falling_box_buffer
	XDEF	_show_text_box
	XDEF	_hotspot_t
	XDEF	_wyz_play_sound
	XDEF	_hotspot_x
	XDEF	_hotspot_y
	XDEF	_half_life
	LIB	cpc_ShowScrTileMap
	XDEF	__en_mx
	XDEF	__en_my
	LIB	cpc_SetMode
	LIB	cpc_ClrScr
	XDEF	_en_cx
	LIB	cpc_SetModo
	XDEF	_en_cy
	XDEF	_adjust_to_tile_x
	LIB	cpc_PutMaskSpriteTileMap2b
	LIB	cpc_PutTrSpriteTileMap2b
	XDEF	_adjust_to_tile_y
	XDEF	_en_an_state
	defc	_en_an_state	=	54832
	XDEF	_flags
	LIB	cpc_SetInkGphStr
	XDEF	_mueve_bicharracos
	XDEF	_gp_gen_alt
	LIB	cpc_ShowTouchedTiles2
	LIB	cpc_SetTile
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_en_yy
	XDEF	_draw_text
	LIB	cpc_CollSp
	XDEF	_beepet
	LIB	cpc_PutMaskSp4x16
	XDEF	_en_an_morido
	defc	_en_an_morido	=	54802
	XDEF	_gp_gen_org
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
	XDEF	_script_something_done
	LIB	cpc_ShowTileMap
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_t_alt
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_cpc_UpdateNow
	XDEF	_espera_activa
	LIB	cpc_SpRLM1
	XDEF	__n
	XDEF	_title_screen
	XDEF	_en_an_fanty_activo
	defc	_en_an_fanty_activo	=	54829
	XDEF	__t
	XDEF	_map_behaviours
	XDEF	__x
	XDEF	__y
	XDEF	_player_hidden
	XDEF	_wyz_init
	LIB	cpc_PrintGphStrXY2X
	XDEF	_life_old
	XDEF	_en_ccx
	LIB	cpc_SpRRM1
	XDEF	_en_ccy
	XDEF	_enems_en_an_calc
	XDEF	_sm_sprptr
	LIB	cpc_PrintGphStrXYM1
	XDEF	_fall_box
	XDEF	_bottom_string
	LIB	cpc_PutSpriteXOR
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
	XDEF	_mscce_0
	XDEF	_mscce_1
	LIB	cpc_PutSpTileMap
	LIB	cpc_InitTileMap
	XDEF	_mscce_2
	XDEF	_mscce_3
	XDEF	_mscce_4
	XDEF	_mscce_5
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
	XDEF	_read_byte
	XDEF	_s_marco
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
	XDEF	_texts
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
	XDEF	_button_jump
	XDEF	_enem_cells
	LIB	cpc_PrintGphStrXYM12X
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	__tile_address
	XDEF	_n_pant
	XDEF	_def_keys_joy
	XDEF	_en_j
	XDEF	_redraw_after_text
	LIB	cpc_SetBorder
	XDEF	_en_an_ff
	defc	_en_an_ff	=	54835
	LIB	cpc_RLI
	XDEF	_en_x
	XDEF	_en_y
	XDEF	_draw_rectangle
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
	LIB	cpc_ShowTouchedTiles
	XDEF	_gpcx
	XDEF	_gpcy
	XDEF	_fzx1
	XDEF	_fzx2
	XDEF	_fzy1
	XDEF	_fzy2
	XDEF	_rdt1
	XDEF	_playing
	LIB	cpc_PutMaskSp2x8
	XDEF	_en_an_vx
	defc	_en_an_vx	=	54817
	XDEF	_en_an_vy
	defc	_en_an_vy	=	54823
	XDEF	_gpit
	LIB	cpc_ScanKeyboard
	XDEF	_rdt2
	XDEF	_sm_updfunc
	LIB	cpc_SetColour
	XDEF	_sc_c
	XDEF	_s_title
	XDEF	_scenery_info
	XDEF	_sc_i
	XDEF	_line_of_text_clear
	XDEF	_sc_m
	XDEF	_sc_n
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_sc_x
	XDEF	_sc_y
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_gpxx
	XDEF	_gpyy
	XDEF	_maincounter
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
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
	XDEF	_f_zone_ac
	XDEF	_cerrojos
	XDEF	_en_an_next_frame
	defc	_en_an_next_frame	=	54796
	LIB	cpc_ScrollLeft0
	XDEF	_my_inks
	XDEF	__x2
	XDEF	__y2
	LIB	cpc_AnyKeyPressed
	XDEF	__en_life
	XDEF	_cpc_HardPause
	LIB	cpc_AssignKey
	XDEF	_prxx
	XDEF	_read_x_y
	XDEF	_pryy
	XDEF	_calc_hotspot_ptr
	LIB	cpc_TouchTiles
	XDEF	_tileoffset
	XDEF	_abs
	LIB	cpc_ScrollRight0
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
	LIB	cpc_UnExo
	XDEF	_redraw_from_buffer
	XDEF	_top_string
	XDEF	_temp_string
	XDEF	_clear_temp_string
	XDEF	_next_script
	XDEF	_run_script
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
	XDEF	_rda
	XDEF	_rdb
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	XDEF	_rdi
	XDEF	_rdj
	XDEF	_keys_old
	XDEF	_init_player_values
	XDEF	_en_tocado
	LIB	cpc_TestKeyF
	XDEF	_mscce_10
	XDEF	_draw_2_digits
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_script_result
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_init_hotspots
	XDEF	_player_flicker
	XDEF	_pti
	XDEF	_ptj
	XDEF	_move_tile
	XDEF	_tileset
	XDEF	_comportamiento_tiles
	LIB	cpc_PutSpTileMap8x16
	LIB	cpc_PutSpTileMap8x24
	XDEF	_script
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	XDEF	_msc_init_all
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_e_scripts
	LIB	cpc_PutSpTileMapO
	XDEF	_enoffsmasi
	XDEF	_talk_sounds
	LIB	cpc_PutSp
	LIB	cpc_UpdScrAddresses
	XDEF	_get_coin
	XDEF	_sc_terminado
	XDEF	_asm_int
	XDEF	_hotspot_paint
	XDEF	__baddies_pointer
	XDEF	_calc_baddies_pointer
	LIB	cpc_TouchTileSpXY
	XDEF	_any_key
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	XDEF	_sc_continuar
	LIB	cpc_PutMaskSp
	XDEF	_orig_tile
	XDEF	_en_an_frame
	defc	_en_an_frame	=	54784
	XDEF	_success
	LIB	cpc_RedefineKey
	XDEF	_coins_old
	XDEF	_do_extern_action
	XDEF	_ram_destination
	XDEF	_platform_get_player
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
	XDEF	_game_over
	LIB	cpc_PrintGphStrM1
	XDEF	_ram_address


; --- End of Scope Defns ---


; --- End of Compilation ---
