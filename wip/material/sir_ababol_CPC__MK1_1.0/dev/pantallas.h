// Pantallas.h
// Carga las pantallas fijas
// Copyleft 2010 The Mojon Twins

extern unsigned char s_title [];
extern unsigned char s_marco [];
extern unsigned char s_ending [];

#asm
	._s_title
		BINARY "title.bin"
	._s_marco
		BINARY "marco.bin"
	._s_ending
		BINARY "ending.bin"
#endasm

void unpack (unsigned int address) {
	set_black ();
	cpc_UnExo ((unsigned int *) (address), (unsigned int *) (0xc000));
	set_inks (0);
}
