# Coches y ángulos.

Dada v, que se controlará dándo aceleración con Q o quitando con A u obstáculos, y el ángulo `A` que se controlará con O/P y que valdrá 0..15 (rotatorio), la velocidad en un momento concreto será:

```
	vx = v * cos (a) 
	vy = v * sin (a)
```

Tenemos en cuenta que cos A = sin (PI/2 - A). Si nuestro 2PI (círculo) son 16 ángulos, PI/2 = 4. Si guardamos sin A en una tabla `lut []`, `sin (a) = lut [a]` y `cos (a) = lut [(4 - a) & 15]`.

Con ocho niveles de velocidad 0..15, podemos precalcular `v * sin (a)` para cada v y usarlo directamente para calcular `vy`. Para `vx` tendríamos que mirar usando el cambio cos->sin de antes.

Dado V (0..15) y A (0..15), 

```
	vx = lut [a | (v << 4)];
	vy = lut [((4 - a) & 15) | (v << 4)];
```

Los valores serán signed fixed 10.6 como todos los valores de la churrera. Con un pequeño script me precalculo toda la tabla.

El ángulo deberá manejar un valor de más precisión que luego se convierta al real para que rotar pueda ser suave. Por ejemplo, si usamos un `unsigned char` tenemos 256 valores, a 25 faps incrementando de 1 en 1 damos una vuelta en 10 segundos, lo cual creo que es precisión suficiente. Puedo afinar con STEERING_V sobre esté círculo de 256 ángulos.

Lo mismo deberá pasar con v, en principio usamos 10.6 y vemos cómo va el tema de la precisión.

Ahora sólo me queda ver si puedo ripear algo del tap que existe de motorheart, que es lo único que hay.

# LUT

He generado esta LUT con el generador de LUTs para MAXV = 256.0 (4 pixels lineales por frame):

```c

	// MotorLUT! Generated for max V = 256
	// Copyleft 2025 by The Mojon Twins

	unsigned char motor_lut [] = {
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000	// For V = 0
		0x0000, 0x01A0, 0x0301, 0x03ED, 0x0440, 0x03ED, 0x0301, 0x01A0, 0x0000, 0xFE5F, 0xFCFE, 0xFC12, 0xFBC0, 0xFC12, 0xFCFE, 0xFE5F	// For V = 17
		0x0000, 0x0340, 0x0602, 0x07DA, 0x0880, 0x07DA, 0x0602, 0x0340, 0x0000, 0xFCBF, 0xF9FD, 0xF825, 0xF780, 0xF825, 0xF9FD, 0xFCBF	// For V = 34
		0x0000, 0x04E1, 0x0903, 0x0BC7, 0x0CC0, 0x0BC7, 0x0903, 0x04E1, 0x0000, 0xFB1E, 0xF6FC, 0xF438, 0xF340, 0xF438, 0xF6FC, 0xFB1E	// For V = 51
		0x0000, 0x0681, 0x0C05, 0x0FB4, 0x1100, 0x0FB4, 0x0C05, 0x0681, 0x0000, 0xF97E, 0xF3FA, 0xF04B, 0xEF00, 0xF04B, 0xF3FA, 0xF97E	// For V = 68
		0x0000, 0x0821, 0x0F06, 0x13A1, 0x1540, 0x13A1, 0x0F06, 0x0821, 0x0000, 0xF7DE, 0xF0F9, 0xEC5E, 0xEAC0, 0xEC5E, 0xF0F9, 0xF7DE	// For V = 85
		0x0000, 0x09C2, 0x1207, 0x178F, 0x1980, 0x178F, 0x1207, 0x09C2, 0x0000, 0xF63D, 0xEDF8, 0xE870, 0xE680, 0xE870, 0xEDF8, 0xF63D	// For V = 102
		0x0000, 0x0B62, 0x1509, 0x1B7C, 0x1DC0, 0x1B7C, 0x1509, 0x0B62, 0x0000, 0xF49D, 0xEAF6, 0xE483, 0xE240, 0xE483, 0xEAF6, 0xF49D	// For V = 119
		0x0000, 0x0D1B, 0x1837, 0x1FA4, 0x2240, 0x1FA4, 0x1837, 0x0D1B, 0x0000, 0xF2E4, 0xE7C8, 0xE05B, 0xDDC0, 0xE05B, 0xE7C8, 0xF2E4	// For V = 137
		0x0000, 0x0EBB, 0x1B39, 0x2391, 0x2680, 0x2391, 0x1B39, 0x0EBB, 0x0000, 0xF144, 0xE4C6, 0xDC6E, 0xD980, 0xDC6E, 0xE4C6, 0xF144	// For V = 154
		0x0000, 0x105C, 0x1E3A, 0x277E, 0x2AC0, 0x277E, 0x1E3A, 0x105C, 0x0000, 0xEFA3, 0xE1C5, 0xD881, 0xD540, 0xD881, 0xE1C5, 0xEFA3	// For V = 171
		0x0000, 0x11FC, 0x213B, 0x2B6C, 0x2F00, 0x2B6C, 0x213B, 0x11FC, 0x0000, 0xEE03, 0xDEC4, 0xD493, 0xD100, 0xD493, 0xDEC4, 0xEE03	// For V = 188
		0x0000, 0x139C, 0x243D, 0x2F59, 0x3340, 0x2F59, 0x243D, 0x139C, 0x0000, 0xEC63, 0xDBC2, 0xD0A6, 0xCCC0, 0xD0A6, 0xDBC2, 0xEC63	// For V = 205
		0x0000, 0x153D, 0x273E, 0x3346, 0x3780, 0x3346, 0x273E, 0x153D, 0x0000, 0xEAC2, 0xD8C1, 0xCCB9, 0xC880, 0xCCB9, 0xD8C1, 0xEAC2	// For V = 222
		0x0000, 0x16DD, 0x2A3F, 0x3733, 0x3BC0, 0x3733, 0x2A3F, 0x16DD, 0x0000, 0xE922, 0xD5C0, 0xC8CC, 0xC440, 0xC8CC, 0xD5C0, 0xE922	// For V = 239
		0x0000, 0x187D, 0x2D41, 0x3B20, 0x4000, 0x3B20, 0x2D41, 0x187D, 0x0000, 0xE782, 0xD2BE, 0xC4DF, 0xC000, 0xC4DF, 0xD2BE, 0xE782	// For V = 256
	};

```

Antes de seguir, con esta LUT ¿para donde va el ángulo 0? El valor es el del seno (VY), por lo que sería horizontal. El valor de VX se calcula restando 4 al ángulo. Para 0 serían el valor positivo máximo para cada V, por lo que 0 va para la derecha. 

El ángulo 4 va hacia abajo (recordemos que el eje Y está invertido en un display). El ángulo 8 hacia la izquierda y el ángulo 12 hacia arriba.

Esto funciona si sólo UP/DOWN modifican la velocidad. Habría que tener en cuenta cierto rozamiento para que el objeto se detenga solo en algunos juegos si no se está acelerando. Esta fricción debería ser variable, al igual que VINC y VMAX, siempre que VMAX <= a la que se usó para generar la LUT.si 

La idea de la rutina de movimiento sería (en pseudo):

```c
	move (void) {

		// vr is signed int representing 10.6 fixed
		// VINC & VMAX are variable, depending on tile beh
		if (UP) vr += VINC; if (vr > VMAX) v = VMAX;
		if (DOWN) vr -= VINC; if (vr < 0) v = 0;

		// friction, depending on tile beh
		if (!UP && !DOWN && vr > 0) vr - friction;

		// ar is unsigned char, this will rotate correctly.
		if (LEFT) ar = ar - STEERING_V;
		if (RIGHT) ar = ar + STEERING_V;

		// INDEX LUTS WITH
		v = (vr * 15 / VMAX) << 4;
		a = ar >> 4;

		// Vertical axis
		player.vy = motor_lut [v | a]; 

		// Standard vert. collision here.

		// Horizontal axis
		player.vx = motor_lut [v | ((4 - a) & 15)];

		// Standard horz. collision here.

		// Calc frame
		// El spriteset debe empezar mirando hacia la derecha y girar CCW
		player.frame = a >> 1;

	}
```
