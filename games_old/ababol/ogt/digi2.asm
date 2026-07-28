	org 60000

;BeepFX player by Shiru
;You are free to do whatever you want with this code



playBasic:
	ld a,19
play:
	ld hl,sfxData		;address of sound effects data

	di
	push ix
	push iy

	ld b,0
	ld c,a
	add hl,bc
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	push de
	pop ix				;put it into ix

	ld a,(23624)		;get border color from BASIC vars to keep it unchanged
	rra
	rra
	rra
	and 7
	ld (sfxRoutineToneBorder  +1),a
	ld (sfxRoutineNoiseBorder +1),a
	ld (sfxRoutineSampleBorder+1),a


readData:
	ld a,(ix+0)			;read block type
	ld c,(ix+1)			;read duration 1
	ld b,(ix+2)
	ld e,(ix+3)			;read duration 2
	ld d,(ix+4)
	push de
	pop iy

	dec a
	jr z,sfxRoutineTone
	dec a
	jr z,sfxRoutineNoise
	dec a
	jr z,sfxRoutineSample
	pop iy
	pop ix
	ei
	ret

	

;play sample

sfxRoutineSample:
	ex de,hl
sfxRS0:
	ld e,8				;7
	ld d,(hl)			;7
	inc hl				;6
sfxRS1:
	ld a,(ix+5)			;19
sfxRS2:
	dec a				;4
	jr nz,sfxRS2		;7/12
	rl d				;8
	sbc a,a				;4
	and 16				;7
	and 16				;7	dummy
sfxRoutineSampleBorder:
	or 0				;7
	out (254),a			;11
	dec e				;4
	jp nz,sfxRS1		;10=88t
	dec bc				;6
	ld a,b				;4
	or c				;4
	jp nz,sfxRS0		;10=132t

	ld c,6
	
nextData:
	add ix,bc		;skip to the next block
	jr readData



;generate tone with many parameters

sfxRoutineTone:
	ld e,(ix+5)			;freq
	ld d,(ix+6)
	ld a,(ix+9)			;duty
	ld (sfxRoutineToneDuty+1),a
	ld hl,0

sfxRT0:
	push bc
	push iy
	pop bc
sfxRT1:
	add hl,de			;11
	ld a,h				;4
sfxRoutineToneDuty:
	cp 0				;7
	sbc a,a				;4
	and 16				;7
sfxRoutineToneBorder:
	or 0				;7
	out (254),a			;11
	ld a,(0)			;13	dummy
	dec bc				;6
	ld a,b				;4
	or c				;4
	jp nz,sfxRT1		;10=88t

	ld a,(sfxRoutineToneDuty+1)	 ;duty change
	add a,(ix+10)
	ld (sfxRoutineToneDuty+1),a

	ld c,(ix+7)			;slide
	ld b,(ix+8)
	ex de,hl
	add hl,bc
	ex de,hl

	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRT0

	ld c,11
	jr nextData



;generate noise with two parameters

sfxRoutineNoise:
	ld e,(ix+5)			;pitch

	ld d,1
	ld h,d
	ld l,d
sfxRN0:
	push bc
	push iy
	pop bc
sfxRN1:
	ld a,(hl)			;7
	and 16				;7
sfxRoutineNoiseBorder:
	or 0				;7
	out (254),a			;11
	dec d				;4
	jp z,sfxRN2			;10
	nop					;4	dummy
	jp sfxRN3			;10	dummy
sfxRN2:
	ld d,e				;4
	inc hl				;6
	ld a,h				;4
	and 31				;7
	ld h,a				;4
	ld a,(0)			;13 dummy
sfxRN3:
	nop					;4	dummy
	dec bc				;6
	ld a,b				;4
	or c				;4
	jp nz,sfxRN1		;10=88 or 112t

	ld a,e
	add a,(ix+6)		;slide
	ld e,a

	pop bc
	dec bc
	ld a,b
	or c
	jr nz,sfxRN0

	ld c,7
	jr nextData


sfxData:

SoundEffectsData:
	defw SoundEffect0Data

SoundEffect0Data:
	defb 3 ;sample
	defw 867
	defw Sample0Data+0
	defb 31
	defb 0

Sample0Data:
	defb 255,255,255,255,127,253,255,131,225,255,255,251,255,255,0,0
	defb 63,255,255,255,151,195,248,0,1,255,255,253,175,224,255,0
	defb 192,127,255,255,214,190,15,224,60,7,255,255,246,191,131,252
	defb 15,1,255,255,254,247,240,127,129,224,31,255,255,183,252,31
	defb 224,56,7,255,255,253,191,7,248,15,0,255,191,246,191,131
	defb 252,7,128,127,143,254,255,131,252,3,192,127,143,254,63,135
	defb 248,15,128,255,15,249,252,127,192,60,7,248,191,252,159,240
	defb 7,129,254,219,254,15,252,3,192,127,205,255,135,254,0,240
	defb 63,249,255,135,254,0,13,255,199,254,63,248,0,63,220,127
	defb 195,255,192,7,252,31,193,255,192,15,249,31,131,255,192,31
	defb 242,110,15,255,128,31,242,96,31,252,0,255,182,1,255,224
	defb 15,254,192,31,254,0,127,236,1,255,224,13,254,128,63,254
	defb 0,255,216,3,255,192,15,252,128,127,252,1,254,70,79,255
	defb 128,31,208,251,63,254,0,253,3,248,63,240,15,192,127,225
	defb 255,224,30,1,255,255,255,224,20,1,255,255,255,128,32,15
	defb 190,63,254,0,0,124,127,255,248,3,132,27,248,127,224,31
	defb 14,60,31,248,31,195,254,15,252,63,225,252,15,248,63,131
	defb 240,31,224,255,15,192,255,131,248,124,15,248,63,223,1,255
	defb 7,255,192,63,224,127,240,31,248,31,252,7,255,15,255,255
	defb 255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255
	defb 255,254,127,255,255,255,255,255,255,255,255,255,255,255,255,254
	defb 239,255,238,107,210,255,131,255,31,224,127,224,63,1,254,15
	defb 252,15,225,255,240,63,135,247,240,127,31,231,224,126,61,167
	defb 224,252,62,39,192,252,63,29,224,63,31,7,142,7,231,194
	defb 241,192,252,120,255,143,3,247,255,199,28,7,254,248,196,60
	defb 15,255,225,194,30,15,254,61,1,143,3,255,30,16,135,129
	defb 255,199,16,97,192,255,227,136,48,224,127,241,204,48,224,127
	defb 241,228,49,224,255,240,124,67,193,255,242,247,15,7,255,199
	defb 56,240,63,124,119,142,7,227,205,227,193,249,242,249,224,124
	defb 124,63,192,252,124,175,129,248,123,159,3,241,254,124,31,135
	defb 179,192,124,63,62,7,195,243,224,252,126,126,15,135,223,129
	defb 240,63,240,126,129,252,31,192,127,7,240,63,129,252,31,192
	defb 127,7,248,63,193,252,15,224,255,131,255,3,254,63,224,127
	defb 239,252,255,255,201,255,240,119,247,252,15,255,248,31,255,229
	defb 63,255,200,127,255,128,255,255,33,255,254,67,255,252,135,255
	defb 216,15,255,248,15,255,176,31,255,164,63,255,32,63,255,64
	defb 127,255,64,127,255,0,255,254,0,255,254,0,255,254,0,255
	defb 254,0,255,254,0,255,254,128,255,246,128,255,63,0,127,191
	defb 192,127,159,192,63,143,224,63,207,112,31,231,176,15,231,248
	defb 71,243,252,7,249,252,35,252,254,17,252,127,0,254,63,128
	defb 255,63,128,127,31,192,63,143,224,63,199,240,31,231,248,15
	defb 227,248,7,241,252,7,241,252,3,248,254,3,248,254,1,252
	defb 127,1,252,127,0,254,63,128,254,63,128,126,31,192,127,31
	defb 192,63,143,224,63,143,224,31,207,240,31,199,240,15,227,248
	defb 15,227,252,7,241,252,3,248,254,3,252,96,127,15,248,31
	defb 195,252,7,240,255,1,248,63,192,127,15,192,31,135,244,7
	defb 225,253,3,248,63,64,126,15,240,31,195,248,7,240,255,1
	defb 252,31,160,127,15,248,15,225,252,3,248,127,64,254,31,240
	defb 31,195,248,15,240,255,128,254,31,224,63,135,244,23,240,254
	defb 3,252,63,160,255,135,244,31,241,254,131,252,63,192,255,135
	defb 240,23,240,254,131,254,31,208,255,195,250,27,248,127,67,255
	defb 15,248,111,225,255,5,252,63,224,191,199,254,27,248,127,195
	defb 127,143,248,127,240,255,135,255,31,248,127,241,255,7,255,15
	defb 224,127,240,255,135,255,135,252,63,252,127,193,255,231,255,127
	defb 255,63,251
