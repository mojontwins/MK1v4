// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// definitions.h
// Contains type definitions and global variables

#define EST_NORMAL 				0
#define EST_PARP 				2
#define EST_MUR 				4

#define sgni(n)					((n) < 0 ? -1 : 1)
#define min(a,b)				((a) < (b) ? (a) : (b))
#define ctileoff(n) 			((n)>0) //(n > 0 ? 1 : 0)
#define saturate(n)				((n) < 0 ? 0 : (n))

#define ENEM_IS_DEAD 			128

#define WALL_LEFT 				1
#define WALL_RIGHT 				2
#define WALL_UP 				4
#define WALL_DOWN 				8

#define GENITAL_FACING_RIGHT 	0
#define GENITAL_FACING_LEFT		2
#define GENITAL_FACING_UP 		4
#define GENITAL_FACING_DOWN 	6

#define HOTSPOT_TYPE_OBJECT 	1
#define HOTSPOT_TYPE_KEY 		2
#define HOTSPOT_TYPE_REFILL 	3

#define PLAYER_KILLED_BY_BG 	1
#define PLAYER_KILLED_BY_ENEM 	2
#define PLAYER_KILLED_BY_SELF 	8

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

// Player

typedef struct {
	signed int x, y, cx;								// 0, 2, 4
	signed int vx, vy; 									// 6, 8
	unsigned char g, ax, rx; 							// 10, 11, 12
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
	unsigned char coins;								// 45
	unsigned char drain_amount; 						// 46
} INERCIA;

INERCIA player;

#ifdef PLAYER_CAN_FIRE
	unsigned char bullets_x [MAX_BULLETS];
	unsigned char bullets_y [MAX_BULLETS];
	signed char bullets_mx [MAX_BULLETS];
	unsigned char bullets_estado [MAX_BULLETS];
	unsigned char bspr_it;
#endif

signed int ptgmx, ptgmy;
signed int pvx_total, pvy_total;
unsigned char at1, at2;
unsigned char hit;
unsigned char thrusting;

// Enemies

unsigned char en_an_frame [MAX_ENEMS]				@ BASE_ARRAYS;
unsigned char en_an_count [MAX_ENEMS]				@ (BASE_ARRAYS + MAX_ENEMS);
unsigned char *en_an_current_frame [MAX_ENEMS]		@ (BASE_ARRAYS + MAX_ENEMS*2);
unsigned char *en_an_next_frame [MAX_ENEMS]			@ (BASE_ARRAYS + MAX_ENEMS*4);
signed int en_an_x [MAX_ENEMS] 						@ (BASE_ARRAYS + MAX_ENEMS*6);
signed int en_an_y [MAX_ENEMS]						@ (BASE_ARRAYS + MAX_ENEMS*8);
signed int en_an_vx [MAX_ENEMS]						@ (BASE_ARRAYS + MAX_ENEMS*10);
signed int en_an_vy [MAX_ENEMS]	 					@ (BASE_ARRAYS + MAX_ENEMS*12);
unsigned char en_an_fanty_activo [MAX_ENEMS] 		@ (BASE_ARRAYS + MAX_ENEMS*14);
unsigned char en_an_state [MAX_ENEMS]				@ (BASE_ARRAYS + MAX_ENEMS*15);
unsigned char en_an_ff [MAX_ENEMS] 					@ (BASE_ARRAYS + MAX_ENEMS*16);
unsigned char en_an_base_frame [MAX_ENEMS] 			@ (BASE_ARRAYS + MAX_ENEMS*17);

unsigned int enoffs, enoffsmasi;
unsigned char en_j, en_xx, en_yy;

// Only one enemy may hurt the player at once, so we need this flag:
unsigned char en_tocado = 0; 
unsigned char _en_x, _en_y, _en_x1, _en_y1, _en_x2, _en_y2;
signed char _en_mx, _en_my;
unsigned char _en_t, _en_life;

unsigned char *_baddies_pointer;

// Tile behaviour array and tile array for the current screen

unsigned char map_attr [150] @ BASE_ROOM_BUFFERS;
unsigned char map_buff [150] @ BASE_ROOM_BUFFERS+150;

// Hotspot related shortcut variables. hotspot_x and hotspot_y contain
// the pixel coordinates of the current screen hotspot.
// If hotspot is empty / deactivated, they are set to (240, 240),
// which is always out of the screen.

unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char hotspot_t_r;
unsigned char hotspot_t;
unsigned char orig_tile;	// Original background tile

#ifndef WIN_ON_SCRIPTING
	#ifdef SCR_FIN
		unsigned char pant_final = SCR_FIN;
	#endif
#endif

typedef struct {
	unsigned char hide_hotspots;
	unsigned char dont_make_rr;
} SCENERY_INFO;

SCENERY_INFO scenery_info; 

unsigned char n_pant, on_pant;
unsigned char pant_just_rendered;	// Will be 1 for 1 frame if just entered a new screen in hook_init_mainloop

#define MAX_SCREENS (MAP_W*MAP_H)

unsigned char flags [MAX_FLAGS];

// Aux

unsigned int seed;
unsigned char half_life;
unsigned char playing;
unsigned char maincounter;
unsigned char objs_old, keys_old, life_old, killed_old, flag_old;
unsigned char success;
unsigned char rdi;

unsigned char rdx, rdy;
unsigned char gpit, enit, pad0, pad1 = 0, pad_this_frame = 0;
unsigned char gpx, gpy, tpx, tpy, tqt, tat;
signed int gpcx, gpcy;
unsigned char rdd, rdt1, rdt2;
unsigned int idx;
unsigned char _x, _y, _t, _n;
unsigned char _x2, _y2;
unsigned char wall;
unsigned char rda, rdb, rdmt;

#ifdef PLAYER_PUSH_BOXES
	unsigned char x0, y0, x1, y1;
#endif

#if defined RLE_MAP
	unsigned char rdc, rdn;
#endif

#if defined USE_AUTO_TILE_SHADOWS || defined USE_AUTO_SHADOWS
	unsigned char nocast, xx, yy, _ta;
	unsigned char a1, a2, a3, a4;
	unsigned char t1, t2, t3, t4;
	unsigned char cx1, cy1, cx2, cy2;
#endif

unsigned char ptx1, ptx2, pty1, pty2;
	
unsigned char pti, ptj;
unsigned char *gp_gen, *gp_gen_org, *gp_gen_alt;
unsigned char t_alt;
unsigned char prxx, pryy;

unsigned char bitmask [] = {
	1, 2, 4, 8, 16, 32, 64, 128
};

unsigned char rand (void);
void saca_a_todo_el_mundo_de_aqui (void);
void render_all_sprites (void);
void hotspot_paint (void);
void draw_scr_background (void);
void draw_scr (void);
void init_player_values (void); 
unsigned char rand (void);
void espera_activa (int espera);
void enems_kill (unsigned char damage);
unsigned char qtile (unsigned char x, unsigned char y);
unsigned char attr (unsigned char x, unsigned char y);