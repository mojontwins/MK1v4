// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// printer.h
// Miscellaneous printing functions (tiles, status, etc).

void _tile_address (void) {
	#asm
			ld  a, (__y)

			add a, a	; 2		4
			add a, a	; 4		4
			add a, a	; 8		4
			ld  h, 0	;		2
			ld  l, a 	;		4
			add hl, hl  ; 16	11
			add hl, hl  ; 32	11
			;					44 t-states

			; HL = _y * 32

			ld 	de, (__x)			
			ld 	d, 0
			add hl, de

			; HL = _y * 32 + _x

			ld  de, _nametable
			add hl, de
			
			ex  de, hl

			; DE = buffer address
	#endasm
}

void draw_rectangle (void) {	
	#asm
			call __tile_address		// DE = buffer address

			// Number of lines
			ld  a, (__y2)
			inc a
			ld  hl, __y
			sub (hl)
			ld  b, a

			// Precalc value to add for next line
			ld  a, (__x)
			add 31
			ld  hl, __x2
			sub (hl)
			dec a
			ld  (__n), a

		.draw_rectangle_it1
			push bc

			ld  a, (__x)
			ld  b, a
		.draw_rectangle_it2
			xor a
			ld  (de), a
			inc de
			inc b

			ld  a, (__x2)
			inc a
			cp  b
			jr  nc, draw_rectangle_it2

			ld  hl, (__n)
			ld  h, 0
			add hl, de
			ex  de, hl

			pop bc
			djnz draw_rectangle_it1

			// Invalidate rectangle			
			ld  a, (__y)
			ld  b, a
			ld  a, (__x)
			ld  c, a
			ld  a, (__y2)
			ld  d, a
			ld  a, (__x2)
			ld  e, a

			call cpc_InvalidateRect
	#endasm
}

void attr (char x, char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x

			dec hl
			dec hl
			ld  a, (hl) 	// y
			
			// If you put x in C and y in A you can call here
			
		._attr_2
			// A = y, C = x
			cp  10
			jr  c, _attr_1

		#if defined BETTER_VERTICAL_CONNECTIONS && VIEWPORT_Y > 0
				cp  11
				jr  nc, _attr3
				ld  hl, 0
				ret
				
			._attr3
				xor a 	 	// Negative values replicate first row
		#else
				ld  hl, 0
				ret
		#endif

		._attr_1
			ld  b, a 		// save y
			ld  a, c 		// x
			cp  15
			jr  c, _attr_1b
			ld  hl, 0
			ret

			// If you put x in C and y in A you can use this entry point for enemies

		._attr_enems
			cp  10
			jr  c, _attr_enems_skip_1
			ld  hl, 8
			ret
		._attr_enems_skip_1
			ld  b, a
			ld  a, c
			cp  15
			jr  c, _attr_1b
			ld  hl, 8
			ret

		._attr_1b
			ld  a, b 		// restore y
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_attr
			add hl, de
			ld  l, (hl)

		._attr_end
			ld  h, 0
	#endasm
}

void qtile (unsigned char x, unsigned char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x
		
			dec hl
			dec hl
			ld  a, (hl) 	// y

			// If you put x in C and y in A you can call here
			
		.qtile_do	
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_buff
			add hl, de

			ld  l, (hl)
			ld  h, 0
	#endasm
}

// Draw tile tile

void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t) {
	//_x = x; _y = y; _t = t;
	#asm
			; Copy params for speed & size
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__t), a
		._draw_coloured_tile_do
	#endasm

	#ifdef USE_AUTO_TILE_SHADOWS		
		#asm
			// Undo screen coordinates -> buffer coordinates
				ld  a, (__x)
				sub VIEWPORT_X
				srl a
				ld  (_xx), a

				ld  a, (__y)
				sub VIEWPORT_Y
				srl a
				ld  (_yy), a
		#endasm

		// Nocast for tiles which never get shadowed
		nocast = !((attr (xx, yy) & 8) || (_t >= 16 && _t != 19));		

		// Precalc 
		#asm
				ld  a, (__t)
				sla a 
				sla a 
				add 64
				ld  (__ta), a
		#endasm

		// Precalc
		
		if (_t == 19) {
			t_alt = 192;
		} else {
			t_alt = 128 + _ta;
		}
		
		// cx1 = xx - 1; cy1 = yy ? yy - 1 : 0; a1 = (nocast && (attr_mk2 () & 8));
		#asm
			// cx1 = xx - 1; 
				ld  a, (_xx)
				dec a
				ld  (_cx1), a

			// cy1 = yy ? yy - 1 : 0;
				ld  a, (_yy)
				or  a
				jr  z, _dct_1_set_yy
				dec a
			._dct_1_set_yy
				ld  (_cy1), a

			// a1 = (nocast && (attr_mk2 () & 8));
				ld  a, (_nocast)
				or  a
				jr  z, _dct_a1_set

				call _attr_mk2
				ld  a, l
				and 8
				jr  z, _dct_a1_set

				ld  a, 1

			._dct_a1_set
				ld  (_a1), a
		#endasm			

		// cx1 = xx    ; cy1 = yy ? yy - 1 : 0; a2 = (nocast && (attr_mk2 () & 8));
		#asm
								// cx1 = xx; 
				ld  a, (_xx)					
				ld  (_cx1), a

			// cy1 = yy ? yy - 1 : 0;
				ld  a, (_yy)
				or  a
				jr  z, _dct_2_set_yy
				dec a
			._dct_2_set_yy
				ld  (_cy1), a

			// a2 = (nocast && (attr_mk2 () & 8))
				ld  a, (_nocast)
				or  a
				jr  z, _dct_a2_set

				call _attr_mk2
				ld  a, l
				and 8
				jr  z, _dct_a2_set

				ld  a, 1

			._dct_a2_set
				ld  (_a2), a
		#endasm

		// cx1 = xx - 1; cy1 = yy             ; a3 = (nocast && (attr_mk2 () & 8));
		#asm
				// cx1 = xx - 1; 
				ld  a, (_xx)
				dec a
				ld  (_cx1), a

			// cy1 = yy;
				ld  a, (_yy)					
				ld  (_cy1), a

			// a3 = (nocast && (attr_mk2 () & 8));
				ld  a, (_nocast)
				or  a
				jr  z, _dct_a3_set

				call _attr_mk2
				ld  a, l
				and 8
				jr  z, _dct_a3_set

				ld  a, 1

			._dct_a3_set
				ld  (_a3), a
		#endasm

		/*
		if (a1 || (a2 && a3)) { t1 = t_alt; }
			else { t1 = _ta; }
		++ _ta; ++ t_alt;
		*/
		#asm
				ld  a, (_a1)
				or  a
				jr  nz, _dct_1_shadow

				ld  a, (_a2)
				or  a
				jr  z, _dct_1_no_shadow

				ld  a, (_a3)
				or  a
				jr  z, _dct_1_no_shadow

			._dct_1_shadow
			// { t1 = t_alt; }
				ld  a, (_t_alt)
				ld  (_t1), a

				jr  _dct_1_increment
			
			._dct_1_no_shadow
			// else { t1 = _ta; }
				ld  a, (__ta)
				ld  (_t1), a

			._dct_1_increment
			// ++ _ta; ++ t_alt;
				ld  hl, __ta
				inc (hl)

				ld  hl, _t_alt
				inc (hl)
		#endasm 

		/*		
		if (a2) { t2 = t_alt; }
			else { t2 = _ta; }
		++ _ta; ++ t_alt;
		*/
		#asm
				ld  a, (_a2)
				or  a
				jr  z, _dct_2_no_shadow

			._dct_2_shadow
			// { t2 = t_alt; }
				ld  a, (_t_alt)
				ld  (_t2), a

				jr  _dct_2_increment
			
			._dct_2_no_shadow
			// else { t2 = _ta; }
				ld  a, (__ta)
				ld  (_t2), a

			._dct_2_increment
			// ++ _ta; ++ t_alt;
				ld  hl, __ta
				inc (hl)

				ld  hl, _t_alt
				inc (hl)
		#endasm 		

		/*
		if (a3) { t3 = t_alt; }
			else { t3 = _ta; }
		++ _ta; ++ t_alt;	
		*/

		#asm
				ld  a, (_a3)
				or  a
				jr  z, _dct_3_no_shadow

			._dct_3_shadow
			// { t3 = t_alt; }
				ld  a, (_t_alt)
				ld  (_t3), a

				jr  _dct_3_increment
			
			._dct_3_no_shadow
			// else { t3 = _ta; }
				ld  a, (__ta)
				ld  (_t3), a

			._dct_3_increment
			// ++ _ta; ++ t_alt;
				ld  hl, __ta
				inc (hl)

				ld  hl, _t_alt
				inc (hl)
		#endasm 

		// t4 = _ta;
		#asm
				ld  a, (__ta)
				ld  (_t4), a
		#endasm	

		// Paint tile
		// Paint t1, t2, t3, t3 @ (_x, _y) in tile buffer.
		#asm
			call __tile_address	; DE = buffer address
			ex  de, hl
			ld  a, (_t1)
			ld  (hl), a
			inc hl
			ld  a, (_t2)
			ld  (hl), a
			ld  bc, 31
			add hl, bc
			ld  a, (_t3)
			ld  (hl), a
			inc hl
			ld  a, (_t4)
			ld  (hl), a
		#endasm
	#else
		#asm
			/*
			_t = 64 + (_t << 2);
			gen_pt = tileset + ATTR_OFFSET + _t;
			sp_PrintAtInv (_y, _x, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y, _x + 1, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y + 1, _x, *gen_pt ++, _t ++);
			sp_PrintAtInv (_y + 1, _x + 1, *gen_pt, _t);
			*/
			// Calculate address in the display list

				call __tile_address	; DE = buffer address
				ex de, hl

				// Now write 4 chars.
				ld  a, (__t)
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
		#endasm
	#endif

	// Finally, invalidate

	#asm
			ld  a, (__x)
			ld  e, a
			ld  a, (__y)
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

void set_map_tile (unsigned char x, unsigned char y, unsigned char t, unsigned char n) {
	#asm
			; Copy params for speed & size
			ld  hl, 8
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			ld  c, a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__t), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__n), a

		.set_map_tile_do
			ld  a, (__y)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  b, 0
			ld  c, a

			ld  hl, _map_buff
			add hl, bc
			ld  a, (__t)
			ld (hl), a

			ld  hl, _map_attr
			add hl, bc
			ld  a, (__n)
			ld (hl), a
			
			ld  a, (__x)
			sla a
			add VIEWPORT_X
			ld  (__x), a

			ld  a, (__y)
			sla a
			add VIEWPORT_Y
			ld  (__y), a

			jp _draw_coloured_tile_do
	#endasm
}

void invalidate_viewport (void) {
	#asm
			ld  B, VIEWPORT_Y
			ld  C, VIEWPORT_X
			ld  D, VIEWPORT_Y+19
			ld  E, VIEWPORT_X+29
			call cpc_InvalidateRect
	#endasm
}

void draw_2_digits (unsigned char x, unsigned char y, unsigned char value) {
	#asm
			ld  hl, 6
			add hl, sp
			ld  a, (hl)
			ld  (__x), a
			dec hl
			dec hl
			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			ld  a, (hl)
			
			ld  d, 0
			ld  e, a
			ld  hl, 10
			call l_div_u 	// HL = division, DE = rest

			ld  a, e
			add 16
			ld  (__n), a 	// _n = units
			ld  a, l
			add 16
			ld  (__t), a 	// _t = tens
			
			call __tile_address	; DE = buffer address
			ld  a, (__t)
			ld  (de), a
			inc de
			ld  a, (__n)
			ld  (de), a

			ld  a, (__x)
			ld  e, a
			ld  a, (__y)
			ld  d, a
			call cpc_UpdTileTable
			inc e
			call cpc_UpdTileTable
	#endasm
}

void draw_text (unsigned char x, unsigned char y, unsigned char c, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 8
			add hl, sp
			
			ld  a, (hl)
			ld  (__x), a
			ld  (__t), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (__y), a
			dec hl
			dec hl
			
			ld  a, (hl)
			ld  (__n), a
			dec hl

			ld  a, (hl)
			dec hl 
			ld  l, (hl)
			ld  h, a
			push hl

			xor a 
			ld  (__n), a 		; Strlen

			call __tile_address	; DE = buffer address
			
			pop hl

		.print_str_loop
			ld  a, (hl)
			or  a
			jr  z, print_str_inv 
			
			sub 32
			ld  (de), a
			
			inc hl
			inc de 

			ld  a, (__n)
			inc a
			ld  (__n), a

			jr  print_str_loop

		.print_str_inv

			; Invalidate cells based upon strlen.
			ld  a, (__y)
			ld  b, a
			ld  d, a
			ld  a, (__x)
			ld  c, a
			ld  a, (__n)
			add c
			dec a
			ld  e, a
			call cpc_InvalidateRect
	#endasm
}

void any_key (void) {
	return cpc_AnyKeyPressed ();
}

void pad_read (void) {
	pad_this_frame = pad1;

	// pad1 = pad0 = (joyfunc) (&keys); 
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

void espera_activa (int espera) {
	while (cpc_AnyKeyPressed ());
	do {
		#asm
				halt
				halt
				halt
				halt
				halt
				halt
		#endasm
		if (cpc_AnyKeyPressed ()) break;
	} while (-- espera);
}

#ifdef ENABLE_PERSISTENCE
	void persist (void) {
		// Marks tile _x, _y @ n_pant to be cleared next time we enter this screen	
		// n_pant*20 + y*2 + x/8	
		gp_gen = (unsigned char *) (PERSIST_BASE + (n_pant << 4) + (n_pant << 2) + (_y << 1) + (_x >> 3));
		*gp_gen |= bitmask [_x & 7];	
	}

	void draw_persistent_row (void) {
		for (gpit = 0; gpit < 8; gpit ++) {
			if (rdi & (bitmask [gpit]))
				set_map_tile (rdx + gpit, rdy, PERSIST_CLEAR_TILE, comportamiento_tiles [PERSIST_CLEAR_TILE]);
		}
	}

	void draw_persistent (void) {
		gp_gen = (unsigned char *) (PERSIST_BASE + (n_pant << 4) + (n_pant << 2));
		for (rdy = 0; rdy < 10; rdy ++) {
			rdx = 0; rdi = *gp_gen ++; draw_persistent_row ();
			rdx = 8; rdi = *gp_gen ++; draw_persistent_row ();
		}
	}

	void clear_persistent (void) {
		#asm
				ld  hl, PERSIST_BASE
				ld  de, PERSIST_BASE+1
				ld  bc, MAP_W*MAP_H*20-1
				xor a
				ld  (hl), a
				ldir
		#endasm
	}
#endif

#ifdef DEBUG
	unsigned char drda, drdb;
	unsigned char hex_code (unsigned char n) {
		if (n < 10) return (n + 16);
		else return n + 23;
	}

	void print_hex (unsigned char x, unsigned char y, unsigned char h) {
		drda = hex_code (h >> 4); drdb = hex_code (h & 15);
		// TODO
	}
#endif

// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

// cpc_UpdateNow () - Updates the screen.

// SPR struct is 16 bytes wide. So iteration is simple
// if you write your code by hand ... 

void cpc_UpdateNow (unsigned char sprites) {
	if (sprites) {
		#asm
			// Call the invalidate function for all sprites 

			/*
			for (gpit = 0; gpit < SW_SPRITES_ALL; gpit ++) {
				(sp_sw [gpit].invfunc) ((int) (&sp_sw [gpit]));
			}
			*/

				ld  b, 0
			._cpc_screen_update_inv_loop
				push bc
				// SW_SPRITES_ALL will be at very most = 16,
				// so we can multiply by 16 safely in 8 bits.
				ld  a, b
				sla a
				sla a
				sla a 
				sla a
				ld d, 0
				ld e, a
				ld  hl, _sp_sw
				add hl, de

				// Save paremeter
				ld  b, h
				ld  c, l

				// Push return address into stack
				ld  de, _cpc_screen_update_inv_ret
				push de

				// Push function pointer into stack
				// Offset 12 into the structure: invfunc
				ld  de, 12
				add hl, de
				ld  e, (hl)
				inc hl
				ld  d, (hl)
				push de

				// __fastcall__ expects parameter in HL
				ld  h, b
				ld  l, c

				// ret will pop the function pointer from the
				// stack and jp to it. Next ret will get to 
				// _cpc_screen_update_inv_ret
				ret

			._cpc_screen_update_inv_ret
				pop bc
				inc b
				ld  a, b
				cp  SW_SPRITES_ALL
				jr  nz, _cpc_screen_update_inv_loop
		#endasm
	}

	#asm
		._cpc_screen_update_upd_buffer
			call cpc_UpdScr 
	#endasm

	if (sprites) {
		// Call the drawing function for all sprites

		#asm
			/*
				for (gpjt = 0; gpjt < SW_SPRITES_ALL; gpjt ++) {
					gpit = spr_order [gpjt];
					(sp_sw [gpit].updfunc) ((int) (&sp_sw [gpit]));
				}
			*/	
				ld  b, SW_SPRITES_ALL
			._cpc_screen_update_upd_loop
				dec b
				push bc
				ld  a, b

				// SW_SPRITES_ALL will be at very most = 16,
				// so we can multiply by 16 safely in 8 bits.
				sla a
				sla a
				sla a 
				sla a
				ld d, 0
				ld e, a
				ld  hl, _sp_sw
				add hl, de

				// Save paremeter
				ld  b, h
				ld  c, l

				// Push return address into stack
				ld  de, _cpc_screen_update_upd_ret
				push de

				// Push function pointer into stack
				// Offset 12 into the structure: updfunc
				ld  de, 14
				add hl, de
				ld  e, (hl)
				inc hl
				ld  d, (hl)
				push de

				// __fastcall__ expects parameter in HL
				ld  h, b
				ld  l, c

				// ret will pop the function pointer from the
				// stack and jp to it. Next ret will get to 
				// _cpc_screen_update_inv_ret
				ret

			._cpc_screen_update_upd_ret
				pop bc
				xor a
				or  b
				jr  nz, _cpc_screen_update_upd_loop

			._cpc_screen_update_done
		#endasm
	}

	#ifdef MIN_FAPS_PER_FRAME
		#asm
			.ml_min_faps_loop
				ld  a, (isr_c2)
				cp  MIN_FAPS_PER_FRAME
				jr  c, ml_min_faps_loop

			.ml_min_faps_loop_end
				xor a
				ld  (isr_c2), a
		#endasm
	#endif

	#asm
			call cpc_ShowTouchedTiles
			call cpc_ResetTouchedTiles
	#endasm
}

void __FASTCALL__ cpc_Border (unsigned char b) {
	#asm
			ld 	a, l
			ld  bc, 0x7F11
			out (c), c
			out (c), a
	#endasm
}

void pal_set (unsigned char *pal) {
	#ifdef MODE_1
		gpit = 4;
	#else
		gpit = 16;
	#endif
	while (gpit --) cpc_SetColour (gpit, pal[gpit]);
}

void __FASTCALL__ cpc_HardPause (unsigned char n) {
	#asm
			ld  a, l
		.cpc_HardPause_outer
			ld  b, 6
		.cpc_HardPause_inner
			halt
			djnz cpc_HardPause_inner
			dec a
			jr  nz, cpc_HardPause_outer
	#endasm
}