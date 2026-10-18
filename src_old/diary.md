# MK1v3.2 diary of things.

## Mejor disparasión

Rehacer la disparasión para soportar los modos de Goku Mal. Esto incluye:

### `#define CELL_ALIGNED_BULLETS`

Para que las balas se rendericen más rápido, se alinean a la rejilla. Esto evita que los sprites se tengan que rotar y, en CPC, supone una ganancia (en ZX da igual, todas las rotaciones tiran de LUT).

### `#define SHOOT_4_WAY`

Se puede disparar en todas las direcciones, 

* Esto activa el array `bullets_my`.
* Si estamos en perspectiva genital, activar `PLAYER_CAN_FIRE` activa esto automáticamente.
* Si estamos en perspectiva lateral, hay que activarlo específicamente y para que los disparos tengan componente `my` se debe pulsar `FIRE` en combinación con `UP` or `DOWN`. Si además se está pulsando `LEFT` o `RIGHT` tendrán componente mx, así:

```
	// Player pulsó FIRE este frame.

	if (UP || DOWN) {
		if (UP) {
			my = -V;
		} else {
			my = V;
		}

		mx = 0;
		if (LEFT) {
			mx = -V;
		} else {
			mx = V;
		}

	} else {
		my = 0;
		if (facing (LEFT)) {
			mx = -V;
		} else {
			mx = V;
		}

	}
```