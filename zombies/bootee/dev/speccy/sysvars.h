// La Churrera Engine 3.100
// Copyleft 2010-2014 the Mojon Twins

// Variables dependientes del sistema (ZX Spectrum)

#include <spritepack.h>

#define BASE_ROOM_BUFFERS	23300
#define BASE_ARRAYS 		23600

#ifdef USE_TWO_BUTTONS
	// Define here if you selected the TWO BUTTONS configuration

	struct sp_UDK keys = {
		0x047f, // .fire
		0x04fd, // .right
		0x01fd, // .left
		0x02fd, // .down
		0x02fb	// .up
	};
	
	int key_jump = 0x087f;
	int key_fire = 0x047f;
#else
	// Define here if you selected the NORMAL configuration

	struct sp_UDK keys = {
		0x017f, // .fire
		0x01df, // .right
		0x02df, // .left
		0x01fd, // .down
		0x01fb	// .up
	};
#endif

#define KEY_M 0x047f
#define KEY_H 0x10bf;
#define KEY_Y 0x10df;
#define KEY_Z 0x02fe;

// Puntero a la función de manejo seleccionada.

void *joyfunc;

// Reserva de memoria (sistema de sprites)

void *my_malloc(uint bytes) {
   return sp_BlockAlloc(0);
}

void *u_malloc = my_malloc;
void *u_free = sp_FreeBlock;

// Estructuras que representan los sprites

struct sp_SS *sp_player;
struct sp_SS *sp_moviles [3];
#ifdef PLAYER_CAN_FIRE
	struct sp_SS *sp_bullets [MAX_BULLETS];
#endif
extern struct sp_Rect spritesClip [0];
#asm
	._spritesClip 
		defb VIEWPORT_Y, VIEWPORT_X, 20, 30
#endasm

