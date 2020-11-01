# Diario (o postmortem, depende de cuando lo leas)

¿Por qué estoy haciendo este juego en la Churrera 4 en lugar de en v5 o en la v6 WIP? Por dos razones: *dat Ramiro vives*, y porque hacer Ramiro en v4 es muy sencillo, ya que v4 era, esencialmente, el motor de Ramiro.

He reescrito partes y pasado funciones auxiliares a ensamble. Todo es más fluido, pero se comporta igual que el original, que era lo importante (*dat Ramiro vibes*).

Tendría que haber empezado hace eones a escribir este diario, pero bueno, Hago un resumen de lo que hay hecho y luego ya si eso me pongo a divagar por lo que hay.

El juego se trata de conseguir cuatro trozos de pergamino. Cada trozo se ubica en una trampa. Coger el pergamino activa la trampa. Los pergaminos son *hotspots* de tipo 1. En `hook_mainloop` de `custom.h` se puede detectar fácilmente que acabamos de coger un objeto: cuando se cumple que `player.objs != objs_old`.

Básicamente voy a usar los rudimentarios hooks para meter las cosas nuevas. Todo en `custom.h`.

## Atributos de habitaciones

Cada habitación tiene asignado un byte de atributo que sirve para decidir con cuál de los dos tilesets se dibujará (`TWO_SETS_CONDITION` se define como `((map_behaviours [n_pant] & 1) ? 32 : 0)`), si lleva *ojo de Horus* o si lleva trampa.

## El ojo de Horus

En este juego se usan las cosas de la Churrera 4 que se metieron con calzador para los ramiros originales, pero jamás se activará el estado `kill_slowly`. Este estado era el que te otorgaba el *hechizo postizo* y hacía que las *evil zones* mataran más despacio. Aquí no. Cuando el ojo está abierto (estado 2) se activarán las *evil zones*. Para que esto sea viable, se ha definido `EVIL_ZONE_CONDITIONAL` de forma que las *evil zones* sólo restarán vidas si `scenery_info.evil_zone_active` vale 1. El ojo de Horus no es más que una simple máquina de estados con tiempos diferentes para cada estado, definidos en `evil_eye_state_cts`, que se pinta con los tiles definidos en `evil_eye_state_tiles`. 

## Las trampas

Un sencillo motor de N objetos que caen desde arriba, dibujados como tiles. Tuve que hacer algunas perivueltas pero lo dejé funcionando. En la primera modalidad de trampa, caen bloques que tendremos que emplear para trepar y salir. Los bloques te escojoncian si te dan, claro. En la segunda modalidad caen monedas y tendremos que conseguir 30 para poder salir.

Estoy pensando combinar monedas y ojo de Horus para otra trampa.

## Los guardianes de las trampas

En el juego hay cuatro guardiantes de cada trampa. Te dejarán pasar si les das un objeto que cada uno necesita:

* Marisa la sacerdotisa necesita unas bragas, porque perdió las suyas en la fiesta del cumpleaños del hijo de una amiga que se fue de madre.
* Gustavo el esclavo necesita un tarro de grasa para cuidar el cuero de su uniforme, pues es un esclavo muy coqueto.
* Clemente la serpiente quiere una flauta para auto encantarse y así dormir, pues es insomne.
* Sonia la momia necesita papel del culo, que anda indispuesta.

Los objetos no están directamente en el mapa, sino que hay un altar al que llevar tributo. Cada vez que llevamos un tributo el altar nos obsequia con uno de los cuatro objetos (al azar, tendré que tener una lista y reordenarla un poco en cada partida).

El objeto que llevamos aparecerá con Ramiro usando un sprite. Por eso estoy usando `sprcnv2` en vez de `sprcnv` y así poder importar 4 sprites extra. En `comp.bat`:

```
	..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 20 extra > nul
```

Cuando llevel objeto al que no es, te rechaza, te quita vida, y te suelta un insulto:

```
	TES KI YA CARAJAULA, LLEVATE ESO!
	Y ESTO QUE ES BEBECHARCOS, ESCUCHAPEOS
	PARA QUE QUIERO ESTO BOQUIMUELLE
	¿PERO QUE ME TRAES? BOTARATE, TALLO DE CEBOLLA!
```

## El objeto

Como hemos dicho, Helmet llevará un objeto a cuestas. Para simplificar voy a hacer un array con cinco elementos: un 0 y luego los punteros a los cells extra con los cuatro objetos. Crearé una variable `pinv` que diga qué objeto llevamos. Si vale distinto de 0, pintaré el objeto a la espalda de Ramiro. Para ello lo definiré con menos prioridad y lo pintaré en `gpx - 8` o `gpx + 8` dependiendo del valor de `player.facing`. No me olvido de cambiar `NUMBLOCKS` de 40 a 50, pues un sprite más son 10 bloques más. 

Para dar un objeto a ramiro, hay que asignarlo a `pinv` (1 a 4), y hacer `pinv_next_frame = object_cells [pinv];`. Para quitar el objeto, basta con hacer `pinv = 0`.

Para controlar esto vamos a definir un par de externs en `msc_extern.h`. Aquí ya tengo el renderizador de textos, así que tendré que multiplexarlo. Vamos a hacer que `EXTERN n` con `n >= 64` asigne a `pinv` el valor `n - 64` y que si es diferente de 0 también asigne el sprite, `pinv = n - 64; if (pinv) pinv_next_frame = object_cells [pinv];`.

## Las ofrendas

Las ofrendas las voy a manejar con hotspots de tipo custom, por ejemplo el 2. Puedo detectar que tomo una ofrenda fácilmente ya que si tomo un hotspot, la variable `latest_hotspot` tomará su tipo durante el frame actual. Como he quitado el marcador del contador de quemazón ya que en este juego no tiene sentido, contaré las ofrendas aprovechando el sitio. Creo dos variables, `pofrendas` y `pofrendas_old`, la primera para contar y la segunda para llevar la actualización del marcador.

## El altar

Aunque podemos llevar varias ofrendas a la vez, el altar sólo nos dará un objeto si no llevamos. La detección se hace desde el script, pero el manejo con `EXTERN 128` en `msc_extern.h`. 

## La trampa de agua

La trampa de agua se activa cuando cogemos una ofrenda en la pantalla 29.

Cuando el agua te mata se desactiva la trampa y se vuelve a la pantalla 5.

Se muestra en la columna derecha, esto es, en las pantallas 11, 17, 23 y 29. Cuando se active:

- En cada pantalla se cierra la salida y solo se abre cuando se pulsen dos interruptores situados por algún sitio (!) de la pantalla.
- Al entrar, hay que dar un boost al jugador en direccion vertical y tapar la entrada con una plataforma. Esto del boost se mantiene para la pantalla 5, aunque esta no tenga trampa de agua.

Hay una variable `water_level` con el nivel del agua. Tendrá un valor entre 0 y 24, para que no se muestre el agua durante unos segundos. Indica la altura en caracteres. **Necesito una función que pinte una tira de caracteres N y la invalide si la altura es `< 20`.** - `paint_water_strip` pintará en `rdy` una fila de caracteres `rdi`.

Para detectar que golpeamos un tile desde abajo usaremos `player.ceiling` y luego buscaremos el tile con `qtile`.

Para activar la planta usaremos una función `water_trap_setup` que podamos llamar al coger la ofrenda de la pantalla 29 o al entrar en alguna de las pantallas con la trampa activada.

Activar la trampa de agua debe:
	- Tapar la salida inferior si la hay
	- Tapar la salida superior si la hay
	- Pintar los tiles que abren la trampa.

El tema es generalizar esto lo más posible para ocupar lo mínimo posible.

La tapa de arriba está en (11, 0) para las pantallas 11 y 23 y en (2, 0) para las pantallas 17 y 29.

La tapa de abajo está en (11, 9) para las pantallas 5 y 17 y en (2, 9) para las pantallas 11 y 23.

Si divido `n_pant` entre 6 puedo usar par/impar:

- Es > 1; bloquear top, impar (11, 0), par (2, 0).
- Es < 4; bloquear bottom, impar (2, 9), par (11, 9).

La trampa se desactiva al entrar en la pantalla 5 tras haber pintado las cosas.

Me queda ver cómo colocar los tiles que abren la trampa y luego detectarlos. Para eso tengo que diseñar un poco las pantallas de la trampa y haerme una idea.

~~ 

Puedo tener un array indexado por `n_pant / 6` que se pinte si `n_pant > 5` en el que cada byte empaquete dos posiciones X para pintar en la fila 0, con estos datos (tomados mientras pinto las pantallas):

```
	{ 0, 0x26, 0x4E, 0x57, 0x79 }
```

