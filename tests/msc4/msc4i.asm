;; MSC 4 Interpreter for MK1v4 [ZX] v0.1.20250307
;; Copyleft 2025 by The Mojon Twins

;; Preprocess to fill in symbols from zcc map file
;; Assemble resulting file to $C000 and load to extended RAM

;; z80asm -m -b msc41.asm script.asm

org $C000

;; ***************************************
;; Externals (functions & data in low ram)
;; ***************************************

;; PRINTER
;; =======
	;defc _attr                  @@_ATTR
	;defc _qtile                 @@_QTILE
	;defc _draw_coloured_tile    @@_DRAW_COLOURED_TILE
	;defc _set_map_tile          @@_SET_MAP_TILE
	;defc _msc_extern            @@_MSC_EXTERN 
	;defc _espera_activa         @@_ESPERA_ACTIVA 

;; DATA
;; ====
	;defc _player                @@_PLAYER 
	;defc _flags                 @@_FLAGS 
	;defc _n_pant                @@_N_PANT 
	;defc _map_attr              @@_MAP_ATTR 
	;defc _map_buff              @@_MAP_BUFF 
	;defc _set_fire_zone         @@_SET_FIRE_ZONE 
	;defc _scenery_info          @@_SCENERY_INFO

;; COMMUNICATION
;; ============= 
	;defc _script_result         @@_SCRIPT_RESULT 
	;defc _script_something_done @@_SCRIPT_SOMETHING_DONE 

;; SCRIPTS 
;; =======
XREF scripts_e 
XREF scripts_f 
XREF script_get_coin
XREF script_kill_enemy
XREF script_e_any
XREF script_e_game
XREF script_f_any

;; **************************
;; Main routine / entry point
;; **************************

;; Main interpreter.
;  A: script type
;     0: ENTERING 
;     1: PRESS_FIRE 
;     2: PLAYER_GETS_COIN
;     3: PLAYER_KILLS_ENEMY
;  B: screen number.
;     FF: ANY (for ENTERING / PRESS_FIRE)
;     FE: GAME (for ENTERING)

.msc 

	;; First, make a script pointer
	cp  0 
	jr  z, mk_entering_pointer
	cp  1
	jr  z, mk_fire_pointer
	cp  2
	jr  z, mk_getcoin_pointer
	cp  3
	jr  z, mk_killenemy_pointer
	ret 

.mk_entering_pointer 
	ld  a, b 
	cp  $FE 				; Entering game
	jr  nz, mk_e_p_0
	ld  hl, script_e_game 
	jr  mk_pointer 

.mk_e_p_0
	cp  $FF
	jr  nz, mk_e_p_1
	ld  hl, script_e_any 
	jr  mk_pointer 

.mk_e_p_1

	ld  hl, scripts_e 
	jr  mk_screen_pointer 

.mk_fire_pointer 
	ld  hl, scripts_f 
	jr  mk_screen_pointer 


.mk_pointer 
	ld  (script), hl 

.run_script
	call read_byte

	ret 

.set_break_and_ret 
	ld  a, 1 
	ld  (sc_terminado), a 
	ret 

;; **********
;; Conditions
;; **********

;; IF a = b  
;; 14 v1 v2 
.c_opcode_14
	call read_vbyte 
	ld  b, a 				; Save for later 
	call read_vbyte 
	cp  b
	jr  nz, set_break_and_ret
	ret 

;; IF a < b 
;; 15 v1 v2
.c_opcode_15
	call read_vbyte 
	ld  c, a 				; Save for later 
	call read_vbyte 
	ld  b, a 
	ld  a, c 
	cp  b
	jr  nc, set_break_and_ret
	ret 

;; IF a >= b 
;; 16 v1 v2
.c_opcode_16
	call read_vbyte 
	ld  c, a 				; Save for later 
	call read_vbyte 
	ld  b, a 
	ld  a, c 
	cp  b
	jr  c, set_break_and_ret
	ret 	
	
;; IF a <> b
;; 17 v1 v2 
.c_opcode_17
	call read_vbyte 
	ld  b, a 				; Save for later 
	call read_vbyte 
	cp  b
	jr  z, set_break_and_ret
	ret 

;; IF TRUE
;; F0 
.c_opcode_F0
	ret 

;; *******
;; Actions
;; *******

;; SET FLAG x = n 
;; 01 x n 
.c_opcode_01 
	call read_i_v 			; HL -> FLAGS[X], A -> Value 
	ld  (hl), a 
	ret 

;; INC FLAG x, n 
;; 10 x n 
.c_opcode_10 
	call read_i_v 			; HL -> FLAGS[X], A -> Value 
	ld  b, (hl)  			; B = FLAGS[X]
	add a 
	ld  (hl), a 
	ret 

;; DEC FLAG x, n
;; 11 x n 
.c_opcode_11
	call read_i_v 			; HL -> FLAGS[X], A -> Value 
	ld  b, (hl) 			; B = FLAGS[X]
	sub a 
	ld  (hl), a 
	ret 

;; ADD FLAGS x, y 
;; 12 x y 
	call read_i_v 			; HL -> FLAGS[X], A -> Y
	push hl 
	ld  d, (hl) 			; D = FLAGS[X]
	ld  b, 0 
	ld  c, a 
	ld  hl, _flags 
	add hl, bc 				; HL -> FLAGS[Y]
	ld  a, (hl) 
	add d 
	pop hl 
	ld  (hl), a 
	ret

;; SUB FLAGS x, y 
;; 13 x y 
	call read_i_v 			; HL -> FLAGS[X], A -> Y
	push hl 
	ld  d, (hl) 			; D = FLAGS[X]
	ld  b, 0 
	ld  c, a 
	ld  hl, _flags 
	add hl, bc 				; HL -> FLAGS[Y]
	ld  e, (hl) 			; E = FLAGS[Y]
	ld  a, d                ; A = FLAGS[X]
	sub e                   ; A = FLAGS[X] - FLAGS[Y]
	pop hl 
	ld  (hl), a 
	ret

;; SWAP FLAGS x, y 
	call read_vbyte  		; Read flag index
	ld  c, a 
	ld  b, 0 
	ld  hl, _flags 
	add hl, bc 				; HL -> FLAGS[X]
	push hl 

	call read_vbyte  		; Read flag index
	ld  c, a 
	ld  b, 0 
	ld  hl, _flags 
	add hl, bc  			; HL -> FLAGS[Y]
	pop de   				; DE -> FLAGS[X]

	ld  b, (hl)
	ld  a, (de)
	ld  (hl), a
	ld  a, b 
	ld  (de), a
	ret



;; ******************
;; Auxiliary routines
;; ******************

;; Reads a byte from pointer, inc pointer, return value in A
.read_byte
	ld  hl, (script)
	ld  a, (hl) 
	inc hl 
	ld  (script), hl
	ret 

;; Reads a value (may be recursive flag), inc pointer, return value in A
;; New flags encoding is $FF means next value is flag (can be $FF, etc)
.read_vbyte
	call read_byte 
	cp  0xff 
	jr  z, read_vbyte_rec
	ret 

.read_vbyte_rec
	call read_vbyte 
	ld  d, 0 
	ld  e, a 
	ld  hl, _flags 
	add hl, de 
	ld  a, (hl)
	ret 

.read_x_y 
	call read_vbyte 
	ld  (sc_x), a 
	call read_vbyte
	ld  (sc_y), a 
	ret 

;; Read flag index and value, returns pointer in HL and value in A.
.read_i_v
	call read_vbyte  		; Read flag index
	ld  c, a 
	ld  b, 0 
	call read_vbyte 		; Read value
	ld  hl, _flags
	add hl, bc  			; HL -> FLAGS[X]
	ret

;; *********
;; Variables
;; *********

; Current script pointer 
.script         defw 0

; Coordinate pair 
.sc_x           defb 0 
.sc_y           defb 0

; Control 
.sc_terminado   defb 0 

;; REMOVE 
._flags defs 128