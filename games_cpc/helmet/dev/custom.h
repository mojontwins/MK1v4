// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

unsigned char map_behaviours [] = {
	1, 1, 0, 0, 0, 0, 0, 0, 
	1, 1, 0, 0, 0, 0, 0, 0,
	1, 1, 0, 0, 0, 0, 0, 0,
	1, 1, 1, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0	
};

// Level set

unsigned char scr_ini [] = { 16, 26 };
unsigned char ini_x [] = { 2, 7 };
unsigned char ini_y [] = { 8, 8 };
unsigned char hostages [] = { 1, 3 };
unsigned char new_level;
unsigned char level;
unsigned char first_time;
unsigned char inside;

unsigned char new_level_string [] = "LEVEL 00";

// The patrullero

signed char en_directions [] = {-1, 0, 1, -1, 0, 1, -1, 1};
unsigned char en_an_facing [3];
unsigned char en_an_walk_ct [3];
extern unsigned char *patrullero_cells [0];
#asm
	._patrullero_cells
		defw SPRITE_18, SPRITE_19, SPRITE_1A, SPRITE_1B
#endasm
unsigned char patrullero_touch;

// Alarm counter & state

#define MAX_ALARM_TIME_COSCAO 3
#define MAX_ALARM_TIME_NORMAL 20

unsigned char noticed;
unsigned char alarm;
unsigned char alarm_x, alarm_y;
unsigned char alarm_max_time;

// Sprite "alarm"

extern unsigned char sprite_alarm [];
#asm		
	._sprite_alarm
		BINARY "sprites_alarm.bin"
#endasm

// Add here your custom routines & vars

void fancy_delete (void) {
	/*
	rdx = 0; rdy = 0; _en_mx = 1; 
	gpit = 150; while (gpit --) {
		set_map_tile (rdx, rdy, 0, 0);

		#asm
			call cpc_UpdScr 
			call cpc_ShowTouchedTiles
			call cpc_ResetTouchedTiles
		#endasm
		
		rdx += _en_mx;
		if (rdx == 0xff) { rdx = 0; rdy ++; _en_mx = -_en_mx; }
		if (rdx == 15) { rdx = 14; rdy ++; _en_mx = -_en_mx; }
	}
	*/
	for (_x = 1; _x < 31; _x += 2) {
		for (_y = 0; _y < 20; _y += 2) {
			_t = 0;
			#asm 	
				call _draw_coloured_tile_do
			#endasm
		}

		#asm
			call cpc_UpdScr 
			call cpc_ShowTouchedTiles
			call cpc_ResetTouchedTiles
		#endasm		
	}
}

void text_prepare (void) {
	saca_a_todo_el_mundo_de_aqui ();
	
	/*
	#asm
			ld  ix, (_sp_alarm)
			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0
			call SPMoveSprAbs
	#endasm
	*/

	#asm
			ld  a, 4
			ld  (__x), a
			ld  a, 11
			ld  (__y), a
			ld  a, 27
			ld  (__x2), a
			ld  a, 13
			ld  (__y2), a
			ld  a, GAME_OVER_ATTR
			ld  (__t), a
	#endasm					
	draw_rectangle ();
}

void todos_rescatados_check (void) {
	if (player.objs == hostages [level]) {
		text_prepare ();		
		draw_text (6, 12, GAME_OVER_ATTR, "RESCATADOS, REGRESA!");
		cpc_UpdateNow (0);
		play_sfx (10);
		espera_activa (50);
		on_pant = 0x99;
	}
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
		/*
		sp_alarm = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_alarm, 3);
		sp_AddColSpr (sp_alarm, sprite_alarm + 32);
		*/
	}

	void hook_init_game (void) {
		new_level = 1;
		level = 0;		
		player.keys = 0;
	}

	void hook_init_mainloop (void) {

		// Extraction point

		if (n_pant == scr_ini [level] && player.objs == hostages [level]) {
			if (((gpx + 8) >> 4) == ini_x [level] &&
				((gpy + 8) >> 4) == ini_y [level]) {
				text_prepare ();
				draw_text (8, 12, GAME_OVER_ATTR, "MISION CUMPLIDA!");
				cpc_UpdateNow (0);
				beepet ();
				espera_activa (100);
				level ++;
				new_level = 1;
			}
		}

		// New level screen 

		if (new_level) {
			#ifdef DEMO
				if (level == 2) game_loop_flag = 1; else
			#endif
			{
				fancy_delete ();
				new_level = 0;
				new_level_string [7] = level + '1';
				draw_text (12, 10, 71, new_level_string);
				draw_text (11, 12, 71, "GET READY!");
				
				#asm
					call cpc_UpdScr 
					call cpc_ShowTouchedTiles
					call cpc_ResetTouchedTiles
				#endasm	
				
				play_sfx (10);
				espera_activa (150);
				n_pant = scr_ini [level];
				init_player_values ();
				for (gpit = 0; gpit < MAP_W*MAP_H; gpit ++) {
					if (hotspots [n_pant].tipo == 1) hotspots [n_pant].act = 1;
				}
				player.objs = 0; 
				enemy_killer = 0xff;
				on_pant = 0xff;
				flags [PLATFORMS_ON_FLAG] = (level == 2) ? 0 : 1;
				first_time = 1;
			}
		}
	}

	void hook_mainloop (void) {
		//sp_MoveSprAbs (sp_alarm, spritesClip, 0, VIEWPORT_Y + (alarm_y >> 3), VIEWPORT_X + (alarm_x >> 3), alarm_x & 7, half_life + (alarm_y & 7));
		alarm_x = 240;

		// Alarm counter

		if (noticed) {
			alarm ++;
			noticed = 0;
		} else alarm = 0;

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
			cpc_UpdateNow (1);
			play_sfx (3);
			play_sfx (10);

			text_prepare ();
			draw_text (8, 12, GAME_OVER_ATTR, "TE COGIMO PRIMO!");
			
			cpc_UpdateNow (0);
			play_sfx (10); play_sfx (8);
			espera_activa (100);
			player.is_dead = 1;
			if (patrullero_touch == 0) player.life --;
			new_level = 1;
			alarm = 0;	
		}
		enemy_killer = 0xff;

		// Suicide / spikes:

		if (player_just_died == PLAYER_KILLED_BY_BG) {
			espera_activa (50);
			player.is_dead = 1;
			player.life --;
			new_level = 1;
			alarm = 0;
		}

		// Got hostage

		if (latest_hotspot == 1) {
			todos_rescatados_check ();
		}

		// First time message
		if (first_time == 1) {
			first_time = 2; // Make sure screen has been rendered!
		} else if (first_time == 2) {
			first_time = 0;
			text_prepare ();		
			draw_text (6, 12, GAME_OVER_ATTR, "RESCATALOS Y REGRESA");
			cpc_UpdateNow (0);
			play_sfx (10);
			espera_activa (50);
			on_pant = 0x99;
		}
	}

	void hook_entering (void) {	
		inside = 1 - map_behaviours [n_pant];

		// Draw extraction point

		if (n_pant == scr_ini [level]) {
			set_map_tile (ini_x [level], ini_y [level], 30, 0);
			set_map_tile (ini_x [level], ini_y [level] + 1, 31, 8);
		} 
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		en_an_facing [enit] = 0;
		en_an_walk_ct [enit] = 0;
	}

	void extra_enems_move (void) {
		if (_en_t == 5) {
			/*
			// Patrullero marrullero
			if (alarm) {
				en_an_facing [enit] = (gpx < _en_x) ? 2 : 0;
			} else {
				if (_en_mx == -1) en_an_facing [enit] = 2;
				else if (_en_mx == 1) en_an_facing [enit] = 0;
	
				if (en_an_walk_ct [enit] == 0) {

					// Select direction / count
					_en_mx = en_directions [rand () & 7];
					en_an_walk_ct [enit] = (1 + (rand () & 3)) << 4;
				} 

				// Move
				en_an_walk_ct [enit] --;
				rdx = _en_x;
				
				if (_en_mx) {
					en_xx = (_en_x >> 4) + _en_mx; en_yy = _en_y >> 4;
					if ((_en_x & 15) || ((attr (en_xx, en_yy + 1) & 12) && (attr (en_xx, en_yy) & 12) == 0)) 
						_en_x += _en_mx;
					else _en_mx = -_en_mx;
				}
			}
			
			rdd = (rdx == _en_x) ? 0 : ((_en_x >> 3) & 1);
			en_an_next_frame [enit] = patrullero_cells [en_an_facing [enit] + rdd];

			// Saw you!
			rdi = 0; gpit = player_hidden ();
			
			if (gpy + 41 >= _en_y && gpy <= _en_y + 27) {
				if (en_an_facing [enit] == 0 && gpx >= _en_x + 15) {
					// Enemy facing right, player to the right
					// If not hidden or too close: gotcha!
					rdi = ((gpit == 0) || (gpx < _en_x + 32));
				} else if (en_an_facing [enit] && gpx <= _en_x - 15) {
					// Enemy facing left, player to the left
					// If not hidden or too close: gotcha!
					rdi = ((gpit == 0) || (gpx + 16 > _en_x));
				}
			}

			// Alarm
			if (rdi) {
				alarm_x = _en_x + 4; alarm_y = _en_y - 8;
				noticed = 1; 			
			} 
			*/

			#asm
					ld  bc, (_enit)
					ld  b, 0 							// bc will be our index

					ld  hl, _en_an_facing
					add hl, bc							// hl -> en_an_facing [enit]

				._patroller_alarm_check
					ld  a, (_alarm)
					or  a
					jr  z, _patroller_no_alarm

				._patroller_alarm
					ld  a, (__en_x)
					ld  d, a
					ld  a, (_gpx)
					cp  d
					jr  nc, _patroller_alarm_s_f_right

				._patroller_alarm_s_f_left
					ld  a, 2
					jr  _patroller_alarm_s_f

				._patroller_alarm_s_f_right
					xor a

				._patroller_alarm_s_f
					ld  (hl), a 						// hl -> en_an_facing [enit]
					jp _patroller_alarm_check_done

				._patroller_no_alarm
					ld  a, (__en_mx)
					cp  1
					jr  z, _patroller_no_alarm_s_f_right
					cp  -1
					jr  nz, _patroller_no_alarm_s_f_done
				
				._patroller_no_alarm_s_f_left
					ld  a, 2
					jr  _patroller_no_alarm_s_f

				._patroller_no_alarm_s_f_right
					xor a

				._patroller_no_alarm_s_f
					ld  (hl), a 						// hl -> en_an_facing [enit]

				._patroller_no_alarm_s_f_done

					ld  hl, _en_an_walk_ct
					add hl, bc
					ld  a, (hl)
					or  a
					jr  nz, _patroller_set_direction_count_done

				._patroller_set_direction_count
					push hl
					push bc 							// _rand will destroy everything!
					
					call _rand
					ld  a, l
					and 7
					ld  e, a
					ld  d, 0
					ld  hl, _en_directions
					add hl, de
					ld  a, (hl)
					ld  (__en_mx), a

					call _rand
					ld  a, l
					and 3
					inc a 
					sla a
					sla a
					sla a
					sla a

					pop bc 								// retrieve our index
					pop hl 								// retrieve HL -> en_an_walk_ct [enit]

				._patroller_set_direction_count_done

				._patroller_move
					dec a 								// A = en_an_walk_ct [enit]
					ld  (hl), a

					ld  a, (__en_x)
					ld  (_rdx), a

				._patroller_bg_collision

					// Collision is VERY simple as patrollers don't move vertically
					// and horizontal movement is constant (no acceleration)

					push bc

					ld  a, (__en_mx)
					ld  e, a
					or  a
					jr  z, _patroller_bg_collision_done

					ld  a, (__en_x)
					ld  d, a
					srl a
					srl a
					srl a
					srl a
					add e 								// + _en_mx
					ld  (_en_xx), a
					
					ld  a, (__en_y)
					srl a
					srl a
					srl a
					srl a
					ld  (_en_yy), a

					// Tile aligned horizontally?
					ld  a, d  							// _en_x
					and 15
					jr  nz, _patroller_advance

					// Floor to walk, no obstacles?
					// (attr (en_xx, en_yy + 1) & 12) checks floor

					ld  a, (_en_xx)
					ld  c, a
					ld  a, (_en_yy)
					inc a
					call _attr_enems
					ld  a, l
					and 12
					jr  z, _patroller_turn_around

					// (attr (en_xx, en_yy) & 12) == 0 checks obstacles
					ld  a, (_en_xx)
					ld  c, a
					ld  a, (_en_yy)
					call _attr_enems
					ld  a, l
					and 12
					jr  nz, _patroller_turn_around

				._patroller_advance
					ld  hl, __en_mx					
					ld  a, (__en_x)
					add (hl)
					ld  (__en_x), a
					jr  _patroller_bg_collision_done

				._patroller_turn_around
					ld  a, (__en_mx)
					neg
					ld  (__en_mx), a

				._patroller_bg_collision_done
					pop bc

				._patroller_alarm_check_done

					ld  a, (_rdx)
					ld  d, a 
					ld  a, (__en_x)
					cp  d 
					jr  nz, _patroller_set_frame_walking

				._patroller_set_frame_idle
					xor a 
					jr  _patroller_set_frame

				._patroller_set_frame_walking
					srl a 
					srl a
					srl a
					and 1 

				._patroller_set_frame 
					ld  (_rdd), a 
					push bc
			/*
			#endasm
			en_an_next_frame [enit] = patrullero_cells [en_an_facing [enit] + rdd];
			#asm
			*/
					ld  d, a 		// D = rdd
					
					ld  hl, _en_an_facing
					add hl, bc 
					ld  a, (hl)		// A = en_an_facing [enit]

					add d  			// A = en_an_facing [enit] + rdd

					sla a 			// x2 (patrullero_cells is 16bit array)

					ld  d, 0 
					ld  e, a 
					ld  hl, _patrullero_cells
					add hl, de  	// HL -> patrullero_cells [en_an_facing [enit] + rdd];

					ld  c, (hl) 	// LSB
					inc hl 
					ld  b, (hl) 	// MSB
									// BC = patrullero_cells [en_an_facing [enit] + rdd];

					ld  a, (_enit)
					sla a 			// x2 (en_an_next_frame is 16bit array)

					ld  d, 0
					ld  e, a 					
					ld  hl, _en_an_next_frame 
					add hl, de 		// HL -> en_an_next_frame [enit]

					ld  (hl), c  	// LSB
					inc hl 
					ld  (hl), b 	// MSB

					// I can see you!

				._patroller_sees_player
					xor a 
					ld  (_rdi), a 
					call _player_hidden
					ld  a, l
					ld  (_gpit), a

					pop bc

					ld  hl, _en_an_facing
					add hl, bc 
					ld  e, (hl) 						// e = en_an_facing [enit]

					// Rather arbitrary vertical range !
					// (gpy + 41 >= _en_y && _en_y + 27 = gpy)
					ld  a, (__en_y)
					ld  d, a 
					ld  a, (_gpy)
					add 41
					cp  d
					jr  c, _patroller_sees_player_done

					ld  a, (_gpy)
					ld  d, a 
					ld  a, (__en_y)
					add 27
					cp  d
					jr  c, _patroller_sees_player_done

				._patroller_check_right
					// Enemy facing right, player to the right,

					// en_an_facing [enit] == 0
					xor a 
					or  e 
					jr  nz, _patroller_check_left

					// gpx >= _en_x + 15
					ld  a, (__en_x)
					add 15
					ld  d, a 
					ld  a, (_gpx)
					cp  d 
					jr  c, _patroller_check_left 

					// If not hidden or too close: gotcha!

					// gpit == 0
					ld  a, (_gpit)
					or  a 
					jr  z, _patroller_saw_you 

					// gpx < _en_x + 32
					ld  a, (__en_x)
					add 32 
					ld  d, a 
					ld  a, (_gpx)
					cp  d
					jr  nc, _patroller_sees_player_done
					jr  _patroller_saw_you

				._patroller_check_left
					// Enemy facing left, player to the left

					// en_an_facing [enit]
					xor a
					or  e 
					jr  z, _patroller_sees_player_done

					// _en_x - 15 >= gpx
					ld  a, (_gpx)
					ld  d, a 
					ld  a, (__en_x)
					sub 15
					cp  d
					jr  c, _patroller_sees_player_done

					// If not hidden or too close: gotcha!

					// gpit == 0
					ld  a, (_gpit)
					or  a 
					jr  z, _patroller_saw_you 

					// _en_x < gpx + 16
					ld  a, (_gpx)
					add 16
					ld  d, a 
					ld  a, (__en_x)
					cp  d 
					jr  nc, _patroller_sees_player_done

				._patroller_saw_you 
					ld  a, 1
					ld  (_rdi), a

				._patroller_sees_player_done 

				// ALARM!

					ld  a, (_rdi)
					or  a 
					jr  z, _patroller_not_alarm

					ld  a, (__en_x)
					add 4 
					ld  (_alarm_x), a 

					ld  a, (__en_y)
					sub 8 
					ld  (_alarm_y), a 

					ld  a, 1
					ld  (_noticed), a

				._patroller_not_alarm

			#endasm			
		}
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}
	
#endif
