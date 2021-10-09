// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Add here your custom routines & vars

// Two sets

unsigned char map_behaviours [] = {
	0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 1, 1,
	0, 0, 0, 1, 1, 1, 1,
	0, 1, 1, 1, 1, 1, 1
};

// Texts

unsigned char top_string []    = "<======================>";
unsigned char temp_string []   = ";                      [";
unsigned char room_name [] = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX";
unsigned char bottom_string [] = "\\]]]]]]]]]]]]]]]]]]]]]]^";
unsigned char redraw_after_text;
unsigned char intro_text;
unsigned char talk_sounds [] = { 7, 11 };

//                        XXXXXXXXXXXXXXXXXXXXXX
unsigned char text0 [] = "(DOTTY)%"
						 "HAY SETAS A RAUDALES!%"
						 "PERO PAPI, YA LO PETAS%"
						 "SI CON LAS NORMALES%"
						 "TRAES SETAS CON TETAS!";

unsigned char text1 [] = "(PEPI CARAORTIGA)%"
						 "SOY AMIGA DE TU HIJA,%"
						 "NO SOY NADA MOJIGATA.%"
						 "LUEGO, SI NO SE FIJA,%"
						 "TE VOY A DAR, PIRATA!";

unsigned char text2 [] = "(TAMARA LA TIA RARA)%"
						 "BUSCO NOVIO VERSADO%"
						 "EN TEMAS DEL QUERER%"
						 "ERES ALGO ESMIRRIADO%"
						 "PERO ME PUEDES VALER";

unsigned char text3 [] = "(RAMIRO EL VAMPIRO)%"
						 "YO ESTARIA INTERESADO%"
						 "EN BUSCAR UN CAMASTRO%"
						 "PERO ANDO MUY CANSADO%"
						 "Y TENGO UN PADRASTRO";

unsigned char text4 [] = "(ALBERTO EL TUERTO)%"
						 "TE MIRO SIN COMPLEJOS%"
						 "DESDE HACE UN RATITO%"
						 "NO SE SI ESTAS LEJOS%"
						 "O ERES MUY BAJITO.";

unsigned char text5 [] = "(RAMIRO EL VAMPIRO)%"
						 "PERDONA SI TE GRITO%"
						 "ESTO ES LO QUE HAY.%"
						 "AUNQUE YO SEA BAJITO%"
						 "TU TAMPOCO ERES ROMAY!";

unsigned char text6 [] = "(DONOSO EL SEBOSO)%"
						 "COMO HABRAS NOTADO%"
						 "SOY UN TIPO MUY FINO%"
						 "ME GUSTA COMER HELADO%"
						 "CUBIERTO DE TOCINO!";

unsigned char text7 [] = "(RAMIRO EL VAMPIRO)%"
						 "VAYA MEZCLA SIN PAR%"
						 "BAJA POR TUS CONDUCTOS%"
						 "NI ME QUIERO IMAGINAR%"
						 "EL OLOR DE TUS ERUCTOS";

unsigned char text8 [] = "(CAMILA LA WILA)%"
						 "ME GUSTA CAZAR VARONES%"
						 "COMO A BRUJAS Y MAGAS%"
						 "PERO NO HAGO POCIONES%"
						 "YO ME BAJO LAS BRAGAS";

unsigned char text9 [] = "(RAMIRO EL VAMPIRO)%"
						 "APARTA DE MI, SIRENA%"
						 "QUE ANDO DE MISION%"
						 "AY, VAYA UNA CONDENA%"
						 "SER VAMPIRO GUAPETON!";

unsigned char text10 [] = "(RAMIRO EL VAMPIRO)%"
						  "VAYA, EL BOSQUE MOLA%"
						  "PERO !AY, QUE OLVIDO!%"
						  "NO TRAEMOS MERENDOLA%"
						  "Y NO HEMOS COMIDO...";						  

unsigned char text11 [] = "(RAMIRO EL VAMPIRO)%"
						  "DOTTY ESTA COMO IDA%"
						  "EL HAMBRE LE PIERDE!%"
						  "SI NO TRAIGO COMIDA%"
						  "SEGURO QUE ME MUERDE!";

unsigned char text12 [] = "(RAMIRO EL VAMPIRO)%"
						  "YA TENGO SUFICIENTES%"
						  "CON TETAS O SIN TETAS%"
						  "SON ESTUPEFACIENTES%"
						  "Y LAS DEJAN MAJARETAS";

unsigned char text13 [] = "(DOTTY)%"
						  "AY, ERES EL MAS MEJOR%"
						  "UN PAPI AZUL CIELO%"
						  "CON CARITA DE ALFAJOR%"
						  "Y GRASITA POR EL PELO";

unsigned char text14 [] = "(RAMIRO EL VAMPIRO)%"
						  "COMEROS ESTAS SETAS,%"
						  "QUE NO SON TONTERIAS%"
						  "LO DICEN LAS RECETAS:%"
						  "DE LO QUE COMES,CRIAS";

unsigned char *texts [] = {
	text0, text1, 			// Dotty y Pepi Caraortiga
	text2, text3, 			// Tamara la tía rara
	text4, text5, 			// Alberto el tuerto
	text6, text7, 			// Donoso el seboso
	text8, text9, 			// Camila la Wila
	text10, text11,			// Intro
	text12, 				// Ya tienes todas
	text13, text14,			// Final
};


//                        		 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
unsigned char room_names [] = 	"    INTERESANTE DESCENSO    "
								"    LA CASITA DE AMADOR     "
								"  EL MIRADOR DE MIRAR CULOS "
								"      UN RECODO COMODO      "
								"  EL BARRANCO DEL TIO CANCO "
								"     EL CERRO DEL PERRO     "
								"     FIESTA DE PIJAMAS      "

								"     LA VERTICAL ANORMAL    "
								"   AQUI HUELE COMO A PIPI   "
								"    UN DESCENSO PELIGROSO   "
								"     NIDOS DE MONDRULLOS    "
								"    LA GRUTA DEL HIJOPUTA   "
								"    AFILADOS MONDADIENTES   "
								"  DESCENDIENDO MUY PROFUNDO "

								"     SE OYE UN MURMULLO     "
								"    EL POZO DEL ALBOROZO    "
								" EN EL TRONCO DUERMO Y RONCO"
								"     LA CRIPTA DE TAMARA    "
								"     TAMARA LA TIA RARA     "
								"   LA DISYUNTIVA NEGATIVA   "
								"    VENDO MOTO SEMINUEVA    "

								" HALLO ICH BIN'S DER FICHTL "
								"       CAMILA LA WILA       "
								"   UNA CRIPTA O UNA BODEGA  "
								"    LA CRIPTA DE ALBERTO    "
								"      ALBERTO EL TUERTO     "
								"      DONOSO EL SEBOSO      "
								"     LA CRIPTA DE DONOSO    ";

// Jumo

struct sp_SS *sp_jumo;
extern unsigned char sprite_jumo [];
#asm
		defb 0, 255 	
		defb 0, 255 	
		defb 0, 255 	
		defb 0, 255 	
		defb 0, 255 	
		defb 0, 255 	
		defb 0, 255 	
	._sprite_jumo
		BINARY "sprite_jumo.bin"
#endasm

unsigned char jumo_x, jumo_y, jumo_ct;

// Functions & protos

void enems_en_an_calc (unsigned char n);

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

	// TODO: Remove jumo
	
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
	draw_text (4, 6, 32+64, top_string);
	rdy = 7;

	while (1) {
		clear_temp_string ();
		if (rdy > 7) draw_text (4, rdy - 1, 32+64, temp_string);

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

		draw_text (4, rdy ++, 32+64, temp_string);
		draw_text (4, rdy ++, 32+64, bottom_string);

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
		sp_jumo = sp_CreateSpr (sp_MASK_SPRITE, 2, sprite_jumo, 3);
		sp_AddColSpr (sp_jumo, sprite_jumo + 32);
	}

	void hook_init_game (void) {
		intro_text = 1;
		player.possee = 0;
		scenery_info.evil_kills_slowly = 1;

		n_pant=14;
	}

	void hook_init_mainloop (void) {
		// Intro
		if (intro_text && n_pant == 6 && player.possee) {
			intro_text = 0;
			redraw_after_text = 1;
			show_text_box (10);
			show_text_box (11);
		}
	}

	void hook_mainloop (void) {
		if (player.killingzone_beepcount && jumo_ct == 0) {
			#asm
					ld  a, 16
					ld  (_jumo_ct), a
					ld  a, (_gpx)
					add 4
					ld  (_jumo_x), a
					ld  a, (_gpy)
					ld  (_jumo_y), a
			#endasm
		}

		if (jumo_ct) {
			#asm
					ld  hl, _jumo_y
					dec (hl)

					ld  hl, _jumo_ct
					dec (hl)
			#endasm

			sp_MoveSprAbs (
				sp_jumo, 
				spritesClip, 
				0, 
				VIEWPORT_Y + (jumo_y >> 3), VIEWPORT_X + (jumo_x >> 3), 
				jumo_x & 7, jumo_y & 7
			);

			if (jumo_y <= 16) jumo_ct = 0;
		} else {
			sp_MoveSprAbs (
				sp_jumo, 
				spritesClip, 
				0, 
				-2, -2, 0, 0
			);
		}

		if (latest_hotspot == 1 && player.objs == 15) {
			show_text_box (12);
		}		
	}

	void hook_entering (void) {	
		// Jumo off
		#asm
				xor a 
				ld  (_jumo_ct), a
		#endasm

		// Screen title
		gp_gen = room_names + (n_pant * 28);
		#asm
				ld  hl, (_gp_gen)
				ld  de, _room_name
				ld  bc, 28
				ldir
		#endasm
		draw_text (2, 22, 32+64, room_name);		
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		
		if (n_pant == 21) {
			if (_en_t == 1) 
				enems_en_an_calc (6); 
			else
				enems_en_an_calc (_en_t - 10);
		}

	}

	void extra_enems_move (void) {	
		switch (_en_t) {
			case 14:

				break;
			case 15:
				break;
		}		
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}
	
#endif
