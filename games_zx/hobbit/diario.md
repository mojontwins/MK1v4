# TODO / TOCHANGE / TOFIX

- [X] Asegurarme de que el código de marear sigue en el engine y si no, volver a ponerlo / pasarlo a ensamble. Sí - hay que poner en `player.estado` el `EST_DIZZY` (bit)
- [X] Cambiar todos los enemigos en el ponedor.
- [ ] Añadir gráficos para muertes custom.
- [X] Flag en player para desactivar la interacción con los objetos - o meter hook para interceptar el procesado de los hotspots: `hook_hotspots`.
- [X] Alt tile 19 en modos RLE.
- [X] PLAYER_NO_INERTIA to assembly.
- [ ] PLAYER_DIZZY to assembly.
- [X] Asegurarse de que las trayectorias de los enemigos no tocan obstaculos
- [ ] Implementar decorations!


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

