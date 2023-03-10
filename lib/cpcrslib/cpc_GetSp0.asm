; ******************************************************
; **       Librer?a de rutinas para Amstrad CPC       **
; **	   Ra?l Simarro, 	  Artaburu 2007       **
; ******************************************************

XLIB cpc_GetSp0

XDEF anchox 
XDEF suma_siguiente_lineax 



.cpc_GetSp0	   
		defb $fD
   		LD H,a		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
		ld b,7
	.loop_alto_2x

	    ld c,0
		;push hl
		;ldi
	.loop_ancho_2x		
		ld A,(hl)
		ld (de),a
		inc de
		inc hl
		dec c
		jp nz,loop_ancho_2x
		;pop hl
	   defb $fD
	   dec H
	   ret z
  
.salto_lineax
		LD C,$ff			;&07f6 			;salto linea menos ancho
		ADD HL,BC
		jp nc,loop_alto_2x ;sig_linea_2zz		;si no desborda va a la siguiente linea
		ld bc,$c050
		add HL,BC
		ld b,7			;s?lo se dar?a una de cada 8 veces en un sprite
		jp loop_alto_2x			
		
DEFC anchox = loop_alto_2x
DEFC suma_siguiente_lineax = salto_lineax		