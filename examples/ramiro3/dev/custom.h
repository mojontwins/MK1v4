// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// Add here your custom routines & vars

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
	}

	void hook_mainloop (void) {
	}

	void hook_entering (void) {		
	}

#endif

// This is a dirty hack
unsigned char tileset_offset_calc () {
	if (
		n_pant < 10 ||
		n_pant == 12 || 
		n_pant == 13
	) return 0;
	return 32;
}
