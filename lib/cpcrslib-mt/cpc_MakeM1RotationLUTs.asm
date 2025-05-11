; Rutina para crear las LUTs necesarias con las rotaciones para
; pintar sprites M1 al pixel, empleadas por las rutinas *?PxM1?LUT.

INCLUDE "CPCconfig.def"

XLIB cpc_MakeM1RotationLUTs

.cpc_MakeM1RotationLUTs

	; Primera rotación

	ld  hl, M1LUTR1

.write_lut1_loop
	ld  a, l 		; A = 76543210
	rrca			; A = 07654321
	ld  c, a 		; A = 07654321, C = 07654321
	rrca
	rrca
	rrca			;     x   x
	rrca			; A = 43210765
	xor c 			; A = 4^7 3^6 2^5 1^4 0^3 7^2 6^1 5^0
	and $88 		; A = 4^7 0 0 0 0^3 0 0 0
	xor c 			; A = 47650321!

	ld  (hl), a 
	inc l 
	jr  nz, write_lut1_loop

	; Segunda rotación

	ld  hl, M1LUTR2

.write_lut2_loop
	ld  a, l 		; A = 76543210
	rrca 			: A = 07654321
	rrca 			; A = 10765432
	ld  c, a 		; A = 10765432, C = 10765432
	rrca
	rrca
	rrca
	rrca 			; A = 54321076
	xor c 			; A = 5^1 4^0 3^7 2^6 1^5 0^4 7^3 6^2
	and $CC         ; A = 5^1 4^0 0 0 1^5 0^4 0 0
	xor c           ; A = 54761032!

	ld  (hl), a 
	inc l 
	jr  nz, write_lut2_loop

	; Tercera rotación

	ld  hl, M1LUTR3

.write_lut3_loop
	ld  a, l 		; A = 76543210
	rlca 			: A = 65432107
	ld  c, a 		; A = 65432107 C = 65432107
	rlca
	rlca
	rlca            ;        x   x
	rlca            ; A = 21076543
	xor c           ; A = 2^6 1^5 0^4 7^3 6^2 5^1 4^0 3^7 
	and $11         ; A = 0 0 0 7^3 0 0 0 3^7
	xor c           ; A = 65472103!

	ld  (hl), a 
	inc l 
	jr  nz, write_lut3_loop

	ret
