// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// Add here your custom routines & vars

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		// Lower bit 3 in all enemies
		for (enit = 0; enit < TOTAL_SCREENS * 3; enit ++) {
			malotes [enit].t &= 0xF7;
		}
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
	}

	void hook_entering (void) {		
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
	}

	void extra_enems_move (void) {
		// No code needed for enem 9 which basicly does nothing!
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}

#endif

#ifdef ENEMS_CUSTOM_COLLISION
	unsigned char enems_custom_collision (void) {
		switch (_en_t) {
			// Enems type 3 = mamahostias. If you have hostias, they steal them from you
			// Otherwise they kill you.
			case 3:
				if (player.sword_g) {
					player.sword_g = 0;
					player_flicker ();
					return 1;
				}
				break;

			// Enems type 9 = extasied pilgrims, they do nothing
			case 9:
				return 1;
		}

		return 0;
	}
#endif
