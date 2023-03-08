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
 	{32, 48, 32, 48, 112, 48, 1, 0, 2},
 	{144, 64, 144, 64, 176, 64, 1, 0, 1},
 	{208, 96, 208, 96, 224, 96, 2, 0, 3},

	// Pantalla 1
 	{64, 112, 64, 112, 160, 112, 1, 0, 2},
 	{112, 112, 112, 32, 112, 112, 0, -2, 2},
 	{192, 96, 192, 96, 224, 96, 2, 0, 3},

	// Pantalla 2
 	{160, 16, 160, 16, 160, 112, 0, 1, 4},
 	{144, 64, 144, 64, 208, 64, 4, 0, 2},
 	{96, 64, 16, 64, 96, 64, -1, 0, 2},

	// Pantalla 3
 	{64, 48, 64, 48, 208, 48, 1, 0, 2},
 	{64, 96, 64, 96, 128, 96, 1, 0, 2},
 	{144, 128, 144, 128, 208, 128, 1, 0, 2},

	// Pantalla 4
 	{64, 16, 64, 16, 64, 80, 0, 1, 2},
 	{64, 128, 64, 128, 112, 128, 1, 0, 1},
 	{144, 128, 144, 128, 224, 128, 2, 0, 3},

	// Pantalla 5
 	{80, 128, 32, 128, 80, 128, -2, 0, 1},
 	{128, 128, 128, 128, 160, 128, 1, 0, 3},
 	{64, 96, 64, 96, 208, 96, 1, 0, 2},

	// Pantalla 6
 	{32, 128, 32, 128, 96, 128, 1, 0, 1},
 	{208, 128, 208, 128, 224, 128, 1, 0, 1},
 	{192, 96, 144, 96, 192, 96, -2, 0, 2},

	// Pantalla 7
 	{32, 112, 32, 48, 48, 112, 1, -1, 2},
 	{176, 48, 144, 48, 176, 48, -1, 0, 3},
 	{48, 128, 16, 128, 48, 128, -1, 0, 1},

	// Pantalla 8
 	{160, 112, 160, 16, 160, 112, 0, -1, 2},
 	{48, 112, 48, 64, 224, 112, 1, -1, 2},
 	{48, 128, 16, 128, 48, 128, -1, 0, 3},

	// Pantalla 9
 	{192, 128, 80, 128, 192, 128, -1, 0, 2},
 	{192, 96, 96, 96, 192, 96, -2, 0, 2},
 	{192, 64, 128, 64, 192, 64, -1, 0, 2},

	// Pantalla 10
 	{144, 128, 144, 128, 208, 128, 1, 0, 2},
 	{192, 80, 160, 80, 192, 80, -1, 0, 1},
 	{176, 48, 32, 48, 176, 48, -1, 0, 2},

	// Pantalla 11
 	{48, 16, 48, 16, 48, 96, 0, 1, 2},
 	{208, 16, 176, 16, 208, 16, -1, 0, 2},
 	{16, 96, 16, 96, 112, 96, 1, 0, 2},

	// Pantalla 12
 	{224, 16, 192, 16, 224, 16, -1, 0, 3},
 	{208, 80, 176, 80, 208, 80, -1, 0, 1},
 	{48, 112, 48, 64, 144, 112, 1, -1, 2},

	// Pantalla 13
 	{112, 16, 112, 16, 144, 16, 1, 0, 1},
 	{48, 80, 0, 80, 48, 80, -2, 0, 3},
 	{208, 144, 16, 144, 208, 144, -1, 0, 4},

	// Pantalla 14
 	{208, 96, 128, 96, 208, 96, -1, 0, 4},
 	{80, 64, 80, 64, 192, 64, 1, 0, 2},
 	{80, 128, 48, 128, 80, 128, -1, 0, 1},

	// Pantalla 15
 	{176, 16, 64, 16, 176, 128, -2, 2, 2},
 	{80, 128, 32, 128, 80, 128, -2, 0, 1},
 	{128, 96, 48, 96, 128, 96, -1, 0, 2},

	// Pantalla 16
 	{64, 96, 64, 96, 128, 96, 2, 0, 4},
 	{96, 112, 96, 64, 96, 112, 0, -1, 2},
 	{160, 112, 160, 112, 224, 112, 1, 0, 1},

	// Pantalla 17
 	{112, 96, 112, 32, 112, 96, 0, -1, 4},
 	{64, 16, 64, 16, 144, 96, 1, 1, 2},
 	{64, 48, 16, 48, 64, 48, -1, 0, 3},

	// Pantalla 18
 	{48, 48, 48, 48, 48, 112, 0, 1, 2},
 	{80, 16, 80, 16, 80, 96, 0, 2, 2},
 	{112, 16, 112, 16, 112, 80, 0, 1, 2},

	// Pantalla 19
 	{80, 64, 80, 64, 176, 64, 2, 0, 4},
 	{80, 112, 80, 112, 144, 112, 1, 0, 2},
 	{32, 48, 32, 48, 208, 48, 1, 0, 2},

	// Pantalla 20
 	{32, 64, 32, 16, 32, 64, 0, -2, 2},
 	{96, 64, 96, 64, 160, 64, 2, 0, 3},
 	{96, 128, 96, 128, 208, 128, 2, 0, 2},

	// Pantalla 21
 	{32, 128, 32, 128, 176, 128, 1, 0, 4},
 	{16, 48, 16, 48, 80, 48, 2, 0, 1},
 	{192, 16, 192, 16, 192, 112, 0, 4, 2},

	// Pantalla 22
 	{32, 112, 32, 112, 176, 112, 1, 0, 2},
 	{96, 16, 96, 16, 96, 80, 0, 1, 2},
 	{176, 80, 112, 80, 176, 80, -2, 0, 2},

	// Pantalla 23
 	{48, 128, 48, 128, 192, 128, 2, 0, 4},
 	{192, 16, 96, 16, 192, 16, -1, 0, 2},
 	{160, 112, 64, 112, 160, 112, -1, 0, 2},

	// Pantalla 24
 	{96, 96, 96, 96, 208, 96, 2, 0, 2},
 	{176, 48, 176, 48, 208, 48, 1, 0, 1},
 	{80, 16, 80, 16, 80, 48, 0, 1, 2},

	// Pantalla 25
 	{64, 48, 64, 48, 192, 48, 2, 0, 3},
 	{16, 96, 16, 96, 192, 96, 2, 0, 2},
 	{112, 128, 112, 128, 128, 128, 1, 0, 1},

	// Pantalla 26
 	{96, 128, 96, 128, 160, 128, 1, 0, 1},
 	{208, 32, 80, 32, 208, 32, -1, 0, 2},
 	{64, 128, 48, 128, 64, 128, -1, 0, 3},

	// Pantalla 27
 	{208, 80, 112, 32, 208, 80, -1, -1, 2},
 	{96, 48, 16, 48, 96, 112, -1, 1, 2},
 	{64, 128, 64, 128, 112, 128, 1, 0, 4},

	// Pantalla 28
 	{224, 48, 96, 48, 224, 48, -1, 0, 2},
 	{16, 112, 16, 48, 80, 112, 1, -1, 2},
 	{144, 80, 144, 80, 176, 80, 1, 0, 1},

	// Pantalla 29
 	{0, 128, 0, 128, 176, 128, 1, 0, 4},
 	{208, 112, 64, 64, 208, 112, -1, -1, 2},
 	{48, 48, 16, 48, 48, 48, -2, 0, 1},

	// Pantalla 30
 	{32, 96, 32, 96, 80, 96, 1, 0, 3},
 	{144, 80, 96, 80, 144, 80, 0, 0, 2},
 	{192, 32, 192, 32, 192, 96, 0, 1, 2},

	// Pantalla 31
 	{80, 112, 32, 112, 80, 112, -1, 0, 2},
 	{80, 16, 32, 16, 80, 16, -1, 0, 2},
 	{192, 48, 192, 48, 192, 112, 0, 2, 1},

	// Pantalla 32
 	{224, 16, 0, 16, 224, 16, -2, 0, 2},
 	{224, 96, 0, 96, 224, 96, -2, 0, 2},
 	{0, 128, 0, 128, 224, 128, 1, 0, 4},

	// Pantalla 33
 	{0, 128, 0, 128, 224, 128, 1, 0, 4},
 	{32, 112, 32, 112, 192, 112, 1, 0, 2},
 	{192, 16, 48, 16, 192, 16, -1, 0, 2},

	// Pantalla 34
 	{0, 128, 0, 128, 96, 128, 1, 0, 4},
 	{112, 112, 16, 112, 112, 112, -1, 0, 2},
 	{176, 32, 176, 32, 192, 112, 1, 1, 2},

	// Pantalla 35
 	{160, 128, 160, 48, 160, 128, 0, -2, 4},
 	{192, 96, 32, 96, 192, 96, -2, 0, 2},
 	{96, 128, 96, 128, 192, 128, 2, 0, 1},

	// Pantalla 36
 	{48, 96, 48, 96, 160, 96, 1, 0, 2},
 	{160, 32, 160, 32, 160, 80, 0, 1, 2},
 	{64, 32, 64, 32, 64, 80, 0, 2, 2},

	// Pantalla 37
 	{176, 128, 16, 128, 176, 128, -2, 0, 1},
 	{112, 128, 48, 128, 112, 128, -1, 0, 3},
 	{160, 32, 160, 32, 160, 112, 0, 2, 2},

	// Pantalla 38
 	{0, 112, 0, 32, 0, 112, 0, -1, 4},
 	{96, 128, 96, 128, 144, 128, 1, 0, 2},
 	{192, 128, 192, 48, 192, 128, 0, -1, 4},

	// Pantalla 39
 	{0, 128, 0, 128, 64, 128, 1, 0, 4},
 	{112, 32, 112, 16, 112, 32, 0, -2, 4},
 	{192, 80, 112, 80, 192, 80, -1, 0, 2}

};

#define N_ENEMS_TYPE_0 0
#define N_ENEMS_TYPE_1 21
#define N_ENEMS_TYPE_2 67
#define N_ENEMS_TYPE_3 14
#define N_ENEMS_TYPE_5 0
#define N_ENEMS_TYPE_6 0
#define N_ENEMS_TYPE_7 0

// This is output the way it worked originally, please modify if you need
// You may want to add type 5 or 6's below.
#define BADDIES_COUNT (N_ENEMS_TYPE_1+N_ENEMS_TYPE_2+N_ENEMS_TYPE_3)

typedef struct {
	unsigned char xy, tipo, act;
} HOTSPOT;

HOTSPOT hotspots [] = {
	{136, 1, 0}, 
	{0, 0, 0}, 
	{88, 1, 0}, 
	{117, 2, 0}, 
	{135, 1, 0}, 
	{0, 0, 0}, 
	{120, 1, 0}, 
	{0, 0, 0}, 
	{216, 1, 0}, 
	{0, 0, 0}, 
	{102, 1, 0}, 
	{134, 1, 0}, 
	{161, 1, 0}, 
	{179, 1, 0}, 
	{184, 1, 0}, 
	{193, 1, 0}, 
	{199, 1, 0}, 
	{0, 0, 0}, 
	{168, 1, 0}, 
	{18, 1, 0}, 
	{39, 2, 0}, 
	{216, 1, 0}, 
	{24, 1, 0}, 
	{213, 1, 0}, 
	{67, 2, 0}, 
	{71, 1, 0}, 
	{0, 0, 0}, 
	{184, 1, 0}, 
	{134, 1, 0}, 
	{102, 1, 0}, 
	{22, 2, 0}, 
	{129, 2, 0}, 
	{102, 1, 0}, 
	{97, 1, 0}, 
	{165, 1, 0}, 
	{18, 2, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{214, 1, 0}
};

#define N_HOTSPOTS_TYPE_0 9
#define N_HOTSPOTS_TYPE_1 25
#define N_HOTSPOTS_TYPE_2 6
#define N_HOTSPOTS_TYPE_3 0
#define N_HOTSPOTS_TYPE_4 0
#define N_HOTSPOTS_TYPE_5 0
#define N_HOTSPOTS_TYPE_6 0
#define N_HOTSPOTS_TYPE_7 0

