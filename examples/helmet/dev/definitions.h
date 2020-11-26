// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// definitions.h
// Contains type definitions and global variables

#define EST_NORMAL 		0
#define EST_PARP 		2
#define EST_MUR 		4
#define EST_DIZZY		8
#define EST_FRIGOABABOL 16
#define sgni(n)			((n) < 0 ? -1 : 1)
#define min(a,b)		((a) < (b) ? (a) : (b))
#define ctileoff(n) 	((n)>0) //(n > 0 ? 1 : 0)
#define saturate(n)		((n) < 0 ? 0 : (n))

#define TYPE_6_IDLE 		0
#define TYPE_6_PURSUING		1
#define TYPE_6_RETREATING	2

#define ENEM_PARALYZED 		32

#define SWORD_TYPE_LEFT 	0
#define SWORD_TYPE_RIGHT 	1
#define SWORD_TYPE_UP 		2

#define MAX_FALLING_BOXES 	8
#define MAX_BREAKABLE 		4

#define WALL_LEFT 			1
#define WALL_RIGHT 			2

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
	unsigned char ceiling; 								// 37
	unsigned char grab_block; 							// 38
} INERCIA;

typedef struct {
	unsigned char x;
	unsigned char y;
	char mx;
	unsigned char estado;
} BULLET;

typedef struct {
	unsigned char show_coins;	
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
struct sp_SS *sp_moviles [MAX_ENEMS];
#ifdef PLAYER_CAN_FIRE
	struct sp_SS *sp_bullets [MAX_BULLETS];
#endif
#ifdef ENABLE_SWORD
	struct sp_SS *sp_sword;
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
signed int ptgmx, ptgmy;

// Enemies

unsigned char en_an_frame [MAX_ENEMS]				@ 23600;
unsigned char en_an_count [MAX_ENEMS]				@ (23600 + MAX_ENEMS);
unsigned char *en_an_current_frame [MAX_ENEMS]		@ (23600 + MAX_ENEMS*2);
unsigned char *en_an_next_frame [MAX_ENEMS]			@ (23600 + MAX_ENEMS*4);
unsigned char en_an_morido [MAX_ENEMS] 				@ (23600 + MAX_ENEMS*6);
signed int en_an_x [MAX_ENEMS] 						@ (23600 + MAX_ENEMS*7);
signed int en_an_y [MAX_ENEMS]						@ (23600 + MAX_ENEMS*9);
signed int en_an_vx [MAX_ENEMS]						@ (23600 + MAX_ENEMS*11);
signed int en_an_vy [MAX_ENEMS]	 					@ (23600 + MAX_ENEMS*13);
unsigned char en_an_fanty_activo [MAX_ENEMS] 		@ (23600 + MAX_ENEMS*15);
unsigned char en_an_state [MAX_ENEMS]				@ (23600 + MAX_ENEMS*16);

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

#if defined ENABLE_CODE_HOOKS
	unsigned char enemy_died;
	unsigned char enemy_killer;
	unsigned char game_loop_flag;
#endif

// Tile behaviour array and tile array for the current screen

unsigned char map_attr [150] @ 23300;
unsigned char map_buff [150] @ 23450;

// Hotspot related shortcut variables. hotspot_x and hotspot_y contain
// the pixel coordinates of the current screen hotspot.
// If hotspot is empty / deactivated, they are set to (240, 240),
// which is always out of the screen.

unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char orig_tile;	// Original background tile

#ifdef ENABLE_CODE_HOOKS
	unsigned char latest_hotspot;	
#endif

// Game flow

#ifdef MODE_128K_DUAL
	unsigned char is128k;
#endif

unsigned char isrc @ 23700;

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

// Boxes

#ifdef PLAYER_PUSH_BOXES
	unsigned char x0, y0, x1, y1;
	unsigned char boxx, boyy;
#endif

// Falling boxes

#if defined(FALLING_BOXES) && defined(PLAYER_PUSH_BOXES)
	FALLINGBOX fallingboxbuffer [MAX_FALLING_BOXES];
	unsigned char fall_frame_counter;
#endif

// Sword

#ifdef ENABLE_SWORD
	unsigned char *s_current_frame, *s_next_frame;
	unsigned char s_on, s_type;
	unsigned char s_x, s_y, s_frame;
	unsigned char s_hit_x, s_hit_y;

	unsigned char swoffs_x [] = {8, 10, 12, 14, 15, 15, 14, 13, 10};
	#ifndef SWORD_STAB
		unsigned char swoffs_y [] = {2,  2,  2, 3,  4,  4,  5,  6,  7};
	#endif
#endif

// Breakable

#ifdef ENABLE_BREAKABLE
	unsigned char process_breakable;
	unsigned char b_f [MAX_BREAKABLE];
	unsigned char b_x [MAX_BREAKABLE];
	unsigned char b_y [MAX_BREAKABLE];
#endif

// Aux

unsigned int asm_int;
unsigned int seed;
unsigned char half_life;
unsigned char jetpac_frame_counter;
unsigned char playing;
unsigned char maincounter;
unsigned char objs_old, keys_old, life_old, killed_old, item_old, ezg_old;
unsigned char coins_old;
#ifdef REENTER_ON_ALL_OBJECTS
	unsigned char reentered;
#endif
unsigned char success;
unsigned char rdi;
signed int rdj;
unsigned char rdx, rdy;
unsigned char gpit, enit, pad0, pad1, pad_this_frame;
unsigned char gpx, gpy, gpxx, gpyy;
int gpcx, gpcy;
unsigned char rdd, rdt1, rdt2;
unsigned int idx;
unsigned char _x, _y, _t, _n;
unsigned char wall;

#if defined TWO_SETS || defined TWO_SETS_REAL
	unsigned char tileoffset;
#endif

#ifdef MAPPED_TILESETS
	unsigned char *tileset_mappings;
#endif

unsigned char ptx1, ptx2, pty1, pty2;
	
unsigned char pti, ptj;
unsigned char *gp_gen, *gp_gen_org, *gp_gen_alt;
unsigned char t_alt;
unsigned char prxx, pryy;

unsigned char bitmask [] = {
	1, 2, 4, 8, 16, 32, 64, 128
};

// Prototypes

void fall_box (void);
void move_tile (unsigned char act);
void init_falling_box_buffer (void);
unsigned char can_move_box (void);
void do_extern_action (unsigned char n);
void saca_a_todo_el_mundo_de_aqui (void);
void draw_scr_background (void);
void draw_scr (void);
void init_player_values (void); 
unsigned char rand (void);
unsigned char player_hidden (void);
void espera_activa (int espera);
