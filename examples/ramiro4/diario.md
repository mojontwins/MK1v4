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

