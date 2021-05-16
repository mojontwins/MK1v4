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

### Slippery

Paso a ensamble el código que detecta los tiles resbalosos y modifica AX, RX, 31916->31903.

### Conveyors

Escribo un trozo de ensamble bastante ingenioso (nada de traducción directa de C) para manejar las cintas transportadoras: 31903->31846

### Encapsular `calc_baddies_pointer`

... Y reaprovecharlo para calcular las coordenadas en las que hay que pintar a los enemigos normales: 31846->31794.

## Las nuevas habilidades

La idea de reconducir el proyecto es dejar jugar las fases (4 en total al final, he de añadir una cuarta) en cualquier orden, pero permitir "comprar" habilidades si en cada fase recogemos un objeto especial (¿monedas para una tienda?). El juego tendrá continues infinitos y se podrá "reiniciar" - o mejor explicado, las fases completadas serán "recordadas" entre partidas hasta que decidamos "reiniciar".

Estas son las mejoras que hemos ideado:

* **Maestra de las llaves** - no necesitas llaves para abrir cerrojos, y las llaves que existen en el mapa se convierten en recargas de vida.
* **Maestra de vuelo** - se activa el "ramiro hover".
* **Maestra de resistencia** - Los monstruos no matan estando paralizados.
* **Maestra del tiempo** - los resonadores hacen tick más despacio.
* **Maestra de estabilidad** - No te resbalas.

Las habilidades están requiriendo cambios y adiciones en el motor, `MASTER_OF_KEYS`, `PARALYZED_DONT_KILL_ON_VAR`, `RAMIRO_HOVER_ON_VAR`, `DISABLE_SLIPPERY_ON_VAR` para las mejoras 1, 2, 3 y 5. La habilidad 4 requerirá cambiar la forma en la que se manejan los resonadores. Ahora se hace con un contador general hasta 250 y dividiendo por 25 usando el runtime (aprovechando que esa rutina se incluye de todos modos), tendré que usar otro método con dos contadores que intentaré que ocupe lo menos posible para no impactar demasiado.

```c
    if (resonators_on) {
        resonators_on --;
        rdd = resonators_on / 25;
        if (resct_old != rdd) {
            play_sfx (4);
            draw_2_digits (25, 1, rdd);
            resct_old = rdd;
        }

        if (resonators_on == 0) {
            play_sfx (3);
            restore_everyone ();                
            if (hotspot_t >= 4) {
                /*
                hotspot_t = 4;
                set_hotspot ();
                */
                #asm
                        ld  a, 4
                        ld  (_hotspot_t), a
                        call _set_hotspot
                #endasm
            }
        }
    } 
```

Este es el código original. Necesitaré dos contadores. Ahora `resonators_on` irá de 10 a 0, se pintará -1, y tendremos `resonators_ct`. Implemento en C y luego ensamblo si eso.

```c
    if (resonators_on) {
        if (resonators_ct) resonators_ct --; else {
            resonators_ct = resonators_frames;
            resonators_on --;

            if (resonators_on == 0) {
                play_sfx (3);
                restore_everyone ();                
                if (hotspot_t >= 4) {           
                    #asm
                            ld  a, 4
                            ld  (_hotspot_t), a
                            call _set_hotspot
                    #endasm
                }
            } else {
                play_sfx (4);
                draw_2_digits (25, 1, resonators_on);
            }
        }           
    } 
```

Con todo el setup ocupa 2 bytes menos, pero puedo mejorar desde 31792 si lo paso a ensamble.

## Más de 85 pantallas

Los cálculos son de 8 bits para algunas cosas y eso limitaba a 85 el máximo número de pantallas. Cambiando los cálculos puedo tener las 96 pantallas que necesitamos para este juego. Ahora mismo estamos a 31774 bytes, antes de añadir las 24 nuevas pantallas de la cuarta fase.

## El hub

Lo mejor para poder acceder libremente a las 4 fases es hacer una pantalla "Hub". La pantalla debe dar acceso a las 4 fases por 4 salidas bien aparentes, y bloquearlas al terminar las fases. Cheril debe aparecer siempre por la parte de arriba en el tile central y caer. La pantalla debería usar un arreglo de tiles que incluyese tiles definitorios de cada una de las cuatro fases.

Debe mostrarse 4 "carteles" señalando a las 4 salidas, dos a la izquierda y dos a la derecha, en (2, 5) (level 0), (2, 2) (level 1), (13, 5) (level 2), (12, 2) (level 3). Para pintar estos carteles necesitaré ocupar algunos caracteres y tener una función custom que espero que me ocupe muy poco :-/.

La conexión con las fases la voy a hacer en los `custom_screen_connection`. Dependiendo si gpy >= 48 o no va a una fase u otra.

## Implementando compra habilidades

Necesitaré un título de la habilidad y un pequeño texto con una descripción, y tengo que lograr que esto sea lo más compacto posible. Por ejemplo:

|Podewr|Descripción
|---|---
|`MASTER OF LOCKS`   |`OPEN LOCKS WITHOUT A KEY`
|`MASTER OF WIND`    |`FLOAT WHILE FALLING WITH ↓`
|`MASTER OF STRENGTH`|`PARALYZED GOONS ARE HARMLESS`
|`MASTER OF TIME`    |`RESONATORS TICK SLOWER`
|`MASTER OF GRIP`    |`CHERIL WON'T SLIP ON ICE`

|Podewr|Descripción
|---|---
|`REINA DEL CERROJO` |`ABRE CERROJOS SIN LLAVES`
|`REINA DEL VIENTO`  |`FLOTA MIENTRAS CAES CON ↓`
|`REINA DEL PODER`   |`MALOS PARALIZADOS NO MATAN`
|`REINA DEL TIEMPO`  |`RESONADORES VAN MAS LENTOS`
|`REINA DEL AGARRE`  |`CHERIL NO RESBALA EN HIELO`

(↓ es un caracter definido para ser una flechita pabajo)

## Sierras giratorias

La idea es implementar las sierras giratorias para dar más age, junto con otros tipos de enemigos sencillos. El reto es implementar este código de Yun/AGNES usando la mínima expresión en ensamble.

```c
    // MT MK2 NES v0.8y - Yun Edition
    // Copyleft 2017 by The Mojon Twins

        // Gyrosaws
        // Clockwise is L U R D, place here:
        // ···
        // ·Xv
        // ·<o with SPEED = 1

        // Counter-clockwise is L D R U, place here:
        // ·<o
        // ·X^
        // ··· with SPEED = 0

        // en_r is GYROSAW_STATE.
        // en_mx is GYROSAW_COUNTER.
        // en_my = 1 means "clockwise" GYROSAW_DIRECTION
        
    #ifdef GYROSAW_SLOW
        if (half_life) 
    #endif
        {
            delta = (_GYROSAW_DIRECTION ? (_en_state >> 1) : (((_en_state + 1) & 3) >> 1)) ? GYROSAW_V : -GYROSAW_V;
            if (_en_state & 1) _en_y += delta; else _en_x += delta;
            _GYROSAW_COUNTER = (_GYROSAW_COUNTER + GYROSAW_V) & 31; if (!_GYROSAW_COUNTER) _en_state = (_en_state + 1) & 3;
        }
        
        spr_id = GYROSAW_CELL_BASE + half_life;
        // enems_spr ();
```

Veamos, necesito un "en_state", un contador y una dirección. El código original reaprovecha `mx` y `my` para contador y dirección. Para el estado no puedo usar "en_an_state" porque ese "estado" es el interno del motor que emplea para "paralizado", por ejemplo, entre otras cosas. Aunque lo suyo sería que estos enemigos no separalizasen...

Los customs que (des)paralizan no deberían paralizar las sierras.

Voy a usar el tipo 15. Pongo una en la playa y a probar.

El tema (antes de nada) es la colocación. Aquí los valores del .ene se traducen directamente quizá tenga que jugar con x1, y1, x2, y2. Los coloco en una de estas dos posiciones y pongo el punto de final en la diagonal opuesta.

```
    o>·
    ^X·
    ··· con x1 < x2

    ···
    ·X^
    ·>o con x1 > x2
```

El conversor no debe invertir las coordenadas para los tipos > 4.

En la inicialización establezco todos los parámeros especiales: `state` ya vendrá a 0, pero tengo que establecer `mx` a 0 (es el contador) y `my` a 0 si `x1 > x2` o 1 si `x2 > x1`.

