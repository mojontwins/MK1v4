# Consideraciones

* El churum será un tile, pero el viejo será un enemigo lineal que no mata con el que podremos interactuar con scripting.

* La caja que llevas será un ente custom que funcionará como una plataforma. Aparecerá en (X, Y) en el que la sueltes (desde scripting, con extern) y caerá hasta tocar suelo. Hay que pintar un sprite más con la caja.

* Al empezar el juego se llamará a un extern que cambie todos los tiles "papaya cogida" (en el mapa) por "papaya".

# EL ROBOBO DE LA PAPAYA - ft. Macaco el Caco

* Aqui saldrá un niño diciendo que quiere papayas, luego tu vas al puesto del viejo que te vende papayas y se le han acabao - y te propone una "solución".

* Los arboles están cargados de papayas, tu puedes llevar N papayas encima, cuando llevas N te tienes que volver a la salida a dejarlas. 

* Tambien puedes llevar un cajon de madera que puedes dejar donde quieras para encaramarte encima

# Paleta para OR

* 2 bits para sprites, 2 bits para fondos.

* Por detrás de todo: celeste (cielo), Cyan (papaya, arbustos), rojo oscuro (troncos).
* Sprites: naranja, azul oscuro, amarillo claro
* Por delante de todo: negro.

* Colores fondo: celeste, cyan, rojo oscuro, negro.
* Colores de sprite: transparente, azul oscuro, amarillo claro.

Tabla de combinatoria (para hacer la paleta)

```
	BG      FG       RESULTADO
	00 CEL  00 Tr    0 CEL
	00 CEL  01 AZO   1 AZO
	00 CEL  10 NAR   2 NAR
	00 CEL  11 AMA   3 AMA
	01 CYA  00 Tr    4 CYA
	01 CYA  01 AZO   5 AZO
	01 CYA  10 NAR   6 NAR
	01 CYA  11 AMA   7 AMA
	10 ROJ  00 TR    8 ROJ
	10 ROJ  01 AZO   9 AZO
	10 ROJ  10 NAR   A NAR
	10 ROJ  11 AMA   B AMA
	11 NEG  00 Tr    C NEG
	11 NEG  01 AZO   D NEG
	11 NEG  10 NAR   E NEG
	11 NEG  11 AMA   F NEG
```

Además, para que esto funcione, el conversor de los tiles debe asignar los valores correctos a cada pixel, igual que con los sprites. Los pixeles del fondo deberán ser todos detectados como 0000 (0), 0100 (4), 1000 (8) y 1100 (12). Los píxeles de los sprites deben ser detectados como 0000 (0), 0001 (1), 0010 (2) y 0011 (3). Necesito dos paletas para conversión específicas., pal_cnvtiles,png y pal_cnvspr.png

¡Cuidado! El churumbel sale usando dos colores de sprite, azul oscuro y amarillo claro (01 / 11). Los colocaré en la paleta en esa posición a ver qué pasa. Si veo que la mezcla es fea, cambio el gráfico. También hay naranja en los tiles no traspasables, pero eso los puedo ocultar usando la matriz de pordetrás.
