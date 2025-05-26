// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twinsf

// Variables del motor

#define EST_NORMAL 		0
#define EST_PARP 		2
#define EST_MUR 		4

#define sgni(n)			(n < 0 ? -1 : 1)
#define saturate(n)		(n < 0 ? 0 : n)

#define WTOP 1
#define WBOTTOM 2
#define WLEFT 3
#define WRIGHT 4

#define GENITAL_FACING_RIGHT 0
#define GENITAL_FACING_LEFT 2
#define GENITAL_FACING_UP 4
#define GENITAL_FACING_DOWN 6

#define LATERAL_FACING_LEFT 4
#define LATERAL_FACING_RIGHT 0

#define TYPE_6_IDLE 		0
#define TYPE_6_PURSUING		1
#define TYPE_6_RETREATING	2
#define GENERAL_DYING 		4

// Teclado
unsigned char pad0, pad1, pad_this_frame;

#ifdef USE_TWO_BUTTONS
	int key_jump, key_fire;
#endif

// Player

typedef struct {
	int x, y, cx;
	int vx, vy;
	char g, ax, rx;
	unsigned char crouch, cont_salto;
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
	unsigned char facing_v, facing_h;
#ifdef MAX_AMMO
	unsigned char ammo;
#endif	
} INERCIA;

INERCIA player;
signed int ptgmx, ptgmy; 			// Arrastre de las plataformas móviles
unsigned char gpx, gpy; 			// Coordenadas de pixel

// Bicharracos

unsigned char enoffs; 				// Índice de los enemigos de la pantalla
unsigned char enoffsmasi;
unsigned char *map_pointer;

unsigned char en_an_frame [3]						@ BASE_ARRAYS;
unsigned char en_an_count [3] 						@ BASE_ARRAYS + 3;
unsigned char *en_an_current_frame [3] 				@ BASE_ARRAYS + 6;
unsigned char *en_an_next_frame [3] 				@ BASE_ARRAYS + 12;
	
#ifdef PLAYER_CAN_FIRE
	unsigned char en_an_morido  [3] 				@ BASE_ARRAYS + 18;
#endif

#if defined(RANDOM_RESPAWN) || defined (ENABLE_CUSTOM_TYPE_6)
	signed int en_an_x [3] 							@ BASE_ARRAYS + 21;
	signed int en_an_y [3] 							@ BASE_ARRAYS + 27;
	signed int en_an_vx [3] 						@ BASE_ARRAYS + 33;
	signed int en_an_vy [3] 						@ BASE_ARRAYS + 39;
	#ifdef RANDOM_RESPAWN
		unsigned char en_an_fanty_activo [3] 		@ BASE_ARRAYS + 45;
	#endif
#endif
		
unsigned char en_an_state [3] 						@ BASE_ARRAYS + 48;

#ifdef ENABLE_PURSUERS
	unsigned char en_an_alive [3] 					@ BASE_ARRAYS + 51;
	unsigned char en_an_dead_row [3] 				@ BASE_ARRAYS + 54;
	unsigned char en_an_rawv [3] 					@ BASE_ARRAYS + 57;
#endif

unsigned char en_an_base_frame [3]	 				@ BASE_ARRAYS + 60;

// Variables temporales para los enemigos
unsigned char _en_x, _en_y, _en_x1, _en_x2, _en_y1, _en_y2, _en_t, _en_life;
signed char _en_mx, _en_my;

#if defined(SLOW_DRAIN) && defined(PLAYER_BOUNCES)
	unsigned char lasttimehit;
#endif

// Disparos

#ifdef PLAYER_CAN_FIRE
	unsigned char bullets_x [MAX_BULLETS] 			@ BASE_ARRAYS + 63;
	unsigned char bullets_y [MAX_BULLETS] 			@ BASE_ARRAYS + 63 + MAX_BULLETS;
	signed char bullets_mx [MAX_BULLETS] 			@ BASE_ARRAYS + 63 + 2 * MAX_BULLETS ;
	unsigned char bullets_estado [MAX_BULLETS] 		@ BASE_ARRAYS + 63 + 3 * MAX_BULLETS;
	signed char bullets_my [MAX_BULLETS] 			@ BASE_ARRAYS + 63 + 4 * MAX_BULLETS;;
	#ifdef LIMITED_BULLETS
		unsigned char bullets_life [MAX_BULLETS] 	@ BASE_ARRAYS + 63 + 5 * MAX_BULLETS;;
	#endif

	unsigned char blx, bly;
#endif

unsigned char *address @ BASE_ARRAYS + 63 + 6 * MAX_BULLETS;
unsigned char *destination @ BASE_ARRAYS + 65 + 6 * MAX_BULLETS;
unsigned char ram_page @ BASE_ARRAYS + 67 + 6 * MAX_BULLETS;

// Mapa / pantallas

// atributos de la pantalla: Contiene información
// sobre qué tipo de tile hay en cada casilla
unsigned char map_attr [150] @ BASE_ROOM_BUFFERS;
unsigned char map_buff [150] @ BASE_ROOM_BUFFERS + 150;

// posición del objeto (hotspot). Para no objeto,
// se colocan a 240,240, que está siempre fuera de pantalla.
unsigned char hotspot_x;
unsigned char hotspot_y;
unsigned char orig_tile;	// Tile que había originalmente bajo el objeto

unsigned char pant_final;

unsigned char o_pant;
unsigned char n_pant;

#ifdef PLAYER_CHECK_MAP_BOUNDARIES
	unsigned char x_pant, y_pant;
#endif

unsigned char level = 0;
unsigned char maincounter;

unsigned char objs_old, keys_old, life_old, killed_old;

// Breakable walls/etc
#ifdef BREAKABLE_WALLS
	unsigned char *brk_buff = BASE_ROOM_BUFFERS + 300;
#endif

// Scripting

#ifdef ACTIVATE_SCRIPTING
	#define MAX_FLAGS 32
	unsigned char flags[MAX_FLAGS];
#endif

#ifdef ENABLE_FIRE_ZONE
	unsigned char fzx1, fzy1, fzx2, fzy2, f_zone_ac;
#endif

#if defined(ACTIVATE_SCRIPTING) && defined(ENABLE_PUSHED_SCRIPTING)
	unsigned char just_pushed;
#endif

#ifdef MSC_MAXITEMS
	unsigned char key_z_pressed = 0;
#endif

// Timer

#ifdef TIMER_ENABLE
typedef struct {
	unsigned char on;
	unsigned char t;
	unsigned char frames;
	unsigned char count;
	unsigned char zero;
} CTIMER;
CTIMER ctimer;
#endif

// Control

int seed;
unsigned char half_life;
unsigned char playing;
unsigned char mlplaying;
unsigned char success;

// Aux vars

signed int rds;

unsigned char rda, rdc, rdd, rdt, rdx, rdy;
unsigned char possee, hit_v, hit_h, hit;
unsigned char gpen_cx, gpen_cy, gpen_xx, gpen_yy, gpaux;
unsigned char tocado, active;
unsigned char gpit, gpjt;

// Collision

unsigned char cx1, cx2, cy1, cy2, at1, at2;

#ifdef MAX_AMMO
	unsigned char ammo_old;
#endif

#if defined(TIMER_ENABLE) && defined(PLAYER_SHOW_TIMER)
	unsigned char timer_old;
#endif

#ifdef COMPRESSED_LEVELS
	unsigned char *level_str = "LEVEL 0X";
#endif

#ifdef GET_X_MORE
	unsigned char *getxmore = " GET X MORE ";
#endif

unsigned char *spacer = "            ";

unsigned char *allpurposepuntero;

#ifdef FIRE_TO_PUSH	
	unsigned char pushed_any;
#endif

// Some protos?

void draw_scr_background (void);
void draw_scr (void);
void espera_activa (int espera);

void get_resource (unsigned char res, unsigned int dest);
void espera_activa (int espera);

unsigned char rand (void);
void saca_a_todo_el_mundo_de_aqui (void);
void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t);
