# Calavera Prologue

## Los gráficos peculiares

### Speccy

En Speccy, se juega a imprimir con OR. El efecto se consigue haciendo que el PAPER sea azul y la INK negra. Para hacer la conversión de los tiles hay que especificar `inverted:0` para que sepa que debe tomar el color más claro como PAPER (el comportamiento normal es hacer lo contrario) y establecer la tinta como "0" por defecto.

El spriteset lleva todos los sprites pegados (sin intercalar máscaras) y se convierte añadiendo el parámetro `nomask` en la ejecución de `sprcnv2`.

### CPC

Emplearemos el modo "G" de las rutinas de sprites pixel-perfect en modo 1, que no calculan máscara sino que simplemente hacen OR de los píxeles de los sprites con los del fondo. Para que el efecto funcione, os sprites deben tener todos los píxeles usando el color 11 (3), ya que X or 11 = 11, lo que haría prevalecer el sprite. La paleta por tanto será 00 -> color del cielo, 01 y 10 colores para detalles de los tiles, y 11 -> negro.

## Motor

[X] Revisar que t=5 en enems.ene crea los fantis tipo `RANDOM_RESPAWN` directamente --> El motor debe "matarlos" en `init_malotes` al detectar el tipo 5.

[ ] El motor de disparos en CPC usa rutinas de sprites alineadas a byte - asegurarse de que existe una versión OR de la de 8x8 que no sea pixel perfect. Pues no, tenemos `cpc_PutTrSp8x8TileMap2bGPxM1` (8x8, OR, Pixel, M1) y `cpc_PutTrSp8x8TileMap2b` (8x8, mask, byte, general). Necesitamos `cpc_PutTrSp8x8TileMap2bGPxM1`

Vamos a generalizar esto porque hay un pequeño pifostio. Aquí tenemos que las rutinas "no pixel perfect" de cpcrslib necesitan que la X esté ya convertida a bytes. Sin embargo, se llaman por el tamaño del sprite lo cual, en este contexto, no debería tener sentido: el volcado es el mismo sin importar el modo, por lo que el tamaño debería especificarse en bytes.

Para pintar las balas, sin importar el modo, necesitaría dos rutinas (invalidado de cells y pintado de sprites) para sprites de 2bx8px. En un principio voy a provisionar para los tamaños (alineados a byte) 2Bx8 y 4Bx16. Todos tomarán X en bytes y serán mode-agnostic.

Renombramos (¡hay que modificar `mkts_om`!)

* `cpc_PutSPTileMap2Bx8.asm` sustituiría a `cpc_PutSpTileMap4x8.asm`.
* `cpc_PutSPTileMap4Bx16.asm` sustituiría a `cpc_PutSpTileMap8x16.asm`.
* `cpc_PutSPTileMap4Bx24.asm` sustituiría a `cpc_PutSpTileMap8x24.asm`.

[ ] Llegados a este punto recompilo CPCRSLIB y me aseguro de que no haya errores.

* `cpc_PutTrSp2Bx8TileMap.asm` sustituiría a `cpc_PutTrSp4x8TileMap2b.asm`
* `cpc_PutTrSp2Bx8TileMapG.asm` sustituiría a `cpc_PutTrSp4x8TileMap2bG.asm`
* `cpc_PutTrSp4Bx16TileMap.asm` sustituiría a `cpc_PutTrSp8x16TileMap2b.asm`
* `cpc_PutTrSp4Bx16TileMapG.asm` sustituiría a `cpc_PutTrSp8x16TileMap2bG.asm`
* `cpc_PutTrSp4Bx24TileMap.asm` sustituiría a `cpc_PutTrSp8x24TileMap2b.asm`
* `cpc_PutTrSp4Bx24TileMapG.asm` sustituiría a `cpc_PutTrSp8x24TileMap2bG.asm`

## Script additions

El tema de las decos rápidas:

```
	DECOS
		X, Y, T
		...
	END
```

## Customs

Va a ser con scripting.

[ ] `ENTERING ANY` debería comprobar que en tal X, Y no hay nada y pintar la luna, por ejemplo. La luna se pinta abusando del motor con un tile fuera de rango, el 49. Los patrones necesarios son los caracteres 4 a 7 de la fuente. Para que funcione, hay que añadir dos bytes a `comportamiento_tiles` para que su comportamiento no quede fuera del rango del array.

[ ] Quiero poner una palanca (hay que sacrificar un tile) o algo así que despliegue puentes o haga cambios no persistentes en la pantalla.

	* Screen 3, deco: (10, 2) = 3, (10, 3-7) = 0, (10, 8) = 12, y borrar el tile especial con (12, 6) = 0 
	* Screen 10, deco: (13, 4-5) = 0

## NORVIDARSE

Me lo apunto para mirar el próximo día, cada día:

[X] Exporta .MAP de nuevo!!
[ ] Activar el motor de disparos.
[-] Revisar los behs (¡¡la luna mata!!) - La luna mata porque se pone con un beh fuera de rango. Se arregla añadiendo dos bytes a los comportamientos (para que haya 50 tiles definidos)
[ ] ¡¡Investigar por qué aparece cpc_PutSPTileMap4Bx24 en LIB en los asm generados si no estoy usando ese tamaño de sprite!!