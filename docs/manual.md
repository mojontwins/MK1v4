# MTE MK1 v4

## ¿Por qué?

Porque sí. Y por otras cosas. 

He contado esta historia un montón de veces. La Churrera empezó a principios de 2010, tras algunas charlas mojonas hablando de crear un motor *sencillo* para plasmar ideas pequeñas que íbamos teniendo. En aquella época hacer un güego era una tarea bastante costosa, tampoco nos podíamos lanzar a programar cualquier tontería, pero teníamos la necesidad de poder tener un güego *de cualquier tontería*. Así nació la Churrera.

MTE MK1 evolucionó mucho durante todo 2010, a medida que íbamos haciendo los güegos de la *Colección Pretujao*. Para la v2 ya soportaba güegos de vista genital, y para la 3 estrenamos el sistema de scripting. Acabado el año empezamos a dedicarnos a otras cosas no churreras, y salvo algun uso puntual se quedó intacta hasta 2012.

En 2012 se nos ocurrieron varios güegos loquísimos y desde mediados de año hasta 2013 nos pusimos a meter a la churrera un montón de cosas que sólo iban a valer para un güego, que no funcionaban entre sí, que rompían cosas básicas... incluso llegamos a tener versiones paralelas o a perder toneladas de adiciones (véase la historia de Sir Ababol 2 en el directorio de ejemplos).

A principios de 2013 sacamos Ramiro el Vampiro y luego pensamos en publicar el motor para el disfrute de la comunidad. Empezamos a redactar el tutorial y a hablar con EMS para publicarlo. Pero no podíamos hacerlo con la versión más reciente (la 4.7), sencillamente porque era un caos y la mitad no iba a funcionar bien. Así que hicimos borrón y cuenta nueva: volvimos en una nave del tiempo a principios de 2011, cogimos la versión 3.1, y reconstruimos desde ahí.

La primera versión que publicamos para el gran público fue, por tanto, la 3.99, construida sobre la 3.1, y que fuimos evolucionando poco a poco hasta que MK1 mutó en MK2, y que retomamos más tarde, a principios de 2020, para hacer la versión 5.

La maldita y frankenstéinica v4 se quedó en el limbo. ¡hasta ahora!

En esta rama tenéis la versión 4.8, que no es más que la rama v4 maqueada:

- Se han corregido los bugs.
- Se han eliminado las incompatibilidades intestinas.
- Se ha remplazado un montón de rutinas auxiliares por versiones más mejores y/o en ensamble.
- Se ha reorganizado el código.
- Se ha añadido un rudimentario sistema para poder hacer hooks y personalizar el motor.
- Se ha reintegrado la pila de mejoras que se introdujeron para Sir Ababol 2 pero que se perdieron cuando este güego se "sacó de la churrera".

¿Por qué esto es interesante?

- Tienes los motores de clásicos como Ramiro el Vampiro, Sir Ababol 2, o el güego jamás completado de Johnny Limite, solo que mejorados.
- ¡Puedes combinar todas las mierdas específicas de estos güegos en un frankenstein misterioso!
- Dat v4 vibes, man.

En realidad quería hacer el **Ramiro 4** que planenamos y empezamos pero que perdimos, y ya que estaba limpiar el código. Y luego me acordé de que **Sir Ababol 2** empezó como un prototipo en v4 a la que añadimos todas sus historias de gameplay, pero que luego terminamos quitando los `#defines` no utilizados y "deschurrerizándolo" para convertirlo en un güego de 128K, así que decidí reintegrar esas cosas de nuevo en v4... Y ya que estaba, haciéndolo bien, no solo cortapegando.

En fin, que aquí está.

## Qué es este documento

Es un manual de la v4. Si ya sabes hacer cosas con la churrera y quieres ver qué tiene esto de especial puedes saltarte un montón de capítulos e irte directamente al 6. Si no, igual a lo mejor es interesante hacerse antes con el tutorial de la versión actual. O leer este resumen raro.

Por cierto, sabemos que se dice "vista cenital", pero "vista genital" tiene más gracia. De nada.

## Antes de empezar

Los güegos de **MTE MK1** se compilan con **splib2**. La versión actual lleva unas modificaciones que no son compatibles con v4, y viceversa, por lo que hemos preparado un paquete que se puede instalar a la vez que el otro y que tiene todo lo que necesitas.

Descomprime el archivo `z88dk10-orig.zip` que viene en `env/` en `C:\`. Abre una ventana de linea de comandos, ejecuta:

```
	> C:\z88dk10-orig\setenv.bat
```

Luego descarga la rama `churrera_4` del repositorio, copia el directorio `src/` y todo su contenido a donde más coraje te de, y cambiale el nombre por el de tu güego. Si entras en el subdireoctorio `dev` y ejecutas `comp.bat` el güego de ejemplo **Cheril of the Bosque** se compilará. Si obtienes algún error es que algo has hecho mal.

El proceso de crear un güego se basa en sustituir los recursos del güego de ejemplo, cambiar la configuración, y quizá programar un poquito en C o en el lenguaje de scripting.

Ya estás listo para funcionar.

## Qué hay en el paquete

Como hemos dicho, en `src` está todo lo que se necesita para construir un güego. Dentro hay varios subdirectorios, a saber:

* `dev` contiene el código del güego. Aquí configuras y quizá añades tu código c custom. Muy probablemente tendrás que modificar también `comp.bat`, que es el script que se encarga de ir convirtiendo todos los recursos y de llamar al compilador.
* `enems` contiene el archivo de colocación de enemigos y *hotspots*.
* `gfx` contiene los gráficos necesarios para tu güego en formato png.
* `map` contiene el mapa de tu güego en formato de **Mappy** (fmp) o de exportación (map). **Mappy** se incluye en el directorio `env`.
* `music` contiene un archivo en formato bbsong de **Beepola** (busca en google) y su export en ensamble.
* `script` contiene el script de tu juego, si lo vas a usar.
* `utils` contiene todas las utilidades del toolchain que se emplean en **MTE MK1 v4**.

# Capítulo 1 - El tileset

El tileset es la colección de archivos de 16x16 que se emplea para dibujar las pantallas del güego. Cada tile puede tener un comportamiento diferente que se definirá en la configuración del proyecto (obstáculo, plataforma, etc). **MTE MK1** maneja *tilesets* de 48 tiles, de los cuales, y dependiendo del formato del mapa, los 16 primeros o todos ellos podrán ser empleados en dibujar la pantalla. Además, dependiendo también de la configuración, los tiles número 16 al 19 serán empleados para cosas especiales.

Los tilesets se dibujan siguiendo las restricciones del ZX Spectrum en un archivo .png de 256x48 que, por orden, guardaremos en `gfx/` con el nombre `work.png` y que tendrá un aspecto parecido a:

![Tileset](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c01-001.png)

Vayas a utilizar 16 o 48 tiles para el mapa, hay algunos tiles especiales, a saber, y contando los tiles de 0 a 47:

* El tile 14 (el penúltimo de la primera fila) será la *caja empujable* si las activas. Si no puedes usarlo normalmente.
* El tile 15 (el último de la primera fila) será el *tile cerrojo*, si activas las llaves. Se trata de un obstáculo que desaparecerá si lo tocamos lateralmente llevando una llave.
* El tile 16 (el primero de la segunda fila) será la recarga de vida, que en esta versión de **MTE MK1** aparecerá si hemos recogido un objeto o una llave y volvemos a la pantalla.
* El tile 17 (el segundo de la segunda fila) representará los *objetos coleccionables* si están activos. Si no, puedes usarlo normalmente.
* El tile 18 (el tercero de la segunda fila) representará las *llaves* si están activas. Si no, puedes usarlo normalmente.
* El tile 19 (el cuarto de la segunda fila) representará un tile alternativo por el que se sustituirá el tile 0 de forma aleatoria, para hacer bonito. Esto también se puede desactivar, en cuyo caso puedes usarlo normalmente.

Los tilesets se convierten con la herramienta `ts2bin.exe`. **MTE MK1** espera que queden en `dev/tileset.bin`, por lo que, si abres `comp.bat` con tu editor de textos, verás que la llamada es:

```cmd
	..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
```

`ts2bin.exe` necesita también un archivo png de 256x16 con la fuente del juego. El cuarto parámetro (un número) es la tinta por defecto que se emplea si un cuadro de 8x8 tiene un solo color. Si se pasa "-1", el conversor elegirá blanco para los colores oscuros o negro para los claros.

## El tileset para mappy

Mappy tiene su historia y necesita que el primer tile sea completamente negro. En esta versión de **MTE MK1** tendrás que generar un segundo tileset específico para Mappy con el primer tile negro si el primer tile no lo es. Puedes grabarlo como `mappy.png` en `gfx`.

![Tileset para Mappy](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c01-002.png)

## Sombras automáticas

Si utilizas el modo de mapeado que sólo emplea los primeros 16 tiles, puedes activar un modo de "autosombreado", en el que el motor calcula sombras automáticamente.  Básicamente, el motor sombrea automáticamente los tiles de tipo “fondo” que haya al lado de los tiles de tipo “obstáculo”, creándose así más sensación de 3D, como en Cheril Perils:

![Cheril Perils](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c01-003.png)

Para esto, el motor necesita que la última fila de tiles contenga una réplica de los tiles “fondo” del tileset, pero sombreados, así:

![Tileset de Cheril Perils](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c01-004.png)

Por cierto, si activas esta opción el render será mucho más lento y el binario final mucho más pesado, ya que no está optimizado en ensamble en esta versión (aunque sí a partir de v5).

# Capítulo 2 - Mapeando

Para hacer el mapa puedes usar cualquier cosa siempre que te curres un conversor. De hecho, [había uno para Tiled que montó Antonio Villena, **TmxCnv**](https://github.com/DSkywalk/fase/blob/master/ComplementosChurrera/Conversores/TmxCnv.c). Si quieres ir por el método estándar, tendrás que hacer los mapas con **Mappy**. En el directorio `env` tienes la versión mojona tuneada. Descomprímela en un sitio bonito y ejecuta `mapwin.exe`. Es interesante que asocies el tipo de archivo fmp a `mapwin.exe` para más comodidad de vida.

## Definiendo nuestro mapa

Lo primero es definir el tamaño de nuestro mapa para saber con qué nos enfrentamos. Hay que tener en cuenta que estamos en 48K y sería conveniente que nuestro mapa no emplease demasiado, ya que a lo que ocupe el mapa habrá que sumar lo que ocupen los enemigos.

* Si vamos a usar sólo 16 tiles diferentes, un número de tile se codifica sólo con 4 bits, con lo que en cada byte podemos almacenar dos tiles. De ese modo las pantallas, que son de 15 x 10 = 150 tiles ocuparían 75 bytes.

* Si vamos a usar los 48 tiles, ya no podemos meter dos tiles por byte, por lo que cada pantalla ocupará 150 bytes, el doble.

Los enemigos, que ya veremos más adelante, ocupan 30 bytes por pantalla (27 si no pueden morir). Así que tenemos que cada pantalla ocupará 105 bytes si usamos 16 tiles, o 180 si usamos 48.

¿Cómo de grande puede ser nuestro mapa? Pues todo dependerá de las opciones que activemos, el formato del mapa, si usamos un script, o hemos puesto mucho código custom. Es muy difícil dar una estimación, por lo que lo mejor es empezar con un mapa de tamaño medio (30 pantallas o así), ver si cuando todo esté añadido queda sitio, y si conviene ampliarlo (proceso que explicaremos en el capítulo TODO).

## Creando un proyecto en Mappy

Vamos a `File->New Map`, y rellenaremos el cuadro de diálogo que aparece con los datos de nuestro mapa. En el ejemplo, el mapa es de 5 pantallas de ancho y 5 de alto. Como cada pantalla tiene 15x10 tiles, eso significa que mi mapa será de 5 * 15 = 75 tiles de ancho y 5 * 10 = 50 tiles de alto. Además, nuestros tiles serán de 16 x 16 píxels. Por tanto, rellenamos estos datos sobre nuestro mapa en el cuadro de diálogo, dejando todo lo demás como estaba.

![Nuevo proyecto de Mappy](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c02-001.png)

Pulsamos OK y el programa nos dirá que deberíamos cargar un tileset. Aceptamos y vamos a hacerle caso. Vamos a `File->Import`, lo que nos abrirá un cuadro de diálogo de selección de archivo. Buscamos nuestro tileset preparado para Mappy (el `mappy.png` que preparamos en el primer paso) y lo cargamos. La ventana de Mappy debería mostrarse así:

![Tileset cargado en Mappy](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c02-002.png)

Por último, vamos a colocar unas guías que nos ayuden a saber dónde empieza y acaba cada pantalla. Para ello, nos vamos a `Maptools->Dividers`, marcamos la casilla Enable dividers y rellenamos en `Pixel gap X` y `Pixel gap Y` los valores 240 y 160, que son las dimensiones en pixels de cada pantalla. Pulsamos OK, y con esto estamos preparados para trabajar. Para empezar, grabamos el mapa en nuestro directorio `map` con el nombre `mapa.fmp`. Ahora sólo hay que ponerse a colocar tiles... Y acordarnos de grabar como `mapa.fmp` de cuando en cuando, por si las moscas.

![Un mapa en Mappy](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c02-003.png)

La forma de colocar cerrojos (para ser abiertos con llaves) es sencilla: símplemente poned el tile del cerrojo en el mapa, y el conversor los detectará y los almacenará aparte. Hay que tener cuidado con una cosa: **en esta versión los cerrojos deberían ir a ras de suelo (sobre una plataforma sobre la que podamos caminar), ya que el motor puede no detectarlos si el muñeco no está posado y con una coordenada "justa"**. Incluso en los juegos de vista genital:

![Un cerrojo](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c02-004.png)

## Exportando nuestro mapa

Para exportar nuestro mapa, sólo hay que irse a `File->Save As...` y salvarlo como `mapa.map`, especificando el `.map` de forma explícita, en el subdireoctorio `map`. 

## Importando nuestro mapa

El conversor para los mapas que viene por defecto en **MTE MK1** es `mapcnv.exe`. En `comp.bat` está la llamada al mismo, que probablemente deberemos modificar:

```cmd
	..\utils\mapcnv.exe ..\map\mapa.map mapa.h 5 5 15 10 15 packed  > nul
```

Los dos primeros parámetros indican las rutas de entrada y salida, en este caso `mapa.map` en el directorio `map` y `mapa.h` en el directorio actual (`dev`). Lo siguientes dos parámetros indican el **ancho** y el **alto** del mapa en pantallas; tendrás que poner los valores de tu mapa. Los dos siguientes indican las dimensiones de cada pantalla, que para **MTE MK1** siempre son 15 y 10. El siguiente dígito indica el tile que debe ser detectado como cerrojo, que debe ser siempre 15. El último parámetro `packed` indica que debe meter dos tiles en cada byte. Si tu mapa usa los 48 tiles, deberás omitirlo.

# Capítulo 3 - Sprites

Nuestro juego empleará 8 sprites para el personaje principal, 6 para definir 3 enemigos, y 2 más para definir una plataforma móvil u 8 para definir 4 enemigos en los juegos de vista cenital. Todos los sprites són de 16 x 16. El orden de estos sprites en nuestro *spriteset* dependerá si tenemos un juego de vista cenital o un juego de plataformas. Para las plataformas, será:

|#|Qué tiene
|---|---
|0|Personaje principal, derecha, andando, frame 1
|1|Personaje principal, derecha, andando, frame 2, o parado
|2|Personaje principal, derecha, andando, frame 3
|3|Personaje principal, derecha, en el aire
|4|Personaje principal, izquierda, andando, frame 1
|5|Personaje principal, izquierda, andando, frame 2, o parado
|6|Personaje principal, izquierda, andando, frame 3
|7|Personaje principal, izquierda, en el aire
|8|Enemigo tipo 1, frame 1
|9|Enemigo tipo 1, frame 2
|10|Enemigo tipo 2, frame 1
|11|Enemigo tipo 2, frame 2
|12|Enemigo tipo 3, frame 1
|13|Enemigo tipo 3, frame 2
|14|Plataforma móvil, frame 1
|15|Plataforma móvil, frame 2

Para los juegos de vista genital será:

|#|Qué tiene
|---|---
|0|Personaje principal, derecha, andando, frame 1
|1|Personaje principal, derecha, andando, frame 2
|2|Personaje principal, izquierda, andando, frame 1
|3|Personaje principal, izquierda, andando, frame 2
|4|Personaje principal, arriba, andando, frame 1
|5|Personaje principal, arriba, andando, frame 2
|6|Personaje principal, abajo, andando, frame 1
|7|Personaje principal, abajo, andando, frame 2
|8|Enemigo tipo 1, frame 1
|9|Enemigo tipo 1, frame 2
|10|Enemigo tipo 2, frame 1
|11|Enemigo tipo 2, frame 2
|12|Enemigo tipo 3, frame 1
|13|Enemigo tipo 3, frame 2
|14|Enemigo tipo 4, frame 1
|15|Enemigo tipo 4, frame 2

Además de esto habrá una serie de sprites extra de los que hablaremos más adelante.

Para crear nuestro *spriteset*, partiremos de una imagen vacía de 256 x 32 píxels. Tendremos una hilera con los sprites del personaje principal y sus máscaras, y otra justo debajo con los demás sprites, con sus máscaras. Las máscaras irán intercaladas, es decir, tendremos un sprite seguido de su máscara, seguido del siguiente sprite seguido de su máscara, y así sucesivamente. Para pintarlas podemos usar cualquier color. Yo, por ejemplo, he pintado los sprites en gris clarito y las máscaras en rojo para guiarme. El otro color, que indica "vacío", debe ser NEGRO PURO (RGB = 0, 0, 0) para que el conversor lo detecte sin problemas.

Aquí vemos dos *spritesets*, uno de vista genital y otro de vista lateral:

![Spriteset de vista genital (cheril)](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c03-001.png)

![Spriteset de vista lateral (lala)](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c03-002.png)

Grabaremos nuestro *spriteset* en `gfx` con nombre `sprites.png`.

## Importanto el *spriteset*

La importación se hace (en el caso más general y básico) con `sprcnv.exe`. Si abrimos `comp.bat` en `dev` veremos que la llamada es algo así:

```cmd
	..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h  > nul
```

Si hemos seguido las instrucciones no necesitarás tocar nada.

# Capítulo 4 - Pantallas fijas

En un juego de **MTE MK1** hay cuatro pantallas fijas. Una se almacena tal cual, en formato Spectrum: la pantalla de carga. Las otras tres se comprimen y forman parte del binario: se trata de la pantalla de título, el marco y la pantalla con la escena final. Cuanto más compleja sea una pantalla, más ocupará comprimida, por lo que una forma de liberar memoria es simplificar las pantallas que van en el binario.

Aunque sea obvio decirlo, las pantallas deben ocupar 256x192 pixels y respetar las restricciones del ZX Spectrum.

## La pantalla de carga

Si no modificas el paquete, la pantalla de carga se almacena como un archivo binario con formato Spectrum, esto es, 6912 bytes, por lo que no importa lo compleja o simple que sea. La pantalla de carga debe almacenarse en `gfx` como `loading.png`.

## La pantalla de título

La pantalla de título se presentará a modo de menú y sobre ella sonará la música de presentación. Deberían salir título, créditos y un menú con tres opciones 1: Keyboard, 2: Kempston, 3: Sinclair. Con algo sencillo nos vale, por ejemplo:

![Pantalla de título](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c04-001.png)

Esta pantalla debe guardarse en `gfx` como `title.png`.

## El marco

El marco se mostrará alrededor del área de juego mientras jugamos. Se utiliza para contener los marcadores. En el tendremos que hacer sitio para los diferentes valores del juego, dependiendo siempre de la configuración del motor. Los espacios donde van los marcadores numéricos deben estar alineados a carácter y dejar sitio para dos dígitos.

También tiene que haber espacio para la ventana de juego, igualmente alineado a carácter. Esta ventana ocupa 240x160 píxels (o 15x10 tiles). 

![Marco de juego](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c04-002.png)

Esta pantalla deber guardarse en `gfx` como `marco.png`.

## Título y marco

Para ahorrar memoria, **MTE MK1** permite juntar título y marco en una sola pantalla. El título y el menú se dibujarán dentro del area de juego, como se muestra.

![Título con marco](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c04-003.png)

Si eliges esta configuración, graba la pantalla de combinada de título y marco en `gfx` como `title.png` y deja `marco.png` en negro.

## La pantalla del final

La pantalla del final se mostrará cuando el jugador haya conseguido su objetivo final en el juego. Debe guardarse en `gfx` como `ending.png`. 

## Convirtiendo a formato Spectrum

Para ello, desde `comp.bat` se utiliza `png2scr.exe` y, en el caso de las tres imagenes que van en el binario, `apack.exe` para comprimirlas. Si utilizas otros nombres de archivo u otras ubicaciones tendrás que modificarlas las conversiones y compresiones en `comp.bat`.

# Capítulo 5 - Enemigos y *hotspots*

En este capítulo usaremos `ponedor.exe` para colocar en cada pantalla de nuestro juego hasta tres enemigos y un *hotspot*, que no es más que una casilla donde poner un objeto coleccionable o una llave, o donde aparecerán las recargas. Pero primero hablemos un poco sobre estos entes:

## Enemigos 

En **MTE_MK1** los enemigos también se refieren a las plataformas móviles. Los enemigos tienen asociados una serie de valores, entre ellos un **tipo**. Este tipo define el comportamiento y de forma indirecta el gráfico con el que se pinta:

### Lineales

Los enemigos con tipos 1, 2, 3 y 4 definen enemigos que describen trayectorias lineales. En los juegos con vista lateral, los de tipo 4 son las plataformas móviles. El tipo se corresponde con el orden del gráfico que se mostrará en el spriteset.

Cuando hablamos de trayectorias lineales tenemos dos posibles casos:

* **Horizontales y Verticales**: los enemigos van de un punto de inicio a un punto final describiendo una linea recta vertical u horizontal. El enemigo sigue esa línea imaginaria yendo y viniendo ad infinitum.

![Horizontal y vertical](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c05-001.png)

* **Diagonales**: los enemigos parecen rebotar en el rectángulo definido entre los puntos inicial y final si estos no están alineados vertical u horizontalmente:

![Horizontal y vertical](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c05-002.png)

### Voladores

Los enemigos con tipos 5 y 6 definen enemigos voladores, o *Fantys*, como los llamamos en Mojonia. Este tipo de enemigos persigue al jugador por la pantalla, con diferentes comportamientos configurables. No se puede usar tipos 5 y 6 simultaneamente, y tanto uno como otro hay que activarlos explícitamente pues no forman parte del core básico, como veremos.

* **Tipo 5**: Los enemigos de tipo 5 se crearon para **Zombie Calavera** y se conocen internamente como *Randown Respawn*. Su comportamiento es un tanto específico de este juego: aparecen si has matado alguno de los enemigos lineales de la pantalla. Se crean en un lugar aleatorio del borde de la pantalla y siguen al jugador si este no está *oculto* (colocado sobre un tile con comportamiento *oculta*).

* **Tipo 6**: Son muy parecidos pero aparecerán en el lugar de la pantalla donde los ubiques. Además, pueden configurarse para que o bien persigan al jugador siempre, o bien solo lo hagan si el jugador se acerca, volviendo a su posición inicial cual el jugador se "pierde de vista".

## Hotspots

Son, como hemos dicho, los puntos donde aparecen los objetos coleccionables, las llaves, o las recargas de vida. Se colocan en una casilla cada pantalla del mapa y llevan asociado un "tipo", que puede ser 1 (objetos) o 2 (llaves), o cualquier otro número si te encargas tú de gestionarlo mediante código *custom*.

## Preparando los materiales necesarios

Tendremos que copiar los materiales necesarios al directorio `/enems`. Necesitamos dos cosas: el mapa del güego en formato `MAP`, y el tileset del juego `work.png`. Por tanto, copiamos `/map/mapa.map` y `/gfx/work.png` en `/enems`. 

## Configuración de nuestro proyecto

Ponedor era originalmente una aplicación que, aunque tiene su interfaz gráfica, estaba pensada para ser lanzada desde la ventana de línea de comandos. Sin embargo, por petición popular, le he añadido un diálogo de entrada para que se pueda usar tal y como se usaba el viejo Colocador. Si estáis interesados en usarlo desde la ventana de línea de comandos, ejecutad el programa con e parámetro -h:

```
    $ ..\utils\ponedor.exe -h
    Edit an existing set:
    $ ponedor.exe file.ene

    Create new set:
    $ ponedor.exe new out=file.ene map=file.map tiles=file.png|bmp [adjust=n] size=w,h
                      [scrsize=w,h] [nenems=n] [x2]

    out           output filename
    map           map file (raw, headerless, 1 byte per tile, row order)
    tiles         tileset in png or bmp format.
    adjust        substract this number from every byte read from the map file. Def=0
    size          map size in screens
    scrsize       screen size in tiles. Def=16,12
    nenems        number of enemies per screen. Def=3
    x2            zoom x2 (hacky)
```

Cuando ejecutas el Ponedor sin parámetros (por ejemplo, haciendo doble click sobre `ponedor.bat` en `/enems`) aparecerá la pantalla principal en la que podemos cargar un proyecto existente o configurar uno nuevo. Como no tenemos un proyecto existente, crearemos uno nuevo rellenando las casillas del recuadro superior:

![Nuevo proyecto del "Ponedor"](https://github.com/mojontwins/MK1/blob/churrera_4/docs/images/c05-003.png)

1. `Map W` y `Map H` son el **ancho** y el **alto** de nuestro mapa **en pantallas**, o sea, las **dimensiones del mapa**. 

2. `Scr W` y `Scr H` son las **dimensiones de cada pantalla**, en **tiles**. Para todos los güegos de **MTE MK1** estos valores son 15 y 10.

3. `Nenems` es el número de enemigos máximo por pantalla. En un principio, para **MTE MK1** debe ser 3.

4. `Adjust` lo dejamos en 0 para esta versión de **MTE MK1**.

5. Donde pone `TS` tenemos que poner la ruta del archivo con el tileset, que debería ser `work.png` a secas si lo has copiado en `enems`, aunque puedes usar el botón `Find` para ubicarlo desde un explorador si no te apetece escribir 8 caracteres.

6. En `Map` hay que poner la ruta del archivo con el mapa, que debería ser `mapa.map` a secas si lo copiaste a `enems`. También puedes usar `Find`.

7. No te olvides de poner **el nombre de archivo de salida** en la casilla `Output`. Si no quieres tocar `compile.bat`, este nombre debe ser `enems.ene`.

En la parte inferior izquierda de la ventana hay un botón que pone `Size`. Puedes pulsarlo para que en vez de `Normal` salga `Double` y así el Ponedor se mostrará ampliado 2x y se verá mejor todo.

## Manejo básico del programa

En la vista principal aparece una rejilla con la pantalla actual. Puedes cambiar la pantalla que se muestra usando las teclas de los cursores. Es en esta vista donde pondremos los enemigos, dibujaremos sus trayectorias, y colocaremos los hotspots.

Aparte de esto, en la pantalla tenemos otras dos zonas, arriba y abajo:

### Indicadores

En la parte superior de la pantalla hay una serie de indicadores. De izquierda a derecha:

1. Coordenadas de la pantalla actual dentro del mapa (XP, YP).
2. Número actual de la pantalla (que será `YP * MAP_W + XP`).
3. `2b` o `3b` dependiendo si el archivo que estás editando es de formato antiguo o de formato nuevo, respectivamente. **Con la versión 4.0 de MTE MK1 necesitarás usar el modo `2b`**. Se puede convertir de formato pulsando `L`. Si ves `3b` **debes pusar `L` para que se muestre `2b`**.
4. Las coordenadas de la casilla sobre la que pasa el ratón, cuando está en el área de edición.

### Botonera

En la parte inferior hay una serie de botones:

1. `Save` (o la tecla `S`) guarda los cambios en el archivo de salida `enems.ene`. ¡Púlsalo a menudo!
2. `Exit` (o la tecla `ESC`) sirve para salir. El programa pedirá confirmación.
3. `Grid` (o la tecla `G`) activa o desactiva la rejilla.
4. `Reload` recarga los recursos (mapa y gráficos) desde disco, por si los has cambiado.
5. `H` exporta los enemigos como `enems.h` - *pero esto ya no se usa*, ya que la conversión se hace automáticamente en `comp.bat`.

## Grabando y cargando

Aunque no hayas puesto nada todavía, graba tu proyecto pulsando `Save`. Verás que en el directorio `/enems` aparecerá el archivo `enems.ene` que referenciaste en el diálogo inicial al crear el proyecto. Ahora cierra el Ponedor. Ahora vuelve a ejecutarlo pulsando sobre `ponedor.bat` en `/enems`.

Esta vez, en lugar de rellenar los valores, escribe `enems.ene` en el cuadro `Input` situado en el recuadro inferior que está etiquetado `Open existing` y haz click sobre el botón que pone `Load Existing`. Si todo sale bien, te debería volver a salir la primera pantalla del mapa.

![Cargando un proyecto existente](https://raw.githubusercontent.com/mojontwins/MK1/master/docs/wiki-img/c05-004.png)

Como mencionamos antes, sólo tenemos que preocuparnos de poner las cosas en el Ponedor y grabar el archivo `enems.ene` a menudo. `comp.bat` se encargará de hacer las conversiones necesarias y de meter los numeritos en el juego.

## Poniendo enemigos y plataformas

Para empezar veremos como colocar **enemigos lineales**. Empezaremos haciendo click sobre la casilla donde debe aparecer el enemigo; además servirá como uno de los límites de su trayectoria. Cuando hagamos esto, aparecerá un cuadro de diálogo donde deberemos introducir el **tipo del enemigo**. Recuerda que en el caso de enemigos lineales será un valor de 1 a 4, 4 para las plataformas en los güegos de vista lateral. Ponemos el numerito y pulsamos OK.

Ahora el programa espera que marquemos el final la trayectoria. Haremos click en la casilla correspondiente. Veremos como se nos muestra gráficamente la trayectoria y aparece un nuevo cuadro de diálogo algo más complejo:

![El atributo sirve para la velocidad de los enemigos lineales](https://raw.githubusercontent.com/mojontwins/MK1/master/docs/wiki-img/c05-005.png)

En **MTE MK1** sólo tendremos que rellenar el recuadro `Attr`. El valor introducido en `Attr` será el número de píxeles que avanzará el enemigo o plataforma por cada cuadro de juego. Estos valores, para que no haya problemas, deberían ser potencias de dos:  1, 2 o 4.

Una vez que hayamos puesto el numerico, pulsamos OK.

Para los enemigos **voladores** de tipo 6 sólo importa la casilla de inicio. La otra casilla da igual donde la pongas. Se suele poner en la casilla de al lado. Puedes dejar vacío el cuadro `Attr`, ya que no se usa tampoco.

Puedes poner un máximo de tres por pantalla (el programa no te dejará meter más). No tiene por que haber tres en cada pantalla, puedes tener pantallas con uno, con dos, o con ninguno.

Para **eliminar o editar** los valores de un enemigo que ya hayamos colocado, basta con hacer click sobre la casilla de inicio de la trayectoria (donde aparece el numerito que indica el tipo). Entonces nos aparecerá un cuadro de diálogo donde podremos cambiar su tipo o la velocidad o eliminarlo completamente.

## Poniendo hotspots

**Cada pantalla admite un único hotspot**. Eso significa que el número total de llaves y objetos necesarios para terminar el güego no puede exceder el número de pantallas. Para colocar el hotspot de la pantalla actual, simplemente **hacemos click con el botón derecho en la casilla donde queremos que aparezca** la llave o el objeto, con lo que haremos aparecer un pequeño cuadro de diálogo donde deberemos introducir el tipo.

Para editar o borrar un hotspot, simplemente haz click *con el botón derecho* sobre él para mostrar el diálogo de edición desde el que también te lo puedes cargar.

No todas las pantallas tienen por qué tener un hotspot. 

## Conversión e importación

La conversión se hace desde `comp.bat` empleando `ene2h.exe`:

```cmd
	..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
```

# Capítulo 6 - Configurando el güego

El comportamiento básico del juego se define en el archivo `config.h` que hay situado en `dev`. Luego podremos tunear mediante el scripting o el código inyectable de `custom.h`, pero hay que empezar por el principio. 

## Configuración general

En la primera sección configuramos el comportamiento general del juego: las dimensiones del mapa, la pantalla de inicio, la pantalla de final (si aplica), la posición del muñeco al inicio, el número de objetos que hay que recoger, etcétera.

```c
	//#define MODE_128K_DUAL				// Uses AY Routines in RAM1 if on 128K mode.
	//#define MIN_FAPS_PER_FRAME	2		// Limits the max # of fps to 50/N
```

* `MODE_128K_DUAL` permite detectar modelos de 128K y usar un player de música y efectos que use el chip AY ubicado en RAM1.

* `MIN_FAPS_PER_FRAME` coloca un limitador de frames. El valor que le asignes será el máximo número de frames que dejará pasar por cuadro de juego. El ZX Spectrum funciona a 50 fps, por lo que, por ejemplo, un valor de 2 limitaría el juego a 25 fps, y uno de 3 a 16.6 fps. Obviamente si hay mucha carga en una escena el frame rate del juego bajará. Esta directiva sólo coloca un límite superior para que las pantallas con poca acción no vayan mucho más rápidas.

Cualquiera de estas dos directivas hacen que se cree una tabla de 257 valores y que se añada una serie de estructuras de datos que pueden ocupar hasta 512 bytes.

```c
	#define MAP_W					5		//
	#define MAP_H					5		// Map dimmensions in screens
	#define TOTAL_SCREENS			25		// 
```

* `MAP_W` y `MAP_H` definen el tamaño del mapa en pantallas.  Deben ser los mismos valores que usas en `comp.bat` como parámetros de `mapcnv.exe` para convertir el mapa o los que introdujiste en `ponedor.exe` al crear el proyecto para `enems.ene`.

* `TOTAL_SCREENS`, en principio, debe valer `MAP_W * MAP_H`. Los valores están separados debido a oscuros manejes que se perdieron en el tiempo, ya que **actualmente no se usa**.

```c
	#define SCR_INICIO				12		// Initial screen
	#define PLAYER_INI_X			8		//
	#define PLAYER_INI_Y			5		// Initial tile coordinates
```

Estas directivas definen donde se empieza a jugar: 

* El número de pantalla `SCR_INICIO` se obtiene contando las pantallas en orden de lectura (de izquierda a derecha y de arriba a abajo) empezando por 0, que correspondería a la pantalla superior izquierda del mapa.

* `PLAYER_INI_X` y `PLAYER_INI_Y` son las coordenadas de inicio a nivel de tiles.

Todos estos valores los puedes obtener fácilmente navegando por `ponedor.exe` y moviendo el raton sobre las casillas del área de edición.

```c
	//#define SCR_FIN 				99		// Last screen. 99 = deactivated.
	//#define PLAYER_FIN_X			99		//
	//#define PLAYER_FIN_Y			99		// Player tile coordinates to finish game
```

Si activas `SCR_FIN` el juego terminará sólo si el jugador está en la pantalla indicada, en las coordenadas especificadas en `PLAYER_FIN_X` y `PLAYER_FIN_Y`, aunque no sabemos si esto funcionará bien porque, en 10 años, **no lo hemos usado NUNCA**.

Si comentas `SCR_FIN` no se tomarán en cuenta (que es lo que hemos hecho en cada uno de los juegos que hemos lanzado desde **Lala Prologue**).

```c
	#define PLAYER_NUM_OBJETOS		13		// Objects to get to finish game
	#define PLAYER_LIFE 			99		// Max and starting life gauge.
	#define PLAYER_REFILL			25		// Life recharge
```

* `PLAYER_NUM_OBJETOS` especifica cuantos hotspots de tipo 1 tendremos que coleccionar. Si no activamos el motor de scripting y `WIN_ON_SCRIPTING` (ver más adelante), ganaremos el juego tras coleccionar este número de objetos.

* `PLAYER_LIFE` es la cantidad de vida con la que empezamos a jugar, `PLAYER_REFILL` es cuánto se recarga la vida al coger una regarga. En esta versión de **MTE MK1** las recargas aparecen únicamente cuando hemos recogido una llave o un objeto coleccionable y volvemos a la misma pantalla.

```c
	#define LINEAR_ENEMY_HIT		1		// Amount of life to substract when normal enemy hits
	//#define FLYING_ENEMY_HIT		1		// Amount of life to substract when flying enemy hits
```

Estas dos directivas especifican cuánta vida restan los enemigos al colisionar con el jugador. Puedes especificar valores diferentes para enemigos lineales o enemigos voladores. Obviamente, `FLYING_ENEMY_HIT` solo valdrá de algo si activas algún tipo de enemigo volador (ver más abajo).

```c
	//#define ENABLE_CODE_HOOKS				// Hooks @ init, entering game, screen & loop @ custom.h
	//#define ENABLE_CUSTOM_ENEMS 			// Hooks for custom enemies @ custom.h
```

Estas dos directivas implican conocimientos más avanzados: sirven para activar los enganches generales y de enemigos custom en el archivo `custom.h`.

### Enganches generales `ENABLE_CODE_HOOKS`

Si activas `ENABLE_CODE_HOOKS`, algunas funciones de `custom.h` serán llamadas en puntos específicos de la ejecución del juego. Añadiendo código C a estas funciones podrás personalizar muchísimo el motor. Tienes un ejemplo genial de esto en el juego **Ramiro el Vampiro en el Misterio del Papiro**. Las funciones son:

* `void hook_system_inits (void);` se ejecuta una sola vez al finalizar la carga. Fue concebido para poder añadir código para comprobar claves de acceso o para crear sprites extra.

* `void hook_init_game (void);` se ejecuta cada vez que empezamos una nueva partida. Sirve para inicializar valores antes de empezar a jugar.

* `void hook_mainloop (void);` se ejecuta una vez cada cuadro de juego, justo antes de dibujarlo en pantalla.

* `void hook_entering (void);` se ejecuta una vez cada vez que entramos en la pantalla, cuando ya se ha dibujado el mapa e inicializado los enemigos y los hotspots, pero antes de que nada sea visible.

### Enganches de enemigos custom `ENABLE_CUSTOM_ENEMS`

Los enganches para enemigos custom permiten añadir tipos de enemigos o personalizar los que ya existen. Si activas `ENABLE_CUSTOM_ENEMS`, las siguientes funciones de `custom.h` serán llamadas en diferentes puntos de la gestión de enemigos:

* `void extra_enems_init (void);` se ejecuta durante la inicialización de los enemigos al entrar en cada pantalla. Se llama cuando se está inicializando el enemigo número `gpit`. Sus valores estarán en `malotes [enoffs + gpit]`, una estructura con estos campos:

```c
	typedef struct {
		unsigned char x, y; 				// Coordenadas
		unsigned char x1, y1, x2, y2; 		// Límites de trayectoria
		char mx, my; 						// Velocidad
		char t; 							// Tipo
	#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
		unsigned char life;					// Vida
	#endif
	} MALOTE;
```

Se debería identifica nuestro enemigo con `malotes [enoffs + gpit].t`, que contendrá el tipo, y realizar las inicializaciones necesarias.

* `void extra_enems_move (void);` se ejecuta cada vez que se actualiza cada enemigo. Aquí las variables de `malotes` están copiadas a variables globales:

```c
	unsigned char _en_x;
	unsigned char _en_y;
	unsigned char _en_x1;
	unsigned char _en_y1;
	unsigned char _en_x2;
	unsigned char _en_y2;
	signed char _en_mx;
	signed char _en_my;
	unsigned char _en_t;
	unsigned char _en_life;
```

Deberemos detectar nuestro tipo custom usando `_en_t`. Aquí podremos *mover* al enemigo modificando `_en_x` y `_en_y`. Asimismo, deberemos asignar el próximo cell de animación en `en_an_next_frame [enit]`.

* `void extra_enems_checks (void);` se ejecuta al final del bucle que actualiza los enemigos. Podemos añadir código en este punto, por ejemplo para comprobar la colisión con algún elemento que hayamos introducido en nuestros *customs*.

Aquí tenemos un ejemplo tonto de un enemigo que sólo "tirita" y cambia de frame cada cierto tiempo, sin moverse del sitio:

```c
	// (en custom.h)

	void extra_enems_init (void) {
		if (malotes [enoffs + gpit].t == 8) {
			malotes [enoffs + gpit].x = malotes [enoffs + gpit].x1;
			malotes [enoffs + gpit].y = malotes [enoffs + gpit].y1;
		}
	}

	void extra_enems_move (void) {		
		if (_en_t == 8) {
			_en_x = _en_x1 + half_life;
			en_an_next_frame [enit] = enem_cells [
				((frame_counter & 7) < 4) ? 2 : 3
			];
		}
	}

	void extra_enems_checks (void) {
		// Nada
	}

```

## Tipo de motor

### Directivas miscelaneas

```c
	#define DIRECT_TO_PLAY					// If defined, title screen is also the game frame.
	//#define DEACTIVATE_KEYS				// If defined, keys are not present.
	//#define DEACTIVATE_OBJECTS			// If defined, objects are not present.
	//#define ONLY_ONE_OBJECT				// If defined, only one object can be carried at a time.
	//#define DEACTIVATE_EVIL_TILE			// If defined, no killing tiles (behaviour 1) are detected.
	//#define EVIL_TILE_SIMPLE				// For side view, only hit from below.
	#define DEACTIVATE_EVIL_ZONE			// Zones kill you after a while. Read docs or ask na_th_an
	//#define EVIL_ZONE_FRAME_COUNT	8		// For countdown in an evil zone.
	//#define EVIL_ZONE_BEEPS_COUNT	32		// # of counts before killing
	//#define EVIL_ZONE_FREQ 		3 		// if defined to N kill every M^2 frames; N=M^2-1,  
	//#define EVIL_ZONE_CONDITIONAL 		// Active if scenery_info.evil_zone_active
	#define PLAYER_BOUNCES					// If defined, collisions make player bounce
	//#define PLAYER_FLICKERS 			 	// If defined, collisions make player flicker instead.
	//#define DEACTIVATE_REFILLS			// If defined, no refills.
	#define MAX_FLAGS				1		// Number of flags. For scripting and stuff.
	//#define PLAYER_DIZZY 					// The Hobbit
	#define ENEMIES_LIFE_GAUGE		3		// Amount of shots/hits needed to kill enemies.
```

* `DIRECT_TO_PLAY`: La activamos cuando compartimos título y marco en la misma pantalla.

* `DEACTIVATE_KEYS`: Si nuestro juego no usa llaves ni cerrojos, activamos esta directiva para ahorrar espacio.

* `DEACTIVATE_OBJECTS`: Si nuestro juego no usa objetos coleccionables, activamos esta directiva para ahorrar espacio.

* `ONLY_ONE_OBJECT`: Activa el modo en el que el jugador sólo puede llevar un objeto. Es el modo en el que funciona **Trabajo Basura**. Al recoger un objeto coleccionable, `player.objects` se pone a 1 y no podremos coger más. Cuando esto ocurra, `PLAYER_HAS_OBJECTS` en el script evaluará a "cierto". La única forma de liberar el objeto es desde código custom o en el script con `DEC OBJECTS 1`. Es tarea del jugador contabilizar los objetos en un flag. 

* `DEACTIVATE_EVIL_TILE`: Si nuestro juego no emplea tiles que matan, puedes ahorrar espacio activándola.

* `EVIL_TILE_SIMPLE`: Si estás en vista lateral y tus tiles que matan sólo lo harán si el jugador *cae* en ellos, activando esta directiva ahorrarás mucho espacio.

* `DEACTIVATE_EVIL_ZONE`: Si nuestro juego no emplea tiles de tipo 3, activamos esta directiva para ahorrar espacio. Los tiles de tipo 3 se introdujeron en **Ramiro el Vampiro** y restan vida si el jugador los toca. Si la variable `scenery_info.evil_kills_slowly` vale 1, no restarán vida hasta que se agote un contador. Se configuran con los parámetros:

    * `EVIL_ZONE_FRAME_COUNT`: Si `scenery_info.evil_kills_slowly` vale 1, cada cuantos cuadros de juego decrementamos el contador.
    
    * `EVIL_ZONE_BEEPS_COUNT`: Si `scenery_info.evil_kills_slowly` vale 1, valor inicial de este contador.

    * Si `scenery_info.evil_kills_slowly` vale 0 o se ha agotado el contador, la vida empezará a disminuir a razón de una unidad por frame, a menos que activemos `EVIL_ZONE_FREQ`, que debe contener un valor N = M^2 - 1, en cuyo caso se decrementará cara M^2 frames (esto es, 1 para cada 2 frames, 3 para cada 4 frames, 7 para cada 8 frames, 15 para cada 16 frames...).

    * Finalmente, si activamos `EVIL_ZONE_CONDITIONAL`, los tiles de tipo 3 sólo estarán activos si `scenery_info.evil_zone_active` vale 1.

* `PLAYER_BOUNCES`: El jugador rebota si le da un enemigo.

* `PLAYER_FLICKERS`: El jugador parpadea un par de segundos si le da un enemigo.

* `DEACTIVATE_REFILLS`: Desactivar las recargas.

* `MAX_FLAGS`: Debe definirse y valer al menos 1. Controla el número de flags para scripting y otros menesteres. Probablemente con 16 tendrás bastante para un juego de complejidad normal. Además, usar 16 o menos permite optimizar mucho el *bytecode* de los scripts, como describiremos más adelante.

* `PLAYER_DIZZY`: Se introdujo para **El Hobbit** y sólo funciona con `PLAYER_NO_INERTIA` en perspectiva genital.

* `ENEMIES_LIFE_GAUGE` especifica el número de veces que hay que darle con un disparo a un enemigo para matarlo.

### Monedas

Sirve para activar las monedas, que no son más que un tile específico del tileset que podemos recoger. Al hacerlo, se incrementará el valor de un flag. Se utilizan de manera muy diferente en los cuatro Ramiros y en la demo de Sir Ababol 2:

```c
	// Coins engine
	// ------------

	//#define USE_COINS						// Coin engine activated
	//#define COIN_TILE				13		// Coin is tile #X
	//#define COIN_BEH 				16 		// Detect coin by behaviour rather than tile nº
	//#define COIN_FLAG				1		// Coins are counted in flag #N
	//#define COINS_REFILL 			1		// If defined, add this to player.life
	//#define COIN_TILE_DEACT_SUBS	0		// Substitute with this tile if coins are OFF.
	//#define COINS_DEACTIVABLE				// Coins can be hidden.
	//#define COINS_SCRIPTING 				// Run script when player gets coin
	//#define COINS_PERSISTENT	 			// Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes
```

* `USE_COINS` activa el módulo de monedas.

* `COIN_TILE` indica qué tile de los 48 representa la moneda.

* `COIN_BEH` (opcional): Si se define, la detección de la moneda no se hará por el número de tile en `COIN_TILE`, sino sobre cualquier tile que tenga beh = 16. Cuidado, porque esto hace que el código no sea compatible con los tiles resbalosos. No se usa en ninguno de nuestros juegos, pero puede servir para tener variso tipos de "monedas".

* `COIN_FLAG`: Indica en qué flag se cuentan las monedas. Obviamente, este flag debe existir (el valor debe ser **menor** que el definido en `MAX_FLAGS`).

* `COINS_REFILL` (opcional): Si se define, se incrementa la vida del jugador en este valor cada vez que se recoge una moneda.

* `COIN_TILE_DEACT_SUBS`: Al recoger una moneda, se sustitiye por este tile.

* `COINS_DEACTIVABLE` (opcional): Si se define, las monedas pueden estar "ocultas" dependiendo del valor de `scenery_info.show_coins`. Si se modifica el valor (desde `custom.h` o usando `SHOW_COINS` o `HIDE_COINS` en el script), los cambios no serán visibles hasta que se vuelva a entrar en la pantalla (puedes hacer `REENTER` en el script o `on_pant = 0xff;` en tu código custom, o hacerlo desde una pantalla diferente a la que contiene las monedas).

* `COINS_SCRIPTING` (opcional): Si se define, se ejecuta la sección `PLAYER_GETS_COIN` del script cuando se recoge una moneda.

* `COINS_PERSISTENT` (opcional): Activa la persistencia para las monedas. Puedes y debes leer sobre la persistencia más adelante

### Juegos de pantallas fijas

El motor de pantallas fijas se ideó para el juego de **Johnny Límite** (que jamás llegó a completarse) y sirve para hacer arcades de pantalla fija. El avance a la siguiente pantalla puede hacerse desde código custom o desde scripting mediante el comando `NEXT_LEVEL`.

```c
	// Fixed screens engine
	// --------------------

	//#define FIXED_SCREENS					// If defined, you can't exit a screen running off an edge
	//#define SHOW_LEVEL_INFO				// If defined, show "LEVEL XX" before level start, XX=n_pant
	//#define SHOW_LEVEL_SUBLEVEL			// If defined, level # is XX/YY using y_map and x_map resp.
	//#define RESPAWN_REENTER 				// If you die, reenter screen. (redraw)
	//#define RESPAWN_SHOW_LEVEL			// Besides, show level info.
	//#define RESPAWN_FLICKER				// Start level flickering.
	//#define RESET_BODY_COUNT_ON_ENTER		// Reset body count when entering new screen
	//#define USE_SUICIDE_KEY
```

* `FIXED_SCREENS` activa el motor de pantallas fijas.

* `SHOW_LEVEL_INFO` (opcional): Muestra una pantalla con el texto `LEVEL XX` con XX el número de pantalla más uno antes de empezar cada pantalla.

* `SHOW_LEVEL_SUBLEVEL` (opcional): Debe utilizarse con `SHOW_LEVEL_INFP`. Utiliza la geometría del mapa (filas y columnas) para mostrar el número de nivel como `XX/YY`, con XX la columna e YY la fila de la pantalla actual.

* `RESPAWN_REENTER` (opcional): Recargar la pantalla actual al morir.

* `RESPAWN_SHOW_LEVEL` (opcional): Debe utilizarse con `RESPAWN_REENTER`. Vuelve a mostrar la pantalla de `LEVEL XX[/YY]`.

* `RESPAWN_FLICKER` (opcional): Empezar el nivel parpadeando.

* `RESET_BODY_COUNT_ON_ENTER` (opcional): Pone a 0 el contador de enemigos eliminados al entrar en cada pantalla. 

* `USE_SUICIDE_KEY` (opcional): Habilita la tecla "S" para suicidarse.

### Motor de cajas

Permite que el tile 14 del tileset pueda empujarse. En modo lateral, además, podemos activar el motor de cajas con gravedad, diseñado para el juego inconcluso de **Johnny Límite**.

```c
	// Boxes engine
	// ------------

	#define PLAYER_PUSH_BOXES 				// If defined, tile #14 is pushable
	//#define FALLING_BOXES					// If defined, boxes can fall off ledges.
	//#define FALLING_BOXES_SPEED 	4		// Boxes fall every nth frame.
	//#define ENEMIES_BLOCK_BOXES			// If defined, you can't push a box if it collides an enemy
	//#define BOXES_KILL_ENEMIES			// If defined, falling boxes can kill enemies.
	//#define BOXES_ONLY_KILL_TYPE 	1		// If defined, only enemies type N can be killed with boxes.
	//#define BOXES_KILL_PLAYER				// If defined, falling boxes can kill the player.
```

* `PLAYER_PUSH_BOXES` activa el motor de cajas empujables.

* `FALLING_BOXES`: Debe utilizarse con `PLAYER_PUSH_BOXES` y activa el motor de cajas empujables con gravedad.

* `FALLING_BOXES_SPEED`: Las cajas caen cada N frames.

* `ENEMIES_BLOCK_BOXES` (opcional): Si se definen, no puedes empujar cajas si hay enemigos en la casilla de destino.

* `BOXES_KILL_ENEMIES` (opcional): Debe utilizarse con `FALLING_BOXES`. Si se define, las cajas que caen sobre enemigos los matan.

* `BOXES_ONLY_KILL_TYPE` (opcional): Debe utilizarse con `BOXES_KILL_ENEMIS`. Si se define, las cajas sólo matan al tipo de enemigos especificado. Si no, a todos.

* `BOXES_KILL_PLAYER`  (opcional): Debe utilizarse con `FALLING_BOXES`. Si se define, las cajas que caen sobre el jugador lo matan.

### Motor de disparos

En esta versión de **MTE MK1** sólo funciona en vista lateral.

```c
	// Shooting behaviour (only side view!)
	// ------------------------------------

	//#define PLAYER_CAN_FIRE 				// If defined, shooting engine is enabled.
	//#define PLAYER_BULLET_SPEED 	8		// Pixels/frame. 
	//#define MAX_BULLETS 			3		// Max number of bullets on screen. Be careful!.
	//#define PLAYER_BULLET_Y_OFFSET	4	// vertical offset from the player's top.

	//#define FIRING_DRAINS_LIFE			// If defined, firing drains life (oi!)
	//#define FIRING_DRAIN_AMOUNT	2		// what to substract when firing.
```

* `PLAYER_CAN_FIRE` activa el motor de disparos.

* `PLAYER_BULLET_SPEED` define la velocidad de los proyectiles en pixels por frame.

* `MAX_BULLETS` define el máximo número de balas en pantalla. Hay que tener cuidado porque a más balas, menos velocidad y más memoria dinámica tendremos que reservar (ver al final de esta sección).

* `PLAYER_BULLET_Y_OFFSET`: número de píxels desde el borde superior del jugador desde el que se dispara la bala. Cuanto mayor sea, más abajo saldrá.

* `FIRING_DRAINS_LIFE` (opcional): si se define, disparar resta vida (como en **Cheril the Goddess**).

* `FIRING_DRAIN_AMOUNT`: Debe utilizarse con `FIRING_DRAINS_LIFE`, y define cuanta vida se resta con cada disparo.

Cada proyectil necesitará 5 bloques adicionales de memoria dinámica, por lo que habrá que añadir `MAX_BULLETS * 5` bloques a `NUMBLOCKS` en `churromain.c`. Ver más adelante la sección sobre memoria dinámica.

### La espada

**Sir Ababol 2** empezó como prototipo en **MTE MK1 v4**, aunque luego se desarrolló sobre un motor específico. Parte de los trabajos para apañar la versión 4.8 de **MTE MK1** ha tenido que ver con reintegrar los añadidos de la demo técnica de **Sir Ababol**, entre ellos la espada:

```c
	// Sword
	// -----

	//#define ENABLE_SWORD 					// Let the player swing a sword
	//#define SWORD_UP 						// Can hit upwards
	//#define SWORD_LINEAL_DAMAGE	0		// Damage to linear.
	//#define SWORD_FLYING_DAMAGE 	1		// Damage to flying.
	//#define SWORD_PARALYZES		32		// If defined, paralyze for N frames
	//#define SWORD_HIT_FRAME 		2		// Frame to render 0-3
	//#define SWORD_STAB 			3		// Rather than swing, stab at height N
	
```

* `ENABLE_SWORD` activa el motor de la espada.

* `SWORD UP` (opcional): permite dar un espadazo hacia arriba pulsando "arriba" junto con "fuego".

* `SWORD_LINEAL_DAMAGE`: Cantidad de vida que se resta a los enemigos lineales al golpearlos. Puede ser 0 para no causarles daño.

* `SWORD_FLYING_DAMAGE`: Cantidad de vida que se resta a los enemigos voladores al golpearlos. Puede ser 0 para no causarles daño.

* `SWORD_PARALYZES` (opcional): Si se define, la espada paralizará al enemigo que golpea durante N cuadros de juego.

* `SWORD_HIT_FRAME` usar este frame del jugador para la animación de golpear 0-3.

* `SWORD_STAB` apuñalar en lugar de balancear la espada. La espada sale recta a una altura de N pixels desde la parte superior del sprite del jugador.

Si queremos controlar a qué enemigos afectará la espada, podemos usar `PLAYER_MIN_KILLABLE` (ver más adelante).

### Tiles que se rompen

Si se activa este motor, los tiles de comportamiento `& 32` se podrán romper. Los tiles se rompen con un solo golpe de espada o un solo disparo, no hay posibilidad de configurar un número de golpes como en las versiones 3.99.x o 5.x+.

```c
	// Breakable
	// ---------

	//#define ENABLE_BREAKABLE 				// Enable breakable tiles (& 32)
	//#define MAX_BREAKABLE_FRAMES 	8 		// N = frames to display this tile:
	//#define BREAKABLE_BREAKING_TILE 45	// display this for N frames
	//#define BREAKABLE_ERASE_TILE 	0		// The substitute by this tile.
	//#define BREAKABLE_SPAWN_CHANCE  3 	// Must be a power of 2 - 1, ifdef there's a chance to spawn...
	//#define BREAKABLE_SPAWN_TILE    46 	// Throw this tile if rand() & chance == 1.
	//#define BREAKABLE_PERSISTENT 			// Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes.
```

* `ENABLE_BREAKABLE` activa el motor de tiles que se rompen.

* `MAX_BREAKABLE_FRAMES` cuantos cuadros de juego se muestra el tile "rompiéndose".

* `BREAKABLE_BREAKING_TILE` que tile del tileset representa el estado "rompiéndose".

* `BREAKABLE_ERASE_TILE` con qué tile borramos el tile una vez que han pasado `MAX_BREAKABLE_FRAMES` cuadros de juego.

* `BREAKABLE_SPAWN_CHANCE` (opcional): Si se define, el valor que se le asigna debe ser una potencia de 2 menos 1 "N". Al romper un tile, si `rand () & N == 1`, aparece un tile específico tras `MAX_BREAKABLE_FRAMES` en lugar de `BREAKABLE_ERASE_TILE`. Se diseñó para que apareciera una moneda, pero puedes poner cualquier cosa:

* `BREAKABLE_SPAWN_TILE`: Debe utilizarse con `BREAKABLE_SPAWN_CHANCE`: qué tile aparece si se cumple la condición de arriba.

* `BREAKABLE_PERSISTENT` (opcional): Activa la persistencia para los tiles que se rompen. Puedes y debes leer sobre la persistencia en la siguiente sección.

### Persistencia

La persistencia sirve para que los cambios realizados en el mapa (monedas recogidas o tiles destruidos) sean persistentes de forma que sigan ahí al volver a la pantalla. La persistencia se implementa usando un array de bits que ocupa 20 bytes por pantalla que se reserva justo por debajo de `AD_FREE`. Esto limitará en `20 * MAP_W * MAP_H` el tamaño máximo en bytes que puede ocupar tu juego. Cada vez que se modifica el mapa se levanta el bit correspondiente. Al entrar en las pantallas se consultan los bits de la pantalla en curso, y se modifican los tiles de los que estén levantados. La persistencia se activa automáticamente si definimos `COINS_PERSISTENT` o `BREAKABLE_PERSISTENT`, pero puede activarse a mano si la necesitamos desde nuestro código *custom*.

```c
	// Persistence
	// -----------

	//#define ENABLE_PERSISTENCE			// Turned on automaticly if needed, but you can do it manually
	//#define PERSIST_CLEAR_TILE 	0 		// Clear persistent bit this tile
```

* `ENABLE_PERSISTENCE` activa el motor de persistencia.

* `PERSIST_CLEAR_TILE` sustituye por este tile los tiles marcados de la pantalla al entrar.

Si queremos controlar la persistencia por nuestra cuenta, tenemos las siguientes funciones:

* `void persist (void)` marca como eliminado el tile (`_x`, `_y`) de la pantalla `n_pant`.

* `void draw_persistent (void)` dibuja el tile `PERSIST_CLEAR_TILE` sobre los tiles marcados como eliminados de la pantalla actual. Esta función se llama automáticamente al entrar en cada pantalla.

* `void clear_persistent (void)` elimina toda la persistencia almacenada. Se llama automáticamente al iniciar la partida.

### Frigoababol

Esta fue otra característica que se introdujo en la demo técnica de **Sir Ababol 2**: cuando un enemigo te toca, te deja congelado y no te puedes mover.

```c
	//#define ENABLE_FRIGOABABOL 			// Player can be frozen
	//#define FRIGO_MAX_FRAMES 		32		// # of frames to be frozen. Can be decreased via ...
	//#define FRIGO_UNFREEZE_TIME 			// state counter decreases automaticly.
	//#define FRIGO_UNFREEZE_FIRE 			// state counter decreases pressing fire. You can activate both
	//#define FRIGO_NO_FIRE 				// Can't fire nor swing your sword while frozen
	//#define FRIGO_FIGHT 					// Modify vx, vy while frozen when pressing fire.
	//#define FRIGO_ENEMIES_FREEZE 			// Enemies freeze the player on touch.
	//#define FRIGO_FROZEN_NO_RX 			// No PLAYER_RX while frozen!
```

* `ENABLE_FRIGOABABOL` activa el motor de Frigoababol.

* `FRIGO_MAX_FRAMES` congela al jugador durante este número de unidades.

* `FRIGO_UNFREEZE_TIME` (opcional): si se define, el contador de congelación disminuye automáticamente, una unidad por cuadro de juego.

* `FRIGO_UNFREEZE_FIRE` (opcional): si se define, el contador de congelación disminuye al pulsar la tecla de disparo. Esta directiva y `FRIGO_UNFREEZE_TIME` pueden definirse a la vez si se desea.

* `FRIGO_NO_FIRE` (opcional): si se define, el jugador no puede disparar ni dar espadazos mientras está congelado.

* `FRIGO_FIGHT` (opcional): si se define, al pulsar el botón de disparo se modifican levemente `player.vx` y `player.vy`, como si el jugador luchase por liberarse.

* `FRIGO_ENEMIES_FREEZE` (opcional): si se define, el jugador se congela cuando lo toca un enemigo.

* `FRIGO_FROZEN_NO_RX` (opcional): si se define, no se aplica rozamiento al movimiento horizontal del jugador mientras está congelado.

### Tiles resbalosos

```c
	//#define SLIPPERY_TILES 				// Tiles with beh & 16 are slippery.
```

* `SLIPPERY_TILES` activa el motor de tiles resbalosos en la vista lateral.

Si el jugador está sobre un tile con comportamiento `& 16`, se aplicarán los valores de `PLAYER_AX_SLIPPERY` o `PLAYER_RX_SLIPPERY` en lugar de `PLAYER_AX` y `PLAYER_RX`, por lo que se puede emplear también para suelos sobre los que se camine más lento.

### Enemigos voladores

Permite activar y configurar *fantys*.

```c
	//#define PLAYER_CAN_HIDE				// If defined, tile type 2 hides player.
	//#define RANDOM_RESPAWN				// If defined, automatic flying enemies spawn on killed enemies
	//#define USE_TYPE_6					// If defined, type 6 enemies are enabled.
	//#define USE_SIGHT_DISTANCE			// If defined, type 6 only pursue you within sight distance
	//#define SIGHT_DISTANCE		120		
	//#define FANTY_MAX_V 			256 	// Flying enemies max speed.
	//#define FANTY_A 				16		// Flying enemies acceleration.
	//#define FANTIES_LIFE_GAUGE	10		// Amount of shots needed to kill flying enemies.
	//#define MAKE_TYPE_6					// Create fanties for missing enemies if scenery_info.make_type_6
```

* `PLAYER_CAN_HIDE`: si se activa, los tiles de tipo 2 "ocultan" al jugador.

* `RANDOM_RESPAWN`: activa los *fantys* de tipo 5 que aparecen al eliminar enemigos lineales (no se colocan con `ponedor.exe`).

* `USE_TYPE_6`: activa los *fantys* de tipo 6 que se colocan con el ponedor (los *fantys* normales). **No es compatible con `RANDOM_RESPAWN`**.

* `USE_SIGHT_DISTANCE` (opcional), se usa con `USE_TYPE_6`, hace que los *fantys* sólo te persigan si estás a cierta distancia, y que si te alejas vuelvan a su posición inicial.

* `SIGHT_DISTANCE`, se usa con `USE_SIGHT_DISTANCE`, es a la distancia a la que ven los *fantys*.

* `FANTY_MAX_V` y `FANTY_A` definen la velocidad máxima y la aceleración de los *fantys*.

* `FANTIES_LIFE_GAUGE` dice cuánta vida tienen los *fantys*.

* `MAKE_TYPE_6` es un custom de **Ramiro 2**. Si se activa y `scenery_info.make_type_6` vale 1, se creará un *fanty* en lugar de cada enemigo *que no esté colocado* en cada pantalla. O sea, si en una pantalla hay por ejemplo 2 enemigos, aparecerá un tercero que será un *fanty*.

### Scripting

La forma original de *complicar* los juegos de **MTE MK1** era mediante un sencillo pero efectivo sistema de scripting. Activar este sistema nos permite programar comportamiento extra en un lenguaje muy sencillo que describiremos en el capítulo siguiente.

```c
	//#define ACTIVATE_SCRIPTING			// Activates msc scripting and flag related stuff.
	//#define WIN_ON_SCRIPTING				// Game can only be won using WIN GAME in the script
	//#define SCRIPTING_DOWN				// Use DOWN as the action key.
	//#define COUNT_KILLABLE_ON		2		// Count killable enemies on flag #N (per screen basis)
	//#define SCRIPTING_KEY_M				// Use M as the action key instead.
	//#define OBJECTS_ON_VAR		2		// If defined, only show objects if var # is set.
	//#define OBJECT_COUNT			3		// Defines which FLAG will be used to store the object count.
	//#define REENTER_ON_ALL_OBJECTS		// If set, re-enter screen when all objects are got, instead of ending
```

* `ACTIVATE_SCRIPTING` activa el motor de scripting.

* `WIN_ON_SCRIPTING` (opcional): la única forma de "ganar" el juego es ejecutar el comando `WIN GAME` desde el script.

* `SCRIPTING_DOWN` y `SCRIPTING_KEY_M` configuran qué tecla lanza las secciones `PRESS_FIRE` del script, "abajo" o `M`. 

* `COUNT_KILLABLE_ON` (opcional): duplica el valor de `player.killed` en un flag, para poder controlar el número de enemigos eliminados desde el script.

* `OBJECTS_ON_VAR` (opcional): si se define, sólo se pintarán los hotspot de tipo 1 (objetos coleccionables) si el flag correspondiente vale 1.

* `OBJECT_COUNT` (opcional): si se define, indica al motor qué flag utilizaremos para llevar el conteo manual de objetos en modo `ONLY_ONE_OBJECT`. El marcador de objetos se actualizará con el valor de este flag.

* `REENTER_ON_ALL_OBJECTS` (opcional): si se activa, y `WIN_ON_SCRIPTING` no está activada, cuando el jugador reune `PLAYER_NUM_OBJECTS` objetos, en lugar de finalizar la partida, se vuelve a entrar en la pantalla. De esta forma podemos poner una condición en `ENTERING SCREEN n` o en `ENTERING ANY` que a su vez llame a `WIN GAME` o haga cualquier otra cosa.

## Vista lateral o vista genital

Seleccionaremos vista lateral o vista genital si definimos o no esta directiva:

```c
	#define PLAYER_MOGGY_STYLE				// Enable top view.
```

### Vista genital

La vista genital está muy poco trabajada en **MTE MK1 v4**. Sólo podemos configurar unos cuantos parámetros y emplear unos cuantos motores.

```c
	//#define LOOK_AT_THE_CAMERA			// Use "walk down" cell if player is idle
	//#define PLAYER_NO_INERTIA				// Disable inertia
	//#define PLAYER_CONST_V		256		// Constant speed
```

* `LOOK_AT_THE_CAMERA`: si se define, el jugador mirará a la cámara si no se está pulsando ninguna dirección.

* `PLAYER_NO_INERTIA`: si se define, el jugador se mueve sin inercia, sino con una velocidad fija.

* `PLAYER_CONST_V`: se usa con `PLAYER_NO_INERTIA`, define la velocidad en 1/64 de pixels.

### Vista lateral

Además de todos los motores que hemos visto más arriba, podemos configurar el comportamiento básico de la vista lateral con esta colección de macros:

```c
	//#define PLAYER_HAS_JUMP 				// If defined, player is able to jump.
	//#define FIRE_TO_JUMP 					// Jump using the fire button, only if no PLAYER_CAN_FIRE
	//#define BOTH_KEYS_JUMP				// Jump using UP *or* FIRE, beware, deact if PLAYER_CAN_FIRE!
	//#define RAMIRO_HOP 					// press jump when reaching a type 4 platform to jump again 
	//#define RAMIRO_HOVER 					// press down to hover
	//#define PLAYER_HAS_JETPAC 			// If defined, player can thrust a vertical jetpac
	//#define JETPAC_DRAINS_LIFE			// If defined, flying drains life.
	//#define JETPAC_DRAIN_RATIO	3		// Drain 1 each X frames.
	//#define JETPAC_DRAIN_OFFSET	8		// Drain after X frames.
	//#define PLAYER_KILLS_ENEMIES		  	// If defined, stepping on enemies kills them
	//#define PLAYER_MIN_KILLABLE 	3		// Only kill enemies with id >= PLAYER_MIN_KILLABLE
```

* `PLAYER_HAS_JUMP`: el jugador puede saltar pulsando "arriba".

* `FIRE_TO_JUMP`: se usa con `PLAYER_HAS_JUMP` para saltar pulsando el botón de disparo en vez de "arriba".

* `BOTH_KEYS_JUMP`: se usa con `PLAYER_HAS_JUMP` para saltar con el botón de disparo o pulsando "arriba". **Si activas esta, desactiva la anterior**.

* `RAMIRO_HOP`: se usa con `PLAYER_HAS_JUMP`. Si mientras estás saltando alcanzas una plataforma (tile con comportamiento `& 4`) el jugador podrá saltar de nuevo si estás pulsando el botón de salto aunque no estés completamente sobre la plataforma.

* `RAMIRO_HOVER`: Si se pulsa "abajo" mientras se cae, el jugador revolotea. En lugar de `PLAYER_MAX_VY_CAYENDO` y `PLAYER_G` se emplean `PLAYER_MAX_VY_CAYENDO_H` y `PLAYER_G_HOVER`. Si se emplean valores mayores en las variantes "hover" que en las normales, se puede conseguir el efecto contrario: caer "con más peso".

* `PLAYER_HAS_JETPAC`: Pulsar "arriba" para volar. Puede combinarse con el salto, pero debe configurarse otro botón. El jetpac se configura con las siguientes directivas:

    * `JETPAC_DRAINS_LIFE`: Volar quita vida.
    * `JETPAC_DRAIN_RATIO`: Se drena cada N cuadros de juego. 
    * `JETPAC_DRAIN_OFFSET`: Se empieza a drenar tras N cuadros de juego.

* `PLAYER_KILLS_ENEMIES`: Se puede saltar sobre los enemigos para matarlos.

* `PLAYER_MIN_KILLABLE`: se usa con `PLAYER_KILLS_ENEMIES` o con `ENABLE_SWORD`: Solo matar a los enemigos con id >= a este valor.

## Configuración de la pantalla

Estas directivas controlan la ubicación del area de juego y de los marcadores. En el caso de los marcadores, si se comentan las directivas que definen la ubicación no se pintará el marcador correspondiente.

```c
	#define VIEWPORT_X				0		//
	#define VIEWPORT_Y				2		// Viewport character coordinates
```

* `VIEWPORT_X`, `VIEWPORT_Y` controla la ubicación del área de juego.

```c
	#define LIFE_X					30		//
	#define LIFE_Y					8		// Life gauge counter character coordinates
	//#define DRAW_HI_DIGIT	
	//#define LIFE_H_X 				1
	//#define LIFE_H_Y				8

	#define OBJECTS_X				30		//
	#define OBJECTS_Y				12		// Objects counter character coordinates
	//#define OBJECTS_ICON_X		2		// 
	//#define OBJECTS_ICON_Y		21		// Objects icon character coordinates (use with ONLY_ONE_OBJECT)

	#define KEYS_X					30		//
	#define KEYS_Y					16		// Keys counter character coordinates

	//#define SHOW_KILLED
	//#define SHOW_TOTAL
	//#define KILLED_X				20		//
	//#define KILLED_Y				21		// Kills counter character coordinates

	// Use this to show tile = ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1 at coordinates
	// ITEM_SHOW_X, ITEM_SHOW_Y.

	//#define PLAYER_SHOW_ITEM				// If defined, current item is shown (scripting needed)
	//#define ITEM_IN_FLAG			4		// Which flag is used to store current item.
	//#define ITEM_FIRST_TILE		17		// First tile in tileset representing an object
	//#define ITEM_SHOW_X			2		//
	//#define ITEM_SHOW_Y			21		// Position

	//#define COINS_X 				12 		// Coins coint character coordinates
	//#define COINS_Y				23

	//#define EVIL_GAUGE_X			21		// For evil zone counters
	//#define EVIL_GAUGE_Y			23
```

* `LIFE_X`, `LIFE_Y` controlan la posición del marcador de vida. Si se define `DRAW_HI_DIGIT` se puede pintar el dígito de las centenas en la coordenada `LIFE_H_X`, `LIFE_H_Y`.

* `OBJECTS_X` y `OBJECTS_Y` controlan la posición del marcador de objetos recogidos. En modo `ONLY_ONE_OBJECT`, `OBJECTS_ICON_X`, `OBJECTS_ICON_Y` controlan la posición donde se pinta el icono del objeto para marcar que lo llevamos.

* `KEYS_X`, `KEYS_Y` controlan la posición del marcador de llaves.

* Si se define `SHOW_KILLED` se muestra el número total de enemigos eliminados en `KILLED_X`, `KILLED_Y`. Si además se muestra `SHOW_TOTAL` se muestra además el total.

* `PLAYER_SHOW_ITEM`: Al activarla, si usamos scripting, podemos definir una flag para representar que llevamos un objeto:
    * `ITEM_IN_FLAG`: qué flag contiene el objeto que llevamos.
    * `ITEM_FIRST_TILE`: el tile que se pintará será `ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1`.
    * `ITEM_SHOW_X`, `ITEM_SHOW_Y` controla la posición donde se dibuja el tile.

* `COINS_X`, `COINS_Y` controla donde se muestran las monedas.

* `EVIL_GAUGE_X`, `EVIL_GAUGE_Y` controlan donde se muestra el contador decreciente antes de que los tiles "evil zone" empiecen a quitar vida.

### Linea de texto

El comando `TEXT` del script puede mostrar un texto corto en el marcador. La posición y el color del texto se configuran con estas directivas:

```c
	//#define LINE_OF_TEXT			23
	//#define LINE_OF_TEXT_X		1
	//#define LINE_OF_TEXT_SUBSTR	2
	//#define LINE_OF_TEXT_ATTR 	7	
```

El texto tendrá `32 - LINE_OF_TEXT_SUBSTR` caracteres de ancho y se imprimirá con el atributo de color `LINE_OF_TEXT_ATTR` en las coordenadas (`LINE_OF_TEXT_X`, `LINE_OF_TEXT`).

Si no se va a usar `TEXT` desde scripting es mejor dejar toda esta sección comentada.

## Efectos miscelaneos y formato de mapa

Las siguientes directivas controlan aspectos relacionados con cómo se interpretan los datos del mapa, qué forma tiene, y cómo se dibuja. 

```
	//#define USE_AUTO_SHADOWS				// Automatic shadows made of darker attributes
	//#define USE_AUTO_TILE_SHADOWS			// Automatic shadows using specially defined tiles 32-47.
	//#define UNPACKED_MAP					// Full, uncompressed maps. Shadows settings are ignored.
	//#define COLUMN_MAP 					// Do not check horizontal screen flicks
	//#define ROW_MAP 						// Do not check vertical screen flicks
	//#define NO_ALT_BG						// No alternative tile 19 for bg = 0
	#define NO_MAX_ENEMS					// Less than 3 enems in some screens
	//#define TWO_SETS						// If defined, two sets of tiles. Second set is activated if
	//#define TWO_SETS_REAL 				// Tiles have their real value in map_buff
	//#define TWO_SETS_CONDITION	(n_pant>14?32:0)	// Must return 32 if second tileset is active, 0 otherwise.
```

* `USE_AUTO_SHADOWS` utiliza atributos para dibujar sombras que los tiles obstáculo (`& 8`) proyectan sobre los tiles traspasables. Para usar con juegos que usen mapas de 16 tiles.

* `USE_AUTO_TILE_SHADOWS` utiliza la última fila de tiles del tileset para componer las sombras, como se vio en el capítulo 1. Esta opción y la anterior son excluyentes y hacen que el render sea más lento y ocupe bastante más.

* `UNPACKED_MAP` actívala si usas 48 tiles en el mapa. Además, tendrás que modificar `comp.bat` para que no se incluya el parámetro `packed` en la llamada a `mapcnv.exe`.

* `COLUMN_MAP` actívala y no se comprobarán las conexiones laterales entre pantallas aunque intentes salir por la izquierda o por la derecha.

* `ROW_MAP` idem, pero con las conexiones verticales.

* `NO_ALT_BG`: si se define, en modo de mapas de 16 tiles, hace que el tile 0 no se sustituya al azar por el 19 como decoración.

* `NO_MAX_ENEMS`: si todas las pantallas de tu juego tienen los 3 enemigos, comenta esta directiva para ahorrar bastante espacio.

* `TWO_SETS` y `TWO_SETS_REAL` permiten usar dos tilesets de 16 tiles. El mapa sigue codificando sólo 16 tiles, pero puedes elegir si se dibuja usando la primera o la última fila del tileset según la condición definida en `TWO_SETS_CONDITION`. Esta condición puede ser cualquier expresión o incluso llamar a una función *custom*. 

La diferencia entre `TWO_SETS` y `TWO_SETS_REAL` es que la primera sólo introduce valores de 1 a 16 en `map_buff` (el buffer de pantalla) y la segunda introduce los valores *reales* de los tiles que se pintan (1 a 16 o 32 a 47 dependiendo de la pantalla).

## Configuración del movimiento

El movimiento del personaje se puede descomponer en su componente vertical, y su componente horizontal. Ambas componentes se comportan como Movimientos Rectilíneos Uniformemente Acelerados, es decir, que en ambos se maneja su posición, su velocidad, y su aceleración. El motor tiene una resolucioón de 64avos de píxel, por lo que, para calcular el valor en píxels, habrá que dividir los valores que aparecen en el motor por 64. Los valores funcionan por separado (vertical/horizontal) en los juegos de plataformas. En los juegos de vista cenital, los valores de la sección horizontal funcionan en ambos ejes. 

```c
	// IV.1. Vertical movement. Only for side-view.

	#define PLAYER_MAX_VY_CAYENDO	512 	// Max falling speed (512/64 = 8 pixels/frame)
	#define PLAYER_G				32		// Gravity acceleration (32/64 = 0.5 píxeles/frame^2)

	#define PLAYER_MAX_VY_CAYENDO_H 256		// For RAMIRO_HOVER
	#define PLAYER_G_HOVER 			4

	#define PLAYER_VY_INICIAL_SALTO 64		// Initial junp velocity (64/64 = 1 píxel/frame)
	#define PLAYER_MAX_VY_SALTANDO	320 	// Max jump velocity (320/64 = 5 píxels/frame)
	#define PLAYER_INCR_SALTO		48		// acceleration while JUMP is pressed (48/64 = 0.75 píxeles/frame^2)

	#define PLAYER_INCR_JETPAC		48		// Vertical jetpac gauge
	#define PLAYER_MAX_VY_JETPAC	384 	// Max vertical jetpac speed

	// IV.2. Horizontal (side view) or general (top view) movement.

	#define PLAYER_MAX_VX			256 	// Max velocity (192/64 = 3 píxels/frame)
	#define PLAYER_AX				32		// Acceleration (24/64 = 0,375 píxels/frame^2)
	#define PLAYER_RX				24		// Friction (32/64 = 0,5 píxels/frame^2)

	#define PLAYER_AX_SLIPPERY 		8
	#define PLAYER_RX_SLIPPERY 		8
```

### Caída

Empecemos configurando la componente vertical. En todo momento, si no hay nada que detenga nuestra caída, el jugador caerá. Esto significa que a su velocidad vertical (vy) se le añade una aceleración constante: la gravedad (g). Para que esto no se vaya de madre, esta velocidad tiene un límite superior. Es lo que definimos en las dos primeras constantes `PLAYER_MAX_VY_CAYENDO` y `PLAYER_G`.

El el caso de activar `RAMIRO_HOVER`, si pulsamos "abajo" se apicarán las constantes `PLAYER_MAX_VY_CAYENDO_H` y `PLAYER_G_HOVER` en su lugar.

Según está definido, en cada frame se añadirá 32 a la velocidad vertical hasta alcanzar un máximo de 512. Esto significa que, cada frame, el muñeco caerá 0.5 píxeles por frame más rápido hasta llegar a una velocidad máxima de 8 píxels por frame. Cuanto menores sean estos valores, menor parecerá la gravedad. Por ejemplo, para simular la gravedad de la luna, en la que se cae despacito, podemos usar valores 128 y 8, respectivamente.

## Salto

Las siguientes constantes también modifican el comportamiento de la componente vertical del movimiento, pero esta vez al saltar. Al pulsar el botón de salto, en primer lugar la velocidad vertical se establece a un valor inicial negativo (para que el muñeco suba), y mientras lo tengamos pulsado, durante un máximo de 8 frames, la magnitud de este valor irá aumentando otro valor fijo, hasta que se alcance una magnitud máxima o bien se agoten esos 8 frames (lo que ocurra primero). Estos valores se definen en las siguientes constantes, `PLAYER_VY_INICIAL_SALTO`, `PLAYER_MAX_VY_SALTANDO` y `PLAYER_INCR_SALTO`.

Según estos valores, cuando el jugador pulse el botón de salto, el muñeco tomará una velocidad vertical de -64. Mientras se siga pulsando el botón, esta velocidad irá decrementando a razón de 48 píxels/frame cada frame, hasta que se deje de pulsar la tecla, pasen 8 frames, o la velocidad llegue a -320. En píxels, la velocidad inicial del salto será de -1 píxel por frame, decrementará 0.75 píxels por frame cada frame, hasta que se despulse SALTO, pasen 8 frames, o la velocidad sea igual a -5 píxels por frame.

Hay que probar y configurar los valores de gravedad y de salto conjuntamente, pues unos afectan a los otros. Una gravedad baja, que haga caer al personaje lentamente, no se llevará demasiado bien con unos valores altos en el salto, que prácticamente harán volar a nuestro personaje.

## Componente horizontal

Lo siguiente es configurar la componente horizontal del movimiento. Funciona del siguiente modo: si pulsamos "izquierda" o "derecha", la velocidad horizontal se incrementa con una aceleración ax hasta llegar a una velocidad máxima. Si dejamos de pulsar, nos iremos frenando con una fricción fx hasta pararnos. 

Lo configuramos en las siguientes tres constantes, `PLAYER_MAX_VX`, `PLAYER_AX` y `PLAYER_RX`.

Según el ejemplo, la velocidad horizontal máxima será de 192, o lo que es lo mismo, 3 píxels por frame. Mientras pulsemos una tecla, aceleraremos a razón de 0,375 píxels por frame cada frame (valor 24), y al dejar de pulsarla, deceleraremos a razón de 0,5 píxels por frame cada frame (valor 32). Esto se hace para que el muñeco se pare más rápido. Usando valores menores de AX y RX (sobre todo de RX), podemos simular que el personaje resbala sobre el hielo o se mueve en entornos de poca fricción. Combinando valores bajos de gravedad y valores bajos de aceleración y fricción podríamos simular, por ejemplo, el movimiento bajo el agua.

En los juegos de vista cenital, como hemos dicho, se aplican estos últimos valores para ambos ejes.

## Comportamiento de los tiles

## Memoria dinámica para sprites

Activar el motor de disparos o la espada precisa añadir más sprites. Los sprites necesitan un pool de memoria dinámica que se reserva a partir de la dirección `AD_FREE`. La cantidad de memoria para sprites que se reserva se controla con `NUMBLOCKS`, que define el número de bloques para sprites que se va a reservar.

Dependiendo del tamaño de los sprites, necesitarán más o menos bloques. Los sprites de 16x16 necesitan 10 bloques cada uno, y los de 8x8 necesitan 5. La fórmula es:

1 + ((alto / 8) + 1) * ((ancho / 8) + 1)

Si no activas disparos ni espada, el motor sólo controlará sprites para el jugador y los tres enemigos, en total 4 sprites de 16x16, por eso al principio de `churromain.c` vemos esta linea:

```c
	#define NUMBLOCKS 		40
```

Por cada bala que haya en el juego (en total `MAX_BULLETS`) deberás añadir 5 más. Para tres balas, por tanto, el valor debería ser:

```c
	#define NUMBLOCKS 		55
```

Si en cambio activas la espada, sólo hará falta un sprite más de 8x8, por lo tanto:

```c
	#define NUMBLOCKS 		45
```

En algunos juegos se añade más sprites de forma *custom*, como en **Ramiro 4** (el objeto que lleva). En este caso tendríamos los 4 sprites base más uno más de 16x16, que serían 10 bloques más:

```c
	#define NUMBLOCKS 		50
```
