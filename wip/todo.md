[X] Ramiro hop mal con la nueva colisión estrecha.
[X] Better vertical connections colisiona mal con el primer tile (hay que replicar la linea 0 de attr para valores fuera de rango).
[ ] Controlar mejor como pita la evil 

Cosas que planeo

[ ] Espada en 4 direcciones en vista genital para Mari Amelia. Será necesario un modo opcional para "extra frames" `GENITAL_HIT_FRAMES`, en cuyo caso habrá que definir 4 frames extra como extra_sprites 17, 18, 19 y 20

[ ] Slippery en genital
[ ] Ocultarse en genital (ya está)

Mari Amelia puede esconderse entre los arbustos para evitar a los espectros.

[ ] Enemigos custom que van por los bordes del rectángulo entre (x1,y1)-(x2,y2).

Tenemos dos casos:

```
	(x1,y1) -> .          . <- (x2, y2)
	 ^         v          v          ^
	 . <- (x2, y2)       (x1, y1) -> .
```

* Desde (x1, y1) siempre se va a la derecha, y desde (x2, y2) siempre se va a la izquierda.
* En (x2, y1) se va en dirección a y2.
* En (x1, y2) se va en dirección a y1.

Pseudocódigo:

```
	INIT:
	x = x1; y = y1; mx = S; my = 0;	

	UPDATE
	x += mx; y += my;
	if (x == x1) {
		if (y == y1) mx = S; my = 0;
		else if (y == y2) mx = 0; my = add_sign (y2 - y1, S);
	}
	if (x == x2) {
		if (y = y1) mx = 0; my = add_sign (y1 - y2, S);
		else if (y == y1) mx = S; my = 0;
	}
```

[ ] Enemigos custom que se mueven al azar como los patrulleros marrulleros pero en 4 direcciones (genital), o su variación en la que cambian de direción cuando chocan con un obstáculo

[ ] Estado "enemigo parpadenado" (e inmune).

[ ] Para los que andan a su bola, retroceder N pixels en direccion contraria al golpe.

[x] Hacer que la colisión por todos los lados con tiles que te matan sea por 4 puntos más "dentro" del player para que sea todo más manejable y menos peor.

[x] Mapped tilesets como en MK1_NES v0.1r, donde el tileset tipo "packed" se compone de 16 tiles del tileset global segun un array apuntado por `*tileset_mappings` (que el programador debe ocuparse de mantener en sus *customs*).
