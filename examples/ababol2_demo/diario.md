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



