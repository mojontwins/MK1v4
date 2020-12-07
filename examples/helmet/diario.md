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

## La lógica del juego

Para que te pillen y se reinicie la fase tengo que pensar ya en cómo voy a implementar el tema de las subfases. Necesitaría arrays para pantalla y posición iniciales. Voy a empezar por ahí, y así puedo hacer el reset y la pantalla de bienvenida.

Parte de la magia viene de esto:

```c
	#define PLAYER_INI_X			(ini_x [level])		//
	#define PLAYER_INI_Y			(ini_y [level])		// 
```

Así el `init_player_values` que llamo desde mi custom tras mostrar la pantalla de `LEVEL XX` me para recolocar al jugador.

### Rescatando

Al principio de cada nivel el número de objetos del jugador se pone a 0. Si el número de objetos (que son los rehenes) vale `hostages [level]`, entonces se activa un estado de alarma en la que los enemigos patrulleros te ven muy deprisa (5 frames?).

Siempre que te maten, esté como esté la cosa, volverás al punto de inicio, se descontarán los rehenes, y todos los hotspots de tipo 1 se reactivarán. (todos, total, qué más dan las fases anteriores).

## Reiniciar

Cuando el malo te vea un rato se coscará del todo y dará la alarma. hay que presentar un texto, hacer un sonido feo, y reiniciar.

## Importante mejora

Creo que los puzzles de cajas serán mucho más interesantes si se puede empujar o tirar de pilas de cajas. Para eso tendré que crear una sencilla función recursiva en ensamble para propagar el movimiento.

Cuando se arrastra una caja se llama a `move_tile`, pero no recibe parámetros, por lo que no puedo usar esta misma para el tema de la recursión.

Lo que sí puedo hacer es que `move_tile` no haga nada más que llamar a la recursiva si se activa la característica de empujar y que sea esta la que se encargue de todo. Vamos a pensarlo bien:

1.- El jugador hace la acción y se ejecuta el código que comprueba si tirar o empujar y si se puede. Esto llama a `move_tile (1)`

2.- `move_tile` comprueba `act` y hace ruido. Luego llama a `_move_tile (x0, y0, x1)`.

3.- `_move_tile` mueve el tile de `(_x0, _y0)` a `(_x1, _y0)`. Si hay un tile en `(_x0, _y0 - 1)` mira si puede moverlo a `(_x1, _y0 - 1)` y, si es el caso, llama a `_move_tile (x0, y0 - 1, x1)`.

Todo esto se puede pasar a iterativo muy fácilmente teniendo en cuenta que en este modo (`PUSH_AND_PULL`) estamos en vista lateral y el jugador estará alineado verticalmente, y que x0, y0, x1 e y1 no se utilizan más tras la llamada a `move_tile`, por lo que los valores se pueden ir pisando:

```
	(pseudocódigo)
	if (act) ruido ();

	while (1) {
		borra (x0, y0);
		pinta (x1, y0);

		y0 --;
		if (can_move_box () == 0) break;
	}
```

Que es tan jodidamente simple que como funcione lo flipo (y una vez más seré king simple algo).

Pero oh, fuck. Aquí viene el problema: esto funciona perfe para propagar el movimiento, pero no me sirve porque si alguna caja no se puede mover, sencillamente se quedará flotando en el aire.

Así que tengo que replantearlo para primero comprobar toda la pila y luego usar esto.

Lo macero.
