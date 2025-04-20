defc PLAYER_LIFE=99 ;; Find a way to solve this

; Import. We need this:
XREF _flags
XREF _n_pant
XREF _gpx
XREF _gpy
XREF _player
XREF _attr_2
XREF qtile_do
XREF set_map_tile_do
XREF __x
XREF __y
XREF __t
XREF __n
XREF _comportamiento_tiles
XREF _map_attr
XREF _peta_el_beeper
XREF _cpc_UpdateNow
XREF _do_extern_action

XDEF _script_do
XDEF _script_n
XDEF _script_result

._script_n
	defw 0
._script_result
	defb 0

; Script pointer
.script
	defw 0

; Skip to next clausule
.skip
	defw 0

; Coordinate pair 
.sc_x
	defb 0 
.sc_y
	defb 0

; Control 
.sc_terminado
	defb 0

._script_do

	; Point to offset in script index
	ld  hl, (_script_n)
	add hl, hl
	ld  bc, script_bytecode
	add hl, bc

	; Read offset
	ld  a, (hl)
	inc hl 
	ld  h, (hl)
	ld  l, a 

	;  If zero do abort
	or  h 
	ret z

	; Make & store pointer
	add hl, bc
	ld  (script), hl

.script_loop
	; Calculate address of next clausule

	;ld  hl, (script)
	push hl 

	call read_byte 		; A = clausule size
	ld  b, 0 
	ld  c, a 

	pop hl 
	add hl, bc 
	ld  (skip), hl	

; Process conditions
.script_clausule
	call read_byte 		;A = opcode

	; If we get to 0xFF (THEN), jump to actions
	cp  0xFF
	jp  z, script_actions

	;;; Decode OPCODE & jump to interpreter
	
	;; IF A = B
	cp  0x01
	jr  nz, copcode_01_end
.copcode_01
	call read_vbyte
	ld  b, a
	call read_vbyte
	cp  b
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_01_end

	;; IF A < B
	cp  0x02
	jr  nz, copcode_02_end
.copcode_02
	call read_vbyte
	ld  c, a
	call read_vbyte
	ld  b, a
	ld  a, c
	cp  b
	jp  nc, skip_clausule
	jp  script_clausule
.copcode_02_end

	;; IF A >= B
	cp  0x03
	jr  nz, copcode_03_end
.copcode_03
	call read_vbyte
	ld  c, a
	call read_vbyte
	ld  b, a
	ld  a, c
	cp  b
	jp  c, skip_clausule
	jp  script_clausule
.copcode_03_end

	;; IF A <> B
	cp  0x04
	jr  nz, copcode_04_end
.copcode_04
	call read_vbyte
	ld  b, a
	call read_vbyte
	cp  b
	jp  z, skip_clausule
	jp  script_clausule
.copcode_04_end

	;; IF PLAYER IN_X (X1, X2)
	cp  0x21
	jr  nz, copcode_21_end
.copcode_21
	;; gpx < X1 -> exit
	call read_vbyte
	ld  c, a 
	ld  a, (_gpx)
	cp  c
	jp  c, skip_clausule
	;; X2 < gpx -> exit
	ld  a, (_gpx)
	ld  c, a 
	call read_vbyte
	cp  c
	jp  c, skip_clausule
	jp  script_clausule
.copcode_21_end

	;; IF PLAYER IN_Y (Y1, Y2)
	cp  0x22
	jr  nz, copcode_22_end
.copcode_22
	;; gpy < Y1 -> exit
	call read_vbyte
	ld  c, a 
	ld  a, (_gpy)
	cp  c
	jp  c, skip_clausule
	;; Y2 < gpy -> exit
	ld  a, (_gpy)
	ld  c, a 
	call read_vbyte
	cp  c
	jp  c, skip_clausule
	jp  script_clausule
.copcode_22_end

	;; IF PLAYER AT (X, Y)
	cp  0x23
	jr  nz, copcode_23_end
.opcode23
	;; (gpx + 8) >> 4 != X -> exit
	ld  a, (_gpx)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld  a, c
	call read_vbyte
	cp  c 
	jp  nz, skip_clausule
	;; (gpy + 8) >> 4 != Y -> exit
	ld  a, (_gpy)
	add 8
	srl a
	srl a
	srl a
	srl a
	ld  a, c
	call read_vbyte
	cp  c 
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_23_end

	;; IF PLAYER FALLING
	cp  0x24
	jr  nz, copcode_24_end
.copcode_24
	;; Player falling if not possee
	ld  a, (_player + 26) 	; player.possee
	or  a
	jp  z, skip_clausule
	jp  script_clausule
.copcode_24_end

	;; IF PLAYER NOT FALLING
	cp  0x25
	jr  nz, copcode_25_end
.copcode_25
	;; Player not falling if possee
	ld  a, (_player + 16)	; player.possee
	or  a
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_25_end

	;; PLAYER_STILL
	cp  0x26
	jr  nz, copcode_26_end
.copcode_26
	ld  a, (_player + 6) 	; player.vx LSB
	ld  hl, (_player + 7)	; player.vx MSB
	or  (hl)
	ld  hl, (_player + 8) 	; player.vy LSB
	or  (hl)
	ld  hl, (_player + 9) 	; player.vy MSB
	or  (hl)
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_26_end

	;; TILE AT (X, Y) = T
	cp  0x30
	jr  nz, copcode_30_end
.copcode_30
	call read_x_y
	ld  a, (sc_x)
	ld  c, a
	ld  a, (sc_y)
	call _attr_2
	ld  c, l 
	call read_vbyte
	cp  c
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_30_end

	;; BEH AT (X, Y) = T
	cp  0x31
	jr  nz, copcode_31_end
.copcode_31
	call read_x_y
	ld  a, (sc_x)
	ld  c, a
	ld  a, (sc_y)
	call qtile_do
	ld  c, l 
	call read_vbyte
	cp  c
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_31_end

	;; UNKNOWN

	jp  script_clausule

.skip_clausule
	ld  hl, (skip)
	ld  (script), hl
	jp  script_loop

; Process actions
.script_actions
	call read_byte 		;A = opcode

	; If we get to 0xFF (END), exit
	cp  0xFF
	ret z

	;;; Decode OPCODE & jump to interpreter
	;;; TODO : point HL to special vars in assigns

	;; FLAGS[N] = V
	cp  0x00
	jr  nz, aopcode_00_end
.aopcode_00
	call read_i_v		; HL -> FLAGS[N], A -> V
	ld  (hl), a
	jp  script_actions
.aopcode_00_end

	;; FLAGS[N] += V
	cp  0x01
	jr  nz, aopcode_01_end
.aopcode_01
	call read_i_v		; HL -> FLAGS[N], A -> V
	ld  b, (hl)
	add a 
	ld  (hl), a
	jp  script_actions
.aopcode_01_end

	;; FLAGS[N] -= V
	cp  0x02
	jr  nz, aopcode_02_end
.aopcode_02
	call read_i_v		; HL -> FLAGS[N], A -> V
	ld  b, (hl)
	sub a 
	ld  (hl), a
	jp  script_actions
.aopcode_02_end

	;; SET TILE (X, Y) = T
	cp  0x20
	jr  nz, aopcode_20_end
.aopcode_20
	call read_x_y
	call read_vbyte 
	
	; set_map_tile_do needs
	; _x, _y -> coordinates,
	; _t -> tile number, 
	; _n -> tile beh
	ld  (__t), a 
	ld  b, 0
	ld  c, a 
	ld  hl, _comportamiento_tiles 
	add hl, bc 
	ld  a, (hl)
	ld  (__n), a
	ld  a, (sc_x)
	ld  (__x), a
	ld  c, a 
	ld  a, (sc_y)
	ld  (__y), a 
	call set_map_tile_do
	jp  script_actions
.aopcode_20_end

	;; SET BEH (X, Y) = B
	cp  0x21
	jr  nz, aopcode_21_end
.aopcode_21
	call read_x_y 
	ld  a, (sc_x)
	ld  c, a 
	ld  a, (sc_y)
	ld  b, a 
	sla a 
	sla a 
	sla a
	sla a 
	sub b 
	add c
	ld  b, 0
	ld  c, a
	call read_vbyte
	ld  hl, _map_attr
	add hl, bc 
	ld  (hl), a
	jp  script_actions
.aopcode_21_end

	;; SOUND N
	cp  0xE0
	jr  nz, aopcode_E0_end
.aopcode_E0
	call read_vbyte
	ld  h, 0
	ld  l, a 
	call _peta_el_beeper
	jp  script_actions
.aopcode_E0_end

	;; SHOW
	cp  0xE1
	jr  nz, aopcode_E1_end
.aopcode_E1
	ld  hl, 1
	push hl 
	call _cpc_UpdateNow
	pop bc
	jp  script_actions
.aopcode_E1_end

	;; RECHARGE
	cp  0xE2
	jr  nz, aopcode_E2_end
.aopcode_E2
	ld  a, PLAYER_LIFE
	ld  (_player + 29), a 	; player.life LSB
	xor a 
	ld  (_player + 30), a 	; player.life MSB
	jp script_actions
.aopcode_E2_end

	;; EXTERN N M
	cp  0xE4
	jr  nz, aopcode_E4_end
.aopcode_E4
	call read_x_y
	ld  a, (sc_x)
	ld  h, 0
	ld  l, a 
	push hl
	ld  a, (sc_y)
	ld  h, 0
	ld  l, a 
	push hl
	call _do_extern_action
	pop bc
	pop bc
	jp script_actions
.aopcode_E4_end

	;; PAUSE N
	cp  0xE5
	jr  nz, aopcode_E5_end
.aopcode_E5
	call read_vbyte
	ld  b, a
.aopcode_E5_loop
	halt
	djnz aopcode_E5_loop
	jp script_actions
.aopcode_E5_end

	;; WIN GAME
	cp  0xf0 
	jr  nz, aopcode_F0_end
.aopcode_F0
	ld  a, 1
	ld  (_script_result), a
	ret
.aopcode_F0_end

	;; GAME OVER
	cp  0xf1 
	jr  nz, aopcode_F1_end
.aopcode_F1
	ld  a, 2
	ld  (_script_result), a
	ret
.aopcode_F1_end

	;; BREAK
	cp  0xf2
	jr  nz, aopcode_F2_end
.aopcode_F2
	ret
.aopcode_F2_end

	;; UNKNOWN
	jp script_actions

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

	;; Special
	cp  0xFE
	jr  z, rvb_set_n_pant
	cp  0xFD
	jr  z, rvb_set_gpx
	cp  0xFC
	jr  z, rvb_set_gpy
	cp  0xFB
	jr  z, rvb_set_player_killed
	cp  0xFA
	jr  z, rvb_set_player_objs
	cp  0xF9
	jr  z, rvb_set_player_life
	
	ld  d, 0 
	ld  e, a 
	ld  hl, _flags 
	add hl, de 
	ld  a, (hl)
	ret 

.rvb_set_n_pant 
	ld  a, (_n_pant)
	ret
.rvb_set_gpx
	ld  a, (_gpx)
	ret
.rvb_set_gpy
	ld  a, (_gpy)
	ret
.rvb_set_player_killed
	ld  a, (_player + 32) 	; player.killed
	ret
.rvb_set_player_objs
	ld  a, (_player + 27) 	; player.objs
	ret
.rvb_set_player_life
	ld  a, (_player + 29) 	; player.life MSB
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
	call read_vbyte 		; Read value
	ld  (sc_y), a 
	
	ld  a, c  				; C = flag index
	;; Special
	cp  0xFE
	jr  z, riv_set_n_pant
	cp  0xFD
	jr  z, riv_set_gpx
	cp  0xFC
	jr  z, riv_set_gpy
	cp  0xFB
	jr  z, riv_set_player_killed
	cp  0xFA
	jr  z, riv_set_player_objs
	cp  0xF9
	jr  z, riv_set_player_life

	ld  b, 0 				; BC = flag index
	ld  hl, _flags
	add hl, bc 				; HL -> FLAGS [X]

.read_i_v_cont
	ld  a, (sc_y) 			; A = value
	ret

.riv_set_n_pant
	ld  hl, _n_pant
	jr  read_i_v_cont
.riv_set_gpx
	ld  hl, _gpx
	jr  read_i_v_cont
.riv_set_gpy
	ld  hl, _gpy
	jr  read_i_v_cont
.riv_set_player_killed
	ld  hl, _player + 32	; player.killed
	jr  read_i_v_cont
.riv_set_player_objs
	ld  hl, _player + 27	; player.objs
	jr  read_i_v_cont
.riv_set_player_life
	ld  hl, _player + 29	; player.life LSB
	jr  read_i_v_cont

.script_bytecode
	BINARY "perils.spt.bin"

