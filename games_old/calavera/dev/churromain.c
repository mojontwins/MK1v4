// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// Original 3.2 made dual & updated with current backend. 

// churromain.c

#include "config.h"

#define MAX_ENEMS 3
#define MAX_FLAGS 16

#if defined PLAYER_KILLS_ENEMIES || defined PLAYER_CAN_FIRE
	#define ENEMIES_MAY_DIE
#endif

// Cosas del juego:
#ifdef CPC
	#include "cpc/tileset.h"
	#include "cpc/sprites.h"
	#include "cpc/extrasprites.h"
#else
	#include "speccy/tileset.h"
	#include "speccy/sprites.h"
	#include "speccy/extrasprites.h"
#endif

#include "definitions.h"
#ifdef CPC
	#include "cpc.h"
#else
	#include "speccy.h"
#endif
#ifdef ACTIVATE_SCRIPTING
	#include "msc4i.h" 
#endif
#include "zx0.h"
#include "mapa.h"
#if MAX_CERROJOS == 0
	#define DEACTIVATE_KEYS
#endif
#include "enems.h"

#include "engine.h"
#ifdef ACTIVATE_SCRIPTING
	#include "extern.h"
#endif
#include "pantallas.h"
#include "mainloop.h" 	// Main is here!
#ifndef CPC
	#include "music.h"
#endif
