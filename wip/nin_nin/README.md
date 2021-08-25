Diario - Nin Nin v4
===================

Port o reversión o como quieras llamarlo del Nin Nin de NES para CPC en Modo 1 porque me apetecía. ¿Por qué me tengo que estar siempre justificando cuando tomo decisiones no comerciales, si este es mi rollo? Ni idea.

Quiero que sean muchas pantallas y meter las cosas customs del engine que movía Nin Nin en CPC (Agnes 0.1R), así que primero voy a ver qué herramientas tengo en MK1v4 para que mapa y enemigos ocupen menos. 

## Mapa

Por suerte tuve a bien adaptar todas las rutinas de RLE a v4 y están incluidas. Definiendo `RLE_MAP` como `44` para usar los mapas de 16 tiles molaría, pero además necesito `MAPPED_TILESETS`, por lo que creo que va a tocar mirar cómo hacer para combinar ambas características, y obviamente portarlo a la versión de ZX. Ahora mismo se supone que `RLE_MAP` y `MAPPED_TILESETS` son excluyentes.

La idea es modificar la rutina de `RLE_MAP` para que, en última instancia, una vez extraído el tile que se quiere pintar, use ese número como índice de `_tileset_mappings` para obtener el número correcto. Para que funcione todo esto sin tener que cambiar mucho la estructura, tendré que modificar el orden de los `#ifdef / #else` para que entre por `RLE_MAP` *antes* y ahí dentro pueda detectar `MAPPED_TILESETS`, ya que ahora activando ambos se activaría la sección de código de `MAPPED_TILESETS`, que está antes.

Una vez cambiado el orden sólo hay que atender a esta parte, que extrae el número de tile de la palabra *RLE*:

```
    #if RLE_MAP == 44
        and 0x0f
    #elif RLE_MAP == 53
        and 0x1f
    #else
        and 0x3f
    #endif          
    ld  (_rdc), a
```

y pinchar ahí nuestro lookup, sin olvidar que `_tileset_mappings` es un *puntero*:

```
    #if RLE_MAP == 44
        and 0x0f
    #elif RLE_MAP == 53
        and 0x1f
    #else
        and 0x3f
    #endif  

    #ifdef MAPPED_TILESETS
            ld  hl, (_tileset_mappings)
            add a, l
            ld  l, a
            jr  nc, dsl_noinc
            inc h
        .dsl_noinc
            ld  a, (hl)
    #endif

    ld  (_rdc), a
```

## Enemigos

Tenemos las directivas `PACKED_ENEMS` y `FIXED_ENEMS_LIMITS` que ahorran historias y además hacen que los enemigos ocupen 2 bytes menos cada uno. Esto supone un ahorro de 576 bytes si tiro por la idea de ponerle 96 pantallas al juego.

## Stab

Podría en principio usar el sword modo stab para simular el puñito de Ninjajar, pero es demasiado lento. Ahora mismo la espada de **MK1v4** está fija a 9 frames:

```c
    unsigned char swoffs_x [] = { 8, 10, 12, 14, 16, 16, 14, 13, 10 };
```

Se me ocurre esta medida indolora (para dejar todo default y no tener que tocar nada en juegos ya hechos):

```c
    #define SWORD_CUSTOM_FRAMES     4
```

Si añadimos esto al `config.h`, este es el número de frames que se maneja, y los arrays con los offsets se definen en `sword_custom_frames.h` que deberán definir los arrays `swoffs_x` y `swoffs_y` (este último si no se define `SWORD_STAB`).

Hay que tener en cuenta que los offsets no aplican de una forma muy intuitiva que digamos.

* Hacia la derecha: s_x = gpx + offset.
* Hacia la izquierda: s_x = gpx + 8 - offset.

Por ejemplo, tomemos que "offset" vale 16, esto daría:

* Hacia la derecha: s_x = gpx + 16:

```
    gpx
    |   gpx+16
    |   |
    +--+
    |  |XX
    |  |XX
    +--+
```

* Hacia la izquierda: s_x = gpx + 8 - 16 = gpx - 8

```   
    gpx - 8
    | gpx
    | |
      +--+
    XX|  |
    XX|  |
      +--+
```

Queremos un golpeo rápido y un recogimiento más lento, creo que nos podría valer con esto:

```c
    unsigned char swoffs_x [] = {8, 16, 16, 12, 8};
```

También me interesa que la espada sólo golpée entre dos frames. En este caso sólo entre los frames 1 y 2, y para eso tandré que añadir más `#defines`.

```c 
    #define MIN_SWORD_HIT_FRAME  1      // Hits if frame >= N
    #define MAX_SWORD_HIT_FRAME  3      // Hits if frame < N
```

Con estos añadidos lo tengo guay y no hay que tocar ningún juego viejo.

Antes de `.sword_check_done` está hardcodeado el tema de los frames para golpear a la pared (sólo si >= 3 y < 6). Aquí tendría que tocar.

En los enemigos, tengo igualmente que >=3 y < 6; aquí también tocaría.

## Un offset para más gráficos de enemigos diferentes.

Ahora mismo tengo en `enems_en_an_calc` esta linea:

```c
    rdb = en_an_base_frame [enit] = n << 1;
```

Puedo expandir con un `#define ENEMS_OFFSET enems_offset` o algo así y usar un `enems_offset` como variable custom o lo que haga falta, quedando entonces:

```c
    rdb = 
    #ifdef ENEMS_OFFSET
        ENEMS_OFFSET + 
    #endif
        en_an_base_frame [enit] = n << 1;
```

