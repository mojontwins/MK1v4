# Diario (o postmortem, depende de cuando lo leas)

¿Por qué estoy haciendo este juego en MTE MK1 v4 en lugar de en v5 o en la v6 WIP? Por dos razones: *dat Ramiro vives*, y porque hacer Ramiro en v4 es muy sencillo, ya que v4 era, esencialmente, el motor de Ramiro.

He reescrito partes y pasado funciones auxiliares a ensamble. Todo es más fluido, pero se comporta igual que el original, que era lo importante (*dat Ramiro vibes*).

Tendría que haber empezado hace eones a escribir este diario, pero bueno, Hago un resumen de lo que hay hecho y luego ya si eso me pongo a divagar por lo que hay.

El juego se trata de conseguir cuatro trozos de pergamino. Cada trozo se ubica en una trampa. Coger el pergamino activa la trampa. Los pergaminos son *hotspots* de tipo 1. En `hook_mainloop` de `custom.h` se puede detectar fácilmente que acabamos de coger un objeto: cuando se cumple que `player.objs != objs_old`.

Básicamente voy a usar los rudimentarios hooks para meter las cosas nuevas. Todo en `custom.h`.

## Atributos de habitaciones

Cada habitación tiene asignado un byte de atributo que sirve para decidir con cuál de los dos tilesets se dibujará (`TWO_SETS_CONDITION` se define como `((map_behaviours [n_pant] & 1) ? 32 : 0)`), si lleva *ojo de Horus* o si lleva trampa.

## El ojo de Horus

En este juego se usan las cosas de MTE MK1 v4 que se metieron con calzador para los ramiros originales, pero jamás se activará el estado `kill_slowly`. Este estado era el que te otorgaba el *hechizo postizo* y hacía que las *evil zones* mataran más despacio. Aquí no. Cuando el ojo está abierto (estado 2) se activarán las *evil zones*. Para que esto sea viable, se ha definido `EVIL_ZONE_CONDITIONAL` de forma que las *evil zones* sólo restarán vidas si `scenery_info.evil_zone_active` vale 1. El ojo de Horus no es más que una simple máquina de estados con tiempos diferentes para cada estado, definidos en `evil_eye_state_cts`, que se pinta con los tiles definidos en `evil_eye_state_tiles`. 

## Las trampas

Un sencillo motor de N objetos que caen desde arriba, dibujados como tiles. Tuve que hacer algunas perivueltas pero lo dejé funcionando. En la primera modalidad de trampa, caen bloques que tendremos que emplear para trepar y salir. Los bloques te escojoncian si te dan, claro. En la segunda modalidad caen monedas y tendremos que conseguir 30 para poder salir.

Estoy pensando combinar monedas y ojo de Horus para otra trampa.

## Los guardianes de las trampas

En el juego hay cuatro guardiantes de cada trampa. Te dejarán pasar si les das un objeto que cada uno necesita:

* Marisa la sacerdotisa necesita unas bragas, porque perdió las suyas en la fiesta del cumpleaños del hijo de una amiga que se fue de madre.
* Gustavo el esclavo necesita un tarro de grasa para cuidar el cuero de su uniforme, pues es un esclavo muy coqueto.
* Clemente la serpiente quiere una flauta para auto encantarse y así dormir, pues es insomne.
* Sonia la momia necesita papel del culo, que anda indispuesta.

Los objetos no están directamente en el mapa, sino que hay un altar al que llevar tributo. Cada vez que llevamos un tributo el altar nos obsequia con uno de los cuatro objetos (al azar, tendré que tener una lista y reordenarla un poco en cada partida).

El objeto que llevamos aparecerá con Ramiro usando un sprite. Por eso estoy usando `sprcnv2` en vez de `sprcnv` y así poder importar 4 sprites extra. En `comp.bat`:

```
	..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 20 extra > nul
```

Cuando llevel objeto al que no es, te rechaza, te quita vida, y te suelta un insulto:

```
	TES KI YA CARAJAULA, LLEVATE ESO!
	Y ESTO QUE ES BEBECHARCOS, ESCUCHAPEOS
	PARA QUE QUIERO ESTO BOQUIMUELLE
	¿PERO QUE ME TRAES? BOTARATE, TALLO DE CEBOLLA!
```

## El objeto

Como hemos dicho, Helmet llevará un objeto a cuestas. Para simplificar voy a hacer un array con cinco elementos: un 0 y luego los punteros a los cells extra con los cuatro objetos. Crearé una variable `pinv` que diga qué objeto llevamos. Si vale distinto de 0, pintaré el objeto a la espalda de Ramiro. Para ello lo definiré con menos prioridad y lo pintaré en `gpx - 8` o `gpx + 8` dependiendo del valor de `player.facing`. No me olvido de cambiar `NUMBLOCKS` de 40 a 50, pues un sprite más son 10 bloques más. 

Para dar un objeto a ramiro, hay que asignarlo a `pinv` (1 a 4), y hacer `pinv_next_frame = object_cells [pinv];`. Para quitar el objeto, basta con hacer `pinv = 0`.

Para controlar esto vamos a definir un par de externs en `msc_extern.h`. Aquí ya tengo el renderizador de textos, así que tendré que multiplexarlo. Vamos a hacer que `EXTERN n` con `n >= 64` asigne a `pinv` el valor `n - 64` y que si es diferente de 0 también asigne el sprite, `pinv = n - 64; if (pinv) pinv_next_frame = object_cells [pinv];`.

## Las ofrendas

Las ofrendas las voy a manejar con hotspots de tipo custom, por ejemplo el 2. Puedo detectar que tomo una ofrenda fácilmente ya que si tomo un hotspot, la variable `latest_hotspot` tomará su tipo durante el frame actual. Como he quitado el marcador del contador de quemazón ya que en este juego no tiene sentido, contaré las ofrendas aprovechando el sitio. Creo dos variables, `pofrendas` y `pofrendas_old`, la primera para contar y la segunda para llevar la actualización del marcador.

## El altar

Aunque podemos llevar varias ofrendas a la vez, el altar sólo nos dará un objeto si no llevamos. La detección se hace desde el script, pero el manejo con `EXTERN 128` en `msc_extern.h`. 

## La trampa de agua

La trampa de agua se activa cuando cogemos una ofrenda en la pantalla 29.

Cuando el agua te mata se desactiva la trampa y se vuelve a la pantalla 5.

Se muestra en la columna derecha, esto es, en las pantallas 11, 17, 23 y 29. Cuando se active:

- En cada pantalla se cierra la salida y solo se abre cuando se pulsen dos interruptores situados por algún sitio (!) de la pantalla.
- Al entrar, hay que dar un boost al jugador en direccion vertical y tapar la entrada con una plataforma. Esto del boost se mantiene para la pantalla 5, aunque esta no tenga trampa de agua.

Hay una variable `water_level` con el nivel del agua. Tendrá un valor entre 0 y 24, para que no se muestre el agua durante unos segundos. Indica la altura en caracteres. **Necesito una función que pinte una tira de caracteres N y la invalide si la altura es `< 20`.** - `paint_water_strip` pintará en `rdy` una fila de caracteres `rdi`.

Para detectar que golpeamos un tile desde abajo usaremos `player.ceiling` y luego buscaremos el tile con `qtile`.

Para activar la planta usaremos una función `water_trap_setup` que podamos llamar al coger la ofrenda de la pantalla 29 o al entrar en alguna de las pantallas con la trampa activada.

Activar la trampa de agua debe:
	- Tapar la salida inferior si la hay
	- Tapar la salida superior si la hay
	- Pintar los tiles que abren la trampa.

El tema es generalizar esto lo más posible para ocupar lo mínimo posible.

La tapa de arriba está en (11, 0) para las pantallas 11 y 23 y en (2, 0) para las pantallas 17 y 29.

La tapa de abajo está en (11, 9) para las pantallas 5 y 17 y en (2, 9) para las pantallas 11 y 23.

Si divido `n_pant` entre 6 puedo usar par/impar:

- Es > 1; bloquear top, impar (11, 0), par (2, 0).
- Es < 4; bloquear bottom, impar (2, 9), par (11, 9).

La trampa se desactiva al entrar en la pantalla 5 tras haber pintado las cosas.

Me queda ver cómo colocar los tiles que abren la trampa y luego detectarlos. Para eso tengo que diseñar un poco las pantallas de la trampa y haerme una idea.

~~ 

Puedo tener un array indexado por `n_pant / 6` que se pinte si `n_pant > 5` en el que cada byte empaquete dos posiciones X para pintar en la fila 0, con estos datos (tomados mientras pinto las pantallas):

```
	{ 0, 0x26, 0x4E, 0x57, 0x79 }
```

## Los guardianes de las trampas

Necesito 4 flags para marcar que las ofrendas correspondientes han sido entregadas y que las trampas están abiertas. En el mapa las puertas estarán cerradas pero las tendré que abrir de acuerdo a estos flags.

Los guardianes lanzarán un EXTERN N con N-64 -> guardían (1, 2, 3, 4). Se seguirá esta lógica:

- Si flags [g] = 1 -> texto20.
- Si inv = 0 -> texto 8+g
- Si inv != g -> texto 4+g
- Si inv == g -> texto20+g, texto 13

```c
	// Work with characters n-64:
	which_character = n - 64;
	if (flags [which_character]) {
		show_text_box (20);
	} else if (pinv == 0) {
		show_text_box (8 + which_character);
	} else if (pinv != which_character) {
		show_text_box (4 + which_character);
	} else {
		show_text_box (20 + which_character);
		show_text_box (13);
		on_pant = 0xff; 		// Force reenter
		flags [which_character] = 1;
		peta_el_beeper (6);
	}
```

## Trampas clausuradas

¿Qué pasa si alguien vuelve a las trampas después de haberlas completado? No podrá salir. Ahora tengo que ver como controlo esto.

Si hablas con un personaje que te abre una trampa y almaceno cual es no me vale tampoco porque bien te puedes ir a por otra trampa. Tiene que ser al coger el objeto pero ¿Cómo sé en qué trampa estoy sin ocupar un montón? Si pongo el número de trampa en un flag al entrar en la pantalla desde el script lo podría tener. Y con esto, la próxima vez que entre puedo tener un modificador que pinte cosas.

Este es el proceso:

- En el entering de la pantalla ponemos FLAG 15 al número de la trampa (1-4).
- Al coger el objeto, en `custom.h` se pone a 1 el flag 10 + numero de trampa.
- Si se reinicia la trampa, se pone a 0 el flag.
- En el entering de la pantalla se mira el flag 10 + numero de trampa para pintar un cierre.

## Mejoras de pulido

Tengo que integrar el `sp_UpdateNow` con parámetro para pasar de los sprites, porque si no lo de los cuadros de texto queda super cutre. Tengo que modificar msc para que los `SET TILE` ocupe 3 bytes en vez de 4.

Al final no hizo falta modificar `sp_UpdateNow` porque he usado una técnica más legal: 1.- Sacas los sprites de la pantalla, 2.- VALIDAS todo el rectángulo. De esta forma, al invalidar tiles y actualizar no se pintarán los sprites, pero los trozos no invalidados seguirán en pantalla. Ideal para los textos.

## 128K dual y faps

Ahora voy a meter algo nuevo en el motor: el modo 128K dual detecta el modo para tocar por beeper o por AY, y el limitador de faps. Ambos van a introducir la necesidad de meter el vector IM2 y empezaré por ahí.

He reorganizado un poco la memoria, pero si esto se ejecuta en modo 128K debería poner la pila en RAM baja. Para eso lo primero que tengo que hacer es una detección. Lo hago adaptando este trozo de código de McLeod/Ideafix

```
	di
	ld  bc, 0x7ffd
	xor a
	out (c), a
	ld  a, (0x1)
	ld  h, a
	ld  a, 0x10
	out (c), a
	ld  a, (0x1)
	cp  h
	jr  nz, esUn128K
```

Con este código pongo a 1 o a 0 una variable `is128k` y la pila se queda donde debe. So win/win. Este código luego lo inegraré en `peta_el_beeper` a la que voy a cambiar el nombre justo ahora por `play_sfx`.

He creado un nuevo `isr.h` donde he metido la rutina `ISR`. Ahora pondré los enganches y el limitador de frames.

# La OGT

Vamos a empezar a montar el tema de la OGT. La idea es tener RAM1 con el player, los sonidos, y todas las canciones comprimidas justo detrás. Para tocar una canción, se descomprimirá en el buffer y se tocará desde ahí. Voy a calcular el tamaño del buffer para poder ponerlo en un sitio fijo al final de la RAM.

Esto es ARKOS1. Para calcular el sitio que necesito tengo que convertir todas las canciones y luego hacer sitio para la más tocha.

Lo mismo haré con los sonidos. En el binario final irá el player y todos los comprimidos. Al empezar lo primero que haré será descomprimir los sonidos. Luego, para tocar cada canción se descomprimirá y luego se tocará.

Crear/modificar `make_ogt.bat`

* Hay que compilar cada música en `MUSIC_BUFFER_ADDRESS`.
* Hay que compilar los SFX en `SFX_BUFFER_ADDRESS`. 
* Comprimir todos los binarios.

En `atPlayer.speccy.asm`

* Hay que definir `MUSIC_BUFFER_ADDRESS` y `SFX_BUFFER_ADDRESS` al final de la RAM para que la música más larga y los sonidos quepan (descomprimidos).
* Añadir todos los binarios comprimidos (músicas y efectos) en `song_XX` y `song_sfx`. Luego no olvidarse de poner todas las etiquetas en la lista de `compressed_song_index`. 
* Hay que compilar y mirar en `RAM1.map.txt` las direcciones que luego habrá que configurar en `config.h`, a saber:

`ARKOS_ADDRESS_ATPLAY` -> `atPlay`
`ARKOS_ADDRESS_ATSFXPLAY` -> `atSfxPlay`
`ARKOS_ADDRESS_MT_LOAD_SONG` -> `mt_load_song`
`ARKOS_ADDRESS_ATSFXSTOPALL` -> `atSfxStopAll`
`ARKOS_ADDRESS_ATSTOP` ->  `atStop`
`ARKOS_ADDRESS_MT_INIT` -> `mt_init`

* Activar `ENABLE_ARKOS` y rellenar todas sus constantes.

Lo suyo es mirar bien el tamaño de los binarios, asegurarse de que la canción más larga entrará en el buffer de la música y los efectos en el buffer de efectos, y modificar las constantes en `atPlayer.speccy.asm` y `make_ogt.bat` consecuentemente.

Por ejemplo mi binario más largo ocupa casi 2400 bytes y los efectos suman unos 600. Si pongo el buffer de músicas en F000 y los sonidos en FD00 me cabe de sobra.

## Los sonidos:

Tengo que replicar esta lista estándar en Arkos. Tengo 7 sonidos de **Davidian** que usaré y luego rellenaré como pueda.

```
	n	Sonido            ARKOS
	--------------------------------------------
	1	Salto             Jump_Short
	2	enemy hit         Hurt_2
	3	killzone hit 
	4	countdown         Gotaw
	5	coin
	6	object            Objetow
	7	talk 1
	8	key in lock       Latigazow
	9	shoot
	10	explosion
	11	talk 2	
```

Rellenado todo, montado todo.

## Integrando

Lo primero es llamar al mt_init nada más empezar.

Para los sonidos, la idea es que si estamos en modo 128K se llame a arkos para tirar los sonidos y si estamos en modo 48K se llame al beeper.

```c
	void play_sfx (unsigned char n) {
		// Cargar en A el valor de n
		#ifdef MODE_128K_DUAL
			if (is128k) {
				#ifdef ENABLE_ARKOS
					arkos_play_sound (n);
				#endif
			}
		#endif
		{
			asm_int = n;
			#asm
				push ix
				push iy
				ld a, (_asm_int)
				call sound_play
				pop ix
				pop iy
			#endasm
		}
	}
```

El tema es ahora lanzar las músicas. Como todo lo que necesita sonar puede ser modificado con customs, hagámoslo así:

### Pantalla de título

En `pantallas.h`:

```c
	void title_screen (void) {
		sp_UpdateNow();
		asm_int = (unsigned int) (s_title); unpack ();

		// CUSTOM {
		draw_text (7, 4, 71, "RAMIRO, EL VAMPIRO");
		draw_text (9, 7, 7, "EN EL MISTERIO");
		draw_text (11, 8, 7, "DEL PAPIRO");
		
		/*
		draw_text (6, 4, 71, "RAMIRE, THE VAMPIRE");
		draw_text (12, 7, 7, "PUTS BACK");
		draw_text (11, 8, 7, "THE ZAPHIRE");
		*/
		
		draw_text (8, 19, 71, "MOJON TWINS 2020");
		draw_text (10, 20, 7, "CHURRERA 4.8");
		
		sp_UpdateNow ();
		// } END_OF_CUSTOM

		if (is128k) {
			arkos_play_music (0);
		} else {
			#asm
				; Music generated by beepola

				call musicstart

				#if !(defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME)
					di
				#endif
			#endasm
		}
		
		while (1) {
			if (sp_KeyPressed (key_1)) {
				joyfunc = sp_JoyKeyboard; break;
			} else if (sp_KeyPressed (key_2)) {
				joyfunc = sp_JoyKempston; break;
			} else if (sp_KeyPressed (key_3)) {
				joyfunc = sp_JoySinclair1; break;
			}			
		}

		if (is128k) arkos_stop_sound ();

		after_title:
	}
```

### Final

En `pantallas.h`:

```c
	void game_ending (void) {
		sp_UpdateNow();
		asm_int = (unsigned int) (s_ending); unpack ();

		// CUSTOM { 
		draw_text (7, 15, 7, "EL VAMPIRO RAMIRO");
		draw_text (8, 17, 7, "NUNCA GANA . . .");
		sp_UpdateNow ();
		// } END OF CUSTOM

		if (is128k) {
			arkos_play_music (4);
		} else {
			beepet (); play_sfx (11);
		}

		espera_activa (500);

		if (is128k) arkos_stop_sound ();
	}
```

### Game over

En `pantallas.h`:

```c
	void game_over (void) {
		draw_rectangle (10, 11, 21, 13, GAME_OVER_ATTR);		
		draw_text (11, 12, GAME_OVER_ATTR, "GAME OVER!");
		sp_UpdateNow ();

		if (is128k) {
			arkos_play_music (3);
		} else {
			beepet (); play_sfx (10);
		}

		espera_activa (500);

		if (is128k) arkos_stop_sound ();
	}
```

### Ingame

Tenemos que hacer sonar el tema principal al empezar la partida y el time attack en las trampas. También hay que acordarse de restaurar la música normal al terminar la trampa.

## Montando la cinta

Aquí viene el fancy fancy: Hay que hacer un cargador en ensamble que sea capaz de detectar el modo 128K para cargar o no un bloque extra. Para ello usamos el template de **Antonio Villena**.

## Puntuación

Diversos hitos en el juego añadirán puntos. 

|Puntos|total|Khe
|---|---|---
|5|5|Abrir la pirámide
|2|8(2x4)|Hablar con personaje
|2|8(2x4)|Abrir la cripta
|5|20(5x4)|Vencer la cripta
|5|5|Ramón warning Ojo
|5|5|Ramón warning Agua
|5|20(5x4)|Coger moneda
|5|20(5x4)|Obtener objeto
|4|4|Coger objeto falso
|4|4|Llevar a Gustavo objeto falso

Total = 99 puntos.

# Bugs tela de chungos / enmiendas

[X] Añadir textos a todas las pantallas de personajes.
[X] Velocidad de rebote mínimo contra los pinchos mayor (suficiente para subir un bloque).
[X] Agua no debe quitar vida.
[X] La colisión con los tiles y los enemigos parece glitchear un poco. No era tal, es que con un cambio en el mapa un enemigo aparecía directamente sobre un obstáculo.
[X] Cuelgue misterioso en la pantalla 33 - había un bug con el código que calculaba si debería pintar las admiraciones (!).
[X] Descoger la moneda de la trampa del agua implica perder los puntos!
[ ] ¿No funciona bien la dación puntil del Ramón del agua?
