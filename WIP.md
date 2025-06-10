# WIP

Cosas que me apunto de un día para otro para ir resolviendo cuando se vaya pudiendo.

[X] Limpiar de CPCRSLIB todo lo que no se use en mojonia.

[ ] Resolver cómo hacer saber al script cuántos empujables hay en la pantalla de la mejor forma: la que menos impacto tenga en el motor principal. Recordemos que el goal de la v3.2 por ejemplo es ser lo más bare bones posible ¿Hago un array que cuente las ocurrencias de cada tile? ¿Cómo la hago accesible desde el script? `read_vbyte` está ya muy poblado, recordemos que sólo tengo sitio para 14 variables de motor y no quedan muchas libres a menos que haga otra codificación que tengo que estudiar ($FF XX = flag, $FE XX = variable de motor, por ejemplo ~ igualmente ahora son $FF XX con XX = $F1 .. $FE ¿no? complico levemente el intérprete pero el bytecode sigue ocupando lo mismo)

    * Primero voy a hacer la recodificación de las variables de motor con $FE y luego ya veremos. ¡Un momento! No es tan fácil por el tema de los lvalues.  Cuando se guarda $A = B, tenemos que el bytecode no contiene $A sino A ya que se sobreentiende flags[A]. De hecho, todo esto funciona porque son "flags" especiales. 

    El tema de que las variables de motor tengan que ocupar los flags > $F0 es una limitación real? NO. A fin de cuentas, tenemos que difícilmente tendré más de 32 flags en el juego. No hace falta 240. **Puedo usar todos los índices que necesite**, siempre que siga tomando valores del final.

    ** Así que no cambiamos ninguna codificación **.

[ ] Implementar el timer ¿en el motor o en msci? Si se hace en msci necesitaremos un hook en el mainloop. Recordemos que el timer no llegó a MK1 hasta 3.99.2 ~ y era mucho más complejo. Pero ahora incrementaré cada 25 frames de juego y tendré ~ 1 segundo por paso, y sólo tendrá sentido usarlo desde el script. El original se podía usar sin script pero tampoco era muy util y jamás se usó. Aún me estoy planteando si meter las recargas de tiempo como hotspots o dejar al programador que lo implemente todo en el script. En cualquier caso, el valor del TIMER debe estar disponible para lectura y escritura. 
    
    * Afterthought: Aunque en v3.2 no tenga sentido fuera del scripting, en v4 o en v5 sí podría utilizarse desde código custom, así que no puede formar parte de msc.h. 

```c
    // Minimal timer 
    // needs timer_on, timer, timer_ct

    // Usually, you start with timer = N, timer_on = 1, timer_ct = 0

    #asm
        .timer
            ld  a, (_timer_on)
            or  a 
            jr  z, timer_done

        .timer_do 
            ld  a, (_timer_ct)
            or  a
            jr  z, timer_ct_zero
            dec a 
            jr  timer_ct_write 

        .timer_ct_zero 
            ld  a, (_timer) 
            dec a 
            jr  nz, timer_write 

            // Hook "on timer zero"
            
            xor a
            ld  (_timer_on), a          // Turn off timer

        .timer_write
            ld  (_timer), a 
            ld  a, 24

        .timer_ct_write
            ld  (_timer_ct), a 

        .timer_done
    #endasm
```


[ ] Sección ON TILE PUSHED y hacer que `MOVED_TO_TILE`, `MOVED_X` y `MOVED_Y` lleven los valores correctos. (tile que se "pisa" y sus coordenadas).

[X] Generalizar la sección ON COIN GET o como fuese para que se lance cada vez que el jugador coja algo, ya sea una moneda o toque un hotspot (por ahora). Esto nos permite, por ejemplo, reaccionar a hotspots custom (por ejemplo, para implementar la recarga de timer sin tocar el motor) o implementar de forma controlada el "se acabó el juego al coger X objetos". Recordemos que al activar el scripting se desactivan las formas de ganar el juego que no sean con un `WIN GAME` desde el script.

[X] He activado los random respawn en calaverga y ahora resulta que o bien no van o bien es que no detecta la morisión para activarlos. Habrá que hacer la revisasión.

    * Era una tontería. Ya salen, pero se cuelga como ocurría en v4 cuando están en la zona que parpadean. O bien el código que pone el frame vacío con 0xff está mal, o bien estoy haciendo el tontaina por otro sitio. Habrá que hacer la revisasión. De esto también.

    * Era también un fallo tontísimo. Además lo he cambiado para que usen maincounter & 1 para parpadear.

    * La detección de "cerca del borde" también está mal porque parpadea siempre... Además el parpadeo parece muy lento ? Esto sí es rarow.

    Hace A = coord, B = limite. 

    Por ejemplo, 
        * A = 12, B = 0 -> 12, ABS (12) < 16 ? SI.
        * A = 18, B = 0 -> 18, ABS (18) < 16) ? NO.

        * A = 220, B = 224 -> -4, ABS (-4) < 16 ? SI.
        * A = 200, B = 224 -> - 24, ABS (-24) < 16 ? NO.

    Pero wait, a lo mejor es que se comprueba todo. Veamos por ejemplo para A = 100:

        * B = 0 -> ABS (100) < 16 ? NO
        * B = 224 -> ABS (-114) < 16 ? NO

    Entonces no es esto lo que falla.

    * Aún no lo hallo pero creo que hay que poner algún límite a los fanties porque si no se van y se van y se van y cuando quieres que vuelvan tienen que venir desde Gines y nos plan.

        A ver, el límite está puesto pero se lo pasan por el pie? Qué desastre. Estoy usando las mierdas de z88dk, uséiase `l_ge` y  `l_lt`. Supuestamente tú pones en DE el valor, en HL el otr ovalor, llamas a `l_ge` y te pone el carry si DE >= HL. Pero estoy mirando el código y no sé en qué estaba pensando, es muy raro. Voy a hacer la reescribisión.

        Supuestamente no rompen HL ni DE pero es que tendría que estar mirando las fuentes del z88dk que estoy usando NO? BAIA la versión vieja si se carga DE, así que tengo que tener eso en cuentra para la reescribisión.

        Estaba bien , pero faltaba poner vx/vy = 0 en estos casos -- Pero ahora si tocamos "0" en un eje el fantasma se atrapa en esa posición y no es capaz de salir. Con el límite superior no parece haber problemas. Llevo demasiado tiempo con esto.

        Era una tontería de antología, como de costumbre. Ahora sólo me falta arreglar que los fantasmas parpadéen al acercarse al borde... O quitar eso por completo, cada vez me convence menos esa solución. Quitarlo implicaría quitarlo también de v4.

        Al final lo quité.

[X] Hay un pequeño glitch con la paleta del marcador al empezar el juego. Revisar.

    * No sé por qué @#!! pasa este glitch. Hay otro en los juegos que no son `DIRECT_TO_PLAY` que es por razones diferentes. El sistema no lo he diseñado sino que lo he ido construyendo a salto de mata según me iban faltando cosas y a lo mejor es el momento de parar, borrarlo todo, y empezar de nuevo. 

    * Tenemos tres configuraciones:

    - Sin split, la paleta se pone al principio, en `system_init`, llamando directamente a `my_inks`.

    - `AUTO_SPLIT` / `ALWAYS_SPLIT` pone siempre `pal_hud` tras ejecutar el wyz player, en la 6ª int. Cualquier paleta que queremos que salga en el area principal de la pantalla hay que inyectarla escribiendo la dirección de la rutina en `inject_pal + 1`.

    - `AUTO_SPLIT` sin `ALWAYS_SPLIT` funciona como el anterior siempre que `_do_split` valga 1. Si no, actúa como sin split (no hace nada durante el ISR).

    Voy a arreglar primero `perils`. Remember, `ALWAYS_SPLIT` y todas las paletas deben inyectarse, jamás ponerse directamente.

[X] Pasar a asm el código que hace rebotar al player y los fantys, que lleva sin tocar desde 2010.

[X] Añadir un flag (o scenery_info a la v4) para poder invalidar el proceso que genera los fantis RR, con el objeto de poder añadir un hotspot que los mate a todos para siempre (al menos hasta que volvamos a la pantalla).

    * Añadir import de _scenery_info en msc4i.
    * Añadir variables especiales HIDE_HOTSPOTS y DONT_MAKE_FANTIES que asignen directamente a `scenery_info.hide_hotspots` y `scenery_info.dont_make_rr`.

[X] Poner un define para el tile que se emplée como "objeto vacío". Problem is, esto se hace desde msc4i.asm, donde no llegan mis flags. O no, muuuucho más sencillo: definir el tile 47 como vacío y que el que lo implemente que se apañe. Es mucho menos problemático que usar el tile 0. **Qué menso, esto se resuelve sólo tocando el puto script del juego**

[X] Más miserias que resolver: Cómo matar a un enemigo desde el script (zombie calavera), o cómo desactivar un enemigo desde el script (Ninjajar, pero esto para el futurow).

    * El problema actual es que llamar a enems_kill necesita que el enemigo se haya sacado del storage a las variables temporales.
    * Lo cual no es un problema porque separé las rutinas que sacan y meten al enemigo del storage.

```c
    // Kill all enemies
    for (enit = 0; enit < MAX_ENEMS; enit ++) {
        enoffsmasi = enoffs + enit;

        // Copy array values to temporary variables as fast as possible
        #asm
                call enems_get_values
        #endasm

        if (_en_t && _en_t != 4) enems_kill (99);

        #asm
                call enems_update_values_store
        #endasm
    }
```

[X] Al llegar al final se interrumpe si estábamos pulsando una tecla. Hay que cambiar a `pad_this_frame`.

[X] Probar los enemigos custom metiendo como añadidos los cuadrators y los suputabolers de la versión v4 en Cheril of the Bosque.

[!] Creo que he dado con un misterioso bug o feature de esta versión de z88dk vieja que hace que si pones el prototipo de una función antes de definir la función, rodea a la misma con un `push hl` al principio y un `pop bc` al final, cosa que no hace si no se añade un prototipo. Esto me rompía completamente el motor (yo esperaba que la rutina no tocara bc, pero con el código añadido lo hace). Now that's WEIRD.

[X] ¡Script y enemigos! Definir enemigos custom que hagan de NPCs puede molar si interactuar con ellos es posible. Sin tener que meter nuevas secciones (o quizá aprovechando alguna), pulsando ACCION sobre un enemigo de estos lanzará las PRESS_FIRE correspondientes. Entonces estaría bien saber con qué EN_T se está colisionando (0 si ninguno, por ejemplo) y ya para nota su EN_IT... Ya de entrada con eso nos podría valer para hacer un bajillón de cosas. El tema es la colisión con el enemigo que te va a matar sí o sí. Eso se soluciona con otra entrada en `custom.h`.
    * El tema es que `_en_t` y `en_it` sólo tienen sentido durante el bucle que actualiza los enemigos. Lo suyo sería que se lanzase el script cuando te toca un enemigo, pero soy reticente a meter más secciones (sobre todo porque tendría que echar para adelante el índice por pantallas y eso sería ocupar más y más bytes... ¿Qué podría reutilizarse? `SC_PLAYER_KILLS_ENEMY` selanza en `enems_kill`, no tendría sentido. `SC_PRESS_FIRE_AT_ANY` está overcrowded... 

    Me parece que no voy a tener más que subir a 16 las secciones especiales.

    * Como lo ise: Si colisionas con un bicharraco -> (si ENABLE_CUSTOM_ENEMS should collide) colisión, llamar a script (SC_ENEMY_TOUCHED). Quicir, al script siempre se llama. `should_collide` decide si el enemigo **MATA**. A lo mejor hay que renombrar. `this_enemy_kills`.

    A ver como lo pruebo. En TB, que al tocar al becario diga algo por ejemplo.

[X] Hacer que los enemigos custom puedan NO matarte. 

[X] Encontrar una forma fácil de replicar por defecto el movimiento lineal 1..4 en otro en_t... ¿tan fácil como mover a una subrutina? YES, subrutined! 

    * Si queremos que el enemigo custom tenga el comportamiento lineal estándar y luego haga más cosas se puede hacer que...

```c
    // custom.h

    // [...]

    void extra_enems_move (void) {
        // Check _en_t and update your custom enemies. When you are finished. 
        // Current enemy vars are copied to temporary _en_x, _en_y, etc
        // write a proper frame pointer to en_an_next_frame

        if (_en_t == MI_TIPO_CUSTOM) {
            #asm
                    call en_lineal_do
            #endasm

           // Hacer más cosas custom aquí
        }
    }

    // [...]
```

[ ] Soporte built-in de textos en msc4. DARLE UN PENSOTE. 

    * Quizá baste con toda la infraestructura para parsearlos en el script y crear el array de textos que se vaya referenciando del bytecode, con soporte para cadenas repetidas y tal, y luego dejar en manos del programador del juego el código del `textbox`. La idea es que el programador haga una rutina `textbox` y la ponga en `custom.h` o el `extern.h` y que msc4.h llame a esa rutina con el número del texto y un puntero al texto desempaquetado, porque usará *ESC5bit* como **Ninjajar** y otros MK2s.

[X] ¿Por qué hay ahora mamoneos en Calavera (¿y otros?) con las colisiones laterales mientras estamos saltando? Hay como barreras invisibles porque sí. Parece que en tiles beh 4.

    * ¿Tendrá que ver con que este juego tiene desactivado `SIMPLE_PLATFORMS` ? Pero no tendría sentido porque yo esto lo he notado mientras se asciende y con las colisiones LATERALES...
    * Ostras qué tonto. Estoy haciendo AND 12 en vez de AND 8 !!

[X] Terminar de pasar a ensamble el auto tile shadows.

    * En CPC, pasar la parte que calcula "nocast"
    * En Speccy, pasarlo todo

    Mayormente para que no necesiten llamar a la interfaz C de attr

[ ] Soporte para "frames por pixel" en los lineales. Por ahora mx = 1, 2, 4 pixels por frame, pero molaría 1, 2, 4 frames por pixel para enemigos lentorros. Estudiar cómo sería la forma más fácil de implementarlo en ensamble y tirar por ahí.

    * Tenemos este código que es el que mueve un eje cada frame...

```asm
        // [A]
        ld  a, (__en_mx)
        or  a
        jr  z, en_linear_horizontal_axis_done

        // [B]
        ld  c, a
        ld  a, (__en_x)
        add c 
        ld  (__en_x), a
```

    Si usamos negativos -1 (FF) = 2 frames per pixel, -3 (FD) = 4 frames per pixel.

```asm
        bit 7, a
        jr  z, en_lineal_horizontal_ppf

        // fpp
        neg a       // -1 -> 1, -3 -> 3
        ld  c, a
        ld  a, (_main_counter)
        and c 
        jr  nz, SKIP_NO_SE_MUEVE

        ld  a, 1

    .en_lineal_horizontal_ppf
        // Normal shit
```

    Ese inserto entre [A] y [B] podría funcionar. Lo probaré luego.

    * Pero qué tonto soy. Esto no me vale. mx / my ya tienen los valores cocinados y pueden ser negativos. Esto hay que codificarlo en otro sitio. Una vez resuelva dónde, hay que tener en cuenta que 

```
    1       = 00000001
    -1 = FF = 11111111
                     - =

    2       = 00000010
    -2 = FE = 11111110
                    -- =

    4       = 00000100
    -4 = FC = 11111100
                   --- =
```

    Interesante ¿no? Aparte de esto no sé cómo tirar para codificar esto XD

    Tengo que codificar para "1 pixel cada 2 frames y 1 pixel cada 4 frames". El tema es cómo codificarlo para que sea fácilmente detectable y no haya que hacer mil historias.

    * "1 pixel cada 2 frames" es "no mover si frame_counter & 1 != 0".
    * "1 pixel cada 4 frames" es "no mover si frame_counter & 3 != 0".

    En teoría la churrera admitiría hasta velocidad 8, que es:
```
    8       = 00001000
    -8 = F8 = 11111000
```
    Si uso estos bits:

``` 
    76543210
        XXXX -> velocidad normal 1 2 4 8
    YYYY------> para la velocidad subpixel
```

    El tema es que YYYY valen 0000 o 1111 para los positivos o negativos. No me vale.

    * Imaginemos que he encontrado la forma de saber si un enemigos es subpixel. En ese caso, las velocidades mx/my pueden ser 1/-1 y 3/-3. 

    No me va a servir, pero voy a mirar como se resolvía en AGNES u otros motores de NES a ver si me da alguna idea.

    * En AGNES, se permite 1 pixel cada 2 frames, y se hace poniendo un en_status a 1 y sus valores mx/my a 1. Se hace igual en los otros motores de NES.

    Vale, dejamos solo uno que se mueva si half_life. Imaginemos que ponemos V=16; tendríamos:

```
    16       = 00010000
    -16 = F0 = 11110000
```

    Imaginemos este algoritmo:

```    
        // A = v (pos o neg)
        ld  c, a
        and 0xf0
        ld  a, c
        jr  nz, en_lineal_horizontal_ppf

    .en_lineal_horizontal_fpp
        ld  a, (_half_life)
        and 1
        jr  nz, en_lineal_horizontal_done

        inc a 
    .en_lineal_horizontal_ppf
```        

    Me mosquea tanto mamoneo solo para una posibilidad más. Voy a dejarlo macerar.

[X] ¿Qué pasa con las empujaciones? ¿Sólo las laterales? Yuju, he roto todas las empujaciones XD Ha sido por el cambio de nombre de las variables para la colisión.

[X] Calavera hace una mierda rara con los pies al saltar y no me explico cómo es posible, a menos que possee o gotten se estén poniendo a 1 cuando no deberían. Si no, es que no tiene sentidow. **ES POR `player.possee`** Lo que no sé es por qué se pone a 1 en medio del puto aire. Mañana con más emoción lo miro.

[X] Es necesario poder definir en el script cuál es el tile vacío para que `GET ITEM SET` funcione correctamente. Ahora mismo comprueba que no llevamos nada mirando que en el flag del inventario haya un cero, y eso rompe Perils (que necesita 47 como tile vacío).

[X] Sigue haciendo "la cosa rara" al trepar a la plataforma tipo 4. Esto hay que cambiarlo y hacerlo BIEN. Pero no es trivial.

    * La solución es no detectar la colisión hacia abajo con 4 si hemos sobrepasado la linea de pixels equivalente a la velocidad vertical. Esto rompería algunos items de gameplay de viejos juegos, así que es opcional. Si no activas `SIMPLE_PLATFORMS` puedes, además, evitar el platform hop con `AVOID_PLATFORM_HOP`.

[X] Resolver que haga la metralleta al sonar siempre el sonido de WRONG si tocamos un objeto y llevamos ya otro en ONLY_ON_OBJECT. 

    * Lo suyo sería tener un flag de "tocando hotspot" que sirviese como semáforo. tocas -> { cosas ... poner a cierto } else { poner a falso }. Voy a añadir `hotspot_flag`.

[X] Calavera : Cuelgue al game over ¿pasa en todos :-S? Jodó qué tonto soy, es que la OGT no tiene canción de game over y se estaba llamando :-/

[X] ¡Vista lateral falsa! - La vista es lateral pero la física es genital. Hay que añadir "FAKE_SIDE_VIEW" para que la elección de frame sea la de la vista lateral (o sea, no es añadir o cambiar código, sino modificar la compilación condicional). Esto se pensó para Cosmonautic en 2010 pero nunca se hizo.

    * El movimiento en los ejes debe ser como `PLAYER_MOGGY_STYLE`.
    * La selección del facing debe ser como en vista lateral.
    * La selección del frame por ahora será custom: si hay thrust +1, si no +0.

[X] msc4 `WARP TO`.

[ ] Tiles animados -> a partir de N, con N par, usan N y N + 1, el período es fijo, el contador es random al crear uno. Estructura con 4 bytes, no intercalados. X Y T C. Roughly (rewrite in assembly!!)

```c
    unsigned char ta_i;

    void tilanim_add (void) {
        ta_x [ta_i] = rdx;
        ta_y [ta_i] = rdy;
        ta_t [ta_i] = rdt;
        ta_c [ta_i] = rand () & (TILANIM_PERIOD - 1)
        ta_i ++;
    }

    void tilanims_do (void) {
        for (gpit = 0; gpit < ta_i; gpit ++) {
            ta_c [ta_i] --;
            if (ta_c [ta_i] == 0) {
                ta_t [ta_i] ^= 1;
                set_map_tile (ta_x [ta_i], ta_y [ta_i], ta_t [ta_i], comportamiento_tiles [ta_t [ta_i]]);
                ta_c [ta_i] = TILANIM_PERIOD;
            }
        }
    }

```

[ ] `draw_and_advance` parece estar usando la interfaz C de `draw_coloured_tile` y a lo mejor puedo hacer el fullero.

<details>
    <summary>Cosas calculares</summary>

    # Cosas calculares.

    ¿Son muy pocos 5 colores en modo 0? Así podría tener fondo y primer plano pixel a pixel chulo, ¿no? Usando planos:

    ```
        Bits 3 2 1 0
             | \ / +- BG
             |  SPRITES
             FG
    ```

    De este modo, el bit 0 representaría dos colores para el fondo. Cuando se le hace OR de los sprites, que solo usan los bits 2 y 1, se debe mostrar el color de los sprites:

    ```
        SP   or  BG
        0000     0000 = 0000 BG color 1
        0000     0001 = 0001 BG color 2
        0010     0000 = 0010 \ 
        0010     0001 = 0011 --> Color 1 de sprites
        0100     0000 = 0100 \
        0100     0001 = 0101 --> Color 2 de sprites
        0110     0000 = 0110 \
        0110     0001 = 0111 --> Color 3 de sprites
    ```

    Así van 4 colores. Si pongo en el fondo otra cosa que no sea 0000 o 0001, al hacer OR me hará glitch. Imagina que hay 0010 y el sprite es 0100, se convertiría en 0110 que es otro color de sprite.

    El resto de los 8 colores debería ser igual. Si un pixel lleva el MSB a 1 (colores 8 a 15) debe mostrarse el color del primer plano. Pero podemos jugar con otra cosa:

    ``` 
        SP   or FG
        0000    1000 = 1000 FG color 1
        0000    1001 = 1001 FG color 2
        0010    1000 = 1010
        0010    1001 = 1011
        0100    1000 = 1100
        0100    1001 = 1101
        0110    1000 = 1110
        0110    1001 = 1111
    ```

    En la capa de tiles usanmos los bits 3 y 0; en los sprites los bits 2 y 1. Así nos salen 6 colores en total.

    Veamos qué pasa si abusamos del tema :D

    hacemos un sprite con píxeles 1000, se mostraría con los colores FG1 y FG2 dependiendo del color del BG. Podria ser como un fantasma. Teniendo en cuenta que los tiles solo serán de estos colores:

    ```
        BG1 0000
        BG2 0001
        FG1 1000
        FG2 1001
    ```

    Si hacemos un sprite con pixeles 1000, al pasar (OR) sobre ellos, resultará:

    ```
            BG   OR SP
        BG1 0000    1000 = 1000, FG1
        BG2 0001    1001 = 1001, FG2
        FG1 1000    1000 = 1000, FG1
        FG2 1001    1000 = 1001, FG2
    ```

    O sea, si pasa sobre FG no cambia pero si pasa sobre BG es traslúcido.

    ¿Qué pasa si un sprite tiene un pixel con el bit 0 a 1 (por ejemplo de color BG)? -> afectaría a los pixeles de primer plano: FG1 cambiaría a FG2. Funcionaría contra BG, ya que BG1 se convertiría en BG2 y BG2 se quedaría igual.
</details>
<details>
    <summary>LUTs para rotar sprites</summary>

    # LUTs para rotar sprites

    Me mosquea que la versión CPC vaya más lenta. Claramente no va a 25 fps. La única forma de acelerar esto de forma fiable es acelerar las rutinas de sprites, y en estas lo que más tarda es el rotado.

    Precalcular las tres rotaciones de los valores implicaría almacenar 768 bytes de LUT. Mirando el mapa de memoria de los huecos extra de VRAM tengo esto:

    En E600 están las estructuras de sprites. Son 16 sprites a 16 bytes cada uno, por lo que una de las rotacionmes podría ir en E700.

    En D600 están los arrays que ocuparán hasta unm áximo de  `MAX_ENEMS*18`. Penar que `MAX_ENEMS` pudiera llegar a 8 (ja, ja, ja) aún nos dejaría sitio de sobra en D700 para el segundo LUT de rotaciones. En DE00 podría meter el tercer LUT.

    Los LUTs podría generarlos como códigos. Otra idea sería meterlos en el binario en $100, donde hay 768 ($300) bytes para el buffer de caracteres (nametable), pero cargar a $100 puede ser muy problemático... O no. Si los meto ahí, lo primero que haría el motor sería copiar cada rotacion (trozo de $100 bytes) a su sitio correcto en la VRAM libre ($E700, $D700 y $DE00)

    Para no liarla tanto, generar el LUT podría ser algo así. Por ejemplo, para la primera rotación:

    ```asm
            ld  hl, 0xE700

        .write_lut1_loop
            ld  a, l
            rrca
            ld  c, a 
            rrca
            rrca
            rrca
            rrca
            xor c 
            and $88
            xor c

            ld  (hl), a 
            inc l 
            jr  nz, write_lut1_loop
    ```

    El tema va a ser cómo usar el LUT, que me quedo sin registros punteros :D Por ejemplo, primer byte:

    ```asm
            ld  a, (bc)     ; Get sprite byte. This is the byte we must rotate

            ld  h, 0xE7     ; 1st rotation
            ld  l, a        ; Point to LUT
            ld  a, (hl)     ; Rotated!

            ...

            ld  h, 0xFE     ; Make mask LUT (already there)
            ld  l, a        ; etc
    ```
</details>