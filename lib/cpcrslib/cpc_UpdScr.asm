; ******************************************************
; **       Librería de rutinas para Amstrad CPC       **
; **	   Raúl Simarro, 	  Artaburu 2007       **
; ******************************************************

; Cambio radical al tema de los tiles tocados marca ACME (Actualización de 
; Código Mojona Eructo) by na_th_an

; Ahora en lugar de haber una lista de tiles tocados, tenemos un bitfield. El
; bitfield se ubica a partir de `tiles_tocados` y ocupa 96 bytes, con 1 bit 
; para cada uno de las 768 casillas.

; Ahora no se recorrerá una lista de parejas X, Y, sino que debe recorrerse el
; bitfield y ejecutarse la rutina de actualización para cada bit a 1.

XLIB cpc_UpdScr	

XREF tiles_tocados
XREF pantalla_juego
XREF posiciones_super_buffer
XREF tiles

XREF ancho_pantalla_bytes

.cpc_UpdScr

	ld  hl,tiles_tocados
	ld  b, 96
	ld  de, 0 			; (x, y) = (0, 0)

.bucle_cpc_UpdScr	
	; Unrolled
	ld  a, (hl)
	or  a
	jr  nz, process

	ld  a, e
	add 8
	ld  e, a
	jr  skipall

.process

	push bc
	push hl

	; A contains a bitfield

	bit 0, a
	jr  z, bit0_skip
	push de
	call ucopyTile
	pop de
.bit0_skip
	inc e

	bit 1, a
	jr  z, bit1_skip	
	push de
	call ucopyTile
	pop de
.bit1_skip
	inc e

	bit 2, a
	jr  z, bit2_skip	
	push de
	call ucopyTile
	pop de
.bit2_skip
	inc e

	bit 3, a
	jr  z, bit3_skip	
	push de
	call ucopyTile
	pop de
.bit3_skip
	inc e

	bit 4, a
	jr  z, bit4_skip	
	push de
	call ucopyTile
	pop de
.bit4_skip
	inc e

	bit 5, a
	jr  z, bit5_skip	
	push de
	call ucopyTile
	pop de
.bit5_skip
	inc e

	bit 6, a
	jr  z, bit6_skip	
	push de
	call ucopyTile
	pop de
.bit6_skip
	inc e

	bit 7, a
	jr  z, bit7_skip
	push de
	call ucopyTile
	pop de
.bit7_skip
	inc e

	pop hl
	pop bc

.skipall
	ld  a, e
	cp  32
	jr  nz, noincd

	inc d
	ld  e, 0

.noincd
	inc hl	

	djnz bucle_cpc_UpdScr
	ret

.ucopyTile
	; copia el tile en (x, y) = E, D.

.posicionar_superbuffer 

	LD c,D
	SLA c
	
	LD B,0
	LD HL,posiciones_super_buffer
	ADD HL,BC
	LD C,(HL)
	INC HL
	LD B,(HL)	; BC -> Inicio linea en superbuffer
	
	LD l,E
	SLA l
	LD H,0		; HL -> Columna en bytes
	
	ADD HL,BC 	; HL -> Posición en superbuffer

	push hl 	; Lo guardamos.
	
.posicionar_tile	

	; D = Y; E = X.


	ld l, d
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl

	; Aquí HL = Y * 32

	LD D,0

	; DE = X

	ADD HL,DE

	; Aquí HL = Y * 32 + X
	
	LD DE,pantalla_juego
	ADD HL,DE

	; Aquí HL apunta al tile correcto dentro
	; del nametable (pantalla_juego)
	
	LD L,(HL)
	LD H,0

	; Aquí HL contiene el número de tile en esa pos.

	ADD HL,HL
	ADD HL,HL
	ADD HL,HL
	ADD HL,HL	;X16
	LD DE,tiles
	ADD HL,DE

	; Aquí HL apunta a los gráficos del tile.
	
	pop de 		; Recuperamos la posición en el superbuffer
				; Que almacenamos antes.

	; HL -> Gráfico del tile
	; DE -> Superbuffer

.transferir_map_sbuffer	
.transferir_map_sbuffer_grey
	
	; Thanks Augusto Ruiz, Syx, Fran Gallego for the hints

	; Address is D        E
	;            -------y yyxxxxxxx

	; Gray order is 0 1 3 2 6 7 5 4

	push af

	; First row 0: DE = -------0 00xxxxxx
	ldi 
	ldi

	;       row 1: DE = -------0 01xxxxxx, copy <-
	dec e
	set 6, e
	ld  a, (hl)
	ld  (de), a
	inc hl
	dec e
	ld  a, (hl)
	ld  (de), a
	inc hl

	;       row 3: DE = -------0 11xxxxxx,
	set 7, e
	ldi
	ldi

	;       row 2: DE = -------0 10xxxxxx, copy <-
	dec de
	res 6, e
	ld  a, (hl)
	ld  (de), a
	inc hl
	dec e
	ld  a, (hl)
	ld  (de), a
	inc hl

	;       row 6: DE = -------1 10xxxxxx
	set 0, d
	ldi 
	ldi

	;       row 7: DE = -------1 11xxxxxx, copy <-
	dec e
	set 6, e
	ld  a, (hl)
	ld  (de), a
	inc hl
	dec e
	ld  a, (hl)
	ld  (de), a
	inc hl

	;       row 5: DE = -------1 01xxxxxx
	res 7, e
	ldi
	ldi

	;       row 4: DE = -------1 00xxxxxx, copy <-
	dec e
	res 6, e
	ld  a, (hl)
	ld  (de), a
	inc hl
	dec e
	ld  a, (hl)
	ld  (de), a
	;inc hl

	pop af

	ret
