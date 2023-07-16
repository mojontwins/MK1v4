// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Add here your custom routines & vars

// Comment this to remove the "next level" cheat
#define ENABLE_CHEAT

// Arkos OGT
#define MUS_TITLE           0
#define MUS_SELECT          1
#define MUS_STAGE_START     2
#define MUS_STAGE_BASE      3
#define MUS_STAGE_CLEAR     7
#define MUS_STAGE_CLEAR_L   8
#define MUS_GAME_OVER       9
#define MUS_ENDING          10


// Resonators
#define RESONATORS_FRAMES 25

unsigned char resonators_on, resonators_ct, resonators_frames;
unsigned char player_min_killable;
unsigned char resct_old;
unsigned char enem_may_be_paralyzed [3];

// Level fiddle
unsigned char level, new_level;
unsigned char new_level_string [] = "LEVEL 00";

unsigned char scr_ini [] = { 60, 64, 71, 84, 72 };
unsigned char ini_x [] = { 1, 1, 11, 7, 7 };
unsigned char ini_y [] = { 4, 4, 4, 4, 0 };

unsigned char tilemaps [] = {
	 0,  1,  2,  3, 25,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 	// level 0
	32, 33, 34, 11, 36, 37, 38, 39, 40, 41, 12, 23, 24, 45,  0, 15,		// level 1
	 0, 17, 46, 47, 43, 44, 35,  6, 26,  9, 19, 22, 27, 39, 25, 15, 	// level 2
	42, 39, 46, 47,  4, 28, 29, 30, 31,  7, 19, 17, 23, 24, 12, 15,		// level 3
	 0, 42,  7, 25, 39, 43, 23, 24, 35,  9, 22, 17, 29, 30, 31, 15 		// level 4 (HUB)
};

// Those are ordered by level!
// Note that most routines are optimized as left pointing signs have X==2.
// if coordinates are changed, supporting routines should be adapted.
unsigned char hub_signs_x [] = { 2, 2, 13, 12 };
unsigned char hub_signs_y [] = { 5, 2, 5, 2 };

unsigned char level_finished [] = { 0, 0, 0, 0 };
unsigned char levels_finished;	// This will make my life easier

unsigned char continue_on;
unsigned char ls;

// Special powers
#ifdef LANG_ES
	unsigned char power_name0 [] = "CERROJO";
	unsigned char power_name1 [] = "VIENTO";
	unsigned char power_name2 [] = "PODER";
	unsigned char power_name3 [] = "TIEMPO";
	unsigned char power_name4 [] = "AGARRE";	

	//                              XXXXXXXXXXXXXXXXXXXXXXXXXXXX 28 chars
	unsigned char power_desc0 [] = "  ABRE CERROJOS SIN LLAVES ";
	unsigned char power_desc1 [] = " FLOTA MIENTRAS CAES CON > ";
	unsigned char power_desc2 [] = " MALOS PARALIZADOS NO MATAN";
	unsigned char power_desc3 [] = " RESONADORES VAN MAS LENTOS";
	unsigned char power_desc4 [] = " CHERIL NO RESBALA EN HIELO";
	unsigned char power_desc5 [] = "                           ";
#else
	unsigned char power_name0 [] = "LOCKS";
	unsigned char power_name1 [] = "WIND";
	unsigned char power_name2 [] = "STRENGTH";
	unsigned char power_name3 [] = "TIME";
	unsigned char power_name4 [] = "GRIP";

	//                              XXXXXXXXXXXXXXXXXXXXXXXXXXXX 28 chars
	unsigned char power_desc0 [] = "  OPEN LOCKS WITHOUT A KEY  ";
	unsigned char power_desc1 [] = " FLOAT WHILE FALLING WITH > ";
	unsigned char power_desc2 [] = "PARALYZED GOONS ARE HARMLESS";
	unsigned char power_desc3 [] = "   RESONATORS TICK SLOWER   ";
	unsigned char power_desc4 [] = "  CHERIL WON\"T SLIP ON ICE ";	
	unsigned char power_desc5 [] = "                            ";
#endif

unsigned char *power_names [] = {
	power_name0, power_name1, power_name2, power_name3, power_name4
};

unsigned char *power_descs [] = {
	power_desc0, power_desc1, power_desc2, power_desc3, power_desc4, power_desc5
};

unsigned char power_on [] = { 0, 0, 0, 0, 0 };
unsigned char p_bellotas;
unsigned char p_got_bellota;
unsigned char hotspots_semaphore;

// Gyrosaws 

#define GYROSAW_V 				2
#define GYROSAW_SPRITE_CELL		extra_sprite_17_a

// Pezons

signed char pezon_incs [] = {
	-12, -10, -9, -8, -8, -6, -5, -4, -4, -2, -1, 0,
	0, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11
};

#define PEZON_SPRITE_CELL 		extra_sprite_18_a

// Custom functions

void clear_game_area (void) {
	//sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
	//sp_Invalidate (spritesClip, spritesClip);
	#asm
			LIB SPClearRect

			ld  hl, #(VIEWPORT_Y*256+VIEWPORT_X)
			ld  bc, #((VIEWPORT_Y+19)*256+VIEWPORT_X+29)
			ld  de, 0
			ld  a, 0x03
			ex  af, af
			call SPClearRect

			ld  a, VIEWPORT_X
			ld  c, a

			ld  a, VIEWPORT_Y
			ld  b, a
			
			ld  de, #((VIEWPORT_Y+19)*256+VIEWPORT_X+29)
			
			ld  iy, fsClipStruct
			call SPInvalidate	
	#endasm
}

void paralyze_everyone (void) {
	#asm
			xor a							// Killable is all
			ld  (_player_min_killable), a 

		/*
			ld  hl, _en_an_count
			ld  de, _en_an_state
			ld  b, 3
		.paralyze_do 
			ld  a, 0xff
			ld  (hl), a
			ld  a, ENEM_PARALYZED
			ld  (de), a
			inc hl 
			inc de

			djnz paralyze_do
		*/

			ld  bc, 3
		.paralyze_do
			dec c

			ld  hl, _enem_may_be_paralyzed
			add hl, bc
			ld  a, (hl)
			or  a
			jr  z, paralyze_next

			ld  a, 0xff
			ld  hl, _en_an_count
			add hl, bc
			ld  (hl), a

			ld  a, ENEM_PARALYZED
			ld  hl, _en_an_state
			add hl, bc
			ld  (hl), a

		.paralyze_next
			xor a
			or  c
			jr  nz, paralyze_do
	#endasm
}

void restore_everyone (void) {
	#asm
			ld  a, 6						// Covers all linears + pezons (5)
			ld  (_player_min_killable), a 

			ld  hl, _en_an_count
			ld  de, _en_an_state
			xor a
			ld  b, 3
		.deparalyze_do 
			ld  (hl), a
			ld  (de), a
			inc hl 
			inc de

			djnz deparalyze_do
	#endasm
}

void set_hotspot (void) {
	// Hotspot structure is xy, tipo, act.

	#asm
		// First, make a pointer to hotspots [n_pant]
			call _calc_hotspot_ptr
			ld  hl, _hotspots
			add hl, de

		// We'll be using xy and modifying tipo and act.
			ld  c, (hl)			// C = xy
			inc hl				// now HL points to tipo

		// hotspots [n_pant].tipo = hotspot_t;
			ld  a, (_hotspot_t)
			ld  (hl), a
			inc hl 				// now HL points to act

		// hotspots [n_pant].act = 1;
			ld  a, 1
			ld  (hl), a

		// rdx = (hotspots [n_pant].xy >> 4);
			ld  a, c
			srl a
			srl a
			srl a
			srl a
			ld  (_rdx), a
		
		// hotspot_x = rdx << 4;
			ld  a, c
			and 0xf0
			ld  (_hotspot_x), a

		// rdy = (hotspots [n_pant].xy & 15);
			ld  a, c
			and 15
			ld  (_rdy), a
		
		// hotspot_y = rdy << 4;
			sla a
			sla a
			sla a
			sla a
			ld  (_hotspot_y), a
	#endasm

	set_map_tile (rdx, rdy, 16 + hotspot_t, 0);
}

void paint_sign (void) {
	// Paints sign @ _x, _y

	// Looks left when _x = 2, right otherwise
	// Very very custom and not reusable but things

	// SPPrintAtInv
	// A = row position (0..23)
	// C = col position (0..31/63)
	// D = pallette #
	// E = graphic #

	#asm
			// Bottom char is common
			ld  a, (__x)
			ld  c, a
			ld  a, (__y)
			inc a
			ld  de, #((2+64)*256+62)
			call SPPrintAtInv

			ld  a, (__x)
			inc a
			ld  c, a
			ld  a, (__y)
			inc a
			ld  de, #((2+64)*256+63)
			call SPPrintAtInv

			// Left or right?
			ld  d, 7

			ld  a, (__x)
			cp  #(VIEWPORT_X+2*2)
			jr  nz, paint_sign_right

		.paint_sign_left
			ld  c, a
			ld  a, (__y)
			ld  e, 59
			call SPPrintAtInv

			ld  a, (__x)
			inc a 
			jr  paint_sign_body

		.paint_sign_right
			inc a
			ld  c, a
			ld  a, (__y)
			ld  e, 61
			call SPPrintAtInv

			ld  a, (__x)
			
		.paint_sign_body
			ld  c, a
			ld  a, (_ls)
			ld  e, a
			ld  a, (__y)
			ld  d, 0x7
			call SPPrintAtInv
	#endasm
}

void set_block (void) {
	// Adds blockage for cleared levels.
	// These use the same coordinates as signs, but
	// _x is interpreted so X = (_x == 2 ? 0:14)

	#asm
			ld  a, (__x)
			cp  2
			jr  nz, set_block_right

		.set_block_left
			xor a
			jr  set_block_do

		.set_block_right
			ld  a, 14

		.set_block_do
			ld  (__x), a
			ld  c, a

			ld  a, 4 			// Stone block
			ld  (__t), a

			ld  a, 8 			// Non walkable
			ld  (__n), a

			call set_map_tile_do
	#endasm
}

void reset_game (void) {
	#asm
		// Clears level_finished array
			
			xor a
			ld  (_levels_finished), a
		
			ld  hl, _level_finished
			ld  de, _level_finished + 1
			ld  bc, 3
			ld  (hl), a 
			ldir

		// Clears super powers

			ld  hl, _power_on
			ld  de, _power_on + 1
			ld  bc, 4
			ld  (hl), a
			ldir
			
			ld  (_master_of_keys), a 
			ld  (_ramiro_hover), a
			ld  (_paralyzed_dont_kill), a
			ld  (_disable_slippery), a
			ld  (_p_bellotas), a

			ld  a, RESONATORS_FRAMES
			ld  (_resonators_frames), a
	#endasm
}

void enable_power (void) {
	#asm
		// enables power #rdy
			ld  bc, (_rdy)
			ld  b, 0
			ld  hl, _power_on
			add hl, bc 
			ld  a, 1
			ld  (hl), a 

			ld  a, c
			cp  4
			jr  z, enable_grip
			cp  3
			jr  z, enable_time
			cp  2
			jr  z, enable_strength
			cp  1
			jr  z, enable_wind

		.enable_locks
			ld  a, 1
			ld  (_master_of_keys), a 
			ret

		.enable_wind
			ld  a, 1
			ld  (_ramiro_hover), a 
			ret

		.enable_strength
			ld  a, 1
			ld  (_paralyzed_dont_kill), a 
			ret

		.enable_time
			ld  a, 35
			ld  (_resonators_frames), a
			ret

		.enable_grip
			ld  a, 1
			ld  (_disable_slippery), a
	#endasm
}

void update_bellotas (void) {
	#asm
			// SPPrintAtInv
			// A = row position (0..23)
			// C = col position (0..31/63)
			// D = pallette #
			// E = graphic #

			ld  a, (_p_bellotas)
			add 16
			ld  e, a		
			ld  a, 1
			ld  c, 30
			ld  d, 71

			call SPPrintAtInv
	#endasm
}

void select_power (void) {
	clear_game_area ();

	#ifdef LANG_ES
		draw_text (5, VIEWPORT_Y+1, 71, "ELIGE UN NUEVO PODEWWR");
	#else
		draw_text (6, VIEWPORT_Y+1, 71, "SELECT A NEW PODEWWR");
	#endif

	for (gpit = 0; gpit < 5; gpit ++) {
		rdy = VIEWPORT_Y+5 + (gpit << 1);
		#ifdef LANG_ES
			draw_text (7, rdy, 7, "REINA DEL");
		#else
			draw_text (7, rdy, 7, "MASTER OF");
		#endif
		
		draw_text (17, rdy, 7, power_names [gpit]);

		#asm
			// SPPrintAtInv
			// A = row position (0..23)
			// C = col position (0..31/63)
			// D = pallette #
			// E = graphic #

				ld  hl, _power_on
				ld  bc, (_gpit)
				ld  b, 0
				add hl, bc
				ld  a, (hl)
				or  a
				jr  z, select_power_no_tick

				ld  a, (_rdy)
				ld  c, 25
				ld  de, #((64+4)*256 + 60)
				call SPPrintAtInv
			.select_power_no_tick
		#endasm
	}

	#ifdef LANG_ES
		draw_text (7, VIEWPORT_Y+15, 7, "SALIR");
	#else
		draw_text (7, VIEWPORT_Y+15, 7, "EXIT");
	#endif

	rdy = 0; rdx = 1;
	while (1) {
		if (rdy != rdx) {
			#asm
					ld  c, 5
					ld  a, (_rdx)
					sla a
					add VIEWPORT_Y+5
					ld  de, 0
					call SPPrintAtInv

					ld  c, 5
					ld  a, (_rdy)
					sla a
					add VIEWPORT_Y+5
					ld  de, #((6+64)*256 + 15)
					call SPPrintAtInv
			#endasm
			rdx = rdy;
			draw_text (2, VIEWPORT_Y+18, 6, power_descs [rdy]);
			#asm 
				call SPUpdateNow
			#endasm
			play_sfx (9);
		}

		/*
		pad_read ();
		if ((pad_this_frame & sp_UP) == 0) { if (rdy) rdy --; else rdy = 4; }
		if ((pad_this_frame & sp_DOWN) == 0) { if (rdy < 4) rdy ++; else rdy = 0; }
		if ((pad_this_frame & sp_FIRE) == 0 && power_on [rdy] == 0) {
			enable_power ();
			play_sfx (8);
			break;
		}
		*/

		#asm
				call _pad_read

				ld  a, (_pad_this_frame)
				ld  c, a

				and sp_UP 
				jr  nz, select_power_up_done

			.select_power_up
				ld  a, (_rdy)
				or  a
				jr  nz, select_power_up_dec
				ld  a, 5
				jr  select_power_up_set
			.select_power_up_dec
				dec a
			.select_power_up_set
				ld  (_rdy), a
				jr  select_power_continue
			.select_power_up_done

				ld  a, c
				and sp_DOWN
				jr  nz, select_power_down_done

			.select_power_down
				ld  a, (_rdy)
				cp  5
				jr  c, select_power_down_inc
				xor a
				jr  select_power_down_set
			.select_power_down_inc
				inc a
			.select_power_down_set
				ld  (_rdy), a
				jr  select_power_continue
			.select_power_down_done

				ld  a, c
				and sp_FIRE
				jr  nz, select_power_continue

				ld  a, (_rdy)
				cp  5
				ret z

				ld  a, (_p_bellotas)
				or  a
				jr  nz, select_has_bellotas

				ld  hl, 2
				call _play_sfx
				jr  select_power_continue

			.select_has_bellotas
				ld  hl, _power_on
				ld  c, a
				ld  b, 0
				add hl, bc
				ld  a, (hl)
				or  a
				jr  nz, select_power_continue

				ld  hl, _p_bellotas
				dec (hl)
				call _update_bellotas
				call SPUpdateNow
				ld  hl, 8
				call _play_sfx 
				jp  _enable_power

			.select_power_continue
		#endasm
	} 
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
		continue_on = 0;		
	}

	void hook_init_game (void) {
		resonators_on = 0;
		resct_old = 0;
		player_min_killable = 4;
		new_level = 1;
		level = 4; 

		update_bellotas ();
		//level=3;
	}

	void hook_init_mainloop (void) {

		#ifdef ENABLE_CHEAT
			if (sp_KeyPressed (key_1) && sp_KeyPressed (key_3)) {
				player.killed = 60;
			}
		#endif

		if (player.killed == 60) {
			#asm
					ld  a, 9
					ld  (__x), a
					ld  a, 11
					ld  (__y), a
					ld  a, 22
					ld  (__x2), a
					ld  a, 13
					ld  (__y2), a
					ld  a, GAME_OVER_ATTR
					ld  (__t), a
			#endasm
			draw_rectangle ();	
			draw_text (10, 12, GAME_OVER_ATTR, "LEVEL CLEAR!");
			#asm 
				call SPUpdateNow
			#endasm

			if (is128k) {
				arkos_play_music (MUS_STAGE_CLEAR + (levels_finished == 3));
			} else {
				beepet (); play_sfx (10);
			}

			espera_activa (500);

			#asm
					// Mark as finished
					ld  bc, (_level)
					ld  b, 0
					ld  hl, _level_finished
					add hl, bc 
					ld  a, 1
					ld  (hl), a

					ld  a, (_levels_finished)
					inc a 
					ld  (_levels_finished), a

					// Check all levels are finished
					cp  4
					jr  z, win_game_check_won

					// Not won, back to hub
					ld  a, 4
					ld  (_level), a
					ld  a, 1
					ld  (_new_level), a
					jr  win_game_check_done

				.win_game_check_won
					ld  a, 1
					ld  (_game_loop_flag), a

				.win_game_check_done
			#endasm
		}

		/*
		if (new_level) {
			new_level = 0;
			//saca_a_todo_el_mundo_de_aqui ();

			if (level != 4) {
				clear_game_area ();
				new_level_string [7] = level + '1';
				draw_text (12, 11, 71, new_level_string);
				draw_text (11, 13, 71, "KICK ASSES");
				#asm 
					call SPUpdateNow
				#endasm
				play_sfx (10);
				espera_activa (150);
			} 
			
			n_pant = scr_ini [level];
			init_player_values ();
			player.killed = 0; 
			resonators_on = 0;
			p_got_bellota = 0;
			tileset_mappings = (unsigned char *) (tilemaps + (level << 4));
		}
		*/
		#asm
				xor a
				ld  hl, _new_level
				or  (hl)
				ret z 

				xor a
				ld  (hl), a

				ld  a, (_level)
				cp  4
				jr  z, level_screen_done

				add 0x31 // '1'
				ld  (_new_level_string + 7), a

				call _clear_game_area
		#endasm
			if (is128k) arkos_play_music (MUS_STAGE_START);
			draw_text (12, 11, 71, new_level_string);
			draw_text (11, 13, 71, "KICK ASSES");
		#asm
				call SPUpdateNow

				ld  hl, 10
				call _play_sfx 

				ld  hl, 150
				push hl
				call _espera_activa
				pop bc

			.level_screen_done
				ld  bc, (_level)
				ld  b, 0
				ld  hl, _scr_ini
				add hl, bc
				ld  a, (hl)
				ld  (_n_pant), a

				call _init_player_values

				xor a
				ld  (_player + 32), a 				// player.killed
				ld  (_resonators_on), a 
				ld  (_p_got_bellota), a

				ld  a, (_level)
				sla a
				sla a
				sla a
				sla a
				ld  c, a
				ld  b, 0
				ld  hl, _tilemaps
				add hl, bc
				ld  (_tileset_mappings), hl
		#endasm
		if (is128k) arkos_play_music (level == 4 ? MUS_SELECT : (level + MUS_STAGE_BASE));

		// Nothing else below this or you have to change the assembly!
	}

	void hook_mainloop (void) {
		// Body count in hud is custom, so KILLED_X must be undefined in config.h!
		if (player.killed != killed_old) {
			draw_2_digits (16, 1, 60-player.killed);
			killed_old = player.killed;	
		}

		if (latest_hotspot == 33) {
			p_bellotas ++;
			p_got_bellota = 1;
			update_bellotas ();
		} else if (latest_hotspot == 34) {
			if (hotspots_semaphore == 0) {
				saca_a_todo_el_mundo_de_aqui ();
				select_power ();
				hotspots [n_pant].act = 1;
				on_pant = 0xff;
			}
			hotspots_semaphore = 1;
		} if (latest_hotspot >= 4) {
			// Activate resonator ? 
			#asm
					ld  a, (_latest_hotspot)
					cp  4
					jr  nz, activate_resonator_done

					// player.vy is 16 bits, load MSB and check bit 7
					// We want vy > 0 only
					ld  hl, (_player+8)
					bit 7, h
					jr  nz, activate_resonator_done
					ld  a, h
					or  l
					jr  z, activate_resonator_done 

					// hotspot_y >= gpy + 8
					ld  a, (_gpy)
					add 8
					ld  c, a
					ld  a, (_hotspot_y)
					cp  c
					jr  c, activate_resonator_done

				.activate_resonator
					ld  hl, 6
					call _play_sfx

					ld  a, 10
					ld  (_resonators_on), a
					xor a
					ld  (_resonators_ct), a
					ld  a, 5
					ld  (_latest_hotspot), a
					
					ld  hl, #(-PLAYER_MAX_VY_SALTANDO)
					ld  (_player+8), hl

				.activate_resonator_done

				// Hotspot has to be restored ALWAYS
				//hotspot_t = latest_hotspot; set_hotspot ();
					ld  a, (_latest_hotspot)
					ld  (_hotspot_t), a
					call _set_hotspot
			#endasm
		} else hotspots_semaphore = 0;

		#asm
			.resonators_do
				ld  a, (_resonators_on)
				ld  c, a
				or  a
				jr  z, resonators_done

				ld  a, (_resonators_ct)
				or  a
				jr  z, resonators_tick

				dec a
				ld  (_resonators_ct), a
				jr  resonators_done

			.resonators_tick
				ld  a, c
				dec a
				ld  (_resonators_on), a

				jr  nz, resonators_next_tick

			.resonators_last_tick
				ld  hl, 3
				call _play_sfx

				call _restore_everyone

				ld  a, (_hotspot_t)
				cp  4
				jr  c, resonators_done

				ld  a, 4
				ld  (_hotspot_t), a
				call _set_hotspot

				jr resonators_done

			.resonators_next_tick
				ld  hl, 4
				call _play_sfx

				ld  hl, 22
				push hl
				ld  hl, 1
				push hl
				ld  hl, (_resonators_on)
				push hl
				call _draw_2_digits 
				pop bc
				pop bc
				pop bc

				ld  a, (_resonators_frames)
				ld  (_resonators_ct), a

				call _paralyze_everyone
				
			.resonators_done
		#endasm
	}

	void hook_entering (void) {
		// Modify hotspots upon resonators_on
		if (hotspot_t == 4 || hotspot_t == 5) {
			// hotspot_t = resonators_on ? 5 : 4; set_hotspot ();
			#asm
					ld  a, (_resonators_on)
					or  a 							// if resonators_on -> Z set
					ld  a, 4
					jr  z, he_res_set
					inc a
				.he_res_set
					ld  (_hotspot_t), a
					call _set_hotspot 
			#endasm
		}
				
		if (resonators_on) paralyze_everyone ();

		// Hub screen
		// Leave this as the last code snippet in hook_entering!

		#asm
				ld  a, (_n_pant)
				cp  72
				ret nz

				ld  bc, 0x0004
			.hub_screen_loop
				dec bc
				push bc

				ld  a, c
				add 26
				ld  (_ls), a

				ld  hl, _hub_signs_x
				add hl, bc 
				ld  a, (hl)
				ld  (_rdx), a
				ld  (__x), a

				ld  hl, _hub_signs_y
				add hl, bc 
				ld  a, (hl)
				ld  (_rdy), a
				ld  (__y), a

				ld  hl, _level_finished
				add hl, bc
				ld  a, (hl)
				or  a
				jr  z, hub_screen_level_finished_done

			.hub_screen_level_finished
				call _set_block

			.hub_screen_level_finished_done

				ld  a, (_rdx)
				sla a
				ld  c, VIEWPORT_X
				add c
				ld  (__x), a

				ld  a, (_rdy)
				sla a
				ld  c, VIEWPORT_Y
				add c
				ld  (__y), a

				call _paint_sign

				pop bc
				ld  a, c
				or  b
				jr  nz, hub_screen_loop
		#endasm
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		/*
		malotes [enoffsmasi].mx = 0;
		malotes [enoffsmasi].my = (malotes [enoffsmasi].x1 < malotes [enoffsmasi].x2);
		*/
		enem_may_be_paralyzed [enit] = 1;

		#asm
				ld  hl, (_enoffsmasi)
				call _calc_baddies_pointer

				// Now transfer HL to IX
				push hl 
				pop ix

				ld  a, (__en_t)

				cp  4
				jr  z, enems_init_platforms

				cp  5
				jr  z, enems_init_zurulli

				cp  15
				ret nz

				// 0  1  2   3   4   5   6   7   8   9
				// x, y, x1, y1, x2, y2, mx, my, t[, life]
				ld  c, (ix+4)
				ld  a, (ix+2)
				cp  c
				jr  c, gyrosaw_clockwise

			.gyrosaw_counter_clockwise
				xor a
				jr gyrosaw_direction_set

			.gyrosaw_clockwise
				ld  a, 1

			.gyrosaw_direction_set
				ld  (ix+7), a
		#endasm
		en_an_next_frame [enit] = GYROSAW_SPRITE_CELL;
		#asm
			.enems_init_platforms
		#endasm
		enem_may_be_paralyzed [enit] = 0;
		#asm
				ret

			.enems_init_zurulli
		#endasm
		en_an_next_frame [enit] = PEZON_SPRITE_CELL;
	}

	void extra_enems_move (void) {		
		if (_en_t == 5) {
			// Pezons / zurullis
			#asm
					ld  a, (__en_mx)
					ld  c, a
					cp  24
					jr  nc, pezons_idle

				.pezons_moving
					ld  b, 0					
					ld  hl, _pezon_incs
					add hl, bc
					ld  d, (hl)

					ld  a, (__en_y)
					add d

					jr  pezons_move_done

				.pezons_idle
					ld  a, (__en_y1)

				.pezons_move_done
					ld  (__en_y), a

					ld  a, c
					inc a
					and 63
					ld  (__en_mx), a
			#endasm
			en_an_next_frame [enit] = PEZON_SPRITE_CELL;
		}

		if (_en_t == 15) {
			// mx -> counter
			// my -> 1 = clockwise, 0 = counter clockwise

			#asm
					/*
					ld  bc, (_enit)
					ld  b, 0
					ld  hl, _en_an_state
					add hl, bc 						// HL -> state (0-3)
					*/
					ld  hl, __en_y2

					ld  d, (hl) 					// D = state

				.gyrosaw_sign
					// Calculate advancement positive (0) or negative (1)
					// my = 1 -> clockwise,        sign = state >> 1.
					// my = 0 -> counterclockwise, sign = 1-(state >> 1) (flipped)

					ld  b, d  						// state
					srl b 							// state >> 1					

					ld  a, (__en_my)
					or  a

					ld  a, b
					jr  nz, gyrosaw_sign_done

					// my = 0, flip bit
					xor 1
				.gyrosaw_sign_done

				.gyrosaw_velocity
					or  a 							// zero means positive
					jr  nz, gyrosaw_adv_negative

				.gyrosaw_adv_positive
					ld  c, GYROSAW_V
					jr  gyrosaw_velocity_set

				.gyrosaw_adv_negative
					ld  c, -GYROSAW_V
					
				.gyrosaw_velocity_set

					// Calculate which direction, horizontal (0) or vertical (1)
					// my = 1 -> clockwise,        direction = state & 1
					// my = 0 -> counterclockwise, direction = 1-(state & 1) (flipped)
					
				// if (en_an_state [enit] & 1) _en_y += rdd; else _en_x += rdd;
				.gyrosaw_advance
					ld  a, d 
					and 1 							// state >> 1
					ld  b, a 						// save for later

					ld  a, (__en_my)
					or  a

					ld  a, b 
					jr  nz, gyrosaw_advance_do 
					xor 1

				.gyrosaw_advance_do 
					or  a
					jr  z, gyrosaw_horizontal

				.gyrosaw_vertical
					ld  a, (__en_y)
					add c 							// C = velocity
					ld  (__en_y), a
					jr  gyrosaw_advance_done

				.gyrosaw_horizontal
					ld  a, (__en_x)
					add c 							// C = velocity
					ld  (__en_x), a

				.gyrosaw_advance_done

				// mx = (mx + GYROSAW_V) & 31; if (!mx) en_an_state [enit] = (en_an_state [enit] + 1) & 3;
				.gyrosaw_state_change
					ld  a, (__en_mx)
					add GYROSAW_V
					and 31 							// MOD 32, also sets Z!
					ld  (__en_mx), a

					jr  nz, gyrosaw_done

					ld  a, d
					inc a
					and 3
					ld  (hl), a

				.gyrosaw_done
			#endasm
			en_an_next_frame [enit] = GYROSAW_SPRITE_CELL;
		}
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}
	
#endif
