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

## Multifase

Ahora mismo el mapa es de 5x5 pantallas. Si expando a 10 de ancho y 6 de alto (60 en total) puedo crear las siguientes secciones (marcadas con el número de fase): 

```
	1 1 1 1 1 0 0 0 0 0
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	1 1 1 1 1 3 3 3 3 3
	2 2 2 2 2 2 2 2 2 2
```

El mapa irá comprimido en RLE62, que ha sido adaptado a MK1v4 específicamente para este juego, empleando los compresores hipervitaminados que modifiqué para MK1v5.

## Cambios en el tileset

Me encantaría poder cambiar el tileset - obviamente no completamente, sino al menos los colores. Para ello tendría que sobrescribir el array de 256 atributos que está situado en `_tileset + 2048`. Esa es la parte fácil. La no tan fácil será la de generar los arrays comprimidos con los sets de atributos. Toca modificar `ts2bin` para que, via un switch `onlyattrs`, sólo saque los atributos.

## El nuevo tipo de enemigos

Como hemos dicho, habrá un nuevo tipo de enemigo más complejo que de costumbre. En el eje vertical necesitaré usar punto fijo, que es lo más sencillo y lo que menos ocupará. 

El enemigo "zombie" tendrá los siguientes estados:

* `Z_APPEARING`, cuando emerge de la tierra. Aparecerá en la posición donde se le colocó (x1, y1) y subirá un pixel cada frame (o cada dos, si veo que es demasiado rápido). Seguirá en este estado hasta que el beh del tile que toque (x+8, y+15) sea <8. En ese momento pasará al siguiente:

* `Z_PURSUING`, se desplaza un pixel en dirección al jugador. 

	* Si el pixel en (x+4, y+16) o (x+11, y+16) (dependiendo de adonde esté caminando) es <4 y el jugador está más alto, o si se encuentra un obstáculo, pasará a `Z_JUMPING`. 

	* Si los dos pixels en (x+4, y+16) y (x+11, y+16) son <4, pasará a `Z_FALLING`.

* `Z_FALLING`, caerá con los mismos valores que el jugador (gravedad y velocidad máxima) hasta que deje de cumplirse que los dos pixels en (x+4, y+16) y (x+11, y+16) sean <4.

* `Z_JUMPING`, se entrará con vy negativa fija, y se aplicará una gravedad reducida durante 8 frames. Luego se aplicará la gravedad normal. Horizontalmente se moverá como en `Z_PURSUING`. Cuando el valor de y sea el mismo que cuando empezó el salto, pasará a `Z_FALLING`.

Al final lo programé de tal forma que pasarlo a ensamble ha sido coser y cantar. Podrá optimizarse más seguro, pero sigo por debajo de 30K y eso me place.
