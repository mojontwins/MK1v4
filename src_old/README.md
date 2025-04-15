# Cosas que recordar

## Raster split para paletas en modo 1

Si hacemos el juego en modo 1 queremos raster split hay que hacer las siguientes cosas:

* `#define AUTO_SPLIT`.
* Convertir las paletas en el modo `palasassembly` de `mkts_om`.
* Tener las paletas pal_general y pal_hud en formato assembly, incluir las paletas custom en `config.h` y montar un array para ver qué paleta lleva cada pantalla en `cpc/palmap.h`