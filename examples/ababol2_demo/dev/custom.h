// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

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
		if (n_pant == 0 && gpy < 80) 
			scenery_info.allow_type_6 = 1;

		if (enemy_died != 0xff) if (malotes [enoffs + enemy_died].t == 6) {
			set_map_tile (7, 2, 17, 0);
			sp_UpdateNow ();
			play_sfx (6);
			
			hotspot_x = 7<<4;
			hotspot_y = 2<<4;
			hotspots [0].tipo = 1;
			hotspots [0].act = 1;

		}

		enemy_died = 0xff;

		if (flags [COIN_FLAG] == 25) {
			play_sfx (6);
			player.life ++;
			flags [COIN_FLAG] = 0;
		}
	}

	void hook_entering (void) {		
		scenery_info.allow_type_6 = 0;
		enemy_died = 0xff;
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
	}

	void extra_enems_move (void) {		
	}

	void extra_enems_checks (void) {
	}

#endif
