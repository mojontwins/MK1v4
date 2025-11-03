# Ababol

El remake tiene estas mejoras / cambios:

1.- Cada cripta tenga su llave separada, tendré que hacer una llave y un cerrojo diferente para cada una. Serán monedas I II III IV y algún tipo de hueco con los mismos simbolos.
2.- El río subterráneo es otra vía de avanzar en el mapa, no debería colarse en ninguna cripta, aunque quizá sí en una cueva con un ababol que no se pueda acceder de otra forma.

Hay una llave normal para entrar en la primera parte, esa la dejamos.

Esta es una lista de las criptas y la pantalla en la que está el cerrojo:

- P22 @ (13, 8)
- P31 @ (11, 1)
- P15 @ (7, 8)
- P19 @ (3, 7)

Esta es una lista de donde voy a poner las llaves:



El sistema de inventario será el de Cheril Perils (el Inventario Cutre MSC4 (TM)).

Todos los cambios entre n_pant < 40 y n_pant >= 40 deben interceptarse para cambiar el tipo de motor y el sprite. O mirar cuál sería la mejor forma de hacerlo. A fin de cuentas hay que hacer una comprobación, bastaría con poner un if (n_pant < 40) para el eje vertical normal `else` el otro, y lo mismo para el frame. 

Lo que sí habrá que hacer es dar un boost al pasar desde n_pant >= 40 a la fila superior para poder escapar del agua.

Necesitaremos además más tipos de enemigos lineales, para meter los subacuáticos. Deberían poder extenderse para t=8, 9, 10 por ejemplo y así, si queremos, podemos meter un fanty en una pantalla especial a modo de "boss".

La luna la voy a quitar del set y se pondrá por script o por entering especial.

