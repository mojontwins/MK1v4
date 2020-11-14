// MTE MK1 (la Churrera) v4
// Copyleft 2010-2014, 2020 by the Mojon Twins

// Generated by ene2h.exe from ..\enems\enems.ene
// Copyleft 2010, 2017, 2020 by The Mojon Twins

typedef struct {
	unsigned char x, y;
	unsigned char x1, y1, x2, y2;
	char mx, my;
	char t;
#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
	unsigned char life;
#endif
} MALOTE;

MALOTE malotes [] = {
	// Pantalla 0
 	{96, 112, 96, 112, 176, 112, 2, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 1
 	{144, 0, 144, 0, 192, 96, 4, 4, 3},
 	{32, 112, 32, 112, 128, 112, 2, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 2
 	{80, 16, 80, 16, 80, 112, 0, 2, 2},
 	{96, 16, 96, 16, 96, 96, 0, 1, 2},
 	{208, 64, 208, 64, 208, 128, 0, 2, 4},

	// Pantalla 3
 	{192, 32, 192, 32, 176, 32, 0, 0, 6},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 4
 	{16, 80, 16, 80, 128, 80, 2, 0, 3},
 	{80, 48, 80, 48, 16, 48, -1, 0, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 5
 	{48, 128, 48, 128, 144, 128, 1, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 6
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 7
 	{160, 16, 160, 16, 176, 96, 2, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 8
 	{96, 112, 96, 112, 208, 112, 2, 0, 4},
 	{160, 128, 160, 128, 160, 32, 0, -1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 9
 	{16, 32, 16, 32, 208, 32, 2, 0, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 10
 	{144, 128, 144, 128, 208, 128, 1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 11
 	{176, 16, 176, 16, 176, 48, 0, 1, 4},
 	{176, 96, 176, 96, 16, 96, -2, 0, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 12
 	{192, 128, 192, 128, 144, 128, -1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 13
 	{64, 64, 64, 64, 64, 16, 0, -1, 2},
 	{192, 80, 192, 80, 96, 128, -2, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 14
 	{48, 48, 48, 48, 48, 128, 0, 2, 4},
 	{160, 80, 160, 80, 144, 80, -1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 15
 	{144, 128, 144, 128, 32, 128, -2, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 16
 	{32, 32, 32, 32, 32, 16, 0, 0, 6},
 	{96, 16, 96, 16, 96, 32, 0, 1, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 17
 	{112, 128, 112, 128, 16, 128, -1, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 18
 	{32, 32, 32, 32, 32, 48, 0, 0, 6},
 	{144, 32, 144, 32, 144, 48, 0, 0, 6},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 19
 	{64, 16, 64, 16, 80, 64, 1, 1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 20
 	{112, 32, 112, 32, 176, 32, 1, 0, 2},
 	{48, 128, 48, 128, 160, 128, 1, 0, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 21
 	{208, 96, 208, 96, 32, 96, -2, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 22
 	{176, 96, 176, 96, 112, 96, -1, 0, 2},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 23
 	{48, 48, 48, 48, 48, 112, 0, 2, 4},
 	{176, 16, 176, 16, 176, 64, 0, 2, 4},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 24
 	{32, 32, 32, 32, 48, 32, 0, 0, 6},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 25
 	{128, 128, 128, 128, 192, 128, 1, 0, 2},
 	{176, 64, 176, 64, 112, 64, -2, 0, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 26
 	{192, 64, 192, 64, 192, 128, 0, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 27
 	{64, 48, 64, 48, 128, 48, 1, 0, 2},
 	{128, 80, 128, 80, 128, 128, 0, 1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 28
 	{32, 48, 32, 48, 128, 48, 2, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 29
 	{192, 96, 192, 96, 112, 96, -1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 30
 	{96, 64, 96, 64, 96, 128, 0, 2, 4},
 	{112, 80, 112, 80, 192, 112, 2, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 31
 	{80, 48, 80, 48, 144, 64, 2, 2, 3},
 	{160, 128, 160, 128, 208, 128, 1, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 32
 	{192, 64, 192, 64, 192, 128, 0, 1, 3},
 	{32, 128, 32, 128, 32, 64, 0, -1, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 33
 	{48, 128, 48, 128, 128, 128, 2, 0, 1},
 	{96, 96, 96, 96, 192, 112, 2, 2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 34
 	{176, 48, 176, 48, 128, 48, -1, 0, 2},
 	{128, 128, 128, 128, 32, 128, -2, 0, 1},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0},

	// Pantalla 35
 	{80, 32, 80, 32, 112, 96, 2, 2, 3},
 	{128, 96, 128, 96, 64, 64, -2, -2, 3},
 	{0, 0, 0, 0, 0, 0, 0, 0, 0}

};

#define N_ENEMS_TYPE_0 53
#define N_ENEMS_TYPE_1 10
#define N_ENEMS_TYPE_2 12
#define N_ENEMS_TYPE_3 17
#define N_ENEMS_TYPE_5 0
#define N_ENEMS_TYPE_6 5
#define N_ENEMS_TYPE_7 0

// This is output the way it worked originally, please modify if you need
// You may want to add type 5 or 6's below.
#define BADDIES_COUNT (N_ENEMS_TYPE_1+N_ENEMS_TYPE_2+N_ENEMS_TYPE_3)

typedef struct {
	unsigned char xy, tipo, act;
} HOTSPOT;

HOTSPOT hotspots [] = {
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{200, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{200, 2, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{200, 1, 0}, 
	{0, 0, 0}, 
	{212, 1, 0}, 
	{146, 2, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{212, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{101, 2, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{179, 2, 0}
};

#define N_HOTSPOTS_TYPE_0 28
#define N_HOTSPOTS_TYPE_1 4
#define N_HOTSPOTS_TYPE_2 4
#define N_HOTSPOTS_TYPE_3 0
#define N_HOTSPOTS_TYPE_4 0
#define N_HOTSPOTS_TYPE_5 0
#define N_HOTSPOTS_TYPE_6 0
#define N_HOTSPOTS_TYPE_7 0

