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

#define STACK_SIZE 			64
// This figure depends the amount of sprites.
// Add 10 for each 16x16 sprite.
// Add 13 for each 16x24 sprite.
// Add 5 for each 8x8 sprite (such as bullets or sword)
#define NUMBLOCKS 			40

#define STACK_ADDR 			61936
#define AD_FREE				61440-(NUMBLOCKS*15)

#define BORDER(b) 				asm("ld a,"#b"\nout (254),a")

// Controller

struct sp_UDK keys = {
	0x017f, // .fire
	0x01df, // .right
	0x02df, // .left
	0x01fd, // .down
	0x01fb	// .up
};
void *joyfunc;

#ifdef SCRIPTING_KEY_M
	int key_m = 0x047f;
#endif

#ifdef USE_SUICIDE_KEY
	int key_s = 0x02fd;
#endif

unsigned int key_1 = 0x01f7;
unsigned int key_2 = 0x02f7;
unsigned int key_3 = 0x04f7;

// System

void *my_malloc(uint bytes) { return sp_BlockAlloc(0); }
void *u_malloc = my_malloc;
void *u_free = NULL; //sp_FreeBlock;

// Sprite structs

struct sp_SS *sp_player;
struct sp_SS *sp_moviles [MAX_ENEMS];
#ifdef PLAYER_CAN_FIRE
	struct sp_SS *sp_bullets [MAX_BULLETS];
#endif
#ifdef ENABLE_SWORD
	struct sp_SS *sp_sword;
#endif

struct sp_Rect spritesClipValues = { VIEWPORT_Y, VIEWPORT_X, 20, 30 };
struct sp_Rect *spritesClip;

#asm
	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb VIEWPORT_Y, VIEWPORT_Y + 20, VIEWPORT_X, VIEWPORT_X + 30
#endasm

unsigned char isrc           @ 23296;
unsigned char ay_player_on   @ 23297;
unsigned char ay_counter     @ 23298;

#ifndef ENEMS_CELL_OFFSET
	#define ENEMS_CELL_OFFSET 8
#endif

#ifdef CUSTOM_SPRITE_CELLS
	#include "custom_sprite_cells.h"
#else
	unsigned char *sprite_cells [] = {
	sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
	sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a,
	sprite_9_a, sprite_10_a, sprite_11_a, sprite_12_a,
	sprite_13_a, sprite_14_a, sprite_15_a, sprite_16_a
};
#endif

#asm
	defw 0	// 2 bytes libres
#endasm

void ISR (void) {	
	#asm
			ld  hl, _isrc
			inc (hl)
	#endasm
}

void system_init (void) {
	// Inits shit
	#asm
			di 

			ld  bc, 0xf1f1 
			call SPInitIM2

			ld  de, 0xf1f1
			call SPCreateGenericISR

			ld  l, 255
			ld  bc, _ISR 
			call SPRegisterHook

			ld de, 0
			call SPInitialize
			ei
	#endasm

	BORDER(0);
	sp_AddMemory (0, NUMBLOCKS, 14, AD_FREE);
	
		// Define keys and default controls
	joyfunc = sp_JoyKeyboard;

	// Load tileset
	#asm
			ld  b, 0
			ld  hl, SPTileArray
			ld  de, _tileset
		.load_tileset_loop
			ld  (hl), e
			inc h
			ld  (hl), d
			dec h
			inc hl
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			djnz load_tileset_loop
	#endasm

	// Clipping rectangle	
	spritesClip = &spritesClipValues;

	// Sprite creation
	#ifdef NO_MASKS
		sp_player = sp_CreateSpr (NO_MASKS, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_b);	// This is a dummy and will be overwritten later
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(NO_MASKS, 3, sprite_9_a, 1);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);	// This is a dummy and will be overwritten later	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#else
		sp_player = sp_CreateSpr (sp_MASK_SPRITE, 3, sprite_2_a, 1);
		sp_AddColSpr (sp_player, sprite_2_b);
		sp_AddColSpr (sp_player, sprite_2_b);	// This is a dummy and will be overwritten later
		player.current_frame = player.next_frame = sprite_2_a;
		
		for (rdi = 0; rdi < MAX_ENEMS; rdi ++) {
			sp_moviles [rdi] = sp_CreateSpr(sp_MASK_SPRITE, 3, sprite_9_a, 2);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);
			sp_AddColSpr (sp_moviles [rdi], sprite_9_b);	// This is a dummy and will be overwritten later	
			en_an_current_frame [rdi] = sprite_9_a;
		}
	#endif

	// Create a virtual, non existent third column for sprites.
	
	#asm
		.fix_sprites
			ld  b, 6
			ld  hl, (_sp_player) 			// Sprite base pointer
			call _fix_sprites

			ld  de, _sp_moviles
			ld  b, MAX_ENEMS 

		.fix_sprites_rep1
			push bc
			ld  a, (de)
			ld  l, a
			inc de 
			ld  a, (de)
			ld  h, a
			inc de 

			ld  b, 6
			call _fix_sprites

			pop bc 
			djnz fix_sprites_rep1
	#endasm

	#ifdef PLAYER_CAN_FIRE
		for (rdi = 0; rdi < MAX_BULLETS; rdi ++) {
			sp_bullets [rdi] = sp_CreateSpr (sp_OR_SPRITE, 2, sprite_19_a, 1);
			sp_AddColSpr (sp_bullets [rdi], sprite_19_b);
		}
	#endif
}

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
		/*
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
		*/
		#asm
				// Get back my buffer coordinates!
				ld  a, (__x)
				sub VIEWPORT_X
				srl a 
				ld  (_prxx), a
				ld  c, a

				ld  a, (__y)
				sub VIEWPORT_Y
				srl a 
				ld  (_pryy), a

				// Can this tile get shadows?

				call _attr_2

				ld  a, l 
				and 8 
				jp  nz, dct_dont_shade_this_tile

				ld  a, (__t)
				cp  16 
				jr  c, dct_shade_this_tile

				cp  19
				jp  nz, dct_dont_shade_this_tile

			.dct_shade_this_tile
				// Tile 19 is shaded as tile 0.
				cp  19
				jr  nz, dct_not_19

				ld  a, 140
				ld  (__t), a 
				ld  a, 192
				ld  (_t_alt), a

				jr  dct_shade_this_tile_do

			.dct_not_19
				sla a
				sla a
				add 64
				ld  (__t), a 
				add 128
				ld  (_t_alt), a

			.dct_shade_this_tile_do
				// Draw chars from __t if not shaded, from _t_alt if shaded.

				// Attributes are a bummer
				ld  hl, (__t)
				ld  h, 0
				ld  de, 2048
				add hl, de 
				ld  de, _tileset
				add hl, de 
				ld  (_gp_gen_org), hl

				ld  hl, (_t_alt)
				ld  h, 0
				ld  de, 2048
				add hl, de 
				ld  de, _tileset
				add hl, de 
				ld  (_gp_gen_alt), hl

				// Top left
				ld  a, (_prxx)
				dec a 
				ld  c, a
				ld  a, (_pryy) 
				dec a 
				call dct_sts_p_do
				ld  hl, __x
				inc (hl)

				// Top right
				ld  a, (_prxx)				
				ld  c, a
				ld  a, (_pryy) 
				dec a 
				call dct_sts_p_do
				ld  hl, __x
				dec (hl)
				ld  hl, __y
				inc (hl)

				// Bottom left
				ld  a, (_prxx)
				dec a
				ld  c, a
				ld  a, (_pryy) 
				call dct_sts_p_do
				ld  hl, __x
				inc (hl)

				// Bottom right is never shaded.
				jr dct_sts_p_nonshaded

			.dct_sts_p_do
				call _attr_2
				ld  a, l
				and 8 
				jr  z, dct_sts_p_nonshaded
			
			.dct_sts_p_shaded
				ld  hl, (_gp_gen_alt)
				ld  a, (_t_alt)
				ld  e, a
				jr  dct_sts_p_paint

			.dct_sts_p_nonshaded
				ld  hl, (_gp_gen_org)
				ld  a, (__t)
				ld  e, a

			.dct_sts_p_paint
				ld  d, (hl)
				ld  a, (__x)
				ld  c, a 
				ld  a, (__y)

				call SPPrintAtInv

				ld  hl, (_gp_gen_org)
				inc hl 
				ld  (_gp_gen_org), hl
				ld  hl, (_gp_gen_alt)
				inc hl 
				ld  (_gp_gen_alt), hl

				ld  hl, __t
				inc (hl)
				ld  hl, _t_alt
				inc (hl)

				ret

			.dct_dont_shade_this_tile
		#endasm
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

		#if defined ACTIVATE_SCRIPTING && defined TEXT_X
			.draw_line_of_text
				;; Entry point called from msc4i
				;; HL should point to string.
				ld  a, TEXT_X
				ld  (__t), a 
				ld  (__x), a
				ld  a, TEXT_Y
				ld  (__y), a
				ld  a, TEXT_A
				ld  (__n), a 
				jr  draw_text_loop
		#endif

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

void no_break (void) {
	for (gpit = 0; gpit < 40; gpit ++) {
		#asm 
			halt
		#endasm
	}
}

void espera_activa (int espera) {
	do {
		pad_read ();
		#asm
				halt
		#endasm
		if (pad_this_frame != 0xff) break;
	} while (-- espera);
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
	while (1) {
		//rand ();

		if (sp_KeyPressed (key_1)) {
			joyfunc = sp_JoyKeyboard; break;
		} else if (sp_KeyPressed (key_2)) {
			joyfunc = sp_JoyKempston; break;
		} else if (sp_KeyPressed (key_3)) {
			joyfunc = sp_JoySinclair1; break;
		}			
	}
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

void render_this_enemy (void) {
	#asm
			// sp_moviles [enit] = sp_moviles + enit*2
			ld  a, (_enit)
			sla a
			ld  c, a
			ld  b, 0 				// BC = offset to [enit] in 16bit arrays
			ld  hl, _sp_moviles
			add hl, bc
			ld  e, (hl)
			inc hl 
			ld  d, (hl)
			push de						
			pop ix

			// Clipping rectangle
			ld  iy, vpClipStruct

			// Animation
			// en_an_next_frame [enit] - en_an_current_frame [enit]
			ld  hl, _en_an_current_frame
			add hl, bc 				// HL -> en_an_current_frame [enit]
			ld  e, (hl)
			inc hl 
			ld  d, (hl) 			// DE = en_an_current_frame [enit]

			ld  hl, _en_an_next_frame
			add hl, bc 				// HL -> en_an_next_frame [enit]
			ld  a, (hl)
			inc hl
			ld  h, (hl)
			ld  l, a 				// HL = en_an_next_frame [enit]

			or  a 					// clear carry
			sbc hl, de 				// en_an_next_frame [enit] - en_an_current_frame [enit]

			push bc 				// Save for later

			ld  b, h
			ld  c, l 				// ** BC = animate bitdef **	

			//VIEWPORT_Y + (rdy >> 3), VIEWPORT_X + (rdx >> 3)
			ld  a, (_rdy)					
			srl a
			srl a
			srl a
			add VIEWPORT_Y
			ld h, a

			ld  a, (_rdx)
			srl a
			srl a
			srl a
			add VIEWPORT_X
			ld  l, a

			// rdx & 7, rdy & 7
			ld  a, (_rdx)
			and 7
			ld  d, a

			ld  a, (_rdy)
			and 7
			ld  e, a

			call SPMoveSprAbs

			// en_an_current_frame [enit] = en_an_next_frame [enit];

			pop bc 					// Retrieve index

			ld  hl, _en_an_current_frame
			add hl, bc
			ex  de, hl 				// DE -> en_an_current_frame [enit]	

			ld  hl, _en_an_next_frame
			add hl, bc 				// HL -> en_an_next_frame [enit]

			ldi
			ldi
	#endasm
}


void render_all_sprites (void) {
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		#asm
				ld  hl, (_enoffs)
				ld  bc, (_enit)
				ld  b, 0
				add hl, bc
				
				call _calc_baddies_pointer

				// malotes struct is:
				// x, y, x1, y1, x2, y2, mx, my, t[, life]

				ld  a, (hl)
				ld  (_rdx), a 
				inc hl 

				ld  a, (hl)
				ld  (_rdy), a 

				call _render_this_enemy
		#endasm
	}

	#ifdef TALL_PLAYER
		rdy = gpy - 8;
	#else
		rdy = gpy; 
	#endif

	#asm
			ld  a, (_player + 23)		// player.estado
			and EST_PARP 
			jr  z, render_player_on_screen

			ld  a, (_half_life)
			or  a 
			jr  nz, render_player_on_screen
		
		.render_player_off_screen
			ld  a, 240
			jr  render_player_set_x 
		
		.render_player_on_screen
			ld  a, (_gpx) 

		.render_player_set_x
			ld  (_rdx), a 

		.render_player
			ld  ix, (_sp_player)
			ld  iy, vpClipStruct

			ld  hl, (_player + 17)			// player.next_frame
			ld  de, (_player + 15) 			// player.current_frame
			or  a
			sbc hl, de
			ld  b, h
			ld  c, l

			ld  a, (_rdy)
			srl a
			srl a
			srl a
			add VIEWPORT_Y
			ld  h, a 

			ld  a, (_rdx)
			srl a
			srl a
			srl a
			add VIEWPORT_X
			ld  l, a 
			
			ld  a, (_rdx)
			and 7
			ld  d, a

			ld  a, (_rdy)
			and 7
			ld  e, a

			call SPMoveSprAbs
	#endasm

	player.current_frame = player.next_frame;

	#ifdef PLAYER_CAN_FIRE
		for (rdi = 0; rdi < MAX_BULLETS; rdi ++) {
			if (bullets_estado [rdi]) {
				rdx = bullets_x [rdi]; rdy = bullets_y [rdi];

				#asm
						ld  a, (_rdi)
						sla a
						ld  c, a
						ld  b, 0 				// BC = offset to [gpit] in 16bit arrays
						ld  hl, _sp_bullets
						add hl, bc
						ld  e, (hl)
						inc hl 
						ld  d, (hl)
						push de						
						pop ix

						ld  iy, vpClipStruct
						ld  bc, 0

						ld  a, (_rdy)
						srl a
						srl a
						srl a
						add VIEWPORT_Y
						ld  h, a

						ld  a, (_rdx)
						srl a
						srl a
						srl a
						add VIEWPORT_X
						ld  l, a

						ld  a, (_rdx)
						and 7
						ld  d, a 

						ld  a, (_rdy)
						and 7
						ld  e, a 
						
						call SPMoveSprAbs
				#endasm				
			} else {
				//sp_MoveSprAbs (sp_bullets [rdi], spritesClip, 0, -2, -2, 0, 0);
				#asm
						ld  a, (_rdi)
						sla a
						ld  c, a
						ld  b, 0 				// BC = offset to [gpit] in 16bit arrays
						ld  hl, _sp_bullets
						add hl, bc
						ld  e, (hl)
						inc hl 
						ld  d, (hl)
						push de						
						pop ix

						ld  iy, vpClipStruct
						ld  bc, 0

						ld  hl, 0xfefe
						ld  de, 0 
						
						call SPMoveSprAbs
				#endasm
			}
		}
	#endif
}

void saca_a_todo_el_mundo_de_aqui (void) {
	// ¡Saca a todo el mundo de aquí!
	#asm
			ld  ix, (_sp_player)
			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0
			call SPMoveSprAbs
	
			xor a
		.hide_sprites_enems_loop
			ld  (_gpit), a

			sla a
			ld  c, a
			ld  b, 0
			ld  hl, _sp_moviles
			add hl, bc
			ld  e, (hl)
			inc hl
			ld  d, (hl)
			push de
			pop ix

			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0

			call SPMoveSprAbs

			ld  a, (_gpit)
			inc a
			cp  MAX_ENEMS
			jr  nz, hide_sprites_enems_loop

		#ifdef ENABLE_SWORD
			ld  ix, (_sp_sword)
			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0
			call SPMoveSprAbs			
		#endif
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
			add ENEMS_CELL_OFFSET
			ld  hl, (_enit)
			ld  h, 0 
			ld  de, _en_an_base_frame 
			add hl, de 			// HL ->en_an_base_frame [enit]
			ld  (hl), a 		// en_an_base_frame [enit] = (n << 1) + ENEMS_OFFSET
			
			jp _enems_calc_frame
	#endasm
}

#asm
	.playsfx
		;di
		ld l,a
		ld h,0
		add hl,hl
		ld de,proclist
		add hl,de
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		ld de,0
		jp (hl)
	
	.sound1	;enemy destroyed
		ex de,hl
		ld bc,500
	.sound1l0
		ld a,(hl)
		and 16
		out ($FE),a
		ld e,a
		inc a
		sla a
		sla a
	.sound1l1
		dec a
		jr nz,sound1l1
		out ($FE),a
		ld a,e
		inc a
		add a,a
		add a,a
		add a,a
	.sound1l2
		dec a
		jr nz,sound1l2
		ld a,b
		inc hl
		dec bc
		ld a,b
		or c
		jr nz,sound1l0
		;ei
		ret
	
	.sound2	;enemy hit
		ex de,hl
		ld bc,40*256+100
	.sound2l0
		ld a,(hl)
		and 16
		out ($FE),a
		inc hl
		ld a,c
	.sound2l1
		dec a
		jr nz,sound2l1
		out ($FE),a
		ld a,c
	.sound2l2
		dec a
		jr nz,sound2l2
		djnz sound2l0
		;ei
		ret
	
	.sound3	;something
		ex de,hl
		ld b,100
		ld de,$1020
	.sound3l0
		ld a,(hl)
		and d
		out ($FE),a
		inc hl
		ld a,e
	.sound3l0a
		dec a
		jr nz,sound3l0a
		djnz sound3l0
		ld b,250
	.sound3l1
		ld a,(hl)
		and d
		out ($FE),a
		inc hl
		ld a,2
	.sound3l2
		dec a
		jr nz,sound3l2
		xor a
		out ($FE),a
		ld a,e
	.sound3l3
		dec a
		jr nz,sound3l3
		djnz sound3l1
		;ei
		ret
	
	.sound4	;jump
		ld bc,20*256+250
	.sound4l0
		ld a,16
		out ($FE),a
		ld a,4
	.sound4l1
		dec a
		jr nz,sound4l1
		out ($FE),a
		ld a,c
	.sound4l2
		dec a
		jr nz,sound4l2
		dec c
		dec c
		djnz sound4l0
		;ei
		ret
	
	.sound5	;player hit
		ex de,hl
		ld bc,100*256+16
	.sound5l0
		ld a,(hl)
		and c
		out ($FE),a
		inc hl
		ld a,110
		sub b
		ld e,a
		and c
		out ($FE),a
	.sound5l1
		dec e
		jr nz,sound5l1
		djnz sound5l0
		;ei
		ret
	
	.sound6	;enemy destroyed 2
		ex de,hl
		ld bc,20*256+16
	.sound6l0
		ld a,(hl)
		inc hl
		and c
		out ($FE),a
		xor a
	.sound6l0a
		dec a
		jr nz,sound6l0a
		djnz sound6l0
	.sound6l1
		ld a,(hl)
		inc hl
		and c
		out ($FE),a
	.sound6l2
		dec a
		jr nz,sound6l2
		djnz sound6l1
		;ei
		ret
		
	.sound7	;shot
		ex de,hl
		ld bc,100*256
	.sound7l0
		ld a,(hl)
		inc hl
		or c
		and 16
		out ($FE),a
		ld a,(hl)
		srl a
		srl a
	.sound7l1
		dec a
		jr nz,sound7l1
		ld a,c
		add a,4
		ld c,a
		djnz sound7l0
		;ei
		ret
	
	.sound8	;take item
		ld a,200
		jr soundItem
	.sound9
		ld a,175
		jr soundItem
	.sound10
		ld a,100
	.soundItem
		ld (frq),a
		ld b,4
		ld d,128
	.sound8l2
		push bc
	;.frq=$+1
	;	ld bc,2*256+200
		defb #01	;ld bc
	.frq
		defb 200	;+200
		defb 2	;2*256
	.sound8l0
		push bc
		ld b,50
	.sound8l1
		xor 16
		and 16
		out ($FE),a
		ld e,a
		ld a,d
	.sound8l2b
		dec a
		jr nz,sound8l2b
		out ($FE),a
		ld a,129
		sub d
	.sound8l3
		dec a
		jr nz,sound8l3
		ld a,e
		ld e,c
	.sound8l4
		dec e
		jr nz,sound8l4
		djnz sound8l1
		pop bc
		ld a,c
		sub 16
		ld c,a
		djnz sound8l0
		pop bc
		srl d
		srl d
		djnz sound8l2
		;ei
		ret
	
	.proclist
		defw sound1
		defw sound2
		defw sound3
		defw sound4
		defw sound5
		defw sound6
		defw sound7
		defw sound8
		defw sound9
		defw sound10
#endasm

/*
	TABLA DE SONIDOS

	n	Sonido
	----------
	0	Enemy destroyed
	1	Enemy hit
	2	Something - Push Boxes
	3	Jump
	4	Player hit
	5	Enemy destroyed 2
	6	Shot
	7	Item #1		(item)
	8	Item #2		(key)
	9	Item #3		(life)
	
*/

void __FASTCALL__ peta_el_beeper (unsigned char n) {
	#asm
		ld a, l
		call playsfx
	#endasm
}

#ifdef DEBUG
	unsigned char drda, drdb;
	unsigned char hex_code (unsigned char n) {
		if (n < 10) return (n + 16);
		else return n + 23;
	}

	void print_hex (unsigned char x, unsigned char y, unsigned char h) {
		drda = hex_code (h >> 4); drdb = hex_code (h & 15);
		sp_PrintAtInv (y, x, 71, drda);
		sp_PrintAtInv (y, 1 + x, 71, drdb);
	}
#endif
	