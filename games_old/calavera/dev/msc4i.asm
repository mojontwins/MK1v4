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

	XREF script_bytecode

; Target SPECCY
	LIB SPUpdateNow

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

; From the engine
._script_tx
	defb 0
._script_ty
	defb 0
._script_tn
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

	ld  b, 0 				; BC = flag index
	ld  hl, _flags
	add hl, bc 				; HL -> FLAGS [X]

.read_i_v_cont
	ld  a, (sc_y) 			; A = value
	ret

