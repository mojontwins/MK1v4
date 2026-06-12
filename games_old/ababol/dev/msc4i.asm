	defc PLAYER_LIFE=99 ;; Find a way to solve this

; Imports
	XREF _flags
	XREF _n_pant
	XREF _on_pant
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
	XREF _hotspot_t
	XREF _scenery_info
	XREF __en_t
	XREF _en_it
	XREF __en_x
	XREF __en_y
	XREF _decode_text

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

;; OPCODE 0x30
;; TILE AT (X, Y) = T
	cp  0x30
	jr  nz, copcode_30_end
.copcode_30
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
.copcode_30_end

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
	ld  a, (_flags + 0)
	cp  47
	jr  nz, aopcode_30_end
; Write 1 to LValue
	inc a
	ld  (hl), a
; Assign item
	ld  a, (_tqt)
	ld  (_flags + 0), a
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

; OPANT RVALUE
	cp  0xEA
	jr  nz, rvb_set_on_pant_done
	ld  a, (_on_pant)
	ret
.rvb_set_on_pant_done

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

