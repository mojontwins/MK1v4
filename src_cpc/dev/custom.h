// MTE MK1 v4.11
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// Add here your custom routines & vars

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
	}

	void hook_entering (void) {		
	}

	void hook_hotspots (void) {	
	}

	unsigned char hook_game_over (void) {
		// Do your shit then return 1 for normal game over.
		return 1;
	}

	unsigned char hook_just_died (void) {
		// Do your shit then return 1 for normal behaviour
		return 1;
	}
#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
	}

	void extra_enems_move (void) {		
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}
	
#endif

#ifdef ENABLE_CUSTOM_LINEAR_ENEM_CELLS
	unsigned char get_cell_n (void) {
		// Change this:
		return _en_t - 1;
	}
#endif

#ifdef ENEMS_CUSTOM_COLLISION
	unsigned char enems_custom_collision (void) {
		return 0;
	}
#endif

#ifdef CUSTOM_MAP_POINTER_CALCULATOR
	void custom_map_pointer_calculator (void) {
		// custom calculate gp_gen based on n_pant (and level, etc...)
		// to point to the screen that's to be rendered.

	}

#endif

#ifdef CUSTOM_FLICK_SCREEN_HANDLER
	void custom_flick_screen_handler (void) {
	 	// Changes n_pant when it's needed.
	 	// Substitutes normal flick screen code. Use for multilevel, etc.
	 }

#endif
