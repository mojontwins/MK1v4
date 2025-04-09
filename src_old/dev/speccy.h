// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

// Peste a Rectum specific shit (most of it)

#include <spritepack.h>

#asm
		LIB SPInvalidate
		LIB SPCompDListAddr
		LIB SPMoveSprAbs
		LIB SPTileArray	
		LIB SPPrintAtInv
		LIB SPUpdateNow
		LIB SPInitialize
		LIB SPNullSprPtr
		LIB SPRegisterHook
		LIB SPCreateGenericISR
		LIB SPInitIM2
		LIB SPInitialize
		LIB SPCreateSpr
		XREF SProtatetblInitialize
		XREF SPDisplayList
#endasm

/* 

	MEMORY MAPS

	Churrera:

	23296           isrc              (IRS counter, used to count frames & limit faps)
	23297           ay_player_on      (AY player is on)
	23298           ay_counter        (current music module row)
	23299           *free*
	23300 - 23449   map_attr          (current screen attributes)
	23450 - 23599   map_buff          (current screen tiles)
	23600 - 23656*  en_an_*           (current screen enemy work arrays)
	23657*- ?????   *free*
	????? - 24199   STACK             (only for 128K games)
	24200 - ?????   MAIN BINARY
	????? - 60839** *may be free*     (or may contain map persistence buffer & animated tile data)
	60840** 61439   AD_FREE           (allocated memory for sprite descriptors, see NUMBLOCKS below)

	splib2:

	61440 - 61696   IM2 vector table
	61697 - 61936   FREEPOOL (240 bytes)
	61937 - 61948   ISR
	61949 - 61951   Free (3 bytes)
	61952 - 65535   Horizontal Rotation Tables
*/

#define STACK_SIZE 		64
// This figure depends the amount of sprites.
// Add 10 for each 16x16 sprite.
// Add 13 for each 16x24 sprite.
// Add 5 for each 8x8 sprite (such as bullets or sword)
#define NUMBLOCKS 		40

#define STACK_ADDR 		61936
#define AD_FREE			61440-(NUMBLOCKS*15)

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

	#if defined USE_AUTO_SHADOWS && !defined UNPACKED_MAP
		prxx = (_x - VIEWPORT_X) >> 1;
		pryy = (_y - VIEWPORT_Y) >> 1;	
		if (attr (prxx, pryy) < 8 && (_t < 16 || _t == 19)) {
			_t = 64 + (_t << 2);
			gp_gen_org = (unsigned char *) &tileset [2048 + _t];
			sp_PrintAtInv (_y, _x, attr (prxx - 1, pryy - 1) == 8 ? (gp_gen_org[0] & 7)-1 : gp_gen_org [0], _t);
			sp_PrintAtInv (_y, _x + 1, attr (prxx, pryy - 1) == 8 ? (gp_gen_org[1] & 7)-1 : gp_gen_org [1], _t + 1);
			sp_PrintAtInv (_y + 1, _x, attr (prxx - 1, pryy) == 8 ? (gp_gen_org[2] & 7)-1 : gp_gen_org [2], _t + 2);
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen_org [3], _t + 3);
		} else
	#elif defined USE_AUTO_TILE_SHADOWS && !defined UNPACKED_MAP
		prxx = (_x - VIEWPORT_X) >> 1;
		pryy = (_y - VIEWPORT_Y) >> 1;	
		if (attr (prxx, pryy) < 4 && (_t < 16 || _t == 19)) {
			if (_t == 19) {
				_t = 140;
				t_alt = 192;				
			} else {
				_t = 64 + (_t << 2);
				t_alt = 128 + _t;
			}

			gp_gen_org = tileset + 2048 + _t;
			gp_gen_alt = tileset + 2048 + t_alt;
			
			if (attr (prxx - 1, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x, gp_gen_alt [0], t_alt);
			} else {
				sp_PrintAtInv (_y, _x, gp_gen_org [0], _t);
			}
			if (attr (prxx, pryy - 1) >= 4) {
				sp_PrintAtInv (_y, _x + 1, gp_gen_alt [1], t_alt + 1);
			} else {
				sp_PrintAtInv (_y, _x + 1, gp_gen_org [1], _t + 1);
			}
			if (attr (prxx - 1, pryy) >= 4) {
				sp_PrintAtInv (_y + 1, _x, gp_gen_alt [2], t_alt + 2);
			} else {
				sp_PrintAtInv (_y + 1, _x, gp_gen_org [2], _t + 2);
			} 
			sp_PrintAtInv (_y + 1, _x + 1, gp_gen_org [3], _t + 3);
		} else
	#endif
	{
		#asm
				ld  a, (__x)
				ld  c, a
				ld  a, (__y)
				call SPCompDListAddr
				ex de, hl

				// Now write 4 attributes and 4 chars.

				// Make a pointer to the metatile colour array	
				ld  a, (__t)
				sla a
				sla a 				// A = _t * 4
				add 64 				// A = _t * 4 + 64
				
				ld  hl, _tileset + 2048
				ld  b, 0
				ld  c, a
				add hl, bc 			// HL = tileset + _taux
				
				ld  c, a 			// C = current pattern #

				// For each char: write colour, inc DE, write tile, inc DE*3
				
				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc de
				inc a 				// next tile
				ld  c, a 

				inc de
				inc de 				// next DisplayList cell

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc a 				// next tile
				
				ex  de, hl
				ld  bc, 123
				add hl, bc
				ex  de, hl			// next DisplayList cell
				ld  c, a 

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de
				inc hl 				// next colour

				ld  a, c  			// read tile
				ld  (de), a			// write tile
				inc de
				inc a 				// next tile
				ld  c, a 

				inc de
				inc de 				// next DisplayList cell

				ld  a, (hl) 		// read colour			
				ld  (de), a 		// write colour
				inc de

				ld  a, c  			// read tile
				ld  (de), a			// write tile

				ld  a, (__x)
				ld  c, a
				inc a
				ld  e, a
				ld  a, (__y)
				ld  b, a
				inc a
				ld  d, a
				ld  iy, fsClipStruct
				call SPInvalidate	
		#endasm
	}		
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
			
		.set_map_tile_do_print
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

unsigned char clr2d = 71;
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
			
			// You may call here with __x, __y prefilled 
			// and the number in A.
			
		.draw_2_digits_shortcut
			ld  d, 0
			ld  e, a

			ld  hl, 10
			call l_div_u 	// HL = division, DE = rest

			ld  a, e
			ld  (__n), a
			ld  a, l
			
			add 16
			ld  e, a
			ld  a, (_clr2d)
			ld  d, a
			ld  a, (__x)
			ld  c, a
			ld  a, (__y)
			call SPPrintAtInv

			ld  a, (__n)
			add 16
			ld  e, a
			ld  a, (_clr2d)
			ld  d, a
			ld  a, (__x)
			inc a
			ld  c, a
			ld  a, (__y)
			call SPPrintAtInv			
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

		.draw_text_loop
			ld  a, (__x)
			ld  c, a
			inc a
			ld  (__x), a

			ld  a, (__n)
			ld  d, a
			
			ld  a, (hl)
			or  a
			ret z
			
			inc hl

			cp  0x25
			jr  z, draw_text_nl

			sub 32
			ld  e, a
			
			ld  a, (__y)
			
			push hl
			call SPPrintAtInv
			pop hl
			
			jr  draw_text_loop

		.draw_text_nl
			ld  a, (__t)
			ld  (__x), a
			ld  a, (__y)
			inc a
			ld  (__y), a
			jr draw_text_loop
	#endasm
}

void any_key (void) {
	#asm
			ld  hl, 0
			xor a
			in  a, (0xfe)
			and 0x1f
			cp  0x1f		// Issue 2/3 safe
			ret z
			ld  l, 1
	#endasm
}

void pad_read (void) {
	pad_this_frame = pad1;
	pad1 = pad0 = (joyfunc) (&keys); 

	// Keys held this frame
	pad_this_frame = (~pad_this_frame) | pad1;
}

void espera_activa (int espera) {
	// Waits until "espera" halts have passed 
	// or a key has been pressed.

	pti = any_key ();
	while (espera--)  {
		#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
			#asm
					halt
			#endasm
		#else
			rdd = 250; do { rdi = 1; } while (rdd --);
		#endif

		ptj = any_key ();
		if (ptj && pti == 0) {
			break;
		}
		pti = ptj;
	}
}

void cortina () {
	#asm
		;; Antes que nada vamos a limpiar el PAPER de toda la pantalla
		;; para que no queden artefactos feos
		
		ld	de, 22528			; Apuntamos con DE a la zona de atributos
		ld	b,	3				; Procesamos 3 tercios
	.clearb1
		push bc
		
		ld	b, 255				; Procesamos los 256 atributos de cada tercio
	.clearb2
	
		ld	a, (de)				; Nos traemos un atributo
		and	199					; Le hacemos la máscara 11000111 y dejamos PAPER a 0
		ld	(de), a				; Y lo volvemos a poner
		
		inc de					; Siguiente atributo
	
		djnz clearb2
		
		pop bc
		djnz clearb1
		
		;; Y ahora el código original que escribí para UWOL:	
	
		ld	a,	8
	
	.repitatodo
		ld	c,	a			; Salvamos el contador de "repitatodo" en 'c'
	
		ld	hl, 16384
		ld	a,	12
	
	.bucle
		ld	b,	a			; Salvamos el contador de "bucle" en 'b'
		ld	a,	255
	
	.bucle1
		sla (hl)
		inc hl
		dec a
		jr	nz, bucle1
			
		ld	a,	255
	.bucle2
		srl (hl)
		inc hl
		dec a
		jr	nz, bucle2
			
		ld	a,	b			; Restituimos el contador de "bucle" a 'a'
		dec a
		jr	nz, bucle
	
		ld	a,	c			; Restituimos el contador de "repitatodo" a 'a'
		dec a
		jr	nz, repitatodo
	#endasm
	// Estoy llorando 
}

void step () {
	#asm
			ld a, 16
			out (254), a
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			xor 16
			out (254), a
	#endasm	
}

void blackout (void) {
	#asm
		.blackout
			ld hl, 22528
			ld de, 22529
			ld bc, 767
			xor a
			ld (hl), a
			ldir
			ret
	#endasm
}

void unpack_screen (void) {
	#asm
			ld  de, 16384
			call depack 
	#endasm 
}

void select_controls (void) {
	#asm
		; Music generated by beepola
		call musicstart
	#endasm
	
	while (1) {
		rand ();

		if (sp_KeyPressed (key_1)) {
			joyfunc = sp_JoyKeyboard; break;
		} else if (sp_KeyPressed (key_2)) {
			joyfunc = sp_JoyKempston; break;
		} else if (sp_KeyPressed (key_3)) {
			joyfunc = sp_JoySinclair1; break;
		}			
	}

	after_title:
}

void draw_rectangle (void) {	
	#asm
			ld  a, (__x)
			ld  c, a

			ld  a, (__y)
			ld  b, a
			
			ld  a, (__x2)
			ld  e, a

			ld  a, (__y2)
			ld  d, a
			
			ld  iy, fsClipStruct
			call SPInvalidate	

		.dr_outter_loop
			ld  a, (__y)
			ld  b, a

			ld  a, (__y2)
			cp  b
			ret c

			ld  a, (__x)
			ld  c, a
			ld  a, (__y)
			call SPCompDListAddr 	// Won't destroy c!

			ld  a, (__x)
			ld  b, a
			ld  a, (__x2)
			inc a 
			sub b
			ld  b, a
			
		.dr_inner_loop
			ld  a, (__t)
			ld  (hl), a
			inc hl
			
			xor a
			ld  (hl), a
			inc hl
			inc hl 
			inc hl			

			djnz dr_inner_loop

		.dr_outter_loop_continue
			ld  hl, __y
			inc (hl)
			jr  dr_outter_loop
	#endasm
}

void fix_sprites() {
	#asm
		// In: HL -> sprite base pointer
		//     B  -> # of members to skip (6 for 16x16, 8 for 16x24)
		.vtc
			ld  c, 0 						// This will be our counter
			ld  a, 6
			add a, l
			ld  l, a
			jp  nc, vtc_noinc1
			inc h
		.vtc_noinc1 						// Now HL -> sp_SS.first

		.vtc_loop
			// Run accross the linked list. Stop at 0:
			ld  a, (hl)
			or  a 
			jr  z, vtc_fin 					// If 0 -> EOL

			inc hl 
			ld  l, (hl)
			ld  h, a 						// Now HL points to sp_CS

			// Note that sp_CS's first member is the pointer to the next item
			// So we save it:
			push hl 

			// We want to modify sp_CS->graphic, which @ offset 7,
			// But only for members "B", onwards.
			ld  a, c 
			cp  b
			jr  c, vtc_next

			// Skip to sp_CS->graphic, offset 7
			ld  a, 7
			add a, l
			ld  l, a
			jp  nc, vtc_noinc2 
			inc h
		.vtc_noinc2 

			// No point to SPCompNullSprPtr
			ld (hl), SPNullSprPtr%256
			inc hl
			ld (hl), SPNullSprPtr/256

		.vtc_next
			// Next item
			inc c
			pop hl 
			jr  vtc_loop

		.vtc_fin
	#endasm
}

void __FASTCALL__ enems_en_an_calc (unsigned char n) {
	// Fastcall so n is in HL
	#asm
			ld  a, l 		// B = n
			sla a 			// B = n << 1
		#ifdef ENEMS_OFFSET
				add ENEMS_OFFSET
		#endif
			ld  hl, (_enit)
			ld  h, 0 
			ld  de, _en_an_base_frame 
			add hl, de 			// HL ->en_an_base_frame [enit]
			ld  (hl), a 		// en_an_base_frame [enit] = (n << 1) + ENEMS_OFFSET
			
			jr _enems_calc_frame
	#endasm
}
