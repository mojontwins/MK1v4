// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// Variables dependientes del sistema (Amstrad CPC)

#include <cpcrslib_mt.h>

#define PLAY_SFX(n) 		wyz_play_sound(n)

// This hack is necessary to integrate msc :/
#define peta_el_beeper(n)	wyz_play_sound(n)

#define BASE_TILEMAP 		0x0100
#define WYZ_SONG_BUFFER 	0x8800
#define BASE_SUPERBUFF  	0x9000
#define BASE_ROOM_BUFFERS	0xC000 + 0x600
#define BASE_DIRTY_CELLS 	0xC800 + 0x600
#define BASE_ARRAYS 		0xD000 + 0x600
#define BASE_WYZ 			0xDF80
#define BASE_SPRITES 		0xE000 + 0x600
#define BASE_CUSTOM 		0xF000 + 0x600
#define BASE_LUT			0xF800 + 0x600

#define BLACK_PEN 1
#define MIN_FAPS_PER_FRAME 2

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

#define WYZ_FX_CHANNEL 1
unsigned char isr_player_on;
unsigned char wyz_beat_ct;

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

