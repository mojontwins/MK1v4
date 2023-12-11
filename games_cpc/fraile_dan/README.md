Fraile Dan
==========

Apuntasión de cosas de implementación

## Las hostias

Las hostias son espadazos con espada redonda fabricada en Obleas Jiménez. Hay dos cosas a tener en cuenta: `SWORD_DEPLETES` para que sólo se pueda hostiar cuando `player.sword_g` no sea 0, `SWORD_CUSTOM_HIT` para ejecutar código custom al hostiar y `SWORD_DISABLE_HIT` para desactivar el comportamiento normal de las espadas, ya que no es una espada sino una hostia.

## Los enemigos

### El hostiable

El único enemigo hostiable es el linear 1, el peregrino. En `sword_custom_hit` hay que comprobar que el hostiado es un peregrino y entonces:

- Con la hostia, el peregrino llega al éxtasis y se le levanta el bit 3.
- Se resta una hostia del inventario `player.sword_g`.

Definimos pues un enemigo custom "9" que sea el peregrino rezando (frames 16 y 17 del set). Hay que acordarse de bajar el bit 3 a todos los enemigos 1 al empezar cada partida.

Para convertir el enemigo 1 en 17 al hostiar:

- Al entrar en `sword_custom_hit.h`, `_en_t` lleva el tipo de enemigo. Si `_en_t` vale 1, subir el bit 3. Esto se hará persistente al terminar.
- Necesitamos recalcular los frames de animación. Para ello bastará con llamar a `enems_en_an_calc (4);` para que asigne los frames.
- Además hay que decrementar `player.sword_g`.

### El mamahostias

El linear 3 es un mamahostias. Cuando te toque no te va a matar pero te va a quitar todas las hostias. El bit 4 no se le levanta.

Esto lo haremos en la función `enems_custom_collision` de `custom.h` tras activar `ENEMS_CUSTOM_COLLISION` en `config.h`.

### El monaguillo robot

Es malo, protege las hostias de la sacristía. Es un fanty.

