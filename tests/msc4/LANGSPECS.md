MOJON SCRIPT COMPILER 4
=======================

La idea es que el lenguaje sea parecido, igual de potente, pero mucho más simple. Gran parte de la complejidad del MSC original de 2011 tenía que ver con la múltiple combinatoria de valores contra flags en todas las operaciones. Cambiando cómo se leen los valores y permitiendo infinita indirección (cosas como `$$$$3`) simplificamos mucho el lenguaje. Además, modificando los opcodes podremos hacer mejores intérpretes en ensamble.

El encoding para los valores, que resolverá `read_vbyte`, usará $FF para significar "valor de ...", de forma que `$3` será "3" y `$FF $3` será `FLAG 3`, y `$FF $FF $3` será `FLAG [FLAG 3]` ...

De este modo, no necesito opcodes diferentes para todas las combinaciones de `IF a = b`, ya que a o b pueden ser valores directos o flags.

Sobre las acciones, todas las operaciones matemáticas se simplifican también. En `OP d, v`, `d` debe ser un flag o de lo contrario la compilación fallará. El intérprete debe poder resolver `d` (lvalue) y `v` (rvalue, usando `read_vbyte`). Como `OP d, v` significa `FLAG[d] = FLAG[d] OP v`, necesito una rutina en el intéprete que devuelva un pointer a `FLAG[d]` en HL y resuelva `v` en A.

Con esta codificación por ejemplo `ADD FLAGS x, y` y `SUB FLAGS x, y` serían aliases de `INC $X, $Y` y `DEC %X, %Y`.

Also, compiler verá igual `FLAG n` y `$n`. Las comas en el código será obviables.  `INC FLAG 3, 4` == `INC $3 4`.  

```asm
	;; ******************
	;; Auxiliary routines
	;; ******************

	;; Reads a byte from pointer, inc pointer, return value in A
	.read_byte
		ld  hl, (script)
		ld  a, (hl) 
		inc hl 
		ld  (script), hl
		ret 

	;; Reads a value (may be recursive flag), inc pointer, return value in A
	;; New flags encoding is $FF means next value is flag (can be $FF, etc)
	.read_vbyte
		call read_byte 
		cp  0xff 
		jr  z, read_vbyte_rec
		ret 

	.read_vbyte_rec
		call read_vbyte 
		ld  d, 0 
		ld  e, a 
		ld  hl, _flags 
		add hl, de 
		ld  a, (hl)
		ret 

	.read_x_y 
		call read_vbyte 
		ld  (sc_x), a 
		call read_vbyte
		ld  (sc_y), a 
		ret 

	;; Read flag index and value, returns pointer in HL and value in A.
	.read_i_v
		call read_vbyte  		; Read flag index
		ld  c, a 
		ld  b, 0 
		call read_vbyte 		; Read value
		ld  hl, _flags
		add hl, bc  			; HL -> FLAGS[X]
		ret
```

Para que el compilador sea fácil de programar y modificar, me haré un `outputAssembly` que pueda recibir una cadena con las lineas partidas por `|`, por ejemplo, y que saque a la salida el código debidamente indentado.

Como los valores que se manejan en un juego puede ser como máximo 240 (posición X mayor) y $FF marca indirección, tenemos aún 13 variables especiales:

$FE = NPANT = n_pant
$FD = PLAYER_X = gpx
$FC = PLAYER_Y = gpy

El intérprete debe reconocer las y codificar el flag correcto. Luego el intérprete debería resolverlas al valor del motor.

## Escribiendo el compilador

Empezamos por el parser custom que rompe una linea de texto y devuelve los tokens debidamente codificados. Es en esta fase donde voy a resolver todo:

* Elimino las comas.
* Las indirecciones van en un solo token: `$4`, `$$2`, etc...
* Se traduce `FLAG n` a `$n`.
* Resolvemos los alias: `%CULO` -> `$5`.
* Resolvemos tokens: `NPANT`, `PLAYER_X`, `PLAYER_Y` ...
* No se permite cosas como `$NPANT`o `$%ALIAS`. Hay que usar `FLAG NPANT`o `FLAG %ALIAS`.

Para no reinventar ruedas voy a basarme en el módulo `mtparser` para esto.

Aún tengo que decidir cómo voy a organizar las diferentes secciones, aunque lo que sí debe ocurrir es que, como en el original, `PRESS_FIRE AT 4, 5, 6` genere punteros al mismo bytecode para esas tres pantallas.

## Comprobaciones

* Entre valores y flags, = < >= !=
* Sobre `PLAYER`
	- AT X, Y -> el centro de sprite toca tile X, Y
	- IN_X X1, X2 -> player completamente dentro de X1, X2
	- IN_Y Y1, Y2 -> player completamente dentro de Y1, Y2
	- HAS X [SELECTED] -> (futuro) tiene X en los items y está seleccionado
	- FALLING
	- NOT FALLING -> el jugador cae o no.
	- STILL -> vx y vy valen 0

## Comandos

* INC F, V: FLAG [F] += V
* DEC F, V: FLAG [F] -= V
* TILE X, Y = 

# El bytecode

Una clausula deberá ser

	COND1 COND2 COND3 FF ACT1 ACT2 ACT3 FF

El tema es ver como hacer "skip". El original precalculaba los tamaños. Así se podía saltar fácilmente a la siguiente cláusula.

```
	7 COND1 COND2 FF ACT1 ACT2 ACT3 FF 10 COND1 ETC...
	  |                                |
	  +-- Estamos aquí tras leer size. Añadimos esto a pointer
	                                   |
	                                   +---- y llegamos aquí
```

Así que primero tengo que hacer una cadena binaria codificando la cláusula, ver la longitud, y concatenarla al principio.

Si cuando vayamos a leer el tamaño de la cláusula leemos FF será que hemos terminado la sección.

