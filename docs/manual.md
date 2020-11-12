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

Es un manual de la v4. Si ya sabes hacer cosas con la churrera puedes saltarte un montón de capítulos. Si no, igual a lo mejor es interesante hacerse antes con el tutorial de la versión actual. O leer este resumen raro.

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

# Exportando nuestro mapa

Para exportar nuestro mapa, sólo hay que irse a `File->Save As...` y salvarlo como `mapa.map`, especificando el `.map` de forma explícita, en el subdireoctorio `map`. 

# Importando nuestro mapa

El conversor para los mapas que viene por defecto en **MTE MK1** es `mapcnv.exe`. En `comp.bat` está la llamada al mismo, que probablemente deberemos modificar:

```cmd
	..\utils\mapcnv.exe ..\map\mapa.map mapa.h 5 5 15 10 15 packed  > nul
```

Los dos primeros parámetros indican las rutas de entrada y salida, en este caso `mapa.map` en el directorio `map` y `mapa.h` en el directorio actual (`dev`). Lo siguientes dos parámetros indican el **ancho** y el **alto** del mapa en pantallas; tendrás que poner los valores de tu mapa. Los dos siguientes indican las dimensiones de cada pantalla, que para **MTE MK1** siempre son 15 y 10. El siguiente dígito indica el tile que debe ser detectado como cerrojo, que debe ser siempre 15. El último parámetro `packed` indica que debe meter dos tiles en cada byte. Si tu mapa usa los 48 tiles, deberás omitirlo.

