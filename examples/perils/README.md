# Cheril Perils MK1v4

Un port de Cheril Preils (MK1 v2) a **MTE MK1 v4** para validar algunas partes del motor. De camino, he implementado los resonadores usando hotspots customs y empleando las capacidades de la v4.

Los resonadores se implementan como hotspots de tipo 4 y 5, pintados con los tiles 20 y 21.

Para paralizar a los enemigos he activado `ENEMIES_MAY_BE_PARALIZED` y pongo su estado `en_an_state` a `ENEM_PARALYZED`, y `en_an_ct` a 255. Aparte, llevo una cuenta a 250, que son unos 10 segundos. Cuando la cuenta llega a 0, desparalizo a los enemigos.

Hay que paralizar de nuevo a la entrada si los resonadores están a "on". También hay que modificar los números de los hotspots. Como `hook_entering` se ejecuta al final de pintar la nueva pantalla, todo esto es factible.

Para que los enemigos sólo puedan matarse cuando el resonador está "on" utilizo este truco: he activado `PLAYER_MIN_KILLABLE` y lo he definido como una variable `player_min_killable`, que pongo a 1 si los resonadores están activados, o 4 si no.

## Revamp

Una vez que el juego original estuvo portado y los temas que quería afinar afinados, me planteo hacer un juego completo de 3 fases / 72 pantallas juntando adaptaciones de las tres fases del Babushka Svezda / Yun original.

Para conseguirlo voy a usar el modo "mapped tilesets", en el que un mapa packed puede usar un conjunto arbitrario de tiles definido por un array apuntado por `*tileset_mappings`.

Tendré que trabajar también en la forma de reducir los mapas. Puedo usar Photoshop como ya he hecho en alguna ocasión, usando el modo "raw" y luego retocando a mano.

## Multifase

Haremos el multifase fingido de la misma manera que en **Helmet**: un mapa grande con todas las secciones. Sin embargo, en este juego usamos mapped tilesets y habrá que, además, asignar el tileset correcto en cada fase:

```c
	[...]

	unsigned char level, new_level;
	unsigned char new_level_string [] = "LEVEL 00";

	unsigned char scr_ini [] = { 60, 64, 68 };
	unsigned char ini_x [] = { 1, 1, 1 };
	unsigned char ini_y [] = { 4, 4, 4 };
	unsigned char max_enems [] = { 1, 1 };

	unsigned char tilemaps [] = {
		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
		32, 33, 34, 11, 36, 37, 38, 39, 40, 41, 12, 23, 24, 45,  0, 15,
		 0, 17, 46, 47, 43, 44, 35,  6,  8,  7, 19, 22, 12, 39,  4, 15
	};

	[...]

	void hook_init_game (void) {
		[...]
		level = 0;
		new_level = 1;
	}

	void hook_init_mainloop (void) {
		if (new_level) {
			new_level = 0;
			sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
			sp_Invalidate (spritesClip, spritesClip);
			new_level_string [7] = level + '1';
			draw_text (12, 11, 71, new_level_string);
			draw_text (11, 13, 71, "KICK ASSES");
			sp_UpdateNow ();
			play_sfx (10);
			espera_activa (150);
			n_pant = scr_ini [level];
			init_player_values ();
			player.killed = 0; 
			tileset_mappings = (unsigned char *) (tilemaps + (level << 4));
		}
	}
```

## Revamp 2

Voy a darle un poco de age como más tarde explicaré, pero antes quiero bajar un poco de peso el motor una vez más. Ya lo bajé a saco haciendo Helmet y Ramiro 4, pero hay cosas que aún están sin tocar porque se usan mayormente en este.

### borrar tiles cerrojo abiertos al entrar en pantalla

Pasando el bucle a ensamble optimizado pasamos de 32317 a 32139 (!)

### borrar tiles cerrojo al usar una llave

El grueso estaba en ensamble, pero la inicialización de la función que contenía las copias de los parámetros a `_x` e `_y` y una llamada a `set_map_tile` no. Pasamos de 32139 a 32127. Menos da una piedra :-/

### Cambiar el único sp_MoveSprAbs que quedaba

Con esta configuración esto es: el de `enems_kill`. Paso a ensamble y me fumo la interfaz C. Pasamos de 32127 a 32008. Aún puedo ahorrar más si encapsulo esta rutina y la reutilizo en `render_all_sprites`: ¡31931!

El objetivo principal era bajar de 32000 con los add-ons (por ahora, `MASTER_OF_KEYS`, `PARALYZED_DONT_KILL_ON_VAR` y `RAMIRO_HOVER_ON_VAR` (¡que activa `RAMIRO_HOVER`!)), que ya estaría cumplido... De todos modos mañana echaré otro vistazo. Añadir una cuarta fase subirá la ocupación a 2544 bytes más, y quiero tener todo el sitio posible para las pantallas y lógica nuevas.
