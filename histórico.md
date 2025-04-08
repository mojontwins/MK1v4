# v1.0 - Lala The Magical, Julieta Nosequé

* Vista lateral.
* Plataformas móviles.
* Enemigos lineales que colisionan con el escenario.
* 1 hotspot por pantalla con llave u objeto.
* Al coger llave u objeto, la próxima vez puede aparecer una vida.
* 3 tipos de tile: 
	* 0 traspasable
	* 1 traspasable y mata
	* 2 obstáculo
* Tileset de 16 tiles.
* Posibilidad de ganar el juego cogiendo X objetos o llegado a un punto concreto del mapa, o las dos.
* El jugador rebota al perder vida.

# v1.1 - Sir Ababol

* `USE_AUTO_SHADOWS` y `USE_AUTO_TILE_SHADOWS`.

# v1.2 - Viaje al centro de la napia

* Optimización en `USE_AUTO_TILE_SHADOWS`.
* Tiles que te matan desde arriba.
* `PLAYER_JUMP_UNLIMITED` no limita el número de frames que se detecta la pulsación para el salto (¿esto se ha usado alguna vez?)
* No todas las pantallas deben tener un hotspot.
* Selección de controles.

# v2.0 - Cheril of the Bosque

* Elección de tipo de motor: `PLAYER_HAS_JUMP`, `PLAYER_HAS_JETPAC`, `PLAYER_MOGGY_STYLE` (genital)
* Empujar cajas `PLAYER_PUSH_BOXES` - pensado para genital, pero funciona *igual* en horizontal.

# v2.1 - Moggy Adventure

* `PLAYER_AUTO_CHANGE_SCREEN` para cambiar de pantalla sólo usando la velocidad (originalmente había que estar pulsando una dirección en el borde).

# v3.0 - Cheril Perils

* Las cajas empujables ya no se pueden empujar verticalmente en juegos de vista lateral.
* `DIRECT_TO_PLAY` permite combinar pantalla de título y marco de juego.
* Permite desactivar el motor de llaves (`DEACTIVATE_KEYS`) o el de objetos (`DEACTIVATE_OBJECTS`).
* Permite decidir si se rebota al perder vida, y activar un breve parpadeo de inmunidad, por separado `PLAYER_BOUNCES` o `PLAYER_FLICKERS`.
* Posibilidad de matar pisando (`PLAYER_KILLS_ENEMIES`).
* **Scripting**: msc 1.0, se activa directamente con `PLAYER_KILLS_ENEMIES`. El script se ejecuta al entrar en una pantalla (`ENTERING SCREEN n`) o al matar a un enemigo (`PRESS_FIRE AT SCREEN n`).

# v3.1 - Zombie Calavera Prologue, Horace goes to the tower

* Motor de disparos, aunque sólo en vista lateral.
* Tilesets de 48 tiles con `UNPACKED_MAP`.
* Sprites sin máscaras con `NO_MASKS`.
* Animación alternativa para vista lateral (1, 2, 3 vs 1, 3, 1, 2). `PLAYER_ALTERNATE_ANIMATION`* Cambios en los comportamientos de los tiles:
	* 0 traspasable
	* 1 traspasable y mata
	* 2 traspasable y oculta
	* 4 plataforma
	* 8 obstáculo
* Aunque no se usa, ahora el scripting se activa con `ACTIVATE_SCRIPTING`. 
* Fantys `RANDOM_RESPAWN`: sustituyen a los enemigos muertos y te persiguen a menos que estés oculto (en un tile 2 y quieto).

# v3.1b - Petulant Poogslay Powerful Parade

* `INVERTED` invierte el eje vertical en vista lateral, sin continuidad.

# v3.2 - Trabajo Basura

* Sistema de "un solo objeto": el jugador sólo puede tomar un objeto. Está pensado para usar con el sistema de scripting. Desde el script el objeto se puede "liberar" (con `DEC OBJECTS 1`) para que podamos coger otro. Aquí el marcador de objetos no muestra `player.objs`, sino el contenido del flag que elijamos, y que deberemos ir incrementando desde el script.
* **Scripting**: msc 2.0, 
	* Se consolida el intérprete. Las secciones `PRESS_FIRE AT SCREEN n` se ejecutan al pulsar una tecla de acción. 
	* Si el script está activo, se puede forzar `GAME OVER` o `WIN_GAME` desde el script.
* Se reorganiza el código enviando las rutinas que tienen que ver con el backend a `printer.h` y el loop principal a `mainloop.h`.
* Esta es la base de MK1 v3.99, que fue la versión que terminamos distribuyendo y para la que se escribió el tutorial. La versión v3.99 además integraba el motor de scripting msc 3.0 de la v4.
