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



