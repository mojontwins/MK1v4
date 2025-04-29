defc PLAYER_LIFE=99 ;; Find a way to solve this

; Imports
XREF _flags
XREF _n_pant
XREF _gpx
XREF _gpy
XREF _tpx
XREF _tpy
XREF _tat
XREF _tqt
XREF _player
XREF _attr_2
XREF qtile_do
XREF set_map_tile_do
XREF _draw_coloured_tile
XREF __x
XREF __y
XREF __t
XREF __n
XREF _comportamiento_tiles
XREF _map_attr
XREF _peta_el_beeper
XREF _do_extern_action
XREF draw_line_of_text

; Target CPC
XREF _cpc_UpdateNow

; Exports
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

	ld  hl, (script)
	push hl 

	call read_byte 		; A = clausule size
	ld  b, 0 
	ld  c, a 

	pop hl 
	add hl, bc 
	ld  (skip), hl	

	cp  0xFF 			; End of section?
	ret z

; Process conditions
.script_clausule
	call read_byte 		;A = opcode

	; If we get to 0xFF (THEN), jump to actions
	cp  0xFF
	jp  z, script_actions

	;;; Decode OPCODE & jump to interpreter

	;; OPCODE 0x01	
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

	;; OPCODE 0x02
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
	
	;; OPCODE 0x03
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

	;; OPCODE 0x04
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

	;; OPCODE 0x21
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

	;; OPCODE 0x22
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

	;; OPCODE 0x23
	;; IF PLAYER AT (X, Y)
	cp  0x23
	jr  nz, copcode_23_end
.opcode23
	;; (gpx + 8) >> 4 != X -> exit
	ld  a, (_tpx)
	ld  c, a
	call read_vbyte
	cp  c 
	jp  nz, skip_clausule
	;; (gpy + 8) >> 4 != Y -> exit
	ld  a, (_tpy)
	ld  c, a
	call read_vbyte
	cp  c 
	jp  nz, skip_clausule
	jp  script_clausule
.copcode_23_end

	;; OPCODE 0x24
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

	;; OPCODE 0x25
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

	;; OPCODE 0x26
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

	;; OPCODE 0x30
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

	;; OPCODE 0x31
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

	; If we get to 0xFF (END), jump to next clausule
	cp  0xFF
	jp  z, script_loop

	;;; Decode OPCODE & jump to interpreter

	;; OPCODE 0x00
	;; FLAGS[N] = V
	cp  0x00
	jr  nz, aopcode_00_end
.aopcode_00
	call read_i_v		; HL -> FLAGS[N], A -> V
	ld  (hl), a
	jp  script_actions
.aopcode_00_end

	;; OPCODE 0x01
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

	;; OPCODE 0x02
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

	;; OPCODE 0x20
	;; SET TILE (X, Y) = T
	cp  0x20
	jr  nz, aopcode_20_end
.aopcode_20
	call read_x_y
	call read_vbyte 
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

	;; OPCODE 0x21
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

	;; OPCODE 0x22
	;; DECOS XY T XY T ... 0xFF
	cp  0x22 
	jr  nz, aopcode_22_end
.aopcode_22
	call read_byte
	cp  0xff
	jr  z, aopcode_22_end
	ld  (__t), a
	ld  b, 0 
	ld  c, a 
	ld  hl, _comportamiento_tiles
	add hl, bc 
	ld  a, (hl)
	ld  (__n), a
	call read_byte
	ld  b, a 
	and 0xf
	ld  c, a
	ld  (__x), a
	ld  a, b 
	srl a
	srl a
	srl a
	srl a
	ld  (__y), a 
	call set_map_tile_do
	jr  aopcode_22
aopcode_22_end

	;; OPCODE 0x30
	;; GET ITEM SET $F <- [FILL I]
	cp  0x30
	jr  nz, aopcode_30_end
.aopcode_30
	;; Get LValue: Flag to modify
	call read_vbyte
	ld  b, 0 
	ld  c, a 
	ld  hl, _flags
	add hl, bc
	; No item in slot?
	ld  a, (_flags + ITEM_SLOT)
	or  a 
	jr  nz, aopcode_30_end
	; Write 1 to LValue
	inc a 
	ld  (hl), a
	; Assign item
	ld  a, (_tqt)
	ld  (_flags + ITEM_SLOT), a 
	; Clear from screen
	xor a 
	ld  (__n), a 
	ld  (__t), a 
	ld  a, (_tpx)
	ld  c, a
	ld  (__x), a 
	ld  a, (_tpy)
	ld  (__y), a 
	call set_map_tile_do
	jp  script_actions
.aopcode_30_end

	;; OPCODE 0x50
	;; PRINT TILE (X, Y) = N
	cp  0x50
	jr  nz, aopcode_50_end
.aopcode_50
	call read_vbyte
	ld  h, 0
	ld  l, a 
	push hl 
	call read_vbyte
	ld  h, 0
	ld  l, a 
	push hl
	call read_vbyte
	ld  h, 0
	ld  l, a 
	push hl
	call _draw_coloured_tile
	pop bc
	pop bc
	pop bc
.aopcode_50_end

	;; OPCODE 0xE0
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

	;; OPCODE 0xE1
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

	;; OPCODE 0xE2
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

	;; OPCODE 0xE3
	;; TEXT L <CHARS> 0
	cp  0xE3
	jr  nz, aopcode_E3_end
.aopcode_E3
	call read_byte 			; String length
	ld  b, 0
	ld  c, a 
	add hl, bc 				; Move after the string
	push hl
	ld  hl, (script)
	call draw_line_of_text
	pop hl 		
	ld  (script), hl 		; Get past the string			
	jp script_actions
.aopcode_E3_end

	;; OPCODE 0xE4
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

	;; OPCODE 0xE5
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

	;; OPCODE 0xF0
	;; WIN GAME
	cp  0xf0 
	jr  nz, aopcode_F0_end
.aopcode_F0
	ld  a, 1
	ld  (_script_result), a
	ret
.aopcode_F0_end

	;; OPCODE 0xF1
	;; GAME OVER
	cp  0xf1 
	jr  nz, aopcode_F1_end
.aopcode_F1
	ld  a, 2
	ld  (_script_result), a
	ret
.aopcode_F1_end

	;; OPCODE 0xF2
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

	; NPANT RVALUE
	cp  0xFE
	jr  nz, rvb_set_n_pant_done
	ld  a, (_n_pant)
	ret
.rvb_set_n_pant_done

	; PX RVALUE
	cp  0xFD
	jr  nz, rvb_set_gpx_done
	ld  a, (_gpx)
	ret
.rvb_set_gpx_done

	; PY RVALUE
	cp  0xFC
	jr  nz, rvb_set_gpy_done
	ld  a, (_gpy)
	ret
.rvb_set_gpy_done

	; KILLED RVALUE
	cp  0xFB
	jr  nz, rvb_set_player_killed_done
	ld  a, (_player + 32) 	; player.killed
	ret
.rvb_set_player_killed_done

	; OBJS RVALUE
	cp  0xFA
	jr  nz, rvb_set_player_objs_done
	ld  a, (_player + 27) 	; player.objs
	ret
.rvb_set_player_objs_done

	; LIFE RVALUE
	cp  0xF9
	jr  nz, rvb_set_player_life_done
	ld  a, (_player + 29) 	; player.life MSB
	ret
.rvb_set_player_life_done

	; TX RVALUE
	cp  0xF8
	jr  nz, rvb_set_tx_done
	ld  a, (_tpx)
	ret
.rvb_set_tx_done

	; TY RVALUE
	cp  0xF7
	jr  nz, rvb_set_ty_done
	ld  a, (_tpy)
	ret
.rvb_set_ty_done
	
	; TN RVALUE
	cp  0xF6
	jr  nz, rvb_set_tile_done
	ld  a, (_tqt)
	ret
.rvb_set_tile_done

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
	call read_vbyte 		; Read value
	ld  (sc_y), a 
	
	ld  a, c  				; C = flag index
	
	; NPANT LVALUE
	cp  0xFE
	jr  nz, riv_set_n_pant_done
	ld  hl, _n_pant
	jr  read_i_v_cont
.riv_set_n_pant_done

	; PX LVALUE
	cp  0xFD
	jr  nz, riv_set_gpx_done
	ld  hl, _gpx
	jr  read_i_v_cont
.riv_set_gpx_done

	; PY LVALUE
	cp  0xFC
	jr  nz, riv_set_gpy_done
	ld  hl, _gpy
	jr  read_i_v_cont
.riv_set_gpy_done

	; KILLED LVALUE
	cp  0xFB
	jr  nz, riv_set_player_killed_done
	ld  hl, _player + 32	; player.killed
	jr  read_i_v_cont
.riv_set_player_killed_done

	; OBJS LVALUE
	cp  0xFA
	jr  nz, riv_set_player_objs_done
	ld  hl, _player + 27	; player.objs
	jr  read_i_v_cont
.riv_set_player_objs_done

	; LIFE LVALUE
	cp  0xF9
	jr  nz, riv_set_player_life_done
	ld  hl, _player + 29	; player.life LSB
	jr  read_i_v_cont
.riv_set_player_life_done

	ld  b, 0 				; BC = flag index
	ld  hl, _flags
	add hl, bc 				; HL -> FLAGS [X]

.read_i_v_cont
	ld  a, (sc_y) 			; A = value
	ret

.script_bytecode
	BINARY "perils.spt.bin"

