# Zombie Calavera Prologue

Este juego funciona con sprites sin máscaras en formato OR. Como se requiere PAPER 1 e INK 0, los tiles tienen que ser convertidos con el parámetro inverted:0. En `config.h` tenemos `#define NO_MASKS sp_OR_SPRITE`. Los sprites están importados con `..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 16 nomask`. 

Lo de morir cuando tocas el fondo del mapa no está en el motor así que lo hemos metido como un custom. Además, como hemos activado los hooks, tendremos que introducir la condición de ganar a mano:

```c
	void hook_mainloop (void) {
		if (gpy == 144 && n_pant >= (MAP_W*(MAP_H-1))) {
			player.life -= 10;
			player.is_dead = 1;
			player.vy = -PLAYER_MAX_VY_CAYENDO;
			play_sfx (2);
		}
	}
```

# Zombie Calavera (diario / postmortem)

Expandir ZCP a ZC siempre ha sido uno de mis sueños. Quizá pueda hacerlo ampliando el mapa y añadiendo varias fases que, en principio, podrían ser:

1. **Fase tutorial**. Lineal y fácil para aprender a saltar, disparar, y esconderse.
2. **Camino del purgatorio**, que se trate de recoger los 16 crucifijos para abrir la entrada del purgatorio.
3. **Los secuaces de Pellejo**, fase lineal que sea de avanzar y matar. Puedo crear un nuevo tipo de enemigo que salga del suelo, y camine hacia el jugador por la plataforma. Al llegar a borde de plataforma, se deja caer si el jugador está más abajo, o salta si el jugador está más arriba. Al morir vuelve a salir de su sitio original, sin producir por tanto murciélagos.
4. **Desafío final**.

Ahora mismo el mapa es de 5x5 pantallas. Si expando a 10 de ancho y 6 de alto (60 en total) puedo crear las siguientes secciones (marcadas con el número de fase): 

```
	1 1 1 1 1 0 0 0 0 0
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	2 2 2 2 2 2 2 2 2 2
```

Ahora mismo el juego completo básico ocupa 28089. Veamos a cuánto sube si paso de 25 a 60 pantallas para ver si esto es factible o no. Pasa a 34517 bytes, que quizá es demasiado. En principio cabría, y podría meter las cosas nuevas, pero prefiero ir más holgado. Esto pasa por integrar el modo RLE62 para ver si los 9000 bytes del mapa bajan algo (los enemigos, además, son 1800 bytes, pero eso es más complicado de comprimir).

El tema es que tampoco se puede saber, porque tengo casi todo el mapa vacío. Ahora mismo, en RLE62, el mapa pasa a unos 2300 bytes, pero no es un indicativo real. El mapa original tomaba 3750 bytes. Estos 2300 bytes deberían ser una estimación más o menos válida de lo que comprimen esos 3750. Es más o menos un 61%, por lo que estimamos que el mapa completo podría rondar los 5490 bytes (3.5Kb menos), por lo que el binario se quedaría por debajo de los 32K que me gusta mucho más a la hora de tener que meter mierdas.

Tiraremos por aquí y de paso meteremos RLE62 en el motor.



