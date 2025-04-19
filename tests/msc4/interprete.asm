org $C000

jr script_do

;; Test. You can poke here

.script_n
	defw 0

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

.script_do

	; Point to offset in script index
	ld  hl, (script_n)
	add hl, hl
	ld  bc, script_bytecode
	add hl, bc

	; Read offset
	ld  a, (hl)
	inc hl 
	ld  h, (hl)
	ld  l, a 

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
	jr  nz, opcode_01_end
.opcode_01
	call read_vbyte
	ld  b, a
	call read_vbyte
	cp  b
	jp  nz, skip_clausule
	jp  script_clausule
.opcode_01_end

	;; IF A < B
	cp  0x02
	jr  nz, opcode_02_end
.opcode_02
	call read_vbyte
	ld  c, a
	call read_vbyte
	ld  b, a
	ld  a, c
	cp  b
	jp  nc, skip_clausule
	jp  script_clausule
.opcode_02_end

	;; IF A >= B
	cp  0x03
	jr  nz, opcode_03_end
.opcode_03
	call read_vbyte
	ld  c, a
	call read_vbyte
	ld  b, a
	ld  a, c
	cp  b
	jp  c, skip_clausule
	jp  script_clausule
.opcode_03_end

	;; IF A <> B
	cp  0x04
	jr  nz, opcode_01_end
.opcode_04
	call read_vbyte
	ld  b, a
	call read_vbyte
	cp  b
	jp  z, skip_clausule
	jp  script_clausule
.opcode_04_end

	;; IF PLAYER IN_X (X1, X2)
	cp  0x21
	jr  nz, opcode_21_end
.opcode_21
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
.opcode_21_end

	;; IF PLAYER IN_Y (Y1, Y2)
	cp  0x22
	jr  nz, opcode_22_end
.opcode_22
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
.opcode_22_end

	;; IF PLAYER AT (X, Y)
	cp  0x23
	jr  nz, opcode_23_end
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
.opcode_23_end

	;; IF PLAYER FALLING
	cp  0x24
	jr  nz, opcode_24_end
.opcode_24
	;; Player falling if not possee
	ld  a, (_player_possee)
	or  a
	jp  z, skip_clausule
	jp  script_clausule
.opcode_24_end

	;; IF PLAYER NOT FALLING
	cp  0x25
	jr  nz, opcode_25_end
.opcode_25
	;; Player not falling if possee
	ld  a, (_player_possee)
	or  a
	jp  nz, skip_clausule
	jp  script_clausule
.opcode_25_end

	;; PLAYER_STILL
	cp  0x26
	jr  nz, opcode_26_end
.opcode_26
	ld  a, (_player_vx)
	ld  hl, (_player_vx + 1)
	or  (hl)
	ld  hl, (_player_vy)
	or  (hl)
	ld  hl, (_player_vy + 1)
	or  (hl)
	jp  nz, skip_clausule
	jp  script_clausule
.opcode_26_end

	;; TILE AT (X, Y) = T
	cp  0x30
	jr  nz, opcode_30_end
.opcode_30
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
.opcode_30_end

	;; BEH AT (X, Y) = T
	cp  0x31
	jr  nz, opcode_31_end
.opcode_31
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
.opcode_31_end

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

	

	jr  script_actions

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
	ld  a, (_player_killed)
	ret
.rvb_set_player_objs
	ld  a, (_player_objs)
	ret
.rvb_set_player_life
	ld  a, (_player_life)
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

.script_bytecode
	BINARY "test1.spt.bin"

;;; SNIP

._flags defs 16
._n_pant defb 0
._gpx defb 0
._gpy defb 0
._player_killed defb 0
._player_objs defb 0
._player_life defb 0
._player_possee defb 0
._player_vy defw 0
._player_vx defw 0
._attr_2
.qtile_do
