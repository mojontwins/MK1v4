// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

// Pestecé specific shit (most of it)

#include <cpcrslib.h>

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

/*
	CPC Memory map
	
	0100 tilemap
	0400 ejecutable
	8800 descomprimir canción
	9000 buffer
	C000 pantalla (a trozos)
	C600 room buffers
	CE00 dirty cells (tiles_tocados)
	D600 arrays
	DF80 buffers WYZ
	E600 sprite structures
	FE00 LUT
*/

// Number of sprites and handy macros

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

#define SW_SPRITES_ALL 		1 + MAX_ENEMS + MAX_BULLETS + SWORD_SW_SPRITE_ON + MAX_CUSTOM_SW_SPRITES

#define SP_PLAYER 			0
#define SP_ENEMS_BASE 		1
#define SP_BULLETS_BASE 	(SP_ENEMS_BASE + MAX_ENEMS)
#define SP_SWORD_BASE 		(SP_BULLETS_BASE + MAX_BULLETS)
#define SP_COCOS_BASE 		(SP_SWORD_BASE + SWORD_SW_SPRITE_ON)
#define SP_CUSTOM_BASE		(SP_COCOS_BASE + MAX_ENEMS)

#ifdef SOUND_NONE
	#define AY_INIT()        ;
	#define AY_PLAY_SOUND(a) ;
	#define play_sfx(a)      ;
	#define AY_STOP_SOUND()  ;
	#define AY_PLAY_MUSIC(a) ;
#elif defined SOUND_WYZ
	#define AY_INIT()        wyz_init ()
	#define AY_PLAY_SOUND(a) wyz_play_sound (a)
	#define play_sfx(a)      wyz_play_sound (a)
	#define AY_STOP_SOUND()  wyz_stop_sound ()
	#define AY_PLAY_MUSIC(a) wyz_play_music (a)
#endif		

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

// How keys work (in sideview)
// - If player can't fire, BUTTON_A will JUMP.
// - If player can fire, and USE_TWO_BUTTONS is DEFINED, BUTTON_A will FIRE, BUTTON_B will JUMP
// - If player can fire, and USE_TWO_BUTTONS is DEFINED, BUTTON_A will FIRE, ÛP will JUMP

// To define different keys, the first two hex digits are the COLUMN, the next the ROW
// (Adapt. from cpctelera docs @ https://lronaldo.github.io/cpctelera/files/keyboard/keyboard-txt.html)
/*
=========================================================================================================
|     |                                       column                                                    |
|     |-------------------------------------------------------------------------------------------------|
| row |     40      |     41     |  42   | 43  | 44  | 45   |     46       | 47  |   48     |    49     |
|=====|=============|============|=======|=====|=====|======|==============|=====|==========|===========|
| 80  | f.          | f0         | Ctrl  | > , | < . | Space| V            | X   | Z        | Del       |
| 40  | Enter       | f2         | ` \   | ? / | M   | N    | B            | C   | Caps Lock| Unused    |
| 20  | f3          | f1         | Shift | * : | K   | J    | F Joy1_Fire1 | D   | A        | Joy0_Fire1|
| 10  | f6          | f5         | f4    | + ; | L   | H    | G Joy1_Fire2 | S   | Tab      | Joy0_Fire2|
| 08  | f9          | f8         | } ]   | P   | I   | Y    | T Joy1_Right | W   | Q        | Joy0_Right|
| 04  | Cursor Down | f7         | Return| | @ | O   | U    | R Joy1_Left  | E   | Esc      | Joy0_Left |
| 02  | Cursor Right| Copy       | { [   | = - | ) 9 | ' 7  | % 5 Joy1_Down| # 3 | " 2      | Joy0_Down |
| 01  | Cursor Up   | Cursor Left| Clr   | £ ^ | _ 0 | ( 8  | & 6 Joy1_Up  | $ 4 | ! 1      | Joy0_Up   |
=========================================================================================================
*/

//#define USE_TWO_BUTTONS					// Alternate keyboard scheme for two-buttons games

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

extern unsigned char def_keys_joy [0];
#asm
	._def_keys_joy
		defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
		defw 0x4801, 0x4802, 0x4880, 0x4780, 0x4204, 0x4804
#endasm

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

SPR sp_sw [SW_SPRITES_ALL] 					@ BASE_SPRITES;
unsigned char *spr_next [SW_SPRITES_ALL] 	@ BASE_SPRITES + (SW_SPRITES_ALL)*16;
unsigned char spr_on [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*18;
unsigned char spr_x [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*19;
unsigned char spr_y [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*20;

unsigned char isr_player_on;
unsigned char wyz_beat_ct;

void system_init (void) {
	// Inits shit

		AY_INIT ();

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
		jp  isr_done

	._isr
		push af 
		
		ld  a, (isr_c1)
		inc a
		cp  6
		jr  c, _skip_ay_player

		ld  a, (isr_c2)
		inc a
		ld  (isr_c2), a

	#ifdef SOUND_WYZ
			ld  a, (_isr_player_on)
			or  a
			jr  z, _skip_ay_player

			push hl
			push de
			push bc
			push ix
			push iy

			call WYZ_PLAYER_ISR

			pop iy
			pop ix
			pop bc
			pop de 
			pop hl

	#endif

		xor a

	._skip_ay_player 
		ld  (isr_c1), a	
		
		pop af
		ei
		ret

	.isr_c1 
		defb 0
	.isr_c2
		defb 0

	.isr_done
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
	pal_set (my_inks);
	
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

			; Vertical chars (24), CRTC REG #6
			ld    b, 0xbc
			ld    c, 6			; REG = 6
			out   (c), c
			inc   b
			ld    c, 24			; VALUE = 24
			out   (c), c
	#endasm

	// Sprite creation

	// Player 

	// sp_sw struct is 16 bytes wide. This is easy
	// 0   2   4      6   7   8  9  10 11 12      14
	// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc

	#asm
		.sprite_creation

			ld  ix, #(BASE_SPRITES+(SP_PLAYER*16))
			
			ld  a, (_sm_cox) 			// sm_cox [0]
			ld  (ix + 6), a

			ld  a, (_sm_coy) 			// sm_coy [0]
			ld  (ix + 7), a

			ld  hl, (_sm_invfunc)		// sm_invfunc [0]
			ld  (ix + 13), h
			ld  (ix + 12), l

			ld  hl, (_sm_updfunc)		// sm_updfunc [0]
			ld  (ix + 15), h
			ld  (ix + 14), l

			ld  hl, _sprite_18_a
			ld  (ix + 1), h
			ld  (ix + 0), l

			ld  (ix + 3), h
			ld  (ix + 2), l			
	#endasm

	// Enemies

	#asm
			ld  ix, #(BASE_SPRITES+(SP_ENEMS_BASE*16))
			ld  de, 16

			ld  b, MAX_ENEMS

		.sp_sw_init_enems_loop
			ld  hl, cpc_PutSpTileMap8x16Px			// sm_invfunc [0]
			ld  (ix + 13), h
			ld  (ix + 12), l

			ld  hl, cpc_PutTrSp8x16TileMap2bPx 		// sm_updfunc [0]
			ld  (ix + 15), h
			ld  (ix + 14), l	

			add ix, de
			djnz sp_sw_init_enems_loop		
	#endasm

	// Bullets

	#ifdef PLAYER_CAN_FIRE
		#asm
				ld  ix, #(BASE_SPRITES+(SP_BULLETS_BASE*16))
				ld  de, 16

				ld  b, MAX_BULLETS

			.sp_sw_init_bullets_loop
				xor a
				ld  (ix + 6), a
				ld  (ix + 7), a

				ld  hl, cpc_PutSpTileMap4x8				// sm_invfunc [0]
				ld  (ix + 13), h
				ld  (ix + 12), l

				ld  hl, cpc_PutTrSp4x8TileMap2b 		// sm_updfunc [0]
				ld  (ix + 15), h
				ld  (ix + 14), l	

				ld  hl, _sprite_19_a 					// sm_sprptr [0]
				ld  (ix + 1), h
				ld  (ix + 0), l

				ld  (ix + 3), h
				ld  (ix + 2), l		

				add ix, de
				djnz sp_sw_init_bullets_loop
		#endasm
	#endif		

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

	#asm
		ei
	#endasm

}

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
			
			// You may call here with __x, __y prefilled 
			// and the number in A.
			
		.draw_2_digits_shortcut
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

void draw_text (unsigned char x, unsigned char y, char *s) {
	// Zero terminated strings, supports newlines with %
	#asm
			ld  hl, 6
			add hl, sp
			
			ld  a, (hl)
			ld  (__x), a
			ld  (__t), a
			dec hl
			dec hl

			ld  a, (hl)
			ld  (__y), a
			dec hl

			ld  a, (hl)
			dec hl 
			ld  l, (hl)
			ld  h, a

		.draw_text_pre_loop
			push hl

			xor a 
			ld  (__n), a 		; Strlen

			call __tile_address	; DE = buffer address
			
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

			ld  a, (__n)
			inc a
			ld  (__n), a

			jr  draw_text_loop

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
	} while (-- espera);
}

void cortina () {
	// Write somethimg :-/
}

void step () {
	// Write somethimg :-/
}

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

void unpack_screen (void) {
	#asm
			ld  de, BASE_SUPERBUFF
			call depack 
	#endasm 
}

void select_controls (void) {
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

void __FASTCALL__ enems_en_an_calc (unsigned char n) {
	// Fastcall so n is in HL
	#asm
			ld  b, l 		// B = n
			sla b 			// B = n << 1

			// Get pointer to enem in IX
			// Won't trash BC
			ld  d, SP_ENEMS_BASE
			call _get_pointer_to_enem_or_coco

			// And now get index to spriteset mappings
			ld  a, b
		#ifdef ENEMS_OFFSET
				add ENEMS_OFFSET
		#endif
			ld  hl, (_enit)
			ld  h, 0 
			ld  de, _en_an_base_frame 
			add hl, de 			// HL ->en_an_base_frame [enit]
			ld  (hl), a 		// en_an_base_frame [enit] = (n << 1) + ENEMS_OFFSET

			// sp_sw struct is 16 bytes wide. This is easy
			// 0   2   4      6   7   8  9  10 11 12      14
			// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc

			// sm_cox, sm_coy are byte arrays
			ld  b, 0 
			ld  c, a 			// BC = index
			
			// sp_sw [rda].cox = sm_cox [rdb];
			ld  hl, _sm_cox 
			add hl, bc 
			ld  a, (hl) 		// A = sm_cox [rdb]
			ld  (ix + 6), a 	// sp_sw[...].cox

			// sp_sw [rda].coy = sm_coy [rdb];
			ld  hl, _sm_coy 
			add hl, bc 
			ld  a, (hl) 		// A = sm_coy [rdb]
			add (ix + 7), a 	// sp_sw[...].coy

			// sm_invfunc, sm_updfunc are 16 bit arrays
			// We'll never have more than 128 sprite faces
			sla c 				// BC = A*2
	
			// sp_sw [rda].invfunc = sm_invfunc [rdb];
			ld  hl, _sm_invfunc 
			add hl, bc 			// HL -> sm_invfunc [rdb]
			ld  e, (hl)
			inc hl 
			ld  d, (hl) 
			ld  (ix + 12), e 
			ld  (ix + 13), d 	// Write 16 bits

			// sp_sw [rda].updfunc = sm_updfunc [rdb];
			ld  hl, _sm_updfunc 
			add hl, bc 
			ld  e, (hl) 
			inc hl 
			ld  d, (hl) 
			ld  d, (hl) 
			ld  (ix + 14), e 
			ld  (ix + 15), d 	// Write 16 bits			
		
			jp _enems_calc_frame
	#endasm
}

