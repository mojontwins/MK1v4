// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

// Add here your custom routines & vars

// In this game we'll be using different sets of attributes for the main
// tileset, depending on the level. 

// Attribute binaries are created using ts2bin and compressed with aplib.

extern unsigned char ts_attr_0 [0];
extern unsigned char ts_attr_1 [0];

#asm
	._ts_attr_0
		BINARY "ts_attr_0c.bin"
	._ts_attr_1
		BINARY "ts_attr_1c.bin"
#endasm

unsigned char scr_ini [] = { 5, 0, 50, 15 };
unsigned char ini_x [] = { 2, 2, 2, 2 };
unsigned char ini_y [] = { 2, 2, 2, 2 };
unsigned char *l_ts_attr [] = {
	ts_attr_0, ts_attr_0, ts_attr_1, ts_attr_1
};

unsigned char new_level;
unsigned char level;

unsigned char new_level_string [] = "LEVEL 00";


#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		new_level = 1;
		level = 1;
	}

	void hook_init_mainloop (void) {
		// End of level check


		// New level screen 

		if (new_level) {
			new_level = 0;
			sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
			sp_Invalidate (spritesClip, spritesClip);
			new_level_string [7] = level + '1';
			draw_text (12, 11, 71, new_level_string);
			draw_text (11, 13, 71, "_ANDALE!");
			sp_UpdateNow ();
			play_sfx (10);
			espera_activa (150);
			n_pant = scr_ini [level];
			init_player_values ();
			player.objs = 0; 
			enemy_killer = 0xff;
			on_pant = 0xff;

			// Decompress tileset attributes
			asm_int = (unsigned int) (l_ts_attr [level]);
			#asm
				ld hl, (_asm_int)
				ld de, _tileset + 2048
				jp depack
			#endasm
		}
	}

	void hook_mainloop (void) {
		if (gpy == 144 && n_pant >= (MAP_W*(MAP_H-1))) {
			player.life -= 10;
			player.is_dead = 1;
			player.vy = -PLAYER_MAX_VY_CAYENDO;
			play_sfx (2);
		}

		if (player.objs == PLAYER_NUM_OBJETOS)
			game_loop_flag = 1;
	}

	void hook_entering (void) {		
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
