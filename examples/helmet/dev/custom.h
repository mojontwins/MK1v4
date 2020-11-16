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

// The patrullero

signed char en_directions [] = {-1, 0, 1, -1, 0, 1, -1, 1};
unsigned char en_an_facing [3];
unsigned char en_an_walk_ct [3];
unsigned char *patrullero_cells [] = {
	extra_sprite_17_a, extra_sprite_18_a, extra_sprite_19_a, extra_sprite_20_a
};

// Alarm counter & state
unsigned char alarm;
unsigned char alarm_x, alarm_y;

// Sprite "alarm"

struct sp_SS *sp_alarm;
extern unsigned char sprite_alarm [];
#asm
	._sprite_alarm
		BINARY "sprite_alarm.bin"
#endasm

// Add here your custom routines & vars

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
		sp_alarm = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_alarm, 3);
		sp_AddColSpr (sp_alarm, sprite_alarm + 32);
	}

	void hook_init_game (void) {
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		sp_MoveSprAbs (sp_alarm, spritesClip, 0, VIEWPORT_Y + (alarm_y >> 3), VIEWPORT_X + (alarm_x >> 3), alarm_x & 7, alarm_y & 7);
		alarm_x = 240;
	}

	void hook_entering (void) {		
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
			
			rdd = (rdx == _en_x) ? 0 : ((_en_x >> 3) & 1);
			en_an_next_frame [enit] = patrullero_cells [en_an_facing [enit] + rdd];

			// Saw you!
			rdi = 0;
			if (0 == player_hidden ()) {
				if (gpy + 31 >= _en_y && gpy <= _en_y + 31) {
					rdi = ((en_an_facing [enit] == 0 && gpx >= _en_x + 15) ||
						(en_an_facing [enit] && gpx <= _en_x - 15));
				}
			}			

			// Alarm
			if (rdi) {
				alarm_x = _en_x + 4; alarm_y = _en_y - 8;
				alarm ++; 			
			} else {
				alarm = 0;			
			}			
		}
	}

	void extra_enems_checks (void) {
	}

#endif
