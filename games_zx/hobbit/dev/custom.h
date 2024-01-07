// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// Add here your custom routines & vars

#define ATTR_TEXTBOX   48

unsigned char gandalf_talk;		// 0 - init, 1 - talk, 2 - open
unsigned char dwarf_talk;
unsigned char dwarf_ct;
unsigned char interact_flag;

unsigned char top_string []    = "<======================>";
unsigned char temp_string []   = ";                      [";
unsigned char bottom_string [] = "\\]]]]]]]]]]]]]]]]]]]]]]^";
unsigned char redraw_after_text;
unsigned char intro_text;
unsigned char talk_sounds [] = { 7, 11 };

unsigned char n_pant_was, xwas, ywas;
unsigned char comecocos_on;
unsigned char cocos_count;

// Show a text box next frame:
unsigned char tfn_a, tfn_b, delayed_ct;

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

	unsigned char text10[] = "_%"
							 "BIKE LIKE NEW FOR SALE";
	// Fases comecocas

	unsigned char text11[] = "BILBOS THINKS ABOUT%"
							 "THE FANTASTIC TREASURE%"
							 "THIS LEVEL REPRESENTS%"
							 "BILBOS' THINKING...";

	unsigned char text12[] = "THE DWARVES OPEN THE%"
							 "COMPLICATED DOOR IN%"
							 "THE MOUNTAIN. THIS LE-%"
							 "VEL REPRESENTS THE%"
							 "OPEN OF THE DOOR";

	unsigned char text13[] = "PLACEHOLDER";

	unsigned char text14[] = "PLACEHOLDER";

	unsigned char text15[] = "PLACEHOLDER";

	unsigned char text16[] = "PLACEHOLDER";

	unsigned char text17[] = "PLACEHOLDER";
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

	unsigned char text10[] = "_CHERIL%"
							 "VENDO MOTO SEMINUEVA"; 

	// Fases comecocas

	unsigned char text11[] = "BILBOS PIENSA EN LO%"
							 "QUE DICE GANDALF DEL%"
							 "TESORO. ESTA FASE RE%"
							 "PRESENTA EL PENSAMIEN-%"
							 "TO DE BILBOS";

	unsigned char text12[] = "LOS ENANITO ABREN LA%"
							 "COMPLICADA PUERTA DE%"
							 "LA MONTA/A. ESTA FASE%"
							 "REPRESENTA LA ABRI-%"
							 "SION DE LA PUERTA";

	unsigned char text13[] = "PLACEHOLDER";

	unsigned char text14[] = "PLACEHOLDER";

	unsigned char text15[] = "PLACEHOLDER";

	unsigned char text16[] = "PLACEHOLDER";

	unsigned char text17[] = "PLACEHOLDER";
#endif

unsigned char *texts [] = {
	text0, text1, text2, text3, 			// Dwarves are unknown to bilbos
	text4, text5, text6, text7, 			// Gandalf - biblo talks
	text8, 									// Cave is open
	text9, 									// I am dwarf... write from p+13
	text10, 								// Moto seminueva
	text11, text12, text13, text14,
	text15, text16, text17 					// Comecocos
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
			ld  a, 8 
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

			push hl
			call set_map_tile_do
			pop hl 

			pop bc 
			djnz deco_run_do

			jr  deco_loop
		.deco_done
	#endasm
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
				ld  a, (_rdb) 
				or  a 
				jr  z, fill_buffer_noinc
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
			ld  a, (_rdb) 
			or  a 
			jr  z, no_character
			ld  a, 5
			ld  (__x), a
			ld  a, 6
			ld  (__y), a 
			ld  a, (_rdb)
			ld  (__t), a
			call _draw_coloured_tile_do
		.no_character
	#endasm

	sp_UpdateNow ();
	play_sfx (talk_sounds [rand () & 1]);

	while (any_key ()); while (!any_key ()); 
	if (redraw_after_text) {
		redraw_from_buffer ();
		hotspot_paint ();
		render_all_sprites ();
		sp_UpdateNow  ();
	}
	redraw_after_text = 1;
}

void recuadrius (void) {	
	sprite_remove_aid ();			
	for (rdi = 0; rdi < 10; rdi ++) {
		for (rdx = rdi; rdx < 30 - rdi; rdx ++) {
			#asm
					// sp_PrintAtInv (VIEWPORT_Y + rdi, VIEWPORT_X + rdx, 71, 0);
					ld  de, 0x4700
					ld  a, (_rdx)
					add VIEWPORT_X
					ld  c, a
					ld  a, (_rdi)
					add VIEWPORT_Y
					call SPPrintAtInv
				
					// sp_PrintAtInv (VIEWPORT_Y + 19 - rdi, VIEWPORT_X + rdx, 71, 0);
					ld  de, 0x4700
					ld  a, (_rdx)
					add VIEWPORT_X
					ld  c, a
					ld  a, (_rdi)
					ld  b, a
					ld  a, VIEWPORT_Y + 19
					sub b
					call SPPrintAtInv
			#endasm

			if (rdx < 19 - rdi) {
				#asm
						// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + rdi, 71, 0);
						ld  de, 0x4700
						ld  a, (_rdi)
						add VIEWPORT_X
						ld  c, a
						ld  a, (_rdx)
						add VIEWPORT_Y
						call SPPrintAtInv

						// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + 29 - rdi, 71, 0);
						ld  de, 0x4700
						ld  a, (_rdi)
						ld  b, a
						ld  a, VIEWPORT_X + 29
						sub b
						ld  c, a
						ld  a, (_rdx)
						add VIEWPORT_Y							
						call SPPrintAtInv
				#endasm
			}
		}
		#asm
			halt
			call SPUpdateNow
		#endasm
	}
}

void draw_cur_screen_decos (void) {
	switch (n_pant) {
		case 0:
			gp_gen = decos0; draw_decos (); break;
		case 1:
			gp_gen = decos1; draw_decos (); break;
		case 5:
			gp_gen = decos2; draw_decos (); break;
		case 24:
			// Dwarf at the entrance to the mountain / closed door
			if (dwarf_talk == 0) {
				set_map_tile (9, 7, 17, 8);
			} else {
				set_map_tile (9, 9, 15, 8);
			}
		case 31:
			// Cover the entrance to the mountain
			if (gandalf_talk != 2) {
				set_map_tile (9, 0, 15, 8);
			}
			break;
	}
}

void launch_comecocos_screen(void) {
	// Launches comecocos screen in rda
	sprite_remove_aid ();

	// to return
	#asm
			ld  a, (_n_pant)
			ld  (_n_pant_was), a
			ld  a, (_gpx)
			ld  (_xwas), a
			ld  a, (_gpy)
			ld  (_ywas), a
	#endasm

	// Clear screen
	recuadrius ();

	// New n_pant
	n_pant = 35 + rda;

	// Show text
	redraw_after_text = 0;
	rdb = 0; rda = 11 + rda; show_text_box ();

	gpx = gpy = 16; player.x = player.y = 16 << 6;

	wyz_play_music (5);
	comecocos_on = 1;
	player.coins = 0;

}

void back_from_comecocos_screen(void) {
	// Then return

	#asm
			ld  a, (_n_pant_was)
			ld  (_n_pant), a
			ld  a, (_xwas)
			ld  (_gpx), a
			call Ashl16_HL
			ld  (_player), hl

			ld  a, (_ywas)
			ld  (_gpy), a
			call Ashl16_HL
			ld  (_player + 2), hl
	#endasm
}

unsigned char touch_tile (void) {
	// Player touches tile x, y, with pixel pos xx, yy if
	// gpx >= xx - 15 && gpx < xx + 16
	// gpy >= yy - 15 && gpy < yy + 16

	// It's very easy for you to just precalc pixel coords!
	#asm
		// Result
			ld  hl, 0

		// Then check
			ld  a, (__x)
			sub 15
			ld  c, a 
			ld  a, (_gpx) 
			cp  c 
			ret c 

			ld  a, (__x) 
			add 16
			ld  c, a 
			ld  a, (_gpx) 
			cp  c 
			ret nc 

			ld  a, (__y)
			sub 15
			ld  c, a 
			ld  a, (_gpy) 
			cp  c 
			ret c 

			ld  a, (__y) 
			add 16
			ld  c, a 
			ld  a, (_gpy) 
			cp  c 
			ret nc

			ld  hl, 1	
	#endasm
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		gandalf_talk = 0;
		dwarf_talk = 0;
		comecocos_on = 0;
		dwarf_ct = rand () & 3;
		redraw_after_text = 1;

		wyz_play_music (1);

		// Debug
		gandalf_talk = 0; dwarf_ct = 0; player.objs = 0; n_pant = 1;
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		// Delayed text
		if (delayed_ct > 0) {
			delayed_ct --;
		}

		if (delayed_ct == 1) {
			rdb = tfn_b; rda = tfn_a; show_text_box ();
		}

		// Comecocos shit
		if (comecocos_on && player.coins == cocos_count) {
			back_from_comecocos_screen ();
			comecocos_on = 0;

			if (gandalf_talk == 1) {
				wyz_play_music (2); 	// AYJO
				tfn_b = 46; tfn_a = 7;
				delayed_ct = 3;
			}
		}

		// Interactions
		switch(n_pant) {
			case 0:
				// Gandalf
				_x = _y = 2 << 4; if (touch_tile ()) {
				//if (gpx < 48 && gpy < 48) {
					if (interact_flag == 0) {
						if (gandalf_talk == 1 && player.objs < 13) {
							rdb = 46; rda = 7; show_text_box ();
						} 

						if (gandalf_talk == 0) {
							rdb = 46;
							rda = 4; show_text_box ();
							rda = 5; show_text_box ();
							rdb = 47; rda = 6; show_text_box ();

							gandalf_talk = 1;

							// Reset this to reuse as dwarf name pointer
							dwarf_ct = 0;

							// But first, fire up comecocos #0
							rda = 0;
							launch_comecocos_screen ();
							cocos_count = 65;
						}

						if (player.objs == 13 || gandalf_talk == 2) {
							rdb = 46; rda = 8; show_text_box ();
							gandalf_talk = 2;

							// Fire up comecocos #1
							rda = 1;
							launch_comecocos_screen ();
							cocos_count = 65;
						}
					}

					interact_flag = 1;
				} else {
					interact_flag = 0;
				}

				break;
			case 1:
				// Moto seminueva
				if (gpx > 48 && gpx < 88 && gpy < 32) {
					if (interact_flag == 0) {
						rdb = 35; rda = 10; show_text_box ();
						interact_flag = 1;
					}
				} else {
					interact_flag = 0;
				}
				
				break;
			case 24:
				// Enano en la cueva
				break;
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
