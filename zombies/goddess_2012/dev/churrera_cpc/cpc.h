// CPC Layer for Churrera
// Rutinas de sustitución para hacer rápidamente la portación churrera a CPCr.
// Te QuierooooooooooooOO!!
// Copyleft 2012 the Mojon Twins

// Update 2025 :: Actualizado con las últimas versiones actuales (en ensamble)
//                (Principalmente para que funcionen con la CPCRSLIB_mt)
//                (Más que nada porque no tengo la versión exacta de CPCRSLIB vieja)

unsigned char px, py, pxx, pyy, pt, pt_alt, pn;
unsigned char *pptr, *pptr_alt; 

// CPCrsLIB version Mojon Twins. Specially rewritten for MK1

#include <cpcrslib_mt.h>

#define BLACK_PEN 1
#define MIN_FAPS_PER_FRAME 2

// We are using some stuff from CPCRSLIB directly

#asm
	// Imports

		XREF _nametable
		XREF tabla_teclas
		LIB cpc_KeysData
		LIB cpc_UpdTileTable
		LIB cpc_InvalidateRect
		LIB cpc_TestKeyboard

	// Exports

		XDEF viewport_x
		XDEF viewport_y

		defc viewport_x = VIEWPORT_X
		defc viewport_y = VIEWPORT_Y
#endasm

// We need a ISR and set up a few things.

#include "churrera_cpc/tileset.h"
#include "churrera_cpc/sprites.h"
#include "churrera_cpc/extrasprites.h"
#include "churrera_cpc/spriteset_mappings.h"

#define WYZ_FX_CHANNEL 1
unsigned char isr_player_on;
unsigned char wyz_beat_ct;

#include "churrera_cpc/efectos.h"
#include "churrera_cpc/instrumentos.h"
#include "churrera_cpc/songs.h"
#include "churrera_cpc/wyz_player.h"

// Number of sprites and handy macros

#define MAX_ENEMS 3

// Shortcuts
		
#ifndef PLAYER_CAN_FIRE
	#ifdef MAX_BULLETS
		#undef MAX_BULLETS
	#endif
	#define MAX_BULLETS 0
#endif

#ifdef ENABLE_SWORD
	#define SWORD_SW_SPRITE_ON 1
#else
	#define SWORD_SW_SPRITE_ON 0
#endif

#ifdef SHOW_LEVEL_INFO
	#define NEEDS_BLACKOUT_AREA
#endif

#if defined COINS_PERSISTENT || defined BREAKABLE_PERSISTENT
	#define ENABLE_PERSISTENCE
#endif

#ifndef MAX_CUSTOM_SW_SPRITES
	#define MAX_CUSTOM_SW_SPRITES 0
#endif

#define SW_SPRITES_ALL 		1 + MAX_ENEMS + MAX_BULLETS + SWORD_SW_SPRITE_ON + MAX_CUSTOM_SW_SPRITES

#define SP_PLAYER 			0
#define SP_ENEMS_BASE 		1
#define SP_BULLETS_BASE 	(SP_ENEMS_BASE + MAX_ENEMS)
#define SP_SWORD_BASE 		(SP_BULLETS_BASE + MAX_BULLETS)
#define SP_COCOS_BASE 		(SP_SWORD_BASE + SWORD_SW_SPRITE_ON)
#define SP_CUSTOM_BASE		(SP_COCOS_BASE + MAX_ENEMS)

#ifdef MODE_1
	// P_0 P_1 P_2 P_3
	// 1 0 1 0 1 0 1 0
	// 3 7 2 6 1 5 0 4
	#define BLACK_COLOUR_BYTE (BLACK_PEN>>1)|((BLACK_PEN>>1)<<1)\
								|((BLACK_PEN>>1)<<2)|((BLACK_PEN>>1)<<3)\
								|((BLACK_PEN&1)<<4)|((BLACK_PEN&1)<<5)\
								|((BLACK_PEN&1)<<6)|((BLACK_PEN&1)<<7)
#else
	// PIXEL 0  PIXEL 1
	// 3 2 1 0  3 2 1 0
	// 1 5 3 7  0 4 2 6
	#define BLACK_COLOUR_BYTE ((BLACK_PEN>>3)&1)|(((BLACK_PEN>>3)&1)<<1)\
								|(((BLACK_PEN>>1)&1)<<2)|(((BLACK_PEN>>1)&1)<<3)\
								|(((BLACK_PEN>>2)&1)<<4)|(((BLACK_PEN>>2)&1)<<5)\
								|((BLACK_PEN&1)<<6)|((BLACK_PEN&1)<<7)
#endif

extern unsigned char trpixlutc [0];

#asm
	; LUT for transparent pixels in sprites
	; taken from CPCTelera
	._trpixlutc
		BINARY "trpixlutc.bin"
#endasm

#define BORDER(b) 				cpc_Border((b))

// Controller

// Look up the numbers @ https://lronaldo.github.io/cpctelera/files/keyboard/keyboard-txt.html)

extern unsigned char def_keys [0];
#asm
	._def_keys
		defw $4404 		; LEFT     O
		defw $4308 		; RIGHT    P
		defw $4808 		; UP       Q
		defw $4820 		; DOWN     A

		defw $4580 		; BUTTON_A SPACE
		defw $4808 		; BUTTON_B Q

		defw $4801 		; KEY_AUX3 1
		defw $4802 		; KEY_AUX4 2

		defw $4880		; KEY_AUX1 Z
		defw $4780 		; KEY_AUX2 X

		defw $4204		; KEY_ENTER
		defw $4804		; KEY_ESC	
#endasm

// Bindings for keyboard-mapped joystick

extern unsigned char def_keys_joy [0];
#asm
	._def_keys_joy
		defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
		defw 0x4801, 0x4802, 0x4880, 0x4780, 0x4204, 0x4804
#endasm

// Handy defines

#define KEY_M 0x4440
#define KEY_S 0x4710

#define KEY_1 0x4801
#define KEY_2 0x4802

#define KEY_LEFT 		0
#define KEY_RIGHT		1
#define KEY_UP  		2
#define KEY_DOWN 		3
#define KEY_BUTTON_A	4
#define KEY_BUTTON_B	5
#define KEY_AUX3 		6
#define KEY_AUX4 		7
#define KEY_AUX1		8
#define KEY_AUX2		9
#define KEY_ENTER		10
#define KEY_ESC			11

#define sp_LEFT           0x01
#define sp_RIGHT          0x02
#define sp_UP             0x04		
#define sp_DOWN           0x08
#define sp_FIRE           0x10
#define sp_FIRE2          0x20
#define sp_AUX3           0x40
#define sp_AUX4           0x80

// Sprite structs

typedef struct sprite {
	unsigned int sp0;			// 0
	unsigned int sp1; 			// 2
	unsigned int coord0;
	signed char cox, coy;		// 6 7
	unsigned char cx, cy; 		// 8 9
	unsigned char ox, oy;		// 10 11
	void *invfunc;				// 12
	void *updfunc;				// 14
} SPR;

// Main sprite array. Can contain as many as 16 sprites.

SPR sp_sw [SW_SPRITES_ALL] 					@ BASE_SPRITES;

// Used on player animation

extern unsigned char *player_cells [0];
#asm
	._player_cells 
		defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
		defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
#endasm

// Used on enems animation

extern unsigned char *enem_cells [0];
#asm
	._enem_cells
		defw SPRITE_08, SPRITE_09, SPRITE_0A, SPRITE_0B
		defw SPRITE_0C, SPRITE_0D, SPRITE_0E, SPRITE_0F
#endasm

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

	//unpack ((unsigned int) (trpixlutc), BASE_LUT);
	#asm
			ld  hl, _trpixlutc
			ld  de, BASE_LUT
			call depack
	#endasm

	blackout ();

	/*
		#asm
				call my_inks
		#endasm
	*/
	
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

// Simple version. No AUTO_TILE_SHADOWS, sorry. 

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

void sp_PrintAtInv (unsigned char x, unsigned char y, unsigned char c, unsigned char t) {
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

void draw_2_digits (unsigned char x, unsigned char y, unsigned char value) {
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

void draw_text (unsigned char x, unsigned char y, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 6
			add hl, sp
			
			ld  a, (hl)
			ld  (_px), a
			ld  (_pt), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (_py), a
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

#ifdef PLAYER_SHOW_ITEM
	void draw_item () {
		draw_coloured_tile (ITEM_SHOW_X, ITEM_SHOW_Y, ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1);
	}
#endif

void draw_life () {
	#ifdef DRAW_HI_DIGIT
		sp_PrintAtInv (LIFE_H_Y, LIFE_H_X, 71, 16 + player.life / 100);
	#endif
	draw_2_digits (LIFE_X, LIFE_Y, player.life);
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
			draw_2_digits (OBJECTS_X, OBJECTS_Y, flags [OBJECT_COUNT]);
		#else
			draw_2_digits (OBJECTS_X, OBJECTS_Y, player.objs);
		#endif
	}
#endif

#ifndef DEACTIVATE_KEYS
	void draw_keys () {
		draw_2_digits (OBJECTS_X, OBJECTS_Y, player.keys);
	}
#endif

#if defined (PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)
	void draw_killed () {
		draw_2_digits (OBJECTS_X, OBJECTS_Y, player.killed);
	}
#endif

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
				cpc_PutSPTileMap2Bx8 ((int) (&sp_sw [gpit]));
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

void cpc_MoveSprAbs (SPR *sprite, unsigned char *next_frame, unsigned char cx, unsigned char cy) {
	sprite.sp0 = (int) next_frame;
	// H-coordinates: byte offset (0-63)
	sprite.cx = (VIEWPORT_X * 2) + (cx >> 2);
	// V-coordinates: pixel line (0-191)
	sprite.cy = cy;
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

void select_joyfunc (void) {
	cpc_UpdScr ();
	cpc_ShowTileMap (1);

	AY_PLAY_MUSIC (0);

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
	#endasm
	AY_STOP_SOUND ();
}
