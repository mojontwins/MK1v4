# WIP

Cosas que me apunto de un día para otro para ir resolviendo cuando se vaya pudiendo.

[ ] Limpiar de CPCRSLIB todo lo que no se use en mojonia.

[ ] Resolver cómo hacer saber al script cuántos empujables hay en la pantalla de la mejor forma: la que menos impacto tenga en el motor principal. Recordemos que el goal de la v3.2 por ejemplo es ser lo más bare bones posible ¿Hago un array que cuente las ocurrencias de cada tile? ¿Cómo la hago accesible desde el script? `read_vbyte` está ya muy poblado, recordemos que sólo tengo sitio para 14 variables de motor y no quedan muchas libres a menos que haga otra codificación que tengo que estudiar ($FF XX = flag, $FE XX = variable de motor, por ejemplo ~ igualmente ahora son $FF XX con XX = $F1 .. $FE ¿no? complico levemente el intérprete pero el bytecode sigue ocupando lo mismo)

	* Primero voy a hacer la recodificación de las variables de motor con $FE y luego ya veremos. ¡Un momento! No es tan fácil por el tema de los lvalues.  Cuando se guarda $A = B, tenemos que el bytecode no contiene $A sino A ya que se sobreentiende flags[A]. De hecho, todo esto funciona porque son "flags" especiales. 

	El tema de que las variables de motor tengan que ocupar los flags > $F0 es una limitación real? NO. A fin de cuentas, tenemos que difícilmente tendré más de 32 flags en el juego. No hace falta 240. **Puedo usar todos los índices que necesite**, siempre que siga tomando valores del final.

	** Así que no cambiamos ninguna codificación **.

[ ] Implementar el timer ¿en el motor o en msci? Si se hace en msci necesitaremos un hook en el mainloop. Recordemos que el timer no llegó a MK1 hasta 3.99.2 ~ y era mucho más complejo. Pero ahora incrementaré cada 25 frames de juego y tendré ~ 1 segundo por paso, y sólo tendrá sentido usarlo desde el script. El original se podía usar sin script pero tampoco era muy util y jamás se usó. Aún me estoy planteando si meter las recargas de tiempo como hotspots o dejar al programador que lo implemente todo en el script. En cualquier caso, el valor del TIMER debe estar disponible para lectura y escritura. 
	
	* Afterthought: Aunque en v3.2 no tenga sentido fuera del scripting, en v4 o en v5 sí podría utilizarse desde código custom, así que no puede formar parte de msc.h. 

```c
	// Minimal timer 
	// needs timer_on, timer, timer_ct

	// Usually, you start with timer = N, timer_on = 1, timer_ct = 0

	#asm
		.timer
			ld  a, (_timer_on)
			or  a 
			jr  z, timer_done

		.timer_do 
			ld  a, (_timer_ct)
			or  a
			jr  z, timer_ct_zero
			dec a 
			jr  timer_ct_write 

		.timer_ct_zero 
			ld  a, (_timer) 
			dec a 
			jr  nz, timer_write 

			// Hook "on timer zero"
			
			xor a
			ld  (_timer_on), a 			// Turn off timer

		.timer_write
			ld  (_timer), a 
			ld  a, 24

		.timer_ct_write
			ld  (_timer_ct), a 

		.timer_done
	#endasm
```


[ ] Sección ON TILE PUSHED y hacer que MOVED_TO_TILE, MOVED_X y MOVED_Y lleven los valores correctos. (tile que se "pisa" y sus coordenadas).

[X] Generalizar la sección ON COIN GET o como fuese para que se lance cada vez que el jugador coja algo, ya sea una moneda o toque un hotspot (por ahora). Esto nos permite, por ejemplo, reaccionar a hotspots custom (por ejemplo, para implementar la recarga de timer sin tocar el motor) o implementar de forma controlada el "se acabó el juego al coger X objetos". Recordemos que al activar el scripting se desactivan las formas de ganar el juego que no sean con un `WIN GAME` desde el script.

[X] He activado los random respawn en calaverga y ahora resulta que o bien no van o bien es que no detecta la morisión para activarlos. Habrá que hacer la revisasión.

	* Era una tontería. Ya salen, pero se cuelga como ocurría en v4 cuando están en la zona que parpadean. O bien el código que pone el frame vacío con 0xff está mal, o bien estoy haciendo el tontaina por otro sitio. Habrá que hacer la revisasión. De esto también.

	* Era también un fallo tontísimo. Además lo he cambiado para que usen maincounter & 1 para parpadear.

	* La detección de "cerca del borde" también está mal porque parpadea siempre... Además el parpadeo parece muy lento ? Esto sí es rarow.

	Hace A = coord, B = limite. 

	Por ejemplo, 
		* A = 12, B = 0 -> 12, ABS (12) < 16 ? SI.
		* A = 18, B = 0 -> 18, ABS (18) < 16) ? NO.

		* A = 220, B = 224 -> -4, ABS (-4) < 16 ? SI.
		* A = 200, B = 224 -> - 24, ABS (-24) < 16 ? NO.

	Pero wait, a lo mejor es que se comprueba todo. Veamos por ejemplo para A = 100:

		* B = 0 -> ABS (100) < 16 ? NO
		* B = 224 -> ABS (-114) < 16 ? NO

	Entonces no es esto lo que falla.

	* Aún no lo hallo pero creo que hay que poner algún límite a los fanties porque si no se van y se van y se van y cuando quieres que vuelvan tienen que venir desde Gines y nos plan.

		A ver, el límite está puesto pero se lo pasan por el pie? Qué desastre. Estoy usando las mierdas de z88dk, uséiase `l_ge` y  `l_lt`. Supuestamente tú pones en DE el valor, en HL el otr ovalor, llamas a `l_ge` y te pone el carry si DE >= HL. Pero estoy mirando el código y no sé en qué estaba pensando, es muy raro. Voy a hacer la reescribisión.

		Supuestamente no rompen HL ni DE pero es que tendría que estar mirando las fuentes del z88dk que estoy usando NO? BAIA la versión vieja si se carga DE, así que tengo que tener eso en cuentra para la reescribisión.

		Estaba bien , pero faltaba poner vx/vy = 0 en estos casos -- Pero ahora si tocamos "0" en un eje el fantasma se atrapa en esa posición y no es capaz de salir. Con el límite superior no parece haber problemas. Llevo demasiado tiempo con esto.

[ ] Hay un pequeño glitch con la paleta del marcador al empezar el juego. Revisar.

[ ] Pasar a asm el código que hace rebotar al player y los fantys, que lleva sin tocar desde 2010.


