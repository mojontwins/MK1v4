// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).
unsigned char px, py, pxx, pyy, pt, pn, pt_alt;
unsigned char *pptr, *pptr_alt; 

// Clears the screen

void blackout (void) {
	rda = BLACK_COLOUR_BYTE;
	#asm
			ld  a, 0xc0
		.bo_l1
			ld  h, a
			ld  l, 0
			ld  b, a
			ld  a, (_rda)
			ld  (hl), a
			ld  a, b
			ld  d, a
			ld  e, 1
			ld  bc, 0x5ff
			ldir

			add 8
			jr  nz, bo_l1

	#endasm
}

// Trying to be a drop-in subst

void sp_UpdateNow (void) {
	// Invalidate all sprites

	for (gpit = 0; gpit < SW_SPRITES_ALL; gpit ++) {
		#if defined PLAYER_CAN_FIRE || defined PLAYER_HAS_SWORD
			if (gpit >= SP_BULLETS_BASE) {
				cpc_PutSPTileMap2Bx8 ((int) (&sp_sw [gpit]));
			} else
		#endif
		cpc_PutSPTileMap4Bx16 ((int) (&sp_sw [gpit]));
	}

	#asm
		._cpc_screen_update_upd_buffer
			call cpc_UpdScr 
	#endasm

	// Redraw all sprites

	for (gpit = 0; gpit < SW_SPRITES_ALL; gpit ++) {
		#if defined PLAYER_CAN_FIRE || defined PLAYER_HAS_SWORD
			if (gpit >= SP_BULLETS_BASE) {
				cpc_PutTrSp2Bx8TileMap ((int) (&sp_sw [gpit])); // REVISAR!!
			} else
		#endif
		cpc_PutTrSp4Bx16TileMap ((int) (&sp_sw [gpit]));
	}

	#asm
		.ml_min_faps_loop
			ld  a, (isr_c2)
			cp  MIN_FAPS_PER_FRAME
			jr  c, ml_min_faps_loop

		.ml_min_faps_loop_end
			xor a
			ld  (isr_c2), a

			call cpc_ShowTouchedTiles
			call cpc_ResetTouchedTiles
	#endasm			
}

void cpc_MoveSprAbs (unsigned char spr_idx, unsigned char *next_frame, unsigned char cx, unsigned char cy) {
	px = cx; py = cy; pt = spr_idx; pptr = next_frame;

	#asm
			ld  a, (_pt)
			sla a 
			sla a 
			sla a 
			sla a 
			ld  ixh, #((BASE_SPRITES)/256)
			ld  ixl, a 

			// H-coordinates: byte offset (0-63)
			ld  a, (_px)
			srl a 
			srl a 
			add #(VIEWPORT_X*2)
			ld  (ix + 8), a 

			// V-coordinates: pixel line (0-191)
			ld  a, (_py)
			add #(VIEWPORT_Y*8)
			ld  (ix + 9), a

			ld  a, (_pptr)
			ld  (ix + 0), a 
			ld  a, (_pptr + 1)
			ld  (ix + 1), a
	#endasm
}

// Sets the border

void __FASTCALL__ cpc_Border (unsigned char b) {
	#asm
			ld 	a, l
			ld  bc, 0x7F11
			out (c), c
			out (c), a
	#endasm
}

// Call this first for CPC!

void system_init (void) {
	// Inits shit

	wyz_init ();

	#asm
			di
			
			ld  hl, 0xC000
			xor a
			ld  (hl), a
			ld  de, 0xC001
			ld  bc, 0x3DFF
			ldir
			
			ld  a, 195
			ld  (0x38), a
			ld  hl, _isr
			ld  (0x39), hl

			// Sync with raster to init counter
			ld  b,0xf5
		.wait_vsync
			in a,(c)
			rra
			jp nc,wait_vsync   

			xor a 
			ld  (isr_c1), a
			ei
			jp  after_isr

		._isr
			push af 
			push hl
			push de
			push bc
			push ix
			push iy 
			
			ld  a, (isr_c1)
			inc a

			cp  6
			jr  c, _isr_done

			// Inc frame counter
			ld  hl, isr_c2
			inc (hl)

			ld  a, (_isr_player_on)
			or  a
			jr  z, _skip_ay_player

			call WYZ_PLAYER_ISR
		._skip_ay_player

			xor a

		._isr_done 
			ld  (isr_c1), a	
			
			pop iy
			pop ix
			pop bc
			pop de 
			pop hl
			pop af
			ei
			ret

		.isr_c1 
			defb 0
		.isr_c2
			defb 0

		.after_isr
	#endasm
	
	// Border 0

	cpc_Border (0x54);
	
	// Decompress LUT in place

	#asm
			ld  hl, _trpixlutc
			ld  de, BASE_LUT
			call depack
	#endasm

	blackout ();

	// Set palette

	#asm
			call my_inks
	#endasm
	
	// Set mode

	#ifdef MODE_1
		cpc_SetMode (1);
	#else
		cpc_SetMode (0);
	#endif

	// Set tweaked mode 
	// (thanks Augusto Ruiz for the code & explanations!)
	
	#asm
			; Horizontal chars (32), CRTC REG #1
			ld    b, 0xbc
			ld    c, 1			; REG = 1
			out   (c), c
			inc   b
			ld    c, 32			; VALUE = 32
			out   (c), c

			; Horizontal pos (42), CRTC REG #2
			ld    b, 0xbc
			ld    c, 2			; REG = 2
			out   (c), c
			inc   b
			ld    c, 42			; VALUE = 42
			out   (c), c

		#if defined MODE_1 && defined AUTO_SPLIT
				; Vertical pos (4), CRTC REG #5
				ld    b, 0xbc
				ld    c, 5			; REG = 5
				out   (c), c
				inc   b
				ld    c, 4			; VALUE = 24
				out   (c), c
		#endif

			; Vertical chars (24), CRTC REG #6
			ld    b, 0xbc
			ld    c, 6			; REG = 6
			out   (c), c
			inc   b
			ld    c, 24			; VALUE = 24
			out   (c), c
	#endasm

	// Turn off all sprites

	#asm
			ld  ix, BASE_SPRITES
			ld  de, 16
			ld  b, SW_SPRITES_ALL

		.sp_sw_init_turnoff_loop			
			ld  a, #((VIEWPORT_X*8)/4)
			ld  (ix + 10), a
			
			ld  a, #(VIEWPORT_Y*8)
			ld  (ix + 11), a 

			add ix, de
			djnz sp_sw_init_turnoff_loop
	#endasm	
}

// We'll be writing directly to the CPC virtual nametable. 

void tile_address (void) {
	#asm
			ld  a, (_py)

			add a, a	; 2		4
			add a, a	; 4		4
			add a, a	; 8		4
			ld  h, 0	;		2
			ld  l, a 	;		4
			add hl, hl  ; 16	11
			add hl, hl  ; 32	11
			;					44 t-states

			; HL = py * 32

			ld 	de, (_px)			
			ld 	d, 0
			add hl, de

			; HL = py * 32 + px

			ld  de, _nametable
			add hl, de
			
			ex  de, hl

			; DE = buffer address
	#endasm
}

void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
	#asm
			; Copy params for speed & size
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (_px), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (_py), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (_pt), a
		._draw_coloured_tile_do
			/*
			_t = 64 + (_t << 2);
			gen_pt = tileset + ATTR_OFFSET + _t;
			sp_PrintAtInv (_y, _x, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y, _x + 1, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y + 1, _x, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y + 1, _x + 1, *gen_pt, _t);
			*/
			// Calculate address in the display list

			call _tile_address	; DE = buffer address
			ex de, hl

			// Now write 4 chars.
			ld  a, (_pt)
			sla a
			sla a 				// A = _t * 4
			add 64 				// A = _t * 4 + 64
			
			ld  (hl), a
			inc hl
			inc a
			ld  (hl), a
			ld  bc, 31
			add hl, bc
			inc a
			ld  (hl), a
			inc hl
			inc a
			ld  (hl), a		

			// Finally, invalidate

			ld  a, (_px)
			ld  e, a
			ld  a, (_py)
			ld  d, a
			call cpc_UpdTileTable
			inc e
			call cpc_UpdTileTable
			dec e
			inc d
			call cpc_UpdTileTable
			inc e
			call cpc_UpdTileTable		
	#endasm
}

void sp_PrintAtInv (unsigned char y, unsigned char x, unsigned char c, unsigned char t) {
	px = x; py = y; pt = t;
	#asm

			// Esto obtiene la direccion del tile en DE
			call _tile_address

			// Escribimos el tile
			ld  a, (_pt)
			ld  (de), a

			// Invalidamos el tile
			ld  a, (_px)
			ld  e, a
			ld  a, (_py)
			ld  d, a 

			// Esto invalida el tile en E, D
			call cpc_UpdTileTable 
	#endasm
}

void print_number2 (unsigned char x, unsigned char y, unsigned char value) {
	#asm
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (_px), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (_py), a
			dec hl
			dec hl
			ld  a, (hl)
			
			// You may call here with _px, _py prefilled 
			// and the number in A.
			
		.draw_2_digits_shortcut
			ld  d, 0
			ld  e, a
			ld  hl, 10
			call l_div_u 	// HL = division, DE = rest

			ld  a, e
			add 16
			ld  (_pn), a 	// _n = units
			ld  a, l
			add 16
			ld  (_pt), a 	// _t = tens
			
			call _tile_address	; DE = buffer address
			ld  a, (_pt)
			ld  (de), a
			inc de
			ld  a, (_pn)
			ld  (de), a

			ld  a, (_px)
			ld  e, a
			ld  a, (_py)
			ld  d, a
			call cpc_UpdTileTable
			inc e
			call cpc_UpdTileTable
	#endasm
}

void print_str (unsigned char x, unsigned char y, unsigned char c, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 8
			add hl, sp
			
			ld  a, (hl)
			ld  (_px), a
			ld  (_pt), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (_py), a
			dec hl
			dec hl
			
			dec hl

			ld  a, (hl)
			dec hl 
			ld  l, (hl)
			ld  h, a

		.draw_text_pre_loop
			push hl

			xor a 
			ld  (_pn), a 		; Strlen

			call _tile_address	; DE = buffer address
			
			pop hl

		.draw_text_loop
			ld  a, (hl)
			or  a
			jr  z, print_str_inv 
			
			cp  0x25
			jr  z, draw_text_loop
			
			sub 32
			ld  (de), a
			
			inc hl
			inc de 

			ld  a, (_pn)
			inc a
			ld  (_pn), a

			jr  draw_text_loop

		.print_str_inv

			; Invalidate cells based upon strlen.
			ld  a, (_py)
			ld  b, a
			ld  d, a
			ld  a, (_px)
			ld  c, a
			ld  a, (_pn)
			add c
			dec a
			ld  e, a
			call cpc_InvalidateRect
	
	#endasm
}

#ifndef DEACTIVATE_OBJECTS
	void draw_objs () {
		#ifdef ONLY_ONE_OBJECT
			if (player.objs) {
				sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X, 135, 132);
				sp_PrintAtInv (OBJECTS_ICON_Y, OBJECTS_ICON_X + 1, 135, 133);
				sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X, 135, 134);
				sp_PrintAtInv (OBJECTS_ICON_Y + 1, OBJECTS_ICON_X + 1, 135, 135);
			} else {
				draw_coloured_tile (OBJECTS_ICON_X, OBJECTS_ICON_Y, 17);
			}
			print_number2 (OBJECTS_X, OBJECTS_Y, flags [OBJECT_COUNT]);
		#else
			print_number2 (OBJECTS_X, OBJECTS_Y, player.objs);
		#endif
	}
#endif

void pad_read (void) {
	pad_this_frame = pad1;

	// Fill pad1 and pad0 with the status of the first 8 keys in `tabla_teclas`.
	#asm 
			ld  hl, cpc_KeysData + 12
			xor a
			ld  (_pad0), a
			ld  b, 1 				// Bit to switch
		pad_read_loop:
			push bc
			ld  d, (hl) 			// LSB: Column
			inc hl
			ld  a, (hl) 			// MSB: Line
			inc hl
			call cpc_TestKeyboard
			and d  					// Pressed?
			pop bc
			jr  z, pad_read_not_pressed

			ld  a, (_pad0)
			or  b
			ld  (_pad0), a

		.pad_read_not_pressed
			sla b
			jr  nz, pad_read_loop


			ld  a, (_pad0)
			cpl
			ld  (_pad0), a
			ld  (_pad1), a
	#endasm

	// Keys held this frame
	pad_this_frame = (~pad_this_frame) | pad1;
}

void saca_a_todo_el_mundo_de_aqui (void) {
	/*
	for (gpit = 0; gpit < SW_SPRITES_ALL; gpit ++) {
		sp_sw [gpit].sp0 = (int) (SPRFR_EMPTY);
	}
	*/
	#asm
			ld  de, 15
			ld  b, SW_SPRITES_ALL
		.clear_sprites_loop
			ld  hl, BASE_SPRITES
			ld  a, #(_sprite_18_a%256)
			ld  (hl), a
			inc hl
			ld  a, #(_sprite_18_a/256)
			ld  (hl), a 
			add hl, de
			djnz clear_sprites_loop
	#endasm
}

void update_this_enemy (void) {
	cpc_MoveSprAbs (SP_ENEMS_BASE + gpit, en_an_next_frame [gpit], _en_x, _en_y);
}

void render_sprites (void) {
	// Render enemies

	for (gpit = 0; gpit < 3; gpit ++) {
		#if defined (RANDOM_RESPAWN) || defined (ENABLE_CUSTOM_TYPE_6)
			if (en_an_fanty_activo [gpit] || malotes [enoffs + gpit].t == 6) {
				_en_x = en_an_x [gpit] >> 6;
				_en_y = en_an_y [gpit] >> 6;
			} else 
		#endif
		{
			_en_x = malotes [enoffs + gpit].x;
			_en_y = malotes [enoffs + gpit].y;
		}
		update_this_enemy ();
	}

	// Render player

	if (!(player.estado & EST_PARP) || half_life) {
		cpc_MoveSprAbs (0, player.next_frame, gpx, gpy);
	} else {
		sp_sw [SP_PLAYER].sp0 = (unsigned int) (sprite_18_a);
	}

	// Render bullets

	#ifdef PLAYER_CAN_FIRE
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
			if (bullets_estado [gpit] == 1) {
				cpc_MoveSprAbs (SP_BULLETS_BASE + gpit, sprite_19_a, bullets_x [gpit], bullets_y [gpit]);
			} else {
				sp_sw [SP_BULLETS_BASE + gpit].sp0 = (unsigned int) (sprite_18_a);
			}
		}
	#endif	
}

#ifdef PLAYER_STEP_SOUND
	void step (void) {

	}
#endif

void cortina (void) {
	// Do something... someday
}

void select_joyfunc (void) {
	#asm
		.title_loop
			call _pad_read 
			
			ld  a, (_pad_this_frame) 
			and sp_AUX3 
			jr  nz, title_not_aux3

			ld  hl, _def_keys
			jr  copy_keys_to_extern
			
		.title_not_aux3

			ld  a, (_pad_this_frame) 
			and sp_AUX4
			jr  nz, title_loop

			ld  hl, _def_keys_joy

		// Copy keys to extern 
	
		.copy_keys_to_extern
			ld  de, cpc_KeysData + 12
			ld  bc, 24
			ldir

		.joyfunc_selected
	#endasm
}

void unpack_screen (unsigned char *src) {
	unpack (src, (unsigned char *)(BASE_SUPERBUFF));
}

void sp_WaitForNoKey () {
	do {
		pad_read ();
	} while (pad0 != 0xff);
}

void espera_activa (int espera) {
	sp_WaitForNoKey ();
	do {
		pad_read ();
		#asm
				halt
				halt
				halt
				halt
				halt
				halt
		#endasm
		if (pad_this_frame != 0xff) break;
	} while (espera --);
}
