// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// Level Manager

/* HOW YOU DO MULTILEVEL

	1.- Prepare each level. You need
		* map binary and bolts binary. Convert your mapX.map with MapCnvBin.exe to
		  get them

		* behaviours in a 48 byte binary file. Use expBehaviours.exe

		* enems + hotspots, in binary form. Use ene2bin.exe

		* tileset.

		* spriteset (optional).

	2.- Make map bundles, just concat (in this order) the binaries.
		* map
		* behaviours
		* enems
		* bolts

	3.- Compress the map bundle.

	4.- Compress the tileset.

	5.- Compress the spriteset.

	6.- Get all the binaries onto your game using this file to include them,
		make pointers, etc.

	7.- Fill the levelset struct with your data.
*/

#define MAX_CERROJOS  (bolts_peek [0])
#define BADDIES_COUNT 104

typedef struct {
    unsigned char np, x, y, st;
} CERROJOS;

typedef struct {
	unsigned char x, y;
	unsigned char x1, y1, x2, y2;
	char mx, my;
	unsigned char t, life;
} MALOTE;

typedef struct {
	unsigned char xy, tipo, act;
} HOTSPOT;

// The bundle "map" part in levels contains this, in this order!
// map and bolts are exported using mapcnvbin, which exports mapa.bin + bolts.bin.
// bolts.bin contains # of bolts, and the N bolts (4 bytes per bolt).

extern unsigned char mapa [0];
#asm 
	._mapa defs MAP_W * MAP_H * 75
#endasm

extern unsigned char comportamiento_tiles [0];
#asm
	._comportamiento_tiles defs 48
#endasm

extern MALOTE malotes [0];
#asm
	._malotes defs MAP_W * MAP_H * 3 * 12
#endasm

extern HOTSPOT hotspots [0];
#asm
	._hotspots defs MAP_W * MAP_H * 3
#endasm

extern unsigned char *bolts_peek [0];
extern CERROJOS cerrojos [0];
#asm
	._bolts_peek defb 0
	._cerrojos defs 128	; 32 * 4
#endasm

extern unsigned char *level1c;
extern unsigned char *level2c;
extern unsigned char *tileset1c;
extern unsigned char *tileset2c;
extern unsigned char *behs1c;
extern unsigned char *behs2c;

typedef struct {
	unsigned char *leveldata_c;
	unsigned char *tileset_c;
	unsigned char *behs_c;
	unsigned char *spriteset_c;
	unsigned char maxobjs;
	unsigned char ini_pant, ini_x, ini_y;
} LEVELTYPE;

LEVELTYPE levelset [MAX_LEVELS] = {
	{level1c, tileset1c, behs1c, 0, 12, 16, 4, 5},
	{level2c, tileset2c, behs2c, 0, 12, 0, 1, 5}	
};

#asm
	._level1c
		BINARY "level1c.bin"
	._level2c
		BINARY "level2c.bin"
	._tileset1c
		BINARY "tileset1c.bin"
	._tileset2c
		BINARY "tileset2c.bin"
		._tileset1c
		BINARY "behs1c.bin"
	._tileset2c
		BINARY "behs2c.bin"
#endasm
