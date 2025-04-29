# Calavera Prologue

## Los gráficos peculiares

### Speccy

En Speccy, se juega a imprimir con OR. El efecto se consigue haciendo que el PAPER sea azul y la INK negra. Para hacer la conversión de los tiles hay que especificar `inverted:0` para que sepa que debe tomar el color más claro como PAPER (el comportamiento normal es hacer lo contrario) y establecer la tinta como "0" por defecto.

El spriteset lleva todos los sprites pegados (sin intercalar máscaras) y se convierte añadiendo el parámetro `nomask` en la ejecución de `sprcnv2`.

### CPC

Emplearemos el modo "G" de las rutinas de sprites pixel-perfect en modo 1, que no calculan máscara sino que simplemente hacen OR de los píxeles de los sprites con los del fondo. Para que el efecto funcione, os sprites deben tener todos los píxeles usando el color 11 (3), ya que X or 11 = 11, lo que haría prevalecer el sprite. La paleta por tanto será 00 -> color del cielo, 01 y 10 colores para detalles de los tiles, y 11 -> negro.

## Motor

[X] Revisar que t=5 en enems.ene crea los fantis tipo `RANDOM_RESPAWN` directamente --> El motor debe "matarlos" en `init_malotes` al detectar el tipo 5.

## Script additions

El tema de las decos rápidas:

```
	DECOS
		X, Y, T
		...
	END
```

## Customs

Va a ser con scripting.

[ ] `ENTERING ANY` debería comprobar que en tal X, Y no hay nada y pintar la luna, por ejemplo.

[ ] Quiero poner una palanca (hay que sacrificar un tile) o algo así que despliegue puentes o haga cambios no persistentes en la pantalla.

	* Screen 3, deco: (10, 2) = 3, (10, 3-7) = 0, (10, 8) = 12, y borrar el tile especial con (12, 6) = 0 