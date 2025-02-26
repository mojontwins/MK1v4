; ******************************************************
; **       Librería de rutinas para Amstrad CPC       **
; **	   Raúl Simarro, 	  Artaburu 2009           **
; ******************************************************

; Modified by na_th_an with WASD MN ESC ENTER so I don't need
; cpc_AssignKey at all nor initialization, shaving 144 bytes

XLIB cpc_KeysData

XDEF tabla_teclas
XDEF tabla_teclas0
XDEF keymap

.cpc_KeysData

.keymap0 defs 10

.tecla_0 defw $0204

.tabla_teclas0

	defw $4404 		; LEFT     O
	defw $4308 		; RIGHT    P
	defw $4808 		; UP       Q
	defw $4820 		; DOWN     A

	defw $4580 		; BUTTON_A SPACE
	defw $4808 		; BUTTON_B Q

	defw $4801 		; KEY_AUX3 1
	defw $4802 		; KEY_AUX4 2
	
	defw $4880		; KEY_AUX1 Z
	defw $4780 		; KEY_AUX2 X

	defw $4204		; KEY_ENTER
	defw $4804		; KEY_ESC	

	defb 0

DEFC tabla_teclas = tabla_teclas0
DEFC keymap = keymap0
