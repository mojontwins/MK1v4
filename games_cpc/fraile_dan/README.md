Diario - Portar MK1v4 a CPC
===========================

- ¿Por qué? ¡Ya tenemos la pestecera! 
- Para portar Ramiros sin trabajar. 
- ¿Sin trabajar? ¡Pero si tienes que portar ahora tod...! 
- Shhhh! Let people enjoy things!

## Remember - el sistema gráfico de la pestecera

Lo primero es adaptar el sistema gráfico de la pestecera a MK1v4, y antes de nada vamos a recordar en qué se basaba.

### Pantallas fijas

Marco, ending y title se convierten y se comprimen en aplib (com `apack` o `apultra`):

```
	..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
	..\utils\apultra.exe title.bin titlec.bin > nul
	..\utils\apultra.exe marco.bin marcoc.bin > nul
	..\utils\apultra.exe ending.bin endingc.bin > nul
```

Luego se incluyen en tu código. El blackout lo repego de regalo:

```c
#ifndef MODE_128K
	extern unsigned char s_title [];
	extern unsigned char s_marco [];
	extern unsigned char s_ending [];

	#asm
		._s_title
			BINARY "titlec.bin"
		._s_marco
	#endasm
	#ifndef DIRECT_TO_PLAY
		#asm
				BINARY "marcoc.bin"
		#endasm
	#endif
	#asm
		._s_ending
			BINARY "endingc.bin"
	#endasm
#endif

void blackout (void) {
	rda = BLACK_COLOUR_BYTE;
	#asm
			ld  a, 0xc0
		.bo_l1
			ld  h, a
			ld  l, 0
			ld  b, a
			ld  a, (_rda)
			ld  (hl), a
			ld  a, b
			ld  d, a
			ld  e, 1
			ld  bc, 0x5ff
			ldir

			add 8
			jr  nz, bo_l1
	#endasm
}
```

### Tileset

Charset y tileset se recortan con `mkts_om`y se graban como binarios con estos nombres:

```
    ..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=chars in=..\gfx\font.png out=font.bin silent
    ..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=strait2x2 in=..\gfx\work.png out=work.bin silent
```

Luego tienes tu `tileset.h` que los importa:

```c
	extern unsigned char tileset [0];
	#asm
			XDEF _ts
			XDEF tiles
		._tileset
		.tiles
		._font
			BINARY "../bin/font.bin" 	// 1024 bytes for 64 patterns
		._tspatterns
			BINARY "../bin/work.bin"   // 3072 bytes for 192 patterns
	#endasm
```

Los `XDEF` son para exportarlos porque `CPCRSLIB` los necesita.

### Sprites

Los sprites generales van convertidos y el `mkts_om` genera las estructuras necesarias con salsita.

```
	..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=..\bin\sprites.bin mappings=assets\spriteset_mappings.h silent > nul
```

Los `spriteset_mappings.h` contienen `sm_sprptr` con punteros a todos los frames necesarios. De necesitar extras, irían ahí también. Para crear entidades sprite extra, además de los 4, para los customs, tendré que inventar algo, porque todo se procesa con la función mágica `cpc_UpdateNow`, que tendré que hacer de alguna manera extensible o parametrizable, aunque sea con macros de número de sprites.  Y optimizar, que seguro que me puedo fumar algún que otro interfaz C.

El tema estará en los sprites extra, que tendré que meter como en v5: proyectil, espadita, explosión. Y el sprite vacío, que aquí es necesario sí o sí.

## Remember sonido

Para empezar, `play_sfx` será dummy y no llamará a nada. Luego los play_music habrá que sacarlos y quitar todas las mierdas de 128K dual y sus muelas. Así que aparcado por ahora.

## Remember teclado

Por suerte tuve a bien encapsularlo en una funcioncita.

## Luts

Hará falta meter las cosas de Wyz Player pero por ahora sólo tengo que recordar la lut que emplean los sprites, que debe ensamblarse, comprimirse, e incluirse en el binario (`trpixlutc.bin`) y descomprimirse durante la inicialización en su posición final.

## Para empezar

La idea es tener el cheril of the bosque v4 funcionando como hito número 1. Pero para ello necesitaré todos los assets. Tengo que hacer todos los gráficos antes de siquiera empezar. No me voy a rayar, va a ser drop-in con el mapa y los enemigos.

## Montando, apuntes random para una posible documentación

### El sistema de sprites

El sistema de sprites está formado por `SW_SPRITES_ALL` *entidades* o *sprites software*. A cada uno podemos asignar un *cell* o *gráfico de sprite* del spriteset. Todas se almacenan en el array de sprites que se coloca en `BASE_SPRITES`, y se describen por esta `struct` y estos arrays:

```c
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
```

Por el momento `spr_on` no se utiliza, y ya veré qué hago con eso en el futuro (próximo). `spr_x` y `spr_y` son offsets que se calculan automáticamente (con los valores de `spriteset_mappings.h`). `spr_next` se emplea para asignar el próximo gráfico a cada sprite sin tener que liarla mucho.

dentro de `sp_sw`, el jugador está en la posición 0 o `SP_PLAYER`, los enemigos a partir de `SP_ENEMS_BASE` (por defecto 1). Las balas a partir de `SP_BULLETS_BASE`, el sprite de la espada o lo que sea en `SP_SWORD_BASE`, y los custom que añada el programador a partir de `SP_CUSTOM_BASE`.

# 20210601

Ahora mismo tengo el motor funcionando, al menos con el proyecto por defecto (Cheril of the Bosque). Ahora viene el tema del player de la música y tó sus muertos. Y tengo que decidir:

- WYZ está ya integrado, pero por alguna razón los cepeceros lo detestan, y Davidian también.
- ARKOS 1 se puede beberciar, pero esto ocupaba un huevo de pato más.
- ARKOS 2 es para RASM y otros ensambladores pijos e integrarlo puede ser un pequeño dolor. Adaptar el player a z88dk parece tarea imposible (aunque entendiese todas las mierdas RASM que usa). La otra idea es compilarlo externamente a una dirección fija que sea como un "blob" que englobe player y canciones y cargarlo como bloque aparte. El problema es que esto apesta a trabajo manual.

Lo he intentado con ARKOS 2 y he desistido porque tengo que liarla demasiado parda.

Voy a intentar una integración con ARKOS 1 parecida a la que tengo con Wyz, y que pasa por meter las rutinas de ARKOS en un `.h` o un `.asm` que pueda enganchar en z88dk directamente. Esto significa domar los fuentes, deshacer los defines y mil cosas pequeñas.

Estas son las subrutinas que habrá que exportar:

```asm
	jp PLY_Init						;Call Player = Initialise song (DE = Song address).
	jp PLY_Play						;Call Player + 3 = Play song.
	jp PLY_Stop						;Call Player + 6 = Stop song.


```

