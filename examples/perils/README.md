# Cheril Perils MK1v4

Un port de Cheril Preils (MK1 v2) a **MTE MK1 v4** para validar algunas partes del motor. De camino, he implementado los resonadores usando hotspots customs y empleando las capacidades de la v4.

Los resonadores se implementan como hotspots de tipo 4 y 5, pintados con los tiles 20 y 21.

Para paralizar a los enemigos he activado `ENEMIES_MAY_BE_PARALIZED` y pongo su estado `en_an_state` a `ENEM_PARALYZED`, y `en_an_ct` a 255. Aparte, llevo una cuenta a 250, que son unos 10 segundos. Cuando la cuenta llega a 0, desparalizo a los enemigos.

Hay que paralizar de nuevo a la entrada si los resonadores están a "on". También hay que modificar los números de los hotspots. Como `hook_entering` se ejecuta al final de pintar la nueva pantalla, todo esto es factible.

Para que los enemigos sólo puedan matarse cuando el resonador está "on" utilizo este truco: he activado `PLAYER_MIN_KILLABLE` y lo he definido como una variable `player_min_killable`, que pongo a 1 si los resonadores están activados, o 4 si no.
