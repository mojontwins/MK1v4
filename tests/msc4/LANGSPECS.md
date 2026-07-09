MOJON SCRIPT COMPILER 4
=======================

La idea es que el lenguaje sea parecido, igual de potente, pero mucho más simple. Gran parte de la complejidad del MSC original de 2011 tenía que ver con la múltiple combinatoria de valores contra flags en todas las operaciones. Cambiando cómo se leen los valores y permitiendo infinita indirección (cosas como `$$$$3`) simplificamos mucho el lenguaje. Además, modificando los opcodes podremos hacer mejores intérpretes en ensamble.

El encoding para los valores, que resolverá `read_vbyte`, usará $FF para significar "valor de ...", de forma que `$3` será "3" y `$FF $3` será `FLAG 3`, y `$FF $FF $3` será `FLAG [FLAG 3]` ...

De este modo, no necesito opcodes diferentes para todas las combinaciones de `IF a = b`, ya que a o b pueden ser valores directos o flags.

Sobre las acciones, todas las operaciones matemáticas se simplifican también. En `OP d, v`, `d` debe ser un flag o de lo contrario la compilación fallará. El intérprete debe poder resolver `d` (lvalue) y `v` (rvalue, usando `read_vbyte`). Como `OP d, v` significa `FLAG[d] = FLAG[d] OP v`, necesito una rutina en el intéprete que devuelva un pointer a `FLAG[d]` en HL y resuelva `v` en A.

Con esta codificación por ejemplo `ADD FLAGS x, y` y `SUB FLAGS x, y` serían aliases de `INC $X, $Y` y `DEC %X, %Y`.

Also, compiler verá igual `FLAG n` y `$n`. Las comas en el código será obviables.  `INC FLAG 3, 4` == `INC $3 4`.  

```asm
    ;; ******************
    ;; Auxiliary routines
    ;; ******************

    ;; Reads a byte from pointer, inc pointer, return value in A
    .read_byte
        ld  hl, (script)
        ld  a, (hl) 
        inc hl 
        ld  (script), hl
        ret 

    ;; Reads a value (may be recursive flag), inc pointer, return value in A
    ;; New flags encoding is $FF means next value is flag (can be $FF, etc)
    .read_vbyte
        call read_byte 
        cp  0xff 
        jr  z, read_vbyte_rec
        ret 

    .read_vbyte_rec
        call read_vbyte 
        ld  d, 0 
        ld  e, a 
        ld  hl, _flags 
        add hl, de 
        ld  a, (hl)
        ret 

    .read_x_y 
        call read_vbyte 
        ld  (sc_x), a 
        call read_vbyte
        ld  (sc_y), a 
        ret 

    ;; Read flag index and value, returns pointer in HL and value in A.
    .read_i_v
        call read_vbyte         ; Read flag index
        ld  c, a 
        ld  b, 0 
        call read_vbyte         ; Read value
        ld  hl, _flags
        add hl, bc              ; HL -> FLAGS[X]
        ret
```

Para que el compilador sea fácil de programar y modificar, me haré un `outputAssembly` que pueda recibir una cadena con las lineas partidas por `|`, por ejemplo, y que saque a la salida el código debidamente indentado.

Definimos estas variables especiales, codificadas internamente como "flags" fuera de rango. Por eso empiezo por $FE hacia abajo.

* $FE = NPANT = n_pant 
* $FD = PX = gpx
* $FC = PY = gpy
* $FB = KILLED = player.killed
* $FA = OBJS = player.objs
* $F9 = LIFE = player.life
* $F8 = TX = (gpx + 8) >> 4 
* $F7 = TY = (gpy + 8) >> 4
* $F6 = TN = qtile (gpx + 8, gpy + 8)
* $F5 = HOTSPOT = hotspot_t, last hotspot hit
* $F4 = MOVED_TO_TILE = moved_to_tile, el tile que desapareció al empujar el empujable sobre él.
* $F3 = MOVED_X = moved_last_x,
* $F2 = MOVED_Y = moved_last_y, coordenadas donde quedó el último tile empujado.
* $F1 = TIMER = timer
* $F0 = HIDE_HOTSPOTS = scenery_info.hide_hotspots
* $EF = DONT_MAKE_FANTIES = scenery_info.dont_make_fanties
* $EE = EN_T = `_en_t`
* $ED = EN_N = `_en_it`
* $EC = EN_X = `_en_x`
* $EB = EN_Y = `_en_y`
* $EA = OPANT = on_pant
* $E9 = PARAM = vale 0xff al entrar en la sección.

Sólo rvalue: Asignar a F2-F4, F6-F8 no tiene sentido. Se escriben en variables de msc antes de llamar por fire u otro especial. No tienen sentido en ENTERING. El resto debe poder ser lvalue (se debe poder asignar a NPANT, KILLED, etc).

El intérprete debe reconocer las y codificar el flag correcto. Luego el intérprete debería resolverlas al valor del motor.

## Escribiendo el compilador

Empezamos por el parser custom que rompe una linea de texto y devuelve los tokens debidamente codificados. Es en esta fase donde voy a resolver todo:

* Elimino las comas.
* Las indirecciones van en un solo token: `$4`, `$$2`, etc...
* Se traduce `FLAG n` a `$n`.
* Resolvemos los alias: `%CULO` -> `$5`.
* Resolvemos tokens: `NPANT`, `PLAYER_X`, `PLAYER_Y` ...
* No se permite cosas como `$NPANT`o `$%ALIAS`. Hay que usar `FLAG NPANT`o `FLAG %ALIAS`.

Para no reinventar ruedas voy a basarme en el módulo `mtparser` para esto.

Aún tengo que decidir cómo voy a organizar las diferentes secciones, aunque lo que sí debe ocurrir es que, como en el original, `PRESS_FIRE AT 4, 5, 6` genere punteros al mismo bytecode para esas tres pantallas.

## Comprobaciones

* Entre valores y flags, = < >= !=
* Sobre `PLAYER`
    - AT X, Y -> el centro de sprite está tile X, Y
    - TOUCHES X, Y -> Cualquier punto del jugador toca X, Y
    - IN_X X1, X2 -> player completamente dentro de X1, X2
    - IN_Y Y1, Y2 -> player completamente dentro de Y1, Y2
    - FALLING
    - NOT FALLING -> el jugador cae o no.
    - STILL -> vx y vy valen 0
    - HAS X [SELECTED] -> (futuro) tiene X en los items y está seleccionado
    - JUST_PUSHED -> (futuro), acaba de pulsar. Ver 3.99.X para implementar

## Comandos

* INC F, V: FLAG [F] += V
* DEC F, V: FLAG [F] -= V
* TILE X, Y = 

# Varios scripts por juego i.e. multinivel

Es necesario poder procesar varios scripts a la vez y generar un único intérprete. Cada script debería tener su índice para permitir que dada la dirección del script se pueda obtener acceso a todas sus secciones. El hecho de necesitar procesarlos todos juntos viene de que el intérprete deberá poder manejarlos todos, y éste se compone de forma dinámica.

Podría tener una lista de scripts en `in=` y que msc4 generase un `XXX.bin` por cada uno, pero que sólo generase un msci.asm global para todos.

El problema de esto es que yo me las veía muy feliz generando las diferentes secciones del script y usando etiquietas en el ensamble para encontrarlas, pero a ver cómo lo hago en un binario puro sin tener que recurrir a la baratada de pasar el número de pantallas total.

Había pensado en dos niveles de índice pero no es necesario si reordeno un poco cómo van los scripts.

Voy a reservar espacio para 8 scripts especiales por si esto tiene ampliación. Luego tendremos `8 + n_pant * 2` y `9 + n_pant * 2` para los `ENTERING` y `PRESS_FIRE` de cada pantalla. Sabiendo el numero más alto de n_pant que aparece en el script el compilador podrá calcular los offsets.

`main_scrpt_pointer` apuntará al binario que contendrá un índice:

```
    Sect Add. Offset to.
    0    0    ENTERING GAME
    1    2    ENTERING ANY
    2    4    PRESS FIRE AT ANY
    3    6    [ON] PLAYER GOT SOMETHING -> got coin / hit hotspot
    4    8    [ON] PLAYER KILLS ENEMY -> killed enemy (any means), EN_T and EN_N make sense
    5    10   [ON] SPECIAL TILE TOUCHED -> touched beh 128
    6    12   [ON] TIMER ZERO -> timer got to 0
    7    14   [ON] TILE PUSHED -> pushed a tile
    8    16   [ON] ENEMY TOUCHED -> collided with an enemy, EN_T and EN_N make sense
    9    18   [ON] TILE DESTROYED -> destroyed a tile
    10
    11
    12
    13
    14
    15
    16   32   ENTERING SCREEN 0
    17   34   PRESS FIRE AT SCREEN 0
    18   36   ...
```
El el compiler tendré un array de 256 cadenas con todas las secciones calculadas.

# El bytecode

Una clausula deberá ser

    COND1 COND2 COND3 FF ACT1 ACT2 ACT3 FF

El tema es ver como hacer "skip". El original precalculaba los tamaños. Así se podía saltar fácilmente a la siguiente cláusula.

```
    7 COND1 COND2 FF ACT1 ACT2 ACT3 FF 10 COND1 ETC...
      |                                |
      +-- Estamos aquí tras leer size. Añadimos esto a pointer
                                       |
                                       +---- y llegamos aquí
```

Así que primero tengo que hacer una cadena binaria codificando la cláusula, ver la longitud, y concatenarla al principio.

Si cuando vayamos a leer el tamaño de la cláusula leemos FF será que hemos terminado la sección.

## Conditions

* $01 A B : A = B
* $02 A B : A < B
* $03 A B : A >= B
* $04 A B : A <> B
* $05 N : IF NPANT = N, faster, special opcode (needs command line switch)

* $21 X1 X2: PLAYER IN_X (X1, X2)
* $22 Y1 Y2: PLAYER IN_Y (Y1, Y2) (!) Better use PX / PY or TX / TY.
* $23 X Y : PLAYER AT (X, Y)
* $24 : PLAYER FALLING
* $25 : PLAYER NOT_FALLING
* $26 : PLAYER STILL

* $30 X Y T : TILE AT (X, Y) = T
* $31 X Y T : BEH AT (X, Y) = T

* $F0 : TRUE

(!) 

## Actions 

* $00 A B : FLAGS[A] = B
* $01 A B : FLAGS[A] += B !
* $02 A B : FLAGS[A] -= B

* $20 X Y T : SET TILE (X, Y) = T
* $21 X Y B : SET BEH (X, Y) = B
* $22 XY T ... 0xFF: DECOS

* $30 F : GET ITEM SET $F (LVALUE!!)

* $50 PRINT TILE AT (X, Y) = T
* $51 SET FIRE ZONE [TILES] X1, Y1, X2, Y2  [TODO]

* $6D N X Y : WARP TO N, X, Y

* $E0 N : SOUND N
* $E1 : SHOW
* $E2 : RECHARGE
* $E3 : TEXT "HOLI"
* $E4 N M : EXTERN N M
* $E5 N : PAUSE N
* $E6 LSB MSB : TEXT BOX "ASDJADFJSODHAFDJHA"

* $F0 : WIN GAME
* $F1 : GAME OVER

* $F2 : BREAK
* $F3 : RERUN RVALUE

# Haciendo esto

Primero voy a crear la parte de intérprete que compile una sección hasta `END`, con todas las cláusulas que se encuentre, y genere una cadena con la sección completa.

## El número de pantallas

Pensaba que era posible obviar que el compilador supiera el número máximo de pantallas pero no es posible. Hace falta para el índice. Se especificará como parámetro de msc4 pero además podrá modificarse desde el propios cript con ROOMS = N como directiva especial.

## Simple get item aid!

Para simplificar la tramolla de coger items y usarlos en sitios con un sólo slot de inventario (perils), se me ocurre que:
GET
* En el engine haya un `ITEN_X, ITEM_Y, ITEM_FLAG` que puestre el tile en `flags[ITEM_FLAG]` en `(ITEM_X, ITEM_Y)`. `ITEM_FLAG` se pondrá al valor de `I` del paso anterior.

* En el `ENTERING` del script, ponemos un tile `T` con beh 128 en `X, Y` si `$F = 0`.

* En el engine se detectará la colisión con beh 128 y se lanzará el script con `TN = T`, y las `TX` / `TY` que registraron la colisión.

* En el `SCRIPT` ejecutamos `GET ITEM SET $F`. Esto comprobará que en `$I` no hay un item (vale 0), y en ese caso establecerá `$I = TN`, pondrá el tile 0 en `TX, TY` y pondrá `$F` a 1.

Necesito implementar:

- En msc4: parser para `ITEM SLOT` y `GET ITEM SET $F` con opcode 30.
- En msc4i.asm: Código de intérprete para el opcode 52.
- En engine: código para mostrar en hud.

El item vacío:

Lo suyo es decirle al scripting cuál es el item vacío. Por defecto será el cero, pero podremos especificar otro. Será un valor ESTÁTICO que se quemará en el intérprete, al igual que `ITEM SLOT`.

- `ITEM EMPTY = 47`, 

en el intérprete para el opcode 30 se usará este valor para comprobar si el inventario está vacío. En el compilador, la palabra `EMPTY` se cambiará por el número que representa, para que podamos hacer `%CARRYING = EMPTY`.

OJAL - El tile se borra de la PANTALLA poniendo un 0 siempre, esto no se puede cambiar.

## ON TILE PUSHED

Por defecto, empujar un tile ejecutará ON TILE PUSHED, pero puede cambiarse a que se ejecuten las secciones FIRE correspondientes con `#define TILE_PUSHED_PRESSES_FIRE`. En este caso `IF PUSHED` evaluará a true. 

# ON TILE DESTROYED

Cuando se dispare y se rompa un tile (esto en 3.2 no funciona, sería más para 4/5).

# Sistema para textos

El sistema soportará llamadas a cuadros de texto en el propio script usando el comando

```spt
    TEXT BOX "ESTO SALDRA EN UNA CAJA DE TEXTO!"
```

Los textos serán codificados en un sistema de 5 bits por carácter con escapes para representar 63 caracteres más una marca de final de cadena. En el bytecode sólo se insertará el opcode seguido por el offset de 16 bits del texto en cuestión. El sistéma soportará repetir textos que se almacenarán solo una vez.

Debido a que en el bytecode se inserta directamente el offset del texto actual, la codificación se hace al vuelo. El binario final de los textos se exporta aparte en `texts.bin`. Los textos se referencian por offset por lo que no hace falta un índice.

A la hora de interpretar, el archivo de integración `msci.h` contendrá una función `msc_decode_text` que tomará el offset, decodificará el texto correcto en un buffer situado a partir de lo que diga la constante `MSC_TEXT_BUFFER` y llamará a la función `text_box` de `extern.h`, que el programador deberá escribir teniendo en cuenta que en `MSC_TEXT_BUFFER` ya estará el texto listo para mostrar en ASCII.

El encoder hará word-wrap automáticamente cada 24 caracteres, pero el ancho de la linea se puede configurar con la directiva `TEXT WIDTH = N` al principio del script.

# Indirección

&%ALIAS producirá el número real del flag.

# Mejora para el índice.

En juegos de muchas pantallas pero pocas pantallas con script hay unos índices enormes y eso me parece un despilfarro. Quizá se pueda pensar en otro tipo de saltar al script correcto en estas situaciones. Opcional. Voy a pensarlo.

Idea: Brute force jump table:

run_fire_script N->if N = 3 jump to XXX, if N = 10 jump to YYY, ... etc.

```asm
        ld  a, (_n_pant)

        cp  X
        jr  nz, _nxt1
        ld  hl, XXXX
        jp  end

    ._nxt1
        cp Y
        jr  nz, _nxt2
        ld  hl, YYYY
        jp end

        ...
```

Esto es efectivamente más lento y tarda más a medida que sube n_pant, pero puede ser deseable en algunos casos, así que voy a añadirlo.

Rather:

```asm
        call get_script_address
        // Script address in HL!
        cp  0xff
        jp  next
        
        // run HL
        jp  next

    .get_script_address
        ld  a, (_n_pant)

        ld  hl, XXXX
        cp  X
        ret z

        ld  hl, YYYY
        cp  Y
        ret z

        ld  hl, ZZZZ
        cp  Z
        ret z
        
        ...

        ld  a, 0xff
        ret
```

Y en concreto, algo asín... Porque está bien que los scripts por defecto sean más directos (código real de intérprete) ¡La idea es que no haya que tocar para nada el motor! Todo debe resolverse aquí:

```asm
    .script_jump_table
        ld  a, (_script_n)

        ld  hl, XXXX
        cp  X 
        ret z 

        ...

        ld  a, 0xff
        ret


    ; Existing entry point (indexed mode) still acts as
    ; the entry point for general scripts.
    ._script_do
        ld  a, (_script_n)
        cp  ENTERING_INDEX_OFFSET ; Fill with the right value!
        jr  nc, get_from_jump_table

    .get_from_index
        ; Point to offset in script index
        ld  hl, (_script_n)
        add hl, hl
        ld  bc, script_bytecode
        add hl, bc

        ; Read offset
        ld  a, (hl)
        inc hl 
        ld  h, (hl)
        ld  l, a 

        ;  If zero do abort
        or  h 
        ret z

        jr make_pointer

    .get_from_jump_table
        call script_jump_table

        ; If no script, A = 0xff
        cp 0xff
        ret z 

    .make_pointer
        ; Make & store pointer

        ld  bc, script_bytecode
        add hl, bc
        ld  (script), hl

    .script_loop
        ...
```

# Reentrando

A veces puede ser interesante volver a ejecutar toda la sección. Además, vamos a introducir un parámetro.

* Cuando se entra en la sección, PARAM vale $FF.
* Se ejecuta RERUN lv -> PARAM vale lv y se vuelve a ejecutar la sección.

# Diálogos

Para integrar diálogos se haría como con los textos, que habría que depender de una implementación externa. En principio tendríamos este comando:

```
    $F = DIAG "OP1" "OP2" "OP3"
```

Las opciones se codificarán como los textos. Esto llamará a una función de extern que presentará las opciones y devolverá 1, 2 o 3 con la selección del jugador. Ese valor se asignará a $F.

Luego puede utilizarse RERUN $F para volver a ejecutar la sección con el valor del diálogo.

Para ver si esto me sirve voy a simular una situación real.  Hablamos con un personaje haciendo FIRE en una posición y se nos presentan tres opciones. Las dos primeras deberán sacar un texto específico, la segunda además poner un flag, y la tarcera sacar un segundo diálogo, esta vez de dos opciones embéz de tres, que deberá sacar dos textos diferentes.

Voy a tratar de programar eso a ver qué más puedo necesitar o si me vale. Hay que tener en cuenta que todo esto se basa en `RERUN` y en la variable PARAM.

```
    PRESS FIRE AT 10

        IF $C = 0           # Conversación 0
        IF PARAM = 1        # "CHARLAR"
        THEN
            TEXT BOX "HACE UN DIA ESTUPENDO HOY EH? VAYA, NO RESPONDE."
            BREAK
        END

        IF $C = 0
        IF PARAM = 2        # "AGASAJAR"
        THEN 
            TEXT BOX "Y LO GUAPO QUE VA USTED HOY? NO DISIMULE, LE VEO SONREIR"
            $FELIZ = 1
            BREAK
        END

        IF $C = 0
        IF PARAM = 3        # PREGUNTAR
        THEN
            TEXT BOX "AHORA QUE TENGO SU ATENCION..."
            $C = 1
            $F = DIALOG "REVOLUCION" "LA REINA"
            RERUN $F
        END 

        IF $C = 1
        IF PARAM = 1
        THEN 
            TEXT BOX "VEO QUE NO LE GUSTA HABLAR DE LA ACTUALIDAD"
            BREAK
        END

        IF $C = 1
        IF PARAM = 2
        THEN 
            TEXT BOX "SE LE ILUMINA LA CARA CUANDO HABLA DE LA REINA"
            BREAK
        END

        # Hablar con el personaje
        # Lo ponemos al final porque vamos a repetir varias veces
        IF PLAYER_TOUCHES (5, 6)
        THEN 
            # Esta flag lleva el proceso de la conversación
            $C = 0 
            $F = DIALOG "CHARLAR" "AGASAJAR" "PREGUNTAR"
            RERUN $F
        END
    END
```

Puede valer ¿no? También se puede usar un flag diferente para almacenar la respuesta de DIALOG y el valor de RERUN para llevar palante una máquina de estados. Lo que mejor venga.

Opcion no existente = FFFF, otro valor apunta al texto.

Si en el motor hacemos `ENABLE_OPTIONS` se activará también `ENABLE_ENCODED_TEXT` ya que habrá que decodificar las opciones. El script manejará tres punteros que se pondrán en $FFFF si no hay opción. El decodificador en el motor manejará tres buffers de 32 caracteres donde decodificará las opciones si valen != $FFFF.

El intérprete podría ser algo parecido a 

```asm
        cp  0x70
        jr  nz, aopcode_70_end
    .aopcode_70
        ; ADDR1
        call read_addr
        ld  (_addr1), hl
        call read_addr
        ld  (_addr2), hl
        call read_addr
        ld  (_addr3), hl
        jp  script_actions  
    .aopcode_70_end
```

# TODO!

* [ ] Encontrar la forma de saber la vida total del jugador desde el intérprete! Ahora hay un defc con una constante placeholder.
* [ ] 256 bytes quizá es poco para las clausulas...
* [X] BREAK:END debería poder codificarse solo como BREAK. De hecho BREAK debería terminar la cláusula igual que un END sin tener que añadir el byte. Lo mismo con WIN GAME o GAME OVER. Los tres hacen RET.
* [-] Optimizar WARP TO y todas las que tomen valores de tile pero tengan que producir valores de pixel para precalcular y no tener que hacerlo en el intérprete (siempre que no se refieran a flags).
