// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

unsigned char persistence [640];
unsigned char powers [8] = {1, 2, 4, 8, 16, 32, 64, 128};

void do_extern_action (unsigned char n, unsigned char m) {
	switch (n) {
		case 0:

			// Reset persistence

			#asm 
					ld  hl, _persistence
					ld  de, _persistence + 1
					ld  bc, 639
					ldir

					ret
			#endasm

		case 1:

			// Mark tile @ n_pant, tpx, tpy.

			#asm
					// address is (n_pant << 4) + (tpx >> 3) + (tpy << 1)
					
					ld  a, (_tpy)
					sla a 
					ld  c, a
					ld  a, (_tpx) 
					srl a 
					srl a 
					srl a 
					add c 
					ld  c, a 
					ld  b, 0

					ld  hl, (_n_pant)
					ld  h, 0
					add hl, hl
					add hl, hl 
					add hl, hl
					add hl, hl 
					add hl, bc
					ld  bc, _persistence 
					add hl, bc

					push hl 

					// bitmask is 1 << (tpx & 7)
					ld  a, (_tpx)
					and 7 
					ld  d, 0
					ld  e, a 
					ld  hl, _powers
					add hl, de 
					ld  c, (hl) 

					pop hl 

					// Persist
					ld  a, (hl)
					or  c 
					ld  (hl), a 

					ret

			#endasm

		case 2:

			// Read persistence and clear papayas

			#asm
					xor a 
					ld  (_tpy), a
					ld  (_tpx), a 

					ld  hl, (_n_pant)
					ld  h, 0
					add hl, hl
					add hl, hl 
					add hl, hl
					add hl, hl 
					ld  bc, _persistence 
					add hl, bc

					// hl -> persistence for this screen
					// Read 16 bytes
					ld  b, 16
				.clear_papayas_loop
					push bc 

					ld  d, (hl)
					inc hl 
					push hl 

					// D contains a bit mask. For each 1 in the bit mask, clear a papaya

					ld  bc, 0
				.clear_papayas_subloop 
					push bc

					ld  hl, _powers
					add hl, bc

					ld  a, (hl) 		// Bitmask
					and d 
					jr  z, clear_papayas_subloop_cont

					// Coincidence: clear papaya
					push de 

					ld  a, 12
					ld  (__t), a 
					xor a 
					ld  (__n), a 
					ld  a, (_tpx)
					ld  (__x), a 
					ld  c, a 
					ld  a, (_tpy)
					ld  (__y), a 
					call set_map_tile_do

					pop de 

				.clear_papayas_subloop_cont
					pop bc 
					inc bc 
					ld  a, c 
					cp  8
					jr  nz, clear_papayas_subloop

					// Move cursor

					ld  a, (_tpx)
					inc a 
					cp  15 
					jr  nz, clear_papayas_no_nl
					ld  a, (_tpy)
					inc a 
					ld  (_tpy), a
					xor a 
				.clear_papayas_no_nl
					ld  (_tpx), a 

					pop hl 
					pop bc
					djnz clear_papayas_loop

					ret
			#endasm 

	}
}

#ifdef ENABLE_ENCODED_TEXT
	void __FASTCALL__ textbox (unsigned char *ptr) {
		// Custom implementation. text is pointed to by ptr.		
	}
#endif 
