// churromain.c
// Esqueleto de juegos de la churrera
// Copyleft 2010 The Mojon Twins

// Renombrar a tujuego.c o lo que sea para que quede más bello
// y to la pesca.

#include <cpcrslib.h>				// Biblioteca de juego por Artaburu.
#include <cpcwyzlib.h>				// Replayer AY por WYZ, adaptado por Artaburu.
#include "sound.h"					// Configuración del replayer AY.

#define WYZ_CANAL_EFECTOS 2

// Globales muy globalizadas

unsigned char enoffs;


// Aux

extern char asm_number[1];
extern unsigned int asm_int [1];
extern unsigned int asm_int_2 [1];
extern unsigned int seed [1];
unsigned char half_life;

// CPC

struct sprite { 			// estructura mínima para usar la librería de dibujar sprites capturando el fondo.
	int sp0;				// 2 bytes	01
	int sp1;				// 2 bytes	23
	int coord0; 			// 2 bytes	45	 posición en superbuffer
	int coord1; 			// 2 bytes	67	 posición anterior en superbuffer
	unsigned char cx, cy;	// 2 bytes	89	 coordenadas nuevas
	unsigned char ox, oy;	// 2 bytes	AB	 coordenadas actuales
	unsigned char move; 	// 1 byte	 C	  si NO es 0, el sprite se mueve.
	unsigned char move1;	// 1 byte	 D	  si NO es 0, el sprite se mueve.
	// Si es 8 en cuanto se mueva se pone a 0 y ya no se mueve más hasta nueva orden.
} ;

struct sprite sp_player;
struct sprite sp_enem1;
struct sprite sp_enem2;
struct sprite sp_enem3;

extern unsigned char tile_0 []; // Tiles en tilemapconf
extern unsigned char cad_dedicado [0];

//

#asm
._asm_number 
	defb 0
._asm_int
	defw 0
._asm_int_2
	defw 0
._seed	
	defw 0
._cad_dedicado
	defm "DEDICADO A DOLORES TOMAS"
	defb 0
#endasm

// Cosas del juego:

void halt_me (void) {
	#asm
		halt				;unas esperas para que se actualicen los colores
		halt
		halt
		halt
		halt
	#endasm
}

void set_inks (unsigned char n) {
	
	/*
	Tabla de conversión de paletas
	
	firm	hard
	0		20
	1		4
	2		21
	3		28
	4		24
	5		29
	6		12
	7		5
	8		13
	9		22
	10		6
	11		23
	12		30
	13		0
	14		31
	15		14
	16		7
	17		15
	18		18
	19		2
	20		19
	21		26
	22		25
	23		27
	24		10
	25		3
	26		11
	*/
	
	switch (n) {
		case 0:
			cpc_SetColour (0, 20);
			cpc_SetColour (1, 28);
			cpc_SetColour (2, 0);
			cpc_SetColour (3, 14);
			break;
		case 1:
			cpc_SetColour (0, 20);
			cpc_SetColour (1, 24);
			cpc_SetColour (2, 31);
			cpc_SetColour (3, 3);
			break;
		case 2:
			cpc_SetColour (0, 20);
			cpc_SetColour (1, 24);
			cpc_SetColour (2, 7);
			cpc_SetColour (3, 3);
			break;
	}
}

void set_black () {
	unsigned char i;
	for (i = 0; i < 4; i ++)
		cpc_SetColour (i, 20);
}

void interrupciones(void) {
	// Manejador de interrupciones por Artaburu
	
	#asm
		di
		ld hl,($0039)
		ld (_int_original),HL   //guardo el salto original

		ld HL,_interrupcion
		ld ($0039),HL
		ei
		jp term
	._int_original  
		defw 0
	._interrupcion
		ei
		ret
	.term
	#endasm
}

#define KEY_IZQ 		0
#define KEY_DER 		1
#define KEY_ARR 		2
#define KEY_ABA 		3
#define KEY_FIR 		4
#define KEY_ESC 		5

#define KEY_JOY_IZQ		6
#define KEY_JOY_DER		7
#define KEY_JOY_ARR		8
#define KEY_JOY_ABA		9
#define KEY_JOY_FIR		10

#include "pantallas.h"
#include "config.h"
#include "mapa.h"
#include "sprites.h"
#include "enems.h"
#include "beeper.h"
#include "engine.h"

// Especial para CPC para poner textos

void print_Text (unsigned char x, unsigned char y, unsigned char *texto) {
	x = x >> 2;
	while ( (*texto) != 0 ) {
		cpc_PutTile2x8 ((unsigned int *) (tile_0 + (((*texto) - 32) << 4)), (unsigned char *) x, (unsigned char *) y);
		x += 2;
		texto ++;	
	}
}

// Y el main

void main (void) {
	int j;
	unsigned char *allpurposepuntero;
	unsigned char i;
	unsigned char playing;
	unsigned char n_pant;
	unsigned char maincounter;
	unsigned char x, y;
	unsigned char success;
	
	// Inicialización
	
	interrupciones ();
	halt_me ();

	set_inks (1);
	halt_me ();
	cpc_SetMode (1);
		
	// Inicializamos el player de wyz:
	
	cpc_WyzInitPlayer (wyz_sound_table, wyz_pattern_table, wyz_effects_table, wyz_song_table);
	
	// Batería por el canal C
	
	cpc_WyzConfigurePlayer (0);		
	
	// Ponemos el buffer en un sitio adecuado:
	
	cpc_WyzSetBuffer (0xA500);
	
	// Borde 
	
	cpc_SetColour (16, 20);
	
	print_Text (64, 96, cad_dedicado);
	espera_activa (2500);

	// Redefinimos las teclas
	
	cpc_AssignKey (KEY_IZQ, 0x4101);		// CUR LEFT
	cpc_AssignKey (KEY_DER, 0x4002);		// CUR RIGHT
	cpc_AssignKey (KEY_ARR, 0x4001);		// CUR UP
	cpc_AssignKey (KEY_ABA, 0x4004);		// CUR DOWN
	cpc_AssignKey (KEY_FIR, 0x4580);		// SPACE
	
	cpc_AssignKey (KEY_JOY_IZQ, 0x4904);		// JOY LEFT
	cpc_AssignKey (KEY_JOY_DER, 0x4908);		// JOY RIGHT
	cpc_AssignKey (KEY_JOY_ARR, 0x4901);		// JOY UP
	cpc_AssignKey (KEY_JOY_ABA, 0x4902);		// JOY DOWN
	cpc_AssignKey (KEY_JOY_FIR, 0x4910);		// JOY FIRE
	
	cpc_AssignKey (KEY_ESC, 0x4804);		// ESC
	
	while (1) {
		// Aquí la pantalla de título
		
		unpack ((unsigned int) (s_title));
		set_inks (2);
		
		cpc_UnExo ((unsigned int *) (song_0), (unsigned int *) (0x0100));
		cpc_WyzLoadSong (0);
		cpc_WyzSetPlayerOn ();
		
		espera_activa (32767);
		
		cpc_WyzSetPlayerOff ();
		
		// Empezamos.
		
		unpack ((unsigned int) (s_marco));
		
		playing = 1;
		init_player ();
		init_hotspots ();
		init_cerrojos ();
		
		n_pant = SCR_INICIO;
		maincounter = 0;
		
		draw_scr (n_pant);
		draw_life ();
		draw_objs ();
		draw_keys ();
		
		half_life = 0;
		
		// Initialize CPCRSLIB sprites
		
		sp_player.sp0 = (int) (spr_0);
		sp_player.sp1 = (int) (spr_0);
		sp_player.move = 0;
		sp_player.cx = sp_player.ox = (player.x >> 6) >> 2;
		sp_player.cy = sp_player.oy = (player.y >> 6);
		
		sp_enem1.sp0 = (int) (spr_8);
		sp_enem1.sp1 = (int) (spr_8);
		sp_enem1.move = 0;
		sp_enem1.cx = sp_enem1.ox = 0;
		sp_enem1.cy = sp_enem1.oy = 0;
		
		sp_enem2.sp0 = (int) (spr_8);
		sp_enem2.sp1 = (int) (spr_8);
		sp_enem2.move = 0;
		sp_enem2.cx = sp_enem2.ox = 0;
		sp_enem2.cy = sp_enem2.oy = 0;
		
		sp_enem3.sp0 = (int) (spr_8);
		sp_enem3.sp1 = (int) (spr_8);
		sp_enem3.move = 0;
		sp_enem3.cx = sp_enem3.ox = 0;
		sp_enem3.cy = sp_enem3.oy = 0;
		
		set_inks (0);
		
		// Ok
		
		cpc_UnExo ((unsigned int *) (song_1), (unsigned int *) (0x0100));
		cpc_WyzLoadSong (1);
		cpc_WyzSetPlayerOn ();
		
		while (playing) {
			maincounter ++;
			half_life = !half_life;
			
			// Mover player
			
			if ( !(player.estado & EST_MUR) )
				move (n_pant);
			else {
				// ?
			}
			
			// Mover enemigos
			
			mueve_bicharracos ();
			
			// Precalc para cálculos (eh?)
			
			x = player.x >> 6;
			y = player.y >> 6;
			
			// Render
			
			sp_player.sp0 = (int) (player.next_frame);
			sp_player.cx = player.x >> 8;
			sp_player.cy = player.y >> 6;
			
			sp_enem1.sp0 = (int) (en_an [0].next_frame);
			sp_enem1.cx = malotes [enoffs].x >> 2;
			sp_enem1.cy = malotes [enoffs].y;	
		
			sp_enem2.sp0 = (int) (en_an [1].next_frame);
			sp_enem2.cx = malotes [enoffs + 1].x >> 2;
			sp_enem2.cy = malotes [enoffs + 1].y;	
		
			sp_enem3.sp0 = (int) (en_an [2].next_frame);
			sp_enem3.cx = malotes [enoffs + 2].x >> 2;
			sp_enem3.cy = malotes [enoffs + 2].y;	
		
			cpc_PutSpTileMap ((int) (sp_player));
			cpc_PutSpTileMap ((int) (sp_enem1));
			cpc_PutSpTileMap ((int) (sp_enem2));
			cpc_PutSpTileMap ((int) (sp_enem3));
			
			cpc_UpdScr ();
			
			//cpc_PutTrSp8x16TileMap2b ((int) (sp_player));
			cpc_PutMaskSpTileMap2b ((int) (sp_player));
			cpc_PutMaskSpTileMap2b ((int) (sp_enem1));
			cpc_PutMaskSpTileMap2b ((int) (sp_enem2));
			cpc_PutMaskSpTileMap2b ((int) (sp_enem3));
			
			// Update
			
			cpc_ShowTouchedTiles ();
			cpc_ResetTouchedTiles ();
			
			// Coger objeto
			
			if (x >= hotspot_x - 15 && x <= hotspot_x + 15 && y >= hotspot_y - 15 && y <= hotspot_y + 15) {
				// restauramos el tile de fondo
				draw_coloured_tile_inv (VIEWPORT_X + (hotspot_x >> 3), VIEWPORT_Y + (hotspot_y >> 3), orig_tile);
				// Desactivamos el hotspot:
				hotspot_x = hotspot_y = 240;
				// ¿Sumamos un objeto, una llave, o vida?
				if (hotspots [n_pant].act == 0) {
					player.life += 10;
					if (player.life > PLAYER_LIFE)
						player.life = PLAYER_LIFE;
					draw_life ();
					hotspots [n_pant].act = 2;
				} else if (hotspots [n_pant].tipo == 1) {
					player.objs ++;
					draw_objs ();	
					hotspots [n_pant].act = 0;
				} else if (hotspots [n_pant].tipo == 2) {
					player.keys ++;
					draw_keys ();
					hotspots [n_pant].act = 0;
				} 
				// PLOP!!
				peta_el_beeper (3);			
			}
			
			// Comprobaciones
			
			if (player.x == 0 && (cpc_TestKey (KEY_IZQ) || cpc_TestKey (KEY_JOY_IZQ))) {
				n_pant --;
				draw_scr (n_pant);	
				player.x = 14336;
			}
			if (player.x == 14336 && (cpc_TestKey (KEY_DER) || cpc_TestKey (KEY_JOY_DER))) {		// 14336 = 224 * 64
				n_pant ++;
				draw_scr (n_pant);
				player.x = 0;
			}
			if (player.y == 0 && player.vy < 0 && n_pant >= MAP_W) {
				n_pant -= MAP_W;
				draw_scr (n_pant);
				player.y = 9216;	
			}
			if (player.y == 9216 && player.vy > 0) {				// 9216 = 144 * 64
				n_pant += MAP_W;
				draw_scr (n_pant);
				player.y = 0;
			}
			
			// llegarse al final
			
			if (player.objs == PLAYER_NUM_OBJETOS) {
				
				cpc_WyzSetPlayerOff ();
				
				success = 0;
				if (n_pant == pant_final) {
					if ((player.x >> 10) == PLAYER_FIN_X && (player.y >> 10) == PLAYER_FIN_Y) 
						success = 1;
				} else if (pant_final == 99) {
					success = 1;
				}
				if (success) {
					cortina ();
					game_ending ();
					playing = 0;
					cortina ();
				}
			}
			
			// game over
			
			if (player.life == 0) {
				
				cpc_WyzSetPlayerOff ();
				
				// ¡Saca a todo el mundo de aquí!
				/*
				sp_MoveSprAbs (sp_player, spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);				
				for (i = 0; i < 3; i ++) {
					if (malotes [enoffs + i].t != 0)
						sp_MoveSprAbs (sp_moviles [i], spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);
				}
				*/
				game_over ();
				playing = 0;
				cortina ();
			}
		}	
	}
}
