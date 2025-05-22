// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// definitions.h
// Contains type definitions and global variables

#ifdef CPC
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
#else
	#define BASE_ROOM_BUFFERS	23300
	#define BASE_ARRAYS 		23600
#endif

#ifndef CPC
	struct sp_UDK keys;
	void *joyfunc;				// Pointer to the control function selected

	void *my_malloc(uint bytes) {
	   return sp_BlockAlloc(0);
	}

	void *u_malloc = my_malloc;
	void *u_free = sp_FreeBlock;
	
	unsigned char kempston_is_attached;
	struct sp_SS *sp_player;
	struct sp_SS *sp_moviles [3];
	#ifdef PLAYER_CAN_FIRE
		struct sp_SS *sp_bullets [MAX_BULLETS];
	#endif
	struct sp_Rect spritesClipValues;
	struct sp_Rect *spritesClip;
#endif
	
// Globalized globals

unsigned char enoffs;

// Aux

extern signed char asm_number[1];
extern unsigned int asm_int [1];
extern unsigned int asm_int_2 [1];
extern unsigned int seed [1];
unsigned char half_life;
unsigned char jetpac_frame_counter;

#asm
._asm_number 
	defb 0
._asm_int
	defw 0
._asm_int_2
	defw 0
._seed	
	defw 0
#endasm

#define EST_NORMAL 		0
#define EST_PARP 		2
#define EST_MUR 		4
#define sgni(n)			(n < 0 ? -1 : 1)
#define min(a,b)		(a < b ? a : b)
#define ctileoff(n) 	(n > 0 ? 1 : 0)
#define saturate(n)		(n < 0 ? 0 : n)

typedef struct {
	signed int x, y, cx;
	signed int vx, vy;
	signed char g, ax, rx;
	unsigned char salto, cont_salto;
	unsigned char *current_frame, *next_frame;
	unsigned char saltando;
	unsigned char frame, subframe, facing;
	unsigned char estado;
	unsigned char ct_estado;
	unsigned char gotten;
	unsigned char life, objs, keys;
	unsigned char fuel;
	unsigned char killed;
	unsigned char disparando;
} INERCIA;

INERCIA player;
unsigned char gpx, gpy;

unsigned char en_an_frame [3]						@ BASE_ARRAYS;
unsigned char en_an_count [3] 						@ BASE_ARRAYS + 3;
unsigned char *en_an_current_frame [3] 				@ BASE_ARRAYS + 6;
unsigned char *en_an_next_frame [3] 				@ BASE_ARRAYS + 12;

#ifdef PLAYER_CAN_FIRE
	unsigned char en_an_morido [3] 					@ BASE_ARRAYS + 18;
#endif

#if defined(RANDOM_RESPAWN) || defined (USE_TYPE_6)
	signed int en_an_x [3] 							@ BASE_ARRAYS + 21;
	signed int en_an_y [3] 							@ BASE_ARRAYS + 27;
	signed int en_an_vx [3] 						@ BASE_ARRAYS + 33;
	signed int en_an_vy [3] 						@ BASE_ARRAYS + 39;
	#ifdef RANDOM_RESPAWN
		unsigned char en_an_fanty_activo [3] 		@ BASE_ARRAYS + 45;
	#endif
	#ifdef USE_TYPE_6
		unsigned char en_an_state [3] 				@ BASE_ARRAYS + 48;
	#endif	
#endif

#define TYPE_6_IDLE 		0
#define TYPE_6_PURSUING		1
#define TYPE_6_RETREATING	2

#ifdef PLAYER_CAN_FIRE
	unsigned char bullets_x [MAX_BULLETS] 			@ BASE_ARRAYS + 51;
	unsigned char bullets_y [MAX_BULLETS] 			@ BASE_ARRAYS + 51 + MAX_BULLETS;
	signed char bullets_mx [MAX_BULLETS] 			@ BASE_ARRAYS + 51 + 2 * MAX_BULLETS ;
	unsigned char bullets_estado [MAX_BULLETS] 		@ BASE_ARRAYS + 51 + 3 * MAX_BULLETS;
#endif

// Tile behaviour array and tile array for the current screen

unsigned char map_attr [150] 						@ BASE_ROOM_BUFFERS;
unsigned char map_buff [150] 						@ BASE_ROOM_BUFFERS+150;

// Hotspot related shortcut variables. hotspot_x and hotspot_y contain
// the pixel coordinates of the current screen hotspot.
// If hotspot is empty / deactivated, they are set to (240, 240),
// which is always out of the screen.

unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char orig_tile;	// Original background tile

unsigned char pant_final = SCR_FIN;

// Aids to remove locals

unsigned char gpit, gpjt, res;
unsigned int gpint;
unsigned char bit, enit, tocado;
unsigned char _x, _y, _xx, _yy;
unsigned char cx, cy, ccx, ccy;
unsigned char x0, y0, x1, y1;
unsigned char rda, rdb, rdx, rdy, rdd, rdm, enoffsmasi;
unsigned char dx, dy, mn;
unsigned char pad0, pad1, pad_this_frame;

// Relocated here

unsigned char playing;
unsigned char success;
unsigned char n_pant;
unsigned char maincounter;
unsigned char objs_old, keys_old, life_old, killed_old, item_old;
unsigned char *allpurposepuntero;

unsigned char enx, eny;

unsigned int key_m;
