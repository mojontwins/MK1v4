Ninjajar Lost Levels R
======================

- ¿Por qué? ¡Si esto ya estaba hecho!
- Porque queremos publicarlo guay
- ¡Pero si ya estaba hecho!
- Pero usaba ese engendro que llamamos "MK3" y en CPC no se movía a pixel.
- ¡¿Pero qué coño vas a hacer con la OGT en Arkos y su ensamble de mierda?!
- Ssssh... Let people enjoy things!
- ¡Y luego lo portarás a Spectrum!
- ¡¡¡25 faps!!!

## Multilevel

**mk1v4** es pre-multilevel, ya que es pre Goku Mal y of course pre MK2. Lo que haré será una implementación engañosa que tire de `custom.h`, pero tengo que decidir algunas cosas.

### Mapas, enemigos, hotspots

En el original los mapas está comprimidos en aplib y se descomprimen sobre un buffer que es capaz de contener al más grande de todos. Lo que tengo que decidir es si, en vez de esto, sería mejor guardar los mapas en un formato directamente utilizable como puede ser RLE44... Ya que probar cuánto ocuparía una u otra opción.

La opción A ya la puedo calcular facil porque tengo los assets de la versión original:

```
	level0:  684
	level1:  767
	level2:  492
	buffer: 1500
	TOTAL : 3443
```

La opción B requiere un poco de RLE 44 y no necesita buffer, quedando así:

```
	level0:  980
	level1:  952
	level2:  678
	TOTAL:  2610
```

Gana la opción B... Pero ahora tengo que ver cómo de factible es y si no lo es directamente cuánto habría que tocar el motor. Recordemos que ahora mismo se lee de una posición fija en memoria y habría que leer de la dirección que dice una variable...

Creo que **habría que modificar muy poco**, en principio esto:

```c
	#ifdef RLE_MAP
		#asm
			._draw_scr_get_scr_address
				// Full 16 bits calculation
				ld  hl, (_n_pant)
				ld  h, 0
				add hl, hl
				ld  de, _mapa

				add hl, de 		; HL = map + (n_pant << 1)
				ld  e, (hl)
				inc hl
				ld  d, (hl) 	; DE = index
				ld  hl, _mapa
				add hl, de      ; HL = map + index
				ld  (_gp_gen), hl		
		#endasm
	#elif defined (UNPACKED_MAP)
		gp_gen = mapa + (n_pant * 150);		
	#else
		gp_gen = mapa + (n_pant * 75);
	#endif
```

Hay que recalcular `gp_gen` de otra forma. Podría cambiar todo eso por un custom. Perfecto, por ahora todo está saliendo bien.

Otra cosa que voy a necesitar hacer es que los tres niveles tengan el mismo número de pantallas. Obviamente no en el mapa, pero sí en los enemigos, para que luego se descomprima todo bien donde debe.

Hablando de las dimensiones variables de los mapas, el custom para el tema del cambio de pantalla estaba ya hecho pero no me sirve. Necesito una forma de sustituir todo el flick screen por el mío, pero eso es fácil de añadir. En resumen tendré:

```c
	#define CUSTOM_MAP_POINTER_CALCULATOR
	#define CUSTOM_FLICK_SCREEN_HANDLER
```

para desactivar ambos trozos y sustituirlos por llamadas a estas nuevas funciones en `custom.h`:

```c
	custom_map_pointer_calculator (); 	// Calculates gp_gen for current n_pant
	custom_flick_screen_handler (); 	// Changes n_pant when it's needed.
```

Antes de empezar a hacer nada voy a introducir esos dos cambios en las versiones CPC y ZX de MK1v4.

Lo he puesto en la ayuda pero lo pongo aquí. La implementación sería: 

```c
	void custom_map_pointer_calculator (void) {
		#asm
			._draw_scr_get_scr_address
				ld  hl, (_level)
				ld  h, 0
				add hl, hl
				ld  de, _maps
				add hl, de 		; HL -> mapas [level]

				ld  e, (hl)
				inc hl 
				ld  d, (hl) 	; DE = mapas [level]

				push de 		; Save mapas [level]

				ld  hl, (_n_pant)
				ld  h, 0
				add hl, hl
				
				add hl, de 		; HL = mapas [level] + (n_pant << 1)

				ld  e, (hl)
				inc hl
				ld  d, (hl) 	; DE = index

				pop hl 			; HL = mapas [level]
				
				add hl, de      ; HL = mapas [level] + index

				ld  (_gp_gen), hl
		#endasm
	}
```

**No olvidarse** No hay que llamar a ninguna conversión que genere `mapa.h`, pero **tendré que crear el archivo** y dejarlo vacío. **Si usara cerrojos tendría que crear aquí la estructura para contenerlos de esta forma:**

```c
	#define MAX_CERROJOS 8
 
	typedef struct {
	    unsigned char np, x, y, st;
	} CERROJOS;
 
	extern CERROJOS cerrojos [0];
	#asm
		_cerrojos
			defs MAX_CERROJOS * 4
	#endasm
```

La conversión será usando `rle44map_sp.exe` con los valores correctos. Estos datos se emplearán directamente:

```bat
	..\utils\rle44map_sp.exe in=..\map\level0.map out=mapa0.bin size=10,2 scrsize=15,10 tlock=99 fixmappy > nul
	..\utils\rle44map_sp.exe in=..\map\level1.map out=mapa1.bin size=10,2 scrsize=15,10 tlock=99 fixmappy > nul
	..\utils\rle44map_sp.exe in=..\map\level2.map out=mapa2.bin size=12,1 scrsize=15,10 tlock=99  > nul
```

### Gráficos

¡Ay! No todo iba a ser tan sencillo :D El problema ahora son los tilesets y los behs. Lo más fácil sería usar `COMPRESSED_TS` para poder separar fuentes y tiles y poder sustituir los tiles fácilmente desde código custom. 

```bat
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work0.png out=work0.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work1.png out=work1.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work2.png out=work2.bin silent > nul

	[...]

	..\utils\zx0.exe work0.bin work0c.bin > nul
	..\utils\zx0.exe work1.bin work1c.bin > nul
	..\utils\zx0.exe work2.bin work2c.bin > nul
```

Para los behs haré igual... Aunque 48 bytes no sé si comprimirán algo. Probablemente no. Los meteré todos en un array y haré LDIR sobre `comportamiento_tiles`.

Para los sprites, en el binario principal irán los 8 cells de ninjajar y el resto vacío. Este espacio se sobrescribirá posteriormente con 8 cells de enemigos comprimidos que cambiarán según el nivel (hay dos sets).

```bat 
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=16 pixelperfectm0 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\ss0.png out=ss0.bin max=8 pixelperfectm0 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\ss1.png out=ss1.bin max=8 pixelperfectm0 silent > nul

	[...]

	..\utils\zx0.exe ss0.bin ss0c.bin > nul
	..\utils\zx0.exe ss1.bin ss1c.bin > nul
```

### Enems

Es muy probable que los tipos de los enemigos estén todos peísimos en los enems originales, así que tendré que buscar mi viejo conversor mamporrero. Pos no ha hecho falta, se ve que en Ninjajar aún no había cambiando el formato de la churrera así que usando los .ene originales no tengo que hacer más.

Los enemigos y hotspots no tienen más remedio que comprimirse porque no hay opción "compactada". A lo sumo debería modificar `ene2h.exe` para que fuera capaz de generar una estructura "vacía" sobre la que descomprimir. 

Lo que sí necesito es rescatar el enresizer para poner más pantallas en la fase que es más pequeña (de 12x1 a 20x1 para que tenga el mismo número de pantallas de las otras dos, no necesito más) y traer de nuevo ene2bin de MK2 para convertir para luego comprimir.

El viejo ene2bin hace demasiadas cosas. Necesito un ene2bin que no haga nada más que lo que hace ene2h pero sólo saque datos en binario. Vamos al rock.

```bat
	..\utils\ene2bin_mk1v4.exe ..\enems\level0orig.ene enems_hotspots0.bin 2bytes compacted life > nul
	..\utils\ene2bin_mk1v4.exe ..\enems\level1orig.ene enems_hotspots1.bin 2bytes compacted life > nul
	..\utils\ene2bin_mk1v4.exe ..\enems\level2orig.ene enems_hotspots2.bin 2bytes compacted life > nul

	..\utils\zx0.exe enems_hotspots0.bin enems_hotspots0c.bin > nul
	..\utils\zx0.exe enems_hotspots1.bin enems_hotspots1c.bin > nul
	..\utils\zx0.exe enems_hotspots2.bin enems_hotspots2c.bin > nul
```

## De motor

### Puñito

Juraría que el sword tiene modo puño de Ninjajar pero tengo que ver qué hacer con el sprite, que es de más de 4x8. Igual lo pongo de 4x8 y así no tengo que modificar nada. Nah, sería cutre. El sprite es de 6x8, pero por el borde negro que supongo que será necesario :*) Voy a ver qué manejadores de sprites hay. Si tengo 8x8 meto un nuevo modo de espada. Si no hay, lo siento pero se pierde el borde.

Pero es que el borde mola :-/ Me veo haciendo otros manejadores de sprite en CPCRSLIB para esto. ARRR NO HAY XD. 

Venga, va, lo añado. 

El puño podría implementarse con `ENABLE_SWORD`, `SWORD_*_DAMAGE` a 1, `SWORD_STAB`. El problema es que el motor asume que el tamaño lógico del hitter es de 8x8 (equivalente a 4 ladrillos de ancho en CPC). Esto lo voy a hacer modificable con `SWORD_W` que pondré a 12. Creo que lo he hecho bien.

También he añadido `SWORD_WIDE` para usar 8x8 en vez de 4x8, sólo en horizontal.

Otra cosa que tengo que hacer es una animación mucho más rápida. La actual dura 9 frames y es excesivo. Tengo que lograr meter una en 4 frames para que haya mas ¡PAH!.

### Cocos

Síjosi, habrá que meter cocos en v4. Espero que con mi sapiencia actual salgan mejor que los originales. 

## Extras

### Arkos 1

He conseguido convertir a la sintaxis de z80asm con la idea de utilizar el player directamente en el binario principal sin mamoneos (otra cosa es que lo haya hecho bien y funcione). La integración, en parte, sería parecida a la de WYZ: Compilamos todas las canciones a la misma dirección y luego las comprimimos todas y las vamos descomprimiendo según hagan falta. El problema son los sonidos, que hay que compilarlos a una dirección fija. Ya lo resolveré cuando llegue el momento, dejo esto para el final.

### Simplified life gauge

Implementar que pueda librarme de life gauge cuando todo se muere de un golpe. Esto implica no inicializarlo, no tener que hacer sitio para ella, y no comprobar la que queda cuando los enemigos reciben daño. Es un cambio gordo, lo dejo para el final del final.



