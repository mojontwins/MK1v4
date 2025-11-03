# Ababol

El remake tiene estas mejoras / cambios:

1.- Cada cripta tenga su llave separada, tendré que hacer una llave y un cerrojo diferente para cada una. Serán monedas I II III IV y algún tipo de hueco con los mismos simbolos.
2.- El río subterráneo es otra vía de avanzar en el mapa, no debería colarse en ninguna cripta, aunque quizá sí en una cueva con un ababol que no se pueda acceder de otra forma.

Hay una llave normal para entrar en la primera parte, esa la dejamos.

Esta es una lista de las criptas y la pantalla en la que está el cerrojo:

- "I" P22 @ (13, 8)
- "II" P31 @ (11, 1)
- "III" P15 @ (7, 8)
- "IV" P19 @ (3, 7)

Esta es una lista de donde voy a poner las llaves:

- "I"
- "II"
- "III"
- "IV"

El sistema de inventario será el de Cheril Perils (el Inventario Cutre MSC4 (TM)).

Todos los cambios entre `n_pant < 40` y `n_pant >= 40` deben interceptarse para cambiar el tipo de motor y el sprite. O mirar cuál sería la mejor forma de hacerlo. A fin de cuentas hay que hacer una comprobación, bastaría con poner un if (n_pant < 40) para el eje vertical normal `else` el otro, y lo mismo para el frame. 

Lo que sí habrá que hacer es dar un boost al pasar desde n_pant >= 40 a la fila superior para poder escapar del agua.

Necesitaremos además más tipos de enemigos lineales, para meter los subacuáticos. Deberían poder extenderse para t=8, 9, 10 por ejemplo y así, si queremos, podemos meter un fanty en una pantalla especial a modo de "boss".

La luna la voy a quitar del set y se pondrá por script o por entering especial.

## Cosas: el spriteset

Me acabo de dar cuenta de una cosa que está mal y que habría que rehacer, no sólo para que deje de estar mal, sino para hacer que el sistema sea más flexible. Ahora mismo tenemos dos arrays de cells, uno para player y otro para enems. Creo que lo suyo sería tener un único array global y mapear ahí según haga falta.

### POR DEFECTO

Por defecto tendríamos un array de 16 words apuntando a 16 cells. Las del player serían las 8 primeras y las de los enemigos serían las 8 siguientes. Definimos ENEMS_CELL_OFFSET y por defecto le damos 8 si no está definido en config.h

`en_an_base_frame` es ahora un índice a este array de cells. El valor del índice será por defecto `ENEMS_CELL_OFFSET + en_t * 2`. De este modo los cáculos que se hacen para obtener offset y punteros a funciones de actualizaión en CPC estarán bien y no como ahora que esto funciona porque todos los sprites tienen el mimso tamaño, porque está mal.

Tengo que arreglar esto en `src_old` y luego propagar.

## Cosas: el cambio de motor

Así lo vamos a hacer:

* Activamos `PLAYER_CUSTOM_VENG` - Con esto hacemos que se llame a `player_custom_veng` en `custom.h` para todo el eje vertical, incluyendo gravedad y saltos, pero no colisión. 
* Poner una guarda que seleccione el tipo de eje en `player_custom_veng` (`if (n_pant < 40)`) y replicar el código vanilla (gravedad y salto). En el `else`tendré que implementar el código de nadal. Pasar a ensamble lo que había en Sir Ababol DX.
* Norvidarse de modificar el cell, habrá que activar `PLAYER_CUSTOM_FRAME` e implementar la lógica en `player_custom_frame` de `custom.h`