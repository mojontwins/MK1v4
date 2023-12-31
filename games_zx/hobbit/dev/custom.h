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

// Decos, screen 0
unsigned char decos0 [] = { 0xae, 0x22, 0xff };

// Decos, screen 1
unsigned char decos1 [] = { 0xa8, 0x14, 0xa9, 0x15, 0xff };

// Decos, screen 5
unsigned char decos2 [] = { 0xA9, 0x17, 0x2A, 0x03, 0x15, 0x24, 0x55, 0x2B, 
							0x04, 0x16, 0x23, 0x25, 0x34, 0x2C, 0x03, 0x17,
							0x29, 0x44, 0xAD, 0x18, 0xA6, 0x36, 0xA7, 0x37, 
							0xA4, 0x46, 0xA5, 0x47, 0xff };

#ifdef LANG_EN
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "_BILBOS%"
							 "DAMN, THAT STENCH!%"
							 "PRETTY SURE THIS GUY'S%"
							 "NOT A HOBBIT!";

	unsigned char text1 [] = "_BILBOS%"
							 "I WONDER WHY THERE'RE%"
							 "SO MANY DWARVES AROUND";

	unsigned char text2 [] = "_BILBOS%"
							 "LOOK! ANOTHER TINY,%"
							 "FILTHY DUDE!";

	unsigned char text3 [] = "_BILBOS%"
							 "DO MANY DWARVES. MUST%"
							 "BE A CIRCUS NEARBY";	

	unsigned char text4 [] = "_GANDALF%"
							 "HELLOS. I'M AN OLD GUY%"
							 "THAT DOES MAGIC. DO YA%"
							 "WANNA WIN A TREASURE?";

	unsigned char text5 [] = "_GANDALF%"
							 "TO WIN THE TREASURE%"
							 "YOU MUST STEAL IT FROM%"
							 "DRAGON SMAUG WHO LIVES%"
							 "IN THAT MOUNTAIN";

	unsigned char text6 [] = "_BILBOS%"
							 "THAT I KNOW BUT SUCH%"
							 "MOUNTAIN IS AS CLOSED%"
							 "AS BARBIE'S TWAT!";	

	unsigned char text7 [] = "_GANDALF%"
							 "THE DWARVES FROM THE%"
							 "FOREST KNOW HOW TO OPEN%"
							 "THE MOUNTAIN. FIND ALL%"
							 "13 AND COME BACK HERE";

	unsigned char text8 [] = "_GANDALF%"
							 "DWARVES ARE CRAZY AND%"
							 "STARTED A WAR, BUT THE%"
							 "MOUNTAIN IS OPEN! GO%"
							 "THERE ASAP!";

	unsigned char text9 [] = "_DWARFIE%"
							 "HIYA, I'M               %"
							 "WANNA FIGHT?";
#else
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "_BILBOS%"
							 "UF, QUE PESTE ECHA...%"
							 "LAVARSE NO DEBE SER SU%"
							 "HOBBIT!";

	unsigned char text1 [] = "_BILBOS%"
							 "ME PREGUNTO QUE HARAN%"
							 "TANTOS ENANOS EN HO-%"
							 "BBITLANDIA";

	unsigned char text2 [] = "_BILBOS%"
							 "VAYA! OTRO SE/OR BAJI-%"
							 "TO Y SUCIO!";

	unsigned char text3 [] = "_BILBOS%"
							 "CUANTO ENANO. DEBE HA-%"
							 "BER UN CIRCOS CERCA";	

	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text4 [] = "_GANDALF%"
							 "HOLA, SOY UN SE/OR QUE%"
							 "HACE MAGIAS. QUIERES%"
							 "GANAR UN TESORO, JOVEN%"
							 "Y APUESTO ZAGALETE?";

	unsigned char text5 [] = "_GANDALF%"
							 "PARA GANAR EL TESORO%"
							 "HAY QUE ROBARSELO AL%"
							 "DRAGON SMAUG QUE VIVE%"
							 "EN LA MONTA/A NOSEQUE";	

	unsigned char text6 [] = "_BILBOS%"
							 "ESO YA LO SE PERO LA%"
							 "MONTA/A ESTA CERRADA%"
							 "CUAL TOTO DE NANCY";	

	unsigned char text7 [] = "_GANDALF%"
							 "LOS ENANITOS DEL BOS-%"
							 "QUE SABRAN ABRIRTE LA%"
							 "MONTA/A. ENCUENTRA LOS%"
							 "13 Y VUELVE AQUIS!";

	unsigned char text8 [] = "_GANDALF%"
							 "LOS ENANOS SAN EMPA-%"
							 "RANOIAO Y KIERE PELEA%"
							 "PERO LA MONTA/A ESTA%"
							 "ABIERTA. APROVECHA!";	

	unsigned char text9 [] = "_ENANITO%"
							 "HOLA, SOY           %"
							 "KIERE PELEA?";
#endif

unsigned char *texts [] = {
	text0, text1, text2, text3, 			// Dwarves are unknown to bilbos
	text4, text5, text6, text7, 			// Gandalf - biblo talks
	text8, 									// Cave is open
	text9, 									// I am dwarf... write from p+13
};

unsigned char dwarf_names [] = 
	"TORREBRUNO"
	"JAIMITO   "
	"ESTESSO   "
	"CARABIAS  "
	"DABID NOMO"
	"BELFI     "
	"LILLIBIT  "
	"MEMOLE    "
	"GIMLI     "
	"R2-D2     "
	"ROMAYS    "
	"TASSLEHOFF"
	"GALLOFA   ";

void insert_dwarf_name (void) {
	// copy 10 bytes dwarf_ct -> text9 + 19; dwarf_ct += 10
	#asm
			ld  a, (_dwarf_ct)
			ld  b, 0
			ld  c, a 
			add 10 
			ld  (_dwarf_ct), a 
			ld  hl, _dwarf_names
			add hl, bc
			ld  de, _text9 + 19
			ld  bc, 10
			ldir 
	#endasm
}

void draw_decos (void) {
	// Draws decos @ gp_gen
	#asm
			// In this case we can shave some bytes assumming this
			xor a 
			ld  (__n), a

			//
			ld  hl, (_gp_gen)
		.deco_loop
			ld  a, (hl)
			inc hl

			cp  0xff 
			jr  z, deco_done

			// Single deco or run of decos?
			bit 7, a 
			jr  z, deco_run 

			// Single deco
			and 0x7f 
			ld  (__t), a
			ld  b, 1
			jr  deco_run_do 

		.deco_run
			ld  (__t), a
			ld  b, (hl)
			inc hl 

		.deco_run_do 
			push bc 

			ld  a, (hl)
			inc hl

			ld  d, a
			and 0x0f
			ld  (__x), a
			ld  c, a
			ld  a, d
			srl a
			srl a
			srl a
			srl a
			ld  (__y), a

			call set_map_tile_do

			pop bc 
			djnz deco_run_do

			jr  deco_loop
		.deco_done
	#endasm
}

void draw_cur_screen_decos (void) {
	switch (n_pant) {
	case 0:
		gp_gen = decos0; draw_decos (); break;
	case 1:
		gp_gen = decos1; draw_decos (); break;
	case 5:
		gp_gen = decos2; draw_decos (); break;
	case 31:
		// Cover the entrance to the mountain
		if (gandalf_talk != 2) {
			set_map_tile (9, 0, 31, 8);
		}
		break;
}
}

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

void show_text_box (void) {
	sprite_remove_aid ();

	gp_gen = texts [rda];

	// Text renderer will read the string and
	// build substrings for draw_text.

	//clear_temp_string ();
	draw_text (4, 5, ATTR_TEXTBOX, top_string);
	rdy = 7;

	while (1) {
		clear_temp_string ();
		draw_text (4, rdy - 1, ATTR_TEXTBOX, temp_string);

		#asm
				// Fill buffer
				ld  de, _temp_string + 1
				ld  a, (_rdy)
				cp  7
				jr  nz, fill_buffer_noinc
				inc de 
				inc de
			.fill_buffer_noinc
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
	
		if (*gp_gen == 0) break;
		gp_gen ++;
	}

	#asm
			ld  a, 5
			ld  (__x), a
			ld  a, 6
			ld  (__y), a 
			ld  a, (_rdb)
			ld  (__t), a
			call _draw_coloured_tile_do
	#endasm

	sp_UpdateNow ();
	play_sfx (talk_sounds [rand () & 1]);

	while (any_key ()); while (!any_key ()); 
	if (redraw_after_text) {
		redraw_from_buffer ();
		//draw_cur_screen_decos ();
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

		// Debug
		gandalf_talk = 1; dwarf_ct = 0;
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		if(n_pant == 0) {
			// Gandalf
			if (gpx < 48 && gpy < 48) {
				if (gandalf_flag == 0) {
					if (gandalf_talk == 1 && player.objs < 13) {
						rdb = 46; rda = 7; show_text_box ();
					} 

					if (gandalf_talk == 0) {
						rdb = 46;
						rda = 4; show_text_box ();
						rda = 5; show_text_box ();
						rdb = 47; rda = 6; show_text_box ();
						rdb = 46; rda = 7; show_text_box ();

						gandalf_talk = 1;

						// Reset this to reuse as dwarf name pointer
						dwarf_ct = 0;
					}

					if (player.objs == 13 || gandalf_talk == 2) {
						rdb = 46; rda = 7; show_text_box ();
						gandalf_talk = 2;
					}
				}

				gandalf_flag = 1;
			} else {
				gandalf_flag = 0;
			}
		}
	}

	void hook_entering (void) {	
		draw_cur_screen_decos ();	
	}

	void hook_hotspots (void) {	
		if (gandalf_talk == 0) {
			rda = dwarf_ct; rdb = 47; show_text_box ();
			dwarf_ct = (dwarf_ct + 1) & 3;

			// And invalidate hotspot
			hotspot_t = 0;
		} else {
			insert_dwarf_name ();
			rda = 9; rdb = 17; show_text_box ();
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
