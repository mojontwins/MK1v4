# Sgt. Helmet becomes a hero

Helmet tiene que rescatar rehenes en fases cortas. No puede disparar pero lleva un cuchillo con el que puede apuñalar. 

Este juego además implementará varias cosas custom:

1.- Un enemigo que vaya patrullando por la plataforma donde esté (al azar, sin caer ni salirse) y que si "te ve", te dispare "o" de la alarma.

2.- Poder empujar o tirar de los bloques empujables.

## Empujar o tirar

Voy a implementar lo de empujar o tirar.

El tema es que si pulsamos FIRE cuando estemos al lado de un bloque empujable y estemos debidamente orientados, se debería mostrar la animación de "tirar/empujar" y si pulsamos izquierda o derecha debería tirarse o empujarse.

* Si el bloque está a la derecha del jugador, el jugador debe estar mirando a la derecha y, en el caso de colisión 16x16, debe estar en `(gpx & 15) == 0`. En el caso de colisión 8x8, debe estar en `(gpx & 15) == 4`.

* Si el bloque está a la izquierda del jugador, el jugador debe estar mirando a la izquierda y, en el caso de colisión 16x16, debe estar en `(gpx & 15) == 0`. En el caso de colisión 8x8, debe estar `(gpx & 15) == 12`.

Veamos qué tal se da. Necesitaré un flag más en `player`.

Hecho

## El enemigo patrullero marrullero

Este enemigo va a hacer muchas cosas, pero como es mejor ir a pasitos, primero haré que se mueva y se pinte correctamente.  Este enemigo debe andar por encima de la plataforma al azar, con las cosas típicas: elige una dirección (izquierda, derecha, o pararse), se orienta, se mueve, y vuelve a elegir. Si se acaba la plataforma en la dirección que avanza, no puede avanzar. Todo lo más simple posible.

En este contesto creo que puedo usar `en_an_state` y `en_an_count`, o quizá `_en_mx` y `_en_an_count`. Probemos y vayamos redefiniendo. OK

### El enemigo te ve

Hemos dicho que el enemigo te ve en una franja desde `_en_y - 16` a `_en_y + 32`, desde 0 hasta `_en_x` si mira a la izquierda o desde `_en_x + 16` hasta 240 si mira a la derecha.

Empezamos detectando y poniendo algo en el borde para probar.

Voy a introducir un sprite extra con una admiración (!), aunque tendré que crear tres instancias, por lo que tendré que añadir 15 bloques. 225 bytes menos, de regalow.

¡o no! Porque me vale con uno. No debería poner centinelas de forma que te vean dos a la vez, o si pasa, tampoco pasa nada porque el sprite solo salga en el que te ha visto.

Lo haré así, más sencillo. Si veo que luego es un problema siempre estoy a tiempo de cambiarlo.

Todo va muy bien, pero me acerco a los 32K y a lo mejor es el momento de revisar las adiciones y pasar a ensamble algunas cosas.
