// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// churromain.c
// Program skeleton. Rename to your game title.c

// CPC Memory map
// 0100 tilemap
// 0400 ejecutable
// 8800 descomprimir canción
// 9000 buffer
// C000 pantalla (a trozos)
// C600 room buffers
// CE00 dirty cells (tiles_tocados)
// D600 arrays
// DF80 buffers WYZ
// E600 sprite structures
// FE00 LUT

//#define DEBUG

#include <cpcrslib.h>

#include "config.h"

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

#define MAX_ENEMS 		3

#define BASE_TILEMAP 		0x0100
#define WYZ_SONG_BUFFER 	0x8800
#define BASE_ROOM_BUFFERS	0xC000 + 0x600
#define BASE_DIRTY_CELLS 	0xC800 + 0x600
#define BASE_ARRAYS 		0xD000 + 0x600
#define BASE_WYZ 			0xDF80
#define BASE_SPRITES 		0xE000 + 0x600
#define BASE_LUT			0xF800 + 0x600

#define BASE_SUPERBUFF  	0x9000

#define ANIMATED_BASE		0xE800 - MAX_ANIMATED_TILES
#define PERSIST_BASE 		0xE800 + 0x600

// Number of sprites and handy macros

// Shortcuts
#if defined PLAYER_KILLS_ENEMIES || defined PLAYER_CAN_FIRE || defined BOXES_KILL_ENEMIES || defined ENABLE_SWORD
	#define ENEMIES_MAY_DIE
#endif

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

#define SW_SPRITES_ALL 		1 + MAX_ENEMS + MAX_BULLETS + SWORD_SW_SPRITE_ON + MAX_CUSTOM_SW_SPRITES

#define SP_PLAYER 			0
#define SP_ENEMS_BASE 		1
#define SP_BULLETS_BASE 	(SP_ENEMS_BASE + MAX_ENEMS)
#define SP_SWORD_BASE 		(SP_BULLETS_BASE + MAX_BULLETS)
#define SP_CUSTOM_BASE		(SP_SWORD_BASE + SWORD_SW_SPRITE_ON)

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

// Program modules in strict order...

#include "definitions.h"
#include "pal.h"
#include "mtasmlib.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif
#include "aplib.h"
#ifdef SOUND_WYZ
	#include "wyz/efectos.h"
	#include "wyz/instrumentos.h"
	#include "wyz/songs.h"
	#include "wyz/wyz_player.h"
#endif
#include "mapa.h"
#include "tileset.h"
#include "sprites.h"
#include "spriteset_mappings.h"
#include "extrasprites.h"
#include "enems.h"
#include "beeper.h"
#include "printer.h"
#include "custom.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc.h"
#endif
#include "pantallas.h"
#include "msc_extern.h"
#include "engine.h"
#include "boxes.h"
#include "mainloop.h"

// And that's all, folks.
