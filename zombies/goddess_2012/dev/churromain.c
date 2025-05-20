// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// churromain.c
// Program skeleton. Rename to your game title.c

#ifndef CPC
	#include <spritepack.h>

	// Tighten it even more... Gaining about 1.1 extra Kb 
	// You will probably have to tinker with this depending on your game.
	#define STACK_SIZE 		64
	#define STACK_ADDR		61952
	#define NUMBLOCKS 		55 		// 4 16x16 + 3 8x8 = 4 * 10 + 3 * 5
	#define AD_FREE			61952-STACK_SIZE-(NUMBLOCKS*15)
#endif

#include "config.h"

// Program modules in strict order...

#include "definitions.h"

#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif

#include "zx0.h"
#include "pantallas.h"
#include "mapa.h"

#ifdef CPC
	#include "churrera_cpc/cpc.h"
#else
	#include "tileset.h"
	#include "sprites.h"
	#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)
		#include "extrasprites.h"
	#endif
	#include "beeper.h"
	#include "printer.h"
#endif

#include "enems.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc.h"
#endif
#include "engine.h"
#include "mainloop.h"

// Main function.

void main (void) {
	#ifndef CPC
		#asm
				ld  sp, STACK_ADDR
		#endasm
	#endif
	system_init ();
	do_game ();
}

#ifndef CPC
	// From beepola. Phaser engine by Shiru. We stick this at the end 'cause
	// we don't want this in contended memory.
	#include "music.h"
#endif

// And that's all, folks.
