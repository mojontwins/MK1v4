# Sir Ababol 2 Demo 2

El tema es meter de nuevo las cosas que empezamos a añadir a la Churrera 4 en tiempos para este juego. Originalmente esto empezó como un juego normal de la Churrera. Implementamos el hitter, o sea, la espada, y los tiles resbaladizos. Luego la cosa escaló y decidimos hacer un juego de 128K, con lo que lo deschurrerizamos y a partir de ahí evolucionó.

La versión de la churrera con los añadidos que sirvió como prueba de concepto no se conserva, por lo que voy a coger los trozos en el motor del juego final y a reintegrarlos en v4 para dar esta versión por cerrada. Más que nada por completitud... y porque me apetece.

## La espada

Veamos la implementación de la espada y simplifiquémosla hasta el vómito con nuestro nuevo Kung Fu. Resúmen:

### config.h:

```c
	#define ENABLE_SWORD
	#define SWORD_UP
	#define SWORD_LINEAL_DAMAGE 0
	#define SWORD_FLYING_DAMAGE 1
	#define SWORD_PARALYZES		32
```

### definitions.h

```c
	#define SWORD_TYPE_LEFT 	0
	#define SWORD_TYPE_RIGHT 	1
	#define SWORD_TYPE_UP 		2

	struct sp_SS *sp_sword;
	unsigned char *s_current_frame, *s_next_frame;
	unsigned char s_on, s_type;
	unsigned char s_x, s_y, s_frame;
	unsigned char s_hit_x, s_hit_y;

	unsigned char swoffs_x [] = {8, 10, 12, 14, 15, 15, 14, 13, 10};
	unsigned char swoffs_y [] = {2,  2,  2, 3,  4,  4,  5,  6,  7};

	extern unsigned char *sword_cells [0];
	#asm 
		._sword_cells
			defw _sprite_sword, _sprite_sword + 64, _sprite_sword + 128
	#endasm
```

### Swinging

Horizontal, 

```c
	s_y = gpy + swoffs_y [s_frame]`. 
	s_hit_y = (s_y + 4);
```

* Izquierda

```c
	s_x = gpx + 8 - swoffs_x [s_frame];
	s_hit_x = s_x;
```

* Derecha

```c
	s_x = gpx + swoffs_x [s_frame];
	s_hit_x = s_x + 7;
```

Vertical, 

```c
	s_x = gpx + swoffs_y [s_frame]; 
	s_y = gpy + 8 - swoffs_x [s_frame];
	s_hit_x = s_x + 4;
	s_hit_y = s_y;
```

La punta está activa entre los frames 2 y 6 no inclusive. Si el frame llega a 9, la espada desaparece.

### Activar

Se activa al pulsar disparo si `s_on` vale 0. Si se está pulsando arriba, `s_type = SWORD_TYPE_UP`, el otro caso `s_type = player.facing`. Dependiendo del tipo se asigna el sprite correcto usando el array correspondiente. `s_on` se pone a 1, `s_frame` a 0.

`s_on` se usa además para poner el sprite de "saltando" todo el rato si se está sacando la espada. Tonto pero efectivo.

### A los malos

Si el frame está entre 2 y 6, se hace colisionar el punto `(s_hit_x, s_hit_y)` dentro de la caja de 16x16 del malote. Lo que se hace con el malo dependerá de estas configuraciones, según el tipo y el valor de 

```c
	#define SWORD_LINEAL_DAMAGE 0
	#define SWORD_FLYING_DAMAGE 1
	#define SWORD_PARALYZES		32
```

Si el damage que sea dependiendo del tipo vale 0, no paha na, to fuera como ezo. Si vale 1, se le resta energía. Si se define `SWORD_PARALYZES`, el enemigo se queda paralizado durante `SWORD_PARALYZES` frames.

El estado paralizado se activa con el bit 5 y puedo reaprovechar `en_an_count` si me ocupo de ponerlo a 0 cuando baje el bit 5.

Y así es como lo voy a implementar. Voy a ver como ando de bollería para generar bien los tres cells de 8x8 para el sprite. Ando bien. Zaca er cushillo de hamón. Usamos `sprcnvbin8.exe` y enganchamos el binario en `extrasprites.h`.

## Tiles destructibles

Se trata de tiles destructibles sin buffer, que se rompen a la primera. Habrá una variable `process_breakable` si hay algún tile destructible que destruir. Al detectar un tile destructible (`& 32`), se encolará en la lista compuesta por tres arrays:

```c
	unsigned char b_f [MAX_BREAKABLE];
	unsigned char b_x [MAX_BREAKABLE];
	unsigned char b_y [MAX_BREAKABLE];
```

`b_f` se inicializa con el valor `MAX_BREAKABLE_FRAMES`. 

Si `process_breakable` vale cierto, se procesan los breakables. Se empieza poniendo `process_breakable` a 0, y si hay algún `b_f`  se procesa, para terminar decrementando `b_f`. Si sigue sin valer 0, se pone `process_breakable` a 1. Cuando se encola, se cambia el tile por `BREAKABLE_BREAKING_TILE`, que debe ser no traspasable pero **no rompiscible**. Cuando `b_f` llega a cero, se sustituye por `BREAKABLE_ERASE_TILE`.

Tenemos las funciones `actualiza_breakables` y `add_to_breakables`. Esta última tendré que engancharla a la espada y también a los disparos (para futuras cacurcias).

### Monedas en los rompiscibles

Se puede hacer que un rompiscible tire una moneda (u otra cosa) muy fácilmente. `BREAKABLE_SPAWN_CHANCE`, si está definido, hará que si `rand () & BREAKABLE_SPAWN_CHANCE == 1` salga un `BREAKABLE_SPAWN_TILE`.

## Monedas persistentes

Hacer monedas persistentes (que se cojan y se queden cogidas) es trivial si tu mapa está comprimido en memoria. El problema es cuando no lo está. Tenemos que hacer un buffer. Puedo usar 20 bytes por pantalla y bits para las monedas recogidas. En total serían 400 bytes para esto. Los puedo ubicar fuera del binario en `AD_FREE - TOTAL_SCREENS * 20 `. Me sirve para cualquier tipo de persistencia, por cierto. Habrá que actualizar la estructura cuando se rome un tile, levantando el bit correcto: `n_pant * 20 + y * 2 + (x >> 3)`, bit `(x & 7)`.

Por ejemplo, en la pantalla 0, y = 5, x = 4, levantaremos en `0 + 2*5 + (4>>3)` = 10 el bit 4. Para x = 12, levanteremos en `0 + 2*5 + (12>>3)`= 11 el bit 4.

Algo así:

```c
	#ifdef ENABLE_PERSISTENCE
		void persist (void) {
			// Marks tile _x, _y @ n_pant to be cleared next time we enter this screen		
			*(PERSIST_BASE + (n_pant << 3) + (n_pant << 1) + (_y << 1) + (_x >> 3)) |= bitmask [_x & 7];	
		}

		void draw_persistent_row (void) {
			for (gpit = 0; gpit < 7; gpit ++) {
				if (rda & bitmask [gpit])
					set_map_tile (rdx + gpit, rdy, PERSIST_CLEAR_TILE, comportamiento_tiles [PERSIST_CLEAR_TILE]);
			}
		}

		void draw_persistent (void) {
			gp_gen = PERSIST_BASE + (n_pant << 3) + (n_pant << 1);
			for (rdy = 0; rdy < 10; rdy ++) {
				rdx = 0; rda = *gp_gen ++; draw_persistent_row ();
				rdx = 8; rda = *gp_gen ++; draw_persistent_row ();
			}
		}
	#endif
```

