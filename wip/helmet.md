# Sgt. Helmet Becomes a Hero

La idea es tener un mapa grande donde hacer subfases. Cada fase tendría entre 9 y 16 pantallas. En cada una podría haber una primera parte de aproximación en el exterior, esquivando enemigos y cosas, y otra segunda parte en el interior donde hay que rescatar rehenes. Los rehenes estarán guardados por guardias (!).

Los guardias podrían ser enemigos *custom* sencillos que fueran yendo al azar a un lado y a otro sin caer de la plataforma donde están. Si te ven te disparan un proyectil. En principìo, "te ven" si estás delante suya en su nivel hasta dos más arriba y no estás en un tile que oculta. Los tiles que ocultan tendrán atributos que hagan que el sprite se ponga oscuro.

Teniendo un `en_facing`, te verá si:

- `player_hidden () == 0`.
- `gpy >= _en_y - 16 && gpy <= _en_y + 8`.
- Si `en_facing == 0` mira a la izquierda; si `gpx < _en_y`.
- Si `en_facing == 1` mira a la derecha; si `gpx > _en_y + 15`.

Usaremos sprites custom para pintarlo.

El tema del proyectil es lo más chungo porque los proyectiles dirigidos (cocos) son costosos. Pero creo que dará para todo.

El mapa principal tendrá 8x8 pantallas y ocupará 4800 bytes. Usaré la técnica de dos tilesets, y separaré así las partes interiores y exteriores.

La idea es reaprovechar lo máximo que pueda de los tilesets originales.

