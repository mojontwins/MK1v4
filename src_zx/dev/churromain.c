// MTE MK1 v4.10
// Copyleft 2010-2013, 2020-2024 by The Mojon Twins

// churromain.c
// Program skeleton. Rename to your game title.c

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

	splib2:

61440 - 61696 IM2 vector table
61697 - 61936 FREEPOOL (240 bytes)
61937 - 61948 ISR
61949 - 61951 Free (3 bytes)
61952 - 65535 Horizontal Rotation Tables

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

	* in fact this struct takes 19 * MAX_ENEMS, the number above is for the default 3 enemies.
	** in fact this should be 61440 - 15 * NUM_BLOCKS. The number above is for the default 40 blocks.

	READ:
	* The maximum address your binary may climb up is 61440 - NUM_BLOCKS*15
	* If you are using persistence you must subtract 20*MAP_W*MAP_H
	* If you are using animated tiles you must subtract MAX_ANIMATED_TILES

	So to calculate the max size of your main binary calculate the above top and then
	subtract 24200.

	For example: For 'The hobbit' it is 61440 - 600 - 4 - 24200 = 36636 bytes max.
*/

#include "config.h"

#define MAX_ENEMS 		3
#define STACK_SIZE 		64

// This figure depends the amount of sprites.
// Add 10 for each 16x16 sprite.
// Add 13 for each 16x24 sprite.
// Add 5 for each 8x8 sprite (such as bullets or sword)
#define NUMBLOCKS 		40

// Note how if you need a IM2 table you have less free space
#if defined (MODE_128K_DUAL) || defined (MIN_FAPS_PER_FRAME)
	#define STACK_ADDR 		61936
	#define AD_FREE			61440-(NUMBLOCKS*15)
#else
	#define STACK_ADDR		61952
	#define AD_FREE			61952-STACK_SIZE-(NUMBLOCKS*15)
#endif

// Shortcuts
#if defined PLAYER_KILLS_ENEMIES || defined PLAYER_CAN_FIRE || defined BOXES_KILL_ENEMIES || defined ENABLE_SWORD
	#define ENEMIES_MAY_DIE
#endif

#if defined COINS_PERSISTENT || defined BREAKABLE_PERSISTENT
	#define ENABLE_PERSISTENCE
	#define PERSIST_BASE 	AD_FREE-(MAP_W*MAP_H*20)
#else 
	#define PERSIST_BASE 	AD_FREE
#endif

#if defined PLAYER_PUSH_BOXES && !defined ENEMIES_COLLIDE
	#define ENEMIES_COLLIDE
#endif

#if defined ENABLE_ANIMATED_TILES
	#define ANIMATED_BASE 	PERSIST_BASE-MAX_ANIMATED_TILES
#else
	#define ANIMATED_BASE 	PERSIST_BASE
#endif


// Program modules in strict order...

#include "definitions.h"
#include "mtasmlib.h"
#if defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME
	#include "isr.h"
	#ifdef ENABLE_ARKOS
		#include "arkos.h"
	#endif
	#ifdef ENABLE_WYZ
		#include "wyz.h"
	#endif
#endif
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif
#ifdef DECOMPRESSOR_ZX0
	#include "zx0.h"
#else
	#include "aplib.h"
#endif
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
