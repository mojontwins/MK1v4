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

#include <cpcrslib.h>

// We are using some stuff from CPCRSLIB directly
#asm
		XREF _nametable
		LIB cpc_KeysData
		LIB cpc_UpdTileTable
		LIB cpc_InvalidateRect
#endasm

#include "config.h"

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
#define SP_BULLETS_BASE 	SP_ENEMS_BASE + MAX_ENEMS
#define SP_SWORD_BASE 		SP_BULLETS_BASE + MAX_BULLETS
#define SP_CUSTOM_BASE		SP_SWORD_BASE + SWORD_SW_SPRITE_ON

// Program modules in strict order...

#include "definitions.h"
#include "mtasmlib.h"
#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
	#include "isr.h"
	#ifdef ENABLE_ARKOS
		#include "arkos.h"
	#endif
#endif
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif
#include "aplib.h"
#include "mapa.h"
#include "tileset.h"
#include "sprites.h"
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

// From beepola. Phaser engine by Shiru. We stick this at the end 'cause
// we don't want this in contended memory.

#include "music.h"

// And that's all, folks.
