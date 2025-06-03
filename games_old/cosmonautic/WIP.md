# Cosmonautic

¡Realización de la idea original de 2010 en la Churrera Clásica Remozada MK1v3.2! Estas son las cosas que hay apuntadas y cómo van a realizarse (y microañadidos (venga va) que microañadir):

* **¡Vista genital falsa!** La vista es lateral pero la física es genital. Hay que añadir "LATERAL_FALSO" para que la elección de frame sea la de la vista lateral (o sea, no es añadir o cambiar código, sino modificar la compilación condicional).

* **¡Teletransportarse!** En el diseño original (que es pre-msc) se hablaba de hacer teletransportadores en el motor, pero yo estoy desarrollando **msc4** y quiero probar `WARP TO`.

* **Enemigos fijos** Pinchos que aparecen y desaparecen con cierta cadencia. En realidad se podría hacer abusando de los tiles animados, pero necesito que el contador sea random. O sea, hay un ANIMATED_TILES_FRAMES pero el contador asociado debe inicializarse con un rand. La implementación debe ocupar lo mínimo, pero ser rápida. Hay muchas opciones. Necesito almacenar (x, y), contador, tile y estado. Si el tile origen solo puede ser par, tengo el estado en el bit 0 del tile. XY pueden ir juntas. ¿3 bytes? Le doy una vuelta. Igual menos mamoneo usando 4 bytes y, total, pongamos 16 en pantalla que hacen 64 bytes y tengo sitio en los cachos de guardar mierdas fuera de binario para ello.