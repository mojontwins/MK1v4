# WIP 3.100

## Multi levels

Estas son las cosas que hacen falta para describir un nivel, en binarios relacionados.

* level descriptor

	Mínimamente indica el número de la música de fondo, las dimensiones del mapa, y los punteros a los binarios comprimidos.

* Mapa.h

	* mapa: Espacio para contener todas las pantallas del mapa.
	* locks: Estructura de los cerrojos. 4 bytes por cerrojo.

* behs

	Se puede descomprimir / copiar lo que se quiera directamente sobre el array de comportamiento_tiles, o no hace falta si se usa mapped tilesets.

* tileset.h

	Tileset. Sólo hay que cambiar los 192 patrones del 64 al 256. Si hacemos mapped tilesets, esto no forma parte del nivel, pero habría que incluir el puntero al array con los 16 tiles.

* sprites.h

	Spriteset. Sólo hay que cambiar los 8 cells de los enemigos, el player no se tocaría.

* enemsh

	* Enemigos, 10 bytes por enemigo, 3 enemigos por pantalla.
	* Hotspots, 3 bytes por pantalla.

Lo suyo sería hacer que todos los conversores pudieran generar archivos vacíos. En el comp.h se generan los archivos vacíos con los nombres de siempre y el motor los incluiría por defecto. En el archivo de niveles irá el array de niveles con los descriptores y tal y cual.

La idea que tengo no tener que distinguir entre niveles o no niveles a la hora de los includes, simplificando así el código.

En ZX...

* ts2bin.exe permite especificar una fuente y el parámetro "blank" en lugar del archivo work.png que generará todo a 0.

* Tocaría modificar sprcnv2.

* ene2h.exe permite empty=W,H,N para generar un enems.h con sitio para WxHxN enemigos y WxH hotspots.

* El mapa.h es más trivial, porque nos basta con no llamar a ningún compresor y hacer un defs con el número de bytes necesario.

En CPC...

* Puedo añadir a mkts la opción de no tomar entrada y que se asuma un archivo completamente en negro.

Así, en el motor, #ifdef `COMPRESSED_LEVELS` simplemente añadiría un `levels.h` con todo lo necesario para describir cada nivel, que sería el archivo que habría que personalizar en cada juego. El resto de los includes sería igual con o sin `COMPRESSED_LEVELS`.

