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

