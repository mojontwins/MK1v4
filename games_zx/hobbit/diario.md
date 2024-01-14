# TODO / TOCHANGE / TOFIX

- [X] Asegurarme de que el código de marear sigue en el engine y si no, volver a ponerlo / pasarlo a ensamble. Sí - hay que poner en `player.estado` el `EST_DIZZY` (bit)
- [X] Cambiar todos los enemigos en el ponedor.
- [ ] Añadir gráficos para muertes custom.
- [X] Flag en player para desactivar la interacción con los objetos - o meter hook para interceptar el procesado de los hotspots: `hook_hotspots`.
- [X] Alt tile 19 en modos RLE.
- [X] PLAYER_NO_INERTIA to assembly.
- [ ] PLAYER_DIZZY to assembly.
- [X] Asegurarse de que las trayectorias de los enemigos no tocan obstaculos
- [X] Implementar decorations!
- [ ] Caretos en los cuadros de texto

# Los customs

## Los enanos

Al principio del juego los enanos no se deben poder coger. Cuando nos acercamos a un enano debe aparecer un texto al ciclar entre estos cuatro:

- UF, QUE PESTE ECHA. NO DEBE SER UN HOBBIT.
- ME PREGUNTO QUE HACEN TANTOS ENANOS EN HOBBITLANDIA
- VAYA, UN SEÑOR BAJITO Y SUCIO!
- HMMM... DEBE HABER UN CIRCO CERCA!

Cuando se habla con Gandalf te explica (mal) que tienes que reunir a los 13 enanos para que te abran la puerta de minas nosequé. Entonces se activa un flag y los enanos se pueden reunir.

Cuando se coge un enano debe poner su nombre. Como paso de complicar el código, lo que se hará será iterar sobre la lista de nombres sin importar en qué orden se cogen los enanos.

"HAS ENCONTRADO A ...".

# Comecocos!

Para implementar las fases de comecocos hay que resolver ciertas cosas con cosas del motor o implementar otras:

- los coquitos que se comen son un tile y por tanto se pueden implementar con ENABLE_COINS. Para ahorrar código habrá que contar los cocos que hay en cada pantalla a mano para detectar que los cogimos todos.
- los fantasmas serán tipo marrullers para que anden a su bola. Son muy tontos pero eso nos vale.
- Si te comes la seta podrás matar a los marrullers. Esto hay que ponerlo en el motor, creo, aunque quizá lo suyo sería que embez de esto simplemente te diera inmunidad durante mucho rato.

# El anillo

El original hacía desde script `DIZZY: FLICKER`, y esto en el motor activaba lo siguiente:

* `FLICKER` activa `EST_PARP` en `player.estado`.
* `DIZZY` activa `EST_DIZZY` en `player.estado`.

Al activar `EST_PARP`, el contador de parpadeo se lanza y al llegar a 0 pone el estado a 0, lo que desactiva ambas cosas.

El contador se ponía a 32 que en el motor viejo equivalía a unos 2 segundos.

Voy a probar algo parecido en esta versión: `estado |= (EST_PARP | EST_DIZZY)` y `ct_estado = 50`.

# Arregla

[X] Enano de dentro de la cueva no debe aparecer hasta que se abrió la puerta.
[X] Hace falta un minitexto para cuando se acaba el comecocos de abrir la puerta.
[X] El comecocos de abrir la puerta se puede repetir mil veces, arreglar.

