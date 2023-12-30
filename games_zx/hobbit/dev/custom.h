// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// Add here your custom routines & vars

#define ATTR_TEXTBOX   48

unsigned char gandalf_talk;		// 0 - init, 1 - talk, 2 - open
unsigned char dwarf_ct;
unsigned char gandalf_flag;

unsigned char top_string []    = "<======================>";
unsigned char temp_string []   = ";                      [";
unsigned char bottom_string [] = "\\]]]]]]]]]]]]]]]]]]]]]]^";
unsigned char redraw_after_text;
unsigned char intro_text;
unsigned char talk_sounds [] = { 7, 11 };

#ifdef LANG_EN
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "(BILBOS)%"
							 "DAMN, THAT STENCH!%"
							 "PRETTY SURE THIS GUY'S%"
							 "NOT A HOBBIT!";

	unsigned char text1 [] = "(BILBOS)%"
							 "I WONDER WHY THERE'RE%"
							 "SO MANY DWARVES AROUND";

	unsigned char text2 [] = "(BILBOS)%"
							 "LOOK! ANOTHER TINY,%"
							 "FILTHY DUDE!";

	unsigned char text3 [] = "(BILBOS)%"
							 "DO MANY DWARVES. MUST%"
							 "BE A CIRCUS NEARBY";	

	unsigned char text4 [] = "(GANDALF)%"
							 "HELLOS. I'M AN OLD GUY%"
							 "THAT DOES MAGIC. DO YA%"
							 "WANNA WIN A TREASURE?";

	unsigned char text5 [] = "(GANDALF)%"
							 "TO WIN THE TREASURE%"
							 "YOU MUST STEAL IT FROM%"
							 "DRAGON SMAUG WHO LIVES%"
							 "IN THAT MOUNTAIN";

	unsigned char text6 [] = "(BILBOS)%"
							 "THAT I KNOW BUT SUCH%"
							 "MOUNTAIN IS AS CLOSED%"
							 "AS BARBIE'S TWAT!";	

	unsigned char text7 [] = "(GANDALF)%"
							 "THE DWARVES FROM THE%"
							 "FOREST KNOW HOW TO OPEN%"
							 "THE MOUNTAIN. FIND ALL%"
							 "13 AND COME BACK HERE";
#else
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "(BILBOS)%"
							 "UF, QUE PESTE ECHA...%"
							 "LAVARSE NO DEBE SER SU%"
							 "HOBBIT!";

	unsigned char text1 [] = "(BILBOS)%"
							 "ME PREGUNTO QUE HARAN%"
							 "TANTOS ENANOS EN HO-%"
							 "BBITLANDIA";

	unsigned char text2 [] = "(BILBOS)%"
							 "VAYA! OTRO SE/OR BAJI-%"
							 "TO Y SUCIO!";

	unsigned char text3 [] = "(BILBOS)%"
							 "CUANTO ENANO. DEBE HA-%"
							 "BER UN CIRCOS CERCA";	

	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text4 [] = "(GANDALF)%"
							 "HOLA, SOY UN SE/OR QUE%"
							 "HACE MAGIAS. QUIERES%"
							 "GANAR UN TESORO, JOVEN%"
							 "Y APUESTO ZAGALETE?";

	unsigned char text5 [] = "(GANDALF)%"
							 "PARA GANAR EL TESORO%"
							 "HAY QUE ROBARSELO AL%"
							 "DRAGON SMAUG QUE VIVE%"
							 "EN LA MONTA/A NOSEQUE";	

	unsigned char text6 [] = "(BILBOS)%"
							 "ESO YA LO SE PERO LA%"
							 "MONTA/A ESTA CERRADA%"
							 "CUAL TOTO DE NANCY";	


	unsigned char text7 [] = "(GANDALF)%"
							 "LOS ENANITOS DEL BOS-%"
							 "QUE SABRAN ABRIRTE LA%"
							 "MONTA/A. ENCUENTRA LOS%"
							 "13 Y VUELVE AQUIS!";						 		
#endif

unsigned char *texts [] = {
	text0, text1, text2, text3, 			// Dwarves are unknown to bilbos
	text4, text5, text6, text7, 			// Gandalf - biblo talks
};

void redraw_from_buffer (void) {
	#asm
			ld  a, VIEWPORT_X
			ld  (__x), a
			ld  a, VIEWPORT_Y
			ld  (__y), a
			
			xor a
		.redraw_from_buffer_loop
			ld  (_gpit), a

			ld  bc, (_gpit)
			ld  b, 0
			ld  hl, _map_buff
			add hl, bc
			ld  a, (hl)
			cp  16
			jr  nc, redraw_set_tile

		.redraw_set_tile
			ld  (__t), a

			call _draw_coloured_tile_do

			ld  a, (__x)
			add a, 2
			cp  VIEWPORT_X + 30
			jr  nz, redraw_from_buffer_set_x
			ld  a, (__y)
			add a, 2
			ld  (__y), a
			ld  a, VIEWPORT_X
		.redraw_from_buffer_set_x
			ld  (__x), a

			ld  a, (_gpit)
			inc a
			cp  150
			jr  nz, redraw_from_buffer_loop
	#endasm
}

void clear_temp_string (void) {
	#asm
			ld  hl, _temp_string+1
			ld  de, _temp_string+2
			ld  bc, 21
			ld  a, 32
			ld  (hl), a
			ldir
	#endasm
}

void sprite_remove_aid (void) {
	saca_a_todo_el_mundo_de_aqui ();

	// Validate whole screen so sprites stay on next update
	#asm
			LIB SPValidate
			ld  c, VIEWPORT_X
			ld  b, VIEWPORT_Y
			ld  d, VIEWPORT_Y+19
			ld  e, VIEWPORT_X+29
			ld  iy, fsClipStruct
			call SPValidate
	#endasm				
}

void show_text_box (unsigned char n) {
	sprite_remove_aid ();

	gp_gen = texts [n];

	// Text renderer will read the string and
	// build substrings for draw_text.

	//clear_temp_string ();
	draw_text (4, 6, ATTR_TEXTBOX, top_string);
	rdy = 7;

	while (1) {
		clear_temp_string ();
		if (rdy > 7) draw_text (4, rdy - 1, ATTR_TEXTBOX, temp_string);

		#asm
				// Fill buffer
				ld  de, _temp_string + 1
				ld  hl, (_gp_gen)

			.fill_buffer_loop
				ld  a, (hl)
				or  a
				jr  z, fill_buffer_end
				cp  '%'
				jr  z, fill_buffer_end

				ld  (de), a

				inc hl
				inc de
				jr  fill_buffer_loop

			.fill_buffer_end
				ld  (_gp_gen), hl
		#endasm

		draw_text (4, rdy ++, ATTR_TEXTBOX, temp_string);
		draw_text (4, rdy ++, ATTR_TEXTBOX, bottom_string);

		sp_UpdateNow ();
		play_sfx (talk_sounds [rand () & 1]);

		#ifdef MODE_128K_DUAL
			if (is128k) {
				#asm
						ld  b, 20
					.textbox_delay
						halt
						djnz textbox_delay
				#endasm
			}
		#endif
	
		if (*gp_gen == 0) break;
		gp_gen ++;
	}

	while (any_key ()); while (!any_key ()); 
	if (redraw_after_text) {
		redraw_from_buffer ();
		hotspot_paint ();
		render_all_sprites ();
		sp_UpdateNow  ();
	}
	redraw_after_text = 1;
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		gandalf_talk = 0;
		dwarf_ct = rand () & 3;
		redraw_after_text = 1;
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		if(n_pant == 0) {
			// Gandalf
			if (gpx < 48 && gpy < 48) {
				if (gandalf_flag == 0) {
					if (gandalf_talk == 0) {
						show_text_box (4);
						show_text_box (5);
						show_text_box (6);
						show_text_box (7);

						gandalf_talk = 1;
					}
				} else if (gandalf_talk == 1) {
					if (player.objs < 13) {
						show_text_box (7);
					}
				}
			} else {
				gandalf_flag = 0;
			}
		}
	}

	void hook_entering (void) {		
	}

	void hook_hotspots (void) {	
		if (gandalf_talk == 0) {
			show_text_box (dwarf_ct);
			dwarf_ct = (dwarf_ct + 1) & 3;

			// And invalidate hotspot
			hotspot_t = 0;
		}
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
