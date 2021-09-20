// MTE MK1 (la Churrera) v4
// Copyleft 2010-2014, 2020, 2021 by the Mojon Twins

// Generated by ene2h.exe from ..\enems\enems.ene
// Copyleft 2010, 2017, 2020, 2021 by The Mojon Twins

typedef struct {
	unsigned char x, y;
	unsigned char x1, y1, x2, y2;
	signed char mx, my;
	signed char t;
#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
	unsigned char life;
#endif
} MALOTE;

MALOTE malotes [] = {
	// Pantalla 0
 	{160, 32, 160, 32, 160, 80, 0, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 1
 	{176, 80, 16, 80, 176, 80, -2, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 2
 	{80, 32, 80, 32, 160, 32, 1, 0, 2},
 	{64, 0, 64, 0, 64, 80, 0, 1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 3
 	{128, 32, 128, 32, 176, 32, 1, 0, 1},
 	{96, 0, 80, 0, 96, 112, -1, 1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 4
 	{112, 0, 112, 0, 160, 128, 2, 2, 3},
 	{80, 0, 32, 0, 80, 96, -2, 2, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 5
 	{160, 16, 160, 16, 160, 128, 0, 2, 3},
 	{128, 0, 128, 0, 128, 64, 0, 1, 1},
 	{32, 0, 32, 0, 32, 112, 0, 2, 3},

	// Pantalla 6
 	{128, 64, 128, 64, 128, 112, 0, 1, 1},
 	{112, 128, 16, 128, 112, 128, -2, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 7
 	{160, 48, 16, 48, 160, 64, -2, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 8
 	{16, 32, 16, 32, 144, 32, 2, 0, 2},
 	{160, 16, 160, 16, 176, 128, 1, 1, 3},
 	{144, 112, 16, 112, 144, 112, -1, 0, 1},

	// Pantalla 9
 	{176, 16, 176, 16, 192, 128, 1, 1, 3},
 	{144, 96, 80, 96, 144, 96, -1, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 10
 	{128, 112, 128, 16, 128, 112, 0, -2, 3},
 	{80, 96, 48, 96, 80, 96, -1, 0, 1},
 	{96, 64, 96, 64, 96, 80, 0, 0, 0},

	// Pantalla 11
 	{112, 32, 80, 32, 112, 128, -2, 2, 3},
 	{128, 128, 128, 128, 192, 128, 1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 12
 	{48, 128, 48, 128, 144, 128, 1, 0, 4},
 	{160, 112, 48, 96, 160, 112, -1, -1, 3},
 	{208, 80, 176, 80, 208, 80, -1, 0, 1},

	// Pantalla 13
 	{64, 32, 64, 32, 128, 128, 2, 2, 3},
 	{208, 16, 208, 16, 208, 80, 0, 1, 3},
 	{176, 16, 176, 16, 176, 64, 0, 1, 2},

	// Pantalla 14
 	{160, 112, 160, 16, 160, 112, 0, -2, 3},
 	{64, 16, 64, 16, 64, 64, 0, 2, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 15
 	{48, 64, 48, 64, 112, 80, 1, 1, 3},
 	{192, 96, 128, 96, 192, 96, -1, 0, 0},
 	{32, 32, 32, 16, 32, 32, 0, 0, 0},

	// Pantalla 16
 	{144, 48, 144, 48, 144, 112, 0, 2, 3},
 	{128, 128, 64, 128, 128, 128, -1, 0, 1},
 	{160, 32, 160, 32, 160, 48, 0, 0, 0},

	// Pantalla 17
 	{192, 128, 192, 112, 192, 128, 0, 0, 6},
 	{192, 64, 192, 64, 192, 128, 0, 1, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 18
 	{48, 48, 48, 48, 112, 48, 1, 0, 1},
 	{96, 80, 96, 80, 112, 128, 1, 1, 3},
 	{208, 80, 208, 80, 208, 128, 0, 1, 3},

	// Pantalla 19
 	{160, 128, 160, 128, 208, 128, 1, 0, 1},
 	{80, 128, 16, 128, 80, 128, -1, 0, 2},
 	{80, 16, 80, 16, 144, 48, 1, 1, 3},

	// Pantalla 20
 	{128, 128, 16, 128, 128, 128, -1, 0, 2},
 	{16, 48, 16, 48, 112, 48, 1, 0, 1},
 	{144, 16, 144, 16, 192, 128, 2, 2, 3},

	// Pantalla 21
 	{96, 112, 96, 96, 96, 112, 0, 0, 14},
 	{128, 112, 128, 96, 128, 112, 0, 0, 15},
 	{48, 112, 48, 112, 176, 112, 1, 0, 1},

	// Pantalla 22
 	{80, 16, 80, 16, 80, 128, 0, 1, 4},
 	{112, 64, 112, 64, 176, 64, 1, 0, 4},
 	{48, 16, 48, 16, 48, 112, 0, 2, 3},

	// Pantalla 23
 	{48, 48, 48, 48, 48, 128, 0, 1, 4},
 	{208, 64, 208, 64, 208, 80, 0, 0, 6},
 	{208, 16, 208, 16, 208, 32, 0, 0, 6},

	// Pantalla 24
 	{16, 96, 16, 80, 16, 96, 0, 0, 6},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 25
 	{80, 48, 80, 48, 176, 48, 1, 0, 4},
 	{192, 48, 192, 48, 192, 128, 0, 1, 4},
 	{80, 96, 80, 96, 112, 128, 1, 1, 3},

	// Pantalla 26
 	{112, 128, 112, 32, 112, 128, 0, -1, 4},
 	{192, 128, 144, 128, 192, 128, -1, 0, 1},
 	{80, 128, 16, 128, 80, 128, -1, 0, 2},

	// Pantalla 27
 	{112, 112, 112, 48, 112, 112, 0, -1, 4},
 	{208, 16, 192, 16, 208, 16, 0, 0, 6},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0}

};

#define N_ENEMS_TYPE_0 21
#define N_ENEMS_TYPE_1 13
#define N_ENEMS_TYPE_2 11
#define N_ENEMS_TYPE_3 23
#define N_ENEMS_TYPE_5 0
#define N_ENEMS_TYPE_6 5
#define N_ENEMS_TYPE_7 0
#define N_ENEMS_TYPE_14 1
#define N_ENEMS_TYPE_15 1

// This is output the way it worked originally, please modify if you need
// You may want to add type 5 or 6's below.
#define BADDIES_COUNT (N_ENEMS_TYPE_1+N_ENEMS_TYPE_2+N_ENEMS_TYPE_3)

typedef struct {
	unsigned char xy, tipo, act;
} HOTSPOT;

HOTSPOT hotspots [] = {
	{0, 0, 0}, 
	{52, 1, 0}, 
	{119, 1, 0}, 
	{151, 1, 0}, 
	{0, 0, 0}, 
	{195, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{39, 1, 0}, 
	{150, 1, 0}, 
	{135, 1, 0}, 
	{184, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{72, 1, 0}, 
	{199, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}
};

#define N_HOTSPOTS_TYPE_0 18
#define N_HOTSPOTS_TYPE_1 10
#define N_HOTSPOTS_TYPE_2 0
#define N_HOTSPOTS_TYPE_3 0
#define N_HOTSPOTS_TYPE_4 0
#define N_HOTSPOTS_TYPE_5 0
#define N_HOTSPOTS_TYPE_6 0
#define N_HOTSPOTS_TYPE_7 0

