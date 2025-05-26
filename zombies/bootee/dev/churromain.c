// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// churromain.c
// Esqueleto de juegos de la churrera
// Copyleft 2010-2014 The Mojon Twins

#include "config.h"

#ifdef CPC
	#undef MODE_128K
#endif

// NUMBLOCKS es el número de bloques necesario para mover los sprites
// Configurar bien este número es MUY IMPORTANTE

#define NUMBLOCKS 40

// La regla es esta: cada sprite de 16x16 ocupa 10 bloques.
// Cada proyectil ocupa 5 bloques.

// Si, por ejemplo, tu juego no tiene disparos, sólo necesitas bloques
// para el sprite principal y tres enemigos, o sea, 4*10 = 40 bloques.

// Si, por ejemplo, tu juego además lleva 3 proyectiles, necesitarás
// 4*10 + 3*5 = 55 bloques.

// Versión para 48K
#define STACK_SIZE 		64
#define STACK_ADDR		61952
#define AD_FREE 		STACK_ADDR-STACK_SIZE-(NUMBLOCKS*15)

// Versión para 128K
//#define STACK_ADDR 24399
//#define AD_FREE 61952-(NUMBLOCKS*15)

// Optimal place to compile if using COMPRESSED_LEVELS:
// 23296 + MAP_W * MAP_H * (108) + MAX_CERROJOS * 4 + 49

// Cosas del juego:

#ifdef CPC
	#include "cpc\sysvars.h"
#else
	#include "speccy\sysvars.h"
#endif

#include "definitions.h"

#ifdef ACTIVATE_SCRIPTING
	#include "msc-config.h"
#endif

#ifndef CPC
	#ifdef MODE_128K
		#include "speccy_128/128k.h"
		#include "speccy_128/wyzplayer.h"
	#else
		#include "speccy/beeper.h"
	#endif
#else
	#include "cpc/efectos.h"
	#include "cpc/instrumentos.h"
	#include "cpc/songs.h"
	#include "cpc/wyz_player.h"
#endif

#include "zx0.h"

#ifdef MODE_128K
	#include "librarian.h"
	
	#ifdef COMPRESSED_LEVELS
		#include "speccy_128/levels128.h"
	#else
		#include "mapa.h"
		#include "enems.h"
		#include "speccy/tileset.h"
		#include "speccy/sprites.h"
		#include "speccy/extrasprites.h"
	#endif

#else

	#ifdef COMPRESSED_LEVELS
		#include "levels.h"
	#else
		#include "mapa.h"
	#endif

	#ifdef CPC
		#include "cpc/tileset.h"
		#include "cpc/sprites.h"
		#include "cpc/extrasprites.h"
		#include "cpc/spriteset_mappings.h"
		#include "cpc/pal.h"
	#else
		#include "speccy/tileset.h"
		#include "speccy/sprites.h"
		#include "speccy/extrasprites.h"
	#endif
	
	#ifndef COMPRESSED_LEVELS
		#include "enems.h"
	#endif

#endif

#ifdef CPC
	#include "cpc/printer.h"
	#include "cpc/cell_arrays.h"
#else
	#include "speccy/printer.h"
	#include "speccy/cell_arrays.h"
#endif
#include "pantallas.h"

#ifdef ACTIVATE_SCRIPTING
	#ifdef ENABLE_EXTERN_CODE
		#include "extern.h"
	#endif
	#include "msc.h"
#endif

#ifdef ENABLE_TILANIMS
	#include "tilanim.h"
#endif

#include "engine.h"

#ifdef ENABLE_CHECKPOINTS
	#include "savegame.h"
#endif

#include "mainloop.h"

#if !defined CPC && !defined MODE_128K
	// From beepola. Phaser engine by Shiru.
	#include "speccy/music.h"
#endif
