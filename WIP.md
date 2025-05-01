# WIP

Cosas que me apunto de un día para otro para ir resolviendo cuando se vaya pudiendo.

[ ] Limpiar de CPCRSLIB todo lo que no se use en mojonia.
[ ] Resolver cómo hacer saber al script cuántos empujables hay en la pantalla de la mejor forma: la que menos impacto tenga en el motor principal. Recordemos que el goal de la v3.2 por ejemplo es ser lo más bare bones posible ¿Hago un array que cuente las ocurrencias de cada tile? ¿Cómo la hago accesible desde el script? `read_vbyte` está ya muy poblado, recordemos que sólo tengo sitio para 14 variables de motor y no quedan muchas libres a menos que haga otra codificación que tengo que estudiar ($FF XX = flag, $FE XX = variable de motor, por ejemplo ~ igualmente ahora son $FF XX con XX = $F1 .. $FE ¿no? complico levemente el intérprete pero el bytecode sigue ocupando lo mismo)
[ ] Implementar el timer ¿en el motor o en msci? Si se hace en msci necesitaremos un hook en el mainloop. Recordemos que el timer no llegó a MK1 hasta 3.99.2 ~ y era mucho más complejo. Pero ahora incrementaré cada 25 frames de juego y tendré ~ 1 segundo por paso, y sólo tendrá sentido usarlo desde el script. El original se podía usar sin script pero tampoco era muy util y jamás se usó. Aún me estoy planteando si meter las recargas de tiempo como hotspots o dejar al programador que lo implemente todo en el script. En cualquier caso, el valor del TIMER debe estar disponible para lectura y escritura.
[ ] Sección ON TILE PUSHED y hacer que MOVED_TO_TILE, MOVED_X y MOVED_Y lleven los valores correctos. (tile que se "pisa" y sus coordenadas).
