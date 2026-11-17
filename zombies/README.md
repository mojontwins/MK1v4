# CPC Layer for Churrera

Construir una capa de compatibilidad para poder convertir (rescatar) muy fácilmente juegos viejos que quedaron a medias y / o perdidos en su conversión a CPC pero que conservan versión ZX y assets.

La idea es sustituir todo lo que se usaba en la churrera clásica (MK1 1.0->3.99 y MK1 4.0->4.7)  para acceder al hardware ZX para que acceda al hardware CPC **requiriendo el mínimo número de cambios posible al código base**.

* [X] Lo primero que he hecho es un `cpc.h` recopilando todo lo necesario basándome en trabajo de 2012 que quedó a medias y / o perdido
* [ ] Next is convertir todos los assets.
* [ ] Next is crear un main.c dummy que incluya `cpc.h` y cpcrslib-mt y generar un binario dummy.

Cuando cumpla esto me pongo a ver cómo adaptar goddess_2012 con los assets recuperados.
