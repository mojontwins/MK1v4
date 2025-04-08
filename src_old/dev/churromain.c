// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// Original 3.2 made dual & updated with current backend. 

// churromain.c

#include "config.h"

// Cosas del juego:

#ifdef CPC
	#include "cpc.h"
#else
	#include "speccy.h"
#endif
#include "definitions.h"
#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h" 
#endif
#include "zx0.h"
#include "pantallas.h"
#include "mapa.h"
#include "tileset.h"
#include "sprites.h"
#if defined(PLAYER_KILLS_ENEMIES) || defined(PLAYER_CAN_FIRE)
	#include "extrasprites.h"
#endif
#include "enems.h"
#include "engine.h"
#include "pres.h"
#include "mainloop.h"

// Y el main

void main (void) {
	do_game ();
}

#include "music.h"
