# Consideraciones

* El churum será un tile, pero el viejo será un enemigo lineal que no mata con el que podremos interactuar con scripting.

* ¿ La caja que llevas será un ente custom que funcionará como una plataforma. Aparecerá en (X, Y) en el que la sueltes (desde scripting, con extern) y caerá hasta tocar suelo. Hay que pintar un sprite más con la caja. ? O quizá nos podemos simplemente ceñir al plan de no modificar el engine y hacerlo todo con el script...

* Al empezar el juego se llamará a un extern que cambie todos los tiles "papaya cogida" (en el mapa) por "papaya".

# EL ROBOBO DE LA PAPAYA - ft. Macaco el Caco

* Aqui saldrá un niño diciendo que quiere papayas, luego tu vas al puesto del viejo que te vende papayas y se le han acabao - y te propone una "solución".

* Los arboles están cargados de papayas, tu puedes llevar N papayas encima, cuando llevas N te tienes que volver a la salida a dejarlas. 

* Tambien puedes llevar un cajon de madera que puedes dejar donde quieras para encaramarte encima

# Paleta para OR

* 2 bits para sprites, 2 bits para fondos.

* Por detrás de todo: celeste (cielo), Cyan (papaya, arbustos).
* Sprites: naranja, azul oscuro, amarillo claro
* Por delante de todo: negro, rojo oscuro (troncos).

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
	10 ROJ  01 AZO   9 ROJ
	10 ROJ  10 NAR   A ROJ
	10 ROJ  11 AMA   B ROJ
	11 NEG  00 Tr    C NEG
	11 NEG  01 AZO   D NEG
	11 NEG  10 NAR   E NEG
	11 NEG  11 AMA   F NEG
```

Además, para que esto funcione, el conversor de los tiles debe asignar los valores correctos a cada pixel, igual que con los sprites. Los pixeles del fondo deberán ser todos detectados como 0000 (0), 0100 (4), 1000 (8) y 1100 (12). Los píxeles de los sprites deben ser detectados como 0000 (0), 0001 (1), 0010 (2) y 0011 (3). Necesito dos paletas para conversión específicas., pal_cnvtiles,png y pal_cnvspr.png

¡Cuidado! El churumbel sale usando dos colores de sprite, azul oscuro y amarillo claro (01 / 11). Los colocaré en la paleta en esa posición a ver qué pasa. Si veo que la mezcla es fea, cambio el gráfico. También hay naranja en los tiles no traspasables, pero eso los puedo ocultar usando la matriz de pordetrás.

# Más cosas

* Estrenar aquí el sistema de diálogo simples de msc4 cuando se interactúe con el viejo para poder darle papayas o decirle que te lleve a otro campo.

* Randommente aparece el niño y dice Papai continuamente hasta que vas a interactuar con él para que se calle, o si no viene el guarda... Pero igual a esto hay que darle una vuelta.

No tengo nada claro como implementar el cajón. Es una buena idea poder llevar el objeto, pero me supone complejidad en cuanto a los estados del juego. El tema de la persistencia lo puedo solucionar con el script pero, ¿y si te lo dejas atrás y ya no puedes volver? Sería problema tuyo y habría que abandonar el campo...

# Enemigos especiales para interactuar

¿Cómo se hacía para que un enemigo no te mate? ¿No hay otra que hacer un custom? Con `this_enemy_kills` activando `CUSTOM_ENEMS`. Otra cosa que hay que tener cuidado es con el debounce del script. Lo suyo sería que sólo se lanzase una vez CADA VEZ QUE TE TOCA y no en cada frame.

# Persistencia

A mi se me ha ido la anchoa con el tema de la persistencia :D

No puedo tener persistencia in situ en el mapa si el mapa es RLE. Tengo dos opciones:

1.- Usar un mapa descomprimido y persistir directamente sobre el mapa. Esto es lo más sencillo, y ocuparía 40 x 150 = 6000 bytes. Para mapas de 32 tiles me parece un despilfarro increíble.

2.- Seguir con el mapa comprimido y persistir con una estructura externa. Como solo hay que persistir un tipo de tile nos basta con un byte por cada 8 tiles, 2 bytes por fila, 20 bytes por pantalla, 800 bytes en total. Esto siempre va a ser menor que los 6000 bytes del model compartido. Para que el mapa RLE ocupe más de 5200 bytes tendría que montármelo muy mal.

La persistencia externa será un array grande de 20 bytes por pantalla. En realidad podría ser de menos si limito hasta donde puedo poner papayas, pero no me quiero limitar así antes de haber construido el mapa.

Dados X, Y a nivel de tiles, 

```
	index = NP * 20 + Y * 2 + X / 8;
	bitmask = 1 << (X & 7)
```

Hmmm, si limitamos a las 8 filas superiores el cálculo es más sencillo y ocuparía 16 bytes por pantalla, 640 bytes en total. Tendría que tener cuidado de no poner papayas en las dos filas inferiores.

# La caja más

Más caja. Al final lo hago con tiles. Tengo una subrutina en el script que detecta qué tile hay por si hay que poner un tile "caja con algo delante" para que quede más mejor. A saber:

1->34
5->35
17->36
20->37
21->38
22->39

# Inicio del juego

Podemos poner que hasta que no se habla con el viejo el camino adonde están las papayas esté bloqueado. Podemos poner además que el viejo no esté en el camino y que haya que ir explícitamente a por él.

# El dueño de la finca

Enemigo más complejo, que si te coge te quita las papayas y te expulsa.

* ¿Adónde te expulsa? -> Lo más fácil es que te tire al principio de la fila del mapa, pero ¿y si hago alguna fase con ótra organización? Mejor almacenar esto en algún sitio... Como el enemigo es custom, puedo almacenar esto en variables normales y llamar desde el script a un extern que las establezca... O usar directamente flags.

* El enemigo te persigue a velocidad constante horizontalmente, y puede caer. Si estás más arriba o encuentra un borde de plataforma, salta. Voy a ver cómo eran los enemigos en el Calavera de v4 inacabado. -- Los puedo usar casi directamente, redefiniendo el estado `Z_APPEARING` - En el original emergían del suelo. Aquí hay que darle una vuelta. O quiza simplemente lo pongo en la pantalla y no hay estado `Z_APPEARING`. 

* El enemigo este aparecerá a partir de la segunda fase. Podemos aprovechar para que el viejo te avise.

# Activar / desactivar conexiones de pantalla.

Voy a necesitar algún tipo de hook que me permita invalidar una transición de pantalla, para así impedir que se cambie de pantalla verticalente en determinadas filas. 

```c
	#define ENABLE_CUSTOM_FLICK 				// define flick_* in custom_flicks.h, return 0 to override flick
```

Llamará a `flick_*` según la dirección en `custom_flick.h`. Ahí podremos hacer lo que nos plazca. Si devolvemos 0, invalidaremos el cambio de pantalla.

