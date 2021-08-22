// Música y sonidos Churrera CPC
// =============================

extern unsigned char wyz_sound_table [];
extern unsigned char wyz_pattern_table [];
extern unsigned char wyz_effects_table [];
extern unsigned char wyz_song_table [];
extern unsigned char song_0[];
extern unsigned char song_1[];

// REMEMBER: Las canciones más largas deben descomprimirse previamente
// sobre el buffer de tiles (en $100) - (ver wyz_song_table).

#asm
	._wyz_sound_table
				defw 	_sound1, _sound2, _sound3, _sound4
		
	._wyz_pattern_table
				defw	_pattern1, _pattern2, _pattern3, _pattern4, _pattern5, _pattern6
	
	._wyz_effects_table
				defw	_effect0, _effect1, _effect2, _effect3, _effect4, _effect5, _effect6, _effect7, _effect8
	
	._wyz_song_table
				defw 	$100, $100, $100

; ***********************************************
;	Datos (sonidos, patrones, efectos y músicas)
; ***********************************************

; Sonidos:
	._sound1	defb	209,62,0,186,92,0,255
	._sound2	defb	139,46,0,232,43,8,255
	._sound3	defb	0,11,1,0,6,1,255
	._sound4	defb	186,58,0,0,102,0,162,131,0,255
	
; Patrones (o pautas):
	._pattern1	defb	47,15,10,9,8,8,7,7,7,6,6,6,6,0,129
	._pattern2	defb	76,13,12,11,10,8,7,5,6,129
	._pattern3	defb	12,9,7,9,11,9,10,10,8,10,129
	._pattern4	defb	7,8,9,9,9,9,8,6,4,5,6,6,5,4,4,5,6,6,5,4,4,140
	._pattern5	defb	79,13,3,3,9,8,2,2,5,1,129
	._pattern6	defb	6,8,9,8,7,6,129
	
; Efectos de sonido:

	; [0] Caída del salto
	._effect0	defb 	$51,$1A
				defb 	$E8,$1B
				defb 	$80,$2B
				defb 	$FF   
				
	; [1] Quitar vida
	._effect1	defb 	$25,$1C
				defb 	$30,$2E
				defb	$00,$00
				defb	$A8,$0A
				defb	$C5,$1A
				defb	$00,$00
				defb	$37,$1C
				defb	$C5,$1C
				defb	$00,$00
				defb	$25,$18
				defb	$30,$26
				defb	$FF
				
	; [2] Arrastrar en cinta
	._effect2	defb	80h,2Eh,00h
				defb	00h,0Ah,04h
				defb	FFh	
				
	; [3] Coger tesoro
	._effect3	defb	$1F,$0B
				defb	$1A,$0C
				defb	$1F,$0D
				defb	$16,$0E
				defb	$1F,$0E
				defb	$0D,$0D
				defb	$1F,$0C
				defb	$0D,$0B
				defb	$00,$00
				defb	$00,$00
				defb	$1F,$08
				defb	$1A,$09
				defb	$1F,$0A
				defb	$16,$0B
				defb	$1F,$0B
				defb	$0D,$0A
				defb	$1F,$09
				defb	$0D,$07
				defb	$00,$00
				defb	$00,$00
				defb	$1F,$06
				defb	$1A,$07
				defb	$1F,$08
				defb	$16,$08
				defb	$1F,$07
				defb	$0D,$06
				defb	$1F,$05
				defb	$FF
	
	; [4] ?
	._effect4	defb	00h,0Ch,03h
				defb	FFh	
				
	; [5] Coger vida
	._effect5	defb	$1A,$0E
				defb	$1A,$0E
				defb	$00,$00
				defb	$1A,$0A
				defb	$1A,$0A
				defb	$00,$00
				defb	$1A,$0C
				defb	$1A,$0C
				defb	$00,$00
				defb	$1A,$08
				defb	$1A,$08
				defb	$FF
				
	; [6] ?
	._effect6	defb	00h,2Ch,00h
				defb	00h,0Ah,04h
				defb	FFh	
				
	; [7] Salto largo
	._effect7	defb	$C3,$0E
				defb	$CC,$0D
				defb	$D5,$0A
				defb	$DE,$06
				defb	$35,$03
				defb	$50,$0B
				defb	$47,$0C
				defb	$3E,$08
				defb	$FF
				
	; [8] Salto alto
	._effect8	defb	$58,$0D
				defb	$50,$0B
				defb	$47,$0A
				defb	$3E,$06
				defb	$35,$03
				defb	$50,$09
				defb	$47,$0A
				defb	$3E,$07
				defb	$FF	
	
; Músicas:

	; [0] Title
	._song_0
				BINARY "sa--title.exo"
	
	; [1] Ingame
	._song_1		
				BINARY "sa--ingame.exo"
	

#endasm

/* 
"One Hundred Years"
(The Cure)

It doesn't matter if we all die
Ambition in the back of a black car
In a high building there is so much to do
Going home time
A story on the radio

Something small falls out of your mouth
And we laugh
A prayer for something better
A prayer
For something better

Please love me
Meet my mother
But the fear takes hold
Creeping up the stairs in the dark
Waiting for the death blow
Waiting for the death blow
Waiting for the death blow

Stroking your hair as the patriots are shot
Fighting for freedom on television
Sharing the world with slaughtered pigs
Have we got everything?
She struggles to get away . . .

The pain
And the creeping feeling
A little black haired girl
Waiting for Saturday
The death of her father pushing her
Pushing her white face into the mirror
Aching inside me
And turn me round
Just like the old days
Just like the old days
Just like the old days
Just like the old days

Caressing an old man
And painting a lifeless face
Just a piece of new meat in a clean room
The soldiers close in under a yellow moon
All shadows and deliverance
Under a black flag
A hundred years of blood
Crimson
The ribbon tightens round my throat
I open my mouth
And my head bursts open
A sound like a tiger thrashing in the water
Thrashing in the water
Over and over
We die one after the other
Over and over
We die one after the other
One after the other
One after the other
One after the other
One after the other

It feels like a hundred years
A hundred years
A hundred years
A hundred years
A hundred years
One hundred years 
*/
