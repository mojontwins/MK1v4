MTE MK1 v4
==========

Copyleft 2010-2013, 2020-2023 by The Mojon Twins

Esta versión se conserva aquí por motivos históricos.

**MK1** empezó a evolucionar de forma desvocada en 2012. Se nos ocurrían ideas loquísimas para los juegos y todo lo hacíamos formar parte del motor sin preocuparnos mucho de no romper nada, con lo que el tema iba creeciendo a lo alto, ancho y profundo como un engendro.

Tras publicar Ramiro y con Sir Ababol 2 bastante avanzado surgió la idea de compartir por fin el framework con el universo. Se planteó escribir el famoso tutorial y de colaborar con [El mundo del Spectrum](http://www.elmundodelspectrum.com/) para distribuirlo y hacerlo notar. Sin embargo nuestro pequeño engendro estaba impracticable.

Lo que hicimos fue rebobinar y encontrar un punto donde el sistema estuviese lo suficientemente completo pero más limpio, así que volvimos hasta la versión 3.1, que fue la que limpiamos, optimizamos y corregimos para obtener la 3.99 con la que arrancó el tutorial, allá por principios de 2013.

A partir de entonces MK1 avanzó a partir de ahí con las diferentes revisiones de 3.99, y terminó evolucionando a MK2.

Finalmente, a principios de 2020 retomamos MK1 v3.99 (nueva vuelta atrás), y seguimos avanzando construyendo las versiones 5.x y posteriormente las 6.x y más allá.

La v4.7 se quedó ahí en un limbo congelado con algunos juegos sin terminar. 

La idea era conservarla congelada en ambar, pero nah, eso es de cobardes. Así que hemos rescatado el proyecto perdido de Ramiro 4 (que en 2013 quedó a medias por destrucción de pendrive) y con ese pretexto hemos corregido bugs, mejorado la modularidad (originalmente había muchas cosas pertenecientes a funcionalidades que se quedaban en el código sin tener la funcionalidad activada, o había combinaciones que directamente no funcionaban), traducido la mayor parte a ensamble, portado a CPC y ordenado un poco mejor todo.

Os presentamos la última versión de la rama olvidada de **MTE MK1**, la **v4.8 codename "zombie"**.

# Documentación

Puedes leer el manual de la v4 [aquí](https://github.com/mojontwins/MK1/blob/churrera_4/docs/manual.md). La v4 tiene un montón de cosas custom y divertidas. ¡Échale un ojel!

# Créditos

Esto sería imposible sin la colaboración de mucha gente (y la que se me olvida, sorry):

* ZX Backend: versión modificada de **splib2**, por **Alvin Albrecht**.
* Efectos de sonido y Phaser1 engine music player por **Shiru**.
* Decompresor appack por **dwedit**, adaptado por **Utopian** y optimizado por **Metalbrain**.
* Compresor para aplib [apultra](https://github.com/emmanuel-marty/apultra) por **Emmanuel Marty**.
* ZX Spectrum **WYZ Player** por **WYZ**, modificado por **na_th_an** (compresión) y **thEpOpE** (FX con ruido).
* ZX Spectrum WYZ Tracker 0.5.0.2 por **Augusto Ruiz**.
* ZX Spectrum ARKOS Player 1.0 por **Targhan/Grim/Arkos**.
* Integración ZX con ARKOS basada en el trabajo de **Syx**.
* ZX ROM-based tape loader y Gentape por **Antonio Villena**.
* ZX **bas2tap** por **Martijn Van Der Heide**.
* ZX **bin2tap** por **mike/zeroteam**.
* CPC Backend based on a modified **CPCRSLIB**, originally written by **Artaburu**
* **Appack decompressor** by **dwedit**, adapted by **Utopian**, optimized by **Metalbrain**.
* CPC **WYZ Player** by **WYZ**, adapted by **Augusto Ruiz**, integrated by **na_th_an**.
* CPC **WYZ Tracker 2** by **Augusto Ruiz** - [link](https://github.com/AugustoRuiz/WYZTracker).
* CPC **TinyTape** by **CNGsoft**.
* **cpctbin2sna** and **cpc2cdt** from [CPCtelera](http://lronaldo.github.io/cpctelera/) by **Fran Gallego** & others.
* **ZX7** & **ZX0** by **Einar Saukas**.

Very, very special thanks to many contributors over twitter, greets to **Néstor Sancho** (@NestorSancho), **Miloš Bazelides** (@baze3SC), **Peter Helcmanovsky** (@ped7g), **Jorge PM** (@TrueVideo99), 
**Juan** (@reidrac).

# Licencia

La Churrera es _copyleft_ The Mojon Twins y se distribuye bajo una [licencia LGPL](./LICENSE). Puedes hacer juegos como quieras, pero acuérdate de añadir el logo en un lugar visible, que así salimos beneficiados todos:

![Logo MTE MK1](https://github.com/mojontwins/MK1/blob/master/logo.png)

*Pero* si quieres hacer un juego con el motor entenderemos que quieras hacer copias físicas en cinta o en cualquier otro medio. En ese caso **sólo tienes que avisarnos**, que nos gusta saber estas cosas.

Los **juegos de ejemplo** contenidos en [/examples](./examples) son propiedad de **Mojon Twins** y no pueden ser reproducidos en formato físico sin llegar a un acuerdo con nosotros.

Los **recursos gráficos y sonoros** de nuestros juegos son [donationware](https://en.wikipedia.org/wiki/Donationware).

Si te gusta esto y aprecias la cantidad de horas que le hemos echado, [invita a un café](https://ko-fi.com/I2I0JUJ9).

Y lo más importante: pásalo guay.
