// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

void do_extern_action (unsigned char n, unsigned char m) {
	#ifdef CPC
	#else
		// Original de Daniel de la Cruz
		// Publicado en MH #197, pág 24.
		#asm
			ld	c, 1
		.kjjjj_bucle
			ld 	a, 255
			inc	c
			ld	b, 198
		.kjjjj_stop
			djnz kjjjj_stop
			outi
			cp	c
			jr	nz, kjjjj_bucle
	
			xor a 
			out (254), a
		#endasm
	#endif
}
