; ******************************************************
; **       Librería de rutinas para Amstrad CPC       **
; **	   Raúl Simarro, 	  Artaburu 2007           **
; ******************************************************

; [na_th_an] Modificada por Mojon Twins - eliminamos la "cabecera" de los sprites.
; [na_th_an] Gracias a Fran Gallego y al código de la CPCTelera, rescrito para usar LUTs
; [na_th_an] Esta versión utiliza OR para mezclar con lo que ya haya. No necesita LUT.
; [na_th_an] Esta nueva vesión de la rutina imprime al pixel en m1

XLIB cpc_PutTrSp16x16TileMapGPxM1

XREF tiles_tocados
XREF pantalla_juego		
XREF posiciones_super_buffer
XREF ancho_pantalla_bytes 
XREF posicion_inicial_superbuffer

.cpc_PutTrSp16x16TileMapGPxM1

	;según las coordenadas x,y que tenga el sprite, se dibuja en el buffer 
    ex de,hl	;4
    LD IXH,d	;9
    LD IXL,e	;9 

	;lo cambio para la rutina de multiplicar 
    ld  e, (ix+8)		; X - Cuidado ! va a pixel (0-255)
    ld  a, e 			; Save for later!
    srl e
    srl e               ; X a bytes
    ld  h, (ix+9)		; Y

.pasa_bloque_a_sbuffer

.transferir_sprite
	ld  d, 0

	; Multiplico HL = H * 64, offset "Y"
	ld  l, d
	srl h
	rr  l
	srl h
	rr  l
	
	add hl, de 		; sumo offset "X"

	ld  de, posicion_inicial_superbuffer
	add hl,de

	;hl apunta a la posición en buffer (destino)
			
	ld e,(ix+0)
    ld d,(ix+1)	;HL apunta al sprite
	
.sp_buffer_mask
	ld ixh,16
	
	; Remember A = X in pixels
	; Select routine based upon number of rotations
	; would write self-modifying code for short but meh
	
	and 3
	jr  z, loop_alto_map_sbuffer	
	cp  1
	jr  z, loop_alto_map_sbuffer_shift1
	cp  2
	jp  z, loop_alto_map_sbuffer_shift2
	jp  loop_alto_map_sbuffer_shift3

.loop_alto_map_sbuffer
	; El ancho está desenrollado: Hay que procesar y copiar 4 bytes.

	ld a, (de) 		; Get sprite
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save BG+sprite
	inc de
	inc hl

	ld a, (de) 		; Get sprite
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save BG+sprite
	inc de
	inc hl

	ld a, (de) 		; Get sprite
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save BG+sprite
	inc de
	inc hl

	ld a, (de) 		; Get sprite
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save BG+sprite
	inc de
	inc hl
	
	;*************************************************		
		
	dec ixh
	ret z

	; de += 60 (next line in bg)
	ld bc, 60
	add hl, bc
	jp loop_alto_map_sbuffer

.loop_alto_map_sbuffer_shift1
	; El ancho está desenrollado. Procesamos 4 bytes que copiamos en 5:
	; 1: -> A'A; byte 1 = A'A AND 0x77 = 0A
	; 2: -> B'B; byte 2 = (B'B AND 0x77) OR (A'A AND 0x88) = A'B
	; 3: -> C'C; byte 3 = (C'C AND 0x77) OR (B'B AND 0x88) = B'C
	; 4: -> D'D; byte 4 = (D'D AND 0x77) OR (C'C AND 0x88) = C'D
	; 5:       ; byte 5 = D'D AND 0x88  

	; 1: -> A'A; byte 1 = A'A AND 0x77 = 0A
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right once 76543210 -> 47650321

	                ; A = 76543210
	rrca            ; A = 07654321
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     x   x
	rrca            ; A = 43210765
	xor c           ; A = 4^7 3^6 2^5 1^4 0^3 7^2 6^1 5^0
	and $88         ; A = 4^7 0 0 0 0^3 0 0 0
	xor c           ; A = 47650321!

	ld  c, a 		; Save for next byte

	and 0x77 		; Mask
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de			; Next sprite addr
	inc hl			; Next buffer addr

	; 2: -> B'B; byte 2 = (B'B AND 0x77) OR (A'A AND 0x88) = A'B

	ld  a, c 		; A'A
	and $88 		; A'
	ld  b, a 		; B = A'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right once 76543210 -> 47650321

	                ; A = 76543210
	rrca            ; A = 07654321
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     x   x
	rrca            ; A = 43210765
	xor c           ; A = 4^7 3^6 2^5 1^4 0^3 7^2 6^1 5^0
	and $88         ; A = 4^7 0 0 0 0^3 0 0 0
	xor c           ; A = 47650321!

	ld  c, a 		; Save for next byte

	and 0x77 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 3: -> C'C; byte 3 = (C'C AND 0x77) OR (B'B AND 0x88) = B'C

	ld  a, c 		; B'B
	and $88 		; B'
	ld  b, a 		; IYL = B'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right once 76543210 -> 47650321

	                ; A = 76543210
	rrca            ; A = 07654321
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     x   x
	rrca            ; A = 43210765
	xor c           ; A = 4^7 3^6 2^5 1^4 0^3 7^2 6^1 5^0
	and $88         ; A = 4^7 0 0 0 0^3 0 0 0
	xor c           ; A = 47650321!

	ld  c, a 		; Save for next byte

	and 0x77 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 4: -> D'D; byte 4 = (D'D AND 0x77) OR (C'C AND 0x88) = C'D

	ld  a, c 		; C'C
	and $88 		; C'
	ld  b, a 		; IYL = C'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right once 76543210 -> 47650321

	                ; A = 76543210
	rrca            ; A = 07654321
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     x   x
	rrca            ; A = 43210765
	xor c           ; A = 4^7 3^6 2^5 1^4 0^3 7^2 6^1 5^0
	and $88         ; A = 4^7 0 0 0 0^3 0 0 0
	xor c           ; A = 47650321!

	ld  c, a 		; Save for next byte

	and 0x77 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 5:       ; byte 5 = D'D AND 0x88  

	ld  a, c 		; D'D
	and $88 		; D'

	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite

	dec ixh
	ret z

	; de += 60 (next line in bg)
	ld bc, 60
	add hl, bc

	jp loop_alto_map_sbuffer_shift1

.loop_alto_map_sbuffer_shift2

	; El ancho está desenrollado. Procesamos 4 bytes que copiamos en 5:
	; 1: -> A'A; byte 1 = A'A AND 0x33 = 0A
	; 2: -> B'B; byte 2 = (B'B AND 0x33) OR (A'A AND 0xCC) = A'B
	; 3: -> C'C; byte 3 = (C'C AND 0x33) OR (B'B AND 0xCC) = B'C
	; 4: -> D'D; byte 4 = (D'D AND 0x33) OR (C'C AND 0xCC) = C'D
	; 5:       ; byte 5 = D'D AND 0xCC  

	; 1: -> A'A; byte 1 = A'A AND 0x33 = 0A
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right twice 76543210 -> 54761032

	                ; A = 76543210
	rrca 
	rrca            ; A = 10765432     xx__xx__
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     xx  xx
	rrca            ; A = 54321076
	xor c           ; A = 5^1 4^0 3^7 2^6 1^5 0^4 7^3 6^2
	and $CC         ; A = 5^1 4^0 0 0 1^5 0^4 0 0
	xor c           ; A = 54761032

	ld  c, a 		; Save for next byte

	and 0x33 		; Mask
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 2: -> B'B; byte 2 = (B'B AND 0x33) OR (A'A AND 0xCC) = A'B

	ld  a, c 		; A'A
	and $CC 		; A'
	ld  b, a 		; IYL = A'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right twice 76543210 -> 54761032

	                ; A = 76543210
	rrca 
	rrca            ; A = 10765432     xx__xx__
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     xx  xx
	rrca            ; A = 54321076
	xor c           ; A = 5^1 4^0 3^7 2^6 1^5 0^4 7^3 6^2
	and $CC         ; A = 5^1 4^0 0 0 1^5 0^4 0 0
	xor c           ; A = 54761032

	ld  c, a 		; Save for next byte

	and 0x33 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 3: -> C'C; byte 3 = (C'C AND 0x33) OR (B'B AND 0xCC) = B'C

	ld  a, c 		; B'B
	and $CC 		; B'
	ld  b, a 		; IYL = B'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right twice 76543210 -> 54761032

	                ; A = 76543210
	rrca 
	rrca            ; A = 10765432     xx__xx__
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     xx  xx
	rrca            ; A = 54321076
	xor c           ; A = 5^1 4^0 3^7 2^6 1^5 0^4 7^3 6^2
	and $CC         ; A = 5^1 4^0 0 0 1^5 0^4 0 0
	xor c           ; A = 54761032

	ld  c, a 		; Save for next byte

	and 0x33 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 4: -> D'D; byte 4 = (D'D AND 0x33) OR (C'C AND 0xCC) = C'D

	ld  a, c 		; C'C
	and $CC 		; C'
	ld  b, a 		; IYL = C'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right twice 76543210 -> 54761032

	                ; A = 76543210
	rrca 
	rrca            ; A = 10765432     xx__xx__
	ld  c, a        ; A = 07654321 C = 07654321
	rrca
	rrca
	rrca            ;     xx  xx
	rrca            ; A = 54321076
	xor c           ; A = 5^1 4^0 3^7 2^6 1^5 0^4 7^3 6^2
	and $CC         ; A = 5^1 4^0 0 0 1^5 0^4 0 0
	xor c           ; A = 54761032

	ld  c, a 		; Save for next byte

	and 0x33 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 5:       ; byte 5 = D'D AND 0xCC  

	ld  a, c 		; D'D
	and $CC 		; D'

	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite

	dec ixh
	ret z

	; de += 60 (next line in bg)
	ld bc, 60
	add hl, bc

	jp loop_alto_map_sbuffer_shift2


.loop_alto_map_sbuffer_shift3

	; El ancho está desenrollado. Procesamos 4 bytes que copiamos en 5:
	; 1: -> A'A; byte 1 = A'A AND 0x11 = 0A
	; 2: -> B'B; byte 2 = (B'B AND 0x11) OR (A'A AND 0xEE) = A'B
	; 3: -> C'C; byte 3 = (C'C AND 0x11) OR (B'B AND 0xEE) = B'C
	; 4: -> D'D; byte 4 = (D'D AND 0x11) OR (C'C AND 0xEE) = C'D
	; 5:       ; byte 5 = D'D AND 0xEE  

	; 1: -> A'A; byte 1 = A'A AND 0x11 = 0A
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right thrice 76543210 -> 65472103

	                ; A = 76543210
	rlca            ; A = 65432107     ___x___x
	ld  c, a        ; A = 65432107 C = 65432107
	rlca
	rlca
	rlca            ;        x   x   
	rlca            ; A = 21076543
	xor c           ; A = 2^6 1^5 0^4 7^3 6^2 5^1 4^0 3^7
	and $11         ; A = 0 0 0 7^3 0 0 0 3^7
	xor c           ; A = 65472103

	ld  c, a 		; Save for next byte

	and 0x11 		; Mask
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 2: -> B'B; byte 2 = (B'B AND 0x11) OR (A'A AND 0xEE) = A'B

	ld  a, c 		; A'A
	and $EE 		; A'
	ld  b, a 		; IYL = A'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right thrice 76543210 -> 65472103

	                ; A = 76543210
	rlca            ; A = 65432107     ___x___x
	ld  c, a        ; A = 65432107 C = 65432107
	rlca
	rlca
	rlca            ;        x   x   
	rlca            ; A = 21076543
	xor c           ; A = 2^6 1^5 0^4 7^3 6^2 5^1 4^0 3^7
	and $11         ; A = 0 0 0 7^3 0 0 0 3^7
	xor c           ; A = 65472103
	ld  c, a 		; Save for next byte

	and 0x11 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 3: -> C'C; byte 3 = (C'C AND 0x11) OR (B'B AND 0xEE) = B'C

	ld  a, c 		; B'B
	and $EE 		; B'
	ld  b, a 		; IYL = B'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right thrice 76543210 -> 65472103

	                ; A = 76543210
	rlca            ; A = 65432107     ___x___x
	ld  c, a        ; A = 65432107 C = 65432107
	rlca
	rlca
	rlca            ;        x   x   
	rlca            ; A = 21076543
	xor c           ; A = 2^6 1^5 0^4 7^3 6^2 5^1 4^0 3^7
	and $11         ; A = 0 0 0 7^3 0 0 0 3^7
	xor c           ; A = 65472103
	ld  c, a 		; Save for next byte

	and 0x11 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 4: -> D'D; byte 4 = (D'D AND 0x11) OR (C'C AND 0xEE) = C'D

	ld  a, c 		; C'C
	and $EE 		; C'
	ld  b, a 		; IYL = C'0
	
	ld  a, (de) 	; Get Sprite byte in A

	; Now rotate nibbles right thrice 76543210 -> 65472103

	                ; A = 76543210
	rlca            ; A = 65432107     ___x___x
	ld  c, a        ; A = 65432107 C = 65432107
	rlca
	rlca
	rlca            ;        x   x   
	rlca            ; A = 21076543
	xor c           ; A = 2^6 1^5 0^4 7^3 6^2 5^1 4^0 3^7
	and $11         ; A = 0 0 0 7^3 0 0 0 3^7
	xor c           ; A = 65472103
	ld  c, a 		; Save for next byte

	and 0x11 		; Mask
	or  b 			; Combine
	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite
	inc de
	inc hl

	; 5:       ; byte 5 = D'D AND 0xEE  

	ld  a, c 		; D'D
	and $EE 		; D'

	or (hl) 		; Get bg + draw pixels
	ld (hl), a 		; save bg + masked sprite

	dec ixh
	ret z

	; de += 60 (next line in bg)
	ld bc, 60
	add hl, bc

	jp loop_alto_map_sbuffer_shift3
