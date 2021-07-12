;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20100416.1
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Jul 12 13:42:54 2021



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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	3

	defm	""
	defb	4

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
	defb	11

	defm	""
	defb	10

	defm	""
	defb	12

	defm	""
	defb	14

	defm	""
	defb	27

	defm	""
	defb	0

	defm	""
	defb	28

	defm	""
	defb	22

	defm	""
	defb	24

	defm	""
	defb	31

	defm	""
	defb	23

	defm	""
	defb	19

	defm	""
	defb	30

	defm	""
	defb	3

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
	defw PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,0,PAUTA_7,PAUTA_8,PAUTA_9,PAUTA_10,PAUTA_11,PAUTA_12,PAUTA_13,PAUTA_14,PAUTA_15,PAUTA_16
	; Tabla de efectos
	.TABLA_SONIDOS
	defw SONIDO0,SONIDO1,SONIDO2,SONIDO3,SONIDO4,SONIDO5,SONIDO6,SONIDO7,SONIDO8,SONIDO9
	;Pautas (instrumentos)
	;Instrumento 'Piano'
	.PAUTA_0
	defb 8,0,7,0,6,0,5,0,129
	;Instrumento 'Piano Reverb'
	.PAUTA_1
	defb 11,0,12,0,11,0,10,0,9,0,9,0,9,0,9,0,9,0,9,0,8,0,8,0,8,0,8,0,136
	;Instrumento 'Fade In FX'
	.PAUTA_2
	defb 2,0,3,0,4,8,4,-1,5,-4,5,20,5,-24,4,4,132
	;Instrumento 'Guitar 1'
	.PAUTA_3
	defb 15,0,15,0,13,0,13,0,11,0,10,1,10,1,10,-1,9,-1,9,0,9,0,134
	;Instrumento 'Guitar 2'
	.PAUTA_4
	defb 13,0,13,0,12,0,11,0,9,0,8,1,8,0,8,0,8,-1,8,0,8,0,134
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
	defb 46,0,13,4,12,-4,11,3,10,-5,9,0,129
	;Instrumento 'Robo'
	.PAUTA_10
	defb 12,-1,12,-1,28,9,11,0,27,5,27,9,10,0,26,5,26,9,9,0,25,5,25,9,8,0,24,5,24,9,131
	;Instrumento 'Chip'
	.PAUTA_11
	defb 70,0,7,0,40,0,7,0,6,0,5,0,129
	;Instrumento 'Clipclop'
	.PAUTA_12
	defb 12,0,11,0,10,0,9,0,9,0,9,0,9,0,9,0,8,0,8,0,8,0,8,0,8,0,138
	;Instrumento 'Eco'
	.PAUTA_13
	defb 9,0,8,0,7,0,6,0,129
	;Instrumento 'Harmonica'
	.PAUTA_14
	defb 42,0,11,0,12,0,11,0,10,0,9,0,129
	;Instrumento 'Onda'
	.PAUTA_15
	defb 73,0,10,0,11,0,12,0,11,0,10,0,9,0,6,0,129
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
	._02_time_attack_mus_bin
	BINARY "../ogt/02_time_attack.mus.bin"
	._03_woodys_mus_bin
	BINARY "../ogt/03_woodys.mus.bin"
	._wyz_songs
	defw _00_title_mus_bin, _01_ingame_mus_bin, _02_time_attack_mus_bin, _03_woodys_mus_bin

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
	LD A, (_pattern_line_ct)
	INC A
	AND 63
	LD (_pattern_line_ct), a
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
	defb	240

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

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

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	210

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	25

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"#"
	defb	192

	defm	""
	defb	18

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	148

	defm	"DDD@"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	153

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	254

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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	129

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"0"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	"DDK"
	defb	238

	defm	""
	defb	224

	defm	""
	defb	240

	defm	""
	defb	15

	defm	""
	defb	9

	defm	""
	defb	184

	defm	""
	defb	187

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
	defb	0

	defm	""
	defb	0

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
	defb	188

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	9

	defm	""
	defb	183

	defm	""
	defb	158

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	128

	defm	"i"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	144

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
	defb	13

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	128

	defm	""
	defb	13

	defm	""
	defb	216

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
	defb	13

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	187

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	128

	defm	""
	defb	190

	defm	""
	defb	238

	defm	"}"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	8

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	184

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
	defb	0

	defm	""
	defb	0

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
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	137

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
	defb	9

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

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	137

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
	defb	9

	defm	""
	defb	128

	defm	""
	defb	197

	defm	"L"
	defb	0

	defm	""
	defb	21

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	137

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
	defb	169

	defm	""
	defb	128

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	152

	defm	""
	defb	0

	defm	""
	defb	241

	defm	""
	defb	151

	defm	"`"
	defb	222

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	187

	defm	""
	defb	1

	defm	"("
	defb	0

	defm	""
	defb	13

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	139

	defm	""
	defb	34

	defm	""
	defb	137

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	187

	defm	")"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	139

	defm	""
	defb	176

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
	defb	208

	defm	""
	defb	187

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
	defb	189

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"c"
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	4

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"R#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	"["
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	155

	defm	"B#"
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	4

	defm	"TEDDDD"
	defb	224

	defm	"U"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	15

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
	defb	15

	defm	""
	defb	5

	defm	""
	defb	0

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

	defm	"P"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	5

	defm	"@"
	defb	0

	defm	""
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"U"
	defb	0

	defm	""
	defb	18

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	21

	defm	"TDDD"
	defb	179

	defm	""
	defb	0

	defm	""
	defb	18

	defm	""
	defb	139

	defm	""
	defb	185

	defm	""
	defb	155

	defm	""
	defb	153

	defm	""
	defb	184

	defm	"#"
	defb	18

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

	defm	"&b"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	145

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	153

	defm	""
	defb	2

	defm	""
	defb	34

	defm	"0"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	210

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"0"
	defb	0

	defm	""
	defb	155

	defm	"DD"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	155

	defm	""
	defb	13

	defm	""
	defb	144

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	128

	defm	""
	defb	15

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	219

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	144

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	219

	defm	""
	defb	237

	defm	""
	defb	144

	defm	""
	defb	222

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	144

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	233

	defm	""
	defb	13

	defm	""
	defb	190

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	189

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	176

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	180

	defm	"@"
	defb	221

	defm	""
	defb	180

	defm	"DDD"
	defb	8

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	152

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	141

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
	defb	141

	defm	""
	defb	222

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	137

	defm	""
	defb	221

	defm	""
	defb	15

	defm	""
	defb	221

	defm	""
	defb	223

	defm	""
	defb	221

	defm	""
	defb	253

	defm	""
	defb	11

	defm	""
	defb	141

	defm	""
	defb	208

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	157

	defm	""
	defb	217

	defm	""
	defb	208

	defm	""
	defb	137

	defm	"}"
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	9

	defm	""
	defb	137

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	208

	defm	""
	defb	185

	defm	""
	defb	137

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	157

	defm	""
	defb	232

	defm	""
	defb	176

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
	defb	0

	defm	""
	defb	128

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
	defb	153

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	189

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
	defb	11

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	233

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	216

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	216

	defm	"w"
	defb	157

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	155

	defm	""
	defb	0

	defm	""
	defb	221

	defm	"`"
	defb	11

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	235

	defm	""
	defb	144

	defm	""
	defb	6

	defm	""
	defb	215

	defm	""
	defb	0

	defm	""
	defb	189

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	174

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	11

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	144

	defm	""
	defb	1

	defm	"` `"
	defb	3

	defm	" "
	defb	137

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

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
	defb	0

	defm	""
	defb	9

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
	defb	0

	defm	""
	defb	16

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	8

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	160

	defm	""
	defb	234

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	171

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

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
	defb	15

	defm	""
	defb	4

	defm	""
	defb	0

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

	defm	"P"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	19

	defm	""
	defb	0

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	5

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	18

	defm	"#"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
	defb	0

	defm	""
	defb	18

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	240

	defm	""
	defb	21

	defm	"@"
	defb	18

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	0

	defm	""
	defb	18

	defm	"UD"
	defb	34

	defm	""
	defb	34

	defm	""
	defb	34

	defm	"#"
	defb	18

	defm	"%UTDDDDD"
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
	defb	184

	defm	""
	defb	187

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	15

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	144

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	248

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	177

	defm	"0"
	defb	9

	defm	""
	defb	176

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	34

	defm	"8"
	defb	176

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	146

	defm	""
	defb	34

	defm	"`"
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	34

	defm	"g"
	defb	13

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	215

	defm	""
	defb	4

	defm	"DDK"
	defb	235

	defm	"DDD"
	defb	137

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	176

	defm	""
	defb	184

	defm	""
	defb	14

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
	defb	8

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	8

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
	defb	157

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
	defb	139

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	217

	defm	""
	defb	142

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	219

	defm	""
	defb	150

	defm	""
	defb	221

	defm	""
	defb	128

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"V"
	defb	208

	defm	""
	defb	13

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	10

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	0

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	0

	defm	""
	defb	185

	defm	""
	defb	0

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
	defb	9

	defm	""
	defb	189

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
	defb	222

	defm	""
	defb	185

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
	defb	219

	defm	""
	defb	189

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
	defb	185

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
	defb	233

	defm	""
	defb	158

	defm	""
	defb	238

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	237

	defm	""
	defb	208

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	205

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	247

	defm	""
	defb	252

	defm	""
	defb	154

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
	defb	171

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	144

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
	defb	137

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
	defb	11

	defm	""
	defb	176

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
	defb	136

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
	defb	0

	defm	""
	defb	9

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
	defb	0

	defm	""
	defb	16

	defm	""
	defb	185

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
	defb	8

	defm	""
	defb	176

	defm	"T"
	defb	12

	defm	""
	defb	0

	defm	""
	defb	204

	defm	""
	defb	0

	defm	"P"
	defb	139

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
	defb	171

	defm	""
	defb	187

	defm	""
	defb	0

	defm	"yw"
	defb	155

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	14

	defm	""
	defb	231

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	28

	defm	""
	defb	136

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

	defm	"y"
	defb	150

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

	defm	"x"
	defb	155

	defm	""
	defb	238

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	14

	defm	""
	defb	238

	defm	""
	defb	232

	defm	""
	defb	128

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
	defb	136

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
	defb	1

	defm	""
	defb	11

	defm	""
	defb	181

	defm	"@"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	156

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	187

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
	defb	0

	defm	""
	defb	169

	defm	""
	defb	139

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	185

	defm	""
	defb	0

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
	defb	144

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"22"
	defb	0

	defm	"p"
	defb	9

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	2

	defm	"20"
	defb	6

	defm	""
	defb	9

	defm	""
	defb	176

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
	defb	137

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	233

	defm	""
	defb	176

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
	defb	0

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	0

	defm	"X"
	defb	128

	defm	""
	defb	0

	defm	""
	defb	224

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	251

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	128

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	134

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	233

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	"e"
	defb	12

	defm	""
	defb	0

	defm	""
	defb	193

	defm	""
	defb	9

	defm	"g"
	defb	0

	defm	""
	defb	27

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	144

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
	defb	27

	defm	""
	defb	0

	defm	""
	defb	7

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
	defb	144

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
	defb	16

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	180

	defm	"\"
	defb	11

	defm	""
	defb	6

	defm	""
	defb	0

	defm	""
	defb	12

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
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	186

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	8

	defm	""
	defb	145

	defm	""
	defb	11

	defm	""
	defb	183

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	11

	defm	""
	defb	183

	defm	""
	defb	235

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	"y"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	190

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	235

	defm	""
	defb	1

	defm	""
	defb	128

	defm	""
	defb	11

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
	defb	8

	defm	""
	defb	8

	defm	""
	defb	144

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
	defb	10

	defm	""
	defb	171

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	186

	defm	""
	defb	170

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	185

	defm	""
	defb	137

	defm	""
	defb	137

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"}"
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
	defb	219

	defm	""
	defb	230

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
	defb	144

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	222

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	"@"
	defb	221

	defm	""
	defb	221

	defm	"#"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	219

	defm	""
	defb	155

	defm	"]"
	defb	221

	defm	""
	defb	211

	defm	"-"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	137

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	155

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
	defb	0

	defm	""
	defb	10

	defm	""
	defb	190

	defm	""
	defb	235

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
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	137

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
	defb	208

	defm	""
	defb	141

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
	defb	219

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	237

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	139

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	216

	defm	""
	defb	155

	defm	""
	defb	157

	defm	""
	defb	221

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	224

	defm	""
	defb	24

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

	defm	"a"
	defb	11

	defm	""
	defb	153

	defm	""
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	176

	defm	""
	defb	11

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	1

	defm	""
	defb	192

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	3

	defm	""
	defb	14

	defm	""
	defb	235

	defm	""
	defb	12

	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	11

	defm	""
	defb	176

	defm	" "
	defb	1

	defm	""
	defb	190

	defm	""
	defb	238

	defm	""
	defb	224

	defm	"0"
	defb	187

	defm	""
	defb	3

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	2

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
	defb	224

	defm	""
	defb	16

	defm	""
	defb	136

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	7

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	12

	defm	"`"
	defb	0

	defm	"`E"
	defb	187

	defm	""
	defb	174

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
	defb	168

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	185

	defm	""
	defb	0

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
	defb	144

	defm	"22"
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	203

	defm	""
	defb	2

	defm	"20"
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
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	1

	defm	""
	defb	14

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	16

	defm	"{"
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
	defb	0

	defm	""
	defb	16

	defm	""
	defb	185

	defm	""
	defb	224

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
	defb	200

	defm	""
	defb	176

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
	defb	14

	defm	""
	defb	185

	defm	""
	defb	191

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	248

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	151

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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
	defb	16

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	16

	defm	""
	defb	9

	defm	"v"
	defb	170

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	11

	defm	"y"
	defb	187

	defm	""
	defb	144

	defm	""
	defb	7

	defm	""
	defb	185

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	139

	defm	""
	defb	0

	defm	""
	defb	6

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	24

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	7

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"y"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	12

	defm	""
	defb	12

	defm	""
	defb	183

	defm	""
	defb	4

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	14

	defm	""
	defb	186

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
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	176

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
	defb	8

	defm	""
	defb	0

	defm	"}"
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
	defb	135

	defm	""
	defb	230

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
	defb	216

	defm	""
	defb	157

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
	defb	238

	defm	"i"
	defb	221

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	238

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	"~"
	defb	237

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	221

	defm	""
	defb	0

	defm	""
	defb	221

	defm	""
	defb	208

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	220

	defm	""
	defb	13

	defm	""
	defb	221

	defm	"E"
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

	defm	"w"
	defb	0

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	185

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
	defb	148

	defm	"p"
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
	defb	9

	defm	"f`"
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
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	190

	defm	""
	defb	235

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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"P"
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
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	10

	defm	"o"
	defb	255

	defm	""
	defb	255

	defm	""
	defb	246

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

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

	defm	""
	defb	16

	defm	"`"
	defb	232

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
	defb	128

	defm	""
	defb	1

	defm	""
	defb	5

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	192

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	151

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	238

	defm	""
	defb	231

	defm	"`"
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
	defb	8

	defm	""
	defb	16

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
	defb	176

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
	defb	16

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

	defm	"p"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	186

	defm	""
	defb	127

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	248

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	238

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
	defb	11

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	144

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	232

	defm	""
	defb	224

	defm	""
	defb	0

	defm	""
	defb	232

	defm	""
	defb	128

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	144

	defm	"# "
	defb	187

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	12

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	34

	defm	""
	defb	8

	defm	""
	defb	128

	defm	""
	defb	5

	defm	""
	defb	0

	defm	"p"
	defb	192

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

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
	defb	232

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

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	184

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	"{"
	defb	187

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
	defb	8

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

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	139

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	240

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	11

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	14

	defm	""
	defb	150

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	"p"
	defb	15

	defm	""
	defb	0

	defm	""
	defb	11

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	"&"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	150

	defm	""
	defb	13

	defm	""
	defb	221

	defm	""
	defb	210

	defm	""
	defb	179

	defm	""
	defb	0

	defm	""
	defb	19

	defm	""
	defb	137

	defm	"p"
	defb	221

	defm	""
	defb	221

	defm	"'#"
	defb	18

	defm	"#"
	defb	9

	defm	""
	defb	184

	defm	""
	defb	187

	defm	""
	defb	148

	defm	"DDDD"
	defb	144

	defm	""
	defb	9

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	"y"
	defb	185

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
	defb	144

	defm	"p"
	defb	0

	defm	"#0"
	defb	4

	defm	""
	defb	0

	defm	""
	defb	11

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	2

	defm	"2"
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	"20"
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
	defb	16

	defm	""
	defb	16

	defm	""
	defb	144

	defm	""
	defb	193

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
	defb	11

	defm	""
	defb	6

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
	defb	16

	defm	"T"
	defb	199

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
	defb	10

	defm	""
	defb	170

	defm	""
	defb	166

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	247

	defm	""
	defb	170

	defm	""
	defb	170

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"p"
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
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	20

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	137

	defm	"x"
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	2

	defm	"###"
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	224

	defm	"3#3 "
	defb	224

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

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
	defb	10

	defm	""
	defb	167

	defm	""
	defb	127

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	255

	defm	"v"
	defb	170

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	183

	defm	""
	defb	155

	defm	""
	defb	176

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
	defb	16

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	4

	defm	""
	defb	0

	defm	""
	defb	1

	defm	""
	defb	8

	defm	""
	defb	155

	defm	""
	defb	127

	defm	""
	defb	255

	defm	""
	defb	255

	defm	""
	defb	181

	defm	""
	defb	16

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

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
	defb	16

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

	defm	"y"
	defb	187

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	137

	defm	""
	defb	187

	defm	""
	defb	183

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
	defb	1

	defm	""
	defb	9

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
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	1

	defm	"E"
	defb	0

	defm	""
	defb	0

	defm	""
	defb	9

	defm	""
	defb	0

	defm	""
	defb	136

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	155

	defm	"n"
	defb	231

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
	defb	16

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
	defb	11

	defm	"p"
	defb	0

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
	defb	170

	defm	""
	defb	170

	defm	""
	defb	152

	defm	""
	defb	155

	defm	""
	defb	187

	defm	"y"
	defb	187

	defm	"y"
	defb	187

	defm	"p"
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
	defb	8

	defm	""
	defb	0

	defm	""
	defb	179

	defm	"2#2"
	defb	0

	defm	""
	defb	11

	defm	""
	defb	144

	defm	""
	defb	9

	defm	""
	defb	34

	defm	"220"
	defb	8

	defm	""
	defb	152

	defm	""
	defb	0

	defm	""
	defb	176

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	25

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	197

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	0

	defm	"p"
	defb	0

	defm	""
	defb	16

	defm	""
	defb	8

	defm	""
	defb	152

	defm	""
	defb	152

	defm	""
	defb	144

	defm	""
	defb	0

	defm	""
	defb	16

	defm	""
	defb	0

	defm	"H"
	defb	152

	defm	""
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	153

	defm	""
	defb	196

	defm	"X"
	defb	155

	defm	""
	defb	184

	defm	""
	defb	152

	defm	""
	defb	154

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

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
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

	defm	""
	defb	0

	defm	""
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
	defw _sprites + 0x0400, _sprites + 0x0440, _sprites + 0x0480, _sprites + 0x04C0
	defw _sprites + 0x0500, _sprites + 0x0540, _sprites + 0x0580
	._sprite_18_a
	defs 96, 0
;	SECTION	text

._malotes
	defb	96
	defb	112
	defb	96
	defb	112
	defb	176
	defb	112
	defb	2
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	144
	defb	0
	defb	144
	defb	0
	defb	192
	defb	96
	defb	4
	defb	4
	defb	3
	defb	32
	defb	112
	defb	32
	defb	112
	defb	128
	defb	112
	defb	2
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
	defb	80
	defb	16
	defb	80
	defb	16
	defb	80
	defb	112
	defb	0
	defb	2
	defb	2
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	96
	defb	0
	defb	1
	defb	2
	defb	208
	defb	64
	defb	208
	defb	64
	defb	208
	defb	128
	defb	0
	defb	2
	defb	4
	defb	192
	defb	32
	defb	176
	defb	32
	defb	192
	defb	32
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
	defb	16
	defb	80
	defb	16
	defb	80
	defb	128
	defb	80
	defb	2
	defb	0
	defb	3
	defb	80
	defb	48
	defb	16
	defb	48
	defb	80
	defb	48
	defb	-1
	defb	0
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	144
	defb	128
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
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
	defb	176
	defb	96
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
	defb	96
	defb	112
	defb	96
	defb	112
	defb	208
	defb	112
	defb	2
	defb	0
	defb	4
	defb	160
	defb	128
	defb	160
	defb	32
	defb	160
	defb	128
	defb	0
	defb	-1
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
	defb	16
	defb	32
	defb	16
	defb	32
	defb	208
	defb	32
	defb	2
	defb	0
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	144
	defb	128
	defb	144
	defb	128
	defb	208
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
	defb	16
	defb	176
	defb	16
	defb	176
	defb	48
	defb	0
	defb	1
	defb	4
	defb	176
	defb	96
	defb	16
	defb	96
	defb	176
	defb	96
	defb	-2
	defb	0
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
	defb	192
	defb	128
	defb	144
	defb	128
	defb	192
	defb	128
	defb	-1
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
	defb	64
	defb	64
	defb	16
	defb	64
	defb	64
	defb	0
	defb	-1
	defb	2
	defb	192
	defb	80
	defb	96
	defb	80
	defb	192
	defb	128
	defb	-2
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
	defb	48
	defb	48
	defb	48
	defb	48
	defb	48
	defb	128
	defb	0
	defb	2
	defb	4
	defb	160
	defb	80
	defb	144
	defb	80
	defb	160
	defb	80
	defb	-1
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
	defb	144
	defb	128
	defb	32
	defb	128
	defb	144
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
	defb	32
	defb	32
	defb	32
	defb	16
	defb	32
	defb	32
	defb	0
	defb	0
	defb	6
	defb	96
	defb	16
	defb	96
	defb	16
	defb	96
	defb	32
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
	defb	112
	defb	128
	defb	16
	defb	128
	defb	112
	defb	128
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
	defb	32
	defb	32
	defb	32
	defb	32
	defb	48
	defb	0
	defb	0
	defb	6
	defb	144
	defb	32
	defb	144
	defb	32
	defb	144
	defb	48
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
	defb	64
	defb	16
	defb	64
	defb	16
	defb	80
	defb	64
	defb	1
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
	defb	32
	defb	112
	defb	32
	defb	176
	defb	32
	defb	1
	defb	0
	defb	2
	defb	48
	defb	128
	defb	48
	defb	128
	defb	160
	defb	128
	defb	1
	defb	0
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
	defb	208
	defb	96
	defb	32
	defb	96
	defb	208
	defb	96
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
	defb	176
	defb	96
	defb	112
	defb	96
	defb	176
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
	defb	48
	defb	112
	defb	0
	defb	2
	defb	4
	defb	176
	defb	16
	defb	176
	defb	16
	defb	176
	defb	64
	defb	0
	defb	2
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
	defb	32
	defb	32
	defb	32
	defb	32
	defb	48
	defb	32
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
	defb	128
	defb	128
	defb	128
	defb	128
	defb	192
	defb	128
	defb	1
	defb	0
	defb	2
	defb	176
	defb	64
	defb	112
	defb	64
	defb	176
	defb	64
	defb	-2
	defb	0
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
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
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
	defb	64
	defb	48
	defb	64
	defb	48
	defb	128
	defb	48
	defb	1
	defb	0
	defb	2
	defb	128
	defb	80
	defb	128
	defb	80
	defb	128
	defb	128
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
	defb	32
	defb	48
	defb	32
	defb	48
	defb	128
	defb	48
	defb	2
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	192
	defb	96
	defb	112
	defb	96
	defb	192
	defb	96
	defb	-1
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
	defb	64
	defb	96
	defb	64
	defb	96
	defb	128
	defb	0
	defb	2
	defb	4
	defb	128
	defb	80
	defb	128
	defb	80
	defb	192
	defb	112
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
	defb	80
	defb	48
	defb	80
	defb	48
	defb	144
	defb	64
	defb	2
	defb	2
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
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	192
	defb	64
	defb	192
	defb	64
	defb	192
	defb	128
	defb	0
	defb	1
	defb	3
	defb	32
	defb	128
	defb	32
	defb	64
	defb	32
	defb	128
	defb	0
	defb	-1
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
	defb	48
	defb	128
	defb	48
	defb	128
	defb	128
	defb	128
	defb	2
	defb	0
	defb	1
	defb	96
	defb	96
	defb	96
	defb	96
	defb	192
	defb	112
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
	defb	176
	defb	48
	defb	128
	defb	48
	defb	176
	defb	48
	defb	-1
	defb	0
	defb	2
	defb	128
	defb	128
	defb	32
	defb	128
	defb	128
	defb	128
	defb	-2
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
	defb	80
	defb	32
	defb	80
	defb	32
	defb	112
	defb	96
	defb	2
	defb	2
	defb	3
	defb	128
	defb	96
	defb	64
	defb	64
	defb	128
	defb	96
	defb	-2
	defb	-2
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
	defb	200
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
	defb	55
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
	defb	200
	defb	1
	defb	0
	defb	0
	defb	0
	defb	0
	defb	212
	defb	1
	defb	0
	defb	102
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
	defb	212
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
	defb	101
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
	defb	179
	defb	2
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
.i_16
	call	cpc_AnyKeyPressed
	ld	a,h
	or	l
	jp	nz,i_16
.i_17
.i_20
	halt
	halt
	halt
	halt
	halt
	halt
	call	cpc_AnyKeyPressed
	ld	a,h
	or	l
	jp	nz,i_19
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



._cpc_UpdateNow
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_22
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
	cp 1 + 3 + 0 + 0 + 1
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
	ld b, 1 + 3 + 0 + 0 + 1
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
.i_23
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
.i_24
	ld	hl,_gpit
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_25
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
	jp	i_24
.i_25
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
	defb	3

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	0

	defm	""
	defb	0

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	5

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	1

	defm	""
	defb	1

	defm	""
	defb	3

	defm	""
	defb	3

	defm	""
	defb	1

	defm	""
	defb	13

	defm	""
	defb	1

	defm	""
	defb	3

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

;	SECTION	code


;	SECTION	text

._evil_eye_state_cts
	defm	""
	defb	30

	defm	""
	defb	30

	defm	"<"
	defb	5

	defm	""
	defb	5

;	SECTION	code


;	SECTION	text

._evil_eye_state_tiles
	defm	""
	defb	29

	defm	""
	defb	30

	defm	""
	defb	31

	defm	""
	defb	30

	defm	""
	defb	29

;	SECTION	code


	._object_cells
	defw (_sprites + 0x0400), (_sprites + 0x0440), (_sprites + 0x0480), (_sprites + 0x04C0)
	defw (_sprites + 0x0500)
;	SECTION	text

._ofrendas_order
	defm	""
	defb	1

	defm	""
	defb	2

	defm	""
	defb	3

	defm	""
	defb	4

;	SECTION	code


;	SECTION	text

._water_pushplates
	defm	""
	defb	0

	defm	"&MWy"
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
	defm	"POR OSIRIS Y POR APIS%MIRADME "
	defm	"BIEN: SOY EL%ALTAR DE LAS OFRE"
	defm	"NDAS.%TE DARE COSAS SI TRAES%M"
	defm	"ONEDAS AL MENDA."
	defb	0

;	SECTION	code



;	SECTION	text

._text1
	defm	"UN ROLLO DE PAPEL DEL%CULO DOB"
	defm	"LE CAPA, QUE%TE DEJA SUAVITO Y"
	defm	" TE%QUITA LA ZURRAPA."
	defb	0

;	SECTION	code



;	SECTION	text

._text2
	defm	"UNA FLAUTA DE FAKIR%IMPORTADA "
	defm	"DE ORIENTE%QUE TE DUERME CON S"
	defm	"U%MUSICA O SI TE DA EN%LOS DIE"
	defm	"NTES."
	defb	0

;	SECTION	code



;	SECTION	text

._text3
	defm	"TE SACO DEL TIRON%UNAS BRAGAS "
	defm	"PRINCESA%ROBADAS DE UN CAJON%D"
	defm	"E LA LETIZIA ESA."
	defb	0

;	SECTION	code



;	SECTION	text

._text4
	defm	"UN TARRO DE GRASA DE%CABALLO. "
	defm	"PARA QUE%QUERRIAS ESTO? LOCO%M"
	defm	"E HALLO."
	defb	0

;	SECTION	code



;	SECTION	text

._text5
	defm	"TES KI YA CARAJAULA,%LLEVATE E"
	defm	"SO!"
	defb	0

;	SECTION	code



;	SECTION	text

._text6
	defm	"Y ESTO QUE ES? BEBE-%CHARCOS, "
	defm	"ESCUCHAPEOS"
	defb	0

;	SECTION	code



;	SECTION	text

._text7
	defm	"PARA QUE QUIERO ESTO,%BOQUIMUE"
	defm	"LLE?"
	defb	0

;	SECTION	code



;	SECTION	text

._text8
	defm	"PERO QUE ME TRAES?%BOTARATE TA"
	defm	"LLOCEBOLLA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text9
	defm	"Y AY, QUE POCAS LUCES%ME DUELE"
	defm	" LA PETACA.%COMI MUCHAS CHUCHE"
	defm	"S%Y ME HAGO MUCHA CACA."
	defb	0

;	SECTION	code



;	SECTION	text

._text10
	defm	"AUNQUE SEA DENOCHES%NO CONSIGO"
	defm	" DORMIR.%TENGO MUCHO INSOMNIO%"
	defm	"ESTO ES UN SINVIVIR"
	defb	0

;	SECTION	code



;	SECTION	text

._text11
	defm	"QUE DESPISTE TENGO%AYER FUI LO"
	defm	" PEOR. ME%DESMADRE EN UN CUMPL"
	defm	"E%Y PERDI LA ROPA%INTERIOR."
	defb	0

;	SECTION	code



;	SECTION	text

._text12
	defm	"ESTOY SIN RECATO%A SU SERVICIO"
	defm	".%TRABAJO MUY BARATO%PERO EL C"
	defm	"UERO ES MI%VICIO..."
	defb	0

;	SECTION	code



;	SECTION	text

._text13
	defm	"RECUPERA LOS CUATRO%TROZOS DEL"
	defm	" PAPIRO%Y VUELVE AQUI PARA%HAC"
	defm	"ER EL HECHIZO"
	defb	0

;	SECTION	code



;	SECTION	text

._text14
	defm	"VAYA INSISTENCIA, TE%ABRO MI P"
	defm	"IRAMIDE,%MONTUNO! QUE CASI PA-"
	defm	"%RECES EL REY DE LOS%HUNOS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text15
	defm	"LO CONSIGUIO AL FIN!%ENSAMBLAD"
	defm	"O EL PAPIRO%SE DISPONE A LEER "
	defm	"EL%CONJURO NUESTRO BUEN%RAMIRO"
	defm	"."
	defb	0

;	SECTION	code



;	SECTION	text

._text16
	defm	"DICE ASI:%- 2 CEBOLLAS%- PAPEL"
	defm	" DEL CULO%- PAN%- FAIRY"
	defb	0

;	SECTION	code



;	SECTION	text

._text17
	defm	"EL POBRE VAMPIRO SE%QUEDA CON "
	defm	"CARA MONA:%NO ES UN CONJURO,%E"
	defm	"S LA LISTA DEL%MERCADONA."
	defb	0

;	SECTION	code



;	SECTION	text

._text18
	defm	"YA QUE ME TRAES UNA%OFRENDA, Y"
	defm	"O SOLTARE%PRENDA..."
	defb	0

;	SECTION	code



;	SECTION	text

._text19
	defm	"YA TIENES UN OBJETO!%USALO ANT"
	defm	"ES, CATETO."
	defb	0

;	SECTION	code



;	SECTION	text

._text20
	defm	"Y YA TE ABRI. AHORA%JUYE... JU"
	defm	"YE!!"
	defb	0

;	SECTION	code



;	SECTION	text

._text21
	defm	"OH, QUE SUAVE ES!%Y AHORA, POR"
	defm	"FA, VETE%QUE HARE CACA Y ME%LI"
	defm	"MPIARE EL OJETE"
	defb	0

;	SECTION	code



;	SECTION	text

._text22
	defm	"UNA FLAUTA DE FAKIR!%CON FEO S"
	defm	"U SONIDO%EN SOLO UNOS MITUTOS%"
	defm	"YA ESTARE DORMIDO"
	defb	0

;	SECTION	code



;	SECTION	text

._text23
	defm	"OH, GUAPO VAMPIRILLO,%RECIBO C"
	defm	"ON ALBOROTO%TU BELLO REGALO: U"
	defm	"NAS%BRAGAS PA MI TOTO"
	defb	0

;	SECTION	code



;	SECTION	text

._text24
	defm	"QUE LUSTROSO QUEDARA%EL CUERO "
	defm	"DE MI ARNES%IRE VISITAR A MARI"
	defm	"SA%A CHUPARLE LOS PIES"
	defb	0

;	SECTION	code



;	SECTION	text

._text25
	defm	"SI SACAS LA MONEDA%ENFADARAS A"
	defm	" HORUS!%YA SOLO TE QUEDA%RASCA"
	defm	"RLE LOS OJUS!"
	defb	0

;	SECTION	code



;	SECTION	text

._text26
	defm	"SOY SONIA LA MOMIA%GUARDIANA D"
	defm	"E LA%TERCERA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text27
	defm	"SOY CLEMENTE LA%SERPIENTE,%GUA"
	defm	"RDIAN DE LA%CUARTA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text28
	defm	"SOY MARISA LA%SACERDOTISA,%GUA"
	defm	"RDIANA DE LA%SEGUNDA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text29
	defm	"SOY GUSTAVO EL%ESCLAVO,%GUARDI"
	defm	"AN DE LA%PRIMERA CRIPTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text30
	defm	"LOS TROZOS ESTAN%EN CRIPTAS CE"
	defm	"RRADAS,%TENDRAS QUE COMPLACER%"
	defm	"A SUS GUARDIANES"
	defb	0

;	SECTION	code



;	SECTION	text

._text31
	defm	""
	defb	34

	defm	"TE PILLE, LORITO!"
	defb	34

	defm	",%OYES A ALGUIEN GRITAR%"
	defb	34

	defm	"NO PIERDAS TU PORTE%Y VUELVE A"
	defm	" EMPEZAR!"
	defb	34

	defm	""
	defb	0

;	SECTION	code



;	SECTION	text

._text32
	defm	"CUIDADO CON EL OJO!%SE HACE LA"
	defm	" DORMIDA%PERO SI TE VE%TE CHUP"
	defm	"A LA VIDA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text33
	defm	"RAMON EL FARAON,%TE INVITO A S"
	defm	"U KELI%Y ENTRE VINOS Y HUMO%TE"
	defm	" CONTO SU PELI..."
	defb	0

;	SECTION	code



;	SECTION	text

._text34
	defm	"SI JUNTAS 4 PARTES%EL PODEWR D"
	defm	"EL PAPIRO%OCULTO EN ESTE SITIO"
	defm	"%SERA TUYO, RAMIRO"
	defb	0

;	SECTION	code



;	SECTION	text

._text35
	defm	"BUSCA A RAMON Y QUE%CON SU ABR"
	defm	"ACADABRA%NO SE HAGA EL REMOLON"
	defm	"%Y LA PIRAMIDE TE ABRA"
	defb	0

;	SECTION	code



;	SECTION	text

._text36
	defm	"ESTE ES EL ALTAR ROTO%QUE NO T"
	defm	"E DISCRIMINA%Y SI LE TOCAS EL "
	defm	"TOTO%TE DA PAPEL DE COCINA"
	defb	0

;	SECTION	code



;	SECTION	text

._text37
	defm	"QUE HACES, ALOCADO?%ESE PAPEL "
	defm	"DE COCINA%A MI CULO DELICADO%L"
	defm	"O HARIA FOSFATINA!"
	defb	0

;	SECTION	code



;	SECTION	text

._text38
	defm	"EL ALTAR NO CONTESTA"
	defb	0

;	SECTION	code



;	SECTION	text

._text39
	defm	"NO HE VISTO NI POR%DONDE VENIA"
	defm	"N,%JA JA JA JA JA%... CABRONI!"
	defm	""
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
	defw	_text32
	defw	_text33
	defw	_text34
	defw	_text35
	defw	_text36
	defw	_text37
	defw	_text38
	defw	_text39

;	SECTION	code

;	SECTION	text

._adm_s_n_pant
	defm	""
	defb	0

	defm	""
	defb	2

	defm	""
	defb	5

	defm	""
	defb	6

	defm	""
	defb	10

	defm	""
	defb	13

	defm	""
	defb	14

	defm	""
	defb	19

	defm	""
	defb	25

;	SECTION	code


;	SECTION	text

._adm_s_x
	defm	""
	defb	6

	defm	""
	defb	20

	defm	""
	defb	22

	defm	""
	defb	8

	defm	""
	defb	16

	defm	""
	defb	20

	defm	""
	defb	6

	defm	""
	defb	6

	defm	""
	defb	6

;	SECTION	code


;	SECTION	text

._adm_s_y
	defm	""
	defb	12

	defm	""
	defb	14

	defm	""
	defb	16

	defm	""
	defb	12

	defm	""
	defb	10

	defm	""
	defb	16

	defm	""
	defb	16

	defm	""
	defb	4

	defm	""
	defb	4

;	SECTION	code



._clear_gamearea
	ret



._paint_water_strip
	ld a, (_rdy)
	cp 2+20
	ret nc
	ld (__y), a
	ld a, 1+2
	ld (__x), a
	call __tile_address ; DE = buffer address
	ld b, 26
	ld a, (_rdi)
	.paint_water_strip_loop
	ld (de), a
	inc de
	djnz paint_water_strip_loop
	ld a, (__rdy)
	ld b, a ; x1
	ld d, a ; x2
	ld c, 1+2 ; y1
	ld e, 1+27 ; y2
	call cpc_InvalidateRect
	ret



._draw_falling_block
	ld a, (__trap_bx)
	sla a
	add 1
	ld (__x), a
	ld a, (__trap_by)
	sla a
	add 2
	ld (__y), a
	ld a, (__trap_bt)
	ld (__t), a
	jp _draw_coloured_tile_do
	ret



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



._decorate_screen
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_81
.i_79
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_81
	ld	a,(_rdi)
	cp	#(9 % 256)
	jp	z,i_80
	jp	nc,i_80
	ld	de,_adm_s_n_pant
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	a,(_n_pant)
	cp	(hl)
	jp	nz,i_82
	ld	de,_adm_s_x
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	de,_adm_s_y
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,49	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	jp	i_80
.i_82
	jp	i_79
.i_80
	ld	a,(_evil_eye_screen)
	and	a
	jp	z,i_83
	ld	hl,13	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,28	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
	ld	hl,15	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,29	;const
	push	hl
	call	_draw_coloured_tile
	pop	bc
	pop	bc
	pop	bc
.i_83
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
.i_84
	call	_clear_temp_string
	ld	a,(_rdy)
	cp	#(7 % 256)
	jp	z,i_86
	jp	c,i_86
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
.i_86
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
	jp	z,i_85
.i_87
	ld	hl,(_gp_gen)
	inc	hl
	ld	(_gp_gen),hl
	dec	hl
	jp	i_84
.i_85
.i_88
	call	_any_key
	ld	a,h
	or	l
	jp	nz,i_88
.i_89
.i_90
	call	_any_key
	call	l_lneg
	jp	c,i_90
.i_91
	ld	hl,(_redraw_after_text)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_92
	call	_redraw_from_buffer
	call	_hotspot_paint
	call	_render_all_sprites
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
.i_92
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_redraw_after_text),a
	ret



._recuadrius
	call	_sprite_remove_aid
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_rdi),a
	jp	i_95
.i_93
	ld	hl,_rdi
	ld	a,(hl)
	inc	(hl)
.i_95
	ld	a,(_rdi)
	cp	#(10 % 256)
	jp	z,i_94
	jp	nc,i_94
	ld	hl,(_rdi)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_98
.i_96
	ld	hl,_rdx
	ld	a,(hl)
	inc	(hl)
.i_98
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
	jp	nc,i_97
	ld a, (_rdi)
	add 2
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), 0
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdi)
	ld c, a
	ld a, #(2+19)
	sub c
	ld (__y), a
	ld a, (_rdx)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), 0
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
	jp	nc,i_99
	ld a, (_rdx)
	add 2
	ld (__y), a
	ld a, (_rdi)
	add 1
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), 0
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
	ld a, (_rdx)
	add 2
	ld (__y), a
	ld a, (_rdi)
	ld c, a
	ld a, #(1+29)
	sub c
	ld (__x), a
	call __tile_address ; DE = buffer address
	xor a
	ld (de), 0
	ld a, (__x)
	ld e, a
	ld a, (__y)
	ld d, a
	call cpc_UpdTileTable
.i_99
	jp	i_96
.i_97
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jp	i_93
.i_94
	ret



._trap_kill
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,10	;const
	call	_wyz_play_sound
	ld b, 300
	.trap_kill_delay
	halt
	djnz trap_kill_delay
	ld	hl,31	;const
	push	hl
	call	_show_text_box
	pop	bc
	ld	hl,0	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	ld	hl,_player+23
	ld	(hl),#(2 % 256 % 256)
	ld	hl,_player+24
	ld	(hl),#(50 % 256 % 256)
	ld	hl,0	;const
	ld	(_player+8),hl
	call	_recuadrius
	ret



._water_trap_setup
	ld	a,(_n_pant)
	ld	e,a
	ld	d,0
	ld	hl,6	;const
	call	l_div_u
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	and	a
	jp	z,i_100
	ld	hl,_rdi
	ld	a,(hl)
	rrca
	jp	nc,i_101
	ld	hl,11	;const
	jp	i_102
.i_101
	ld	hl,2	;const
.i_102
	ld	h,0
	ld	a,l
	ld	(_water_top_door_x),a
	ld	hl,(_water_top_door_x)
	ld	h,0
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,6	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_water_top_door_x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,7	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,_water_pushplates
	ld	hl,(_rdi)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asr_u
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,19	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	a,(_rdx)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,19	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_100
	ld	a,(_rdi)
	cp	#(4 % 256)
	jp	z,i_103
	jp	nc,i_103
	ld	hl,_rdi
	ld	a,(hl)
	rrca
	jp	nc,i_104
	ld	hl,2	;const
	jp	i_105
.i_104
	ld	hl,11	;const
.i_105
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,9	;const
	push	hl
	ld	hl,46	;const
	push	hl
	ld	hl,4	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_rdx)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,9	;const
	push	hl
	ld	hl,46	;const
	push	hl
	ld	hl,4	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_103
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_water_locks),a
	ret



._win_crypt
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(5 % 256)
	ld	(hl),a
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,10
	add	hl,bc
	pop	de
	call	l_pint
	ret



._hook_system_inits
	ld ix, #(0xE000 + 0x600+((((1 + 3) + 0) + 0)*16))
	ld hl, _sm_sprptr
	ld (ix + 1), h
	ld (ix + 0), l
	ld (ix + 3), h
	ld (ix + 2), l
	xor a
	ld (ix + 6), a
	ld (ix + 7), a
	ld (ix + 8), a
	ld (ix + 9), a
	ld (ix + 10), a
	ld (ix + 11), a
	ld hl, cpc_PutSpTileMap8x16Px
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, cpc_PutTrSp8x16TileMap2bPx
	ld (ix + 15), h
	ld (ix + 14), l
	ret



._hook_init_game
	xor a
	ld (_water_level), a
	ld (_pinv), a
	ld (_ofrendas_idx), a
	ld (_pofrendas), a
	ld (_cabroni), a
	dec a
	ld (_pofrendas_old), a
	ld (_opscore), a
	ld	hl,_flags+16
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ld b, 8
	ld a, r
	ld (_seed), a
	.shuffle_loop
	push bc
	call _rand
	pop bc
	ld a, l
	and 3
	ld c, a
	push bc
	call _rand
	pop bc
	ld a, l
	and 3
	ld d, 0
	ld e, a
	ld hl, _ofrendas_order
	add hl, de
	ld a, (hl)
	ld (_rdi), a
	ld e, c
	push hl
	ld hl, _ofrendas_order
	add hl, de
	ld a, (hl)
	pop hl
	ld (hl), a
	ld a, (_rdi)
	ld hl, _ofrendas_order
	add hl, de
	ld (hl), a
	djnz shuffle_loop
	ret



._hook_init_mainloop
	ret



._hook_mainloop
	ld	hl,(_player+29)
	ld	de,99	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_106
	ld	hl,99	;const
	ld	(_player+29),hl
.i_106
	ld a, (_evil_eye_screen)
	or a
	jr z, eoh_done
	ld a, (_evil_eye_counter)
	or a
	jr z, eoh_counter_done
	dec a
	ld (_evil_eye_counter), a
	jr eoh_done
	.eoh_counter_done
	ld a, (_evil_eye_state)
	inc a
	cp 5
	jr nz, eoh_reset_state_done
	xor a
	.eoh_reset_state_done
	ld (_evil_eye_state), a
	ld c, a
	ld b, 0
	ld hl, _evil_eye_state_cts
	add hl, bc
	ld a, (hl)
	ld (_evil_eye_counter), a
	ld a, 1+7*2
	ld (__x), a
	ld a, 2+2*2
	ld (__y), a
	ld bc, (_evil_eye_state)
	ld b, 0
	ld hl, _evil_eye_state_tiles
	add hl, bc
	ld a, (hl)
	ld (__t), a
	call _draw_coloured_tile_do
	ld a, (_evil_eye_state)
	cp 2
	jr z, eoh_ez_set1
	xor a
	jr eoh_ez_set
	.eoh_ez_set1
	ld a, 1
	.eoh_ez_set
	ld (_scenery_info+2), a
	.eoh_done
	ld	hl,(_scenery_info+1+1)
	ld	h,0
	ex	de,hl
	ld	hl,(_half_life)
	ld	h,0
	call	l_and
	ld	a,h
	or	l
	jp	z,i_107
	ld	hl,76	;const
	jp	i_108
.i_107
	ld	hl,84	;const
.i_108
	call	_cpc_Border
	ld	a,(_trap_screen)
	and	a
	jp	z,i_110
	ld	hl,_player+27
	call	l_gchar
	ex	de,hl
	ld	hl,(_objs_old)
	ld	h,0
	call	l_ne
	jr	c,i_111_i_110
.i_110
	jp	i_109
.i_111_i_110
	ld	hl,_flags
	push	hl
	ld	bc,15
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	ld	de,10
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	a,#(1 % 256 % 256)
	ld	(_trap_active),a
	ld	hl,(_n_pant)
	ld	h,0
	inc	hl
	ld	(_seed),hl
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_flags+10
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	ld hl, _trap_by
	ld de, _trap_by + 1
	ld bc, 3 - 1
	ld a, 0xff
	ld (hl), a
	ldir
	ld	a,(_trap_coins)
	and	a
	jp	z,i_112
	ld	hl,13	;const
	push	hl
	ld	hl,5	;const
	push	hl
	ld	hl,0	;const
	push	hl
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10	;const
	call	_wyz_play_sound
.i_112
.i_109
	ld	hl,(_trap_active)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_113
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	dec	hl
	ld	a,h
	or	l
	jp	nz,i_114
	ld bc, 3
	.trap_block_find_loop
	dec c
	ld hl, _trap_by
	add hl, bc
	ld a, (hl)
	cp 0xff
	jr z, trap_block_create_new
	xor a
	or c
	jr z, trap_block_find_done
	jr trap_block_find_loop
	.trap_block_create_new
	xor a
	ld (hl), a
	push bc
	.trap_block_select_x
	call _rand
	ld a, l
	and 0xf
	jr z, trap_block_select_x
	cp 14
	jr nc, trap_block_select_x
	pop bc
	ld hl, _trap_bx
	add hl, bc
	ld (hl), a
	ld a, (_trap_coins)
	or a
	jr nz, trap_block_set_coins
	push bc
	call _rand
	pop bc
	ld a, l
	and 1
	add 6
	jr trap_block_write
	.trap_block_set_coins
	ld a, 50
	.trap_block_write
	ld hl, _trap_bt
	add hl, bc
	ld (hl), a
	.trap_block_find_done
.i_114
	ld	a,(_half_life)
	and	a
	jp	z,i_115
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
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_117
	ld bc, (_gpit)
	ld b, 0
	ld hl, _trap_by
	add hl, bc
	ld a, (hl)
	ld (__trap_by), a
	ld hl, _trap_bx
	add hl, bc
	ld a, (hl)
	ld (__trap_bx), a
	ld hl, _trap_bt
	add hl, bc
	ld a, (hl)
	ld (__trap_bt), a
	ld	a,(__trap_by)
	cp	#(255 % 256)
	jp	z,i_119
	ld	hl,(__trap_bx)
	ld	h,0
	push	hl
	ld	a,(__trap_by)
	ld	e,a
	ld	d,0
	ld	l,#(4 % 256)
	call	l_asl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	ex	de,hl
	and	a
	sbc	hl,de
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	a,(__trap_by)
	and	a
	jp	z,i_120
	ld	hl,(__trap_bx)
	ld	h,0
	push	hl
	ld	hl,(__trap_by)
	ld	h,0
	push	hl
	ld	de,_map_buff
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	push	hl
	ld	hl,0	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_120
	ld	hl,__trap_by
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_rda)
	ld	h,0
	ld	bc,15
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rda),a
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
	ex	de,hl
	ld	hl,(__trap_bx)
	ld	h,0
	call	l_eq
	jp	nc,i_122
	ld	hl,(_rdy)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	call	l_eq
	jp	nc,i_122
	ld	a,(_trap_coins)
	and	a
	jr	nz,i_123_i_122
.i_122
	jp	i_121
.i_123_i_122
	ld	hl,_flags+10
	inc	(hl)
	ld	hl,5	;const
	call	_wyz_play_sound
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
	jp	i_124
.i_121
	ld	de,_map_attr
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	cp	#(1 % 256)
	jp	nz,i_125
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
	jp	i_126
.i_125
	call	_draw_falling_block
	ld	hl,_map_attr
	push	hl
	ld	hl,(_rda)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	add	hl,de
	ld	a,(hl)
	and	#(12 % 256)
	jp	z,i_127
	ld	hl,(_rdx)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_bx)
	ld	h,0
	call	l_eq
	jp	nc,i_129
	ld	hl,(_rdy)
	ld	h,0
	ex	de,hl
	ld	hl,(__trap_by)
	ld	h,0
	call	l_eq
	jr	c,i_130_i_129
.i_129
	jp	i_128
.i_130_i_129
	call	_trap_kill
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
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+27
	push	hl
	call	l_gchar
	dec	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	a,#(255 % 256 % 256)
	ld	(_on_pant),a
	ld	hl,_flags
	push	hl
	ld	bc,15
	add	hl,bc
	ld	l,(hl)
	ld	h,0
	ld	de,10
	add	hl,de
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_trap_active),a
	jp	i_117
.i_128
	ld	de,_map_attr
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	push	hl
	ld	de,_comportamiento_tiles
	ld	hl,(__trap_bt)
	ld	h,0
	add	hl,de
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	de,_map_buff
	ld	hl,(_rda)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,__trap_bt
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	hl,255 % 256	;const
	ld	a,l
	ld	(__trap_by),a
.i_127
.i_126
.i_124
	ld	de,_trap_by
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	push	hl
	ld	hl,__trap_by
	ld	a,(hl)
	pop	de
	ld	(de),a
	ld	a,(_flags+10)
	cp	#(30 % 256)
	jp	nz,i_131
	ld	hl,_scenery_info+1+1+1
	ld	(hl),#(0 % 256 % 256)
	ld	hl,8	;const
	call	_wyz_play_sound
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_trap_active),a
	call	_draw_scr_background
	call	_win_crypt
	ld	a,(_n_pant)
	cp	#(18 % 256)
	jp	nz,i_132
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_cabroni),a
.i_132
.i_131
.i_119
	jp	i_116
.i_117
.i_115
.i_113
	ld	hl,(_gpy)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_pinv)
	and	a
	jp	z,i_133
	ld	a,(_player+22)
	and	a
	jp	z,i_134
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,-4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_135
.i_134
	ld	hl,(_gpx)
	ld	h,0
	ld	bc,4
	add	hl,bc
	ld	h,0
	ld	a,l
	ld	(_rdx),a
.i_135
	jp	i_136
.i_133
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_136
	.render_inventory
	ld ix, #(0xE000 + 0x600 + ((((1 + 3) + 0) + 0)*16))
	ld a, (_rdx)
	add #(1*8)
	srl a
	ld (ix + 8), a
	ld a, (_rdy)
	add #(2*8)
	ld (ix + 9), a
	ld hl, _pinv_next_frame
	ld (ix + 0), l
	ld (ix + 0), h
	ld	hl,(_pinv_next_frame)
	ld	(_pinv_current_frame),hl
	ld	a,(_latest_hotspot)
	cp	#(2 % 256)
	jp	nz,i_137
	ld	hl,_pofrendas
	ld	a,(hl)
	inc	(hl)
	ld	hl,5	;const
	call	_wyz_play_sound
	ld	a,(_n_pant)
	cp	#(29 % 256)
	jp	nz,i_138
	ld	hl,25 % 256	;const
	ld	a,l
	ld	(_water_level),a
	call	_water_trap_setup
.i_138
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(5 % 256)
	ld	(hl),a
.i_137
	ld	hl,(_pofrendas)
	ld	h,0
	ex	de,hl
	ld	hl,(_pofrendas_old)
	ld	h,0
	call	l_ne
	jp	nc,i_139
	ld	hl,15	;const
	push	hl
	ld	hl,23	;const
	push	hl
	ld	hl,(_pofrendas)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_pofrendas)
	ld	h,0
	ld	a,l
	ld	(_pofrendas_old),a
.i_139
	ld	hl,(_flags+10)
	ld	h,0
	ex	de,hl
	ld	hl,(_coins_old)
	ld	h,0
	call	l_ne
	jp	nc,i_141
	ld	a,(_trap_coins)
	and	a
	jr	nz,i_142_i_141
.i_141
	jp	i_140
.i_142_i_141
	ld	hl,9	;const
	push	hl
	ld	hl,23	;const
	push	hl
	ld	hl,(_flags+10)
	ld	h,0
	ld	de,30
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags+10)
	ld	h,0
	ld	a,l
	ld	(_coins_old),a
.i_140
	ld	hl,(_flags+16)
	ld	h,0
	ex	de,hl
	ld	hl,(_opscore)
	ld	h,0
	call	l_ne
	jp	nc,i_143
	ld	hl,28	;const
	push	hl
	ld	hl,23	;const
	push	hl
	ld	hl,(_flags+16)
	ld	h,0
	push	hl
	call	_draw_2_digits
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_flags+16)
	ld	h,0
	ld	a,l
	ld	(_opscore),a
.i_143
	ld	a,(_water_level)
	and	a
	jp	z,i_144
	ld	a,(_water_ct)
	and	a
	jp	z,i_145
	ld	hl,_water_ct
	ld	a,(hl)
	dec	(hl)
	ld	l,a
	ld	h,0
	jp	i_146
.i_145
	ld	hl,_water_level
	ld	a,(hl)
	dec	(hl)
	ld	hl,(_water_level)
	ld	h,0
	inc	hl
	inc	hl
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	hl,62 % 256	;const
	ld	a,l
	ld	(_rdi),a
	call	_paint_water_strip
	ld	hl,_rdy
	ld	a,(hl)
	inc	(hl)
	ld	hl,63 % 256	;const
	ld	a,l
	ld	(_rdi),a
	call	_paint_water_strip
	ld	hl,22 % 256	;const
	ld	a,l
	ld	(_water_ct),a
.i_146
	ld	a,(_gpy)
	cp	#(144 % 256)
	jr	z,i_148_ule
	jp	nc,i_148
.i_148_ule
	ld	a,(_water_level)
	ld	e,a
	ld	d,0
	ld	l,#(3 % 256)
	call	l_asl
	ex	de,hl
	ld	hl,(_gpy)
	ld	h,0
	call	l_ule
	jr	c,i_149_i_148
.i_148
	jp	i_147
.i_149_i_148
	call	_trap_kill
	ld	a,#(0 % 256 % 256)
	ld	(_water_level),a
	ld	hl,_hotspots+87+1+1
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_pofrendas
	ld	a,(hl)
	dec	(hl)
	ld	hl,_flags+16
	ld	a,(hl)
	add	a,#(-5 % 256)
	ld	(hl),a
	ld	a,#(5 % 256 % 256)
	ld	(_n_pant),a
	ld	hl,0	;const
	ld	(_player+1+1),hl
	ld	h,0
	ld	a,l
	ld	(_gpy),a
	ld	a,#(120 % 256 % 256)
	ld	(_gpx),a
	ld	hl,7680	;const
	ld	(_player),hl
.i_147
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
	ld	hl,(_gpy)
	ld	h,0
	dec	hl
	dec	hl
	ex	de,hl
	ld	l,#(4 % 256)
	call	l_asr_u
	ld	h,0
	ld	a,l
	ld	(_rdy),a
	ld	a,(_player+37)
	and	a
	jp	z,i_151
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	call	_qtile
	pop	bc
	pop	bc
	ld	de,19	;const
	ex	de,hl
	call	l_eq
	jr	c,i_152_i_151
.i_151
	jp	i_150
.i_152_i_151
	ld	hl,_water_locks
	ld	a,(hl)
	inc	(hl)
	ld	hl,(_rdx)
	ld	h,0
	push	hl
	ld	hl,(_rdy)
	ld	h,0
	push	hl
	ld	hl,11	;const
	push	hl
	ld	hl,8	;const
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,5	;const
	call	_wyz_play_sound
	ld	a,(_water_locks)
	cp	#(2 % 256)
	jp	nz,i_153
	ld	hl,(_water_top_door_x)
	ld	h,0
	push	hl
	ld	hl,0	;const
	push	hl
	ld	de,0	;const
	push	de
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_water_top_door_x)
	ld	h,0
	inc	hl
	push	hl
	ld	hl,0	;const
	push	hl
	ld	de,0	;const
	push	de
	push	hl
	call	_set_map_tile
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	call	_wyz_play_sound
.i_153
.i_150
.i_144
	ld	a,(_n_pant)
	cp	#(12 % 256)
	jp	nz,i_155
	ld	a,(_flags+5)
	cp	#(0 % 256)
	jp	nz,i_155
	ld	a,(_player+26)
	and	a
	jr	nz,i_156_i_155
.i_155
	jp	i_154
.i_156_i_155
	ld	hl,_flags+5
	ld	(hl),#(1 % 256 % 256)
	ld	hl,2	;const
	push	hl
	call	_do_extern_action
	pop	bc
.i_154
	ld	a,(_cabroni)
	and	a
	jp	z,i_158
	ld	a,(_n_pant)
	cp	#(19 % 256)
	jr	z,i_159_i_158
.i_158
	jp	i_157
.i_159_i_158
	ld	hl,1	;const
	push	hl
	call	_sp_UpdateNow
	pop	bc
	ld	a,#(0 % 256 % 256)
	ld	(_cabroni),a
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,39	;const
	push	hl
	call	_show_text_box
	pop	bc
.i_157
	ret



._hook_entering
	ld bc, (_n_pant)
	ld b, 0
	ld hl, _map_behaviours
	add hl, bc
	ld c, (hl)
	ld a, c
	and 2
	ld (_evil_eye_screen), a
	ld a, c
	and 4
	ld (_trap_screen), a
	ld a, c
	and 8
	ld (_trap_coins), a
	xor a
	ld (_scenery_info+2), a
	ld (_scenery_info+3), a
	ld (_evil_eye_counter), a
	ld a, 2
	ld (_evil_eye_state), a
	call	_decorate_screen
	ld	hl,(_trap_active)
	ld	h,0
	ld	a,h
	or	l
	call	nz,_win_crypt
.i_160
	ld	a,#(0 % 256 % 256)
	ld	(_trap_active),a
	ld	a,(_water_level)
	and	a
	jp	z,i_161
	ld	hl,_player+8
	ld	(hl),#(65280 % 256)
	inc	hl
	ld	(hl),#(65280 / 256)
	ld	hl,_player+1+1
	ld	(hl),#(8704 % 256)
	inc	hl
	ld	(hl),#(8704 / 256)
	ld	hl,136 % 256	;const
	ld	a,l
	ld	(_gpy),a
	call	_water_trap_setup
	ld	a,(_n_pant)
	cp	#(5 % 256)
	jp	nz,i_162
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_water_level),a
	jp	i_163
.i_162
	ld	hl,25 % 256	;const
	ld	a,l
	ld	(_water_level),a
.i_163
.i_161
	ret


;	SECTION	text

._e_scripts
	defw	_mscce_0
	defw	0
	defw	_mscce_1
	defw	_mscce_2
	defw	0
	defw	_mscce_3
	defw	_mscce_4
	defw	0
	defw	0
	defw	0
	defw	_mscce_5
	defw	0
	defw	0
	defw	_mscce_7
	defw	_mscce_8
	defw	0
	defw	_mscce_6
	defw	0
	defw	0
	defw	_mscce_9
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_10
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_11
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_mscce_12
	defw	_mscce_13
	defw	0

;	SECTION	code

;	SECTION	text

._f_scripts
	defw	_msccf_0
	defw	0
	defw	_msccf_1
	defw	0
	defw	0
	defw	_msccf_2
	defw	_msccf_3
	defw	0
	defw	0
	defw	0
	defw	_msccf_4
	defw	0
	defw	0
	defw	_msccf_5
	defw	_msccf_6
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_7
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_8
	defw	0
	defw	0
	defw	0
	defw	0
	defw	_msccf_9
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0
	defw	0

;	SECTION	code

	._mscce_0
	defb 0x20, 0xF0, 0xFF, 0xE3, 0x16, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x52, 0x41, 0x4D, 0x4F, 0x4E, 0x20, 0x45, 0x4C, 0x20, 0x46, 0x41, 0x52, 0x41, 0x4F, 0x4E, 0x00, 0xA0, 0x20, 0x26, 0x1B, 0xFF, 0xFF
	._mscce_1
	defb 0x21, 0xF0, 0xFF, 0x20, 0x97, 0x1A, 0xE3, 0x18, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x47, 0x55, 0x53, 0x54, 0x41, 0x56, 0x4F, 0x20, 0x45, 0x4C, 0x20, 0x45, 0x53, 0x43, 0x4C, 0x41, 0x56, 0x4F, 0x00, 0xFF, 0x0B, 0x10, 0x04, 0x02, 0xFF, 0x20, 0xE1, 0x00, 0x20, 0xE2, 0x00, 0xFF, 0xFF
	._mscce_2
	defb 0x06, 0xF0, 0xFF, 0x01, 0x0F, 0x04, 0xFF, 0x09, 0xBE, 0xFF, 0x20, 0x15, 0x2E, 0x20, 0x28, 0x0B, 0xFF, 0xFF
	._mscce_3
	defb 0x1E, 0xF0, 0xFF, 0xE3, 0x15, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x4C, 0x41, 0x20, 0x20, 0x43, 0x49, 0x53, 0x54, 0x45, 0x52, 0x4E, 0x41, 0x00, 0x20, 0xA8, 0x1B, 0xFF, 0xFF
	._mscce_4
	defb 0x09, 0xF0, 0xFF, 0x20, 0x36, 0x15, 0x20, 0x46, 0x16, 0xFF, 0xFF
	._mscce_5
	defb 0x22, 0xF0, 0xFF, 0x20, 0x75, 0x19, 0xE3, 0x19, 0x20, 0x20, 0x20, 0x20, 0x4D, 0x41, 0x52, 0x49, 0x53, 0x41, 0x20, 0x4C, 0x41, 0x20, 0x53, 0x41, 0x43, 0x45, 0x52, 0x44, 0x4F, 0x54, 0x49, 0x53, 0x41, 0x00, 0xFF, 0x0B, 0x10, 0x03, 0x02, 0xFF, 0x20, 0x57, 0x00, 0x20, 0x58, 0x00, 0xFF, 0xFF
	._mscce_6
	defb 0x06, 0xF0, 0xFF, 0x01, 0x0F, 0x03, 0xFF, 0x0C, 0xBD, 0xFF, 0x20, 0x72, 0x2E, 0x20, 0x65, 0x2E, 0x20, 0x78, 0x0B, 0xFF, 0xFF
	._mscce_7
	defb 0x26, 0xF0, 0xFF, 0xE3, 0x1A, 0x20, 0x20, 0x20, 0x20, 0x41, 0x4C, 0x54, 0x41, 0x52, 0x20, 0x44, 0x45, 0x20, 0x4C, 0x41, 0x53, 0x20, 0x4F, 0x46, 0x52, 0x45, 0x4E, 0x44, 0x41, 0x53, 0x21, 0x00, 0x20, 0x98, 0x15, 0x20, 0xA8, 0x16, 0xFF, 0x09, 0xB6, 0xFF, 0x20, 0x37, 0x00, 0x20, 0x38, 0x00, 0xFF, 0xFF
	._mscce_8
	defb 0x06, 0xF0, 0xFF, 0x20, 0x28, 0x1B, 0xFF, 0xFF
	._mscce_9
	defb 0x22, 0xF0, 0xFF, 0x20, 0x22, 0x18, 0xE3, 0x19, 0x20, 0x20, 0x20, 0x20, 0x43, 0x4C, 0x45, 0x4D, 0x45, 0x4E, 0x54, 0x45, 0x20, 0x4C, 0x41, 0x20, 0x53, 0x45, 0x52, 0x50, 0x49, 0x45, 0x4E, 0x54, 0x45, 0x00, 0xFF, 0x0B, 0x10, 0x02, 0x02, 0xFF, 0x20, 0x01, 0x00, 0x20, 0x02, 0x00, 0xFF, 0xFF
	._mscce_10
	defb 0x1E, 0xF0, 0xFF, 0x20, 0x22, 0x17, 0xE3, 0x15, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x53, 0x4F, 0x4E, 0x49, 0x41, 0x20, 0x4C, 0x41, 0x20, 0x4D, 0x4F, 0x4D, 0x49, 0x41, 0x00, 0xFF, 0x0B, 0x10, 0x01, 0x02, 0xFF, 0x20, 0x01, 0x00, 0x20, 0x02, 0x00, 0xFF, 0xFF
	._mscce_11
	defb 0x06, 0xA9, 0xFF, 0x20, 0x38, 0x14, 0xFF, 0x06, 0xB9, 0xFF, 0x20, 0x38, 0x10, 0xFF, 0xFF
	._mscce_12
	defb 0x06, 0xA9, 0xFF, 0x20, 0x27, 0x0A, 0xFF, 0xFF
	._mscce_13
	defb 0x03, 0xF0, 0xFF, 0xFF, 0xFF
	._msccf_0
	defb 0x0A, 0x20, 0x02, 0x06, 0x41, 0x04, 0xFF, 0xE4, 0x40, 0xF1, 0xFF, 0x0D, 0x20, 0x02, 0x06, 0xA0, 0xFF, 0xE4, 0x01, 0xB6, 0xB0, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_1
	defb 0x07, 0x20, 0x09, 0x07, 0xFF, 0xE4, 0x44, 0xFF, 0xFF
	._msccf_2
	defb 0x07, 0x20, 0x0A, 0x08, 0xFF, 0xE4, 0x19, 0xFF, 0x0E, 0x20, 0x0A, 0x08, 0x10, 0x12, 0x00, 0xFF, 0x01, 0x12, 0x01, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_3
	defb 0x0A, 0x21, 0x21, 0x4F, 0x22, 0x51, 0x6F, 0xFF, 0xE4, 0x03, 0xFF, 0xFF
	._msccf_4
	defb 0x07, 0x20, 0x07, 0x05, 0xFF, 0xE4, 0x43, 0xFF, 0xFF
	._msccf_5
	defb 0x0A, 0x21, 0x81, 0xAF, 0x22, 0x71, 0x8F, 0xFF, 0xE4, 0x80, 0xFF, 0xFF
	._msccf_6
	defb 0x07, 0x20, 0x02, 0x08, 0xFF, 0xE4, 0x20, 0xFF, 0x0E, 0x20, 0x02, 0x08, 0x10, 0x11, 0x00, 0xFF, 0x01, 0x11, 0x01, 0x10, 0x10, 5, 0xFF, 0xFF
	._msccf_7
	defb 0x07, 0x20, 0x02, 0x02, 0xFF, 0xE4, 0x42, 0xFF, 0xFF
	._msccf_8
	defb 0x07, 0x20, 0x02, 0x02, 0xFF, 0xE4, 0x41, 0xFF, 0xFF
	._msccf_9
	defb 0x0D, 0x20, 0x03, 0x08, 0xA9, 0xFF, 0xB9, 0x20, 0x38, 0x10, 0xE1, 0xE0, 0x08, 0xFF, 0xFF

._msc_init_all
	ld hl, _flags
	ld de, _flags+1
	ld bc, 21-1
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
	jp	nz,i_166
	ret


.i_166
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_something_done),a
.i_167
	ld	hl,(_script_result)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_168
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	e,a
	ld	d,0
	ld	hl,255	;const
	call	l_eq
	jp	c,i_168
.i_169
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
.i_170
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_171
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_172
	ld	de,_flags
	ld	hl,(_sc_m)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_173
.i_172
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_174
	ld	de,_flags
	ld	hl,(_sc_m)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_175
.i_174
	ld	hl,(_sc_c)
	ld	h,0
.i_178
	ld	a,l
	cp	#(16% 256)
	jp	z,i_179
	cp	#(32% 256)
	jp	z,i_180
	cp	#(33% 256)
	jp	z,i_183
	cp	#(34% 256)
	jp	z,i_186
	cp	#(65% 256)
	jp	z,i_189
	cp	#(240% 256)
	jp	z,i_190
	cp	#(255% 256)
	jp	z,i_191
	jp	i_177
.i_179
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
	jp	i_177
.i_180
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
	jp	nc,i_181
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
	jp	nc,i_181
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
	jp	nc,i_181
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
	jp	nc,i_181
	ld	hl,1	;const
	jr	i_182
.i_181
	ld	hl,0	;const
.i_182
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_177
.i_183
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
	jp	nc,i_184
	ld	hl,(_gpx)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_ule
	jp	nc,i_184
	ld	hl,1	;const
	jr	i_185
.i_184
	ld	hl,0	;const
.i_185
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_177
.i_186
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
	jp	nc,i_187
	ld	hl,(_gpy)
	ld	h,0
	ex	de,hl
	ld	hl,(_sc_y)
	ld	h,0
	call	l_ule
	jp	nc,i_187
	ld	hl,1	;const
	jr	i_188
.i_187
	ld	hl,0	;const
.i_188
	call	l_lneg
	ld	hl,0	;const
	rl	l
	ld	h,0
	ld	a,l
	ld	(_sc_terminado),a
	jp	i_177
.i_189
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
.i_190
	jp	i_177
.i_191
	ld a, 1
	ld (_sc_terminado), a
	ld (_sc_continuar), a
	ld (_script_something_done), a
.i_177
.i_175
.i_173
	jp	i_170
.i_171
	ld	a,(_sc_continuar)
	and	a
	jp	z,i_192
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_193
	ld	hl,(_sc_terminado)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_194
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_c),a
	ld	a,(_sc_i)
	cp	#(160 % 256)
	jp	nz,i_195
	ld	hl,_flags
	push	hl
	ld	a,(_sc_m)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	pop	de
	add	hl,de
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_196
.i_195
	ld	a,(_sc_i)
	cp	#(176 % 256)
	jp	nz,i_197
	ld	hl,_flags
	push	hl
	ld	a,(_sc_m)
	ld	e,a
	ld	d,0
	ld	hl,15	;const
	call	l_and
	pop	de
	add	hl,de
	ld	(hl),#(1 % 256 % 256)
	ld	l,(hl)
	ld	h,0
	jp	i_198
.i_197
	ld	hl,(_sc_c)
	ld	h,0
.i_201
	ld	a,l
	cp	#(1% 256)
	jp	z,i_202
	cp	#(16% 256)
	jp	z,i_203
	cp	#(32% 256)
	jp	z,i_204
	cp	#(224% 256)
	jp	z,i_205
	cp	#(225% 256)
	jp	z,i_206
	cp	#(227% 256)
	jp	z,i_207
	cp	#(228% 256)
	jp	z,i_208
	cp	#(241% 256)
	jp	z,i_209
	cp	#(255% 256)
	jp	z,i_210
	jp	i_200
.i_202
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
	jp	i_200
.i_203
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
	jp	i_200
.i_204
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
	jp	i_200
.i_205
	call	_read_vbyte
	ld	h,0
	call	_wyz_play_sound
	jp	i_200
.i_206
	ld	hl,1	;const
	push	hl
	call	_cpc_UpdateNow
	pop	bc
	jp	i_200
.i_207
	call	_read_byte
	ld	h,0
	ld	a,l
	ld	(_sc_n),a
	ld	hl,1	;const
	push	hl
	ld	hl,22	;const
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,(_script)
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,(_script)
	ld	hl,(_sc_n)
	ld	h,0
	add	hl,de
	ld	(_script),hl
	jp	i_200
.i_208
	call	_read_byte
	ld	h,0
	push	hl
	call	_do_extern_action
	pop	bc
	jp	i_200
.i_209
	ld a, 1
	ld (_sc_terminado), a
	ld (_script_result), a
	jp	i_200
.i_210
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_sc_terminado),a
.i_200
.i_198
.i_196
	jp	i_193
.i_194
.i_192
	ld	hl,(_next_script)
	ld	(_script),hl
	jp	i_167
.i_168
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
	ld	hl,14	;const
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
	ld	hl,15	;const
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
	ld	hl,7	;const
	push	hl
	ld	hl,4	;const
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,i_1+22
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10	;const
	push	hl
	ld	hl,7	;const
	push	hl
	push	hl
	ld	hl,i_1+41
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10	;const
	push	hl
	ld	hl,8	;const
	push	hl
	ld	hl,7	;const
	push	hl
	ld	hl,i_1+54
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,8	;const
	push	hl
	ld	hl,19	;const
	push	hl
	ld	hl,71	;const
	push	hl
	ld	hl,i_1+67
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,10	;const
	push	hl
	ld	hl,20	;const
	push	hl
	ld	hl,7	;const
	push	hl
	ld	hl,i_1+84
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
.i_211
	ld	hl,10	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_213
	ld	hl,_def_keys
	ld	(_gp_gen),hl
	jp	i_212
.i_213
	ld	hl,11	;const
	call	cpc_TestKey
	ld	a,h
	or	l
	jp	z,i_214
	ld	hl,_def_keys_joy
	ld	(_gp_gen),hl
	jp	i_212
.i_214
	jp	i_211
.i_212
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
	call	_wyz_stop_sound
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
	ld	hl,104	;const
	push	hl
	ld	hl,i_1+97
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
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	#(253 % 256)
	jr	z,i_215_uge
	jp	c,i_215
.i_215_uge
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	ld	bc,-252
	add	hl,bc
	call	_wyz_play_music
	jp	i_216
.i_215
	ld	a,#(1 % 256 % 256)
	ld	(_redraw_after_text),a
	ld	hl,2	;const
	add	hl,sp
	ld	l,(hl)
	ld	h,0
	push	hl
	call	_show_text_box
	pop	bc
.i_216
	ret


;	SECTION	text

._line_of_text_clear
	defm	"                              "
	defm	"  "
	defb	0

;	SECTION	code



	._player_cells
	defw (_sprites + 0x0000), (_sprites + 0x0040), (_sprites + 0x0080), (_sprites + 0x00C0), (_sprites + 0x0540)
	defw (_sprites + 0x0100), (_sprites + 0x0140), (_sprites + 0x0180), (_sprites + 0x01C0), (_sprites + 0x0580)
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
	ld b, 1 + 3 + 0 + 0 + 1
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
	;;srl a
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
	jp	i_220
.i_218
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_220
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_219
	jp	nc,i_219
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
	jp	c,i_222
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
	jp	nc,i_221
.i_222
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
	jp	i_224
.i_221
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
.i_224
	call _render_this_enemy
	jp	i_218
.i_219
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
	jp	c,i_226
	ld	a,(_half_life)
	and	a
	jp	z,i_225
.i_226
	ld	hl,(_gpx)
	ld	h,0
	ld	a,l
	ld	(_rdx),a
	jp	i_228
.i_225
	ld	hl,240 % 256	;const
	ld	a,l
	ld	(_rdx),a
.i_228
	.render_player
	ld ix, #(0xE000 + 0x600 + (0*16))
	ld a, (_gpx)
	add #(1*8)
	add (ix + 6)
	srl a
	;srl a
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
	ld	hl,_flags+10
	inc	(hl)
	ld	hl,(__x)
	ld	h,0
	push	hl
	ld	hl,(__y)
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
	ld	hl,_player+29
	inc	(hl)
	ld	a,(hl)
	inc	hl
	jr	nz,ASMPC+3
	inc	(hl)
	ld	h,(hl)
	ld	l,a
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
	jp	nz,i_229
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
	jp	nz,i_229
	jr	i_230
.i_229
	ld	hl,1	;const
.i_230
	ld	h,0
	ld	a,l
	ld	(_rdi),a
	ld	a,(_button_jump)
	and	a
	jp	z,i_231
	ld	a,(_player+19)
	cp	#(0 % 256)
	jp	nz,i_233
	ld	a,(_player+42)
	cp	#(0 % 256)
	jr	z,i_234_i_233
.i_233
	jp	i_232
.i_234_i_233
	ld	a,(_rdi)
	and	a
	jp	nz,i_236
	ld	a,(_player+25)
	and	a
	jp	z,i_235
.i_236
	ld	hl,_player+19
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(1 % 256 % 256)
	ld	hl,_player+14
	ld	(hl),#(0 % 256 % 256)
	ld	hl,1	;const
	call	_wyz_play_sound
.i_235
.i_232
	ld	a,(_player+19)
	and	a
	jp	z,i_238
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
	jp	nc,i_239
	ld	hl,65280	;const
	ld	(_player+8),hl
.i_239
	ld	hl,_player+14
	inc	(hl)
	ld	a,(hl)
	cp	#(8 % 256)
	jp	nz,i_240
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	l,(hl)
	ld	h,0
.i_240
.i_238
	jp	i_241
.i_231
	ld	hl,_player+19
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+43
	ld	(hl),#(0 % 256 % 256)
.i_241
	ld	hl,_player+41
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_pad0
	ld	a,(hl)
	and	#(8 % 256)
	jp	nz,i_242
	ld	hl,_player+42
	ld	(hl),#(1 % 256 % 256)
	ld	hl,(_player+8)
	xor	a
	or	h
	jp	m,i_243
	or	l
	jp	z,i_243
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
.i_243
	jp	i_244
.i_242
	ld	hl,_player+42
	ld	(hl),#(0 % 256 % 256)
.i_244
	ld	hl,(_player+41)
	ld	h,0
	ld	a,h
	or	l
	jp	nz,i_245
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
.i_245
	ld	a,(_player+25)
	and	a
	jp	z,i_246
	ld	hl,0	;const
	ld	(_player+8),hl
.i_246
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
	jp	p,i_247
	ld	hl,0	;const
	ld	(_player+1+1),hl
.i_247
	ld	hl,(_player+1+1)
	ld	de,9216	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_248
	ld	hl,9216	;const
	ld	(_player+1+1),hl
.i_248
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
	jp	z,i_250
	inc	hl
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	cp	#(0 % 256)
	ld	hl,0
	jr	nz,i_251_i_250
.i_250
	jp	i_249
.i_251_i_250
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	m,i_252
	or	l
	jp	z,i_252
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
	jp	p,i_253
	ld	hl,0	;const
	ld	(_player+6),hl
.i_253
	jp	i_254
.i_252
	ld	hl,(_player+6)
	xor	a
	or	h
	jp	p,i_255
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
	jp	m,i_256
	or	l
	jp	z,i_256
	ld	hl,0	;const
	ld	(_player+6),hl
.i_256
.i_255
.i_254
.i_249
	ld	hl,_pad0
	ld	a,(hl)
	rrca
	jp	c,i_257
	ld	hl,(_player+6)
	push	hl
	ld	hl,(_player+39)
	call	l_neg
	pop	de
	call	l_gt
	jp	nc,i_258
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
.i_258
.i_257
	ld	hl,_pad0
	ld	a,(hl)
	and	#(2 % 256)
	jp	nz,i_259
	ld	de,(_player+6)
	ld	hl,(_player+39)
	call	l_lt
	jp	nc,i_260
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
.i_260
.i_259
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
	jp	p,i_261
	ld	hl,0	;const
	ld	(_player),hl
.i_261
	ld	hl,(_player)
	ld	de,14336	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_262
	ld	hl,14336	;const
	ld	(_player),hl
.i_262
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
	jp	nz,i_263
	ld	hl,2	;const
	call	_wyz_play_sound
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-5
	add	hl,bc
	pop	de
	call	l_pint
	call	_player_flicker
.i_263
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
	jp	nc,i_264
	ld	hl,65248	;const
	ld	(_player+8),hl
.i_264
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
	jp	nc,i_266
	ld	a,(_scenery_info+1+1)
	and	a
	jr	nz,i_267_i_266
.i_266
	jp	i_265
.i_267_i_266
	ld	a,(_player+35)
	ld	e,a
	ld	d,0
	ld	hl,32	;const
	call	l_uge
	jp	c,i_269
	ld	hl,(_scenery_info+1)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_268
.i_269
	ld	a,(_player+23)
	ld	e,a
	ld	d,0
	ld	hl,2	;const
	call	l_and
	ld	de,0
	call	l_eq
	jp	nc,i_272
	ld	a,(_maincounter)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_and
	ld	de,0
	call	l_eq
	jr	c,i_273_i_272
.i_272
	jp	i_271
.i_273_i_272
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
	jp	nz,i_274
	ld	hl,3	;const
	call	_wyz_play_sound
.i_274
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
.i_271
	jp	i_275
.i_268
	ld	a,(_player+34)
	cp	#(8 % 256)
	jp	z,i_276
	jp	c,i_276
	ld	hl,_player+34
	ld	(hl),#(0 % 256 % 256)
	ld	hl,_player+35
	inc	(hl)
	ld	hl,76	;const
	call	_cpc_Border
	ld	hl,4	;const
	call	_wyz_play_sound
	halt
	ld	hl,84	;const
	call	_cpc_Border
	jp	i_277
.i_276
	ld	hl,_player+34
	inc	(hl)
	ld	l,(hl)
	ld	h,0
	dec	l
.i_277
.i_275
	jp	i_278
.i_265
	ld	a,(_player+35)
	and	a
	jp	z,i_279
	ld	hl,_player+35
	dec	(hl)
	ld	l,(hl)
	ld	h,0
	inc	l
.i_279
.i_278
	.player_get_coin
	ld a, (_gpxx)
	ld (__x), a
	ld c, a
	ld a, (_gpyy)
	ld (__y), a
	call qtile_do
	ld a, l
	cp 50
	jr nz, player_get_coin_A_done
	call _get_coin
	.player_get_coin_A_done
	ld a, (_gpx)
	and 15
	jr z, player_get_coin_B_done
	ld a, (_gpxx)
	inc a
	ld (__x), a
	ld c, a
	ld a, (_gpyy)
	ld (__y), a
	call qtile_do
	ld a, l
	cp 50
	jr nz, player_get_coin_B_done
	call _get_coin
	.player_get_coin_B_done
	ld a, (_gpy)
	and 15
	jr z, player_get_coin_C_done
	ld a, (_gpxx)
	ld (__x), a
	ld c, a
	ld a, (_gpyy)
	inc a
	ld (__y), a
	call qtile_do
	ld a, l
	cp 50
	jr nz, player_get_coin_C_done
	call _get_coin
	.player_get_coin_C_done
	ld a, (_gpx)
	and 15
	jr z, player_get_coin_D_done
	ld a, (_gpy)
	and 15
	jr z, player_get_coin_D_done
	ld a, (_gpxx)
	inc a
	ld (__x), a
	ld c, a
	ld a, (_gpyy)
	inc a
	ld (__y), a
	call qtile_do
	ld a, l
	cp 50
	jr nz, player_get_coin_D_done
	call _get_coin
	.player_get_coin_D_done
	ld a, (_player+22)
	or a
	jr z, _player_cell_sel_set_rdi
	ld a, 5
	._player_cell_sel_set_rdi
	ld (_rdi), a
	ld	hl,(_player+26)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_281
	ld	hl,(_player+25)
	ld	h,0
	ld	de,0
	call	l_eq
	jr	c,i_282_i_281
.i_281
	jp	i_280
.i_282_i_281
	ld	hl,(_player+41)
	ld	h,0
	ld	de,3
	add	hl,de
	ld	h,0
	ld	a,l
	ld	(_rdd),a
	jp	i_283
.i_280
	ld	hl,(_player+6)
	ld	a,h
	or	l
	jp	nz,i_284
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
	jp	i_285
.i_284
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
	jp	nz,i_286
	ld	hl,1 % 256	;const
	ld	a,l
	ld	(_rdd),a
.i_286
.i_285
.i_283
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
	ld	a,#(48 % 256 % 256)
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
	ld a, 64
	ld (_player+11), a
	ld a, 48
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
	ld b, 6 * 6
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
	jp	nc,i_287
	ld	hl,32	;const
	jp	i_288
.i_287
	ld	hl,0	;const
.i_288
	ld	h,0
	ld	a,l
	ld	(_tileoffset),a
	xor a
	ld (_rdi), a
	ld (_gpit), a
	.draw_scr_bg_loop
	ld a, (_tileoffset)
	ld c, a
	ld hl, (_gp_gen)
	ld a, (hl)
	inc hl
	ld (_gp_gen), hl
	ld b, a
	srl a
	srl a
	srl a
	srl a
	add c
	ld (_rdt1), a
	ld a, b
	and 15
	add c
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
	ld	hl,84	;const
	call	_cpc_Border
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
	jp	i_291
.i_289
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_291
	ld	a,(_enit)
	ld	e,a
	ld	d,0
	ld	hl,3	;const
	call	l_ult
	jp	nc,i_290
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
.i_294
	ld	a,l
	cp	#(1% 256)
	jp	z,i_295
	cp	#(2% 256)
	jp	z,i_296
	cp	#(3% 256)
	jp	z,i_297
	cp	#(4% 256)
	jp	z,i_298
	cp	#(6% 256)
	jp	z,i_299
	jp	i_293
.i_295
.i_296
.i_297
.i_298
	ld	hl,(__en_t)
	ld	h,0
	dec	hl
	push	hl
	call	_enems_en_an_calc
	pop	bc
	jp	i_293
.i_299
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
.i_293
	jp	i_289
.i_290
	xor a
	ld (_line_of_text_clear+32-2), a
	ld	hl,1	;const
	push	hl
	ld	hl,22	;const
	push	hl
	ld	hl,40	;const
	push	hl
	ld	hl,_line_of_text_clear
	push	hl
	call	_draw_text
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_e_scripts+74)
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
	jp	i_302
.i_300
	ld	hl,_enit
	ld	a,(hl)
	inc	(hl)
.i_302
	ld	a,(_enit)
	cp	#(3 % 256)
	jp	z,i_301
	jp	nc,i_301
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
	jp	z,i_303
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
	jp	nc,i_304
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
.i_304
	ld	a,(__en_t)
	cp	#(6 % 256)
	jp	z,i_306
	ld	a,(__en_t)
	cp	#(0 % 256)
	jp	nz,i_305
.i_306
	call	_rand
	ld	de,7	;const
	ex	de,hl
	call	l_and
	ld	de,1	;const
	ex	de,hl
	call	l_gt
	jp	nc,i_308
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
	jp	nc,i_310
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
	ld	hl,128	;const
	call	l_lt
	jr	c,i_311_i_310
.i_310
	jp	i_309
.i_311_i_310
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_312
.i_309
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
	jp	nc,i_314
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
	ld	hl,65408	;const
	call	l_gt
	jr	c,i_315_i_314
.i_314
	jp	i_313
.i_315_i_314
	ld	hl,_en_an_vx
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_pint
.i_313
.i_312
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
	jp	nc,i_317
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
	ld	hl,128	;const
	call	l_lt
	jr	c,i_318_i_317
.i_317
	jp	i_316
.i_318_i_317
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,8
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_319
.i_316
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
	jp	nc,i_321
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
	ld	hl,65408	;const
	call	l_gt
	jr	c,i_322_i_321
.i_321
	jp	i_320
.i_322_i_321
	ld	hl,_en_an_vy
	push	hl
	ld	hl,(_enit)
	ld	h,0
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint	;
	ld	bc,-8
	add	hl,bc
	pop	de
	call	l_pint
.i_320
.i_319
.i_308
	ld	a,(_scenery_info+1+1+1)
	and	a
	jp	z,i_323
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
.i_323
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
	jp	nc,i_324
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
.i_324
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
	jp	p,i_325
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
.i_325
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
	jp	nc,i_326
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
.i_326
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
	jp	p,i_327
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
.i_327
.i_305
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
	jp	nc,i_328
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
	jp	i_329
.i_328
	ld	hl,(__en_x)
	ld	h,0
	ld	a,l
	ld	(_en_ccx),a
	ld	hl,(__en_y)
	ld	h,0
	ld	a,l
	ld	(_en_ccy),a
.i_329
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	nz,i_331
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,-15
	add	hl,bc
	pop	de
	call	l_uge
	jp	nc,i_331
	ld	hl,(_gpx)
	ld	h,0
	push	hl
	ld	hl,(_en_ccx)
	ld	h,0
	ld	bc,15
	add	hl,bc
	pop	de
	call	l_ule
	jr	c,i_332_i_331
.i_331
	jp	i_330
.i_332_i_331
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
	jp	i_333
.i_330
	ld	hl,(_en_tocado)
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_335
	call	_collide_enem
	ld	a,h
	or	l
	jp	z,i_335
	ld	a,(__en_t)
	cp	#(16 % 256)
	jp	z,i_335
	jr	c,i_336_i_335
.i_335
	jp	i_334
.i_336_i_335
	ld	a,(_player+23)
	and	a
	jp	nz,i_337
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
	ld	a,(__en_t)
	cp	#(4 % 256)
	jp	z,i_338
	jp	c,i_338
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-7
	add	hl,bc
	pop	de
	call	l_pint
	jp	i_339
.i_338
	ld	hl,_player+29
	push	hl
	call	l_gint	;
	ld	bc,-5
	add	hl,bc
	pop	de
	call	l_pint
.i_339
	call	_player_flicker
.i_337
.i_334
.i_333
.i_303
.i_340
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
	jp	i_300
.i_301
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
	ld hl, cpc_PutSpTileMap4x8Px
	ld (ix + 13), h
	ld (ix + 12), l
	ld hl, cpc_PutTrSp4x8TileMap2bPx
	ld (ix + 15), h
	ld (ix + 14), l
	add ix, de
	djnz sp_sw_init_enems_loop
	ld ix, 0xE000 + 0x600
	ld de, 16
	ld b, 1 + 3 + 0 + 0 + 1
	.sp_sw_init_turnoff_loop
	ld a, #((1*8)/4)
	ld (ix + 10), a
	ld a, #(2*8)
	ld (ix + 11), a
	add ix, de
	djnz sp_sw_init_turnoff_loop
	call	_hook_system_inits
	ei
.i_341
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
	ld	a,#(12 % 256 % 256)
	ld	(_n_pant),a
	ld	a,#(0 % 256 % 256)
	ld	(_maincounter),a
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_script_result),a
	call	_msc_init_all
	ld	hl,(_e_scripts+72)
	ld	(_script),hl
	call	_run_script
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
.i_343
	ld	hl,(_playing)
	ld	h,0
	ld	a,h
	or	l
	jp	z,i_344
	call	_hook_init_mainloop
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
	jp	nc,i_345
	ld	hl,21	;const
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
.i_345
	ld	de,(_player+29)
	ld	hl,(_life_old)
	ld	h,0
	call	l_ne
	jp	nc,i_346
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_347
	or	l
	jp	z,i_347
	ld	hl,(_player+29)
	ld	h,0
	ld	a,l
	ld	(_pti),a
	jp	i_348
.i_347
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_pti),a
.i_348
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
.i_346
	ld hl, _maincounter
	inc (hl)
	ld a, (_half_life)
	xor 1
	ld (_half_life), a
	call	_mueve_bicharracos
	call	_move
	call	_render_all_sprites
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_latest_hotspot),a
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
	ld	hl,(_hotspot_t)
	ld	h,0
	ld	a,l
	ld	(_latest_hotspot),a
	ld	a,#(0 % 256 % 256)
	ld	(_rdi),a
	ld	hl,(_hotspot_t)
	ld	h,0
.i_351
	ld	a,l
	cp	#(1% 256)
	jp	nz,i_350
.i_352
	ld	hl,_player+27
	push	hl
	call	l_gchar
	inc	hl
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,6	;const
	call	_wyz_play_sound
.i_350
	ld	a,(_rdi)
	cp	#(1 % 256)
	jp	z,i_353
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
.i_353
	._hotspots_done
	call	_hook_mainloop
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
	jp	z,i_354
	ld	hl,(_f_scripts+72)
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
.i_354
	ld	a,(_gpx)
	cp	#(0 % 256)
	jp	nz,i_356
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jr	c,i_357_i_356
.i_356
	jp	i_355
.i_357_i_356
	ld hl, _n_pant
	dec (hl)
	ld a, 224
	ld (_gpx), a
	ld hl, #(224*64)
	ld (_player), hl
	.flick_left_done
	jp	i_358
.i_355
	ld	a,(_gpx)
	cp	#(224 % 256)
	jp	nz,i_360
	ld	hl,(_player+6)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_361_i_360
.i_360
	jp	i_359
.i_361_i_360
	ld hl, _n_pant
	inc (hl)
	xor a
	ld (_gpx), a
	ld hl, 0
	ld (_player), hl
	.flick_right_done
.i_359
.i_358
	ld	a,(_gpy)
	cp	#(0 % 256)
	jp	nz,i_363
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	nc,i_363
	ld	a,(_n_pant)
	cp	#(6 % 256)
	jr	z,i_363_uge
	jp	c,i_363
.i_363_uge
	jr	i_364_i_363
.i_363
	jp	i_362
.i_364_i_363
	ld a, (_n_pant)
	sub 6
	ld (_n_pant), a
	ld a, 144
	ld (_gpy), a
	ld hl, #(144*64)
	ld (_player+2), hl
	.flick_up_done
	jp	i_365
.i_362
	ld	a,(_gpy)
	cp	#(144 % 256)
	jp	nz,i_367
	ld	hl,(_player+8)
	ld	de,0	;const
	ex	de,hl
	call	l_gt
	jr	c,i_368_i_367
.i_367
	jp	i_366
.i_368_i_367
	ld a, (_n_pant)
	add 6
	ld (_n_pant), a
	xor a
	ld (_gpy), a
	ld hl, 0
	ld (_player+2),hl
	.flick_down_done
.i_366
.i_365
	ld	a,(_script_result)
	ld	e,a
	ld	d,0
	ld	hl,1	;const
	call	l_eq
	jp	nc,i_369
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_ending
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_369
	ld	a,(_player+36)
	and	a
	jp	z,i_370
	ld	hl,_player+36
	ld	(hl),#(0 % 256 % 256)
	ld	hl,(_player+29)
	xor	a
	or	h
	jp	m,i_371
	or	l
	jp	z,i_371
.i_371
.i_370
	ld	hl,(_player+29)
	ld	de,0	;const
	ex	de,hl
	call	l_lt
	jp	c,i_373
	ld	a,(_script_result)
	cp	#(2 % 256)
	jp	z,i_373
	ld	a,(_game_loop_flag)
	cp	#(2 % 256)
	jp	nz,i_372
.i_373
	call	_saca_a_todo_el_mundo_de_aqui
	call	_game_over
	ld	hl,0 % 256	;const
	ld	a,l
	ld	(_playing),a
.i_372
	jp	i_343
.i_344
	call	_wyz_stop_sound
	jp	i_341
.i_342
	ret


;	SECTION	text

.i_1
	defm	"1 KEYBOARD"
	defb	0

	defm	"2 JOYSTICK"
	defb	0

	defm	"RAMIRO, EL VAMPIRO"
	defb	0

	defm	"EN EL BOSQUE"
	defb	0

	defm	"DEL SUSPIRO!"
	defb	0

	defm	"MOJON TWINS 2021"
	defb	0

	defm	"MTE MK1 V4.8"
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
._evil_eye_screen	defs	1
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
._flags	defs	21
._gp_gen_alt	defs	2
._en_xx	defs	1
._water_top_door_x	defs	1
._en_yy	defs	1
._gp_gen_org	defs	2
._enemy_died	defs	1
._killed_old	defs	1
._ezg_old	defs	1
._intro_text	defs	1
._t_alt	defs	1
.__n	defs	1
.__t	defs	1
.__x	defs	1
.__y	defs	1
._life_old	defs	1
._en_ccx	defs	1
._en_ccy	defs	1
._enemy_killer	defs	1
._ptgmx	defs	2
._ptgmy	defs	2
._cabroni	defs	1
._pinv_current_frame	defs	2
._trap_active	defs	1
._gp_gen	defs	2
._on_pant	defs	1
._enoffs	defs	2
._pad_this_frame	defs	1
._water_level	defs	1
._button_jump	defs	1
._water_locks	defs	1
._pad0	defs	1
._pad1	defs	1
._n_pant	defs	1
._en_j	defs	1
._redraw_after_text	defs	1
._en_x	defs	1
._en_y	defs	1
._enit	defs	1
._ofrendas_idx	defs	1
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
._evil_eye_state	defs	1
._pofrendas_old	defs	1
._scenery_info	defs	4
._sc_i	defs	1
._sc_c	defs	1
._sc_m	defs	1
._sc_n	defs	1
._seed	defs	2
._sc_x	defs	1
._sc_y	defs	1
._pattern_line_ct	defs	1
._objs_old	defs	1
._gpxx	defs	1
._gpyy	defs	1
._maincounter	defs	1
._ptx1	defs	1
._ptx2	defs	1
._pty1	defs	1
._pty2	defs	1
._pinv	defs	1
._wall	defs	1
._f_zone_ac	defs	1
._cerrojos	defs	2
._pinv_next_frame	defs	2
.__x2	defs	1
.__y2	defs	1
.__en_life	defs	1
._prxx	defs	1
._pryy	defs	1
._tileoffset	defs	1
._water_ct	defs	1
._next_script	defs	2
._item_old	defs	1
._idx	defs	2
._player	defs	44
._jetpac_frame_counter	defs	1
._evil_eye_counter	defs	1
._rda	defs	1
._rdb	defs	1
._gpx	defs	1
._gpy	defs	1
._rdd	defs	1
._rdi	defs	1
._rdj	defs	2
._trap_coins	defs	1
._keys_old	defs	1
.__trap_bt	defs	1
._rdx	defs	1
._rdy	defs	1
.__trap_bx	defs	1
.__trap_by	defs	1
._opscore	defs	1
._pti	defs	1
._ptj	defs	1
._enoffsmasi	defs	2
._game_loop_flag	defs	1
._script	defs	2
._latest_hotspot	defs	1
._sc_terminado	defs	1
._asm_int	defs	2
.__baddies_pointer	defs	2
._trap_bt	defs	3
._trap_bx	defs	3
._trap_by	defs	3
._sc_continuar	defs	1
._orig_tile	defs	1
._success	defs	1
._coins_old	defs	1
._ram_destination	defs	2
._trap_screen	defs	1
._pofrendas	defs	1
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
	defc	_spr_next	=	58960
	XDEF	_wyz_play_music
	XDEF	_trpixlutc
	LIB	cpc_PrintGphStrXY
	XDEF	_sm_invfunc
	XDEF	_f_scripts
	XDEF	_can_move_box
	LIB	cpc_PrintGphStrStdXY
	XDEF	_hook_init_mainloop
	XDEF	_evil_eye_screen
	XDEF	_saca_a_todo_el_mundo_de_aqui
	XDEF	_set_map_tile
	LIB	cpc_PutTiles
	XDEF	_sprites
	XDEF	__en_x1
	XDEF	__en_x2
	XDEF	__en_y1
	XDEF	_def_keys
	XDEF	__en_y2
	XDEF	_adm_s_n_pant
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
	XDEF	_hook_system_inits
	LIB	cpc_SetTile
	XDEF	_en_xx
	XDEF	_malotes
	XDEF	_water_top_door_x
	XDEF	_en_yy
	XDEF	_draw_text
	XDEF	_clear_gamearea
	XDEF	_recuadrius
	LIB	cpc_CollSp
	XDEF	_beepet
	LIB	cpc_PutMaskSp4x16
	XDEF	_en_an_morido
	defc	_en_an_morido	=	54802
	XDEF	_gp_gen_org
	XDEF	_enemy_died
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
	XDEF	_intro_text
	XDEF	_script_something_done
	LIB	cpc_ShowTileMap
	LIB	cpc_PutTile2x8
	XDEF	_pad_read
	XDEF	_t_alt
	LIB	cpc_ShowScrTileMap2
	LIB	cpc_Uncrunch
	XDEF	_cpc_UpdateNow
	XREF	_sp_UpdateNow
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
	LIB	cpc_PutSpTileMap8x16Px
	LIB	cpc_PutSpTileMap8x24Px
	XDEF	_msccf_0
	XDEF	_msccf_1
	XDEF	_enemy_killer
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
	XDEF	_adm_s_x
	XDEF	_adm_s_y
	XDEF	_draw_and_advance
	LIB	cpc_TouchTileXY
	LIB	cpc_SetTouchTileXY
	XDEF	_ptgmx
	XDEF	_ptgmy
	XDEF	_qtile
	XDEF	_cabroni
	XDEF	_en_an_current_frame
	defc	_en_an_current_frame	=	54790
	XDEF	_pinv_current_frame
	XDEF	_evil_eye_state_tiles
	XDEF	_sprite_18_a
	XDEF	_texts
	XDEF	_trap_active
	XDEF	_init_player
	XDEF	_gp_gen
	XDEF	_spr_x
	defc	_spr_x	=	58975
	XDEF	_spr_y
	defc	_spr_y	=	58980
	XDEF	_on_pant
	XDEF	_render_this_enemy
	XDEF	_enoffs
	LIB	cpc_PutSpTr
	XDEF	_pad_this_frame
	LIB	cpc_DisableFirmware
	LIB	cpc_EnableFirmware
	XDEF	_water_level
	XDEF	_button_jump
	XDEF	_water_locks
	XDEF	_evil_eye_state_cts
	XDEF	_enem_cells
	LIB	cpc_PrintGphStrXYM12X
	LIB	cpc_SetInk
	XDEF	_pad0
	XDEF	_pad1
	XDEF	__tile_address
	XREF	_sprite_remove_aid
	XDEF	_n_pant
	XDEF	_def_keys_joy
	XDEF	_en_j
	XDEF	_redraw_after_text
	LIB	cpc_SetBorder
	XDEF	_draw_falling_block
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
	XDEF	_hook_mainloop
	XDEF	_ofrendas_idx
	XDEF	_mapa
	XDEF	_main
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
	XDEF	_evil_eye_state
	XDEF	_pofrendas_old
	XDEF	_scenery_info
	XDEF	_hook_entering
	XDEF	_sc_i
	XDEF	_sc_c
	XDEF	_sc_m
	XDEF	_sc_n
	XDEF	_s_title
	XDEF	_line_of_text_clear
	XDEF	_enems_calc_frame
	XDEF	_rand
	XDEF	_seed
	XDEF	_sc_x
	XDEF	_sc_y
	XDEF	_pattern_line_ct
	XDEF	_objs_old
	LIB	cpc_DeleteKeys
	XDEF	_gpxx
	XDEF	_gpyy
	XDEF	_maincounter
	XDEF	_ofrendas_order
	XDEF	_ptx1
	XDEF	_ptx2
	XDEF	_pty1
	XDEF	_pty2
	XDEF	_move
	XDEF	_pinv
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
	XDEF	_pinv_next_frame
	LIB	cpc_ScrollLeft0
	XDEF	_my_inks
	XDEF	__x2
	XDEF	__y2
	LIB	cpc_AnyKeyPressed
	XDEF	__en_life
	XDEF	_cpc_HardPause
	XDEF	_hook_init_game
	LIB	cpc_AssignKey
	XDEF	_prxx
	XDEF	_read_x_y
	XDEF	_pryy
	XDEF	_calc_hotspot_ptr
	LIB	cpc_TouchTiles
	LIB	cpc_PutSpTileMap4x8Px
	XDEF	_tileoffset
	XDEF	_paint_water_strip
	XDEF	_abs
	LIB	cpc_ScrollRight0
	LIB	cpc_PrintGphStr
	XDEF	_s_ending
	XDEF	_game_ending
	LIB	cpc_UnExo
	XDEF	_redraw_from_buffer
	XDEF	_water_ct
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
	XDEF	_evil_eye_counter
	LIB	cpc_UpdateTileMap
	XDEF	_rda
	XDEF	_rdb
	XDEF	_text10
	XDEF	_gpx
	XDEF	_gpy
	XDEF	_rdd
	XDEF	_text11
	XDEF	_text12
	XDEF	_rdi
	XDEF	_rdj
	XDEF	_trap_coins
	XDEF	_text13
	XDEF	_text14
	XDEF	_text15
	XDEF	_text16
	XDEF	_keys_old
	XDEF	_init_player_values
	XDEF	_en_tocado
	LIB	cpc_TestKeyF
	XDEF	__trap_bt
	XDEF	_text17
	XDEF	_draw_2_digits
	XDEF	_rdx
	XDEF	_rdy
	XDEF	_script_result
	XDEF	_sm_cox
	XDEF	_sm_coy
	XDEF	__trap_bx
	XDEF	__trap_by
	XDEF	_opscore
	LIB	cpc_PutTrSp4x8TileMap2bPx
	LIB	cpc_PutTrSp8x16TileMap2bPx
	LIB	cpc_PutTrSp8x24TileMap2bPx
	XDEF	_pti
	XDEF	_ptj
	XDEF	_comportamiento_tiles
	XDEF	_move_tile
	XDEF	_tileset
	LIB	cpc_PutSpTileMap8x16
	LIB	cpc_PutSpTileMap8x24
	XDEF	_text18
	XDEF	_text19
	XDEF	_wyz_stop_sound
	XDEF	_bitmask
	XDEF	_text20
	XDEF	_text21
	XDEF	_text22
	LIB	cpc_ReadTile
	LIB	cpc_PutMaskSprite
	XDEF	_text23
	XDEF	_text24
	XDEF	_text25
	XDEF	_text26
	XDEF	_text27
	XDEF	_text28
	XDEF	_text29
	XDEF	_text30
	LIB	cpc_PutSpTileMapO
	XDEF	_enoffsmasi
	XDEF	_talk_sounds
	LIB	cpc_PutSp
	XDEF	_text31
	XDEF	_text32
	LIB	cpc_UpdScrAddresses
	XDEF	_text33
	XDEF	_text34
	XDEF	_text35
	XDEF	_text36
	XDEF	_text37
	XDEF	_text38
	XDEF	_text39
	XDEF	_game_loop_flag
	XDEF	_decorate_screen
	XDEF	_mscce_10
	XDEF	_mscce_11
	XDEF	_mscce_12
	XDEF	_mscce_13
	XDEF	_e_scripts
	XDEF	_script
	XDEF	_msc_init_all
	XDEF	_player_flicker
	XDEF	_init_hotspots
	XDEF	_get_coin
	XDEF	_latest_hotspot
	XDEF	_water_pushplates
	XDEF	_sc_terminado
	XDEF	_asm_int
	XDEF	_hotspot_paint
	XDEF	__baddies_pointer
	XDEF	_calc_baddies_pointer
	XDEF	_trap_kill
	LIB	cpc_TouchTileSpXY
	XDEF	_any_key
	LIB	cpc_SuperbufferAddress
	LIB	cpc_GetScrAddress
	XDEF	_wyz_songs
	XDEF	_trap_bt
	XDEF	_trap_bx
	XDEF	_trap_by
	LIB	cpc_PutMaskSp
	XDEF	_sc_continuar
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
	XDEF	_trap_screen
	XDEF	_object_cells
	LIB	cpc_GetTiles
	XDEF	_render_all_sprites
	XDEF	_spr_on
	defc	_spr_on	=	58970
	LIB	cpc_PutSpXOR
	XDEF	_pofrendas
	LIB	cpc_PrintStr
	XDEF	_draw_scr_background
	LIB	cpc_PrintGphStr2X
	XDEF	_win_crypt
	XDEF	_game_over
	XDEF	_water_trap_setup
	LIB	cpc_PrintGphStrM1
	XDEF	_ram_address


; --- End of Scope Defns ---


; --- End of Compilation ---
