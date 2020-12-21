# Zombie Calavera Prologue

Este juego funciona con sprites sin máscaras en formato OR. Como se requiere PAPER 1 e INK 0, los tiles tienen que ser convertidos con el parámetro inverted:0. En `config.h` tenemos `#define NO_MASKS sp_OR_SPRITE`. Los sprites están importados con `..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 16 nomask`. 

Lo de morir cuando tocas el fondo del mapa no está en el motor así que lo hemos metido como un custom:

```c
	void hook_mainloop (void) {
		if (gpy == 144 && n_pant >= (MAP_W*(MAP_H-1))) {
			player.life -= 10;
			player.is_dead = 1;
			player.vy = -PLAYER_MAX_VY_CAYENDO;
			play_sfx (2);
		}
	}
```

