# MTE MK1 v4

Copyleft 2010-2013, 2020-2021 by The Mojon Twins

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

![Tileset](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c01-001.png)

Vayas a utilizar 16 o 48 tiles para el mapa, hay algunos tiles especiales, a saber, y contando los tiles de 0 a 47:

* El tile 14 (el penúltimo de la primera fila) será la *caja empujable* si las activas. Si no puedes usarlo normalmente.
* El tile 15 (el último de la primera fila) será el *tile cerrojo*, si activas las llaves. Se trata de un obstáculo que desaparecerá si lo tocamos lateralmente llevando una llave.
* El tile 16 (el primero de la segunda fila) será la recarga de vida, que en esta versión de **MTE MK1** aparecerá si hemos recogido un objeto o una llave y volvemos a la pantalla.
* El tile 17 (el segundo de la segunda fila) representará los *objetos coleccionables* si están activos. Si no, puedes usarlo normalmente.
* El tile 18 (el tercero de la segunda fila) representará las *llaves* si están activas. Si no, puedes usarlo normalmente.
* El tile 19 (el cuarto de la segunda fila) representará un tile alternativo por el que se sustituirá el tile 0 de forma aleatoria, para hacer bonito. Esto también se puede desactivar, en cuyo caso puedes usarlo normalmente.

## `ts2bin.exe` y los colores del Spectrum

Los tilesets se convierten con la herramienta `ts2bin.exe`. **MTE MK1** espera que queden en `dev/tileset.bin`, por lo que, si abres `comp.bat` con tu editor de textos, verás que la llamada es:

```cmd
    ..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
```

`ts2bin.exe` necesita también un archivo png de 256x16 con la fuente del juego. El cuarto parámetro (un número) es la tinta por defecto que se emplea si un cuadro de 8x8 tiene un solo color. Si se pasa "-1", el conversor elegirá blanco para los colores oscuros o negro para los claros.

La forma de detectar los colores del Spectrum tiene ciertas particularidades. Los colores serán detectados a partir de valores R, G o B mayores o iguales de 128, con un nivel mayor o igual que 192 para los colores sin brillo y mayor o igual a 240 para los colores con brillo.

**MTE MK1 v4** no soporta flash, pero puede utilizar el bit 7 del atributo (el de flash) para hacer algo muy interesante: las celdas con este bit a 1 no mostrarán sprites sobre ellas, con lo que parecerá que los sprites pasan *por detrás* de estos cuadros. Para que el conversor levante el bit 7 hay que utilizar valores diferentes para R, G o B: entre 128 y 159 para colores sin brillo y entre 160 y 191 para colores con brillo.

Para guiarte puedes usar esta plantilla. Los colores de arriba representan a los colores del Spectrum sin y con BRIGHT. Las dos filas de abajo representan esos mismos colores pero harán que el conversor levante el bit 7.

![Colores para el conversor](https://github.com/mojontwins/MK1v4/blob/master/docs/images/colours.png)

Por último, si vas a usar esta funcionalidad tendrás que linkar contra `splib2f` en lugar de `splib2` modificando la linea que llama a `zcc` en `comp.bat`:

```cmd
    zcc +zx -vn churromain.c -o %game%.bin -lsplib2f -zorg=24200  > nul
```

## El tileset para mappy

Mappy tiene su historia y necesita que el primer tile sea completamente negro. En esta versión de **MTE MK1** tendrás que generar un segundo tileset específico para Mappy con el primer tile negro si el primer tile no lo es. Puedes grabarlo como `mappy.png` en `gfx`.

![Tileset para Mappy](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c01-002.png)

## Sombras automáticas

Si utilizas el modo de mapeado que sólo emplea los primeros 16 tiles, puedes activar un modo de "autosombreado", en el que el motor calcula sombras automáticamente.  Básicamente, el motor sombrea automáticamente los tiles de tipo “fondo” que haya al lado de los tiles de tipo “obstáculo”, creándose así más sensación de 3D, como en Cheril Perils:

![Cheril Perils](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c01-003.png)

Para esto, el motor necesita que la última fila de tiles contenga una réplica de los tiles “fondo” del tileset, pero sombreados, así:

![Tileset de Cheril Perils](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c01-004.png)

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

![Nuevo proyecto de Mappy](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c02-001.png)

Pulsamos OK y el programa nos dirá que deberíamos cargar un tileset. Aceptamos y vamos a hacerle caso. Vamos a `File->Import`, lo que nos abrirá un cuadro de diálogo de selección de archivo. Buscamos nuestro tileset preparado para Mappy (el `mappy.png` que preparamos en el primer paso) y lo cargamos. La ventana de Mappy debería mostrarse así:

![Tileset cargado en Mappy](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c02-002.png)

Por último, vamos a colocar unas guías que nos ayuden a saber dónde empieza y acaba cada pantalla. Para ello, nos vamos a `Maptools->Dividers`, marcamos la casilla Enable dividers y rellenamos en `Pixel gap X` y `Pixel gap Y` los valores 240 y 160, que son las dimensiones en pixels de cada pantalla. Pulsamos OK, y con esto estamos preparados para trabajar. Para empezar, grabamos el mapa en nuestro directorio `map` con el nombre `mapa.fmp`. Ahora sólo hay que ponerse a colocar tiles... Y acordarnos de grabar como `mapa.fmp` de cuando en cuando, por si las moscas.

![Un mapa en Mappy](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c02-003.png)

La forma de colocar cerrojos (para ser abiertos con llaves) es sencilla: símplemente poned el tile del cerrojo en el mapa, y el conversor los detectará y los almacenará aparte. Hay que tener cuidado con una cosa: **en esta versión los cerrojos deberían ir a ras de suelo (sobre una plataforma sobre la que podamos caminar), ya que el motor puede no detectarlos si el muñeco no está posado y con una coordenada "justa"**. Incluso en los juegos de vista genital:

![Un cerrojo](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c02-004.png)

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

![Spriteset de vista genital (cheril)](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c03-001.png)

![Spriteset de vista lateral (lala)](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c03-002.png)

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

![Pantalla de título](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c04-001.png)

Esta pantalla debe guardarse en `gfx` como `title.png`.

## El marco

El marco se mostrará alrededor del área de juego mientras jugamos. Se utiliza para contener los marcadores. En el tendremos que hacer sitio para los diferentes valores del juego, dependiendo siempre de la configuración del motor. Los espacios donde van los marcadores numéricos deben estar alineados a carácter y dejar sitio para dos dígitos.

También tiene que haber espacio para la ventana de juego, igualmente alineado a carácter. Esta ventana ocupa 240x160 píxels (o 15x10 tiles). 

![Marco de juego](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c04-002.png)

Esta pantalla deber guardarse en `gfx` como `marco.png`.

## Título y marco

Para ahorrar memoria, **MTE MK1** permite juntar título y marco en una sola pantalla. El título y el menú se dibujarán dentro del area de juego, como se muestra.

![Título con marco](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c04-003.png)

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

![Horizontal y vertical](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c05-001.png)

* **Diagonales**: los enemigos parecen rebotar en el rectángulo definido entre los puntos inicial y final si estos no están alineados vertical u horizontalmente:

![Horizontal y vertical](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c05-002.png)

### Voladores

Los enemigos con tipos 5 y 6 definen enemigos voladores, o *Fantys*, como los llamamos en Mojonia. Este tipo de enemigos persigue al jugador por la pantalla, con diferentes comportamientos configurables. No se puede usar tipos 5 y 6 simultaneamente, y tanto uno como otro hay que activarlos explícitamente pues no forman parte del core básico, como veremos.

#### Tipo 5, *Random Respawn*

Los enemigos de tipo 5 se crearon para **Zombie Calavera** y se conocen internamente como *Randown Respawn*. Su comportamiento es un tanto específico de este juego: aparecen si has matado alguno de los enemigos lineales de la pantalla. Se crean en un lugar aleatorio del borde de la pantalla y siguen al jugador si este no está *oculto* (colocado sobre un tile con comportamiento *oculta*). Puedes forzar a que aparezcan desde el principio si los colocas en cualquier parte de la pantalla (aparecerán igualmente desde el borde).

Este es su comportamiento, a nivel interno:

* El tipo (colocado) es el 5. Si se detecta un enemigo tipo 5 en alguna pantalla, al entrar en la misma se "auto mata" (levantándoles el bit 4).

* Al entrar en cada pantalla, los tres `en_an_fanty_activo` se ponen a 0.

* Durante el game loop, 

    * Si `en_an_fanty_activo` vale 0, el enemigo correspondiente está muerto, y se cumple que `(rand () & 31) == 1`, se pone `en_an_fanty_activo` a 1 y se inicializa su posición (arriba o abajo, fuera de la pantalla, dependiendo de en qué mitad esté el jugador; en una posición aleatoria horizontal) y su velocidad (a 0 en ambos ejes). La vida se establece a `FANTIES_LIFE_GAUGE`.

    * si `en_an_fanty_activo` vale 1 para un enemigo, reacciona como un espectro: Se acerca al usuario si no está escondido, o se alejan de él (repulsión lineal) si lo está, hasta salir de la pantalla.

* Al morir un fanty, `en_an_fanty_activo` vuelve a 0 y la vida se establece a `FANTIES_LIFE_GAUGE`. O sea, que cuando matas un fanty aparecerá otro nuevo por el borde casi enseguida.

#### Tipo 6, *Fanties*

Son muy parecidos pero aparecerán en el lugar de la pantalla donde los ubiques. Además, pueden configurarse para que o bien persigan al jugador siempre, o bien solo lo hagan si el jugador se acerca, volviendo a su posición inicial cual el jugador se "pierde de vista".

### Cuadradores

Son los tipos 7 a 10 (dependiendo del gráfico que queramos que saquen de los 4). El tipo 10 actúa como una plataforma en vista lateral.

En vez de rebotar por el rectángulo definido por sus dos esquinas, los cuadradores andarán por el borde del mismo. El sentido del giro tendrá que ver con cómo se defina la diagonal: hacia abajo a la derecha o hacia arriba a la izquierda.

Ojal, que en el ponedor se escribe en hex. Deberás introducir 7, 8, 9 o A.

### Patrulleros marrulleros genitales

Andan al azar por la pantalla, en una de las cuatro direcciones, hasta que se encuentran con un obstáculo. Entonces cambian de dirección.

Para colocarlos, usa los tipos 11 a 14, dependiendo del gráfico que quieras que aparezca. Sitúalos en su posición original. Coloca el punto destino en cualquier casilla (al lado, por ejemplo). Define su velocidad.

Ojal, que en el ponedor se escribe en hex. Deberás introducir B, C, D o E.

## *hotspots*

Son, como hemos dicho, los puntos donde aparecen los objetos coleccionables, las llaves, o las recargas de vida. Se colocan en una casilla cada pantalla del mapa y llevan asociado un "tipo", que puede ser 1 (objetos), 2 (llaves) o 3 (recargas, si no activas la macro `LEGACY_REFILLS`), o cualquier otro número si te encargas tú de gestionarlo mediante código *custom*.

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

![Nuevo proyecto del "Ponedor"](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c05-003.png)

1. `Map W` y `Map H` son el **ancho** y el **alto** de nuestro mapa **en pantallas**, o sea, las **dimensiones del mapa**. 

2. `Scr W` y `Scr H` son las **dimensiones de cada pantalla**, en **tiles**. Para todos los güegos de **MTE MK1** estos valores son 15 y 10.

3. `Nenems` es el número de enemigos máximo por pantalla. En un principio, para **MTE MK1** debe ser 3.

4. `Adjust` lo dejamos en 0 para esta versión de **MTE MK1**.

5. Donde pone `TS` tenemos que poner la ruta del archivo con el tileset, que debería ser `work.png` a secas si lo has copiado en `enems`, aunque puedes usar el botón `Find` para ubicarlo desde un explorador si no te apetece escribir 8 caracteres.

6. En `Map` hay que poner la ruta del archivo con el mapa, que debería ser `mapa.map` a secas si lo copiaste a `enems`. También puedes usar `Find`.

7. No te olvides de poner **el nombre de archivo de salida** en la casilla `Output`. Si no quieres tocar `compile.bat`, este nombre debe ser `enems.ene`.

En la parte inferior izquierda de la ventana hay un botón que pone `Size`. Puedes pulsarlo para que en vez de `Normal` salga `Double` y así el Ponedor se mostrará ampliado 2x y se verá mejor todo.

## Manejo básico del programa

En la vista principal aparece una rejilla con la pantalla actual. Puedes cambiar la pantalla que se muestra usando las teclas de los cursores. Es en esta vista donde pondremos los enemigos, dibujaremos sus trayectorias, y colocaremos los *hotspots*.

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

![Cargando un proyecto existente](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c05-004.png)

Como mencionamos antes, sólo tenemos que preocuparnos de poner las cosas en el Ponedor y grabar el archivo `enems.ene` a menudo. `comp.bat` se encargará de hacer las conversiones necesarias y de meter los numeritos en el juego.

## Poniendo enemigos y plataformas

Para empezar veremos como colocar **enemigos lineales**. Empezaremos haciendo click sobre la casilla donde debe aparecer el enemigo; además servirá como uno de los límites de su trayectoria. Cuando hagamos esto, aparecerá un cuadro de diálogo donde deberemos introducir el **tipo del enemigo**. Recuerda que en el caso de enemigos lineales será un valor de 1 a 4, 4 para las plataformas en los güegos de vista lateral. Ponemos el numerito y pulsamos OK.

Ahora el programa espera que marquemos el final la trayectoria. Haremos click en la casilla correspondiente. Veremos como se nos muestra gráficamente la trayectoria y aparece un nuevo cuadro de diálogo algo más complejo:

![El atributo sirve para la velocidad de los enemigos lineales](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c05-005.png)

En **MTE MK1** sólo tendremos que rellenar el recuadro `Attr`. El valor introducido en `Attr` será el número de píxeles que avanzará el enemigo o plataforma por cada cuadro de juego. Estos valores, para que no haya problemas, deberían ser potencias de dos:  1, 2 o 4.

Una vez que hayamos puesto el numerico, pulsamos OK.

Para los enemigos **voladores** de tipo 6 sólo importa la casilla de inicio. La otra casilla da igual donde la pongas. Se suele poner en la casilla de al lado. Puedes dejar vacío el cuadro `Attr`, ya que no se usa tampoco.

Puedes poner un máximo de tres por pantalla (el programa no te dejará meter más). No tiene por que haber tres en cada pantalla, puedes tener pantallas con uno, con dos, o con ninguno.

Para **eliminar o editar** los valores de un enemigo que ya hayamos colocado, basta con hacer click sobre la casilla de inicio de la trayectoria (donde aparece el numerito que indica el tipo). Entonces nos aparecerá un cuadro de diálogo donde podremos cambiar su tipo o la velocidad o eliminarlo completamente.

## Poniendo *hotspots*

**Cada pantalla admite un único hotspot**. Eso significa que el número total de llaves y objetos necesarios para terminar el güego no puede exceder el número de pantallas. Para colocar el hotspot de la pantalla actual, simplemente **hacemos click con el botón derecho en la casilla donde queremos que aparezca** la llave o el objeto, con lo que haremos aparecer un pequeño cuadro de diálogo donde deberemos introducir el tipo.

Para editar o borrar un hotspot, simplemente haz click *con el botón derecho* sobre él para mostrar el diálogo de edición desde el que también te lo puedes cargar.

No todas las pantallas tienen por qué tener un hotspot. 

## Conversión e importación

La conversión se hace desde `comp.bat` empleando `ene2h.exe`:

```cmd
    ..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
```

### Parámetros opcionales de `ene2h.exe`

Por defecto, `eneh2.exe` intercambiará los valores de x1 con x2 o de y1 con y2 para asegurarse de que las coordenadas "1" sean menores que las "2", lo que simplifica y acelera el código del motor. Sin embargo, para algunos customs puede que no se desée que se intercambien estas coordenadas. Por ejemplo, el enemigo tipo Zombie de **Zombie Calavera** necesita reaparecer siempre donde se ha colocado, por lo que no podemos permitir que x1 se intercambie con x2 o y1 con y2.

En ese caso podemos usar un cuarto parámetro: `dsall` hará que no se intercambien las coordenadas si los enemigos no son de tipo lineal (1 a 4). `dslight` intercambiará todas las coordenadas salvo las de los tipos 5, 6 y 15, pensada para usar (si fuera necesario) con los enemigos de tipo "Cuadrators" o "Marrullers".

# Capítulo 6 - Configurando el güego

El comportamiento básico del juego se define en el archivo `config.h` que hay situado en `dev`. Luego podremos tunear mediante el scripting o el código inyectable de `custom.h`, pero hay que empezar por el principio. 

## Configuración general

En la primera sección configuramos el comportamiento general del juego: las dimensiones del mapa, la pantalla de inicio, la pantalla de final (si aplica), la posición del muñeco al inicio, el número de objetos que hay que recoger, etcétera.

```c
    //#define MODE_128K_DUAL                // Uses AY Routines in RAM1 if on 128K mode.
    //#define MIN_FAPS_PER_FRAME    2       // Limits the max # of fps to 50/N
```

* `MODE_128K_DUAL` permite detectar modelos de 128K y usar un player de música y efectos que use el chip AY ubicado en RAM1. Ver capítulo 9.

* `MIN_FAPS_PER_FRAME` coloca un limitador de frames. El valor que le asignes será el máximo número de frames que dejará pasar por cuadro de juego. El ZX Spectrum funciona a 50 fps, por lo que, por ejemplo, un valor de 2 limitaría el juego a 25 fps, y uno de 3 a 16.6 fps. Obviamente si hay mucha carga en una escena el frame rate del juego bajará. Esta directiva sólo coloca un límite superior para que las pantallas con poca acción no vayan mucho más rápidas.

Cualquiera de estas dos directivas hacen que se cree una tabla de 257 valores y que se añada una serie de estructuras de datos que pueden ocupar hasta 512 bytes.

```c
    #define MAP_W                   5       //
    #define MAP_H                   5       // Map dimmensions in screens
    #define TOTAL_SCREENS           25      // 
```

* `MAP_W` y `MAP_H` definen el tamaño del mapa en pantallas.  Deben ser los mismos valores que usas en `comp.bat` como parámetros de `mapcnv.exe` para convertir el mapa o los que introdujiste en `ponedor.exe` al crear el proyecto para `enems.ene`.

* `TOTAL_SCREENS`, en principio, debe valer `MAP_W * MAP_H`. Los valores están separados debido a oscuros manejes que se perdieron en el tiempo, ya que **actualmente no se usa**.

```c
    #define SCR_INICIO              12      // Initial screen
    #define PLAYER_INI_X            8       //
    #define PLAYER_INI_Y            5       // Initial tile coordinates
```

Estas directivas definen donde se empieza a jugar: 

* El número de pantalla `SCR_INICIO` se obtiene contando las pantallas en orden de lectura (de izquierda a derecha y de arriba a abajo) empezando por 0, que correspondería a la pantalla superior izquierda del mapa.

* `PLAYER_INI_X` y `PLAYER_INI_Y` son las coordenadas de inicio a nivel de tiles.

Todos estos valores los puedes obtener fácilmente navegando por `ponedor.exe` y moviendo el raton sobre las casillas del área de edición.

```c
    //#define SCR_FIN               99      // Last screen. 99 = deactivated.
    //#define PLAYER_FIN_X          99      //
    //#define PLAYER_FIN_Y          99      // Player tile coordinates to finish game
```

Si activas `SCR_FIN` el juego terminará sólo si el jugador está en la pantalla indicada, en las coordenadas especificadas en `PLAYER_FIN_X` y `PLAYER_FIN_Y`, aunque no sabemos si esto funcionará bien porque, en 10 años, **no lo hemos usado NUNCA**.

Si comentas `SCR_FIN` no se tomarán en cuenta (que es lo que hemos hecho en cada uno de los juegos que hemos lanzado desde **Lala Prologue**).

```c
    #define PLAYER_NUM_OBJETOS      13      // Objects to get to finish game
    #define PLAYER_LIFE             99      // Max and starting life gauge.
    #define PLAYER_REFILL           25      // Life recharge
```

* `PLAYER_NUM_OBJETOS` especifica cuantos *hotspots* de tipo 1 tendremos que coleccionar. Si no activamos el motor de scripting y `WIN_ON_SCRIPTING` (ver más adelante), ganaremos el juego tras coleccionar este número de objetos.

* `PLAYER_LIFE` es la cantidad de vida con la que empezamos a jugar, `PLAYER_REFILL` es cuánto se recarga la vida al coger una regarga. En esta versión de **MTE MK1** las recargas aparecen únicamente cuando hemos recogido una llave o un objeto coleccionable y volvemos a la misma pantalla.

```c
    #define LINEAR_ENEMY_HIT        1       // Amount of life to substract when normal enemy hits
    //#define FLYING_ENEMY_HIT      1       // Amount of life to substract when flying enemy hits
```

Estas dos directivas especifican cuánta vida restan los enemigos al colisionar con el jugador. Puedes especificar valores diferentes para enemigos lineales o enemigos voladores. Obviamente, `FLYING_ENEMY_HIT` solo valdrá de algo si activas algún tipo de enemigo volador (ver más abajo).

```c
    //#define ENABLE_CODE_HOOKS             // Hooks @ init, entering game, screen & loop @ custom.h
    //#define ENABLE_CUSTOM_ENEMS           // Hooks for custom enemies @ custom.h
	//#define ENABLE_CUSTOM_LINEAR_ENEM_CELLS        // Call `custom.h/get_cell_n ()` for linear
```

Estas dos directivas implican conocimientos más avanzados: sirven para activar los enganches generales y de enemigos custom en el archivo `custom.h`.

### Enganches generales `ENABLE_CODE_HOOKS`

Si activas `ENABLE_CODE_HOOKS`, algunas funciones de `custom.h` serán llamadas en puntos específicos de la ejecución del juego. Añadiendo código C a estas funciones podrás personalizar muchísimo el motor. Tienes un ejemplo genial de esto en el juego **Ramiro el Vampiro en el Misterio del Papiro**. Las funciones son:

* `void hook_system_inits (void);` se ejecuta una sola vez al finalizar la carga. Fue concebido para poder añadir código para comprobar claves de acceso o para crear sprites extra.

* `void hook_init_game (void);` se ejecuta cada vez que empezamos una nueva partida. Sirve para inicializar valores antes de empezar a jugar.

* `void hook_init_mainloop (void);` se ejecuta al principio del loop principal. Puede usarse (se diseñó) para añadir lógica que permita dividir un mapa en submapas (pantallas de interim, etc).

* `void hook_mainloop (void);` se ejecuta en el loop principal, una vez cada cuadro de juego, justo antes de dibujarlo en pantalla.

* `void hook_entering (void);` se ejecuta una vez cada vez que entramos en la pantalla, cuando ya se ha dibujado el mapa e inicializado los enemigos y los *hotspots*, pero antes de que nada sea visible.

* `void hook_hotspots (void);` se ejecuta justo tras tocar un hotspot. Puedes usarlo para hacer comprobaciones previas o meter los tuyos propios. Por ejemplo en **El Hobbit** lo usamos para que no se pueda coger objetos hasta que no se haya hablado con Gandalf poniendo `hotspot_t` a 0.

¡Ojo! Si activas `ENABLE_CODE_HOOKS`, puedes forzar *Game Over* poniendo `player.life` a -1, pero **el juego sólo terminará (pantalla de final) si pones `game_loop_flag` a 1**. La comprobación de "juego terminado" tendrás que ponerla tú, **el engine no hará ninguna** a menos que definas `WIN_ON_SCRIPTING`, en cuyo caso sólo se podrá "ganar" desde el script o haciendo `script_result = 1`. 

### Enganches de enemigos custom `ENABLE_CUSTOM_ENEMS`

Los enganches para enemigos custom permiten añadir tipos de enemigos o personalizar los que ya existen. Si activas `ENABLE_CUSTOM_ENEMS`, las siguientes funciones de `custom.h` serán llamadas en diferentes puntos de la gestión de enemigos:

* `void extra_enems_init (void);` se ejecuta durante la inicialización de los enemigos al entrar en cada pantalla. Se llama cuando se está inicializando el enemigo número `enit`. Sus valores estarán en `malotes [enoffs + gpit]`, una estructura con estos campos:

```c
    typedef struct {
        unsigned char x, y;                 // Coordenadas
        unsigned char x1, y1, x2, y2;       // Límites de trayectoria
        char mx, my;                        // Velocidad
        char t;                             // Tipo
    #if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
        unsigned char life;                 // Vida
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

* `void extra_enems_killed (void);` se ejecuta cada vez que un enemigo muere, al final de todo el proceso. Es importante notar que `_en_t` tendrá el bit 4 arriba (el enemigo ya se ha marcado como muerto), así que si se quiere obtener el tipo real habrá que hacer AND con 0xEF, o, en el caso de tener `ENABLE_CODE_HOOKS`, usar el valor de `enemy_died`. Todas las variables pueden consultarse y modificarse igual que en `extra_enems_move` y `extra_enems_checks`.

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

### Enganches de cells custom `ENABLE_CUSTOM_LINEAR_ENEM_CELLS`

Normalmente los enemigos lineales son `_en_t` con valores 1-4, y llevan asignados por defecto las 4 primeras parejas de cells del spriteset. Si se activa esta directiva se llamará a una función `get_cell_n ()` que deberá devolver un número en base a `_en_t` que indique qué pareja de cells del spriteset debe usarse.

Si se devuelve `n`, los cells del spriteset que se emplearán serán `ENEMS_OFFSET + n * 2` (si se define `ENEMS_OFFSET`). **Nótese que empezamos a contar en 0**.

Esto puede usarse para tener más de 4 parejas de cells en el spriteset y poder combinarlos de diferentes maneras dependiendo de nivel o pantalla.

### Datos disponibles

Si estás usando enganches, el motor deja valores interesantes en algunas variables, que tú puedes gestionar:

* `latest_hotspot` valdrá distinto de cero si el jugador acaba de tocar un hotspot y contendrá el valor de dicho hotspot.

* `enemy_died` contiene el tipo del último enemigo que el jugador ha eliminado. Es tarea del programador ponerlo a 0. 

* `enemy_killer` contiene el número del último enemigo que mató al jugador (0-2). Es tarea del programador ponerlo a 0. Este índice se puede usar para obtener o modificar cualquier valor del enemigo, que ocupará el espacio `enoffs + enemy_died` del array `malotes`.

## Tipo de motor

### Directivas miscelaneas

```c
    #define DIRECT_TO_PLAY                  // If defined, title screen is also the game frame.
    //#define DEACTIVATE_KEYS               // If defined, keys are not present.
    //#define DEACTIVATE_OBJECTS            // If defined, objects are not present.
    //#define ONLY_ONE_OBJECT               // If defined, only one object can be carried at a time.
    //#define DEACTIVATE_EVIL_TILE          // If defined, no killing tiles (behaviour 1) are detected.
    //#define EVIL_TILE_SIMPLE              // For side view, only hit from below.
    #define DEACTIVATE_EVIL_ZONE            // Zones kill you after a while. Read docs or ask na_th_an
    //#define EVIL_ZONE_FRAME_COUNT 8       // For countdown in an evil zone.
    //#define EVIL_ZONE_BEEPS_COUNT 32      // # of counts before killing
    //#define EVIL_ZONE_FREQ        3       // if defined to N kill every M^2 frames; N=M^2-1,  
    //#define EVIL_ZONE_CONDITIONAL         // Active if scenery_info.evil_zone_active
    #define PLAYER_BOUNCES                  // If defined, collisions make player bounce
    #define PLAYER_FLICKERS         50      // If defined, collisions make player flicker for N frames.
    //#define DEACTIVATE_REFILLS            // If defined, no refills.
    //#define LEGACY_REFILLS                // Legacy mode: refills appear in place of collected items/keys
    #define MAX_FLAGS               1       // Number of flags. For scripting and stuff.
    //#define PLAYER_DIZZY                  // The Hobbit
    #define ENEMIES_LIFE_GAUGE      3       // Amount of shots/hits needed to kill enemies.
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

**CUIDADO**: Si activas `ENEMIES_COLLIDE` tendrás que ajustar `ENEMIES_COLLIDE_MASK` para que no incluya el bit 0 a 1 o los enemigos no podrán moverse por las zonas con tiles tipo 3 (que tienen el bit 0 a 1).

* `PLAYER_BOUNCES`: El jugador rebota si le da un enemigo.

* `PLAYER_FLICKERS`: El jugador parpadea durante el número especificado de frames si le da un enemigo.

* `DEACTIVATE_REFILLS`: Desactivar las recargas.

* `LEGACY_REFILLS`: Si está activa esta macro, las recargas se comportan como en los juegos clásicos de **MK1**: no se colocan explícitamente, sino que aparecerán en lugar de llaves u objetos ya recogidos, al azar.

* `MAX_FLAGS`: Debe definirse y valer al menos 1. Controla el número de flags para scripting y otros menesteres. Probablemente con 16 tendrás bastante para un juego de complejidad normal. Además, usar 16 o menos permite optimizar mucho el *bytecode* de los scripts, como describiremos más adelante.

* `PLAYER_DIZZY`: Se introdujo para **El Hobbit** y sólo funciona con `PLAYER_NO_INERTIA` en perspectiva genital.

* `ENEMIES_LIFE_GAUGE` especifica el número de veces que hay que darle con un disparo a un enemigo para matarlo.

### Paralizar

```c
    //#define ENEMIES_MAY_BE_PARALIZED      // Custom paralyze enemies.
    //#define PARALYZED_DONT_KILL           // Enemies don't kill while paralyzed
```

* `ENEMIES_MAY_BE_PARALYZED`: Si activas `ENABLE_SWORD` y `SWORD_PARALYZES`, los enemigos se paralizarán de un golpe de espada (ver más adelante). Si quieres poder paralizar a los enemigos desde tus hooks de `custom.h` o desde `msc_extern.h` puedes definir esta macro.

* `PARALYZED_DONT_KILL`: Se usa con `ENEMIES_MAY_BE_PARALYZED` o con la combinación `ENABLE_SWORD`/`SWORD_PARALYZES`: normalmente los enemigos siguen matando mientras están paralizados. Define esta macro para que sean inofensivos en este estado.

### Colisión

```c
    //#define ENEMIES_COLLIDE               // Check collisions for linear enemies
```

Si se define, se añade código que comprueba que los enemigos no colisionen con el escenario. El comportamiento en los enemigos lineales es que cambian de dirección en el eje en el que colisionan. Los enemigos voladores no se ven afectados. Esta macro se define automáticamente si está definida `PLAYER_PUSH_BOXES`.

Por defecto, los enemigos colisionarán con obstáculos (8) y tiles que matan (1). Si quieres cambiar este comportamiento debes añadir la definición de otra macro,

```c
	#define ENEMIES_COLLIDE_MASK 	9
```

Donde colocar el valor que se hará "AND" con el comportamiento del tile para detectar colisión. Por ejemplo, para detectar sólo con obstáculos sería 8, para obstáculos y tiles que matan 9 (8 + 1), para obstáculos y plataformas 12 (8 + 4), para obstáculos, plataformas, y tiles que matan 13 (8 + 4 + 1), etc.

### Monedas

Sirve para activar las monedas, que no son más que un tile específico del tileset que podemos recoger. Al hacerlo, se incrementará el valor de un flag. Se utilizan de manera muy diferente en los cuatro Ramiros y en la demo de Sir Ababol 2:

```c
    // Coins engine
    // ------------

    //#define USE_COINS                     // Coin engine activated
    //#define COIN_TILE             13      // Coin is tile #X
    //#define COIN_BEH              16      // Detect coin by behaviour rather than tile nº
    //#define COIN_FLAG             1       // Coins are counted in flag #N
    //#define COINS_REFILL          1       // If defined, add this to player.life
    //#define COIN_TILE_DEACT_SUBS  0       // Substitute with this tile if coins are OFF.
    //#define COINS_DEACTIVABLE             // Coins can be hidden.
    //#define COINS_SCRIPTING               // Run script when player gets coin
    //#define COINS_PERSISTENT              // Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes
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

    //#define FIXED_SCREENS                 // If defined, you can't exit a screen running off an edge
    //#define SHOW_LEVEL_INFO               // If defined, show "LEVEL XX" before level start, XX=n_pant
    //#define SHOW_LEVEL_SUBLEVEL           // If defined, level # is XX/YY using y_map and x_map resp.
    //#define RESPAWN_REENTER               // If you die, reenter screen. (redraw)
    //#define RESPAWN_SHOW_LEVEL            // Besides, show level info.
    //#define RESPAWN_FLICKER               // Start level flickering.
    //#define RESET_BODY_COUNT_ON_ENTER     // Reset body count when entering new screen
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

    #define PLAYER_PUSH_BOXES               // If defined, tile #14 is pushable
    #define PUSH_OVER_FLOOR                 // Must be on floor to push
    #define PUSH_AND_PULL                   // Use fire+LEFT/RIGHT to push/pull in side view
    #define PLAYER_GRAB_FRAME       2       // Use with PUSH_AND_PULL, which frame 0-3.
    //#define FALLING_BOXES                 // If defined, boxes can fall off ledges.
    //#define FALLING_BOXES_SPEED   4       // Boxes fall every nth frame.
    //#define ENEMIES_BLOCK_BOXES           // If defined, you can't push a box if it collides an enemy
    //#define BOXES_KILL_ENEMIES            // If defined, falling boxes can kill enemies.
    //#define BOXES_ONLY_KILL_TYPE  1       // If defined, only enemies type N can be killed with boxes.
    //#define BOXES_KILL_PLAYER             // If defined, falling boxes can kill the player.
```

* `PLAYER_PUSH_BOXES` activa el motor de cajas empujables.

* `PUSH_OVER_FLOOR`: En **vista lateral**, las cajas sólo se mueven si tienen suelo debajo y no tienen otra caja arriba.

* `PUSH_AND_PULL`: En **vista lateral**, se puede tirar y empujar de cajas. Si el jugador se coloca mirando a una caja pegado a ella y deja pulado el botón de disparo, *agarrará* la caja, que podrá mover a izquierda o derecha con los controles. Está pensado para ser usado con `PUSH_OVER_FLOOR`,  y además necesita que definamos la siguiente macro:

* `PLAYER_GRAB_FRAME`: Se usa con `PUSH_AND_PULL`, indica qué gráfico del jugador (0-3) se usará para representar que ha agarrado la caja.

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

    //#define PLAYER_CAN_FIRE               // If defined, shooting engine is enabled.
    //#define PLAYER_BULLET_SPEED   8       // Pixels/frame. 
    //#define MAX_BULLETS           3       // Max number of bullets on screen. Be careful!.
    //#define PLAYER_BULLET_Y_OFFSET    4   // vertical offset from the player's top.
    //#define PLAYER_AX_RECOIL      128     // If defined, recoil.

    //#define FIRING_DRAINS_LIFE            // If defined, firing drains life (oi!)
    //#define FIRING_DRAIN_AMOUNT   2       // what to substract when firing.
```

* `PLAYER_CAN_FIRE` activa el motor de disparos.

* `PLAYER_BULLET_SPEED` define la velocidad de los proyectiles en pixels por frame.

* `MAX_BULLETS` define el máximo número de balas en pantalla. Hay que tener cuidado porque a más balas, menos velocidad y más memoria dinámica tendremos que reservar (ver al final de esta sección).

* `PLAYER_BULLET_Y_OFFSET`: número de píxels desde el borde superior del jugador desde el que se dispara la bala. Cuanto mayor sea, más abajo saldrá.

* `PLAYER_AX_RECOIL`: Si se define, se añadirá esta aceleración al eje horizontal en sentido contrario al sentido en el que mire el jugador cada vez que se dispare (retroceso del arma).

* `FIRING_DRAINS_LIFE` (opcional): si se define, disparar resta vida (como en **Cheril the Goddess**).

* `FIRING_DRAIN_AMOUNT`: Debe utilizarse con `FIRING_DRAINS_LIFE`, y define cuanta vida se resta con cada disparo.

Cada proyectil necesitará 5 bloques adicionales de memoria dinámica, por lo que habrá que añadir `MAX_BULLETS * 5` bloques a `NUMBLOCKS` en `churromain.c`. Ver más adelante la sección sobre memoria dinámica.

### La espada

**Sir Ababol 2** empezó como prototipo en **MTE MK1 v4**, aunque luego se desarrolló sobre un motor específico. Parte de los trabajos para apañar la versión 4.8 de **MTE MK1** ha tenido que ver con reintegrar los añadidos de la demo técnica de **Sir Ababol**, entre ellos la espada. Además, se ha añadido lo necesario para que puedas usarla también en modo genital, algo que planeamos ya en 2011 para un juego tipo Zelda.

Para poder usar la espada necesitaremos añadir los gráficos para pintarla. Para ello tendremos que poner en `gfx` un nuevo spriteset de 8x8 con los cells necesarios, que serán, dependiendo del modo (lateral o genital):

* **Vista lateral**: 3 (izquierda, derecha, arriba) en el caso de que la espada pueda lanzarse hacia arriba (`SWORD UP`) o 2 en el caso de que no (izquierda, derecha). El punto que "golpea" de la espada es (0, 4) a la izquierda, (7, 4) a la derecha, y (4, 0) arriba. Algo así:

![La espada lateral](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c06-001.png)

* **Vista genital**: 4 (derecha, izquierda, arriba, abajo). El punto que "golpea" de la espada es, respectivamente, (7, 4), (0, 3), (4, 0), (7, 3), así:

![La espada genital](https://github.com/mojontwins/MK1v4/blob/master/docs/images/c06-002.png)

Además, habrá que llamar a `sprcnv8bin.exe` desde `comp.bat` para que lo convierta y genere un archivo llamado `sprite_sword.bin` con una linea parecida a :

```cmd
    ..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 3 > nul
```

Donde pondremos 2, 3, o 4 dependiendo del número de gráficos que haya en el set (en vista genital, 4; en vista lateral, 3 si vamos a definir `SWORD_UP`, 2 en caso contrario).

Hecho esto, la espada se configura con estas macros:

```c
    // Sword
    // -----

    //#define ENABLE_SWORD                  // Let the player swing a sword
    //#define SWORD_UP                      // Can hit upwards
    //#define SWORD_LINEAL_DAMAGE   0       // Damage to linear.
    //#define SWORD_FLYING_DAMAGE   1       // Damage to flying.
    //#define SWORD_PARALYZES       32      // If defined, paralyze for N frames
    //#define SWORD_HIT_FRAME       2       // Frame to render 0-3
    //#define SWORD_STAB            3       // Rather than swing, stab at height N
    
```

* `ENABLE_SWORD` activa el motor de la espada.

* `SWORD UP` (opcional): permite dar un espadazo hacia arriba pulsando "arriba" junto con "fuego".

* `SWORD_LINEAL_DAMAGE`: Cantidad de vida que se resta a los enemigos lineales al golpearlos. Puede ser 0 para no causarles daño.

* `SWORD_FLYING_DAMAGE`: Cantidad de vida que se resta a los enemigos voladores al golpearlos. Puede ser 0 para no causarles daño.

* `SWORD_PARALYZES` (opcional): Si se define, la espada paralizará al enemigo que golpea durante N cuadros de juego.

* `SWORD_HIT_FRAME` usar este frame del jugador para la animación de golpear 0-3, **en modo de vista lateral**.

* `GENITAL_HIT_FRAMES`: Si defines esta macro, **en modo genital**, tendrás que añadir 4 frames al spriteset como sprites 17 a 20 con nuevos cells de animación para que el muñeco golpée con la espada a la derecha, izquierda, arriba y abajo, respectivamente. Si haces esto tendrás que modificar `comp.bat` para convertir el spriteset (que ahora tendrá 20 cells más los que añadas por tu cuenta) con `sprcnv_exp.exe`:

```cmd
    ..\utils\sprcnv_exp.exe ..\gfx\sprites.png sprites.h 20 extra > nul
```

* `SWORD_STAB` apuñalar en lugar de balancear la espada. La espada sale recta a una altura de N pixels desde la parte superior del sprite del jugador.

Si queremos controlar a qué enemigos afectará la espada, podemos usar `PLAYER_MIN_KILLABLE` (ver más adelante).

A partir de `4.9` hay más todavía:

```c
	// #define SWORD_DEPLETES 				// Can only hit when player.sword_g > 0 & decs
	// #define SWORD_CUSTOM_HIT 			// use code @ sword_custom_hit.h before default
	// #define SWORD_DISABLE_HIT 			// Disable default hit code.
```

* `SWORD_DEPLETES` hará que la espada sólo funcione si `player.sword_g` no vale 0. Se entiende que mantener `player.sword_g` es responsabilidad del programador. El engine vanilla no hace NADA con esta variable salvo comprobar esto.

* `SWORD_CUSTOM_HIT` hará que se elecute el código contenido en `sword_custom_hit.h` cuando la espada impacte contra un enemigo.

* `SWORD_DISABLE_HIT` desactivará todo el código que se ejecuta normalmente cuando la espada impacta con un enemigo, por si quieres implementar toda la lógica por tu cuenta.

### Tiles que se rompen

Si se activa este motor, los tiles de comportamiento `& 32` se podrán romper. Los tiles se rompen con un solo golpe de espada o un solo disparo, no hay posibilidad de configurar un número de golpes como en las versiones 3.99.x o 5.x+.

```c
    // Breakable
    // ---------

    //#define ENABLE_BREAKABLE              // Enable breakable tiles (& 32)
    //#define MAX_BREAKABLE_FRAMES  8       // N = frames to display this tile:
    //#define BREAKABLE_BREAKING_TILE 45    // display this for N frames
    //#define BREAKABLE_ERASE_TILE  0       // The substitute by this tile.
    //#define BREAKABLE_SPAWN_CHANCE  3     // Must be a power of 2 - 1, ifdef there's a chance to spawn...
    //#define BREAKABLE_SPAWN_TILE    46    // Throw this tile if rand() & chance == 1.
    //#define BREAKABLE_PERSISTENT          // Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes.
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

    //#define ENABLE_PERSISTENCE            // Turned on automaticly if needed, but you can do it manually
    //#define PERSIST_CLEAR_TILE    0       // Clear persistent bit this tile
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
    //#define ENABLE_FRIGOABABOL            // Player can be frozen
    //#define FRIGO_MAX_FRAMES      32      // # of frames to be frozen. Can be decreased via ...
    //#define FRIGO_UNFREEZE_TIME           // state counter decreases automaticly.
    //#define FRIGO_UNFREEZE_FIRE           // state counter decreases pressing fire. You can activate both
    //#define FRIGO_NO_FIRE                 // Can't fire nor swing your sword while frozen
    //#define FRIGO_FIGHT                   // Modify vx, vy while frozen when pressing fire.
    //#define FRIGO_ENEMIES_FREEZE          // Enemies freeze the player on touch.
    //#define FRIGO_FROZEN_NO_RX            // No PLAYER_RX while frozen!
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
    //#define SLIPPERY_TILES                // Tiles with beh & 16 are slippery.
```

* `SLIPPERY_TILES` activa el motor de tiles resbalosos en la vista lateral.

Si el jugador está sobre un tile con comportamiento `& 16`, se aplicarán los valores de `PLAYER_AX_SLIPPERY` o `PLAYER_RX_SLIPPERY` en lugar de `PLAYER_AX` y `PLAYER_RX`, por lo que se puede emplear también para suelos sobre los que se camine más lento.

### Tiles que arrastran

(Por ahora sólo funcionan en vista lateral)

```c
    //#define CONVEYOR_TILES                    // Tiles with beh & 2 are conveyors.
```

### Tiles quicksands

(Sólo vista lateral)

```c
    //#define QUICKSAND_TILES                   // Tiles with beh & 64 are quicksands.

```


### Enemigos voladores

Permite activar y configurar *fantys*.

```c
    //#define PLAYER_CAN_HIDE               // If defined, tile type 2 hides player.
    //#define HIDDEN_CAN_MOVE               // Originally, if you are moving you are not hidden. Override.
    //#define RANDOM_RESPAWN                // If defined, automatic flying enemies spawn on killed enemies
    //#define USE_TYPE_6                    // If defined, type 6 enemies are enabled.
    //#define USE_SIGHT_DISTANCE            // If defined, type 6 only pursue you within sight distance
    //#define SIGHT_DISTANCE        120     
    //#define FANTY_MAX_V           256     // Flying enemies max speed.
    //#define FANTY_A               16      // Flying enemies acceleration.
    //#define FANTIES_LIFE_GAUGE    10      // Amount of shots needed to kill flying enemies.
    //#define MAKE_TYPE_6                   // Create fanties for missing enemies if scenery_info.make_type_6
```

* `PLAYER_CAN_HIDE`: si se activa, los tiles de tipo 2 "ocultan" al jugador.

* `HIDDEN_CAN_MOVE`: Se usa con `PLAYER_CAN_HIDE`. Si activas esta macro, podrás moverte en los tiles que esconden y seguir escondido. Si no, además de tocar un tile que esconde deberás estar *quieto*.

* `RANDOM_RESPAWN`: activa los *fantys* de tipo 5 que aparecen al eliminar enemigos lineales. También pueden colocarse directamente en el mapa como tipo 5. Da igual donde se pongan, aparecerán por el borde superior o inferior.

* `USE_TYPE_6`: activa los *fantys* de tipo 6 que se colocan con el ponedor (los *fantys* normales). **No es compatible con `RANDOM_RESPAWN`**.

* `USE_SIGHT_DISTANCE` (opcional), se usa con `USE_TYPE_6`, hace que los *fantys* sólo te persigan si estás a cierta distancia, y que si te alejas vuelvan a su posición inicial.

* `SIGHT_DISTANCE`, se usa con `USE_SIGHT_DISTANCE`, es a la distancia a la que ven los *fantys*.

* `FANTY_MAX_V` y `FANTY_A` definen la velocidad máxima y la aceleración de los *fantys*.

* `FANTIES_LIFE_GAUGE` dice cuánta vida tienen los *fantys*.

* `MAKE_TYPE_6` es un custom de **Ramiro 2**. Si se activa y `scenery_info.make_type_6` vale 1, se creará un *fanty* en lugar de cada enemigo *que no esté colocado* en cada pantalla. O sea, si en una pantalla hay por ejemplo 2 enemigos, aparecerá un tercero que será un *fanty*.

### Los cuadrators

```c
    // Quadrators
    // ----------

    //#define ENABLE_CUADRATORS                 // Enable QUADRATORS, enemy type 7-10
```

Los cuadrators son parecidos a los lineales pero hacen una trayectoria rectangular si has colocado una diagonal en el ponedor. Ocupan unos 206 bytes y NO SE VEN AFECTADOS POR LAS COLISIONES CON EL ESCENARIO, cuidado con esto.

Los sentidos de giro tienen que ver con cómo se coloquen. Si la diagonal del rectángulo es \ girarán en sentido antihorario, y si es / girarán en sentido horario.

Se ponen con los tipos 7 a 10 y pintan el sprite 1 a 4 dependiendo de cuál pongas.

Ojal, que en el ponedor se escribe en hex. Deberás introducir 7, 8, 9 o A.

### Los patrulleros marrulleros genitales

```c
    // Patrulleros marrulleros genitales
    // ---------------------------------

    //#define ENABLE_MARRULLERS                 // Enable MARRULLERS, enemy type 11-14
```

Los patrulleros marrulleros genitales van andando en linea recta hasta que se encuentran un obstáculo. Entonces cambian de dirección. Ocupan unos 395 bytes, que es un pasote.

Se ponen con los tipos 11 a 14.

Ojal, que en el ponedor se escribe en hex. Deberás introducir B, C, D o E.

### Scripting

La forma original de *complicar* los juegos de **MTE MK1** era mediante un sencillo pero efectivo sistema de scripting. Activar este sistema nos permite programar comportamiento extra en un lenguaje muy sencillo que describiremos en el capítulo siguiente.

```c
    //#define ACTIVATE_SCRIPTING            // Activates msc scripting and flag related stuff.
    //#define WIN_ON_SCRIPTING              // Game can only be won using WIN GAME in the script
    //#define SCRIPTING_DOWN                // Use DOWN as the action key.
    //#define COUNT_KILLABLE_ON     2       // Count killable enemies on flag #N (per screen basis)
    //#define SCRIPTING_KEY_M               // Use M as the action key instead.
    //#define OBJECTS_ON_VAR        2       // If defined, only show objects if var # is set.
    //#define OBJECT_COUNT          3       // Defines which FLAG will be used to store the object count.
    //#define REENTER_ON_ALL_OBJECTS        // If set, re-enter screen when all objects are got, instead of ending
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
    #define PLAYER_MOGGY_STYLE              // Enable top view.
```

### Vista genital

La vista genital está muy poco trabajada en **MTE MK1 v4**. Sólo podemos configurar unos cuantos parámetros y emplear unos cuantos motores.

```c
    //#define LOOK_AT_THE_CAMERA            // Use "walk down" cell if player is idle
    //#define PLAYER_NO_INERTIA             // Disable inertia
    //#define PLAYER_CONST_V        256     // Constant speed
```

* `LOOK_AT_THE_CAMERA`: si se define, el jugador mirará a la cámara si no se está pulsando ninguna dirección.

* `PLAYER_NO_INERTIA`: si se define, el jugador se mueve sin inercia, sino con una velocidad fija.

* `PLAYER_CONST_V`: se usa con `PLAYER_NO_INERTIA`, define la velocidad en 1/64 de pixels.

### Vista lateral

Además de todos los motores que hemos visto más arriba, podemos configurar el comportamiento básico de la vista lateral con esta colección de macros:

```c
    //#define PLAYER_HAS_JUMP               // If defined, player is able to jump.
    //#define TIGHT_BOUNDING_BOX            // Bounding box 12x16
    //#define FIRE_TO_JUMP                  // Jump using the fire button, only if no PLAYER_CAN_FIRE
    //#define BOTH_KEYS_JUMP                // Jump using UP *or* FIRE, beware, deact if PLAYER_CAN_FIRE!
    //#define RAMIRO_HOP                    // press jump when reaching a type 4 platform to jump again 
    //#define RAMIRO_HOVER                  // press down to hover
    //#define PLAYER_HAS_JETPAC             // If defined, player can thrust a vertical jetpac
    //#define JETPAC_DRAINS_LIFE            // If defined, flying drains life.
    //#define JETPAC_DRAIN_RATIO    3       // Drain 1 each X frames.
    //#define JETPAC_DRAIN_OFFSET   8       // Drain after X frames.
    //#define PLAYER_KILLS_ENEMIES          // If defined, stepping on enemies kills them
    //#define PLAYER_MIN_KILLABLE   3       // Only kill enemies with id >= PLAYER_MIN_KILLABLE
    //#define PLAYER_MAX_KILLABLE 	6 		// Only kill enemies if id <= PLAYER_MAX_KILLABLE
```

* `PLAYER_HAS_JUMP`: el jugador puede saltar pulsando "arriba".

* `TIGHT_BOUNDING_BOX`: El jugador colisiona con el escenario con una caja más pequeña, de 8x12 pixels. Esto permite tener un control más agradable en motores de vista lateral cuando el sprite no suele ocupar todo el ancho de la caja de 16x16. Además, permite entrar por huecos de un sólo tile más fácilmente.

* `FIRE_TO_JUMP`: se usa con `PLAYER_HAS_JUMP` para saltar pulsando el botón de disparo en vez de "arriba".

* `BOTH_KEYS_JUMP`: se usa con `PLAYER_HAS_JUMP` para saltar con el botón de disparo o pulsando "arriba". **Si activas esta, desactiva la anterior**.

* `RAMIRO_HOP`: se usa con `PLAYER_HAS_JUMP`. Si mientras estás saltando alcanzas una plataforma (tile con comportamiento `& 4`) el jugador podrá saltar de nuevo si estás pulsando el botón de salto aunque no estés completamente sobre la plataforma.

* `RAMIRO_HOVER`: Si se pulsa "abajo" mientras se cae, el jugador revolotea. En lugar de `PLAYER_MAX_VY_CAYENDO` y `PLAYER_G` se emplean `PLAYER_MAX_VY_CAYENDO_H` y `PLAYER_G_HOVER`. Si se emplean valores mayores en las variantes "hover" que en las normales, se puede conseguir el efecto contrario: caer "con más peso".

* `PLAYER_HAS_JETPAC`: Pulsar "arriba" para volar. Puede combinarse con el salto, pero debe configurarse otro botón. El jetpac se configura con las siguientes directivas:

    * `JETPAC_DRAINS_LIFE`: Volar quita vida.
    * `JETPAC_DRAIN_RATIO`: Se drena cada N cuadros de juego. 
    * `JETPAC_DRAIN_OFFSET`: Se empieza a drenar tras N cuadros de juego.

* `PLAYER_KILLS_ENEMIES`: Se puede saltar sobre los enemigos para matarlos.

* `PLAYER_MIN_KILLABLE`: se usa con `PLAYER_KILLS_ENEMIES` o con `ENABLE_SWORD`: Si se define, sólo se puede matar a los enemigos con id >= a este valor.

* `PLAYER_MAX_KILLABLE`: se usa con `PLAYER_KILLS_ENEMIES` o con `ENABLE_SWORD`: Si se define, sólo se puede matar a los enemigos con id <= a este valor.

## Algunas cosas especiales que puedes encontrar útiles

Son customizaciones misceláneas que se añadieron para algunos juegos que te pueden servir. Recordad que v5 era "la churrera Vanilla que podrás completar" y v4 era "la churrera frankenstein que manteníamos internamente".

```c
	#define MASTER_OF_KEYS 						// If master_of_keys == 1, no keys are needed to open bolts
												// and keys = refills.
	#define PARALYZED_DONT_KILL_ON_VAR 			// If paralyzed_dont_kill == 1, paralyzed enemies don't kill
	#define RAMIRO_HOVER_ON_VAR 				// If ramiro_hover == 1 player can hover.
	#define DISABLE_SLIPPERY_ON_VAR 			// If disable_slippery == 1, slippery tiles are disabled
```

* `MASTER_OF_KEYS`: Si se define, la variable `master_of_keys` controlará si el jugador puede abrir cerrojos sin llaves. `master_of_keys` debe ser puesta a 0 explícitamente por el programador para que el comportamiento llaves/cerrojos sea el normal. Si `master_of_keys` está activo, los hotspots que contengan llaves se cambiarán por recargas de vida al entrar en las pantallas de nuevo.

* `PARALYZED_DONT_KILL_ON_VAR` (que excluye a `PARALYZED_DONT_KILL`),te deja controlar si los enemigos matan mientras están paralizados según el valor de `paralyzed_dont_kill`. Esta variable debe ser puesta a 0 explícitamente para que los enemigos maten cuando están paralizados.

* `RAMIRO_HOVER_ON_VAR` necesita `RAMIRO_HOVER` pero sólo activará el revoloteo ramiresco si `ramiro_hover` vale 1. Esta variable debe ser puesta a 0 explícitamente para que el jugador no pueda revolotear.

* `DISABLE_SLIPPERY_ON_VAR` funciona obviamente con `SLIPPERY_TILES`. Si `disable_slippery` vale 1 los tiles resbalosos no resbalan. Esta variable debe ser puesta a 0 explícitamente para que el jugador resbale.

## Configuración de la pantalla

Estas directivas controlan la ubicación del area de juego y de los marcadores. En el caso de los marcadores, si se comentan las directivas que definen la ubicación no se pintará el marcador correspondiente.

```c
    #define VIEWPORT_X              0       //
    #define VIEWPORT_Y              2       // Viewport character coordinates
```

* `VIEWPORT_X`, `VIEWPORT_Y` controla la ubicación del área de juego.

```c
    #define LIFE_X                  30      //
    #define LIFE_Y                  8       // Life gauge counter character coordinates
    //#define DRAW_HI_DIGIT 
    //#define LIFE_H_X              1
    //#define LIFE_H_Y              8

    #define OBJECTS_X               30      //
    #define OBJECTS_Y               12      // Objects counter character coordinates
    //#define OBJECTS_ICON_X        2       // 
    //#define OBJECTS_ICON_Y        21      // Objects icon character coordinates (use with ONLY_ONE_OBJECT)

    #define KEYS_X                  30      //
    #define KEYS_Y                  16      // Keys counter character coordinates

    //#define SHOW_KILLED
    //#define SHOW_TOTAL
    //#define KILLED_X              20      //
    //#define KILLED_Y              21      // Kills counter character coordinates

    // Use this to show tile = ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1 at coordinates
    // ITEM_SHOW_X, ITEM_SHOW_Y.

    //#define PLAYER_SHOW_ITEM              // If defined, current item is shown (scripting needed)
    //#define ITEM_IN_FLAG          4       // Which flag is used to store current item.
    //#define ITEM_FIRST_TILE       17      // First tile in tileset representing an object
    //#define ITEM_SHOW_X           2       //
    //#define ITEM_SHOW_Y           21      // Position

    //#define COINS_X               12      // Coins coint character coordinates
    //#define COINS_Y               23

    //#define EVIL_GAUGE_X          21      // For evil zone counters
    //#define EVIL_GAUGE_Y          23
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
    //#define LINE_OF_TEXT          23
    //#define LINE_OF_TEXT_X        1
    //#define LINE_OF_TEXT_SUBSTR   2
    //#define LINE_OF_TEXT_ATTR     7   
```

El texto tendrá `32 - LINE_OF_TEXT_SUBSTR` caracteres de ancho y se imprimirá con el atributo de color `LINE_OF_TEXT_ATTR` en las coordenadas (`LINE_OF_TEXT_X`, `LINE_OF_TEXT`).

Si no se va a usar `TEXT` desde scripting es mejor dejar toda esta sección comentada.

## Efectos miscelaneos y formato de mapa

Las siguientes directivas controlan aspectos relacionados con cómo se interpretan los datos del mapa, qué forma tiene, y cómo se dibuja. 

```
    //#define USE_AUTO_SHADOWS              // Automatic shadows made of darker attributes
    //#define USE_AUTO_TILE_SHADOWS         // Automatic shadows using specially defined tiles 32-47.
    //#define UNPACKED_MAP                  // Full, uncompressed maps. Shadows settings are ignored.
    //#define COLUMN_MAP                    // Do not check horizontal screen flicks
    //#define ROW_MAP                       // Do not check vertical screen flicks
    //#define NO_ALT_BG                     // No alternative tile 19 for bg = 0
    #define NO_MAX_ENEMS                    // Less than 3 enems in some screens
    //#define TWO_SETS                      // If defined, two sets of tiles. Second set is activated if
    //#define TWO_SETS_REAL                 // Tiles have their real value in map_buff
    //#define TWO_SETS_CONDITION    (n_pant>14?32:0)    // Must return 32 if second tileset is active, 0 otherwise.
    //#define MAPPED_TILESETS               // Like packed but tiles are mapped with array tileset_mappings
    //#define RLE_MAP               62      // Use RLE compression (values 44, 54, 62; see docs)
```

* `USE_AUTO_SHADOWS` utiliza atributos para dibujar sombras que los tiles obstáculo (`& 8`) proyectan sobre los tiles traspasables. Para usar con juegos que usen mapas de 16 tiles.

* `USE_AUTO_TILE_SHADOWS` utiliza la última fila de tiles del tileset para componer las sombras, como se vio en el capítulo 1. Esta opción y la anterior son excluyentes y hacen que el render sea más lento y ocupe bastante más.

* `UNPACKED_MAP` actívala si usas 48 tiles en el mapa. Además, tendrás que modificar `comp.bat` para que no se incluya el parámetro `packed` en la llamada a `mapcnv.exe`.

* `COLUMN_MAP` actívala y no se comprobarán las conexiones laterales entre pantallas aunque intentes salir por la izquierda o por la derecha.

* `ROW_MAP` idem, pero con las conexiones verticales.

* `NO_ALT_BG`: si se define, en modo de mapas de 16 tiles, hace que el tile 0 no se sustituya al azar por el 19 como decoración.

* `NO_MAX_ENEMS`: si todas las pantallas de tu juego tienen los 3 enemigos, comenta esta directiva para ahorrar bastante espacio.

* `TWO_SETS` y `TWO_SETS_REAL` permiten usar dos tilesets de 16 tiles. El mapa sigue codificando sólo 16 tiles (*packed*), pero puedes elegir si se dibuja usando la primera o la última fila del tileset según la condición definida en `TWO_SETS_CONDITION`. Esta condición puede ser cualquier expresión o incluso llamar a una función *custom*. 

La diferencia entre `TWO_SETS` y `TWO_SETS_REAL` es que la primera sólo introduce valores de 1 a 16 en `map_buff` (el buffer de pantalla) y la segunda introduce los valores *reales* de los tiles que se pintan (1 a 16 o 32 a 47 dependiendo de la pantalla).

* `MAPPED_TILESETS`: el mapa sigue usando 16 tiles (tipo *packed*), pero puedes decidir qué 16 tiles de los 48 se usan para dibujar el mapa. Para ello debes apuntar el puntero `tileset_mappings` a un array con 16 valores.

* `RLE_MAP`: sirve para usar compresión RLE en los mapas. Es esencialmente util si vamos a usar tilesets de 32 o 48 tiles y no queremos aplicar ninguna de las restricciones arriba especificadas. El valor de `RLE_MAP` puede ser 53 o 62 (44 no se soporta por el momento) según se comprima el mapa con `rle53map_sp` (hasta 32 tiles) o `rle62map_sp` (hasta 64 - en realidad 48 - tiles). Véase **Zombie Calavera** (no prologue) para más información.

### Tiles animados estúpidos

```c
    // Stupid animated tiles
    #define ENABLE_ANIMATED_TILES           // Enables them
    #define ANIMATED_TILE 			30 		// Which tile. Alternates with N + 16 / + 1 depending on:
	#define ANIMATED_NEXT					// Alternate with N + 1 rather than N + 16
    #define MAX_ANIMATED_TILES      16      // Must be a power of two
```

El soporte de tiles animados es muy rudimentario y se activa definiendo la macro `ENABLE_ANIMATED_TILES`. Se puede elegir un tile `ANIMATED_TILE` para ser el tile animado. Este tile puede aparecer hasta `MAX_ANIMATED_TILES` veces en pantalla (debe ser potencia de 2). Cada frame se selecciona uno de los tiles y se alterna entre `ANIMATED_TILE` y `ANIMATED_TILE + 16` o `ANIMATED_TILE` y `ANIMATED_TILE + 1` si se activó `ANIMATED_NEXT`.

### Modo sin máscaras

El motor se puede configurar para no usar máscaras y volcar los sprites con OR o XOR (esta última opción para los entusiastas de los sprites fantasmunos de AGD):

```c
    #define NO_MASKS                    sp_OR_SPRITE    // make it sp_XOR_SPRITE or sp_OR_SPRITE
```



## Configuración del movimiento

El movimiento del personaje se puede descomponer en su componente vertical, y su componente horizontal. Ambas componentes se comportan como Movimientos Rectilíneos Uniformemente Acelerados, es decir, que en ambos se maneja su posición, su velocidad, y su aceleración. El motor tiene una resolucioón de 64avos de píxel, por lo que, para calcular el valor en píxels, habrá que dividir los valores que aparecen en el motor por 64. Los valores funcionan por separado (vertical/horizontal) en los juegos de plataformas. En los juegos de vista cenital, los valores de la sección horizontal funcionan en ambos ejes. 

```c
    // IV.1. Vertical movement. Only for side-view.

    #define PLAYER_MAX_VY_CAYENDO   512     // Max falling speed (512/64 = 8 pixels/frame)
    #define PLAYER_G                32      // Gravity acceleration (32/64 = 0.5 píxeles/frame^2)

    #define PLAYER_MAX_VY_CAYENDO_H 256     // For RAMIRO_HOVER
    #define PLAYER_G_HOVER          4

    #define PLAYER_VY_INICIAL_SALTO 64      // Initial junp velocity (64/64 = 1 píxel/frame)
    #define PLAYER_MAX_VY_SALTANDO  320     // Max jump velocity (320/64 = 5 píxels/frame)
    #define PLAYER_INCR_SALTO       48      // acceleration while JUMP is pressed (48/64 = 0.75 píxeles/frame^2)

    #define PLAYER_INCR_JETPAC      48      // Vertical jetpac gauge
    #define PLAYER_MAX_VY_JETPAC    384     // Max vertical jetpac speed

    // IV.2. Horizontal (side view) or general (top view) movement.

    #define PLAYER_MAX_VX           256     // Max velocity (192/64 = 3 píxels/frame)
    #define PLAYER_AX               32      // Acceleration (24/64 = 0,375 píxels/frame^2)
    #define PLAYER_RX               24      // Friction (32/64 = 0,5 píxels/frame^2)

    #define PLAYER_AX_SLIPPERY      8
    #define PLAYER_RX_SLIPPERY      8
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

Cada uno de nuestros 16 tiles tendrá un comportamiento definido. Para esta versión de la **MTE MK1**  hay ocho comportamientos base posibles: 

|#|Comportamiento
|---|---
|0|traspasable
|1|mata (pinchos, lava)
|2|traspasable y esconde
|3|traspasable, evil zone (ver `DEACTIVATE_EVIL_ZONE`)
|4|plataforma. En vista lateral, sólo detiene desde arriba.
|8|obstáculo
|16|resbaloso (sólo vista lateral)
|32|destructible

Los comportamientos base son por lo general acumulables: puedes obtener estados combinados sumando los valores de los estados base. En esta versión de **MTE MK1** el comportamiento 1 (mata) y el comportamiento 3 (evil zone) no pueden combinarse con otros.

Por ejemplo, 

* 8 (obstáculo) + 32 (destructible) = 40 (obstáculo destructible).
* 4 (plataforma) + 16 (resbaloso) = 20 (plataforma resbalosa).
...

El comportamiento 3 NO es una combinación de 1+2, ya que 1 no se puede combinar en esta versión del motor. El comportamiento 7 NO funcionará como cominación de 3+4, ya que el 3 no se puede combinar en esta versión del motor.

## Memoria dinámica para sprites

Activar el motor de disparos o la espada precisa añadir más sprites. Los sprites necesitan un pool de memoria dinámica que se reserva a partir de la dirección `AD_FREE`. La cantidad de memoria para sprites que se reserva se controla con `NUMBLOCKS`, que define el número de bloques para sprites que se va a reservar.

Dependiendo del tamaño de los sprites, necesitarán más o menos bloques. Los sprites de 16x16 necesitan 10 bloques cada uno, y los de 8x8 necesitan 5. La fórmula es:

1 + ((alto / 8) + 1) * ((ancho / 8) + 1)

Si no activas disparos ni espada, el motor sólo controlará sprites para el jugador y los tres enemigos, en total 4 sprites de 16x16, por eso al principio de `churromain.c` vemos esta linea:

```c
    #define NUMBLOCKS       40
```

Por cada bala que haya en el juego (en total `MAX_BULLETS`) deberás añadir 5 más. Para tres balas, por tanto, el valor debería ser:

```c
    #define NUMBLOCKS       55
```

Si en cambio activas la espada, sólo hará falta un sprite más de 8x8, por lo tanto:

```c
    #define NUMBLOCKS       45
```

En algunos juegos se añade más sprites de forma *custom*, como en **Ramiro 4** (el objeto que lleva). En este caso tendríamos los 4 sprites base más uno más de 16x16, que serían 10 bloques más:

```c
    #define NUMBLOCKS       50
```

# Capítulo 7 - Scripting

Los juegos de **MTE MK1** se pueden personalizar usando código C en `custom.h`, el sistema **msc** de scripting, o una combinación de ambos. 

## msc

**msc** significa "Mojon Script Compiler". Es un compilador de *scripts* basados en cláusulas a un *bytecode* fácilmente interpretable por el motor. El compilador genera dos archivos, `msc-config.h` y `msc.h`, que serán incluidos en tu juego si defines la macro `ACTIVATE_SCRIPTING`. `msc.h` utilizará la función `do_extern_action` del archivo `msc_extern.h` si empleas el comando `EXTERN`.

**msc** se ejecuta desde linea de comandos y su sintaxis es:

```cmd
    $ msc.exe script.spt msc.h N [flipflops] [shortsettile]
```

`script.spt` es el archivo de entrada, `msc.h` el archivo con el intérprete y el *bytecode* (que debe llamarse `msc.h` para **MTE MK1**), y `N` es el número de pantallas `MAP_W * MAP_H`.

Si especificas `flipflops`, las comprobaciones `IF FLAG n = 1|0` o `SET FLAG n = 1|0` (esto es, comprobar si un flag vale 1 o 0, o asignar el valor 1 o 0 a un flag) sólo ocupan un byte, si n < 16. Si usas muchas de estas comprobaciones o comandos, esto reducirá el tamaño de tu script.

`shortsettile` utiliza sólo dos bytes para los comandos `SET TILE (x, y) = n` en lugar de tres, pero no perimte que `x` o `y` sean referencias a contenidos de flags. Si todos tus `SET TILE` tienen valores directamente en `x` e `y`, utilizar `shortsettile` reducirá el tamaño de tu script.

## motor de cláusulas

Los *scripts* de MK1 se organizan en secciones. Cada sección se ejecutará en un momento preciso y en una pantalla precisa.

Principalmente tenemos secciones tipo ENTERING, que se ejecutarán al entrar en una pantalla, secciones PRESS_FIRE, que se ejecutarán al pulsar la tecla de acción, y secciones especiales que responderán a diversos eventos. Estos son los tipos de secciones:

```
    ENTERING SCREEN x
```

Se ejecuta cada vez que el jugador entra en la pantalla x

```
    ENTERING GAME
```

Se ejecuta al empezar cada partida, y sólo esta vez.

```
    ENTERING ANY
```

Se ejecuta al entrar en cada pantalla, justo antes que `ENTERING SCREEN x`

```
    PRESS_FIRE AT SCREEN x
```

Se ejecuta cuando el jugador pulsa la tecla de acción en la pantalla x.

```
    PRESS_FIRE AT ANY
```

Se ejecuta cuando el jugador pulsa la tecla de acción en cualquier pantalla, justo antes que `PRESS_FIRE AT SCREEN x`

```
    PLAYER_GETS_COIN
```

Se ejecuta cuando el jugador toca un tile `TILE_GET`. Necesita tener activada y configurada la funcionalidad `TILE_GET` en config.h así como la directiva `TILE_GET_SCRIPT`. **No disponible en MK1**

```
    PLAYER_KILLS_ENEMY
```

Se ejecuta cuando el jugador mata a un enemigo, siempre que hayamos definido la directiva `RUN*script*ON_KILL` en config.h

-

Los *scripts* `PRESS_FIRE` se ejecutarán en más supuestos además de cuando el jugador pulse acción: Si hemos definido una zona de acción con `SET_FIRE_ZONE` en nuestro *script*, y el jugador entra en dicha zona.

## Cláusulas

Todas las secciones descritas arriba contendrán una lista de cláusulas. Cada cláusula se compone de una lista de comprobaciones y de una lista de comandos. El intérprete recorrerá la lista de comprobaciones en orden, realizando cada comprobación. Si alguna falla, dejará de procesar la cláusula. Si todas las comprobaciones han resultado ser ciertas, se ejecutará la lista de comandos asociada en orden.

La sintaxis es:

```
    IF COMPROBACION
    ...
    THEN
        COMANDO
        ...
    END
```

Todas las cláusulas de una sección se ejecutan en orden, sin parar (a menos que así lo indiques con un comando `BREAK` o tras algunos comandos como `REPOSTN` o `REENTER`).

Muchas veces puedes ahorrar *script* y evitar usar BREAK. La mayoría de las veces el tiempo de ejecución de un *script* no es crítico y puedes permitírtelo.

En vez de:

```
    IF FLAG 1 = 0
    THEN
        SET TILE (2, 4) = 2
        SET FLAG 1 = 1

        # Si no ponemos este break se ejecutará la siguiente
        # cláusula sí o sí, ya que FLAG 1 = 1.
        BREAK
    END

    IF FLAG 1 = 1
    THEN
        SET TILE (2, 4) = 3
    END
```

Puedes hacer:

```
    IF FLAG 1 = 1
    THEN
        SET TILE (2, 4) = 3
    END

    IF FLAG 1 = 0
    THEN
        SET TILE (2, 4) = 2
        SET FLAG 1 = 1
    END
```

Y te ahorras un BREAK.

## Flags

El motor de _scripting_ maneja un conjunto de banderas o flags que pueden contener un valor de 0 a 127 y que se utilizan como variables. Las flags suelen referenciarse como FLAG N con N de 0 a 127 en el *script*.

En casi todas las comprobaciones y comandos que admiten valores inmediatos se puede utilizar la construcción #N donde N es un número de flag, que significa "el valor de la flag N".

Por ejemplo:

```
    IF FLAG 5 = #3
```

Será cierta si el valor de la flag 5 es igual al valor de la flag 3.

Como hemos dicho, el número de flags puede configurarse en `config.h`:

```c
    #define MAX_FLAGS 16
```

Si usas 16 flags o menos y las empleas mayoritariamente para almacenar valores "0" o "1" puedes ahorrar mucho espacio e incrementar la velocidad de proceso del *script* compilando tu script con la opción `flipflops`.

## El intérprete dinámico

**msc** genera un intérprete que sólo será capaz de entender las comprobaciones y comandos que hayas introducido en tu *script*. Esto se hace para ahorrar memoria no generando código que jamás se ejecutará.

A veces hay varias formas de conseguir una cosa en tu *script*. Si tienes que elegir, no elijas la que produzca un *script* más sencillo, sino la que haga que tengas que utilizar menos variedad de comprobaciones o de comandos, ya que un poco más de *script* ocupa muchísimo menos que el código C necesario para ejecutar una comprobación o comando.

## Siempre cierto

Hay una comprobación que siempre vale cierto y que se utiliza para ejecutar comandos en cualquier caso:

```
    IF TRUE
```

## Comprobaciones y comandos relacionados con las flags

Gran parte de tu *script* estará comprobando valores de las flags y modificando dichos valores. Para ello hay todo un set de comprobaciones y comandos.

### Comprobaciones con flags

```
IF FLAG x = n           Evaluará a CIERTO si la flag "x" vale "n"

IF FLAG x < n           Evaluará a CIERTO si la flag "x" < n

IF FLAG x > n           Evaluará a CIERTO si la flag "x" > n

IF FLAG x <> n          Evaluará a CIERTO si la flag "x" <> n
```

### Comandos con flags

```
SET FLAG x = n          Da el valor N a la flag X.
                        Huelga decir que SET FLAG x = #y dará el valor del
                        flag y a la flag x. Pero ya lo he dicho.

INC FLAG x, n           Incrementa el valor de la flag X en N.

DEC FLAG x, n           Decrementa el valor de la flag X en N

FLIPFLOP x              Si x vale 0, valdrá 1. Si vale 1, valdrá 0.
                        Lo que viene a ser un flip-flop, vaya.

SWAP x, y               Intercambia el valor de las flags x e y
```

## Comprobaciones y comandos relacionados con la posición

También tenemos varias formas de comprobar y modificar la posición -- incluso cambiando de pantalla ¡y de nivel!

### Comprobaciones sobre la posición

```
    IF PLAYER_TOUCHES x, y  Evaluará a CIERTO si el jugador está tocando
                            el tile (x, y). x e y pueden llevar #.

    IF PLAYER_IN_X x1, x2   Evaluará a CIERTO si el jugador está horizontalmente
                            entre las coordeadas en píxeles x1 y x2.

    IF PLAYER_IN_Y y1, y2   Evaluará a CIERTO si el jugador está verticalmente
                            entre las coordeandas en pixles y1 e y2.

    IF PLAYER_IN_X_TILES x1, x2
                            Evaluará a CIERTO si el jugador está horizontalmente
                            entre los tiles x1 y x2, ambos inclusive.

    IF PLAYER_IN_Y_TILES y1, y2
                            Evaluará a CIERTO si el jugador está verticalmente
                            entre los tiles y1 e y2, ambos inclusive.
```

### Cambiando de posición

Estos comandos sirven para modificar la posición del personaje. Todas se expresan a nivel de tiles (x de 0 a 14, y de 0 a 9).

```
    SETX x                  Colocará al personaje en la coordenada de tile x
                            (modifica solo la posición horizontal)

    SETY y                  Colocará al personaje en la coordenada de tile y
                            (modifica solo la posición vertical)
```

### Comprobaciones sobre la pantalla

Aunque poder definir *scripts* en ENTERING n y PRESS_FIRE AT n donde n es la pantalla actual y que sólo se ejecuten cuando estamos en dicha pantalla, hay veces en las que es necesario saber en qué pantalla estamos en una de las secciones "generales". Para esos casos tenemos:

```
    IF NPANT n              Evaluará a CIERTO si el jugador está en la pantalla n

    IF NPANT_NOT n          Evaluará a CIERTO si el jugador NO está en la pantalla n
```

### Cambiando de pantalla

```
    WARP_TO n, x, y         Mueve al jugador a la posición (x, y) de la pantalla n.
                            x e y a nivel de tiles.
```

## Redibujar la pantalla y reentrar

Es útil si haces algo que se cargue la pantalla, como sacar un cuadro de texto con un `EXTERN` (ver más adelante) . Así vuelves a pintarlo todo. Sólo hay que ejecutar:

```
    REDRAW
```

Ojete: existe un buffer de tamaño pantalla donde cada cosa que se imprime  (bien por la rutina que se ejecuta al entrar en una pantalla nueva y que compone el escenario, bien por un `SET TILE (X, Y) = T` del _scripting_, etc.) se copia ahí. `REDRAW` simplemente vuelca ese buffer a la pantalla. ¡Si has modificado la pantalla con cosas desde el _script_, `REDRAW` no la va a volver a su estado original!

Si queremos redibujar con las modificaciones ya hechas, tendremos que tirar de código custom. Puedes usar una función como esta (directamente desde **Ramiro 4**) y colocarla por ejemplo al final de `custom.h`:

```c

    void redraw_from_buffer (void) {
        #asm
                ld  a, VIEWPORT_X
                ld  (__x), a
                ld  a, VIEWPORT_Y
                ld  (__y), a
                
                xor a
            .redraw_from_buffer_loop
                ld  (_gpit), a

                ld  bc, (_gpit)
                ld  b, 0
                ld  hl, _map_buff
                add hl, bc
                ld  a, (hl)
                ld  (__t), a

                call _draw_coloured_tile_do

                ld  a, (__x)
                add a, 2
                cp  VIEWPORT_X + 30
                jr  nz, redraw_from_buffer_set_x
                ld  a, (__y)
                add a, 2
                ld  (__y), a
                ld  a, VIEWPORT_X
            .redraw_from_buffer_set_x
                ld  (__x), a

                ld  a, (_gpit)
                inc a
                cp  150
                jr  nz, redraw_from_buffer_loop
        #endasm
    }
```

Luego puedes enganchar a esa función desde el código `EXTERN` (más info más adelante) en `msc_extern.h`:

```c
    void do_extern_action (unsigned char n) {
        if (n == 127) redraw_from_buffer ();
    }
```

Y en vez de usar `REDRAW` en tu *script*, usas `EXTERN 127`.

A veces necesitas volver a ejecutar todo el *script* de `ENTERING ANY` y/o de `ENTERING SCREEN n`, o necesitas reinicializar los enemigos. Para ello tendrás que **reentrar**:

```
    REENTER                 Vuelve a entrar en la pantalla, exactamente igual
                            que si viniésemos de otra. Lo hace todo: redibuja,
                            inicializa todo, ejecuta los scripts...
```

## Modificar la pantalla

Hay varias formas de modificar la pantalla:

### Cambiar tiles del área de juego

Cambiar tiles del área de juego modifica efectivamente el área de juego: además los tiles modificados son interactuables. O sea, si modificas la pantalla eliminando una pared con un tile transparente, el jugador podrá pasar por ahí.

```
    SET TILE (x, y) = t     Pone el tile t en la coordenada (x, y).
                            Las coordenadas (x, y) están a nivel de tiles.
```

Por supuesto, y esto es muy útil, tanto x como y como t pueden llevar `#` para indicar el contenido de una flag. Para imprimir en 4, 5 el tile que diga la flag 2, hacemos

```
    SET TILE (4, 5) = #2.
```

Para imprimir un tile 7 en las coordenadas almacenadas en las flags 2 (x) y 3 (y), hacemos:

```
    SET TILE (#2, #3) = 7
```

Recordamos que si no usas flags en las coordenadas X, Y, puedes especificar el parámero `shortsettile` en la llamada a `msc.exe` para ahorrar espacio.

### Cambiar sólo el comportamiento

Funciona igual que SET TILE pero sólo sustituye el comportamiento original por el que especifiques:

```
    SET BEH (x, y) = b
```

### Imprimir tiles en cualquier sitio

Podemos imprimir un tile en cualquier sitio de la pantalla, sea en el área de juego o bien fuera (por ejemplo, en una zona del marcador). Para ello usamos:

```
    PRINT_TILE_AT (x, y) = n
                            Imprime el time n e (x, y), con (x, y) ¡ojo! en
                            coordenadas DE CARACTER (x = 0-30, y = 0-22).
```

Esta función sólo imprime. Aunque el tile que pintemos esté sobre el área de juego no la afectará en absoluto para nada.

Una cosa muy chula para lo que puede servir esto es para hacer pasajes secretos: en tu mapa haces un pasillo, pero luego en el ENTERING SCREEN lo cubres de tiles con `PRINT_TILE_AT`... Como estos tiles no afectan al área de juego, parecerá que no se puede pasar por ahí... pero ¡sí que se puede!

### Mostrar cambios

Todas las impresiones de tiles en el motor se hacen a un _buffer_. En cada cuadro de juego, este _buffer_ se dibuja en la pantalla siguiendo un divertido y mágico proceso. Sin embargo, durante la ejecución del _script_, no se vuelca el _buffer_ a la pantalla.

Si cambiamos algo y queremos que se vea inmediatamente sin tener que esperar a volver al juego (por ejemplo, si estamos haciendo una animación), necesitamos decirle al intérprete de forma explícita que pinte el _buffer_ en la pantalla. Esto se hace con el comando:

```
    SHOW
```

## Comprobaciones y comandos relacionados con los valores del personaje

Existe todo un set de comprobaciones y comandos que tienen que ver con los valores del personaje (por ejemplo, la vida).

### Comprobaciones

Comprobaciones sobre el número de objetos.

```
    IF PLAYER_HAS_OBJECTS   Evaluará a CIERTO si el jugador tiene objetos.

    IF OBJECT_COUNT = n     Evaluará a CIERTO si el jugador tiene N objetos.
```

Comprobaciones sobre los enemigos matados:

```
    IF ALL_ENEMIES_DEAD     Evaluará a CIERTO si el número de enemigos matados vale 
                            BADDIES_COUNT (según aparece en `enems.h`).

    IF ENEMIES_KILLED_EQUALS n
                            Evaluará a CIERTO si el número de enemigos matados es n.
```

### Comandos

Vida y estado del jugador:

```
    INC LIFE n              Incrementa el valor de la vida en n

    DEC LIFE n              Decrementa el valor de la vida en n

    RECHARGE                Recarga toda la vida (la pone al máximo)

    FLICKER                 Hace que el jugador empiece a parpadear durante
                            un segundo y pico, como cuando te quitan una vida.
```

Objetos coleccionables:

```
    INC OBJECTS n           Añade n objetos más.

    DEC OBJECTS n           Resta n objetos (si objects >= n; si no objects = 0).
```

Si estamos usando la macro `ONLY_ONE_OBJECT`, el contador de objetos del jugador `player.objs` se pondrá a 1 al coger un objeto, y no podrá coger otro hasta que vuelva a valer 0. Para liberarlo utilizamos `DEC OBJECTS 1` si se cumple que `IF PLAYER_HAS_OBJECTS`.

## Comandos relacionados con el nivel

Estos comandos son propios de **MTE MK1 v4** y tienen que ver con las características propias de esta versión que no se mantuvieron en la rama 3.99 ni en las versiones actuales 5+.

Si has activado la macro `COINS_DEACTIVABLE` en `config.h`, puedes ocultar o mostrar las monedas desde el script. Para que se vean los cambios, habrá que reentrar en la pantalla, o habrá que realizar el cambio en otra pantalla diferente a la que tiene las monedas para que éstas se muestren al entrar.

```
    SHOW_COINS              Hace que la próxima vez que se entre en una nueva
                            pantalla (o la misma con REENTER) se muestren las 
                            monedas.

    HIDE_COINS              Hace que la próxima vez que se entre en una nueva
                            pantalla (o la misma con REENTER) se oculten las 
                            monedas.
```

Si tienes activadas las *evil zones* (comentando la macro `DEACTIVATE_EVIL_ZONE` en el script), puedes hacer que maten tras un contador (según `EVIL_ZONE_FRAME_COUNT` y `EVIL_ZONE_BEEPS_COUNT`) o normalmente (en cada frame o según `EVIL_ZONE_FREQ`) desde el script. Es la implementación del *hechizo postizo* de los juegos de **Ramiro**.

```
    ENABLE_KILL_SLOWLY      Hace que las evil zones maten lentamente.

    DISABLE_KILL_SLOWLY     Las evil zones matan normalmente.
```

Si estás usando *fantys* los puedes "paralizar" o "despertar" desde el script con:

```
    ENABLE_TYPE_6           'Despierta' a los fantys.

    DISABLE_TYPE_6          Los fantys no se mueven
```

Si, además, has activado la macro `MAKE_TYPE_6` en `config.h` puedes usar estas dos, que se introdujeron para **Ramiro el Vampiro devuelve el Zafiro**:

```
    ENABLE_MAKE_TILE_6      Al entrar en las pantallas, los enemigos no defi-
                            nidos se convierten en fantys.

    DISABLE_MAKE_TYPE_6     Lo desactiva.
```

## Terminar el juego

Comandos para terminar el juego desde el _scripting_ (es necesario activar, en config.h, `#define WIN_ON_SCRIPTING`, en el caso de que queramos GANAR desde el _script_ - para GAME OVER No es necesario).

```
    GAME OVER               Termina el juego con un GAME OVER.

    WIN GAME                Termina el juego si no hay varios niveles. En juegos
                            con varios niveles termina el nivel actual (y pasa
                            al siguiente, si tu manejador de niveles funciona de
                            esta manera)
```

## Fire Zone

La "fire zone" de una pantalla es una zona rectangular definida a nivel de píxeles que lanzará la sección `PRESS_FIRE` de la pantalla (y `PRESS_FIRE AT ANY`) si el jugador la toca. Nos sirve para lanzar trozos de _script_ cuando el jugador toque algo o entre en algún sitio.

Para definir el `FIRE_ZONE` activo de una pantalla usamos este comando desde cualquier sección de comandos:

```
    SET_FIRE_ZONE x1, y1, x2, y2
```

Que definirá un rectángulo desde (x1, y1) a (x2, y2), en píxeles.

Si quieres desactivar la "fire zone" sólo tienes que poner un rectángulo fuera de rango o vacío:

```
    SET_FIRE_ZONE 0, 0, 0, 0
```

La mayoría de las veces las fire zones hay que calcularlas basándonose en un rango de tiles, así que puedes usar este comando en su lugar:

```
    SET_FIRE_ZONE_TILES tx1, ty1, tx2, ty2
```

donde los parámetros definen un rango en coordenadas de tile (ambos límites inclusive) que msc traducirá internamente a un `SET_FIRE_ZONE` normal.

## Código externo

Hay muchas cosas que no podemos hacer directamente desde el _script_ y por ello el sistema permite ejecutar código externo, que no es más que una función `do_extern_action` definida en `msc_extern.h`:

```c
    void do_extern_action (unsigned char n);
```

En nuestro _script_ disponemos del comando EXTERN:

```
    EXTERN n                Hace una llamada a do_extern_action pasándole "n",
                            donde n es un número de 0 a 255. No se puede usar
                            construcciones #.
```

Cuando haces `EXTERN n` con n un valor de 0 a 255, se ejecutará `do_extern_action` pasándole este valor como parámetro. Así puedes implementar hasta 256 funciones externas que lanzar desde el script. Más arriba vimos un ejemplo que redibujaba la pantalla desde el buffer.

## Otros comandos

```
    SOUND n                 Toca el sonido n. Dependerá de qué sonido sea n.

    TEXT "texto"            Imprime un texto en la linea de textos que hemos
                            definido en config.h con los #define LINE_OF_TEXT,
                            LINE_OF_TEXT_X, y LINE_OF_TEXT_ATTR. El texto debe
                            ir entre comillas.

    NEXT_LEVEL              Pasa a la siguiente pantalla en juegos de pantallas
                            fijas (incrementa n_pant y llama a la función de
                            inicialización init_player_values).
```

## Constantes desde C

Gracias a la forma en la que se codifican los scripts en MK1 v4, puedes importar constantes de C en tu script (por ejemplo, las que introduzcas en `custom.h`) si les pones @ delante. El script las incluirá verbatim (sin el @) en los arrays de `msc.h`.

Por ejemplo, 

```c
    // custom.h
    #define SCORE_DO_ACTION 10
```

```spt
    # script

    ENTERING SCREEN 0
        IF FLAG 5 = 3
        THEN
            INC FLAG 4, @SCORE_DO_ACTION
        END
    END
```

# Capítulo 8 - Código custom

En esta sección vamos a explicar cómo hacer cosas chulas con código custom. Todo ha sido sacado de diversos *postmortems* de juegos hechos con **MTE MK1 v4**. Atención, porque por cosas como estas a lo mejor vas a preferir usar *v4* que una versión actual. Pero antes hay que ver un poco de la API:

## Un poco de la API

Puedes usar estas funciones:

* `void set_map_tile (unsigned char x, unsigned char y, unsigned char t, unsigned char n);` coloca el tile `t`con comportamiento `n` en la posición `(x, y)` (coordenadas de tile) de la pantalla. Para modificar la pantalla actual.

* `void draw_coloured_tile (unsigned char x, unsigned char y, unsigned char t);` dibuja (y sólo dibuja) el tile `t` en las coordenadas de carácter `(x, y)`. Puedes dibujar en cualquier parte de la pantalla, no sólo en el área de juego. Aunque dibujes en el área de juego, no afectará la información de la pantalla actual.

* `void draw_rectangle (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1, unsigned char c);` dibuja un rectángulo desde las coordenadas de carácter `(x0, y0)` a `(x1, y1)` usando el atributo `c`.

* `void draw_scr_background ();` vuelve a dibujar el fondo de la pantalla actual. También actualiza los posibles cerrojos y *hotspots*.

* `void draw_text (unsigned char x, unsigned char y, unsigned char c, unsigned char *s);` escribe el texto `s` en las coordenadas de carácter `(x, y)` usando el atributo `c`.

* `void draw_2_digits (x, y, n);` dibuja el número de dos cifras `n` en `(x, y)`.

* `void espera_activa (n);`: Espera a que pase un rato (definido por `n`) o que pulsemos una tecla. Si estamos usando una ISR (en modo 128 o con el limitador de fps), `n` equivale al número de cuadros de TV (50 = 1segundo). Si no, `n` equivale a un misterioso intervalo, desconocido pero bien definido (expermienta).

* `void saca_a_todo_el_mundo_de_aqui ();`: Saca los sprites estándar (jugador, enemigos, espada, disparos) del área de juego.

* `void render_all_sprites ();`: Mueve todos los sprites a sus lugares correspondientes. Se llama normalmente desde el mainloop pero puede venir bien en tus *customs*, especialmente si los has sacado desde un `EXTERN` del *scripting* o desde un *hook*, ya que se ejecutan antes del `sp_UpdateNow` ¡y tendrás un frame sin sprites!

* `void init_player_values ();`: Inicializa los valores del player: posición inicial, velocidad 0, salto desactivado, etc.

* `void play_sfx (unsigned char s);` reproduce el efecto de sonido `s`, según esta tabla:

|S|Efecto
|---|---
|1|Salto
|2|enemy hit
|3|killzone hit
|4|countdown
|5|coin
|6|object
|7|talk 1
|8|key in lock
|9|shoot
|10|explosion
|11|talk 2  

* `void sp_Border (unsigned char b);` [**splib2**]: Pone el borde de color `b`.

* `void sp_UpdateNow ();` [**splib2**]: Actualiza la pantalla con los últimos cambios.

### Añadiendo sprites

Aunque no sea 100% necesario, el saber no ocupa lugar y te vendrá muy bien comprender cómo funcionan los sprites en **splib2**. Puedes leer sobre ellos [la documentación de **splib2**](https://github.com/mojontwins/MK1/blob/churrera_4/docs/splib2-tutorial.pdf) a partir de la página 12.

Si queremos añadir sprites, además de tener listo un binario que los contenga y que podamos importar, habrá que añadir bloques a `NUMBLOCKS` en `churromain.c` teniendo en cuenta el tamaño del sprite que queramos añadir según la fórmula 

1 + ((alto / 8) + 1) * ((ancho / 8) + 1)

o sea, 5 por cada sprite nuevo de 8x8, 10 si es de 16x16. Ojo, por cada *ente* *sprite* que va a aparecer en pantalla, nada que ver con el número de gráficos distintos que se empléen para animarlos.

Las tareas de convertir, importar y definir sprites varían levemente dependiendo de si son de 8x8 o 16x16:

#### Sprites de 16x16

Si son de 16x16, podemos añadirlos al final de nuestro spriteset básico de `sprites.png`, sencillamente poniéndolos a continuación en nuevas filas:

Luego, modificaremos `comp.bat` para que, en lugar de convertir con `sprcnv.exe`, utilice `sprcnv_exp.exe` (nótese el 2), al que pasaremos además el número total de gráficos y el parámetro `extra` (esto último es obligatorio para que sean compatibles con **MTE MK1 v4**):

```cmd
    ..\utils\sprcnv_exp.exe ..\gfx\sprites.png sprites.h 20 extra  > nul
```

Esto importará los 16 gráficos estándar normalmente, y los gráficos extra a partir del 17 en tres columnas como `extra_sprite_N_a`, `extra_sprite_N_b` y `extra_sprite_N_c`, con N el número de gráfico. Serán estos punteros los que necesitaremos posteriormente para definir los sprites.

Con esto los nuevos gráficos ya estarán convertidos e importados, y sólo tendremos que definir nuestro nuevo ente sprite. 

Empezaremos creando tres nuevas variables: una que apuntará a la estructura de datos del ente sprite, y otras dos que utilizaremos para cambiar su gráfico en el caso de ser necesario (obviamente puedes llamarlas como mejor te venga, esto es un ejemplo):

```c
    struct sp_SS *sp_extra;
    unsigned char *extra_next_frame, *extra_current_frame;
```

Para este tipo de tareas tenemos el *hook* `hook_system_inits`. La definición de sprites en **splib2** para un sprite de 16x16 consiste en una llamada inicial a `sp_CreateSpr` y dos llamadas extra `sp_AddColSpr` para añadir las dos columnas extra. Podemos definir el sprite utilizando las tres columnas de cualquiera de sus gráficos. Por ejemplo, aquí definimos un sprite extra utilizando `extra_sprite_17_*`:

```c
    void hook_system_inits (void) {
        sp_extra = sp_CreateSpr (sp_MASK_SPRITE, 3, extra_sprite_17_a, 3);
        sp_AddColSpr (sp_extra, extra_sprite_17_b);
        sp_AddColSpr (sp_extra, extra_sprite_17_c);
        extra_current_frame = extra_next_frame = extra_sprite_17_a;
    }
```

Una vez definido podemos moverlo adonde queramos con `sp_MoveSprAbs`. 

El tercer parámetro de `sp_MoveSprAbs` es un *offset*, un valor que se *sumará* al puntero que la estructura del ente sprite mantiene apuntando al las columnas gráfico del sprite. Si tu sprite siempre va a tener el gráfico con el que se definió y nunca va a cambiar, puedes pasar un "0" en este campo y pasar completamente de las variables `extra_current_frame` y `extra_next_frame`.

Si, en cambio, lo vas a animar, usaremos estas dos variables para mantener el offset en orden, así (`x` e `y` son las coordendas donde se pintará dentro del área de juego, deberemos sustituirlas por las variables que vayamos a usar):

```c
    sp_MoveSprAbs (sp_extra, spritesClip, extra_next_frame - extra_current_frame, VIEWPORT_X + (x >> 3), VIEWPORT_Y + (y >> 3), x & 7, y & 7);
    extra_current_frame = extra_next_frame;
```

De este modo, cuando queramos cambiar el gráfico mostrado, sólo tendremos que asignar el puntero correcto a `extra_current_frame`; por ejemplo, para cambiar al gráfico 20:

```c
    extra_next_frame = extra_sprite_20_a;
```

Si queremos sacar el sprite de la pantalla haremos literalmente eso:

```c
    sp_MoveSprAbs (sp_extra, spritesClip, 0, VIEWPORT_X + 30, VIEWPORT_Y + 20, 0, 0);
```

#### Sprites de 8x8

En el caso de los sprites de 8x8 la conversión e importación es más enrevesada, la definición muy parecida, y la utilización idéntica a la de los sprites de 16x16.

Para convertir sprites de 8x8 deberemos definir un spriteset extra de 8x8. Los spritesets de 8x8 son muy parecidos a los normales: gráficos png de hasta 256 píxels de ancho y todo lo que necesitemos de alto, con todos los gráficos y sus máscaras uno al lado de otro. Ya has leído sobre spritesets de 8x8 en este manual: el spriteset de la espada es un claro ejemplo de spriteset de 8x8.

Una vez tenemos el spriteset de 8x8 disponible como archivo png en `gfx/`, añadiremos a `comp.bat` una llamada a `sprcnv8bin.exe`, que convierte estos spritesets y genera binarios. Por ejemplo, esta linea es la que convierte 2 nuevos gráficos de 8x8:

``..\utils\sprcnvbin8.exe ..\gfx\sprite_extra_8x8.png sprite_extra.bin 2 > nul`` 

Los gráficos de 8x8 par sprites ocupan 64 bytes cada uno, y se componen de dos columnas de 32 bytes cada una. Una vez convertidos, tendremos que importarlos en nuestro binario. Podemos hacerlo al principio de `custom.h`, definiendo un array tipo `extern` y luego importando desde un bloque `#asm / #endasm` empleando la directiva `BINARY`:

```c
    extern unsigned char sprite_extra [];
    #asm
        ._sprite_extra
            BINARY "sprite_extra.bin"
    #endasm
```

Con esto los nuevos gráficos ya estarán convertidos e importados, y sólo tendremos que definir nuestro nuevo ente sprite. 

Empezaremos creando tres nuevas variables: una que apuntará a la estructura de datos del ente sprite, y otras dos que utilizaremos para cambiar su gráfico en el caso de ser necesario (obviamente puedes llamarlas como mejor te venga, esto es un ejemplo):

```c
    struct sp_SS *sp_extra;
    unsigned char *extra_next_frame, *extra_current_frame;
```

Como en el caso de 16x16, utilizaremos el *hook* `hook_system_inits` para crear nuestro sprite de 8x8. En este caso sólo tenemos una columna que añadir (porque los sprites de 8x8 tienen dos columnas en total):

```c
    void hook_system_inits (void) {
        sp_extra = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_extra, 3);
        sp_AddColSpr (sp_extra, sprite_extra + 32);
    }
```

Como aquí no tenemos punteros a cada columna, calculamos la dirección de la columna sumando 32 al puntero que apunta al primer sprite.

El manejo es igual que en los sprites de 16x16 que hemos visto antes, con el detalle de que para cambiar de gráfico no tendremos un puntero definido a cada uno, sino que tendremos que calcularlos mediante la fórmula:

`sprite_extra` + N * 64

Donde N es el número de gráfico, empezando por 0.

### Sprite principal de 16x24

A partir de la v4.9, y en el caso de que sólo vayas a usar los 8 *cells* básicos para tu sprite, puedes hacer que estos sean de 16x24 en lugar de 16x16. Si haces esto, además, la colisión pasará a ser de 8x16 en el caso de haber activado (seguirá siendo de 16x16 en caso contrario) centrada enla parte inferior del cuadro.

En esta iteración el tema es aún un poco hack, y por eso tenemos la restricción de que sólo puede usarse en los 8 primeros *cells* del spriteset. Tu spriteset debe tener, por tanto, este aspecto:

Y debe convertirse indicando `tall` como parámetro extra en `sprcnv_exp`, por ejemplo:

```cmd
	..\utils\sprcnv_exp.exe ..\gfx\sprites.png sprites.h 16 tall > nul
```

Una vez hecho esto, sólo hay que activar la directiva `TALL_PLAYER` en `config.h`.

### La estructura `scenery_info`

Esta estructura contiene una serie de flags que modifican el comportamiento del motor:

```c
    typedef struct {
        unsigned char show_coins;   
        unsigned char evil_kills_slowly;
        unsigned char evil_zone_active;
        unsigned char allow_type_6;
        #ifdef MAKE_TYPE_6
            unsigned char make_type_6;
        #endif
    } SCENERY_INFO;
```

* `scenery_info.show_coins`: Si se activa la macro `COINS_DEACTIVABLE`, y vale 1, se dibujan las monedas; si vale 0, se dibuja el tile `COIN_TILE_DEACT_SUBS` en su lugar.

* `scenery_info.evil_kills_slowly`: Si las *evil zones* están activas, el valor de esta flag hará que maten directamente (0) o que maten tras agotarse el contador controlado con `EVIL_ZONE_FRAME_COUNT` y `EVIL_ZONE_BEEPS_COUNT` (1).

* `scenery_info.evil_zone_active`: Si las *evil zones* están activas y se define la macro `EVIL_ZONE_CONDITIONAL`, podemos desactivar completamente las *evil zones* poniendo un 0 en este flag (1 para activarlas).

* `scenery_info.allow_type_6`: Si vale 1 (por defecto), los *fantys* se mueven. Si vale 0, se quedan paralizados.

* `scenery_info.make_type_6`: Si activamos la macro `MAKE_TYPE_6` y esta flag vale 1, los enemigos que falten de cada pantalla (los no definidos) serán sustituidos por *fantys*.

## Añadir tipos de *hotspots*

Añadir tipos de *hotspots* además de los que soporta el motor es muy sencillo, ya que el motor dibujará cualquier hotspot de tipo `N` con el tile `16+N`, y además detectará que el jugador lo toca y pondrá su número en `latest_hotspot` durante el frame actual. De este modo, puedes poner un `if` en `hook_mainloop` que compruebe que `latest_hotspot` valga el número de tu hotspot custom, y actuar en consecuencia.

Por defecto, los *hotspots* que el jugador toca se marcan como "recogidos" y se eliminan de la pantalla. Hay veces en las que no queremos que esto ocurra, como es el caso de los *resonadores* de **Cheril Perils**, que están implementados mediante *hotspots*. Por suerte, `hook_mainloop` se ejecuta antes de actualizar la pantalla, por lo que podemos revertir esto sin que se note. Puedes tomar prestada esta función del código *custom* de **Cheril Perils** y copiarla al principio de tu `custom.h`:

```c
    void set_hotspot (unsigned char hn) {
        hotspots [n_pant].act = 1;
        hotspot_t = hn;
        hotspots [n_pant].tipo = hotspot_t;
        rdx = (hotspots [n_pant].xy >> 4);
        rdy = (hotspots [n_pant].xy & 15);
        hotspot_x = rdx << 4;
        hotspot_y = rdy << 4;
        set_map_tile (rdx, rdy, 16 + hn, 0);
    }
```

Este código mínimo en `hook_mainloop` hará que un hotspot de tipo 6 pueda "tocarse", pero no desaparezca:

```c
    if (latest_hotspot == 6) {
        // el jugador tocó el hotspot de tipo 6

        // (actuar en consecuencia aquí)

        // no queremos que desaparezca:
        set_hotspot (6);
    }
```

Puedes ahorrar muchos ciclos y 73 bytes si usas la versión en ensamble:

```c
    void set_hotspot (unsigned char hn) {
        // Hotspot structure is xy, tipo, act.
        hotspot_t = hn;

        #asm
            // First, make a pointer to hotspots [n_pant]
                ld  a, (_n_pant)
                ld  b, a
                sla a               // x2
                add a, b            // x3
                ld  c, a
                ld  b, 0
                ld  hl, _hotspots
                add hl, bc

            // We'll be using xy and modifying tipo and act.
                ld  c, (hl)         // C = xy
                inc hl              // now HL points to tipo

            // hotspots [n_pant].tipo = hotspot_t;
                ld  a, (_hotspot_t)
                ld  (hl), a
                inc hl              // now HL points to act

            // hotspots [n_pant].act = 1;
                ld  a, 1
                ld  (hl), a

            // rdx = (hotspots [n_pant].xy >> 4);
                ld  a, c
                srl a
                srl a
                srl a
                srl a
                ld  (_rdx), a
            
            // hotspot_x = rdx << 4;
                ld  a, c
                and 0xf0
                ld  (_hotspot_x), a

            // rdy = (hotspots [n_pant].xy & 15);
                ld  a, c
                and 15
                ld  (_rdy), a
            
            // hotspot_y = rdy << 4;
                sla a
                sla a
                sla a
                sla a
                ld  (_hotspot_y), a
        #endasm

        set_map_tile (rdx, rdy, 16 + hn, 0);
    }
```

## Paralizar a los enemigos

Si activas `ENEMIES_MAY_BE_PARALIZED` puedes paralizar a cualquiera de los enemigos que hay en pantalla colocando su `en_an_state` a `ENEM_PARALYZED` y estableciendo un número de cuadros en `en_an_count`. Los enemigos paralizados recuperarán su estado normal cuando se agote el contador. Una forma de evitar esto y que se desparalicen cuando tú quieras es restaurar continuamente el valor de `en_an_count`. 

## Vida extra tras N monedas

Para juegos con energía en vez de vidas como Ramiro tenemos `COIN_REFILL` que te da un poco de vida cada vez que coges una moneda, pero para juegos con vidas puede ser interesante hacer que tras N monedas tengamos una recarga. Podemos añadir este código en `hook_mainloop`:

```c
    if (flags [COIN_FLAG] == 25) {
        play_sfx (6);
        player.life ++;
        flags [COIN_FLAG] = 0;
    }
```

## Multilevel falso

Puedes engañar al chamán y tener varios niveles de forma muy sencilla haciendo un mapa muy grande. El truco está en ejecutar una detección en `hook_init_mainloop (void)` de que debe iniciarse un nuevo nivel, y ahí ocuparse de colocar al jugador donde sea y hacer las inicializaciones que resulten pertinentes (por ejemplo, cambiar el puntero `tileset_mappings`, reiniciar los objetos, etc).

Se puede hacer de muchas formas. Esto es sólo un ejemplo sencillo (todo en `custom.h`). Empezamos creando estas variables:

```c
    unsigned char level, new_level;
    unsigned char new_level_string [] = "LEVEL 00";
```

* `level` indicará en qué fase estamos (0 la primera).
* `new_level` es una bandera. Si vale 1, habrá que "pasar de fase".
* `new_level_string` se usará para poner una especie de entradilla con el número de nivel.

Hecho esto, vamos a crear tres arrays (mínimo; si vamos a tener cosas como número máximo de objetos o cosas así por cada nivel necesitaremos más) para saber dónde empezamos cada fase. Por ejemplo, para tres fases, defino tres pantallas de inicio y tres posiciones X, Y:

```c
    unsigned char scr_ini [] = { 60, 64, 68 };
    unsigned char ini_x [] = { 1, 1, 1 };
    unsigned char ini_y [] = { 4, 4, 4 };
```

Lo siguiente es inicializar el sistema en `hook_init_game`. Ponemos `level` a 0 y `new_level` a 1, para indicar que nada más empezar queremos la pantalla de nuevo nivel:

```c
    void hook_init_game (void) {
        level = 0;
        new_level = 1;

        // Mas inicializaciones por aquí . . .
    }
```

Lo siguiente será mostrar la pantalla de nuevo nivel y hacer las inicializaciones precisas si `new_level` vale 1. Queremos hacer esto al principio de cada loop de juego, donde se entra sin que la pantalla esté pintada:

```c
    void hook_init_mainloop (void) {
        if (new_level) {
            new_level = 0;
            sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
            sp_Invalidate (spritesClip, spritesClip);
            new_level_string [7] = level + '1';
            draw_text (12, 11, 71, new_level_string);
            draw_text (11, 13, 71, "GET READY!");
            sp_UpdateNow ();
            play_sfx (10);
            espera_activa (150);
            n_pant = scr_ini [level];
            init_player_values ();
            
            // Añadir más inicializaciones aquí
        }
    }
```

Cuando queramos "pasar de fase", que según el juego será cumpliendo la condición que sea, sólo tendremos que incrementar `level` (o cambiarlo a placer) y poner a 1 `new_level`.

## Ganar o perder

Si quieres ganar o perder dede tus customs, sólo tienes que asignar un valor a `game_loop_flag`. Normalmente vale 0, pero si vale 1 ganarás el juego (se mostrará `game_ending`) y si vale 2 perderás (el mensaje de *Game Over*).

## Como hacer continues

Se trata de crear una variable `continue_on`, darle 0 en `hook_system_inits`, y luego programar la pantalla extra en `title_screen` de `pantallas.h`, de modo que el valor de `level` sólo se ponga a 0 si no se continua. Obviamente, tendrás que quitar `level = 0` de `hook_init_game`.

```c
    void title_screen (void) {
        // CUSTOM {
        // Continue screen

        sp_UpdateNow();
        asm_int = (unsigned int) (s_title); unpack ();

        if (continue_on) {
            draw_text (11, 15, 71, "CONTINUE ?");
            draw_text (13, 16, 71, "1> YES");
            draw_text (13, 17, 71, "2> NO");
            sp_UpdateNow ();

            while (1) {
                if (sp_KeyPressed (key_1)) {
                    goto after_title;
                } else if (sp_KeyPressed (key_2)) { 
                    level = 0; break; 
                }
            }
        }
        while (any_key ());
        continue_on = (level != 0);

        // } END_OF_CUSTOM

        // CUSTOM {
        // Print options
        draw_text (11, 15, 71, "1>KEYBOARD");
        draw_text (11, 16, 71, "2>KEMPSTON");
        draw_text (11, 17, 71, "3>SINCLAIR");
        sp_UpdateNow ();
        // }

        #asm
            ; Music generated by beepola

            call musicstart

            #if !(defined MODE_128K_DUAL || defined MIN_FAPS_PER_FRAME)
                di
            #endif
        #endasm
        
        while (1) {
            if (sp_KeyPressed (key_1)) {
                joyfunc = sp_JoyKeyboard; break;
            } else if (sp_KeyPressed (key_2)) {
                joyfunc = sp_JoyKempston; break;
            } else if (sp_KeyPressed (key_3)) {
                joyfunc = sp_JoySinclair1; break;
            }           
        }

        after_title:
    }
```

## Rutinas de movimiento personalizadas

Si no te vale con lo que hay para tu juego, puedes desactivar los ejes vertical y/o vertical y programar los tuyos propios. Para ello tendrás que añadir esto al principio de `config.h` (no viene por defecto):

```c
    #define PLAYER_CUSTOM_VERT_AXIS
    #define PLAYER_CUSTOM_HORZ_AXIS
```

Puedes definir cualquiera de los dos, o los dos, dependiendo de tus necesidades. Cada una de estas directivas desactiva el código que modifica `player.vy` o `player.vx`, respectivamente. Esto significa que tendrás que añadir tu código:

* Si has desactivado el eje vertical con `PLAYER_CUSTOM_VERT_AXIS`, deberás añadir un archivo `custom_vert_axis.h` con tu código. El archivo podrá leer los controles de `pad0` y deberá terminar estableciendo `player.vy`. Nótese que desactivar el eje vertical desactiva la gravedad, el salto y el jetpack en modo lateral.

* Si has desactivado el eje vertical con `PLAYER_CUSTOM_HORZ_AXIS`, deberás añadir un archivo `custom_horz_axis.h` con tu código. El archivo podrá leer los controles de `pad0` y deberá terminar estableciendo `player.vx`.

Como ejemplo tonto puedes ver esta reimplementación del modo genital, que leen `pad0` y terminan modificando `player.vy` y `player.vx`:

```c
    // custom_vert_axis.h
    if ( ((pad0 & sp_UP) != 0 && (pad0 & sp_DOWN) != 0)) {
        if (player.vy > 0) {
            player.vy -= player.rx;
            if (player.vy < 0)
                player.vy = 0;
        } else if (player.vy < 0) {
            player.vy += player.rx;
            if (player.vy > 0)
                player.vy = 0;
        }
    }

    if ((pad0 & sp_UP) == 0) {
        if (player.vy > -player.max_vx) {
            player.vy -= player.ax;                 
        }
        player.facing = GENITAL_FACING_UP;
    }

    if ((pad0 & sp_DOWN) == 0) {
        if (player.vy < player.max_vx) {
            player.vy += player.ax;
        }
        player.facing = GENITAL_FACING_DOWN;
    }
```

```c
    // custom_horz_axis.h
    if ((pad0 & sp_LEFT) != 0 && (pad0 & sp_RIGHT) != 0) {
        if (player.vx > 0) {
            player.vx -= player.rx;
            if (player.vx < 0)
                player.vx = 0;
        } else if (player.vx < 0) {
            player.vx += player.rx;
            if (player.vx > 0)
                player.vx = 0;
        }
    }

    if ((pad0 & sp_LEFT) == 0) {
        if (player.vx > -player.max_vx) {
            player.vx -= player.ax;
        }
        player.facing = GENITAL_FACING_LEFT;        
    }

    if ((pad0 & sp_RIGHT) == 0) {
        if (player.vx < player.max_vx) {
            player.vx += player.ax;
        }
        player.facing = GENITAL_FACING_RIGHT;       
    }
```

## Selección de sprite personalizada

Para invalidar el código por defecto y usar el tuyo propio, debes añadir esto al principio de `config.h` (no viene por defecto):

```c
    #define PLAYER_CUSTOM_ANIMATION
```

Si lo defines, tendrás que añadir un archivo `custom_animation.h` con tu código, que debe encargarse de examinar el estado del jugador para finalmente dejar `player.next_frame` apuntando al gráfico que debe pintarse en el cuadro actual.

Es posible que para implementar tu selección personalizada necesites definir tu propia array de cells `player_cells`. Para ello, tienes que añadir esta otra directiva en  `config.h` (no viene por defecto):

```c
    #define PLAYER_CUSTOM_CELLS
```

y crear un archivo `custom_player_cells.h` donde se defina este array, que debe contener punteros `sprite_N_a` o `extra_sprite_N_a`.

```c
    // custom_player_cells.h

    unsigned char *player_cells [] = {
        // una colección de sprite_N_a o extra_sprite_N_a
    };
```

## Array de cells de enemigos personalizado

De la misma forma, añadiendo

```c
	#define ENEMS_CUSTOM_CELLS
```

y creando un archivo `custom_enem_cells.h` donde se defina este array, con punteros `sprite_N_a` o `extra_sprite_N_a`:

```c
    // custom_enem_cells.h

    unsigned char *enem_cells [] = {
        // una colección de sprite_N_a o extra_sprite_N_a
    };
```

Podrás definir tu propio array de gráficos para sprites de enemigos. Con esto podrás usar la API de MK1v4 para calcular el frame (`enems_calc_frame ()` para la animación y `enems_en_an_calc ()` para inicializarlos) con más de 4 gráficos diferentes.

## Colisión con enemigos personalizada

Si definimos

```c
	#define ENEMS_CUSTOM_COLLISION
```

al colisionar contra un enemigo se llamará a la función `enems_custom_collision` de `custom.h`. Sólo si esta función devuelve 0 se ejecutará el código normal al colisionar, con lo que puedes controlar esto fácilmente.

## Conexiones de pantalla personalizadas

Para gestionar de una forma más personalizada los cambios de pantalla deberás añadir esta linea en `config.h` (no viene por defecto):

```c
    #define CUSTOM_SCREEN_CONNECTIONS
```

Con esto activo hay que crear un archivo `custom_screen_connections.h` que defina cuatro funciones:

```c
    // custom_screen_connections.h

    unsigned char override_flick_up (void) {
        return 0;
    }

    unsigned char override_flick_down (void) {
        return 0;
    }

    unsigned char override_flick_left (void) {
        return 0;
    }

    unsigned char override_flick_right (void) {
        return 0;
    }
```

Siempre que se detecte que el personaje vaya a salir de la pantalla se llamará a la función correspondiente dependiendo de por donde salga. Si la función devuelve 0, se hará la conexión normal y corriente.

Para definir una regla especial colocaremos el código en la función correspondiente y devolveremos 1. Podemos verlo en acción en el ejemplo de Cheril, en la fase de la playa.

```c
    // custom_screen_connections.h

    unsigned char override_flick_up (void) {
        if (n_pant >= 72 && n_pant < 84) {
            player.vy = 0; return 1;
        } else return 0;
    }

    unsigned char override_flick_down (void) {
        return 0;
    }

    unsigned char override_flick_left (void) {
        if (n_pant == 72 || n_pant == 84) { 
            n_pant += 11; gpx = 224; player.x = 224<<6; 
            return 1;
        }
        return 0;
    }

    unsigned char override_flick_right (void) {
        if (n_pant == 83 || n_pant == 95) { 
            n_pant -= 11; gpx = 0; player.x = 0; 
            return 1;
        }
        return 0;
    }
```

Es este juego, la fase 4 ocupa las dos últimas filas del mapa de 8x12 pantallas. En la fila superior no debemos permitir pasar a la fila superior, por lo que interceptamos los cambios hacia arriba entre las pantallas 72 y 83 (ambas inclusive) y devolvemos 1 para que no se ejecute el código general.

De forma parecida, las pantallas a los extremos de estas filas conectan con la del extremo opuesto, de forma cíclica.

## Enemigos empaquetados

Los enemigos empaquetados se activan con `#define PACKED_ENEMS` en `config.h` y almacenan los pares (`x1`, `y1`) y (`x2`, `y2`) cada uno en un byte. Esto añade algo de overhead, sobre todo si no activamos `FIXED_ENEMS_LIMITS` (con lo que el motor asume que los limites no cambian y no tratará de reempaquetarlos tras cada vuelta de bucle), pero ahorra 2 bytes por cada enemigo del juego, algo que viene muy bien para juegos con muchas pantallas o si queremos subir el número de enemigos por pantalla. Por ejemplo, en un juego de 96 pantallas ahorraría 576 bytes (los enemigos pasarían de ocupar 2880 bytes a ocupar 2304 bytes).

Obviamente tendremos que comunicarle nuestra decisión al conversor `ene2h` con el parámetro `compacted`.

## Detectando la muerte del jugador

En cada bucle del juego, al llegar a nuestra rutina de código custom, y si el jugador acaba de perdir vida, la variable `player_just_died` habrá tomado uno de estos valores:

```c
	#define PLAYER_KILLED_BY_BG 	1 	// Murió por el escenario (pinchos)
	#define PLAYER_KILLED_BY_ENEM 	2	// Le hostió un enemigo
	#define PLAYER_KILLED_BY_EZ 	4 	// Perdió vida por Evil Zone
	#define PLAYER_KILLED_BY_SELF 	8 	// Se hirió a si mismo (*_DRAINS_LIFE)
```

En la siguiente vuelta del bucle de juego, `player_just_died` volverá a 0.

# Capítulo 9 - `MODE_128K_DUAL`

La macro `MODE_128K_DUAL` prepara el motor para que añadamos un player en RAM1 para tocar música y efectos AY si el juego se carga en los modelos de Spectrum con 128K, mientras que si se carga en un modelo de 48K se toquen con el beeper, como siempre. Eso implica también modificar el loader para que se cargue le bloque extra si se detecta un modelo de 128K.

Podemos usar cualquier player, aunque por defecto el motor viene preparado para integrar Arkos 1.X. Integrar cualquier otro player debería ser muy fácil si se siguen unas pautas parecidas.

## Música y efectos

Usaremos Arkos 1.X para crear las diferentes músicas y los efectos de sonido y los guardaremos en formato `.ask` dentro de un subdirectorio `ogt/`. Los sonidos deben tener estos identificadores en el archivo `.aks` de los efectos:

|S|Efecto
|---|---
|1|Salto
|2|enemy hit
|3|killzone hit
|4|countdown
|5|coin
|6|object
|7|talk 1
|8|key in lock
|9|shoot
|10|explosion
|11|talk 2  
|12|ramiro hover

## Convirtiendo la música y montando el player

La integración que hemos hecho con Arkos tiene que ver con el hecho de que el player de Arkos necesita que las canciones y los efectos hayan sido "compilados" en una dirección fija. Para facilitar el problema, lo que hacemos es tener canciones y efectos comprimidos con el player y descomprimirlos en dos buffers: 1 para la canción, donde se descomprimirá cada canción antes de que empiece a sonar, y otro para los efectos, donde se descomprimirán durante la inicialización.

El player de Arkos está contenido y funcionará con RAM1 paginada, por lo que es muy cómodo tener los buffers también ahí, por ejemplo al final de la RAM. El único requerimiento de los buffers es que las canciones quepan en el de canciones y los sonidos en el de sonidos, por lo que primero que tendremos que hacer es ver cuanto ocupan los binarios.

La utilidad `AKSToBIN.exe` incluida en arkos (y en `utils/`) convierte los archivos `.aks` de Arkos Player en binarios compilados y utilizables. Convertiremos primero todos nuestros `.aks` en `.bin`, y anotaremos qué música ocupa más y cuánto ocupan los sonidos. Recuerda que habrá que pasar `-s` a `AKSToBin.exe` cuando estemos convirtiendo los sonidos.

En **Ramido 4**, por ejemplo, la canción más grande tiene 2362 bytes y los sonidos ocupan 645 bytes. Nosotros hemos arreglado para ese juego que el buffer de músicas esté en 0xF000 y el de sonidos en 0xFD00, con lo que la música más grande y los sonidos caben de sobra.

El siguiente paso es volver a compilar todas las músicas y los sonidos en las direcciones definitivas (en nuestro ejemplo, 0xF000 para las músicas y 0xFD00 para el archivo con los sonidos), y después comprimirlas con `apack.exe`. Nosotros solemos hacernos un archivo `.bat` dentro de `ogt/` para estos menesteres parecido a este:

```bat
    @echo off

    set base=0xF000
    set basesfx=0xFD00

    if [%1]==[justassemble] goto :assemble

    echo Convirtiendo . . .
    ..\utils\AKSToBIN.exe -a %base% title.aks 00_title.bin 
    ..\utils\AKSToBIN.exe -a %base% ingame.aks 01_ingame.bin 
    ..\utils\AKSToBIN.exe -a %base% hurry.aks 02_hurry.bin 
    ..\utils\AKSToBIN.exe -a %base% gover.aks 03_gover.bin 
    ..\utils\AKSToBIN.exe -a %base% ending.aks 04_ending.bin 
    ..\utils\AKSToBIN.exe -s -a %basesfx% sfx.aks sfx.bin

    echo Comprimiendo . . .
    ..\utils\apack.exe 00_title.bin 00_title_c.bin > nul
    ..\utils\apack.exe 01_ingame.bin 01_ingame_c.bin > nul
    ..\utils\apack.exe 02_hurry.bin 02_hurry_c.bin > nul
    ..\utils\apack.exe 03_gover.bin 03_gover_c.bin > nul
    ..\utils\apack.exe 04_ending.bin 04_ending_c.bin > nul
    ..\utils\apack.exe sfx.bin sfx_c.bin > nul

    :assemble
    echo Ensamblando . . .
    ..\utils\pasmo.exe atPlayer.speccy.asm RAM1.bin RAM1.map.txt
```

La última linea llama a `pasmo.exe` para ensamblar el player con las músicas, pero aún no estamos listos para eso. Primero habrá que montar el player. Para eso tendremos que editar el player "preparado" de Arkos que incluimos en `ogt/`, el archivo `atPlayer.speccy.asm`.

La sección que tendremos que modificar está al final del archivo, a partir de la linea 1667. Primero hay una sección donde se incluye, con `INCBIN`, cada una de las canciones *comprimidas*, tras una etiqueta descriptiva. Luego se incluye, igualmente con `INCBIN`, el archivo con los sonidos *comprimido*. A continuamción, hay una lista con las etiquetas que apuntan a cada canción, el *índice de canciones*. En Ramiro tenemos cinco músicas comprimidas (como se ve en el `.bat` de ejemplo de más arriba) y el archivo nos queda así:

```asm
    [...]

    song_00: INCBIN "00_title_c.bin" 
    song_01: INCBIN "01_ingame_c.bin" 
    song_02: INCBIN "02_hurry_c.bin" 
    song_03: INCBIN "03_gover_c.bin" 
    song_04: INCBIN "04_ending_c.bin" 

    song_sfx: INCBIN "sfx_c.bin"

    compressed_song_index:
            defw  song_00, song_01, song_02, song_03, song_04
```

Con esto, podemos ensamblar obteniendo así `RAM1.bin` y `RAM1.map.txt`. Este archivo contiene las direcciones de memoria donde han terminado los diferentes elementos ensamblados, y será necesario para configurar el player en el motor, en el siguiente paso.

## Configurando MK1v4

El siguiente paso es activar el `MODE_128K_DUAL` y luego `ENABLE_ARKOS` para configurar sus valores, que están al principio de `config.h`, y que son estos:

```c
    #define ENABLE_ARKOS
    #define ARKOS_SFX_CHANNEL           1
    #define ARKOS_RAM                   1
    #define ARKOS_ADDRESS_ATPLAY        0xC000  
    #define ARKOS_ADDRESS_ATSTOP        0xC6E1
    #define ARKOS_ADDRESS_ATSFXSTOPALL  0xC6F7
    #define ARKOS_ADDRESS_ATSFXPLAY     0xC704
    #define ARKOS_ADDRESS_MT_LOAD_SONG  0xC7FC
    #define ARKOS_ADDRESS_MT_INIT       0xC81C
```

`ARKOS_SFX_CHANNEL` es donde quieres que suenen los efectos. Los efectos interrumpen las notas de la música que suena por un canal. Aquí eliges cuál. `ARKOS_RAM` debería ser 1 a menos que estés haciendo cosas raras.

Las demás macros, `ARKOS_ADDRESS_*`, se refieren a direcciones de memoria con elementos del player y de nuestra integración. Para conocer los valores abriremos `RAM1.map.txt` y los asignaremos según los identificadores que aparecen allí y esta tabla (aunque lo más normal es que, si no hemos tocado nada y usamos la misma versión del player, no hayan cambiado):

|Macro|Etiqueta
|---|---
|`ARKOS_ADDRESS_ATPLAY`|`atPlay`
|`ARKOS_ADDRESS_ATSTOP`|`atStop`
|`ARKOS_ADDRESS_ATSFXSTOPALL`|`atSfxStopAll`
|`ARKOS_ADDRESS_ATSFXPLAY`|`atSfxPlay`
|`ARKOS_ADDRESS_MT_LOAD_SONG`|`mt_load_song`
|`ARKOS_ADDRESS_MT_INIT`|`mt_init`

## El loader "inteligente"

Ahora tendremos que montar un nuevo loader, en ensamble, que detecte el modelo y decida si cargar o no el bloque extra `RAM1.bin` en RAM1 de los modelos de 128K. Para ello empezaremos creando un archivo llamado `loader_128.asm-orig` en `dev/` con este contenido (o lo puedes compiar del `dev/` de **Ramiro 4**):

```asm
    ; loader.asm
    ; loads the loader
    ; by na_th_an - Thanks to Antonio Villena for his tutorials and utilities.

        org $5ccb
        ld  sp, 24199
        di
        db  $de, $c0, $37, $0e, $8f, $39, $96 ;OVER USR 7 ($5ccb)
        
        ld  bc, 767
        ld  hl, $5800
        ld  de, $5801
        ld  (hl), l
        ldir

    ; load screen
        scf
        ld  a, $ff
        ld  ix, $4000
        ld  de, 6912
        call $0556
        di

    ; Main binary
        scf
        ld  a, $ff
        ld  ix, 24200
        ld  de, %%%mb_length%%%
        call $0556
        di

    ; Detect if it's a 128K model to load RAM1.
        ld  bc, 0x7ffd
        xor a
        out (c), a
        ld  a, (0x1)
        ld  h, a
        ld  a, 0x10
        out (c), a
        ld  a, (0x1)
        cp  h
        jr  z, launch_exe

    ; RAM1
        ld  a, $11      ; ROM 1, RAM 1
        ld  bc, $7ffd
        out (C), a

        scf
        ld  a, $ff
        ld  ix, $C000
        ld  de, %%%ram1_length%%%
        call $0556
        di

        ld  a, $10      ; ROM 1, RAM 0
        ld  bc, $7ffd
        out (C), a
        
    ; run game!
    launch_exe:
        jp 24200
```

Este código tiene dos macros, `%%%mb_length%%%` y `%%%ram1_length%%%`, que usando la utilizad `imanol.exe` serán sustituidos por los tamaños del binario principal y de `RAM1.bin`, respectivamente, antes de ser enviado a ensamblar con `pasmo.exe`. Todo esto se hará en `comp.bat`. Hay que sustituir el montaje de la cinta original, o sea, este trozo:

```bat
    ..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
    ..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
    ..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul
```

Por este otro trozo:

```bat
    ..\utils\imanol.exe ^
        in=loader_128.asm-orig ^
        out=loader.asm ^
        ram1_length=?..\ogt\RAM1.bin ^
        mb_length=?%game%.bin  > nul

    ..\utils\pasmo.exe loader.asm loader.bin

    ..\..\..\src\utils\GenTape.exe %game%.tap ^
        basic '%game%' 10 loader.bin ^
        data              loading.bin ^
        data              %game%.bin ^
        data              ..\ogt\RAM1.bin
```

* En primer lugar, `imanol.exe` procesa nuestro nuevo cargador en `loader_128.asm-orig`, sustituyendo las macros  `%%%mb_length%%%` y `%%%ram1_length%%%` por los tamaños del binario principal y de `RAM1.bin`, respectivamente, generando un archivo `loader.asm` con los valores correctos.

* Seguidamente, ensambla `loader.asm` obteniendo `loader.bin`.

* Finalmente, construye una cinta con el cargador en código máquina, la pantalla de carga, el juego, y el bloque con `RAM1.bin` usando `GenTape.exe` de A. Villena.

## Lanzando las músicas

La integración de los efectos de sonido es automática, pero las músicas deberás lanzarlas tú. Puedes modificar el código de `pantallas.h` para lanzar la música de título, de game over, o del final del juego, y emplear los *hooks* de `custom.h` para lanzar las músicas *ingame*. Puedes consultar el diario de **Ramiro 4** como ejemplo de integración. Para ello puedes usar las dos funciones de `arkos.h`:

```c
    void __FASTCALL__ arkos_play_music (unsigned char song_number);
    void arkos_stop_sound (void);
```

`arkos_play_music` tocará la música `song_number` del *índice de canciones* que definimos al montar el player, teniendo en cuenta que la primera canción es la número 0.

# Capítulo 10 - Versión CPC

Debería escribir una socumentación separada para CPC, lo sé. Pero mientras no llegue, y como casi todo lo que hay en este documento aplica igual para ambas versiones, voy a incluir una pequeña guía para montar un juego en CPC resaltando las diferencias con la versión de ZX. El proyecto base de la versión CPC está en `src_cpc` y contiene el juego **Cheril of the Bosque**.

A la versión para CPC de **MTE MK1** la llamamos **Pestecera**. Como esta es la rama v4, la llamaremos **Pestecera v4**

## Antes de empezar

Lo primero es coger el directorio `/src_cpc` y copiarla completa en otro sitio, y acto seguido cambiarle el nombre. Por ejemplo, para la conversión de **Jet Paco** le he cambiado el nombre a `src_cpc` por `jetpaco`, obteniendo esta estructura de directorios:

```
    jcastano@POR133 MINGW64 /d/git/MK1/games_cpc (master)
    $ tree -d jetpaco
    jetpaco
    |-- bin
    |-- dev
    |   |-- system
    |   `-- wyz
    |-- enems
    |-- gfx
    |-- map
    |-- ogt
    |-- script
    `-- utils
```

Una vez hecho esto, editamos `dev/comp.bat` y establecemos el nombre del juego al principio del archivo:

```cmd
    @echo off

    set game=jet_paco
    
    [...]
```

## Los nuevos gráficos

La **Pestecera v4** soporta sólo modo 0. 

Antes de empezar, debes asegurarte de trabajar con los colores correctos. Como esto siempre está sujeto a implementación, hemos añadido en `/env` un archivo `.png` que contiene los 27 colores de la paleta, demás de un archivo `.act` de Photoshop y un archivo `.pal` para Paintshop Pro o Aseprite.

![Paleta CPC](./images/cpc_pal.png)

Si tu programa no soporta ninguno de estos formatos puedes cargar el png e ir picando cada color desde ahí, o crear la paleta a mano en tu editor siguiendo esta tabla:

|R|G|B
|---|---|---
|0|0|0
|0|0|128
|0|0|255
|128|0|0
|128|0|128
|128|0|255
|255|0|0
|255|0|128
|255|0|255
|0|128|0
|0|128|128
|0|128|255
|128|128|0
|128|128|128
|128|128|255
|255|128|0
|255|128|128
|255|128|255
|0|255|0
|0|255|128
|0|255|255
|128|255|0
|128|255|128
|128|255|255
|255|255|0
|255|255|128
|255|255|255

El conversor de gráficos de la **Pestecera v4** es una evolución del viejo `mkts_om` que hemos venido empleando en paquetes tan dispares como `MK3_OM` o `AGNES SG-1000` y es capaz de procesar gráficos 1:1 (en los que cada pixel de la imagen es un "ladrillo" del CPC) o gráficos 2:1 (en los que cada dos píxeles de la imagen hacen un ladrillo del CPC). Trabaja con lo que mejor te venga. Recuerda que paquetes como Photoshop o Aseprite te permiten configurar una vista de 2:1 sobre imagenes normales para trabajar más cómodamente (los píxeles se muestran a doble de ancho).

### Paletas

Por defecto y sin tocar nada, tendrás que elegir una paleta de 16 colores para todos los elementos del juego y podrás elegir otra diferente para la pantalla de carga. El conversor `mkts_om` necesita una paleta para funcionar en un formato muy específico: como un archivo .png de 16x1 píxels en el que cada píxel representa un color de la paleta. El orden de los píxeles en la imagen es importante: el de más a la izquierda definirá la pluma 0 y el de más a la derecha la 15. Esto es importante sobre todo con los sprites: en los sprites, **el color que represente la pluma 0 será tomado como color transparente**.

Una vez decididas las dos paletas (que bien pueden ser una sola) las almacenaremos en el directorio `gfx/` como `pal.png` (para la paleta principal) y `pal_loading.png` para la paleta de la pantalla de carga.

### Pantallas fijas

Al igual que en `MK1` de toda la vida, tenemos tres o cuatro pantallas fijas. Las tres primeras deberán ser de 128x192 píxels en modo 0 y sólo debe usar los colores definidos en `gfx/pal.png`.

* `title.png` es la pantalla de título, que además debe contener el marco de juego si activas la macro `DIRECT_TO_PLAY` en `dev/my/config.h`. 

![title.png](./images/jet_paco/title.png)

* `marco.png` es la pantalla del marco de juego, con espacio para los marcadores. Si hemos vamos a usar `DIRECT_TO_PLAY` no la necesitamos. 

* `ending.png` es la pantalla que sale cuando el jugador gana el juego (la pantalla del final). 

![ending.png](./images/jet_paco/title.png)

Finalmente, tendremos:

* `loading.png`, la pantalla de carga, que tiene que ser de 160x200 píxels en modo 0 y sólo debe usar los colores definidos en `gfx/pal_loading.png`.

![loading.png](./images/jet_paco/loading.png)

### La fuente

* `font.png` contendrá la fuente y debe ser un archivo de 128x32 píxels en modo 0 y debe contener los 64 caracteres correspondientes a los códigos ASCII del 32 al 95. Debe usar los colores de `gfx/pal.png`:

![font.png](./images/jet_paco/font.png)

### El tileset

* `work.png` contendrá los 48 tiles del tileset, sobre el que aplicarán las mismas restricciones y características que en **MTE MK1** para **ZX Spectrum**. El archivo deberá medir 128x48 píxels en modo 0

![work.png](./images/jet_paco/work.png)

### El spriteset

* `sprites.png` contendrá los gráficos que necesitemos para representar los sprites de nuestro juego. En la configuración básica serán 16 cells de 8x16 píxels en modo 0 (pueden ser más y pueden ser de 24 píxels de alto). El conversor espera 8 cells por fila, así que nuestro archivo deberá tener 64 píxels de ancho en modo 0. Se puede hacer juegos con gráficos de diferente tamaño (16 o 24 píxels de alto), pero eso es algo que no trataremos en esta guía.

La configuración básica es la misma que en **MTE MK1** para **ZX Spectrum**, pudiendo hacer los añadidos y personalizaciones que necesites mediante inyección de código y diferentes configuraciones que no trataremos en esta guía.

Ten en cuenta que la pluma 0 deberá emplearse para definir qué zonas del sprite deben ser transparentes. Recuerda que es el primer color que aparece en `gfx/pal.png`. En este caso, el amarillo pálido:

![sprites.png](https://raw.githubusercontent.com/mojontwins/MK1_Pestecera/master/docs/wiki-img/jet_paco/sprites.png)

### Sprites extra

En `gfx/` hay tres archivos gráficos más de tipo sprite (con lo que debes prestar atención a usar la pluma 0 para marcar qué píxeles son transparentes) que puedes (debes) modificar al gusto:

* `sprites_bullet.png` contiene el gráfico empleado para representar las balas. Será de 8x8 píxels en modo 1 u 4x8 en modo 0.

* `sprites_extra.png` contiene el gráfico de la explosión. **Deberá tener el mismo tamaño que el cell más grande de tu spriteset** si estás empleando un set con diferentes tamaños. En la configuración más básica, deberá ser, como el resto de los cells para sprites, de 16x16 en modo 1 u 8x16 en modo 0.

* `sprites_sword.png` contiene los cells de la espada que sean necesarios (dependiendo de la configuración).

### Convirtiendo los nuevos gráficos

La conversión de los gráficos se efectúa en su sección de `dev/comp.bat`, al igual que ocurriá en **MTE MK1** para **ZX Spectrum**. Si estás empleando la configuración básica no tendrás que cambiar nada. De todos modos, voy a detallar linea por linea lo que estamos haciendo.

```cmd
    ..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars in=..\gfx\font.png out=font.bin silent > nul
```

La primera linea utiliza `mkts_om` en modo `chars` para convertir la fuente. En ausencia de más parámetros, el conversor procesará el archivo de entrada completo. Nótese que el parámetro `cpcmode` toma el valor 0 para "modo 0". La salida es `font.bin`, que es lo que espera el motor.

```cmd
    ..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 in=..\gfx\work.png out=work.bin silent > nul
```

Seguidamente se procesa el tileset en modo `strait2x2`. Al igual que con la fuente, la ausencia de más parámetros implica que se procesará la imagen completa. La salida es `work.bin`, que es lo que espera el motor.

```cmd
    ..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=22 pixelperfectm0 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
```

Estas tres lineas procesan los sprites: el archivo con el spriteset principal `gfx/sprites.png`, que se convertirá a `sprites.bin`, la explosión `gfx/sprites_extra.png` a `sprites_extra.bin`, el proyectil `gfx/sprites_bullet.png` a `sprites_bullet.bin` y la espada `gfx/sprites_sword.png` a `sprites_sword.bin`.

Nótese que se define el tamaño del gráfico que estamos recortando con el parámetro `metasize`. Por defecto, `mkts_om` considera `2,2`. Para sprites más altos (24 filas de pixels) deberíamos especificar manualmente `2,3`. Para los proyectiles se especifica `1,1`. Como quizá hayas adivinado, las medidas son el ancho y el alto en bloques, siendo cada bloque de 8x8 en modo 1 o 4x8 en modo 0.

El parámetro `mappings` es para que el conversor genere una serie de estructuras que el motor necesita para conocer el offset de cada sprite en el binario y las funciones que debe emplear para pintarlo. Dichas estructuras deberán generarse en `dev/spriteset_mappings.h`. Además, empleamos el parámetro `pixelperfectm0`, que hace que en mappings se incluya las versiones de las rutinas que permiten posicionar los sprites pixel-perfect, que es lo que espera el motor.

```cmd
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
	..\utils\apack.exe title.bin titlec.bin > nul
	..\utils\apack.exe marco.bin marcoc.bin > nul
	..\utils\apack.exe ending.bin endingc.bin > nul
```

Esta sección convierte las tres pantallas fijas y posteriormente las comprime usando apack. `mtks_om` trabaja en esta ocasión en modo `superbuffer` produciendo una imagen binaria directamente compatible con el sistema empleado en `MK1` (básicamente, 192 lineas de 64 bytes).

```cmd
   ..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul
```

Finalmente, utilizamos `mkts_om` en modo `pals` para generar `dev/pal.h` con la información sobre la paleta que se empleará en el juego.

Un poco más abajo, en la sección de `comp.bat` donde se genera el archivo `.cdt`, aparece la linea que ejecuta `mkts_om` en modo `scr` para exportar la pantalla de carga usando, esta vez, la paleta en `pal_loading.png`:

```cmd
    ..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal_loading.png mode=scr in=..\gfx\loading.png out=loading.bin silent > nul
```

Seguidamente se crea la cinta. Nótese que si tienes tu paleta de la pantalla de carga en una ubicación distinta o no se llama `pal_loading.png` tendrás que modificar tambien eso.

## Adaptando mapa y enemigos

En realidad no vamos a adaptar mucho. Más que nada vamos a modificar `mapa.fmp` para que emplée los gráficos de CPC y modificar el archivo con el tileset que emplea Ponedor para que se muestre también con estos gráficos.

Como hemos trabajado en este juego en modo 0, tendremos que *engañar* a Mappy y Ponedor generando una nueva versión del tileset con píxeles ladrillo. Básicamente, abriremos nuestro `work.png` y lo escalaremos al doble de ancho, resultando en una imagen de 256x48 con los píxeles rectangulares que almacenaremos como `work.png` dentro de el directorio `enems/`.

![work.png a doble de ancho en enems](./images/jet_paco/enems-work.png)

Hecho esto, copiamos el archivo con el mapa original de la versión de spectrum en el directorio `map/`, sobrescribiendo el `mapa.fmp` por defecto (el de **Cheril of the Bosque**). Al abrirlo veremos el tileset original:

![El mapa original de Jet Paco](./images/jet_paco/mappy_orig.png)

Ahora lo que haremos será sustituir el tileset. Vamos a `File` → `Import` y buscamos el archivo `work.png` que hemos grabado en `enems/`. Pero hay un problema:

![Mapa corrupto](./images/mappy_new_wrong.png)

Efectivamente, el nuevo `work.png` no tiene el primer tile en negro y Mappy hace su gracia desplazando todo el tileset. Para repararlo, buscamos en el menú `Layer` → `Adjust Values` y en el diálogo `adjust non-0 blocks in this layer by` escribimos `1` y pulsamos `Ok`. 

Esto corregirá casi todo el mapa, pero el fondo sigue usando el tile 0 que en Mappy está vacío. Todo tiene solución: vamos a `Custom` → `Tile Replace`, introducimos el texto `0,1` y pulsamos `Ok`. Con esto, Mappy sustituirá todas las ocurrencias del tile 0 por el tile 1, con lo que el fondo se restaurará.

![Mapa para CPC](./images/jet_paco/mappy_new.png)

Tras esto, no debemos olvidar **grabar** de nuevo el mapa en `map/` sustituyendo lo que haya, tanto en formato `.fmp` como en formato `.map`. Igualmente haremos una copia de `mapa.map` en `enems/` para el ponedor.

Ahora sólo tendremos que acordarnos de que tenemos que emplear `fixmappy` en la conversión del mapa en `compile,bat`:

```cmd
   ..\utils\mapcnv.exe ..\map\mapa.map mapa.h 7 5 15 10 15 packed fixmappy > nul
```

Hecho esto vamos con los enemigos. Si estás adaptando un juego que hayas hecho con **MK1 v4** y más o menos has seguido las instrucciones del tutorial en lo referente a los nombres de archivos, probablemente no tengas que cambiar gran cosa.

El problema es, principalmente, que los archivos `.ene` del Ponedor contienen referencias a los archivos de mapa y tileset y que, probablemente, el nombre de estos archivos haya cambiado. Para corregirlo emplearemos un editor hexadecimal. Si estás en Windows puedes usar `XVI32`, incluido en `/env`. 

Empezaremos copiando el `enems.ene` original en `enems/`, sustituyendo al `enems.ene` por defecto (el de **Cheril of the Bosque**). En este directorio deberían estar ya disponibles el archivo `work.png` a doble de ancho que preparamos antes y que acabamos de importar en `mapa.fmp` y el archivo `mapa.map` actualizado.

Si abrimos el archivo `enems.ene` original de Jet Paco en tu editor hexadecimal deberías ver algo parecido a esto (si no se ve bien alineado probablemente tengas que configurar tu editor para que muestre 16 valores por linea):

![enems.ene en XVI32](./images/jet_paco/hex_1.png)

En nuestro caso vemos que el nombre del mapa está bien (`mapa.map`). Sin embargo, el nombre del tileset no: aparece `mappy.bmp`. Lo que haremos será cambiarlo por `work.png` - para ello editaremos el texto directamente en la ventana de la derecha (1). Hay que tener en cuenta que el resto de la cadena debe quedarse a "0", y la forma más fácil es escribir los ceros en la columna de la izquierda (2). Si te equivocas *don't panic*: sólo tienes que recargar el archivo y empezar de nuevo.

![modificando enems.ene en XVI32](./images/jet_paco/hex_2.png)

Una vez hecho esto, grabamos nuestro archivo `enems.ene` modificado. Nos vamos a una ventana de linea de comandos y ejecutamos `ponedor.exe` pasándoloe `enems.ene` como parámetro:

```cmd
    $ ..\utils\ponedor.exe enems.ene
```

Aún no está del todo bien. Por un lado, Ponedor no sabe aún que nuestro mapa tiene la fullería de Mappy. Por otro lado, es posible que el `.ene` utilice el formato de 3 bytes por Hotspot como se nos muestra en la parte superior de la. Si es de 2 bytes (que es lo que queremos), aparecerá **2b**. Si es 3 bytes, **3b**:

![enems.ene sin ajustar](./images/jet_paco/ponedor_1.png)

Para corregirlo, pulsamos primero "+" en el teclado numérico para deshacer el desbarajuste de Mappy, y posteriormente, si es necesario, "L" para convertir del modo de 3 bytes al modo *legacy* de 2 bytes por Hotspot. Ahora las pantallas se visualizarán correctamente y la leyenda debería ser **2b**. Hecho esto, **salvamos** el archivo pulsando `Save` o la tecla "S".

![enems.ene ajustado](./images/jet_paco/ponedor_2.png)

## La configuración

Lo siguiente será editar `dev/config.h` para establecer la configuración del juego, sustituyendo la que viene por defecto (escrita para **Cheril of the Bosque**) por una adecuada para **Jet Paco**. Puedes 8¡debes!) consultar esta documentación.

Obviamente, cuando estás convirtiendo juegos de versiones más antiguas de la churrera, encontrarás un montón de opciones que no existían y algunas es posible que hayan cambiado de nombre. Sin embargo, es muy sencillo partir del proyecto por defecto, que tiene prácticamente todo desactivado, e ir recorriendo en `config.h` original y buscando en el nuevo cada una de las opciones.

Para nuestro **Jet Paco**, por ejemplo, apenas hemos cambiado unas cuantas cosas: 

* El número de pluma equivalente al color negro:

```c
    #define BLACK_PEN                   5       // Which palette entry is black
```

* Las dimensiones del mapa y las coordenadas de inicio:

```c
    #define MAP_W                       7       //
    #define MAP_H                       5       // Map dimensions in screens
    #define SCR_INICIO                  28      // Initial screen
    #define PLAYER_INI_X                5       //
    #define PLAYER_INI_Y                6       // Initial tile coordinates
```

* El número máximo de objetos, la vida inicial y el valor de las recargas.

```c
    #define PLAYER_NUM_OBJETOS          20      // Objects to get to finish game
    #define PLAYER_LIFE                 15      // Max and starting life gauge.
    #define PLAYER_REFILL               1       // Life recharge
```

* Que la pantalla de título contiene el marco:

```c
    #define DIRECT_TO_PLAY                      // If defined, title screen is also the game frame.
```

* Que no usamos llaves

```c
    #define DEACTIVATE_KEYS                     // If defined, keys are not present.
```

* Que no queremos rebotar contra los enemigos

```c
    //#define PLAYER_BOUNCES                    // If defined, collisions make player bounce
```

* Que queremos que el jugador parpadée tras ser alcanzado o golpée pinchos

```c
    #define PLAYER_FLICKERS                     // If defined, collisions make player flicker instead.
```

* Que queremos jetpac en vez de salto:

```c
    //#define PLAYER_HAS_JUMP                   // If defined, player is able to jump.
    #define PLAYER_HAS_JETPAC                   // If defined, player can thrust a vertical jetpac
```

* La posición de los elementos en el marco:

```c
    #define VIEWPORT_X                  0       //
    #define VIEWPORT_Y                  2       // Viewport character coordinates
    #define LIFE_X                      30      //
    #define LIFE_Y                      8       // Life gauge counter character coordinates
    #define OBJECTS_X                   30      //
    #define OBJECTS_Y                   12      // Objects counter character coordinates
    #define OBJECTS_ICON_X              99      // 
    #define OBJECTS_ICON_Y              99      // Objects icon character coordinates (use with ONLY_ONE_OBJECT)
    //#define KEYS_X                    99      //
    //#define KEYS_Y                    99      // Keys counter character coordinates
    //#define KILLED_X                  99      //
    //#define KILLED_Y                  99      // Kills counter character coordinates    
```

* Reajustamos la velocidad máxima cayendo y la gravedad a valores más pequeños para "flotar" más

```c
    #define PLAYER_MAX_VY_CAYENDO       128     // Max falling speed 
    #define PLAYER_G                    8       // Gravity acceleration 
```

* Definimos valores para la aceleración y velocidad máxima del jetpac:

```c
    #define PLAYER_INCR_JETPAC          16      // Vertical jetpac gauge
    #define PLAYER_MAX_VY_JETPAC        128     // Max vertical jetpac speed
```

* Y, por último, definimos el comportamiento de los tiles:

```c
    unsigned char comportamiento_tiles [] = {
        0, 1, 8, 8, 8, 8, 0, 0, 0, 4, 8, 8, 4, 8, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    };
```

## Montando la OGT

Los juegos de CPC tienen una OGT que hay que montar a menos que decidas no tener sonido (con SOUND_NONE). Para este ejemplo vamos a montar la OGT mínima basada en dos canciones: una para la pantalla de título y otra de fondo mientras jugamos.

Para montar el sistema de sonido necesitaremos:

* **WYZ Tracker 2** de **Augusto Ruiz** [link](https://github.com/AugustoRuiz/WYZTracker).

* **Todas las canciones deben estar hechas con el mismo set de instrumentos y efectos de percusión**.

* Exportar todas las canciones en formato `mus`. Hay que tener mucho cuidado de configurar **Wyz Tracker** para que exporte para **Amstrad CPC**. Las guardaremos en el directorio `ogt/` y anotaremos sus tamaños. Nos interesa el tamaño de la más grande. Por convención, las llamaremos `00_title.mus` y `01_ingame.mus`. Esto también generará `00_title.mus.asm` y `01_ingame.mus.asm` que, **si lo hemos hecho bien, deberían ser idénticos**.

* Configurar las direcciones de los buffers de **Wyz Player**. Editamos `churromain.c` y buscamos:

```c
    #define WYZ_SONG_BUFFER 0x8800
	[...]
    #define BASE_WYZ        0xDF80
```

La primera de ellas, `WYZ_SONG_BUFFER`, que es la que nos interesa, define el espacio que se empleará para descomprimir la canción que se vaya a tocar. Este espacio va desde la dirección definida en la macro hasta 0x8FFF. Esto significa que, de entrada y sin tocar, tendremos 0x800 bytes, o lo que es lo mismo, 2Kb, para descomprimir nuestra canción. Esto significa que nuestro archivo .mus exportado más grande debe medir menos de 2Kb. Si hemos hecho músicas muy largas y la mayor ocupa más de 2Kb, habrá que dejar más espacio bajando el valor de `WYZ_SONG_BUFFER` hasta que quepa. Pero si nuestras canciones son más cortas, lo suyo es subir el valor todo lo que podamos para liberar más espacio para nuestro juego.

Para saber el valor tendremos que restar el tamaño del MUS más grande de 0x9000, o 36864. En el ejemplo el mus más grande es el de la música que suena mientras jugamos, que ocupa 1843 bytes. Siendo así, podríamos usar el valor 36864-1843 = 35021 (o 0x88CD) en `WYZ_SONG_BUFFER` lo que nos daría 205 bytes extra. No es mucho, pero todo cuenta.

* Comprimir todas los archivos `mus` con `apack` dentro del directorio `ogt/`. Podemos crearnos un archivo  `compress_songs.bat` para hacerlo porque si tenemos un músico competente como el señor Davidian retocará las canciones varias veces ;-). Por convención, generaremos `00_title.mus.bin` y `01_ingame.mus.bin`:

```cmd
    ..\utils\apack.exe 00_title.mus 00_title.mus.bin
    ..\utils\apack.exe 01_ingame.mus 01_ingame.mus.bin
```

* Renombrar uno de los archivos `*.mus.asm` (todos deberían ser iguales, repito) a `instrumentos.asm`. Este archivo `ogt/instrumentos.asm` será convertido durante la compilación por `compile.bat` a un archivo directamente usable por el motor (si estamos respetando la nomenclatura no tendremos que cambiar nada):

```cmd
    ..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm wyz\instrumentos.h
```

* Construir la lista de canciones. El motor debe saber qué canciones tiene disponibles y qué datos tienen. Para ello generaremos `/dev/wyz/songs.h` con esta estructura:

```c
    // MTE MK1 (la Churrera) v5.0
    // Copyleft 2010-2014, 2020 by the Mojon Twins

    extern unsigned char *wyz_songs [0];

    #asm
        ._00_title_mus_bin
            BINARY "../ogt/00_title.mus.bin"

        ._01_ingame_mus_bin
            BINARY "../ogt/01_ingame.mus.bin"

        ._wyz_songs
            defw    _00_title_mus_bin, _01_ingame_mus_bin
    #endasm
```

Si añadiésemos más canciones habría que importarlas bajo una etiqueta `_NN_MUSICA_mus_bin` y luego añadirla a la lista bajo `_wyz_songs`.

Si no tocamos nada más, el motor llamará a `AY_PLAY_MUSIC (0)` en la pantalla de título para tocar la canción 0 de la lista `wyz_songs` (la primera) y a `AY_PLAY_MUSIC (1)` al empezar la partida para tocar la canción 1 de la lista. Si quieres cambiar este comportamiento o añadir más canciones tendrás que tocar el código. Por suerte, casi todos los sitios donde tocar están en `my/`.

En los juegos multifase la canción que sonará durante cada nivel se define en el array `levels` de `my/levelset.h`.

## Los colores de la carga

Cuando carga el juego se ven bandas de dos colores en el fondo. Las puedes cambiar editando los archivos `/dev/system/loadercpc.asm-orig` y `/dev/system/preloadercpc.asm-orig` y cambiando el valor de la primera linea que es:

```asm
    COLORES_CARGA equ $5c56
```

El valor de la variable comprende los dos colores (2 dígitos hexadecimales cada uno), que no son más que los valores "Hardware" de la paleta del CPC que puedes consultar, entre otros lugares, [aquí](http://www.cpcwiki.eu/index.php/CPC_Palette).

## Caracteres de primer plano

Se puede definir que caracteres del tileset sean de primer plano, o sea, que los sprites pasen por detrás. Para conseguirlo hay que añadir un archivo con un array de 256 posiciones que indica qué caracteres del charset son de primer plano, modificar un archivo para incluirlo, y linkar contra una versión especial del backend. Veamoslo por pasos:

### Crear `behindtilemasks.asm`

Creamos el archivo `dev/system/behindtilemasks.asm` con un contenido parecido a este (que corresponde a **Ramiro 3**):

```s
	; TODO: generate this automaticly

	defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1
	defb 1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1
	defb 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	defb 0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1
	defb 0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1
	defb 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,1,1
```

Marca con un 0 los caracteres que son "de fondo" o normales (los sprites pasan por encima) y con 1 los de "primer plano" (los sprites pasan por detrás). Hay que tener en cuenta cómo funciona el charset: los 64 primeros caracteres contienen la fuente de sistema. A partir del sexagésimo quinto (tercera fila) está el tileset. Cada 4 caracteres hacen un tile. Si empezamos a contar por 0, el tile 0 estará formado por los cuatro primeros caracteres de la tercera fila, esto es, por los que tienen índice 64, 65, 66 y 67. 

### Incluir `behindtilemasks.asm`

Editamos `dev/system/tilemap_conf.asm` y añadimos al final:

```s
		XDEF behindtilemasks	
	.behindtilemasks
		INCLUDE "system/behindtilemasks.asm"
```

### Linkar contra `cpcrslib_fg.lib`

Por último editamos `comp.bat` y cambiamos la linea que llama a `zcc` para que linke contra `cpcrslib_fg.lib` en lugar de `cpcrslib.lib`:

```bat
	zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib_fg -o %game%.bin system\tilemap_conf.asm churromain.c > nul
```

## ¡Y ya está!

Ahora es el momento de abrir una ventana de linea de comandos, ejecutar `setenv.bat` y luego `compile.bat` para generar un archivo .SNA o `compile.bat andtape` para generar además un archivo .CDT

## Modo 1

De forma experimental y not officially supported hemos incluido un modo 1 y aquí damos unas breves nociones sobre cómo ponerlo en marcha.

### Conversión de gráficos

Lo primero será por supuesto tener los gráficos en modo 1 - esto no incluye la pantalla de carga, que deberá seguir siendo en modo 0 y tener su `pal_loading.png` de 16 colores. Obviamente puedes cambiar esto pero de eso tendrás que encargarte tú y de forma manual.

`pal.png` contendrá la paleta principal. Puedes añadir más y ponerlas usando customs, por supuesto. El archivo `pal.png` deberá seguir siendo de 16x1 píxels, aunque sólo los 4 primeros deberán contener la paleta de 4 colores del juego.

En `games_cpc/ababol` tienes una conversión del primer Sir Ababol para CPC que hicimos, que en su tiempo fue un port manual de la versión 2.1 de **MTE MK1**. Échale un vistazo a los archivos en `gfx` para saber cómo hay que preparar los gráficos.

Lo siguiente será modificar la parte de `comp.bat` en la que se hacen las importaciones para que el conversor trabaje en modo 1.

```cmd
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=chars greyordered in=..\gfx\font.png out=font.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal1.png mode=strait2x2 greyordered in=..\gfx\work.png out=work.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=16 pixelperfectm0 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
	..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul
	..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal1.png prefix=my_inks_1 out=pal1.h silent > nul

	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
	..\utils\mkts_om.exe platform=cpc cpcmode=1 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
	..\utils\apack.exe title.bin titlec.bin > nul
	..\utils\apack.exe marco.bin marcoc.bin > nul
	..\utils\apack.exe ending.bin endingc.bin > nul
```

### Modo 1 del motor

En `config.h` añadimos este define (no aparece por defecto):

```c
	#define MODE_1 
```

