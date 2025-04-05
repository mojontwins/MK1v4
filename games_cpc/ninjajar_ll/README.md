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
- A lo mejor se hace otra cosa!!!

- MK1v4.11

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

Juraría que el sword tiene modo puño de Ninjajar pero tengo que ver qué hacer con el sprite, que es de más de 4x8. Igual lo pongo de 4x8 y así no tengo que modificar nada. Nah, sería cutre. El sprite es de 6x8, pero por el borde negro que supongo que será necesario `:*)` Voy a ver qué manejadores de sprites hay. Si tengo 8x8 meto un nuevo modo de espada. Si no hay, lo siento pero se pierde el borde.

Pero es que el borde mola :-/ Me veo haciendo otros manejadores de sprite en CPCRSLIB para esto. ARRR NO HAY XD. 

Venga, va, lo añado. 

El puño podría implementarse con `ENABLE_SWORD`, `SWORD_*_DAMAGE` a 1, `SWORD_STAB`. El problema es que el motor asume que el tamaño lógico del hitter es de 8x8 (equivalente a 4 ladrillos de ancho en CPC). Esto lo voy a hacer modificable con `SWORD_W` que pondré a 12. Creo que lo he hecho bien.

También he añadido `SWORD_WIDE` para usar 8x8 en vez de 4x8, sólo en horizontal.

* [X] Otra cosa que tengo que hacer es una animación mucho más rápida. La actual dura 9 frames y es excesivo. Tengo que lograr meter una en 4 frames para que haya mas ¡PAH!.

### Cocos

Síjosi, habrá que meter cocos en v4. Espero que con mi sapiencia actual salgan mejor que los originales. 

## Extras

### Arkos 1

He conseguido convertir a la sintaxis de z80asm con la idea de utilizar el player directamente en el binario principal sin mamoneos (otra cosa es que lo haya hecho bien y funcione). La integración, en parte, sería parecida a la de WYZ: Compilamos todas las canciones a la misma dirección y luego las comprimimos todas y las vamos descomprimiendo según hagan falta. El problema son los sonidos, que hay que compilarlos a una dirección fija. Ya lo resolveré cuando llegue el momento, dejo esto para el final.

### Simplified life gauge

Implementar que pueda librarme de life gauge cuando todo se muere de un golpe. Esto implica no inicializarlo, no tener que hacer sitio para ella, y no comprobar la que queda cuando los enemigos reciben daño. Es un cambio gordo, lo dejo para el final del final.

### `DIE_AND_RESPAWN`

* [X] Creo que esto no está en v4 y habría que añadirlo.

### Custom vertical engine

* [X] Implementar el salto consolero como custom vertical engine. Poder activar / desactivar por define y controla por variable el motor de nadal.

### Fanties con estados

* [ ] Ninjajar original tenía fanties que sólo salían a por ti si te acercabas, pero eran terriblemente costosos en espacio... Tengo que lograr una implementación más escueta y sencilla.

## Sacando la basura

### La muerte

Tengo que refactorizar la forma en la que se gestiona la muerte del jugador en el engine, que creo que hay bastante código duplicado porque tengo mierdas aquí desde MK1 v2.1.

* Si mueres por evil tile hay código completo para quitarte vida, poner el flicker, etc. Se resta `LINEAR_ENEMY_HIT` de la vida.
* Si mueres por drain al disparar (`Cheril the Goddess` 2011), se pone `player_just_died` a `PLAYER_KILLED_BY_SELF`. Se resta `FIRING_DRAIN_AMOUNT` de la vida.
* Si mueres por drain de jetpac (de nuevo, `Cheril the Goddess` 2011) igual. Se resta 1 de la vida.
* Si mueres por evil zone (`Ramiro` 1, 2 y 3), `player_just_died` se pone a `PLAYER_KILLED_BY_EZ`. Se resta 1 de la vida.
* Si colisionas con enemigo, se pone `player.is_dead` a 1. Si el enemigo es tipo 6 (fanty) se resta `FLYING_ENEMY_HIT` de la vida, si no se resta `LINEAR_ENEMY_HIT`. Se pone `player_just_died` a `PLAYER_KILLED_BY_ENEM`. Se rebota al jugador **C Code Warning**.  Se pone el flicker si no hay `frigoababol`.

En el main loop, justo al principio, `player_just_died` se pone a 0. **Y luego no se usa para nada más**.

Tengo que centralizar la muerte del player. Las diversas muertes deberían poder controlar cuanta vida se resta. En el handler de muerte general debería:

* Restar `player.drain_amount`.
* Controlarse RANDOM RESPAWN o el reenter.
* Si te mató un enemigo, ponerse el estado frigo ababol (si está activado).
* Poner el flicker (si está activado).

Se ve que en los últimos tiempos (Johnny Limite) empecé a unificar esto un poco porque en el main loop hay un handler común para morir aplastado por caja, suicidarse o golpeado con un enemigo - pero sólo estaba para controlar el reenter en la pantalla.

Lo que haré será:

* Las cosas que te matan se ocuparán del rebote (si aplica) y
* pondrán la razón de la muerte en `player.is_dead` y lo que te matan en `player.drain_amount`.
* En el main loop sustituiré el bloque de `player.is_dead` por otro nuevo que restar vida y luego haga todos los manejes de respawn, flicker, etc.

[X] Hecho

### La muerte de los malos

Creo que tampoco está demasiado bien. Cuando un malo muere debería permanecer su explosión en la pantalla unos frames y luego desaparecer. En todos los casos.

Por ahora tengo `en_an_state` que puede tomar los siguientes valores:

* `ENEM_PARALYZED` si la espada los paralizo
* `TYPE_6_*` los estados del fanty con `USE_SIGHT_DISTANCE` que, por cierto, **tengo que pasar a ensamble**

Introduciré para esto el estado `ENEM_IS_DEAD` que empleará el contador en `en_an_count`. Al principio de cada vuelta del bucle, si el estado es `ENEM_IS_DEAD` se pondrá el sprite de la explosión hasta que acabe `en_an_count`.

Se llama a `enems_kill` desde:

* Colisión con hitter. Se coloca `en_an_next_frame` a 17 (explosión).
* Colisión con caja. idem.
* Colisión con los zapatos (pisar). idem.
* Colisión con fire. Se pone `en_an_morido` a 1. ¿Para qué sirve esto? -> se intercepta en main loop y se toca un sonido. Lo quitaré.

Lo primero es que en todos los casos se pone el sprite a 17. Voy a meter esto en `enems_kill` y así puedo ofrecer la opción original con una pequeña mejora.

* Mover poner el sprite explosión a `emems_kill`.
* Mover el sonido a `enems_kill`.
* Eliminar `en_an_morido`.

Acabo de entender lo de `en_an_morido`: es porque los enemigos al morir con disparos podían tener varios puntos de vida y así organizaba mejor el ruido (que para la CPU) en momentos en que la pantalla se hubiera actualizado en Spectrum 48K. Mientras lo cambio aquí pensaré en cómo organizarlo en 48K mejor. 7735

El tema está en que en los casos en los que se comprueba en_life, no pasa "nada" visible cuando el bicho no muere. Al menos con las balas y el hitter. Lo que tengo que hacer es moverlo todo a `enems_kill`.

`enems_kill (unsigned char damage)` comprobará que puede restar la vida, y matará del todo llegado el caso. Si `damage` vale 0xff será *instakill*.

Dejamos `USE_CLASSIC_ENEMS_KILL` para dejar el comportamiento original. *Y en este punto lo propago a los engines*.

Ya que está esto voy a dejar de marcar los enemigos como puertos modificando `en_t` que no tiene mucho sentido. <- hmmm pero esto es para la persistencia de morisión. De todos modos creo que puedo simplificar algo? Y voy a cambiar 16 por 128, que así luego hay más juego con los tipos.

[X] Hecho

### La vida de los malos

En juegos como Ninjajar todos los malos mueren de un solo hostiazo, por lo que no tiene sentido guardar la vida y luego el estado "muerto", vale con lo último. Esto debería simplificar el código.

El tema se controla con `ENEMIES_LIFE_GAUGE`. La idea es que si esto es 1, el código debe simplificarse a saco, y en el exporter de enemigos no debería sacarse la vida.

* `init_malotes` tiene en cuenta o no `life` a la hora de crear el pointer para inicializarlos todos. Se toma en cuenta `life` en el caso de que `defined PLAYER_CAN_FIRE || defined ENABLE_SWORD || defined FORCE_ENEMS_LIFE`. Esto debería reformularse a algo como `((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE`. Igualmente hay que usar la misma guarda para la parte del código que pone `life` a `ENEMIES_LIFE_GAUGE`.

* `calc_baddies_pointer` necesita la misma consideración. 

* `mueve bicharracos` también necesita la misma consideración a la hora de tomar los valores del array y de volverlos a actualizar.

* `enems_kill` recibe `damage` y usa `_en_life` que ahora no estará disponible si `ENEMIES_LIFE_GAUGE` vale 1. Por tanto debe cambiarse la lógica para que haya *instakill* si `damage != 0`.

Y con esto debería valer, ya que al mejorar la muerte de los malos he quitado mucho código redundante.

[X] Hecho. Liberó más de 120 bytes en este juego.

### Revisando fantis

Por ahora los fantis vanilla (cuyo movimiento fue pasado a ensamble, pero solo el movimiento) ocupan 654 bytes. Ni quiero pensar en cuánto ocuparán los que tienen `sight distance` que no están en ensamble. Esto hay que mejorarlo. Empezaré mejorando los vanilla y luego me pondré con los otros (que reaprovechan código de los vanilla).

* Hmmmm en realidad este juego no usa bounce, así que no hay nada que mejorar aquí, y la política de MK1v4 es ir mejorando segun vaya necesitándolo (más que nada porque si no, no se puede de probar).

* Sin embargo la parte de `enems_init` genera toneladas de ensable, más que nada porque se accede al array de estructuras de enemigos directamente. Debo reaprovechar código y obtener el pointer y operar con esto. 26290 -> 26195 (!) Son más de 100 bytes menos, pero...

* Me he dado cuenta de que al morir la explosión aparece en la posición original. **Las posiciones INT no se están sincronizando**, tengo que arreglar esto. Y esto puede que suponga otra mejora: en `render_all_sprites` se distingue si el enemigo es tipo 6 y se hace esta actualización al vuelo. Esto seguro que tenía un motivo que tenía que ver con algún juego viejo, pero creo que no es necesario (y si lo es para Zombie Calavera ya me ocuparé de arreglarlo cuando lo retome). Voy a cambiar esto para que la actualización se realice siempre y se actualice `en_x` y `en_y` para que así no haya que distinguir entre tipo de enemigo para actualizar los sprites. -> 26061, lo que implica 230 bytes de ahorro en total `O_o` hacer esto me a ahorrado muchas muchas miserias.

Con esto ya estaría la optimización. Los fanties vanilla ocupan ahora 425 bytes. La idea es ahora refactorizar todo para contemplar todos los tipos de fanty reaprovechando la implementación en ensamble de los fanties vanilla.

* Los tipo 5 o `RANDOM RESPAWN` son como los tipo 6 pero si está activado `PLAYER_CAN_HIDE` aplican `rds` en lugar de `FANTY_A`. `rds`se calcula como `rds = player_hidden () ? (-(FANTY_A>>1)) : FANTY_A;`...

* Si hay `SIGHT DISTANCE` o se aplica `PLAYER_CAN_HIDE` a los tipo 6, entonces tenemos la máquina de estados. En ella, el estado `TYPE_6_PURSUING` modifica `vx` y `vy` como en vanilla. Los otros estados modifican `vx` y `vy` de forma diferente. El resto del código (actualzar `x, y`, confinar en la pantalla, actualizar `_en_x`/`y`) es igual que en los vanilla.

* `FANTIES_EXIT_STATE_V` establece un `TYPE_6_RETREATING` diferente. Pero esto parece ser un resto de algo porque no parece estar completo. -> Se utiliza en Ramiro 3, aparentemente, y no está documentado. A efectos prácticos (porque se controla desde fuera) lo único que hace en el motor es que no se actualice la velocidad si el estado vale `TYPE_6_RETREATING`.

Tengo que refactorizar para idear un bloque conjunto que cubra todos estos casos. Ahora mismo en el código ensamble tengo el tema separado por ejes, y tengo que mirar si es posible cambiarlo para que esté separado por actividades (actualizar velocidad, actualizar posición). This worked great!

La organización general podría ser

```
	#ifdef RANDOM_RESPAWN
		if !fanty_activo goto end
	#endif
	#ifdef USE_SIGHT_DISTANCE || PLAYER_CAN HIDE
		if estado idle goto idle
		if estado retreating goto retreating
	#endif
	#ifdef FANTIES_EXIT_STATE_V
		if estado not pursuing goto end
	#endif

	.pursuing
		...
		goto end

	#ifdef USE_SIGHT_DISTANCE || PLAYER_CAN HIDE
	.idle
		...
		goto end
	.retreating
		...
		goto end
	#endif

	.end
```

* `en_an_estate` se pone a 0 por defecto, que corresponde al estado "IDLE". Esto no me vale porque cuando salgo y vuelvo a entrar el fanty está en otro sitio. El tema sería reiniciar el fanty a su sitio inicial siempre, que es como funcionaba antes con la implementación original. Lo voy a poner opcional `FANTY_REMEMBER_POSITION`.

* Ahora mismo está medio funcionando, pero tenemos el problema de que en CPC los sprites no pueden salir de la pantalla, que es algo que tengo que ver cómo resuelvo. Los fantys originales de spectrum salían de la pantalla. Ahora tenemos el problema de que estamos usando las coordenadas "de pixel" asociadas (antes no) y estás son unsigned char, por lo que los nuevos fanties deberán estar confinados a 0->224 y 0->144. Esto sólo implica modificar los valores en el código.

* Necesito poder decirle al motor que los fantys pueden tener los dos cells dedicados a mirar a izquierda y a derecha: `FANTY_FACING`. Aprovecho para poner una animación más sencilla usando `maincounter`, que se supone que es para este tipo de cosas.

* Problema: este nuevo comportamiento de los fantys que simplifica tantas cosas se carga un poco Zombie Calavera, donde los `RANDOM_RESPAWN` tienen que irse fuera de la pantalla... A ver, lo que va a pasar es que al tocar el borde van a desaparecer. Lo que toca ahora es propagar los cambios -> `src_cpc` -> `src_zx` y luego al Zombie Calavera para terminar de reprogramar este tipo de enemigos.

#### `RANDOM_RESPAWN`

Los fantis de este tipo se originaban fuera de la pantalla. Ahora deben originarse en el borde. Cuando toquen el borde no deben pintarse... Si están cerca del borde podrían parpadear (¡esto molaría mil!). Para modificar la dirección en la que avanzan usaré self modifying code like a pro. Hay cuatro `ld hl/de, FANTY_A` donde habría que cambiar esa constante.

¿Cómo lograr que parpadéen? Tengo que pensar en la detección más barata posible. Si hago coincidir que par = invisible, impar = visible, tengo de gratis que desaparezcan en el borde.

Parpadeo si `|x - borde| < 16`. En el motor tengo `abs_a` que hace el valor absoluto de A.

Antes de empezar vamos a documentar todo el funcionamiento de `RANDOM_RESPAWN`. Hay que recordar que se trata de **enemigos marcados como muertos** que tienen `en_an_fanty_activo` a 1.

* En `enems_init` de cada pantalla se pone `en_an_fanty_activo` a 0.

* En `enems_kill` se pone `en_an_fanty_activo` a 0. Esto entiendo que no es necesario para enemigos normales que mates, pero sí para que un fanty que mates se vuelva a inicializar automáticamente.

* En el loop de enemigos, si el enemigo está muerto (bit 7 arriba) y `en_an_fanty_activo` vale 0, se salta todo el loop de enemigos hasta `enems_loop_continue`.

* Tras `enems_loop_continue` está la detección e iniialización de estos fantys. Si el malote está muerto (bit 7 arriba) y `en_an_fanty_activo` vale 0 y se cumple un random, se levanta `en_an_fanty_activo` y se coloca según la posición del jugador:

	* Si gpy < 120 se pone abajo, si gpy >= 120 se pone arriba.
	* La posición X es random.
	* vx, vy = 0.
	* Se calcula el frame 2.

Para empezar tengo que pasar ese código de arriba a ensamble y simplificarlo.

[X] Pasar el bounce contra el fanty y cualquier otra cosa fanty vanilla related a ensamble.
[X] Paso a ensamble el fanty con vista.
[ ] No se rompe el `RANDOM_RESPAWN`.
