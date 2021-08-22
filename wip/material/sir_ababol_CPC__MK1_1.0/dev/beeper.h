// Beeper.h
// Carga las rutinas de beeper y las lanza
// Copyleft 2010 The Mojon Twins

extern unsigned char beeper [];

#asm
	._beeper
#endasm

void peta_el_beeper (unsigned char n) {
	cpc_WyzStartEffect (WYZ_CANAL_EFECTOS, n);
}
