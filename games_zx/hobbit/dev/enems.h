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

	// Pantalla 1

	// Pantalla 2

	// Pantalla 3

	// Pantalla 4

	// Pantalla 5

	// Pantalla 6

	// Pantalla 7

	// Pantalla 8

	// Pantalla 9

	// Pantalla 10

	// Pantalla 11

	// Pantalla 12

	// Pantalla 13

	// Pantalla 14

	// Pantalla 15

	// Pantalla 16

	// Pantalla 17

	// Pantalla 18

	// Pantalla 19

	// Pantalla 20

	// Pantalla 21

	// Pantalla 22

	// Pantalla 23

	// Pantalla 24

	// Pantalla 25

	// Pantalla 26

	// Pantalla 27

	// Pantalla 28

	// Pantalla 29

	// Pantalla 30

	// Pantalla 31

	// Pantalla 32

	// Pantalla 33

	// Pantalla 34

	// Pantalla 35

	// Pantalla 36

	// Pantalla 37

	// Pantalla 38

	// Pantalla 39

	// Pantalla 40

	// Pantalla 41

};

#define N_ENEMS_TYPE_0 0
#define N_ENEMS_TYPE_1 0
#define N_ENEMS_TYPE_2 0
#define N_ENEMS_TYPE_3 0
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
	{0, 0, 0}, 
	{113, 1, 0}, 
	{194, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{86, 1, 0}, 
	{165, 1, 0}, 
	{86, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{162, 1, 0}, 
	{86, 1, 0}, 
	{180, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{19, 1, 0}, 
	{72, 1, 0}, 
	{181, 1, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{0, 0, 0}, 
	{131, 1, 0}, 
	{166, 1, 0}, 
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

#define N_HOTSPOTS_TYPE_0 29
#define N_HOTSPOTS_TYPE_1 13
#define N_HOTSPOTS_TYPE_2 0
#define N_HOTSPOTS_TYPE_3 0
#define N_HOTSPOTS_TYPE_4 0
#define N_HOTSPOTS_TYPE_5 0
#define N_HOTSPOTS_TYPE_6 0
#define N_HOTSPOTS_TYPE_7 0

