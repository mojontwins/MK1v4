[X] Ramiro hop mal con la nueva colisión estrecha.
[X] Better vertical connections colisiona mal con el primer tile (hay que replicar la linea 0 de attr para valores fuera de rango).
[ ] Controlar mejor como pita la evil 

Cosas que planeo

[X] Espada en 4 direcciones en vista genital para Mari Amelia. Será necesario un modo opcional para "extra frames" `GENITAL_HIT_FRAMES`, en cuyo caso habrá que definir 4 frames extra como extra_sprites 17, 18, 19 y 20

[X] Slippery en genital - Lo puedo detectar en dos puntos, `gpx + 4` y `gpx + 11`, `gpy + 15`.

[X] Ocultarse en genital (ya está)

Mari Amelia puede esconderse entre los arbustos para evitar a los espectros.

[X] Enemigos custom que van por los bordes del rectángulo entre (x1,y1)-(x2,y2).

Tenemos dos casos:

```
    (x1,y1) -> .          . <- (x2, y2)
     ^         v          v          ^
     . <- (x2, y2)       (x1, y1) -> .
```

* Desde (x1, y1) siempre se va a la derecha, y desde (x2, y2) siempre se va a la izquierda.
* En (x2, y1) se va en dirección a y2.
* En (x1, y2) se va en dirección a y1.

Pseudocódigo:

```
    INIT:
    x = x1; y = y1; mx = S; my = 0; 

    UPDATE
    x += mx; y += my;
    if (x == x1) {
        if (y == y1) mx = S; my = 0;
        else if (y == y2) mx = 0; my = add_sign (y2 - y1, S);
    }
    if (x == x2) {
        if (y = y1) mx = 0; my = add_sign (y1 - y2, S);
        else if (y == y1) mx = S; my = 0;
    }
```

[X] Enemigos custom que se mueven al azar como los patrulleros marrulleros pero en 4 direcciones (genital), o su variación en la que cambian de direción cuando chocan con un obstáculo

El problema de estos tipos de enemigos es que tengo que encontrar la forma de añadirlos de forma consecuente con el resto de las cosas que hay. Teniendo en cuenta que me limité a 16 por el tema de los enemigos muertos (lo cual no voy a ponerme a cambiar ahora), podemos hacer:

0 - NO
1 \
2 |
3 +-- Lineales
4 /
5 - Random respawn / usually a custom.
6 - Fantis
7 \
8 |
9 +-- Cuadradores `ENABLE_CUADRATORS`
10/
11\
12|
13+-- Patrulleros `ENABLE_MARRULLERS`
14/

[ ] Estado "enemigo parpadeando" (e inmune).

[ ] Para los que andan a su bola, retroceder N pixels en direccion contraria al golpe.

Para esto habría que ver cómo hacer la colisión con el escenario de forma que ahora los @#!! enemigos estos no ocupen la hostia.

Ahora mismo hay una cruda colisión que se activa cuando se define `PLAYER_PUSH_BOXES`. Podría:

a) Refinar esta colisión para que sea más pixel-perfect. Ahora mismo cuando el jugador se mueve dentro de un obstáculo *se deshace su movimiento* y se invierte la componente del eje que sea. Lo ideal sería que, más que deshacer el movimiento, se ajustase la posición del enemigo para sacarlo del tile pero dejarlo pegado a él. La inversión del signo en el eje correspondiente se haría según tipo (o en general).

b) El desplazamiento por golpe debería calcularse *antes* de esta colisión, para que sea tomado en cuenta.

c) El desplazamiento necesitará una dirección y un contador. Esto implica tres arrays. Tampoco es para morirse, pero hay que tener en cuenta todo lo que entra en juego. Por suerte hay sitio en donde creo los `en_an_*`.

Para hacer esto, lo suyo es empezar refinando la colisión para luego generalizar el tema.

Voy a cabalar un rato para intentar generalizar el código lo máximo posible y posteriormente pasarlo a ensamble. Ahora mismo (horizontalmente, por ejemplo) se mira el atributo en `en_xx + ctileoff (_en_mx)`, con `ctileoff (_en_mx)` devolviendo 1 si `_en_mx` es positivo, 0 en otro caso. 

* Si colisiona a la derecha (`ctileoff == 1`), debería ponerse `_en_x` a `_en_xx << 4`. 
* Si colisiona a la izquierda (`ctileoff == 0`), debería ponerse `_en_x` a `(_en_xx + 1) << 4`.

Por tanto, si hacemos `rdi = ctileoff (_en_mx)`, ajustaríamos `_en_x = (_en_xx + (rdi ^ 1)) << 4`. Con esto tendríamos la colisión generalizada. Probemos y ensamblemos si va. Por suerte el proyecto de ejemplo es genital. Introduciré `ENEMIES_COLLIDE` que se activará a la fuerza con `PLAYER_PUSH_BOXES`.

It WORKS! Put this into assembly:

```c
    en_xx = _en_x >> 4;
    en_yy = _en_y >> 4;
    
    if (_en_mx) {
        rdi = ctileoff (_en_mx);
        ptx1 = ptx2 = en_xx + rdi;
        pty1 = en_yy; 
        pty2 = (_en_y + 15) >> 4;
        if ((attr (ptx1, pty1) & 8) || (attr (ptx2, pty2) & 8)) {
            _en_mx = -_en_mx;
            _en_x = (en_xx + (rdi ^ 1)) << 4;
        }
    }
    if (_en_my) {
        rdi = ctileoff (_en_my);
        ptx1 = en_xx; 
        ptx2 = (_en_x + 15) >> 4;
        pty1 = pty2 = en_yy + rdi;
        if ((attr (ptx1, pty1) & 8) || (attr (ptx2, pty2) & 8)) {
            _en_my = -_en_my;
            _en_y = (en_yy + (rdi ^ 1)) << 4;
        }
                }
```

[X] Para poder desplazar a los lineales normales es importante modificar levemente cómo se detectan los límites de la trayectoria. Creo que es el momento en el que el exportador **asegure** que, valga lo que valga la x, y iniciales (inicializados en el x1,y1 original), se reordene posteriormente (x1,y1) y (x2,y2) para que x1 < x2 e y1 < y2.

[X] Hecho esto, el cálculo de los límites las trayectorias cambia levemente usando <=, >= y quizá sea el momento de pasarlo a ensamble.

Quizá la nueva versión debería ser

```c
    if (_en_x <= _en_x1) _en_mx = ABS (_en_mx);
    if (_en_x >= _en_x2) _en_mx = -ABS (_en_mx);
```

Esto es MUCHO más costoso :-/

Si hago un `_abs_a`  así:

```c
    ._abs_a
        bit 7, a
        ret z
        neg
        ret
```

Lo tendré más fácil:

```c
    #asm
            // _en_x <= _en_x1 -> _en_x1 >= _en_x
            ld  a, (__en_x)
            ld  c, a
            ld  a, (__en_x1)
            cp  c
            jr  c, horz_limit_skip_1

            ld  a, (__en_mx)
            call _abs_a
            ld  (__en_mx), a
        .horz_limit_skip_1

            // _en_x >= _en_x2
            ld  a, (__en_x2)
            ld  c, a
            ld  a, (__en_x)
            cp  c
            jr  c, horz_limit_skip_2

            ld  a, (__en_mx)
            call _abs_a
            neg
            ld  (__en_mx), a

        .horz_limit_skip_2
    #endasm
```

El problema es que con esto básicamente me he cargado el diseño de los cuadradores, porque (x1,y1) siempre quedará arriba a la izquierda y no sé cómo hacer para que el giro sea en el sentido contrario.

A lo mejor si me lo tomo de otra forma... Veamos, divaguemos...

* Desde x1 siempre se va a y1, desde x2 siempre se va a y2.
* Sólo se puede mover en un eje, de forma alternativa.

Lo primero se consigue con el cambio que hice para los lineales, tal cual. El problema es lo segundo. Si lo introduzco en plan *add-on* para que se ejecute tras el cambio de sentido, podría llevar una especie de flip-flop:

```c
    if (en_an_ff [enit]) _en_mx = 0; else _en_my = 0;
    en_an_ff [enit] ^= 1;
```

Así, sobre el papel, todo parece indicar que esto funcionaría y, sinceramente, sería la adición más sencilla de un tipo nuevo de enemigo de la historia (!). ¿Funcionará? ¡Próximo episodio en tu casa! (vamos, que voy a probarlo, parchenado rápidamente en el cheril original para que todos los enemigos sean así y probar).

Soy tontis. Esto no vale, por muchas razones XD. ´Lo primero, no puedo cargarme mx o my porque esto es persistente. Lo segundo, sólo debería cambiar el flip flop tras el cambio de dirección.

Pensando . . . 

Volvamos a pensarlo que por una de esas debería sacarlo:

- He separado el update de x, y para que se haga en x o en y dependiendo del flipflop
- He añadido una llamada a "flipa el flip flop" cada vez que se cambia una componente

No está del todo bien, porque hay veces que llega a los dos limites de trayectoria A LA VEZ y el flip flop se flipa dos veces. Tengo que levantar una bandera y flipar luego.

No me termina de funcionar. ¿Por qué tanta esperura? Quizá necesito parar un rato.

Ya sé por qué no me funciona: Cuando por ejemplo empieza desplazando en horizontal y llega al limite, cambia el flip flop, pero es que sigue en el limite, por lo que vuelve a cambiar el flip flop y bla bla bla.

Ahora lo que me falla es como resolver esto de forma sencilla, porque creo que la estoy liando. Voy a restaurar los lineales normales a como estaban y me guardo este snippet:

```c
    #ifdef ENABLE_CUADRATORS
        if (_en_t >= 7 && _en_t <=10) {
            #asm
            // Flipflop tells which axis to update
                ld  bc, (_enit)
                ld  b, 0
                ld  hl, _en_an_ff
                add hl, bc
                ld  a, (hl)
                or  a
                jr  z, _cuadrators_update_y

            ._cuadrators_update_x
            // _en_x += _en_mx;
                ld  a, (__en_mx)
                ld  c, a
                ld  a, (__en_x)
                add c 
                ld  (__en_x), a
                jr  _cuadrators_update_done

            ._cuadrators_update_y
            // _en_y += _en_my;
                ld  a, (__en_my)
                ld  c, a
                ld  a, (__en_y)
                add c 
                ld  (__en_y), a                         

            ._cuadrators_update_done
        #endasm
        }
    #endif
```

para luego. Creo que no voy a poder reaprovechar tantó código como yo quisiera.

Si el flip flop vale 1, estoy moviendo en X, con lo que comprobaría X. Si vale 0, estoy en Y, con lo que comprobaría Y. Esto implica meter más código que antes pero ç'est la vie.

OK, ya los tengo. Pero no se llevan nada bien con la colisión con el escenario XD Pero ahí quedan. Probablemente también se vayan a tomar por culo cuando meta lo de empujarlos con el arma.

Los cuadrators ocupan unos 206 bytes,

~~

Los patrulleros estos deberían avanzar sin problemas hasta que se topen con un obstáculo, en cuyo caso deberían elegir otra dirección. De entrada no deberían ser demasiado complejos: 

* reutilizaré todo lo que llevan los lineales, con el cambio de que cuando haya colisión deberán elegir mx, my al azar ¿Cómo defino la velocidad? Puedo hacer un hack. Como sólo va a avanzar en una de las cuatro direcciones, puedo prealmacenar en una variable al entrar en pantalla el valor de ABS(mx+my).

* Al entrar en la pantalla debería ajustar a tile x e y, para evitar mierdas.

Esto ha funcionado bien, pero tengo que ver que no salgan de la pantalla :D Quizá deba hacer una versión de attr que sea igual pero que si vas out of bounds devuelva 8.

Así parece que todo va bien, pero me hace un extraño y creo que las velocidades están malamente puestas. No, no es eso, creo que sé qué es. Necesito saltar.

WORKING!

[x] Hacer que la colisión por todos los lados con tiles que te matan sea por 4 puntos más "dentro" del player para que sea todo más manejable y menos peor.

[x] Mapped tilesets como en MK1_NES v0.1r, donde el tileset tipo "packed" se compone de 16 tiles del tileset global segun un array apuntado por `*tileset_mappings` (que el programador debe ocuparse de mantener en sus *customs*).

[X] Validar Zombie Calavera Prologue ¿y expandir con el full map de NES?

* [X] Reimplementar NO_MASKS -> parece que sigue estando ahí!

* [X] Reimplementar (o repensar) `PLAYER_ALT_ANIMATION` para hacer 1 2 3 1 2 3 ... ¿Meter hook?

* [X] Reimplementar `MAP_BOTTOM_KILLS` (o meter un custom).

[ ] Validar el Hobbit

[ ] Validar Trabajo Basura

[X] Simple animated tiles, se tiene una colección y se anima uno al azar. Sólo tengo que almacenar los XYs en un array que se vaya llenando a medida que los voy pintando. Como lo voy a enganchar con `draw_and_advance` no se podrá usar ni en `TWO_SETS` ni en `UNPACKED_MAP`.

Cambié
* `churromain.c`
* `engine.h`
* `mainloop.h`
* `definitions.h`
* `config.h`

[ ] ¿Es posible detectar el hitter antes que nada e invalidar la colisión normal?

