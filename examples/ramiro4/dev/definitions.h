// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// definitions.h
// Contains type definitions and global variables

#define EST_NORMAL 		0
#define EST_PARP 		2
#define EST_MUR 		4
#define EST_DIZZY		8
#define sgni(n)			((n) < 0 ? -1 : 1)
#define min(a,b)		((a) < (b) ? (a) : (b))
#define ctileoff(n) 	((n)>0) //(n > 0 ? 1 : 0)
#define saturate(n)		((n) < 0 ? 0 : (n))

#define TYPE_6_IDLE 		0
#define TYPE_6_PURSUING		1
#define TYPE_6_RETREATING	2

#define MAX_FALLING_BOXES 8

typedef struct {
	int x, y, cx;										// 0, 2, 4
	int vx, vy; 										// 6, 8
	char g, ax, rx; 									// 10, 11, 12
	unsigned char salto, cont_salto; 					// 13, 14
	unsigned char *current_frame, *next_frame; 			// 15, 17
	unsigned char saltando; 							// 19
	unsigned char frame, subframe, facing; 				// 20, 21, 22
	unsigned char estado; 								// 23
	unsigned char ct_estado; 							// 24
	unsigned char gotten; 								// 25
	unsigned char possee; 								// 26
	char objs, keys; 									// 27, 28
	int life; 											// 29
	unsigned char fuel; 								// 31
	unsigned char killed; 								// 32
	unsigned char disparando; 							// 33
	unsigned char killingzone_framecount; 				// 34
	unsigned char killingzone_beepcount; 				// 35
	unsigned char is_dead; 								// 36
} INERCIA;

typedef struct {
	unsigned char frame;
	unsigned char count;
	unsigned char *current_frame, *next_frame;
	#ifdef PLAYER_CAN_FIRE
		unsigned char morido;
	#endif
} ANIMADO;

typedef struct {
	unsigned char x;
	unsigned char y;
	char mx;
	unsigned char estado;
} BULLET;

typedef struct {
	unsigned char show_coins;	
	unsigned char fixed_screens;
	unsigned char show_level_info;
	unsigned char evil_kills_slowly;
	unsigned char evil_zone_active;
	unsigned char allow_type_6;
	#ifdef MAKE_TYPE_6
		unsigned char make_type_6;
	#endif
} SCENERY_INFO;

typedef struct {
	unsigned char act, x, y;
} FALLINGBOX;

// Controller

struct sp_UDK keys = {
	0x017f, // .fire
	0x01df, // .right
	0x02df, // .left
	0x01fd, // .down
	0x01fb	// .up
};
void *joyfunc;

#ifdef SCRIPTING_KEY_M
	int key_m = 0x047f;
#endif
#ifdef USE_SUICIDE_KEY
	int key_s = 0x02fd;
#endif

unsigned int key_1 = 0x01f7;
unsigned int key_2 = 0x02f7;
unsigned int key_3 = 0x04f7;

// System

void *my_malloc(uint bytes) { return sp_BlockAlloc(0); }
void *u_malloc = my_malloc;
void *u_free = sp_FreeBlock;

// Sprite structs

struct sp_SS *sp_player;
struct sp_SS *sp_moviles [3];
#ifdef PLAYER_CAN_FIRE
	struct sp_SS *sp_bullets [MAX_BULLETS];
#endif
struct sp_Rect spritesClipValues = { VIEWPORT_Y, VIEWPORT_X, 20, 30 };
struct sp_Rect *spritesClip;

#asm
	.fsClipStruct defb 0, 24, 0, 32
	.vpClipStruct defb VIEWPORT_Y, VIEWPORT_Y + 20, VIEWPORT_X, VIEWPORT_X + 30
#endasm

// Player

INERCIA player;
#ifdef PLAYER_CAN_FIRE
	BULLET bullets [MAX_BULLETS];
#endif

// Enemies

ANIMADO en_an [3] @ 23800;
signed int en_an_x [3], en_an_y [3], en_an_vx [3], en_an_vy [3];
#ifdef RANDOM_RESPAWN
	unsigned char en_an_fanty_activo [3];
#endif
#ifdef USE_TYPE_6
	unsigned char en_an_state [3];
#endif	
unsigned char enoffs;
unsigned char en_j, enoffsmasi, en_x, en_y, en_xx, en_yy;
unsigned char en_cx, en_cy;
unsigned char en_ccx, en_ccy;
// Only one enemy may hurt the player at once, so we need this flag:
unsigned char en_tocado = 0; 
unsigned char _en_x, _en_y, _en_x1, _en_y1, _en_x2, _en_y2;
signed char _en_mx, _en_my;
unsigned char _en_t, _en_life;
unsigned char *_baddies_pointer;
	
// Tile behaviour array and tile array for the current screen

unsigned char map_attr [150] @ 24050;
unsigned char map_buff [150] @ 23900;

// Hotspot related shortcut variables. hotspot_x and hotspot_y contain
// the pixel coordinates of the current screen hotspot.
// If hotspot is empty / deactivated, they are set to (240, 240),
// which is always out of the screen.

unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char orig_tile;	// Original background tile

#ifdef ENABLE_CODE_HOOKS
	latest_hotspot = 0;
#endif

// Game flow

#ifndef WIN_ON_SCRIPTING
	#ifdef SCR_FIN
	unsigned char pant_final = SCR_FIN;
	#endif
#endif
unsigned char n_pant, on_pant;

unsigned char f_zone_ac;
unsigned char fzx1, fzx2, fzy1, fzy2;

// Scenery status

#if (defined(USE_COINS) && defined(COINS_DEACTIVABLE)) || defined (USE_TYPE_6) || !defined (DEACTIVATE_EVIL_ZONE)
	SCENERY_INFO scenery_info; 
#endif	
unsigned char max_screens = MAP_W * MAP_H;

// Flags are now in the main engine

unsigned char flags [MAX_FLAGS];

// Falling boxes

#if defined(FALLING_BOXES) && defined(PLAYER_PUSH_BOXES)
	FALLINGBOX fallingboxbuffer [MAX_FALLING_BOXES];
	unsigned char fall_frame_counter;
#endif

// Aux

unsigned int asm_int;
unsigned int seed;
unsigned char half_life;
unsigned char jetpac_frame_counter;
unsigned char playing;
unsigned char maincounter;
unsigned char objs_old, keys_old, life_old, killed_old, item_old, ezg_old;
#ifdef USE_COINS
	unsigned char coins_old;
#endif
unsigned char reentered;
unsigned char success;
unsigned char rdi;
signed int rdj;
unsigned char rdx, rdy;
unsigned char gpit, enit, pad0;
unsigned char gpx, gpy, gpxx, gpyy;
int gpcx, gpcy;
unsigned char rdd, rdt1, rdt2;
unsigned int idx;
unsigned char _x, _y, _t, _n;

#if defined TWO_SETS || defined TWO_SETS_REAL
	unsigned char tileoffset;
#endif
	
unsigned char pti, ptj;
unsigned char *gp_gen, *gp_gen_alt;
unsigned char t_alt;
unsigned char prxx, pryy;

// Prototypes

void fall_box (unsigned char x, unsigned char y);
void init_falling_box_buffer ();
unsigned char can_move_box (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1);
void do_extern_action (unsigned char n);
void saca_a_todo_el_mundo_de_aqui ();
void draw_scr_background ();
void draw_scr ();
void init_player_values (); 
unsigned char rand (void);
