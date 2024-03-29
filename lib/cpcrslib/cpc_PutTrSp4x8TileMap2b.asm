; ******************************************************
; **       Librer�a de rutinas para Amstrad CPC       **
; **	   Ra�l Simarro, 	  Artaburu 2007           **
; ******************************************************

; [na_th_an] Modificada por Mojon Twins - eliminamos la "cabecera" de los sprites.
; [na_th_an] Gracias a Fran Gallego y al c�digo de la CPCTelera, rescrito para usar LUTs
; Necesita una LUT en $FE00

XLIB cpc_PutTrSp4x8TileMap2b

XREF tiles_tocados
XREF pantalla_juego	
XREF posiciones_super_buffer
XREF tiles
XREF ancho_pantalla_bytes 
XREF posicion_inicial_superbuffer

.cpc_PutTrSp4x8TileMap2b

	;seg�n las coordenadas x,y que tenga el sprite, se dibuja en el buffer 
    ex de,hl	;4
    LD IXH,d	;9
    LD IXL,e	;9 

	;lo cambio para la rutina de multiplicar 
    ld e,(ix+8)		;X en bytes! (0-63)
    ld h,(ix+9)		;Y

.pasa_bloque_a_sbuffer

.transferir_sprite
	ld d,0

	; Multiplico HL = H * 64, offset "Y"
	ld  l, 0
	srl h
	rr  l
	srl h
	rr  l
	
	add hl,de 		; sumo offset "X"

	ld de,posicion_inicial_superbuffer
	add hl,de

	;hl apunta a la posici�n en buffer (destino)
			
	ld e,(ix+0)
    ld d,(ix+1)	;de apunta al sprite

.sp_buffer_mask
    ld ixh,8
	ex de,hl 		; de -> bg
	ld b, h
	ld c, l 		; bc -> sprite

.loop_alto_map_sbuffer
	ld h, $FE		; hl -> LUT

	; El ancho est� desenrollado: Hay que procesar y copiar 2 bytes.

	ld a, (bc) 		; Get sprite
	ld l, a 		; copy to L to index LUT
	ld a, (de) 		; Get bg
	and (hl) 		; make a hole
	or l  			; draw pixels
	ld (de), a 		; save BG
	inc de
	inc bc

	ld a, (bc) 		; Get sprite
	ld l, a 		; copy to L to index LUT
	ld a, (de) 		; Get bg
	and (hl) 		; make a hole
	or l  			; draw pixels
	ld (de), a 		; save BG
	inc de
	inc bc

	;*************************************************		
		
	dec ixh
	ret z

	; de += 62 (next line in bg)
	ld hl, 62
	add hl, de
	ex de, hl

	jp loop_alto_map_sbuffer
