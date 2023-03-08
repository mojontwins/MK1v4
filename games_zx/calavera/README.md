# Zombie Calavera Prologue

Este juego funciona con sprites sin máscaras en formato OR. Como se requiere PAPER 1 e INK 0, los tiles tienen que ser convertidos con el parámetro inverted:0. En `config.h` tenemos `#define NO_MASKS sp_OR_SPRITE`. Los sprites están importados con `..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 16 nomask`. 

Lo de morir cuando tocas el fondo del mapa no está en el motor así que lo hemos metido como un custom. Además, como hemos activado los hooks, tendremos que introducir la condición de ganar a mano:

```c
	void hook_mainloop (void) {
		if (gpy == 144 && n_pant >= (MAP_W*(MAP_H-1))) {
			player.life -= 10;
			player.is_dead = 1;
			player.vy = -PLAYER_MAX_VY_CAYENDO;
			play_sfx (2);
		}
	}
```

# Zombie Calavera (diario / postmortem)

Expandir ZCP a ZC siempre ha sido uno de mis sueños. Quizá pueda hacerlo ampliando el mapa y añadiendo varias fases que, en principio, podrían ser:

1. **Fase tutorial**. Lineal y fácil para aprender a saltar, disparar, y esconderse.
2. **Camino del purgatorio**, que se trate de recoger los 16 crucifijos para abrir la entrada del purgatorio.
3. **Los secuaces de Pellejo**, fase lineal que sea de avanzar y matar. Puedo crear un nuevo tipo de enemigo que salga del suelo, y camine hacia el jugador por la plataforma. Al llegar a borde de plataforma, se deja caer si el jugador está más abajo, o salta si el jugador está más arriba. Al morir vuelve a salir de su sitio original, sin producir por tanto murciélagos.
4. **Desafío final**.

## Multifase

Ahora mismo el mapa es de 5x5 pantallas. Si expando a 10 de ancho y 6 de alto (60 en total) puedo crear las siguientes secciones (marcadas con el número de fase): 

```
	1 1 1 1 1 0 0 0 0 0
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	2 2 2 2 2 2 2 2 2 2
```

El mapa irá comprimido en RLE62, que ha sido adaptado a MK1v4 específicamente para este juego, empleando los compresores hipervitaminados que modifiqué para MK1v5.

## Cambios en el tileset

Me encantaría poder cambiar el tileset - obviamente no completamente, sino al menos los colores. Para ello tendría que sobrescribir el array de 256 atributos que está situado en `_tileset + 2048`. Esa es la parte fácil. La no tan fácil será la de generar los arrays comprimidos con los sets de atributos. Toca modificar `ts2bin` para que, via un switch `onlyattrs`, sólo saque los atributos.

## El nuevo tipo de enemigos

Como hemos dicho, habrá un nuevo tipo de enemigo más complejo que de costumbre. En el eje vertical necesitaré usar punto fijo, que es lo más sencillo y lo que menos ocupará. 

El enemigo "zombie" tendrá los siguientes estados:

* `Z_APPEARING`, cuando emerge de la tierra. Aparecerá en la posición donde se le colocó (x1, y1) y subirá un pixel cada frame (o cada dos, si veo que es demasiado rápido). Seguirá en este estado hasta que el beh del tile que toque (x+8, y+15) sea <8. En ese momento pasará al siguiente:

* `Z_PURSUING`, se desplaza un pixel en dirección al jugador. 

	* Si el pixel en (x+4, y+16) o (x+11, y+16) (dependiendo de adonde esté caminando) es <4 y el jugador está más alto, o si se encuentra un obstáculo, pasará a `Z_JUMPING`. 

	* Si los dos pixels en (x+4, y+16) y (x+11, y+16) son <4, pasará a `Z_FALLING`.

* `Z_FALLING`, caerá con los mismos valores que el jugador (gravedad y velocidad máxima) hasta que deje de cumplirse que los dos pixels en (x+4, y+16) y (x+11, y+16) sean <4.

* `Z_JUMPING`, se entrará con vy negativa fija, y se aplicará una gravedad reducida durante 8 frames. Luego se aplicará la gravedad normal. Horizontalmente se moverá como en `Z_PURSUING`. Cuando el valor de y sea el mismo que cuando empezó el salto, pasará a `Z_FALLING`.

Al final lo programé de tal forma que pasarlo a ensamble ha sido coser y cantar. Podrá optimizarse más seguro, pero sigo por debajo de 30K y eso me place.

## Retroceso

El retroceso del arma ha sido introducido especialmente para este juego y porque ha sido realmente fácil de metel.

## El desafío final

El desafío final serán 20 pantallas donde haya que llevar una a una 3 llaves para liberar a María. Las llaves estarán en los extremos del mapa y se indicará que llevamos una llave con un sprite custom. Las pantallas deben ser complicadas y el recorrido laberíntico. Tiene que haber muchos fanties "de serie".

### María

María nos espera detrás de tres cerrojos. Se implementará como un nuevo tipo de "enemigo". Tocarlo terminará el juego (WIN). María aparecerá en su sitio y si nos acercamos cambiará el sprite para que parezca que "nos anhela". Va a quedar muy pro. Pero mirad qué sencillo:

```c
	void extra_enems_move (void) {
		// María

		if (_en_t == 14) {
			en_an_next_frame [enit] = maria_cells [gpx >= 112];
		}
	
		[...]
	}
```

Finalmente, habrá que controlar la colisión con María. Cuando colisionemos con ella se pondrá un valor en `enemy_killer` (será el 0). Como `hook_mainloop` se ejecuta antes de calcular que el player esté muerto, podremos "cazarlo" y terminar el juego limpiamente.

```c
	void hook_mainloop (void) {
		// End of game is when you collide with María. 
		if (n_pant == 17 && enemy_killer != 0xff) {
			game_loop_flag = 1;
			player.is_dead = 0; 	// Just in case, be clean.
		} 
		enemy_killer = 0xff;

		[...]
	}
```

### La celda

Los tiles 47 se podrán traspasar pero te repelerán fuertemente si no llevas la llave. Como siempre se atacarán desde la izquierda, se pone un valor alto en negativo si el tile en (gpx + 11, gpy + 8) vale 47.

Si llevamos la llave, habrá que eliminar el tile. También necesitamos cierta persistencia. Como los cerrojos sólo se pueden abrir en secuencia, nos vale con una variable normal.

### Las llaves

En un principio pensé hacer las llaves como un enemigo custom, pero esto me iba a causar todo tipo de problemas, así que lo haré como un ente aparte.

El sprite extra (¡no hay que olvidar subir en 10 el valor de `NUMBLOCKS`) se crea en `hook_system_inits`:

```c
	void hook_system_inits (void) {
		sp_pinv = sp_CreateSpr (sp_OR_SPRITE, 3, extra_sprite_23_a, 3);
		sp_AddColSpr (sp_pinv, extra_sprite_23_b);
		sp_AddColSpr (sp_pinv, extra_sprite_23_c);
		pinv_current_frame = pinv_next_frame = extra_sprite_23_a;
	}
```

Y se imprime al final de `hook_mainloop`:

```c
	void hook_mainloop (void) {
		[...]

		// Carrying object
		if (phaskey) {
			if (player.facing) rdx = gpx - 4; else rdx = gpx + 4;
			rdy = gpy - 4;
		} else rdx = 240;

		sp_MoveSprAbs (sp_pinv, spritesClip, pinv_next_frame - pinv_current_frame, 
			VIEWPORT_Y + (rdy >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, rdy & 7);
		pinv_current_frame = pinv_next_frame;
	}
```

La parte de "llevas la llave" es muy fácil, porque sólo hay que añadir un sprite *custom* pegado a la espalda del personaje, al igual que ocurre en Ramiro 4. El tema de presentar las llaves como entes antes de cogerlas tiene más chicha, porque no tengo tiles vacíos.

Mirando la fuente pensé en que quizá podría hacer una carambola con salto mortal y tentetieso. Si intentamos pintar un tile más allá del número 47, fijáos en la "cuenta": se pintan los 4 caracteres a partir de t*4+64, pero todo esto se hace dentro del registro a, por lo que en realidad es `(((t*4) MOD 256) + 64) MOD 256`.

* Para t = 48, (48 * 4) = 192, 192 + 64 = 256, 256 MOD 256 = 0 -> que quedaría dentro de la fuente.

Jugando con esto podría imprimir un tile "nuevo" si lo mapeo sobre la fuente, sobre símbolos que no use. Por ejemplo, 

* Para t = 49, (49 * 4) = 196, 196 + 64 = 260, 260 MOD 256 = 4

Y los caracteres 4, 5, 6 y 7 son `$`, `%`, `&` y `'`, que no se usan. Por lo tanto, si pongo ahí los 4 trozos de una llave de 16x16 y llamo a la función que pinta un caracter pasándole el valor 49, usará esos cuatro caracteres para poner la llave. Clever.

Para hacerlas aparecer en el mapa sin tener que programar absolutamente nada, abusaremos del motor de hotspots. Recordemos que el hotspot (salvo las recargas) se pintará con el `tile 16 + t`, con `t` el tipo de hotspot. Para que se use el tile especial número 49 sólo tendremos que añadir un hotspot de tipo 33, o 0x21 en HEX.

En nuestro código custom, detectamos que hemos tomado un hotspot tipo 33 y activamos la llave. Y si ya tenemos la llave, habrá que restaurar el hotspot (con la función pillada directamente de **Cheril Perils** y hacer rebotar al personaje):

```c
	void hook_mainloop (void) {
		[...]

		// Get key
		if (latest_hotspot == 33) {
			if (phaskey) {
				// We have to restore the hotspot!
				set_hotspot (33);
				play_sfx (8);
				player.vx = make_nsign (player.vx, 256);
				player.vy = make_nsign (player.vy, 256);
			} else phaskey = 1;
		}

		[...]
	}

```

## Back to engine - enemigos compactos

Ahora que puedo hacer que haya más de 3 enemigos por pantalla quiero subir a 4 o 5 y emplear un nuevo tipo de "enemigos compactos" en los que ahorro 2 bytes por enemigo empaquetando los límites de trayectoria en forma de XY1, XY2.

Tengo que modificar el motor en tres sitios:

- `calc_baddies_pointer` debería multiplicar por 7 u 8 en lugar de 9 o 10.
- `init_malotes` tiene un par de inicializaciones usando `ix` donde habría que ajustar el offset.
- `mueve_bicharracos` tiene que desempaquetar los valores al extraerlos a las variables globales y (opcionalmente) volverlos a empaquetar.

```c
	#define PACKED_ENEMS
	#define FIXED_ENEMS_LIMITS 
```

