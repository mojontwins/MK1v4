; loader.asm
; loads the loader
; by na_th_an - Thanks to Antonio Villena for his tutorials and utilities.

	org $5ccb
	ld  sp, 24199
	di
	db	$de, $c0, $37, $0e, $8f, $39, $96 ;OVER USR 7 ($5ccb)
	
	ld  bc, 767
	ld	hl, $5800
	ld	de, $5801
	ld	(hl), l
	ldir

; load screen
	scf
	ld	a, $ff
	ld	ix, $4000
	ld	de, 6912
	call $0556
	di

; Main binary
	scf
	ld	a, $ff
	ld	ix, 24200
	ld	de, 31667
	call $0556
	di

; Detect if it's a 128K model to load RAM1.
	ld  bc, 0x7ffd
	xor a
	out (c), a
	ld  a, (0x1)
	ld  h, a
	ld  a, 0x10
	out (c), a
	ld  a, (0x1)
	cp  h
	jr  z, launch_exe

; RAM1
	ld	a, $11 		; ROM 1, RAM 1
	ld	bc, $7ffd
	out (C), a

	scf
	ld	a, $ff
	ld	ix, $C000
	ld	de, 3864
	call $0556
	di

	ld	a, $10 		; ROM 1, RAM 0
	ld	bc, $7ffd
	out (C), a
	
; run game!
launch_exe:
	jp 24200
