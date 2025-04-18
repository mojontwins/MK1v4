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

Como los valores que se manejan en un juego puede ser como máximo 240 (posición X mayor) y $FF marca indirección, tenemos aún 13 variables especiales:

$FE = NPANT = n_pant
$FD = PLAYER_X = gpx
$FC = PLAYER_Y = gpy
$FB = ENEMS_KILLED = player.killed
$FA = OBJS = player.objs
$F9 = LIFE = player.life

CUIDAO - Esto debe poder funcionar como LVALUE así que ¿deben ser $FF $F0, etc ?

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
    Add. Offset to.
    0    ENTERING GAME
    2    ENTERING ANY
    4    PRESS FIRE AT ANY
    6    PLAYER GETS_COIN
    8    PLAYER KILLS_ENEMY
    10
    12
    14
    16   ENTERING SCREEN 0
    18   PRESS FIRE AT SCREEN 0
    20   ...
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

* $20 X Y : PLAYER TOUCHES (X, Y)
* $21 X1 X2: PLAYER IN_X (X1, X2)
* $22 Y1 Y2: PLAYER IN_Y (Y1, Y2)
* $23 X Y : PLAYER AT (X, Y)
* $24 : PLAYER FALLING
* $25 : PLAYER NOT_FALLING
* $26 : PLAYER STILL

* $30 X Y T : TILE AT (X, Y) = T
* $31 X Y T : BEH AT (X, Y) = T

* $F0 : TRUE

## Actions 

* $00 A B : FLAGS[A] = B
* $10 A B : FLAGS[A] += B !
* $11 A B : FLAGS[A] -= B

* $20 X Y T : SET TILE (X, Y) = T
* $21 X Y B : SET BEH (X, Y) = B

* $E0 N : SOUND N
* $E1 : SHOW
* $E2 : RECHARGE
* $E4 N M : EXTERN N M
* $E5 N : PAUSE N

* $F0 : WIN GAME
* $F1 : GAME OVER

# Haciendo esto

Primero voy a crear la parte de intérprete que compile una sección hasta `END`, con todas las cláusulas que se encuentre, y genere una cadena con la sección completa.

