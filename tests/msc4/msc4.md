MojonTwins Scripting Compiler 4
===============================

Si conoces MSC de anteriores versiones, esto funciona igual pero hay algunos cambios (mejoras) que verás más adelante. Si no, léete la introducción.

## Introducción

El sistema de scripting mojono que se engancha a las diferentes versiones de MK1 permite realizar comprobaciones y pequeñas modificaciones para hacer juegos más complejos. No es tan potente como el código custom, pero puede ser más que suficiente en muchos casos y es muy sencillo de comprender y mantener (además, es la única forma de modificar el comportamiento estándar en la v3.2).

Tu script estará dividido en diferentes secciones que se lanzarán cuando ocurran ciertos hitos especiales durante el transcurso del juego. Cada sección contiene una serie de cláusulas, que no son más que un conjunto de comprobaciones y una serie de acciones que se ejecutarán si se cumplieron, en orden, todas las condiciones. Cada sección ejecuta todas sus cláusulas en orden a menos que una de ellas ejecute un comando BREAK.

## Las secciones

Como hemos dicho, las diferentes secciones de tu script se lanzarán cuando ocurran determinados hitos durante el transcurso de tu juego. Las secciones empiezan con el título de la sección y terminan con END. Las secciones pueden o no existir, dependiendo de tus necesidades. Esta es una lista de las secciones y cuándo se ejecutan:

* `ENTERING GAME` se ejecuta una única vez antes de empezar cada partida.
* `ENTERING ANY` se ejecutará cada vez que entremos en una nueva pantalla (incluyendo la pantalla en la que aparecemos).
* `ENTERING SCREEN N` se ejecutará cada vez que entremos en la pantalla N, después de `ENTERING ANY`. 
* `PRESS FIRE AT ANY` se ejecutará cada vez que pulsemos la tecla de acción (que sería FIRE o DOWN dependiendo de la configuración / versión de MK1).
* `PRESS FIRE AT SCREEN N` se ejecutará cada vez que pulsemos la tecla de acción en la pantalla N, después de `PRESS FIRE AT ANY`.
* `PLAYER GETS COIN` se ejecutará cuando se coja una moneda (y esté activado) (en mk1v4).
* `PLAYER KILLS ENEMY` se ejecutará cada vez que se muera un enemigo.
* `SPECIAL TILE TOUCHED` se ejecutará cada vez que el jugador esté en un tile con comportamiento 128.

## Las cláusulas

### Las comprobaciones

### Las acciones

## Ejemplo

