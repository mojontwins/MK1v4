// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// churromain.c
// Program skeleton. Rename to your game title.c

#include <spritepack.h>

#define STACK_ADDR		61952
#define STACK_SIZE 		128

// This figure depends the amount of sprites.
// Add 10 for each 16x16 sprite.
// Add 5 for each 8x8 sprite (such as bullets)
#define NUMBLOCKS 		40

// Tighten it even more... Gaining about 1.1 extra Kb 
// You will probably have to tinker with this depending on your game.
#pragma output STACKPTR=61952
#define AD_FREE			STACK_ADDR-STACK_SIZE-(NUMBLOCKS*15)

#include "config.h"

// Program modules in strict order...

#include "definitions.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif
#include "aplib.h"
#include "pantallas.h"
#include "mapa.h"
#include "tileset.h"
#include "sprites.h"
#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE) || defined(NO_MAX_ENEMS) || defined(BOXES_KILL_ENEMIES)
	#include "extrasprites.h"
#endif
#include "enems.h"
#include "beeper.h"
#include "printer.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc.h"
#endif
#include "msc_extern.h"
#include "engine.h"
#include "boxes.h"
#include "mainloop.h"

// From beepola. Phaser engine by Shiru. We stick this at the end 'cause
// we don't want this in contended memory.

#include "music.h"

// And that's all, folks.
