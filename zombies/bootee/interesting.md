# Interesting

Este motor va a ser en C puro y a veces hay varias formas de hacer las cosas ¿cuáles generan mejor código

## Acceso secuencial a un array

Es curioso de qué forma se pueden acceder los arrays y cuál parece ser la que produce mejor resultado en z88dk 1.10.

```c
	rda = *map_pointer ++;
```

Genera:

```asm
	ld	hl,(_map_pointer)
	inc	hl
	ld	(_map_pointer),hl
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rda),a
```

En cambio

```c
	rda = *map_pointer; map_pointer ++;
```

Genera

```asm
	ld	hl,(_map_pointer)
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,(_map_pointer)
	inc	hl
	ld	(_map_pointer),hl
```

Que parece hasta peor. Usando un índice, es decir, 

```c
	rda = map_pointer [gpit]; gpit ++;
```

Produce

```asm
	ld	de,(_map_pointer)
	ld	hl,(_gpit)
	ld	h,0
	add	hl,de
	ld	l,(hl)
	ld	h,0
	ld	a,l
	ld	(_rda),a
	ld	hl,_gpit
	ld	a,(hl)
	inc	(hl)
	ld	l,a
	ld	h,0
```

O sea, el peor resultado. Lo mejor es usar la primera construcción.
