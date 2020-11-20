// MTE MK1 v4.8
// Copyleft 2010, 2011, 2020 by The Mojon Twins

unsigned char map_behaviours [] = {
	1, 1, 0, 0, 0, 0, 0, 0, 
	1, 1, 0, 0, 0, 0, 0, 0,
	1, 1, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0	
};

// Level set

unsigned char scr_ini [] = { 16, 2 };
unsigned char ini_x [] = { 2, 7 };
unsigned char ini_y [] = { 8, 4 };
unsigned char hostages [] = { 1, 1 };
unsigned char new_level;
unsigned char level;

unsigned char new_level_string [] = "LEVEL 00";

// The patrullero

signed char en_directions [] = {-1, 0, 1, -1, 0, 1, -1, 1};
unsigned char en_an_facing [3];
unsigned char en_an_walk_ct [3];
unsigned char *patrullero_cells [] = {
	extra_sprite_17_a, extra_sprite_18_a, extra_sprite_19_a, extra_sprite_20_a
};
unsigned char patrullero_touch;

// Alarm counter & state

#define MAX_ALARM_TIME_COSCAO 2
#define MAX_ALARM_TIME_NORMAL 30

unsigned char noticed;
unsigned char alarm;
unsigned char alarm_x, alarm_y;
unsigned char alarm_max_time;

// Sprite "alarm"

struct sp_SS *sp_alarm;
extern unsigned char sprite_alarm [];
#asm
		defb 0, 255 	// Nifty splib2 shortcuts
	._sprite_alarm
		BINARY "sprite_alarm.bin"
#endasm

// Add here your custom routines & vars

void todos_rescatados_check (void) {
	if (player.objs == hostages [level]) {
		draw_text (3, 0, 7, "TODOS RESCATADOS! REGRESA!");
	}
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
		sp_alarm = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_alarm, 3);
		sp_AddColSpr (sp_alarm, sprite_alarm + 32);
	}

	void hook_init_game (void) {
		new_level = 1;
		level = 0;		
	}

	void hook_init_mainloop (void) {

		// Extraction point

		if (n_pant == scr_ini [level] && player.objs == hostages [level]) {
			if (((gpx + 8) >> 4) == ini_x [level] &&
				((gpy + 8) >> 4) == ini_y [level]) {
				draw_rectangle (7, 11, 24, 13, GAME_OVER_ATTR);	
				draw_text (8, 12, GAME_OVER_ATTR, "MISION CUMPLIDA!");
				sp_UpdateNow ();
				beepet ();
				espera_activa (100);
				level ++;
				new_level = 1;
			}
		}

		// New level screen 

		if (new_level) {
			new_level = 0;
			sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
			sp_Invalidate (spritesClip, spritesClip);
			new_level_string [7] = level + '1';
			draw_text (12, 11, 71, new_level_string);
			draw_text (11, 13, 71, "GET READY!");
			sp_UpdateNow ();
			play_sfx (10);
			espera_activa (150);
			n_pant = scr_ini [level];
			init_player_values ();
			for (gpit = 0; gpit < MAP_W*MAP_H; gpit ++) {
				if (hotspots [n_pant].tipo == 1) hotspots [n_pant].act = 1;
			}
			player.objs = 0; 
			enemy_killer = 0xff;
		}
	}

	void hook_mainloop (void) {
		sp_MoveSprAbs (sp_alarm, spritesClip, 0, VIEWPORT_Y + (alarm_y >> 3), VIEWPORT_X + (alarm_x >> 3), alarm_x & 7, half_life + (alarm_y & 7));
		alarm_x = 240;

		// Alarm counter

		if (noticed) {
			alarm ++;
			noticed = 0;
		} else if (alarm) alarm = 0;

		// Gotcha!

		patrullero_touch = 0;
		if (enemy_killer != 0xff) {
			patrullero_touch = (malotes [enoffs + enemy_killer].t == 5);
			enemy_killer = 0xff;
		}

		if (
			alarm >= (player.objs == hostages [level] ? MAX_ALARM_TIME_COSCAO : MAX_ALARM_TIME_NORMAL)
			|| patrullero_touch
		) {
			alarm = 0;	
			sp_UpdateNow ();		
			play_sfx (3);
			play_sfx (10);
			saca_a_todo_el_mundo_de_aqui ();
			sp_MoveSprAbs (sp_alarm, spritesClip, 0, VIEWPORT_Y + 20, VIEWPORT_X + 30, 0, 0);
			// Validate whole screen so sprites stay on next update
			#asm
					LIB SPValidate
					ld  c, VIEWPORT_X
					ld  b, VIEWPORT_Y
					ld  d, VIEWPORT_X+29
					ld  e, VIEWPORT_Y+19
					ld  iy, fsClipStruct
					call SPValidate
			#endasm

			draw_rectangle (7, 11, 24, 13, GAME_OVER_ATTR);		
			draw_text (8, 12, GAME_OVER_ATTR, "TE COGIMO PRIMO!");
			sp_UpdateNow ();
			play_sfx (10); play_sfx (8);
			espera_activa (100);
			player.is_dead = 1;
			if (patrullero_touch == 0) player.life --;
			new_level = 1;
		}
		enemy_killer = 0xff;

		// Got hostage

		if (latest_hotspot == 1) {
			todos_rescatados_check ();
		}
	}

	void hook_entering (void) {	
		// Draw extraction point
		if (n_pant == scr_ini [level]) {
			set_map_tile (ini_x [level], ini_y [level], 30, 0);
			set_map_tile (ini_x [level], ini_y [level] + 1, 31, 8);
			gp_gen = "RESCATALOS Y REGRESA AQUI!";
		} else gp_gen = "                          ";
		draw_text (3, 0, 7, gp_gen);

		todos_rescatados_check ();
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		en_an_facing [gpit] = 0;
		en_an_walk_ct [gpit] = 0;
	}

	void extra_enems_move (void) {
		if (_en_t == 5) {
			// Patrullero marrullero
			if (alarm) {
				en_an_facing [enit] = (gpx < _en_x) ? 2 : 0;
			} else {
				if (en_an_walk_ct [enit] == 0) {

					// Select direction / count
					_en_mx = en_directions [rand () & 7];
					en_an_walk_ct [enit] = (1 + (rand () & 3)) << 4;

					if (_en_mx == -1) en_an_facing [enit] = 2;
					else if (_en_mx == 1) en_an_facing [enit] = 0;
				} 

				// Move
				en_an_walk_ct [enit] --;
				rdx = _en_x;
				
				if (_en_mx) {
					en_xx = (_en_x >> 4) + _en_mx; en_yy = _en_y >> 4;
					if ((_en_x & 15) || ((attr (en_xx, en_yy + 1) & 12) && (attr (en_xx, en_yy) & 8) == 0)) _en_x += _en_mx;
				}
			}
			
			rdd = (rdx == _en_x) ? 0 : ((_en_x >> 3) & 1);
			en_an_next_frame [enit] = patrullero_cells [en_an_facing [enit] + rdd];

			// Saw you!
			rdi = 0; gpit = player_hidden ();
			
			if (gpy + 31 >= _en_y && gpy <= _en_y + 27) {
				if (en_an_facing [enit] == 0 && gpx >= _en_x + 15) {
					// Enemy facing right, player to the right
					// If not hidden or too close: gotcha!
					rdi = ((gpit == 0) || (gpx < _en_x + 32));
				} else if (en_an_facing [enit] && gpx <= _en_x - 15) {
					// Enemy facing left, player to the left
					// If not hidden or too close: gotcha!
					rdi = ((gpit == 0) || (gpx > _en_x - 16));
				}
			}


			// Alarm
			if (rdi) {
				alarm_x = _en_x + 4; alarm_y = _en_y - 8;
				noticed = 1; 			
			} 			
		}
	}

	void extra_enems_checks (void) {
	}

#endif
