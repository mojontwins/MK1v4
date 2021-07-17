// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Add here your custom routines & vars

// Custom routines for Ramiro 4

// bit 0 = which set.
// bit 1 = killing eye.
// bit 2 = trap!
// bit 3 = trap but with coins
unsigned char map_behaviours [] = {
	 0,  0,  0,  5,  0,  0, 
	 0,  0,  0,  3,  1,  1,
	 0,  0,  3,  3,  5,  1,
	13,  1,  1,  3,  3,  1,
	13,  1,  3,  1,  1,  1,
	 0,  1,  1,  1,  1,  1
}; 

// Jumo
#define SP_JUMO (SP_CUSTOM_BASE + 1)
extern unsigned char sprites_jumo [0];
#asm
	._sprite_jumo
		BINARY "sprites_jumo.bin"
#endasm

unsigned char jumo_x, jumo_y, jumo_ct;

// Evil eye things

#define EYE_X VIEWPORT_X+7*2
#define EYE_Y VIEWPORT_Y+2*2

unsigned char evil_eye_state;
unsigned char evil_eye_counter;

unsigned char evil_eye_state_cts [] = { 30, 30, 60, 5, 5 };
unsigned char evil_eye_state_tiles [] = { 29, 30, 31, 30, 29 };

unsigned char evil_eye_screen;

// Blocks trap

#define MAX_TRAP_BLOCKS	3
#define TRAP_CHANCE 	7 		// Power of two minus one!
#define BLOCK_HIT 		5

unsigned char trap_active;
unsigned char trap_bx [MAX_TRAP_BLOCKS];
unsigned char trap_by [MAX_TRAP_BLOCKS];
unsigned char trap_bt [MAX_TRAP_BLOCKS];

unsigned char trap_screen;
unsigned char trap_coins;
unsigned char _trap_bx;
unsigned char _trap_by;
unsigned char _trap_bt;

// Coins trap extra stuff

#define C_COINS_X 		9 		// Coins count character coordinates
#define C_COINS_Y		23
#define TRAP_COINS_MAX	30

// Carrying an object

#define SP_INV SP_CUSTOM_BASE

extern unsigned char *object_cells [0];
#asm
		._object_cells
			defw _sprite_18_a, SPRITE_10, SPRITE_11, SPRITE_12, SPRITE_13, SPRITE_14
#endasm
unsigned char pinv;
unsigned char *pinv_next_frame;

// Offers

#define OFRENDAS_X 		15
#define OFRENDAS_Y 		23
unsigned char pofrendas, pofrendas_old; 
unsigned char ofrendas_order [] = { 1, 2, 3, 4 };
unsigned char ofrendas_idx;

// Water trap

#define WATER_PERIOD 22
unsigned char water_level;
unsigned char water_ct;
unsigned char water_locks;
unsigned char water_top_door_x;

unsigned char water_pushplates [] = { 0, 0x26, 0x4D, 0x57, 0x79 };

// Score 

#define PSCORE flags[16]

#define SCORE_OPEN_PYRAMID 		5
#define SCORE_CHARACTER_TALK 	2
#define SCORE_OPEN_CRYPT 		2
#define SCORE_WIN_CRYPT 		5
#define SCORE_RAMON_EYE 		5
#define SCORE_RAMON_WATER 		5
#define SCORE_GET_COIN 			5
#define SCORE_GET_OBJECT 		5
#define SCORE_FALSE_OBJECT 		4
#define SCORE_FALSE_INTERACTION	4

#define SCORE_X 		28
#define SCORE_Y 		23

unsigned char opscore;

// Texts

unsigned char top_string []    = "<======================>";
unsigned char temp_string []   = ";                      [";
unsigned char bottom_string [] = "\\]]]]]]]]]]]]]]]]]]]]]]?";
unsigned char redraw_after_text;
unsigned char intro_text;
unsigned char talk_sounds [] = { 7, 11 };

#ifdef LANG_EN
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "VISITOR, LOOK AT ME,%"
							 "I AM THE MIGHTY SHRINE%"
							 "I'LL GIVE YOU THINGS%"
							 "IF YOU BRING ME A DIME";

	unsigned char text1 [] = "A ROLL OF TOILET PAPER%"
							 "IT'S NONE THE COARSE%"
							 "MAKES YOU FEEL BETTER%"
							 "AND CLEANS YOU ARSE%";

	unsigned char text2 [] = "I GIVE YOU THIS FLUTE%"
							 "IF YOU PLAY IT FAST%"
							 "IT'LL MAKE YOU MUTE%"
							 "YOU'LL SLEEP AT LAST%";

	unsigned char text3 [] = "WHAT CAN I DO?%"
							 "PLEASE DO NO WRONG%"
							 "I'M TRUSTING YOU!%"
							 "I GIVE YOU A THONG%";

	unsigned char text4 [] = "GREASE FOR LEATHER%"
							 "MAKES IT ALL SHINY%"
							 "DESPITHE THE WEATHER%"
							 "YOU WILL LUCK SWINEY";

	unsigned char text5 [] = "GET LOST!%"
							 "I DON'T NEED THIS%"
							 "RUBBISH, COCKALORUM!";

	unsigned char text6 [] = "WHAT'S THIS?%"
							 "TAKE IT AWAY,%"
							 "CUMDUMPSTER!";

	unsigned char text7 [] = "C'MON, DON'T BE A%"
							 "PILLOCK! I DON'T NEED%"
							 "THIS CRAP!";

	unsigned char text8 [] = "AND AM I SUPPOSED TO%"
							 "WANT THIS, SNOLLY-%"
							 "GOSTER?";

	unsigned char text9 [] = "I ATE TOO MUCH CANDY%"
							 "TO FILL THIS BUMP%"
							 "I ALSO DRANK BRANDY%"
							 "NOW I NEED A DUMP.";

	unsigned char text10 [] = "AUNQUE SEA DENOCHES%"
							  "NO CONSIGO DORMIR.%"
							  "TENGO MUCHO INSOMNIO%"
							  "ESTO ES UN SINVIVIR";

	unsigned char text11 [] = "QUE DESPISTE TENGO%"
							  "AYER FUI LO PEOR. ME%"
							  "DESMADRE EN UN CUMPLE%"
							  "Y PERDI LA ROPA%"
							  "INTERIOR.";

	unsigned char text12 [] = "ESTOY SIN RECATO%"
							  "A SU SERVICIO.%"
							  "TRABAJO MUY BARATO%"
							  "PERO EL CUERO ES MI%"
							  "VICIO...";

	unsigned char text13 [] = "RECUPERA LOS CUATRO%"
							  "TROZOS DEL PAPIRO%"
							  "Y VUELVE AQUI PARA%"
							  "HACER EL HECHIZO";

	unsigned char text14 [] = "VAYA INSISTENCIA, TE%"
							  "ABRO MI PIRAMIDE,%"
							  "MONTUNO! QUE CASI PA-%"
							  "RECES EL REY DE LOS%"
							  "HUNOS!";

	unsigned char text15 [] = "LO CONSIGUIO AL FIN!%"
							  "ENSAMBLADO EL PAPIRO%"
							  "SE DISPONE A LEER EL%"
							  "CONJURO NUESTRO BUEN%"
							  "RAMIRO.";

	unsigned char text16 [] = "DICE ASI:%"
							  "- 2 CEBOLLAS%"
							  "- PAPEL DEL CULO%"
							  "- PAN%"
							  "- FAIRY";

	unsigned char text17 [] = "EL POBRE VAMPIRO SE%"
							  "QUEDA CON CARA MONA:%"
							  "NO ES UN CONJURO,%"
							  "ES LA LISTA DEL%"
							  "MERCADONA.";

	unsigned char text18 [] = "YA QUE ME TRAES UNA%"
							  "OFRENDA, YO SOLTARE%"
							  "PRENDA...";

	unsigned char text19 [] = "YA TIENES UN OBJETO!%"
							  "USALO ANTES, CATETO.";

	unsigned char text20 [] = "Y YA TE ABRI. AHORA%"
							  "JUYE... JUYE!!";

	unsigned char text21 [] = "OH, QUE SUAVE ES!%"
							  "Y AHORA, PORFA, VETE%"
							  "QUE HARE CACA Y ME%"
							  "LIMPIARE EL OJETE";

	unsigned char text22 [] = "UNA FLAUTA DE FAKIR!%"
							  "CON FEO SU SONIDO%"
							  "EN SOLO UNOS MITUTOS%"
							  "YA ESTARE DORMIDO";

	unsigned char text23 [] = "OH, GUAPO VAMPIRILLO,%"
							  "RECIBO CON ALBOROTO%"
							  "TU BELLO REGALO: UNAS%"
							  "BRAGAS PA MI TOTO";

	unsigned char text24 [] = "QUE LUSTROSO QUEDARA%"
							  "EL CUERO DE MI ARNES%"
							  "IRE VISITAR A MARISA%"
							  "A CHUPARLE LOS PIES";

	unsigned char text25 [] = "SI SACAS LA MONEDA%"
							  "ENFADARAS A HORUS!%"
							  "YA SOLO TE QUEDA%"
							  "RASCARLE LOS OJUS!";

	unsigned char text26 [] = "SOY SONIA LA MOMIA%"
							  "GUARDIANA DE LA%"
							  "TERCERA CRIPTA";

	unsigned char text27 [] = "SOY CLEMENTE LA%"
							  "SERPIENTE,%"
							  "GUARDIAN DE LA%"
							  "CUARTA CRIPTA";

	unsigned char text28 [] = "SOY MARISA LA%"
							  "SACERDOTISA,%"
							  "GUARDIANA DE LA%"
							  "SEGUNDA CRIPTA";

	unsigned char text29 [] = "SOY GUSTAVO EL%"
							  "ESCLAVO,%"
							  "GUARDIAN DE LA%"
							  "PRIMERA CRIPTA";

	unsigned char text30 [] = "LOS TROZOS ESTAN%"
							  "EN CRIPTAS CERRADAS,%"
							  "TENDRAS QUE COMPLACER%"
							  "A SUS GUARDIANES";

	unsigned char text31 [] = "\"TE PILLE, LORITO!\",%"
							  "OYES A ALGUIEN GRITAR%"
							  "\"NO PIERDAS TU PORTE%"
							  "Y VUELVE A EMPEZAR!\"";

	unsigned char text32 [] = "CUIDADO CON EL OJO!%"
							  "SE HACE LA DORMIDA%"
							  "PERO SI TE VE%"
							  "TE CHUPA LA VIDA!";

	unsigned char text33 [] = "RAMON EL FARAON,%"
							  "TE INVITO A SU KELI%"
							  "Y ENTRE VINOS Y HUMO%"
							  "TE CONTO SU PELI...";

	unsigned char text34 [] = "SI JUNTAS 4 PARTES%"
							  "EL PODEWR DEL PAPIRO%"
							  "OCULTO EN ESTE SITIO%"
							  "SERA TUYO, RAMIRO";

	unsigned char text35 [] = "BUSCA A RAMON Y QUE%"
							  "CON SU ABRACADABRA%"
							  "NO SE HAGA EL REMOLON%"
							  "Y LA PIRAMIDE TE ABRA";

	unsigned char text36 [] = "ESTE ES EL ALTAR ROTO%"
							  "QUE NO TE DISCRIMINA%"
							  "Y SI LE TOCAS EL TOTO%"
							  "TE DA PAPEL DE COCINA";

	unsigned char text37 [] = "WHAT ARE YOU THINKING%"
							  "YOU GODDAMNED NUT!%"
							  "SUCH A ROUGH PAPER%"
							  "WOULD SAND MY BUTT!";

	unsigned char text38 [] = "EL ALTAR NO CONTESTA";

	unsigned char text39 [] = "NO HE VISTO NI POR%"
							  "DONDE VENIAN,%"
							  "JA JA JA JA JA%"
							  "... CABRONI!";
#else
	//                        XXXXXXXXXXXXXXXXXXXXXX
	unsigned char text0 [] = "POR OSIRIS Y POR APIS%"
							 "MIRADME BIEN: SOY EL%"
							 "ALTAR DE LAS OFRENDAS.%"
							 "TE DARE COSAS SI TRAES%"
							 "MONEDAS AL MENDA.";

	unsigned char text1 [] = "UN ROLLO DE PAPEL DEL%"
							 "CULO DOBLE CAPA, QUE%"
							 "TE DEJA SUAVITO Y TE%"
							 "QUITA LA ZURRAPA.";				 

	unsigned char text2 [] = "UNA FLAUTA DE FAKIR%"
							 "IMPORTADA DE ORIENTE%"
							 "QUE TE DUERME CON SU%"
							 "MUSICA O SI TE DA EN%"
							 "LOS DIENTES.";

	unsigned char text3 [] = "TE SACO DEL TIRON%"
							 "UNAS BRAGAS PRINCESA%"
							 "ROBADAS DE UN CAJON%"
							 "DE LA LETIZIA ESA.";

	unsigned char text4 [] = "UN TARRO DE GRASA DE%"
							 "CABALLO. PARA QUE%"
							 "QUERRIAS ESTO? LOCO%"
							 "ME HALLO.";

	unsigned char text5 [] = "TES KI YA CARAJAULA,%"
							 "LLEVATE ESO!";

	unsigned char text6 [] = "Y ESTO QUE ES? BEBE-%"
							 "CHARCOS, ESCUCHAPEOS";

	unsigned char text7 [] = "PARA QUE QUIERO ESTO,%"
							 "BOQUIMUELLE?";

	unsigned char text8 [] = "PERO QUE ME TRAES?%"
							 "BOTARATE TALLOCEBOLLA!";

	unsigned char text9 [] = "Y AY, QUE POCAS LUCES%"
							 "ME DUELE LA PETACA.%"
							 "COMI MUCHAS CHUCHES%"
							 "Y ME HAGO MUCHA CACA.";

	unsigned char text10 [] = "AUNQUE SEA DENOCHES%"
							  "NO CONSIGO DORMIR.%"
							  "TENGO MUCHO INSOMNIO%"
							  "ESTO ES UN SINVIVIR";

	unsigned char text11 [] = "QUE DESPISTE TENGO%"
							  "AYER FUI LO PEOR. ME%"
							  "DESMADRE EN UN CUMPLE%"
							  "Y PERDI LA ROPA%"
							  "INTERIOR.";

	unsigned char text12 [] = "ESTOY SIN RECATO%"
							  "A SU SERVICIO.%"
							  "TRABAJO MUY BARATO%"
							  "PERO EL CUERO ES MI%"
							  "VICIO...";

	unsigned char text13 [] = "RECUPERA LOS CUATRO%"
							  "TROZOS DEL PAPIRO%"
							  "Y VUELVE AQUI PARA%"
							  "HACER EL HECHIZO";

	unsigned char text14 [] = "VAYA INSISTENCIA, TE%"
							  "ABRO MI PIRAMIDE,%"
							  "MONTUNO! QUE CASI PA-%"
							  "RECES EL REY DE LOS%"
							  "HUNOS!";

	unsigned char text15 [] = "LO CONSIGUIO AL FIN!%"
							  "ENSAMBLADO EL PAPIRO%"
							  "SE DISPONE A LEER EL%"
							  "CONJURO NUESTRO BUEN%"
							  "RAMIRO.";

	unsigned char text16 [] = "DICE ASI:%"
							  "- 2 CEBOLLAS%"
							  "- PAPEL DEL CULO%"
							  "- PAN%"
							  "- FAIRY";

	unsigned char text17 [] = "EL POBRE VAMPIRO SE%"
							  "QUEDA CON CARA MONA:%"
							  "NO ES UN CONJURO,%"
							  "ES LA LISTA DEL%"
							  "MERCADONA.";

	unsigned char text18 [] = "YA QUE ME TRAES UNA%"
							  "OFRENDA, YO SOLTARE%"
							  "PRENDA...";

	unsigned char text19 [] = "YA TIENES UN OBJETO!%"
							  "USALO ANTES, CATETO.";

	unsigned char text20 [] = "Y YA TE ABRI. AHORA%"
							  "JUYE... JUYE!!";

	unsigned char text21 [] = "OH, QUE SUAVE ES!%"
							  "Y AHORA, PORFA, VETE%"
							  "QUE HARE CACA Y ME%"
							  "LIMPIARE EL OJETE";

	unsigned char text22 [] = "UNA FLAUTA DE FAKIR!%"
							  "CON FEO SU SONIDO%"
							  "EN SOLO UNOS MITUTOS%"
							  "YA ESTARE DORMIDO";

	unsigned char text23 [] = "OH, GUAPO VAMPIRILLO,%"
							  "RECIBO CON ALBOROTO%"
							  "TU BELLO REGALO: UNAS%"
							  "BRAGAS PA MI TOTO";

	unsigned char text24 [] = "QUE LUSTROSO QUEDARA%"
							  "EL CUERO DE MI ARNES%"
							  "IRE VISITAR A MARISA%"
							  "A CHUPARLE LOS PIES";

	unsigned char text25 [] = "SI SACAS LA MONEDA%"
							  "ENFADARAS A HORUS!%"
							  "YA SOLO TE QUEDA%"
							  "RASCARLE LOS OJUS!";

	unsigned char text26 [] = "SOY SONIA LA MOMIA%"
							  "GUARDIANA DE LA%"
							  "TERCERA CRIPTA";

	unsigned char text27 [] = "SOY CLEMENTE LA%"
							  "SERPIENTE,%"
							  "GUARDIAN DE LA%"
							  "CUARTA CRIPTA";

	unsigned char text28 [] = "SOY MARISA LA%"
							  "SACERDOTISA,%"
							  "GUARDIANA DE LA%"
							  "SEGUNDA CRIPTA";

	unsigned char text29 [] = "SOY GUSTAVO EL%"
							  "ESCLAVO,%"
							  "GUARDIAN DE LA%"
							  "PRIMERA CRIPTA";

	unsigned char text30 [] = "LOS TROZOS ESTAN%"
							  "EN CRIPTAS CERRADAS,%"
							  "TENDRAS QUE COMPLACER%"
							  "A SUS GUARDIANES";

	unsigned char text31 [] = "\"TE PILLE, LORITO!\",%"
							  "OYES A ALGUIEN GRITAR%"
							  "\"NO PIERDAS TU PORTE%"
							  "Y VUELVE A EMPEZAR!\"";

	unsigned char text32 [] = "CUIDADO CON EL OJO!%"
							  "SE HACE LA DORMIDA%"
							  "PERO SI TE VE%"
							  "TE CHUPA LA VIDA!";

	unsigned char text33 [] = "RAMON EL FARAON,%"
							  "TE INVITO A SU KELI%"
							  "Y ENTRE VINOS Y HUMO%"
							  "TE CONTO SU PELI...";

	unsigned char text34 [] = "SI JUNTAS 4 PARTES%"
							  "EL PODEWR DEL PAPIRO%"
							  "OCULTO EN ESTE SITIO%"
							  "SERA TUYO, RAMIRO";

	unsigned char text35 [] = "BUSCA A RAMON Y QUE%"
							  "CON SU ABRACADABRA%"
							  "NO SE HAGA EL REMOLON%"
							  "Y LA PIRAMIDE TE ABRA";

	unsigned char text36 [] = "ESTE ES EL ALTAR ROTO%"
							  "QUE NO TE DISCRIMINA%"
							  "Y SI LE TOCAS EL TOTO%"
							  "TE DA PAPEL DE COCINA";

	unsigned char text37 [] = "QUE HACES, ALOCADO?%"
							  "ESE PAPEL DE COCINA%"
							  "A MI CULO DELICADO%"
							  "LO HARIA FOSFATINA!";

	unsigned char text38 [] = "EL ALTAR NO CONTESTA";

	unsigned char text39 [] = "NO HE VISTO NI POR%"
							  "DONDE VENIAN,%"
							  "JA JA JA JA JA%"
							  "... CABRONI!";
#endif

unsigned char *texts [] = {
	text0, 								// Bienvenida altar
	text1, text2, text3, text4, 		// Altar describe objetos
	text5, text6, text7, text8, 		// Guardianes mosqueados
	text9, text10, text11, text12, 		// Presentación guardianes
	text13, 							// Puedes pasar
	text14, 							// Ramón el faraón
	text15, text16, text17,				// Final
	text18, text19,						// Más mensajes del altar
	text20, 							// Ya te abrí.
	text21, text22, text23, text24,		// Gracias por el objeto
	text25,								// Cisterna
	text26, text27, text28, text29, 	// Guardian de...
	text30,								// Tendras que complacer
	text31,								// Te pillé!
	text32, 							// Advertencia Ramón
	text33, text34, text35, 			// Intro
	text36, text37, text38,				// Troleo papel de cocina
	text39 								// Cabroni
};

// Admiration signs (!)
// Coordiantes are screen-absolute, precalculated.
#define MAX_ADMIRATION_SIGNS 9
unsigned char adm_s_n_pant [] = {  0,  2,  5,  6, 10, 13, 14, 19, 25};
unsigned char adm_s_x [] =      {  6, 20, 22,  8, 16, 20,  6,  6,  6};
unsigned char adm_s_y [] =      { 12, 14, 16, 12, 10, 16, 16,  4,  4};

// Cabroni
unsigned char cabroni;

// Aux. functions

void clear_gamearea (void) {
	// TODO
}

void paint_water_strip (void) {
	// Paints a strip of character rda at rdy
	#asm
			ld  a, (_rdy)
			cp  VIEWPORT_Y+20
			ret nc 						// Do not paint if rdy >= 20.

			ld  (__y), a
			ld  a, VIEWPORT_X+2
			ld  (__x), a

			call __tile_address	; DE = buffer address

			// Write 26 chars
			ld  b, 26
			ld  a, (_rdi) 				// Which char

		.paint_water_strip_loop
			ld  (de), a
			inc de
			djnz paint_water_strip_loop

			// Now, invalidate
			ld  a, (_rdy)
			ld  b, a 				; x1
			ld  d, a 				; x2
			ld  c, VIEWPORT_X+2 	; y1
			ld  e, VIEWPORT_X+27 	; y2
			call cpc_InvalidateRect
	#endasm
}

void draw_falling_block (void) {
	//draw_coloured_tile (VIEWPORT_X + (_trap_bx << 1), VIEWPORT_Y + (_trap_by << 1), _trap_bt);
	
	#asm
			ld  a, (__trap_bx)
			sla a
			add VIEWPORT_X
			ld  (__x), a

			ld  a, (__trap_by)
			sla a
			add VIEWPORT_Y
			ld  (__y), a
		
			ld  a, (__trap_bt)
			ld  (__t), a

			jp _draw_coloured_tile_do	
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
			ld  c, a
			ld  a, (_tileoffset)
			add c

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

void decorate_screen (void) {
	// Admiration (!)
	
	for (rdi = 0; rdi < MAX_ADMIRATION_SIGNS; rdi ++) {			
		if (adm_s_n_pant [rdi] == n_pant) {
			draw_coloured_tile (adm_s_x [rdi], adm_s_y [rdi], 49);
			break;
		}
	}

	// Paint evil eye
	if (evil_eye_screen) {
		draw_coloured_tile (EYE_X-2, EYE_Y, 28);
		draw_coloured_tile (EYE_X, EYE_Y, 29);
	}
}

void show_text_box (unsigned char n) {
	//sprite_remove_aid ();

	gp_gen = texts [n];

	// Text renderer will read the string and
	// build substrings for draw_text.

	//clear_temp_string ();
	draw_text (4, 6, 40, top_string);
	rdy = 7;

	while (1) {
		clear_temp_string ();
		if (rdy > 7) draw_text (4, rdy - 1, 40, temp_string);
		
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

		draw_text (4, rdy ++, 40, temp_string);
		draw_text (4, rdy ++, 40, bottom_string);

		cpc_UpdateNow (0); 	// Update, no sprites
		play_sfx (talk_sounds [rand () & 1]);
		
		#asm
				ld  b, #(20*6)
			.textbox_delay
				halt
				djnz textbox_delay
		#endasm
	
		if (*gp_gen == 0) break;
		gp_gen ++;
	}

	while (any_key ()); while (!any_key ()); 
	if (redraw_after_text) {
		redraw_from_buffer ();
		hotspot_paint ();
		render_all_sprites ();
		cpc_UpdateNow (1);
	}
	redraw_after_text = 1;
}

void recuadrius (void) {	
	//sprite_remove_aid ();			
	for (rdi = 0; rdi < 10; rdi ++) {
		for (rdx = rdi; rdx < 30 - rdi; rdx ++) {
			#asm
					// sp_PrintAtInv (VIEWPORT_Y + rdi, VIEWPORT_X + rdx, 71, 0);
					ld  a, (_rdi)
					add VIEWPORT_Y
					ld  (__y), a
					ld  a, (_rdx)
					add VIEWPORT_X
					ld  (__x), a
					call __tile_address	; DE = buffer address
					xor a
					ld  (de), a
					ld  a, (__x)
					ld  e, a
					ld  a, (__y)
					ld  d, a
					call cpc_UpdTileTable
				
					// sp_PrintAtInv (VIEWPORT_Y + 19 - rdi, VIEWPORT_X + rdx, 71, 0);
					ld  a, (_rdi)
					ld  c, a
					ld  a, #(VIEWPORT_Y+19)
					sub c
					ld  (__y), a
					ld  a, (_rdx)
					add VIEWPORT_X
					ld  (__x), a
					call __tile_address	; DE = buffer address
					xor a
					ld  (de), a
					ld  a, (__x)
					ld  e, a
					ld  a, (__y)
					ld  d, a
					call cpc_UpdTileTable
			#endasm

			if (rdx < 19 - rdi) {
				#asm
						// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + rdi, 71, 0);
						ld  a, (_rdx)
						add VIEWPORT_Y
						ld  (__y), a
						ld  a, (_rdi)
						add VIEWPORT_X
						ld  (__x), a
						call __tile_address	; DE = buffer address
						xor a
						ld  (de), a
						ld  a, (__x)
						ld  e, a
						ld  a, (__y)
						ld  d, a
						call cpc_UpdTileTable

						// sp_PrintAtInv (VIEWPORT_Y + rdx, VIEWPORT_X + 29 - rdi, 71, 0);
						ld  a, (_rdx)
						add VIEWPORT_Y
						ld  (__y), a
						ld  a, (_rdi)
						ld  c, a
						ld  a, #(VIEWPORT_X+29)
						sub c						
						ld  (__x), a
						call __tile_address	; DE = buffer address
						xor a
						ld  (de), a
						ld  a, (__x)
						ld  e, a
						ld  a, (__y)
						ld  d, a
						call cpc_UpdTileTable
				#endasm
			}
		}
		
		cpc_UpdateNow (0);
	}
}

void trap_kill (void) {
	cpc_UpdateNow (1);
	play_sfx (10);

	#asm
			ld  b, 255
		.trap_kill_delay
			halt
			djnz trap_kill_delay
	#endasm
	
	// TODO // if (is128k) arkos_play_music (5);
	show_text_box (31);
	cpc_UpdateNow (0);
	
	//player.life -= BLOCK_HIT; 
	player.estado = EST_PARP;
	player.ct_estado = 50;
	player.vy = 0;
	recuadrius ();
}

void water_trap_setup (void) {
	rdi = n_pant / 6;

	// Paint top
	if (rdi > 0) {
		water_top_door_x = (rdi & 1) ? 11 : 2;
		set_map_tile (water_top_door_x, 0, 6, 8);
		set_map_tile (water_top_door_x + 1, 0, 7, 8);

		rdx = water_pushplates [rdi];
		set_map_tile (rdx >> 4, 0, 19, 8);
		set_map_tile (rdx & 15, 0, 19, 8);
	}

	// Paint bottom 
	if (rdi < 4) {
		rdx = (rdi & 1) ? 2 : 11;
		set_map_tile (rdx, 9, 46, 4);
		set_map_tile (rdx + 1, 9, 46, 4);
	}

	water_locks = 0;
}

void win_crypt (void) {
	// TODO // if (is128k) arkos_play_music (1);
	PSCORE += SCORE_WIN_CRYPT;
	player.life += 10;
}

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
		
		// Create a custom 4x8 sprite for inventory
		// 0   2   4      6   7   8  9  10 11 12      14
		// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc
		#asm
				ld  ix, #(BASE_SPRITES+(SP_INV*16))

				ld  hl, _sprite_18_a 					// Empty sprite
				ld  (ix + 1), h
				ld  (ix + 0), l

				ld  (ix + 3), h
				ld  (ix + 2), l	
				
				xor a
				ld  (ix + 6), a 		// .cox
				ld  (ix + 7), a 		// .coy
				ld  a, 32
				ld  (ix + 8), a 		// .cx
				ld  (ix + 9), a 		// .cy
				ld  (ix + 10), a 		// .ox
				ld  (ix + 11), a 		// .oy

				ld  hl, cpc_PutSpTileMap8x16Px			// .invfunc
				ld  (ix + 13), h
				ld  (ix + 12), l

				ld  hl, cpc_PutTrSp8x16TileMap2bPx 		// .updfunc
				ld  (ix + 15), h
				ld  (ix + 14), l
		#endasm

		// Create a custom 4x8 sprite for jumos
		// 0   2   4      6   7   8  9  10 11 12      14
		// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc
		#asm
				ld  ix, #(BASE_SPRITES+(SP_JUMO*16))

				ld  hl, _sprite_18_a 					// sm_sprptr [0]
				ld  (ix + 1), h
				ld  (ix + 0), l

				ld  (ix + 3), h
				ld  (ix + 2), l	
				
				xor a
				ld  (ix + 6), a 		// .cox
				ld  (ix + 7), a 		// .coy
				ld  a, 32
				ld  (ix + 8), a 		// .cx
				ld  (ix + 9), a 		// .cy
				ld  (ix + 10), a 		// .ox
				ld  (ix + 11), a 		// .oy

				ld  hl, cpc_PutSpTileMap4x8Px			// .invfunc
				ld  (ix + 13), h
				ld  (ix + 12), l

				ld  hl, cpc_PutTrSp4x8TileMap2bPx 		// .updfunc
				ld  (ix + 15), h
				ld  (ix + 14), l
		#endasm
		
	}

	void hook_init_game (void) {
		/*
		water_level = 0; 
		pinv = 0;
		ofrendas_idx = 0;
		pofrendas = 0;
		pofrendas_old = 0xff;
		opscore = 0xff;
		n_pant=0x12;
		*/

		#asm
				xor a
				ld  (_water_level), a
				ld  (_pinv), a 
				ld  (_ofrendas_idx), a 
				ld  (_pofrendas), a 
				ld  (_cabroni), a
				dec a 
				ld  (_pofrendas_old), a 
				ld  (_opscore), a
		#endasm

		PSCORE = 0;
		
		/*
		gpx = 160; player.x = 160<<6;
		pinv = 4; pinv_next_frame = object_cells [pinv];
		n_pant = 13;	
		flags [6] = 1;
		*/

		#asm
				ld b, 8
				ld a, r 
				ld (_seed), a

			.shuffle_loop
				push bc
				call _rand
				pop  bc
				ld  a, l
				and 3
				ld  c, a
				push bc
				call _rand
				pop  bc
				ld  a, l
				and 3
				ld  d, 0
				ld  e, a
				ld  hl, _ofrendas_order
				add hl, de
				ld  a, (hl)
				ld  (_rdi), a
				ld  e, c
				push hl
				ld  hl, _ofrendas_order
				add hl, de
				ld  a, (hl)
				pop hl
				ld  (hl), a
				ld  a, (_rdi)
				ld  hl, _ofrendas_order
				add hl, de
				ld  (hl), a
				
				djnz shuffle_loop
		#endasm		
	}

	void hook_init_mainloop (void) {
	}

	void hook_mainloop (void) {
		if (player.life > 99) player.life = 99;

		// Eye of horus

		/*
		if (evil_eye_screen) {
			if (evil_eye_counter) {
				evil_eye_counter --;
			} else {
				evil_eye_state ++; if (evil_eye_state == 5) evil_eye_state = 0;
				evil_eye_counter = evil_eye_state_cts [evil_eye_state];
				draw_coloured_tile (EYE_X, EYE_Y, evil_eye_state_tiles [evil_eye_state]);
				scenery_info.evil_zone_active = (evil_eye_state == 2);
			}
		}
		*/

		#asm
				ld  a, (_evil_eye_screen)
				or  a
				jr  z, eoh_done

				ld  a, (_evil_eye_counter)
				or  a
				jr  z, eoh_counter_done

				dec a
				ld  (_evil_eye_counter), a
				jr  eoh_done

			.eoh_counter_done
				// evil_eye_state ++; if (evil_eye_state == 5) evil_eye_state = 0;

				ld  a, (_evil_eye_state)
				inc a
				cp  5
				jr  nz, eoh_reset_state_done

				xor a
			.eoh_reset_state_done
				ld  (_evil_eye_state), a

				// evil_eye_counter = evil_eye_state_cts [evil_eye_state];

				ld  c, a
				ld  b, 0
				ld  hl, _evil_eye_state_cts
				add hl, bc
				ld  a, (hl)
				ld  (_evil_eye_counter), a

				// draw_coloured_tile (EYE_X, EYE_Y, evil_eye_state_tiles [evil_eye_state]);
				ld  a, EYE_X
				ld  (__x), a
				ld  a, EYE_Y
				ld  (__y), a
				ld  bc, (_evil_eye_state)
				ld  b, 0
				ld  hl, _evil_eye_state_tiles
				add hl, bc
				ld  a, (hl)
				ld  (__t), a
				call _draw_coloured_tile_do

				ld  a, (_evil_eye_state)
				cp  2
				jr  z, eoh_ez_set1

				xor a
				jr  eoh_ez_set

			.eoh_ez_set1
				ld  a, 1

			.eoh_ez_set
				ld  (_scenery_info+2), a 		// scenery_info.evil_zone_active

			.eoh_done
		#endasm		

		cpc_Border ((scenery_info.evil_zone_active & half_life) ? 0x4c : 0x54);

		// Block trap

		// To make trap active, we detect the player got a new obj.
		if (trap_screen && player.objs != objs_old) {
			// TODO // if (is128k) arkos_stop_sound ();
			flags [10 + flags [15]] = 1;
			trap_active = 1;
			seed = n_pant + 1;
			//player.life += BLOCK_HIT;
			scenery_info.allow_type_6 = 1;
			flags [COIN_FLAG] = 0;
			#asm
					ld  hl, _trap_by
					ld  de, _trap_by + 1
					ld  bc, MAX_TRAP_BLOCKS - 1
					ld  a, 0xff
					ld  (hl), a
					ldir
			#endasm
			if (trap_coins) {
				set_map_tile (13, 5, 0, 0);
				//cpc_UpdateNow (1);
				play_sfx (10);
			}
			// TODO // if (is128k) arkos_play_music (2);
		}

		if (trap_active) {			
			// throw a new block
			if ((rand () & TRAP_CHANCE) == 1) { 
				#asm
						ld  bc, MAX_TRAP_BLOCKS
					.trap_block_find_loop
						dec c
						ld  hl, _trap_by
						add hl, bc
						ld  a, (hl)
						cp  0xff
						jr  z, trap_block_create_new

						xor a
						or  c
						jr  z, trap_block_find_done
						jr  trap_block_find_loop

					.trap_block_create_new
						xor a
						ld  (hl), a

						push bc
					.trap_block_select_x
						call _rand

						ld  a, l
						and 0xf
						jr  z, trap_block_select_x
						cp  14
						jr  nc, trap_block_select_x
						pop bc

						ld  hl, _trap_bx
						add hl, bc
						ld  (hl), a

						ld  a, (_trap_coins)
						or  a
						jr  nz, trap_block_set_coins

						push bc
						call _rand
						pop bc
						
						ld  a, l
						and 1
						add 6
						jr  trap_block_write

					.trap_block_set_coins
						ld  a, 50

					.trap_block_write
						ld  hl, _trap_bt
						add hl, bc
						ld  (hl), a

					.trap_block_find_done
				#endasm
			}

			// Animate
			if (half_life) {
				for (gpit = 0; gpit < MAX_TRAP_BLOCKS; gpit ++) {

					#asm
							ld  bc, (_gpit)
							ld  b, 0

							ld  hl, _trap_by
							add hl, bc
							ld  a, (hl)
							ld  (__trap_by), a

							ld  hl, _trap_bx
							add hl, bc
							ld  a, (hl)
							ld  (__trap_bx), a

							ld  hl, _trap_bt
							add hl, bc
							ld  a, (hl)
							ld  (__trap_bt), a
					#endasm
					
					if (_trap_by != 0xff) {
						rda = _trap_bx + (_trap_by << 4) - _trap_by;

						// Make fall
						if (_trap_by)				
							set_map_tile (_trap_bx, _trap_by, map_buff [rda], 0);
						
						_trap_by ++; rda += 15;

						rdx = (gpx + 8) >> 4; rdy = (gpy + 8) >> 4;

						if (rdx == _trap_bx && rdy == _trap_by && trap_coins) {
							flags [COIN_FLAG] ++;
							play_sfx (5);
							player.life += COINS_REFILL;
							_trap_by = 0xff;
						} else if (map_attr [rda] == 1) {
							_trap_by = 0xff;
						} else {
							draw_falling_block ();
						
							if (map_attr [rda + 15] & 12) {
								if (rdx == _trap_bx && rdy == _trap_by) {
									//if (player.estado != EST_PARP) {
										// Crushed!
										trap_kill ();

										// Reenter & reset
										hotspots [n_pant].act = 1;
										player.objs --;
										on_pant = 0xff;
										flags [10 + flags [15]] = 0;
										trap_active = 0;
										break;
									/*
									} else {
										player.y -= 16<<6;
									}
									*/
								}
								map_attr [rda] = comportamiento_tiles [_trap_bt];
								map_buff [rda] = _trap_bt;
								_trap_by = 0xff; 
							}

						}

						trap_by [gpit] = _trap_by;

						// Finally
						if (flags [COIN_FLAG] == TRAP_COINS_MAX) {
							// Deativate trap!
							scenery_info.allow_type_6 = 0;
							play_sfx (8);
							trap_active = 0;
							// TODO // if (is128k) arkos_stop_sound ();
							draw_scr_background ();
							win_crypt ();
							if (n_pant == 0x12) cabroni = 1;
						} 
					}
				}
			}
		}

		// Carrying object
		if (pinv) {
			rdy = gpy - 8;
			if (player.facing) rdx = gpx - 4; else rdx = gpx + 4;
		} else {
			rdx = gpx; rdy = gpy;
			pinv_next_frame = sprite_18_a;
		}

		// 0   2   4      6   7   8  9  10 11 12      14
		// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc
		#asm
			.render_inventory
				ld  ix, #(BASE_SPRITES + (SP_INV*16))

				// sp_sw [rda].cx = (rdx + VIEWPORT_X * 8) >> 1;
				ld  a, (_rdx)
				add #(VIEWPORT_X*8)
				srl a
				ld  (ix + 8), a

				// sp_sw [rda].cy = (rdy + VIEWPORT_Y * 8);
				ld  a, (_rdy)
				add #(VIEWPORT_Y*8)
				ld  (ix + 9), a

				// sp_sw [rda].sp0 = (int) (pinv_next_frame);
				ld  hl, (_pinv_next_frame)
				ld  (ix + 0), l
				ld  (ix + 1), h
		#endasm

		// Offers
		if (latest_hotspot == 2) {
			pofrendas ++;
			play_sfx (5);
			
			// Activate water trap
			if (n_pant == 29) {
				water_level = 25;
				water_trap_setup ();
				// TODO // if (is128k) arkos_play_music (2);
			}

			PSCORE += SCORE_GET_COIN;
		}

		if (pofrendas != pofrendas_old) {
			draw_2_digits (OFRENDAS_X, OFRENDAS_Y, pofrendas);
			pofrendas_old = pofrendas;
		}

		if (flags [COIN_FLAG] != coins_old && trap_coins) {
			draw_2_digits (C_COINS_X, C_COINS_Y, TRAP_COINS_MAX - flags [COIN_FLAG]);
			coins_old = flags [COIN_FLAG];
		}

		if (PSCORE != opscore) {
			draw_2_digits (SCORE_X, SCORE_Y, PSCORE);
			opscore = PSCORE;
		}

		// Water level
		if (water_level) {

			// Move water
			if (water_ct) water_ct --; else {
				water_level --;
				rdy = water_level + VIEWPORT_Y; rdi = 62; paint_water_strip ();
				rdy ++; rdi = 63; paint_water_strip ();
				water_ct = WATER_PERIOD;
			}

			// Detect collision
			if (gpy <= 144 && (water_level << 3) <= gpy) {
				trap_kill ();

				// Reset trap!
				water_level = 0;
				hotspots [29].act = 1;
				pofrendas --;
				PSCORE -= SCORE_GET_COIN;
				n_pant = 5;
				gpy = player.y = 0;
				gpx = 120; player.x = 120<<6;
				// TODO // if (is128k) arkos_play_music (1);				
			}

			// Detect horus tiles
			rdx = (gpx + 8) >> 4; rdy = (gpy - 2) >> 4;
			if (player.ceiling && qtile (rdx, rdy) == 19) {
				water_locks ++;
				set_map_tile (rdx, rdy, 11, 8);
				// sp_UpdateNow ();
				play_sfx (5);
				if (water_locks == 2) {
					// Open trap!
					set_map_tile (water_top_door_x, 0, 0, 0);
					set_map_tile (water_top_door_x + 1, 0, 0, 0);
					// sp_UpdateNow ();
					play_sfx (8);
				}
			}
		}

		// Intro 
		if (n_pant == 12 && flags [5] == 0 && player.possee) {
			flags [5] = 1;
			// render_all_sprites (); 
			// sp_UpdateNow ();
			do_extern_action (2);
		}

		// Cabroni
		if (cabroni && n_pant == 0x13) {
			cpc_UpdateNow (1);
			cabroni = 0;
			redraw_after_text = 1;
			show_text_box (39);
			//sp_UpdateNow ();
		}

		if (player.killingzone_beepcount && jumo_ct == 0) {
			#asm
					ld  ix, #(BASE_SPRITES+(SP_JUMO*16))

					ld  hl, _sprite_jumo
					ld  (ix + 1), h
					ld  (ix + 0), l

					ld  a, 16
					ld  (_jumo_ct), a
					ld  a, (_gpx)
					add #(4 + (VIEWPORT_X * 4))
					srl a
					ld  (_jumo_x), a
					ld  a, (_gpy)
					add #(VIEWPORT_Y * 8)
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

			if (jumo_y <= 16) jumo_ct = 0;

			if (jumo_ct == 0) {
				#asm				
						ld  ix, #(BASE_SPRITES+(SP_JUMO*16))

						ld  hl, _sprite_18_a 					// sm_sprptr [0]
						ld  (ix + 1), h
						ld  (ix + 0), l
				#endasm
			} else {
				#asm
						ld  ix, #(BASE_SPRITES+(SP_JUMO*16))
						ld  a, (_jumo_x)
						ld  (ix + 8), a 		// .cx
						ld  a, (_jumo_y)
						ld  (ix + 9), a 		// .cy
				#endasm
			}
		}
	}

	void hook_entering (void) {		
		// Jumo off
		#asm
				xor a 
				ld  (_jumo_ct), a

				ld  ix, #(BASE_SPRITES+(SP_JUMO*16))

				ld  hl, _sprite_18_a 					// sm_sprptr [0]
				ld  (ix + 1), h
				ld  (ix + 0), l
		#endasm

		/*
		evil_eye_screen = map_behaviours [n_pant] & 2;
		trap_screen = map_behaviours [n_pant] & 4;
		trap_coins = map_behaviours [n_pant] & 8;
		*/
		#asm
				ld  bc, (_n_pant)
				ld  b, 0
				ld  hl, _map_behaviours
				add hl, bc
				ld  c, (hl)

				ld  a, c
				and 2
				ld  (_evil_eye_screen), a

				ld  a, c
				and 4
				ld  (_trap_screen), a

				ld  a, c
				and 8
				ld  (_trap_coins), a		
		#endasm

		/*
		scenery_info.evil_zone_active = 0;
		scenery_info.allow_type_6 = 0;
		evil_eye_counter = 0;
		evil_eye_state = 2;
		*/

		#asm
				xor a
				ld  (_scenery_info+2), a 		// scenery_info.evil_zone_active
				ld  (_scenery_info+3), a 		// scenery_info.allow_type_6
				ld  (_evil_eye_counter), a 
				ld  a, 2
				ld  (_evil_eye_state), a
		#endasm

		// Paint eye and admiration bubbles
		decorate_screen ();

		if (trap_active) win_crypt ();
		trap_active = 0;

		// Water level:
		if (water_level) {
			player.vy = -PLAYER_MAX_VY_SALTANDO;
			player.y = 136<<6; gpy = 136;
			water_trap_setup ();
			
			if (n_pant == 5) {
				water_level = 0;
				// TODO // if (is128k) arkos_play_music (1);
			} else water_level = 25;
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
