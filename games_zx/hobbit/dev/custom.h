// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// Add here your custom routines & vars

#define ATTR_TEXTBOX   48

unsigned char gandalf_talk;		// 0 - init, 1 - talk, 2 - open
unsigned char dwarf_talk;
unsigned char dwarf_ct;
unsigned char sonia_talk;
unsigned char interact_flag;
unsigned char anillo_flag;
unsigned char anillo_ct;
unsigned char gallumb_flag;
unsigned char last_estado;

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

	unsigned char text13[] = "SONIA THE MUMMY IS%"
							 "VERY CONFUSED. THIS%"
							 "LEVEL REPRESENTS THE%"
							 "CONFUSION OF SONIA";

	unsigned char text14[] = "THE RING HAS PLENTY OF%"
							 "MAGIC. BILBO NEEDS TO%"
							 "DOMINATE IT!THIS LEVEL%"
							 "IS BILBO DOMINATING%"
							 "THE RING";

	unsigned char text15[] = "PLACEHOLDER";

	unsigned char text16[] = "PLACEHOLDER";

	unsigned char text17[] = "PLACEHOLDER";

	unsigned char text18[] = "_GANDALF%"
							 "THANK YOU FOR BRINGING%"
							 "THE DWARVES. NOW I'LL%"
							 "MAKE THEM OPEN THAT%"
							 "MOUNTAIN...";

	unsigned char text19[] = "_DWARFY%"
							 "WE WERE GONNA GET THE%"
							 "TREASURE AND BE GREAT%"
							 "AGAIN BUT A NASTY PRO-%"
							 "BLEM AROSE...";

	unsigned char text20[] = "_DWARFY%"
							 "GALLUMB JUST ARRIVED%"
							 "FROM DA PLANET DAGOBAH%"
							 "AND THE FORCE IS VERY%"
							 "STRONG IN HIM";

	unsigned char text21[] = "_ENANITO%"
							 "TAKE A LOOK AT DA CAVE%"
							 "IF YOU WILL BUT DON'T%"
							 "LET GALLUMB SEE YOU OR%"
							 "YOU'LL DIE!";

	unsigned char text22[] = "_BILBOS%"
							 "A ROLL OF TOILET PAPER%"
							 "IT\"S NONE THE COARSE%"
							 "MAKES YOU FEEL BETTER%"
							 "AND CLEANS YOU ARSE%";

	unsigned char text23[] = "_BILBOS%"
							 "HEY WAIT A BIT,I THINK%"
							 "YO'RE FROM A DIFFERENT%"
							 "GAME!"

	unsigned char text24[] = "_SONIA%"
							 "DUNNO, MAYBE.THE MOJON%"
							 "TWINS REUSE A LOT OF%"
							 "CODE SO THEY PROBABLY%"
							 "FORGOT TO REMOVE ME!";


	unsigned char text25[] = "_RING%"
							 "I'M THE MAGIC RING!%"
							 "PUT YOUR FINGER INSIDE%"
							 "ME AND I'LL MAKE YOU%"
							 "INIVISIBLE.";

	unsigned char text26[] = "_RING%"
							 "YOU WON! NOW I'LL OBEY%"
							 "PUSH FIRE TO PUT ME ON";
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

	unsigned char text13[] = "SONIA LA MOMIA ESTA%"
							 "MUY CONFUNDIDA. ESTA%"
							 "FASE REPRESENTA LA%"
							 "CONFUSION DE SONIA";

	unsigned char text14[] = "EL ANILLO TIENE MUCHA%"
							 "MAGIA Y BILBOS TENDRA%"
							 "QUE DOMINARLA. ESTA%"
							 "FASE ES LA DOMINASION";

	unsigned char text15[] = "PLACEHOLDER";

	unsigned char text16[] = "PLACEHOLDER";

	unsigned char text17[] = "PLACEHOLDER";

	unsigned char text18[] = "_GANDALF%"
							 "GRACIAS POR LOS ENANOS%"
							 "ESTOS, BILBOS. AHORA%"
							 "JUNTARAN PICHA PARA%"
							 "ABRIR LA MONTA/A...";

	unsigned char text19[] = "_ENANITO%"
							 "IBAMOS A COGER EL TE-%"
							 "SORO Y SER GRANDES DE%"
							 "NUEVO (EN SENTIDO ME-%"
							 "TAFORICO) PERO HAY UN%"
							 "PROBLEMA...";

	unsigned char text20[] = "_ENANITO%"
							 "GALLUMB HA LLEGADO DEL%"
							 "PLANETA DAGOBAH Y RON-%"
							 "DA LOS PASILLOS. DOMI-%"
							 "NA LA FUERZA!";

	unsigned char text21[] = "_ENANITO%"
							 "PASEATE POR LA CUEVA%"
							 "SI QUIERES, PERO PRO-%"
							 "CURA QUE GALLUMB NO TE%"
							 "VEA O MORIRAS!";

	unsigned char text22[] = "_BILBOS%"
							 "UN ROLLO DE PAPEL DEL%"
							 "CULO DOBLE CAPA, QUE%"
							 "TE DEJA SUAVITO Y TE%"
							 "QUITA LA ZURRAPA.";

	unsigned char text23[] = "_BILBOS%"
							 "UN MOMENTO, PERO TU NO%"
							 "ERAS DE OTRO JUEGO?";

	unsigned char text24[] = "_SONIA%"
							 "NO SE, IGUAL SI. COMO%"
							 "LOS MOJON TWINS REUTI-%"
							 "LIZAN TANTO CODIGO SE%"
							 "LES HABRA PASADO QUI-%"
							 "TARME...";

	unsigned char text25[] = "_ANILLO%"
							 "SOY EL ANILLO MAGICO.%"
							 "METEME EL DEDO Y YO TE%"
							 "HARE INVISIBLE POR UN%"
							 "RATO!";

	unsigned char text26[] = "_ANILLO%"
							 "ME HAS DOMINADO. PULSA%"
							 "FIRE PARA PONERTEME!";

#endif

unsigned char *texts [] = {
	text0, text1, text2, text3, 			// Dwarves are unknown to bilbos
	text4, text5, text6, text7, 			// Gandalf - biblo talks
	text8, 									// Cave is open
	text9, 									// I am dwarf... write from p+13
	text10, 								// Moto seminueva
	text11, text12, text13, text14,
	text15, text16, text17, 				// Comecocos
	text18, 								// Thanks for the dwarves
	text19, text20, text21,					// Enanito speech
	text22, text23, text24,					// Sonia	
	text25, text26							// Anillo
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
	draw_text (4, rdb ? 5 : 6, ATTR_TEXTBOX, top_string);
	rdy = 7;

	while (1) {
		clear_temp_string ();
		if (rdy > 7 || rdb != 0) draw_text (4, rdy - 1, ATTR_TEXTBOX, temp_string);

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
		case 4:
			// Hide hotspot!
			if (gallumb_flag < 1) {
				set_map_tile (6, 4, 0, 0);
				hotspot_y = 240;
			}
			break;
		case 5:
			gp_gen = decos2; draw_decos (); break;
		case 17:
			// Sonia
			if (sonia_talk == 0) {
				set_map_tile (12, 3, 34, 8);
			}
			break;
		case 24:
			// Dwarf at the entrance to the mountain / closed door
			if (gandalf_talk == 2) {
				if (dwarf_talk == 0) {
					set_map_tile (9, 7, 17, 8);
				} else {
					set_map_tile (9, 9, 15, 8);
				}
			}
			break;
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
			ld  a, (_n_pant)
			ld  c, a
			ld  a, (_n_pant_was)
			ld  (_n_pant), a
			ld  a, c 
			sub 35
			ld  (_n_pant_was), a

			ld  a, (_xwas)
			ld  (_gpx), a
			call Ashl16_HL
			ld  (_player), hl

			ld  a, (_ywas)
			ld  (_gpy), a
			call Ashl16_HL
			ld  (_player + 2), hl
	#endasm

	// Now n_pant_was contains which comecocos screen just finished
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
		anillo_flag = 0;
		gallumb_flag = 0;

		dwarf_ct = rand () & 3;
		redraw_after_text = 1;
		draw_coloured_tile (19, 22, 0);		

		wyz_play_music (1);

		// Debug
		gandalf_talk = 3; dwarf_talk = 1; 
		n_pant = 4;
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		// Delayed text
		#asm
				ld  a, (_delayed_ct)
				or  a 
				jr  z, delayed_ct_dec_done
				dec a 
				ld  (_delayed_ct), a 
			.delayed_ct_dec_done

				cp  1
				jr  nz, delayed_text_done

				ld  a, (_tfn_b)
				ld  (_rdb), a 
				ld  a, (_tfn_a)
				ld  (_rda), a 
				call _show_text_box

			.delayed_text_done

		#endasm

		// Comecocos shit
		if (comecocos_on && player.coins == cocos_count) {
			back_from_comecocos_screen ();
			comecocos_on = 0;

			switch (n_pant_was) {
				case 0:
					wyz_play_music (2); 	// AYJO
					tfn_b = 46; tfn_a = 7;
					delayed_ct = 3;
					break;
				case 1:
					wyz_play_music (1); 	// NOMO
					tfn_b = 46; tfn_a = 8;
					delayed_ct = 3;
					break;
				case 2:
					wyz_play_music (3); 	// CAVE
					break;
				case 3:
					wyz_play_music (3); 	// CAVE
					tfn_b = 18; tfn_a = 26;
					delayed_ct = 3;
					break;
			}
		}

		// Interactions
		switch(n_pant) {
			case 0:
				// Gandalf
				_x = _y = 2 << 4; if (touch_tile ()) {
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

						if (gandalf_talk == 2) {
							rdb = 46; rda = 8; show_text_box ();
						}

						if (player.objs == 13 && gandalf_talk == 1) {
							rdb = 46; rda = 18; show_text_box ();
							gandalf_talk = 2;
							player.objs = 0;

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

			case 17:
				// Sonia
				if (sonia_talk == 0) {
					_x = 12 << 4; _y = 3 << 4; if (touch_tile ()) {
						if (interact_flag == 0) {
							interact_flag = 1;
							rdb = 47;
							rda = 22; show_text_box ();
							rda = 23; show_text_box ();
							rdb = 34;
							rda = 24; show_text_box ();

							// Fire up comecocos #2
							rda = 2;
							launch_comecocos_screen ();
							cocos_count = 65;
							sonia_talk = 1;
						}
					} else {
						interact_flag = 0;
					}
				}
				break;

			case 24:
				// Enano en la cueva
				if (dwarf_talk == 0) {
					gandalf_talk = 3;

					_x = 9 << 4; _y = 7 << 4; if (touch_tile ()) {
						if (interact_flag == 0) {
							interact_flag = 1;

							rdb = 46;
							rda = 19; show_text_box ();
							rda = 20; show_text_box ();							
							rda = 21; show_text_box ();							

							dwarf_talk = 1; 
							on_pant = 0xFF;

							wyz_play_music (3);		// Cave music
						}
					} else {
						interact_flag = 0;
					}
				}
				break;
		}

		// Anillo
		if (anillo_flag) {
			if (player.estado == 0) {
				#asm
						// if (player.estado == 0) 
						ld  a, (_player + 23) 			// player.estado
						or  a 
						jr  nz, anillo_done

						// if (player_estado != last_estado)

						ld  c, a 
						ld  a, (_last_estado)
						cp  c 
						jr  z, anillo_ct_check

						ld  a, 25
						ld  (_anillo_ct), a				// 1 sec cooldown	
						ld  hl, 3
						call _wyz_play_music			// Cave music	
				
						// Adjust to even 
		
						ld  a, (_gpx)
						and 0xfe
						ld  (_gpx), a
						call Ashl16_HL
						ld  (_player), hl

						ld  a, (_gpy)
						and 0xfe
						ld  (_gpy), a
						call Ashl16_HL
						ld  (_player + 2), hl

						jr  anillo_done

					.anillo_ct_check
						// if (anillo_ct < 0)
						ld  a, (_anillo_ct)
						or  a 
						jr  z, anillo_ct_zero

						// anillo_ct --;
						dec a 
						ld  (_anillo_ct), a
						jr  anillo_done

					.anillo_ct_zero
						// if ((pad_this_frame & sp_FIRE) == 0 && anillo_ct == 0) {
						ld  a, (_pad_this_frame)
						and sp_FIRE
						jr  nz, anillo_done

						ld  a, EST_PARP | EST_DIZZY
						ld  (_player + 23), a 			// player.estado
						ld  a, 190
						ld  (_player + 24), a 			// player.ct_estado

						ld hl, 4
						call _wyz_play_music
						ld hl, 8 
						call _play_sfx
					.anillo_done
				#endasm 
			}

		}

		// Use this to detect if player.estado changed last frame
		last_estado = player.estado;
	}

	void hook_entering (void) {	
		draw_cur_screen_decos ();	
	}

	void hook_hotspots (void) {
		switch (hotspot_t) {
			case 1:	
				// Hook for objects (dwarves)
				if (gandalf_talk == 0) {
					rda = dwarf_ct; rdb = 47; show_text_box ();
					dwarf_ct = (dwarf_ct + 1) & 3;

					// And invalidate hotspot
					hotspot_t = 0;
				} else {
					insert_dwarf_name ();
					rda = 9; rdb = 17; show_text_box ();
				}
				break;

			case 2:
				// Anillo
				anillo_flag = 1;
				draw_coloured_tile (19, 22, 18);
				rdb = 18; rda = 25; show_text_box ();

				// We'll be changing current n_pant from a
				// hotspot interaction so we have to do this
				// manually!
				hotspots [n_pant].act = 0;

				// Disable normal interaction 
				hotspot_t = 0;

				// Fire up comecocos #3
				rda = 3;
				launch_comecocos_screen ();
				cocos_count = 55;

				break;

			case 12:
				// Special mushroom for pacman stages
				if (player.estado == 0) {
					player.estado = EST_PARP;
					player.ct_estado = 150;
				}

				play_sfx (6);

				// Make permanent
				hotspot_t = 0;

				break;
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
		if(_en_t == 3) {
			// Custom collision with Gallumb
		}

		return 0;
	}
#endif
