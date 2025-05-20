// MTE MK1 v4.11
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// Substitute with beepola stuff or whatever you like.

#asm
	; The Music Box Player Engine
	; Based on code written by Mark Alexander for the utility, The Music 
	; Modified by Chris Cowley
	; Produced by Beepola v1.08.01

	; Adapted for MTE MK1 v4 by na_th_an

	.musicstart
		LD    HL,MUSICDATA         ;  <- Pointer to Music Data. Change
								 ;     this to play a different song
		LD   A,(HL)                         ; Get the loop start pointer
		LD   (PATTERN_LOOP_BEGIN),A
		INC  HL
		LD   A,(HL)                         ; Get the song end pointer
		LD   (PATTERN_LOOP_END),A
		INC  HL
		LD   (PATTERNDATA1),HL
		LD   (PATTERNDATA2),HL
		LD   A,254
		LD   (PATTERN_PTR),A                ; Set the pattern pointer to zero
		CALL  NEXT_PATTERN

	.NEXTNOTE
		CALL  PLAYNOTE
		XOR   A
		IN    A,($FE)
		AND   $1F
		CP    $1F
		JR    Z,NEXTNOTE                    ; Play next note if no key pressed

		RET                                 ; Return from playing tune

	.PATTERN_PTR
		DEFB 0
	.NOTE_PTR
		DEFB 0

	.NEXT_PATTERN
		LD   A,(PATTERN_PTR)
		INC  A
		INC  A
		DEFB $FE                           ; CP n
	.PATTERN_LOOP_END
		DEFB 0
		JR   NZ,NO_PATTERN_LOOP
		DEFB $3E                           ; LD A,n
	.PATTERN_LOOP_BEGIN
		DEFB 0
	.NO_PATTERN_LOOP
		LD   (PATTERN_PTR),A
		DEFB $21                            ; LD HL,nn
	.PATTERNDATA1
	    DEFW $0000
		LD   E,A                            ; (this is the first byte of the pattern)
		LD   D,0                            ; and store it at TEMPO
		ADD  HL,DE
		LD   E,(HL)
		INC  HL
		LD   D,(HL)
		LD   A,(DE)                         ; Pattern Tempo -> A
		LD   (TEMPO),A                      ; Store it at TEMPO

		LD   A,1
		LD   (NOTE_PTR),A

	.PLAYNOTE
		DEFB $21                            ; LD HL,nn
	.PATTERNDATA2
		DEFW $0000
		LD   A,(PATTERN_PTR)
		LD   E,A
		LD   D,0
		ADD  HL,DE
		LD   E,(HL)
		INC  HL
		LD   D,(HL)                         ; Now DE = Start of Pattern data
		LD   A,(NOTE_PTR)
		LD   L,A
		LD   H,0
		ADD  HL,DE                          ; Now HL = address of note data
		LD   D,(HL)
		LD   E,1

	; IF D = $0 then we are at the end of the pattern so increment PATTERN_PTR by 2 and set NOTE_PTR=0
		LD   A,D
		AND  A                              ; Optimised CP 0
		JR   Z,NEXT_PATTERN

		PUSH DE
		INC  HL
		LD   D,(HL)
		LD   E,1

		LD   A,(NOTE_PTR)
		INC  A
		INC  A
		LD   (NOTE_PTR),A                   ; Increment the note pointer by 2 (one note per chan)

		POP  HL                             ; Now CH1 freq is in HL, and CH2 freq is in DE

		LD   A,H
		DEC  A
		JR   NZ,OUTPUT_NOTE

		LD   A,D                            ; executed only if Channel 2 contains a rest
		DEC  A                              ; if DE (CH1 note) is also a rest then..
		JR   Z,PLAY_SILENCE                 ; Play silence

	.OUTPUT_NOTE
		LD   A,(TEMPO)
		LD   C,A
		LD   B,0
		XOR  A
		EX   AF,AF
		XOR  7
		LD   IXH,D
		LD   D,$10
	.EAE5
		NOP
		NOP
	.EAE7
		EX   AF,AF
		DEC  E
		OUT  ($FE),A
		JR   NZ,EB04

		LD   E,IXH
		XOR  D
		EX   AF,AF
		DEC  L
		JP   NZ,EB0B

	.EAF5
		OUT  ($FE),A
		LD   L,H
		XOR  D
		DJNZ EAE5

		INC  C
		JP   NZ,EAE7

		RET

	.EB04
		JR   Z,EB04
		EX   AF,AF
		DEC  L
		JP   Z,EAF5
	.EB0B
		OUT  ($FE),A
		NOP
		NOP
		DJNZ EAE5
		INC  C
		JP   NZ,EAE7
		xor a
		OUT  ($FE),A
		RET

	.PLAY_SILENCE
		XOR a
		OUT  ($FE),A
		LD   A,(TEMPO)
		CPL
		LD   C,A
	.SILENCE_LOOP2
		PUSH BC
		PUSH AF
		LD   B,0
	.SILENCE_LOOP
		PUSH HL
		LD   HL,0000
		SRA  (HL)
		SRA  (HL)
		SRA  (HL)
		NOP
		POP  HL
		DJNZ SILENCE_LOOP
		DEC  C
		JP   NZ,SILENCE_LOOP
		POP  AF
		POP  BC
		RET

	; *** DATA ***
	.TEMPO
		DEFB 232

	.MUSICDATA
		DEFB 0   ; Loop start point * 2
        DEFB 8   ; Song Length * 2
	.PATTERNDATA
		DEFW      PAT0
		DEFW      PAT0
		DEFW      PAT1
		DEFW      PAT1

	; *** Pattern data consists of pairs of frequency values CH1,CH2 with a single $0 to
	; *** Mark the end of the pattern, and $01 for a rest
.PAT0
         DEFB 242  ; Pattern tempo
             DEFB 1,1
             DEFB 1,1
             DEFB 40,30
             DEFB 1,1
             DEFB 1,30
             DEFB 1,1
             DEFB 40,24
             DEFB 1,1
             DEFB 1,20
             DEFB 1,1
             DEFB 40,20
             DEFB 1,1
             DEFB 1,21
             DEFB 1,1
             DEFB 40,20
             DEFB 1,1
             DEFB 1,34
             DEFB 1,1
             DEFB 34,34
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 34,1
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 34,1
             DEFB 1,1
             DEFB 1,32
             DEFB 1,1
             DEFB 34,1
             DEFB 1,1
             DEFB 1,30
             DEFB 1,1
             DEFB 40,30
             DEFB 1,1
             DEFB 1,24
             DEFB 1,1
             DEFB 40,20
             DEFB 1,1
             DEFB 1,20
             DEFB 1,1
             DEFB 40,21
             DEFB 1,1
             DEFB 1,20
             DEFB 1,1
             DEFB 40,34
             DEFB 1,1
             DEFB 1,30
             DEFB 1,1
             DEFB 45,1
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 45,1
             DEFB 1,1
             DEFB 1,19
             DEFB 1,1
             DEFB 45,38
             DEFB 1,1
             DEFB 1,19
             DEFB 1,1
             DEFB 45,38
             DEFB 1,1
         DEFB $0
.PAT1
         DEFB 242  ; Pattern tempo
             DEFB 1,23
             DEFB 1,1
             DEFB 30,23
             DEFB 1,1
             DEFB 1,18
             DEFB 1,1
             DEFB 30,15
             DEFB 1,1
             DEFB 1,15
             DEFB 1,1
             DEFB 30,16
             DEFB 1,1
             DEFB 1,15
             DEFB 1,1
             DEFB 30,25
             DEFB 1,1
             DEFB 1,25
             DEFB 1,1
             DEFB 25,1
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 25,1
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 25,1
             DEFB 1,1
             DEFB 1,24
             DEFB 1,1
             DEFB 25,1
             DEFB 1,1
             DEFB 1,23
             DEFB 1,1
             DEFB 30,23
             DEFB 1,1
             DEFB 1,18
             DEFB 1,1
             DEFB 30,15
             DEFB 1,1
             DEFB 1,15
             DEFB 1,1
             DEFB 30,16
             DEFB 1,1
             DEFB 1,15
             DEFB 1,1
             DEFB 30,25
             DEFB 1,1
             DEFB 1,23
             DEFB 1,1
             DEFB 34,1
             DEFB 1,1
             DEFB 1,1
             DEFB 1,1
             DEFB 34,1
             DEFB 1,1
             DEFB 1,14
             DEFB 1,1
             DEFB 34,28
             DEFB 1,1
             DEFB 1,14
             DEFB 1,1
             DEFB 34,28
             DEFB 1,1
         DEFB $0
#endasm
