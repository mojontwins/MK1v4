// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

void do_extern_action (unsigned char n, unsigned char m) {
	// Kill all enemies
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		enoffsmasi = enoffs + enit;

		// Copy array values to temporary variables as fast as possible
		#asm
				call enems_get_values
		#endasm

		if (_en_t && _en_t != 4 && ((_en_t & 128) == 0 || en_an_fanty_activo [enit] == 1)) {
			enems_kill (99);
		}

		#asm
				call enems_update_values_store
		#endasm
	}
}

#ifdef ENABLE_ENCODED_TEXT

	void __FASTCALL__ textbox (unsigned char *ptr) {
		// Custom implementation. text is pointed to by ptr.

	}
#endif 
