// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// definitions.h
// Contains type definitions and global variables

#define EST_NORMAL 				0
#define EST_PARP 				2
#define EST_MUR 				4
#define EST_DIZZY				8
#define EST_FRIGOABABOL 		16
#define sgni(n)					((n) < 0 ? -1 : 1)
#define min(a,b)				((a) < (b) ? (a) : (b))
#define ctileoff(n) 			((n)>0) //(n > 0 ? 1 : 0)
#define saturate(n)				((n) < 0 ? 0 : (n))

#define TYPE_6_IDLE 			0
#define TYPE_6_PURSUING			1
#define TYPE_6_RETREATING		2

#define ENEM_PARALYZED 			32

#define SWORD_TYPE_RIGHT 		0
#define SWORD_TYPE_LEFT 		1
#define SWORD_TYPE_UP 			2
#define SWORD_TYPE_DOWN 		3

#define MAX_FALLING_BOXES 		8
#define MAX_BREAKABLE 			4

#define WALL_LEFT 				1
#define WALL_RIGHT 				2
#define WALL_UP 				4

#define GENITAL_FACING_RIGHT 	0
#define GENITAL_FACING_LEFT		1
#define GENITAL_FACING_UP 		2
#define GENITAL_FACING_DOWN 	3

#define HOTSPOT_TYPE_OBJECT 	1
#define HOTSPOT_TYPE_KEY 		2
#define HOTSPOT_TYPE_REFILL 	3

#define PLAYER_KILLED_BY_BG 	1
#define PLAYER_KILLED_BY_ENEM 	2
#define PLAYER_KILLED_BY_EZ 	4
#define PLAYER_KILLED_BY_SELF 	8

typedef struct {
	signed int x, y, cx;								// 0, 2, 4
	signed int vx, vy; 									// 6, 8
	signed char g, ax, rx; 								// 10, 11, 12
	unsigned char salto, cont_salto; 					// 13, 14
	unsigned char *current_frame, *next_frame; 			// 15, 17
	unsigned char saltando; 							// 19
	unsigned char frame, subframe, facing; 				// 20, 21, 22
	unsigned char estado; 								// 23
	unsigned char ct_estado; 							// 24
	unsigned char gotten; 								// 25
	unsigned char possee; 								// 26
	signed char objs, keys; 							// 27, 28
	signed int life; 									// 29
	unsigned char fuel; 								// 31
	unsigned char killed; 								// 32
	unsigned char disparando; 							// 33
	unsigned char killingzone_framecount; 				// 34
	unsigned char killingzone_beepcount; 				// 35
	unsigned char is_dead; 								// 36
	unsigned char ceiling; 								// 37
	unsigned char grab_block; 							// 38
	signed int max_vx; 									// 39
	unsigned char hovering; 							// 41
	unsigned char just_hovered; 						// 42
	unsigned char just_jumped;							// 43
	unsigned char sword_g;								// 44
} INERCIA;

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

// How keys work (in sideview)
// - If player can't fire, BUTTON_A will JUMP.
// - If player can fire, and USE_TWO_BUTTONS is DEFINED, BUTTON_A will FIRE, BUTTON_B will JUMP
// - If player can fire, and USE_TWO_BUTTONS is DEFINED, BUTTON_A will FIRE, ÛP will JUMP

// To define different keys, the first two hex digits are the COLUMN, the next the ROW
// (Adapt. from cpctelera docs @ https://lronaldo.github.io/cpctelera/files/keyboard/keyboard-txt.html)
/*
=========================================================================================================
|     |                                       column                                                    |
|     |-------------------------------------------------------------------------------------------------|
| row |     40      |     41     |  42   | 43  | 44  | 45   |     46       | 47  |   48     |    49     |
|=====|=============|============|=======|=====|=====|======|==============|=====|==========|===========|
| 80  | f.          | f0         | Ctrl  | > , | < . | Space| V            | X   | Z        | Del       |
| 40  | Enter       | f2         | ` \   | ? / | M   | N    | B            | C   | Caps Lock| Unused    |
| 20  | f3          | f1         | Shift | * : | K   | J    | F Joy1_Fire1 | D   | A        | Joy0_Fire1|
| 10  | f6          | f5         | f4    | + ; | L   | H    | G Joy1_Fire2 | S   | Tab      | Joy0_Fire2|
| 08  | f9          | f8         | } ]   | P   | I   | Y    | T Joy1_Right | W   | Q        | Joy0_Right|
| 04  | Cursor Down | f7         | Return| | @ | O   | U    | R Joy1_Left  | E   | Esc      | Joy0_Left |
| 02  | Cursor Right| Copy       | { [   | = - | ) 9 | ' 7  | % 5 Joy1_Down| # 3 | " 2      | Joy0_Down |
| 01  | Cursor Up   | Cursor Left| Clr   | £ ^ | _ 0 | ( 8  | & 6 Joy1_Up  | $ 4 | ! 1      | Joy0_Up   |
=========================================================================================================
*/

//#define USE_TWO_BUTTONS					// Alternate keyboard scheme for two-buttons games

extern unsigned char def_keys [0];
#asm
	._def_keys
		defw $4404 		; LEFT     O
		defw $4308 		; RIGHT    P
		defw $4808 		; UP       Q
		defw $4820 		; DOWN     A

		defw $4580 		; BUTTON_A SPACE
		defw $4808 		; BUTTON_B Q

		defw $4204		; KEY_ENTER
		defw $4804		; KEY_ESC	

		defw $4880		; KEY_AUX1 Z
		defw $4780 		; KEY_AUX2 X
		defw $4801 		; KEY_AUX3 1
		defw $4802 		; KEY_AUX4 2
#endasm

extern unsigned char def_keys_joy [0];
#asm
	._def_keys_joy
		defw 0x4904, 0x4908, 0x4901, 0x4902, 0x4910, 0x4920
		defw 0x4004, 0x4804, 0x4880, 0x4780, 0x4801, 0x4802
#endasm

#define KEY_M 0x4440
#define KEY_S 0x4710

#define KEY_1 0x4801
#define KEY_2 0x4802

#define KEY_LEFT 		0
#define KEY_RIGHT		1
#define KEY_UP  		2
#define KEY_DOWN 		3
#define KEY_BUTTON_A	4
#define KEY_BUTTON_B	5
#define KEY_ENTER		6
#define KEY_ESC			7
#define KEY_AUX1		8
#define KEY_AUX2		9
#define KEY_AUX3 		10
#define KEY_AUX4 		11

#define sp_LEFT           0x01
#define sp_RIGHT          0x02
#define sp_UP             0x04		
#define sp_DOWN           0x08
#define sp_FIRE           0x10

// Sprite structs

typedef struct sprite {
	unsigned int sp0;			// 0
	unsigned int sp1; 			// 2
	unsigned int coord0;
	signed char cox, coy;		// 6 7
	unsigned char cx, cy; 		// 8 9
	unsigned char ox, oy;		// 10 11
	void *invfunc;				// 12
	void *updfunc;				// 14
} SPR;

SPR sp_sw [SW_SPRITES_ALL] 					@ BASE_SPRITES;
unsigned char *spr_next [SW_SPRITES_ALL] 	@ BASE_SPRITES + (SW_SPRITES_ALL)*16;
unsigned char spr_on [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*18;
unsigned char spr_x [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*19;
unsigned char spr_y [SW_SPRITES_ALL]		@ BASE_SPRITES + (SW_SPRITES_ALL)*20;

// Player

INERCIA player;
#ifdef PLAYER_CAN_FIRE
	unsigned char bullets_x [MAX_BULLETS];
	unsigned char bullets_y [MAX_BULLETS];
	signed char bullets_mx [MAX_BULLETS];
	unsigned char bullets_estado [MAX_BULLETS];
	unsigned char bspr_it;
#endif
signed int ptgmx, ptgmy;
unsigned char player_just_died;

// Enemies

unsigned char en_an_frame [MAX_ENEMS]				@ BASE_ARRAYS;
unsigned char en_an_count [MAX_ENEMS]				@ (BASE_ARRAYS + MAX_ENEMS);
unsigned char *en_an_current_frame [MAX_ENEMS]		@ (BASE_ARRAYS + MAX_ENEMS*2);
unsigned char *en_an_next_frame [MAX_ENEMS]			@ (BASE_ARRAYS + MAX_ENEMS*4);
unsigned char en_an_morido [MAX_ENEMS] 				@ (BASE_ARRAYS + MAX_ENEMS*6);
signed int en_an_x [MAX_ENEMS] 						@ (BASE_ARRAYS + MAX_ENEMS*7);
signed int en_an_y [MAX_ENEMS]						@ (BASE_ARRAYS + MAX_ENEMS*9);
signed int en_an_vx [MAX_ENEMS]						@ (BASE_ARRAYS + MAX_ENEMS*11);
signed int en_an_vy [MAX_ENEMS]	 					@ (BASE_ARRAYS + MAX_ENEMS*13);
unsigned char en_an_fanty_activo [MAX_ENEMS] 		@ (BASE_ARRAYS + MAX_ENEMS*15);
unsigned char en_an_state [MAX_ENEMS]				@ (BASE_ARRAYS + MAX_ENEMS*16);
unsigned char en_an_ff [MAX_ENEMS] 					@ (BASE_ARRAYS + MAX_ENEMS*17);
unsigned char en_an_base_frame [MAX_ENEMS] 			@ (BASE_ARRAYS + MAX_ENEMS*18);

unsigned int enoffs, enoffsmasi;
unsigned char en_j, en_x, en_y, en_xx, en_yy;
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

unsigned char map_attr [150] @ BASE_ROOM_BUFFERS;
unsigned char map_buff [150] @ BASE_ROOM_BUFFERS+150;

// Hotspot related shortcut variables. hotspot_x and hotspot_y contain
// the pixel coordinates of the current screen hotspot.
// If hotspot is empty / deactivated, they are set to (240, 240),
// which is always out of the screen.

unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char hotspot_t;
unsigned char orig_tile;	// Original background tile

#ifdef ENABLE_CODE_HOOKS
	unsigned char latest_hotspot;	
#endif

// Game flow

unsigned char isr_player_on;
unsigned char pattern_line_ct;

#ifndef WIN_ON_SCRIPTING
	#ifdef SCR_FIN
		unsigned char pant_final = SCR_FIN;
	#endif
#endif
unsigned char n_pant, on_pant;

#if defined ACTIVATE_SCRIPTING && !defined DEACTIVATE_FIRE_ZONE
	unsigned char f_zone_ac;
	unsigned char fzx1, fzx2, fzy1, fzy2;
#endif

// Scenery status

#if (defined(USE_COINS) && defined(COINS_DEACTIVABLE)) || defined (USE_TYPE_6) || !defined (DEACTIVATE_EVIL_ZONE)
	SCENERY_INFO scenery_info; 
#endif	
#define MAX_SCREENS (MAP_W*MAP_H)

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

	unsigned char swoffs_x [] = {8, 10, 12, 14, 16, 16, 14, 13, 10};
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
signed int gpcx, gpcy;
unsigned char rdd, rdt1, rdt2;
unsigned int idx;
unsigned char _x, _y, _t, _n;
unsigned char _x2, _y2;
unsigned char wall;
unsigned char rda, rdb;

#if defined RLE_MAP
	unsigned char rdc, rdn;
#endif

#if defined TWO_SETS || defined TWO_SETS_REAL
	unsigned char tileoffset;
#endif

#ifdef MAPPED_TILESETS
	unsigned char *tileset_mappings;
#endif

#ifdef RANDOM_RESPAWN
	signed char rds;
#endif

unsigned char ptx1, ptx2, pty1, pty2;
	
unsigned char pti, ptj;
unsigned char *gp_gen, *gp_gen_org, *gp_gen_alt;
unsigned char t_alt;
unsigned char prxx, pryy;

#ifdef ENABLE_ANIMATED_TILES
	unsigned char *animated_ptr;
#endif

unsigned char bitmask [] = {
	1, 2, 4, 8, 16, 32, 64, 128
};

#ifndef PLAYER_MOGGY_STYLE
	unsigned char button_jump;
#endif

// Special

#ifdef MASTER_OF_KEYS
	unsigned char master_of_keys;
#endif

#ifdef PARALYZED_DONT_KILL_ON_VAR
	unsigned char paralyzed_dont_kill;
#endif

#ifdef RAMIRO_HOVER_ON_VAR
	unsigned char ramiro_hover;
#endif

#ifdef DISABLE_SLIPPERY_ON_VAR
	unsigned char disable_slippery;
#endif

// Prototypes

void fall_box (void);
void move_tile (unsigned char act);
void init_falling_box_buffer (void);
unsigned char can_move_box (void);
void do_extern_action (unsigned char n);
void saca_a_todo_el_mundo_de_aqui (void);
void render_all_sprites (void);
void hotspot_paint (void);
void draw_scr_background (void);
void draw_scr (void);
void init_player_values (void); 
unsigned char rand (void);
unsigned char player_hidden (void);
void espera_activa (int espera);

// CPC Stuff
