# Cutscenes

Queremos hacer un nuevo motor de cutscenes animadas. Habrá hasta 4 "actores" que se puedan mover por la pantalla. 

Normalmente en modo lateral (que es el que haremos por ahora) los actores deberían tener 3 frames de animación encada dirección para andar horizontalmente. Tampoco vamos a emocionarnos. Con esto ya molará de la hostia.

El motor debe poder intercalar movimientos simultaneos, pausas, y cuadros de texto (que interrumpirían todas las acciones).

Para cada actor necesitaríamos:

* `x, y, mx, my`
* `dx, dy` - destino adonde irá. Si `x != dx || y != dy` el personaje se moverá.
* `frame` - si el pesonaje está en movimiento se mostrará el ciclo de animación. Si está parado, se ignora esto y se muestra el frame 0.
* `sprite_base` - el número de cell base al que se suma `frame`.

El cutscene es una especie de programilla o script interpretado que debe poder codificar todo lo necesario:

- Definir un actor: establecer su posición inicial, y su sprite_base.
- Establecer la velocidad `mx, my` de un actor, que se aplicarán si se mueve.
- Cambiar destino `dx, dy` del actor. En cuanto se cambie el destino, el actor empezará a moverse.
- Establecer una pausa, que detiene el script (pero no los movimientos) durante N frames.
- Mostrar el texto N

En el tema de velocidad hay que tener en cuenta que necesito velocidades "1 pixel cada N frames", que será algo que tenga que codificar de forma eficiente. En el pasado he codificado N = N pixels por frame y -N = -N frames por pixel. Esto puede ser más que suficiente.

Opcodes:

```
    00 N              - Esperar NN frames.
    01 A X Y B        - Define actor 'A' en 'X', 'Y' con base 'B'. Esto inicializa dx=x, dy=y, mx=my=1.
    02 A X Y          - Establece mx, my para el actor 'A'
    03 A X Y          - Establece dx, dy para el actor 'A', el actor empezará a andar.
    04 N              - Mostrar texto N
    05 A              - Establece dx=x y dy=y, con lo que el actor se para.
    06                - Esperar hasta que todos los actores estén parados.
```

Cada bucle se debe recorrer todos los actores y actualizarlos. El script finaliza cuando se llega a un opcode FF. El script debe empezar además con el número de pantalla que hay que mostrar (del mapa).

# Pack graphics

En este juego los gráficos son de 1 bit en modo 1, esto signfica que de cada pixel con bits B1 B0, los sprites usan B1 y los tiles usan B0. En los sprites se usa 00 y 10 para apagado/encendido y en los fondos se usa 00 y 01. Así se puede poner los sprites sobre los fondos con OR sin máscaras y no hay mezcla, pero en la paleta los colores 10 y 11 deben ser iguales, el color 01 será el encendido del fondo y el 00 el color de fondo global.

Esto me sugiere que quizá podría almacenar sprites y tiles superpuestos en la memoria y usar bitwise para leer unos u otros. Pero el formato de pixel raro del CPC no me deja sacarlo de cabeza, así que...

En modo 1, los pixels ABCD correlativos en pantalla se representan así en 1 byte:

```
	7  6  5  4  3  2  1  0
	A0 B0 C0 D0 A1 B1 C1 D1
```

Hemos dicho que los fondos usan el bit 0 de cada pixel, por lo que los bytes que representan el fondo sólo usan estos bits:

```
	76543210
	XXXX0000
```

El primer plano solo usa el bit 1 de cada pixel, por lo que los bytes que representan los sprites solo usan estos bits:

```
	76543210
	0000XXXX
```` 

Por tanto, sí es viable almacenar tiles y sprites en la misma zona de memoria. Cuando queramos pintar tiles, habrá que hacer un `AND 0xF0` al byte leído para quitar los datos de sprites, y para pintar sprites habrá que hacer un `AND 0x0F` para quitar los de los tiles.

Esto es terriblemente sencillo de implementar. Lo que tengo que resolver es el tema de la conversión de forma que mkts_om saque el binario o el array de marras con sprites y tiles superpuestos.

Pensando en que los sprites en CPC ocupan lo mismo que el equivalente en tamaño de tiles, lo más fácil es habilitar sitio para almacenar 256 "patrones" para sprites, que equivalen a 64 caras de sprites de 16x16.

Tengo que añadir rutinas como las de Modo 1 en OR que hagan el decoding antes para los sprites, y rutinas de sprites específicas.

Remember: La rutina que copia el tile de fondo en cada posición invalidada es `transferir_map_sbuffer_grey` dentro de `cpc_updScr`. Puedo añadir un `cpc_updScrM1P` que haga el `AND 0xF0` cada vez que lea una fila de patrón de RAM.

En cuanto a los sprites, tengo las funciones `cpc_PutTrSp[TAMAÑO]TileMap2bGPxM1` que son las "modo 1 pixel a pixel con OR". Tendría que replicarlas a `cpc_PutTrSp[TAMAÑO]TileMap2bGPxM1P` con la P de packed y ya empieza esto a ser demasiado chorizo, pero ¿quién se va a andar fijando?.

```
	cpc_PutTrSp16x16TileMap2bGPxM1P
	cpc_PutTrSp16x24TileMap2bGPxM1P
```

Estoy pensando que quizá lo mejor sea generar los binarios de tiles y sprites como siempre y luego tener un packer que coja dos binarios y genere otro combinando nibbles de uno con nibbles de otro, rollo

```
	packnibbles.exe left.bin right.bin output.bin
```

El tamaño resultante será tan grande como el mayor de left.bin y right.bin.

## Modo 0

No lo uso aquí pero me da curiosidad.

Un byte contiene dos pixels AB, que se guardan así:

```` 
	7   6   5   4   3   2   1   0
	A0  B0  A2  B2  A1  B1  A3  B3
````

Si uso las máscaras 0xCC 0 0x33 tengo 

```
	& 0xCC: Me quedo con los pixels de fondo
	A0 B0 00 00 A1 B1 00 00

	& 0x33: Me quedo con los pixels de sprite
	00 00 A2 B2 00 00 A3 B3
```

Esto significa que de cada color 3210, "32" serán para sprite y "10" para fondo y la paleta debería definirse así:

```
    #  S F
	0 0000 Color de fondo 0
	1 0001 Color de fondo 1
	2 0010 Color de fondo 2
	3 0011 Color de fondo 3
	4 0100 Color de sprite 1
	5 0101 Color de sprite 1
	6 0110 Color de sprite 1
	7 0111 Color de sprite 1
	8 1000 Color de sprite 2
	9 1001 Color de sprite 2
	A 1010 Color de sprite 2
	B 1011 Color de sprite 2
	C 1100 Color de sprite 3
	D 1101 Color de sprite 3
	E 1110 Color de sprite 3
	F 1111 Color de sprite 3
```

O sea, F0 F1 F2 F3 S1 S1 S1 S1 S2 S2 S2 S2 S3 S3 S3 S3. El conversor no tendrá problemas con esto.

```
	cpc_UpdScrP
	cpc_PutTrSp8x16TileMap2bGPxP
	cpc_PutTrSp8x24TileMap2bGPxP
```

# Pushy poosh

Made a branch for this