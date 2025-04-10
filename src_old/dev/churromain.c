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
#include "tileset.h"
#include "sprites.h"

#include "definitions.h"
#ifdef CPC
	#include "cpc.h"
#else
	#include "speccy.h"
#endif
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h" 
#endif
#include "zx0.h"
#include "pantallas.h"
#include "mapa.h"
#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)
	#include "extrasprites.h"
#endif
#include "enems.h"
/*
#include "engine.h"
#include "extern.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc.h"
#endif
#include "pantallas.h"
#include "mainloop.h" 	// Main is here!
#include "music.h"
*/
void main(void){}