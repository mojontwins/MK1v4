// MTE MK1 v4.10
// Copyleft 2010-2013, 2020-2024 by The Mojon Twins

// Add here your custom routines & vars

unsigned char gandalf_talk;		// 0 - init, 1 - talk, 2 - open
unsigned char dwarf_talk;
unsigned char dwarf_ct;
unsigned char sonia_talk;
unsigned char amador_talk;
unsigned char interact_flag;
unsigned char anillo_flag;
unsigned char anillo_ct;
unsigned char gallumb_flag; 	// 0 - init, 1 - talk, 2 - angered, 3 - teleport
unsigned char last_estado;
unsigned char anillo_first_time;
unsigned char anillo_uses; 		// # of times
unsigned char smaug_talk;

unsigned char top_string []    = "<======================>";
unsigned char temp_string []   = ";                      [";
unsigned char bottom_string [] = "\\]]]]]]]]]]]]]]]]]]]]]]^";
unsigned char redraw_after_text;
unsigned char intro_text;

unsigned char n_pant_was, xwas, ywas;
unsigned char comecocos_on;
unsigned char cocos_count;
unsigned char inside_gallumb_lair;
unsigned char just_passed_out; 

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

// Decos, screen 17
unsigned char decos3 [] = { 0xA2, 0x3c, 0xff };

// Decos, screen 31
unsigned char decos4 [] = { 0x91, 0x19, 0xff };

// Decos, screen 28
unsigned char decos5 [] = { 0x9a, 0x68, 0xff };

// Decos, ending
unsigned char decos_ending [] = { 0xAF, 0x57, 0xAA, 0x66, 0xAC, 0x67, 0xAD, 0x68, 0xff };

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
							 "HELP ME GAIN ACCESS TO%"
							 "THAT NEARBY MOUNTAIN,%"
							 "WHERE CHARMANDER THE%"
							 "DRAGON DWELLS";

	unsigned char text6 [] = "_BILBOS%"
							 "BUT HOW, MY MAN? THAT%"
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

	
	unsigned char text17[] = "A DWARF APPROACHES";

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

	unsigned char text21[] = "_DWARFY%";
							 "YOU CAN'T POSSIBLY GET%"
							 "PAST HIM IF HE CAN SEE%"
							 "YOU...";

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

	unsigned char text27[] = "_GALLUMB%"
							 "MAD, I AM! I... I LOST%"
							 "MY PRECIOUS!";

	unsigned char text28[] = "_GALLUMB%"
							 "THE WEDDING RING TO%"
							 "MARRY MY BELOVED DWARF%"
							 "ROMAYS. LOST SOMEWHERE%"
							 "IN THIS CAVE";

	unsigned char text29[] = "_GALLUMB%"
							 "AH! TREASON! YOU HAVE%"
							 "STOLEN MY PRECIOUS!%"
							 "NEXT TIME WE SEE YOU%"
							 "WE WILL EAT YOU ALIVE!";

	unsigned char text30[] = "_TASSLEHOFF%"
							 "SORRY, IS THIS YOURS?%"
							 "I FOUND IT LAYING IN%"
							 "THE GROUND...";

	unsigned char text31[] = "_GALLUMB%"
							 "NO! DAMNED DWARF, IT%"
							 "AIN'T MY PRECIOUS!!%"
							 "THIS IS A COCK RING!";

	unsigned char text32[] = "_GALLUMB%"
							 "AH! SO IT IS YOU!%"
							 "FEEL THE WRATH OF THE%"
							 "MIGHTLY GALLUMB!";

	unsigned char text33[] = "_BILBOS%"
							 "OUCH! THAT WAS A BLOW!%"
							 "WHO WOULD'VE GUESSED?%"
							 "HE'S SO TINY, BUT MY%"
							 "HEAD IS SPINNING!";

	unsigned char text34[] = "_BILBOS%"
							 "GOSH, I PUKED. MY HEAD%"
							 "IS SPINNING. I DON'T%"
							 "THINK I CAN TAKE THIS%"
							 "VERY OFTEN...";

	unsigned char text35[] = "_BILBOS%"
							 "HOBBIT, HOBA... CADA%"
							 "DIA TE QUIERO MA...%"
							 "I'M PASSING OUT...";

	unsigned char text36[] = "_BILBOS%"
							 "AW... THAT'S A NASTY%"
							 "HANGOVER! BETTER NOT%"
							 "TO USE THE RING UNLESS%"
							 "COMPLETELY NECESSARY!";

	unsigned char text37 [] = "_GANDALF%"
							 "THINK ABOUT IT!%";


	unsigned char text38[] = "_CHARMANDER%"
	//                        XXXXXXXXXXXXXXXXXXXXXX	
							 "GOTCHA, INTRUDER!%"
							 "DO YOU COME TO STEAL%"
							 "MY TREASURE?";

	unsigned char text39[] = "_BILBOS%"
							 "AH! SURPRISE!";

	unsigned char text40[] = "_CHARMANDER%"
							 "PREPARE TO FIGHT FOR%"
							 "YOUR LIFE!";

	unsigned char text41[] = "_BILBOS%"
							 "MEH. EVERYBODY KNOWS%"
							 "THAT PLANT WINS FIRE!";

	unsigned char text42[]  = "_AMADOR%"
							  "THERE'S A WEIRD OLD%"
							  "MAN THAT'S BOTHERING%"
							  "ME. FIND HIM AND MAKE%"
							  "HIM GO AWAY!";

	unsigned char mission0[] = "FIND THE WEIRD OLD MAN!";
	unsigned char mission1[] = "GATHER ALL 13 DWARVES! ";
	unsigned char mission2[] = "EXPLORE THE BIG CAVE! ";
	unsigned char mission3[] = "FIND THE MAGICAL RING!";
	unsigned char mission4[] = "FIND THE TREASURE!    ";

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
							 "AYUDAME A ENTRAR EN LA%"
							 "MONTA/A DE AHI CERCA,%"
							 "DONDE HABITA EL DRAGON%"
							 "CHARMANDER POKEMOS!";	

	unsigned char text6 [] = "_BILBOS%"
							 "LA MONTA/A ESTA CERRA-%"
							 "DA CUAL TOTO DE NANCY.%"
							 "ES QUE HAY UN TESORO%"
							 "DENTRO?";

	unsigned char text7 [] = "_GANDALF%"
							 "BILBOS, TRAE 13 NOMOS%"
							 "Y LES OBLIGARE A ABRIR%"
							 "LA PUERTA CON MI MAGIA";

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
							 "TESORO. ESTA FASE RE-%"
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


	unsigned char text17[] = "DE PRONTO LLEGA UN%"
	                         "NOMO...";

	unsigned char text18[] = "_GANDALF%"
							 "GRACIAS POR LOS ENANOS%"
							 "ESTOS, BILBOS. AHORA%"
							 "JUNTARAN PICHA PARA%"
							 "ABRIR LA MONTA/A...";

	unsigned char text19[] = "_ENANITO%"
							 "IBAMOS A COGER EL TE-%"
							 "SORO Y SER GRANDES DE%"
							 "NUEVO *EN SENTIDO ME-%"
							 "TAFORICO+ PERO HAY UN%"
							 "PROBLEMA...";

	unsigned char text20[] = "_ENANITO%"
							 "GALLUMB HA LLEGADO DEL%"
							 "PLANETA DAGOBAH Y RON-%"
							 "DA LOS PASILLOS. DOMI-%"
							 "NA LA FUERZA!";

	unsigned char text21[] = "_ENANITO%"
							 "NO PODRAS PASAR DE EL%"
							 "SI PUEDE VERTE ...";

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

	unsigned char text27[] = "_GALLUMB%"
							 "FURIOSO ESTOY! PERDIDO%"
							 "MI TESORO HE! Y LA IRA%"
							 "AL LADO OSCURO CONDUCE";

	unsigned char text28[] = "_GALLUMB%"
							 "EL ANILLO CON EL QUE%"
							 "CASARME CON EL ENANO%"
							 "ROMAYS IBA... PERDIDO%"
							 "EN LA CAVERNA ESTA!";

	unsigned char text29[] = "_GALLUMB%"
							 "AH! ME ENGA/ASTE Y ME%"
							 "ROBASTE MI TESORO! LA%"
							 "PROXIMA VEZ QUE TE VEA%"
							 "TE DEVORARE, NOMO!";

	unsigned char text30[] = "_TASSLEHOFF%"
							 "PERDONA, ES ESTO TUYO?%"
							 "LO ENCONTRE Y LO RECO-%"
							 "GI PARA QUE NO SE PER-%"
							 "DIERA";

	unsigned char text31[] = "_GALLUMB%"
							 "ESTE NO ES MI TESORO,%"
							 "MALDITO ENANO! ESTO ES%"
							 "MI ANILLO DE PENE!";
				
	unsigned char text32[] = "_GALLUMB%"
							 "AH, ERES TU, RUBIO!%"
							 "KIERE PELEA, LADRON?%"
							 "TE REBIENTO, PAIASO!";

	unsigned char text33[] = "_BILBOS%"
							 "AY! QUE SOPAPO! CON LO%"
							 "BAJITO QUE ES Y COMO%"
							 "LA SUERTA EL IOPUTA!%"
							 "ME TIEMBLAN LOS PI/OS";

	unsigned char text34[] = "_BILBOS%"
							 "YA ECHE LAS RABAS...%"
							 "COMO MAREA ESTO... NO%"
							 "CREO QUE LO AGUANTE%"
							 "MUCHAS VECES...";

	unsigned char text35[] = "_BILBOS%"
							 "HOBBIT, HOBA... CADA%"
							 "DIA TE QUIERO MA...%"
							 "QUE MAREO... MI MAE%"
							 "ME DESMAYO...";

	unsigned char text36[] = "_BILBOS%"
							 "AY... ESTO ES COMO UNA%"
							 "RESACA DE LARIOS! NO%"
							 "DEBO USAR EL ANILLO%"
							 "MAS QUE CUANDO SEA IM-%"
							 "PRESCINDIBLE HACERLO!";

	unsigned char text37[] = "_GANDALF%"
							 "ESO AUN NO TE LO PUEDO%"
							 "DECIR!!";

	unsigned char text38[] = "_CHARMANDER%"
							 "TE PILLE, INTRUSO!%"
							 "QUE QUIERES? VIENES%"
							 "A ROBAR MI TESORO?";

	unsigned char text39[] = "_BILBOS%"
							 "ESO AUN NO TE LO PUEDO%"
							 "DECIR!!";

	unsigned char text40[] = "_CHARMANDER%"
							 "PREPARATE PARA LUCHAR%"
							 "POR TU VIDA!";

	unsigned char text41[] = "_BILBOS%"
							 "BAH. TODOS SABEN QUE%"
							 "PLANTA GANA A FUEGO!";

	//                        XXXXXXXXXXXXXXXXXXXXXX	
	unsigned char text42[] = "_AMADOR%"
							 "HAY UN VIEJO QUE NO%"
							 "ME DEJA PODAR EL SETO.%"
							 "ENCUENTRALO Y HAZ QUE%"
							 "SE VAYA, BILBOS!";

	unsigned char mission0[] = "BUSCA AL VIEJO PELLEJO";
	unsigned char mission1[] = "ENCUENTRA LOS 13 NOMOS";
	unsigned char mission2[] = "EXPLORA LA CUEVA GORDA";
	unsigned char mission3[] = "BUSCA EL ANILLO,QUILLO";
	unsigned char mission4[] = "ENCUENTRA EL TESORO!  ";

#endif

unsigned char *texts [] = {
	text0, text1, text2, text3, 			// Dwarves are unknown to bilbos
	text4, text5, text6, text7, 			// Gandalf - biblo talks
	text8, 									// Cave is open
	text9, 									// I am dwarf... write from p+13
	text10, 								// Moto seminueva
	text11, text12, text13, text14,
	0, 0, text17, 							// Comecocos
	text18, 								// Thanks for the dwarves
	text19, text20, text21,					// Enanito speech
	text22, text23, text24,					// Sonia	
	text25, text26,							// Anillo
	text27, text28,	text29,					// Gallumb
	text30, text31,							// Gallumb + tasslehoff
	text32, text33, 						// Gallumb expels
	text34, text35, text36,					// Anillo bad
	text37,									// If you know you know
	text38, text39, text40, text41,			// Fight charmander
	text42 									// Lil' amador intro
};

unsigned char *missions[] = {
	mission0, mission1, mission2, mission3, mission4
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

// Encode multi-text box cutscenes with characters

// Encoding
// D = 1XXXXXXX -> rdb = D & 127
// D = 0XXXXXXX -> rda = D; show_text_box ();
// D = 11111111 -> BREAK

#asm
	.cuts0
		defb 46|128, 4, 5, 47|128, 6, 46|128, 37, 255
	.cuts1
		defb 47|128, 22, 23, 34|128, 24, 255
	.cuts2
		defb 17|128, 19, 20, 21, 255
	.cuts3
		defb 33|128, 27, 28, 0|128, 17, 17|128, 30, 33|128, 31, 255
	.cuts4 		// Charmander showdown
		defb 27|128, 38, 47|128, 39, 27|128, 40, 47|128, 41, 255
#endasm

#asm
	// HL -> cutscene data
	.run_cutscene
		ld  a, (hl)
		inc hl
		cp  0xff 
		ret z 

		bit 7, a
		jr  z, run_cutscene_tb

		and 0x7f
		ld  (_rdb), a 
		jr  run_cutscene

	.run_cutscene_tb
		ld  (_rda), a 
		push hl
		call _show_text_box
		pop hl
		
		jr  run_cutscene
#endasm

// Las coordenadas tienen que estar en _x, _y
// _x = 0-31, _y = 0-23

// El tile que se quiere pintar en _n
// _n = 0-255

void print_tile_inv () {
	#asm

			// Esto obtiene la direccion del tile en DE
			call __tile_address

			// Escribimos el tile
			ld  a, (__n)
			ld  (de), a

			// Invalidamos el tile
			ld  a, (__x)
			ld  e, a
			ld  a, (__y)
			ld  d, a 

			// Esto invalida el tile en E, D
			call cpc_UpdTileTable 
	#endasm
}

void update_mission (void) {
	// Prints mission in rda
	#asm
			ld  a, (_rda)
			sla a 
			ld  h, 0 
			ld  l, a 
			ld  de, _missions
			add hl, de 
			ld  a, (hl)
			inc hl 
			ld  h, (hl)
			ld  l, a

			ld  a, 5
			ld  (__x), a 
			ld  a, 21 
			ld  (__y), a 
			ld  a, 71
			ld  (__n), a 

			call draw_text_pre_loop
	#endasm
}

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

void draw_text_cbc (void) {
	#asm
			// Text to draw in HL, 0 terminated
			
		.dtcbc_loop
			ld  a, (_rdx)
			ld  (__x), a 
			ld  c, a 
			inc a 
			ld  (_rdx), a
			
			ld  a, (hl) 
			or  a 
			jr z, dtcbc_done
			inc hl 
			sub 32 
			halt 
			halt 
			
			jr  z, dtcbc_loop		// Skip spaces.

			push hl 

			// Draw inv tile A @ rdx, rdy
			ld  (__n), a
			ld  a, (_rdy) 
			ld  (__y), a 
					
			call _print_tile_inv

	#endasm 
	cpc_UpdateNow (0);
	#asm 	

			pop hl 

			jr  dtcbc_loop

		.dtcbc_done
			xor a 
			ld  (_rdc), a
	#endasm
}

void show_text_box (void) {
	gp_gen = texts [rda];

	// Text renderer will read the string and
	// build substrings for draw_text.

	#asm
			ld  a, (_rdb)
			or  a 
			ld  a, 6
			jr  z, stb_do
			dec a
		.stb_do
			ld  (__y), a 
			ld  a, 4 
			ld  (__x), a 
			
			ld  hl, _top_string

			call draw_text_pre_loop

			ld  a, 7 
			ld  (_rdy), a
	#endasm

	#asm
		.stb_loop
			call _clear_temp_string

			// Clear line above, only if rdb != 0 or rdy > 7
			ld  a, (_rdb) 
			or  a
			jr  nz, stb_top
			ld  a, (_rdy)
			cp  8
			jr  c, stb_notop

		.stb_top
			ld  a, (_rdy)
			dec a 
			ld  (__y), a 
			ld  a, 4
			ld  (__x), a 
			
			ld  hl, _temp_string 
			call draw_text_pre_loop
		.stb_notop			

			ld  a, (_rdy)
			ld  (__y), a 
			ld  a, 4
			ld  (__x), a 
			
			ld  hl, _temp_string 
			call draw_text_pre_loop

			ld  a, (_rdy)
			inc a 
			ld  (__y), a 
			ld  a, 4
			ld  (__x), a 
			
			ld  hl, _bottom_string 
			call draw_text_pre_loop

			// Portrait if rdb != 0

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
			ld  hl, (_gp_gen)				// HL -> current text

		.fill_buffer_loop
			ld  a, (hl) 					// Read char from text
			or  a
			jr  z, fill_buffer_end 			// 0 -> done filling buffer (string end)
			cp  '%'
			jr  z, fill_buffer_end 			// % -> done filling buffer (new line)

			ld  (de), a 					// Write to buffer

			inc hl
			inc de
			jr  fill_buffer_loop

		.fill_buffer_end
			ld  (_gp_gen), hl
		
			ld  a, 4
			ld  (_rdx), a
			ld  hl, _temp_string
			call dtcbc_loop

			ld  a, (_rdy)
			add 2 
			ld  (_rdy), a

			// if (*gp_gen == 0) break;
			ld  hl, (_gp_gen)
			ld  a, (hl) 
			or  a 
			jr  z, stb_exitloop

			// gp_gen ++;
			inc hl 
			ld  (_gp_gen), hl

			jp stb_loop

		.stb_exitloop
	#endasm

	cpc_UpdateNow (0);
	wyz_play_sound (7);

	#asm
		// do { pad_read (); } while (0xff == pad_this_frame);
		.stb_waitkey
			call _pad_read 
			ld  a, (_pad_this_frame)
			inc a 
			jr  z, stb_waitkey 			// if pad = 0xff, inc pad = 0, so loop.

			ld  a, (_redraw_after_text)
			or  a 
			jr  z, stb_redraw_done

			call _redraw_from_buffer
			call _hotspot_paint
			call _render_all_sprites
			ld  hl, 1 
			push hl 
			call _cpc_UpdateNow
			pop hl 
		.stb_redraw_done

			ld  a, 1 
			ld  (_redraw_after_text), a
	#endasm 
}

void recuadrius (void) {	
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

void draw_cur_screen_decos (void) {
	#asm
			ld  a, (_n_pant)
			cp  0
			jr  z, dcsd_0
			cp  1
			jr  z, dcsd_1
			cp  4
			jr  z, dcsd_4
			cp  5
			jr  z, dcsd_5
			cp  17 
			jr  z, dcsd_17
			cp  24
			jr  z, dcsd_24
			cp  28
			jp  z, dcsd_28
			cp  31
			jp  z, dcsd_31
			ret

		.dcsd_0 
			ld  hl, _decos0
			ld  (_gp_gen), hl
			jp _draw_decos			

		.dcsd_1
			ld  hl, _decos1
			ld  (_gp_gen), hl
			jp _draw_decos

		.dcsd_4
			ld  a, (_gallumb_flag)
			cp  1
			ret nc

			ld  a, 6
			ld  c, a 
			ld  (__x), a 
			ld  a, 4
			ld  (__y), a 
			xor a 
			ld  (__n), a 
			ld  (__t), a
			call set_map_tile_do
			ld  a, 240
			ld  (_hotspot_y), a 
			ret

		.dcsd_5 
			ld  hl, _decos2
			ld  (_gp_gen), hl
			jp _draw_decos


		.dcsd_17
			// Sonia la momia
			ld  a, (_sonia_talk)
			ret nz

			ld  hl, _decos3
			ld  (_gp_gen), hl
			jp _draw_decos

		.dcsd_24
			// Dwarf at the entrance to the mountain / closed door
			ld  a, (_gandalf_talk)
			cp  2 
			ret nz

			ld  a, (_dwarf_talk)
			or  a 
			ld  a, 9
			ld  c, a
			ld  (__x), a
			ld  a, 7 
			jr  nz, dcsd_24_at

			ld  (__y), a
			ld  a, 17
			ld  (__t), a 
			jr  dcsd_24_end

		.dcsd_24_at
			ld  a, 9
			ld  (__y), a
			ld  a, 15
			ld  (__t), a 
			jr  dcsd_24_end

		.dcsd_24_end
			ld  a, 8
			ld  (__n), a 
			call set_map_tile_do
			ret

		.dcsd_28
			ld  a, (_amador_talk)
			or  a
			ret nz

			ld  hl, _decos5
			ld  (_gp_gen), hl
			jp _draw_decos 

		.dcsd_31
			ld  a, (_gandalf_talk)
			cp  2 
			ret z

			ld  hl, _decos4
			ld  (_gp_gen), hl
			jp _draw_decos
	#endasm
}

void launch_comecocos_screen(void) {
	// Launches comecocos screen in rda

	// to return
	#asm
			ld  a, (_n_pant)
			ld  (_n_pant_was), a
			ld  a, (_gpx)
			ld  (_xwas), a
			ld  a, (_gpy)
			ld  (_ywas), a

			// Clear screen
			call _recuadrius

			// New n_pant
			ld  a, (_rda)
			add 35
			ld  (_n_pant), a 

			// Show text
			xor a 
			ld  (_redraw_after_text), a 
			ld  (_rdb), a 
			ld  a, (_rda) 
			add 11 
			ld  (_rda), a
			call _show_text_box

			ld  a, 16
			ld  (_gpx), a 
			ld  (_gpy), a 
			ld  hl, 16*64
			ld  (_player), hl 		// player.x
			ld  (_player + 2), hl 	// player.y

			ld  a, 1 
			ld  (_comecocos_on), a 
			dec a 
			ld  (_player + 45), a 	// player.coins
	#endasm
	wyz_play_music (5);
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

			// Now n_pant_was contains which comecocos screen just finished
			ld  hl, _player + 23 		// player.estado 
			ld  (hl), EST_PARP
			inc hl 						// player.ct_estado
			ld  (hl), 50
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

void bilbos_hangover (void) {
	#asm
			xor a 
			ld  (_redraw_after_text), a 
			call _show_text_box 
			call _recuadrius 

			// Back to the entrance?
			ld  a, (_inside_gallumb_lair)
			or  a 
			jr  z, no_gallumb_lair
			ld  a, 12
			ld  (_n_pant), a 
			ld  hl, 2*1024
			ld  (_player), hl 		// player.x
			ld  (_player + 2), hl 	// player.y
		.no_gallumb_lair

			// Force redraw
			ld  a, 0xff 
			ld  (_on_pant), a 

			// Signal that just passed out test must be shown
			ld  a, 1
			ld  (_just_passed_out), a
	#endasm
}

// ***************
// Pokemon engine!
// ***************

#include "pokemon.h"

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {

		#asm 
			xor a 
			ld  (_gandalf_talk), a 
			ld  (_dwarf_talk), a 
			ld  (_sonia_talk), a
			ld  (_amador_talk), a
			ld  (_comecocos_on), a 
			ld  (_anillo_flag), a 
			ld  (_gallumb_flag), a 
			ld  (_anillo_uses), a 
			ld  (_smaug_talk), a 
			ld  (_just_passed_out), a
			inc a 
			ld  (_anillo_first_time), a
		#endasm

		dwarf_ct = rand () & 3;
		redraw_after_text = 1;
		draw_coloured_tile (19, 22, 0);		

		wyz_play_music (1);

		// Debug
		//n_pant = 6;
	}

	void hook_init_mainloop (void) {
		#asm
				ld  a, (_just_passed_out)
				or  a 
				ret z 

				ld  a, (_gallumb_flag) 		// if (gallumb_flag == 3) {
				cp  3 
				jr  nz, gallumb_not_3
				dec a 
				ld  (_gallumb_flag), a  	// gallumb_flag = 2;
				ld  a, 33 					// rda = 33;
				jr  gallumb_rda_set
			.gallumb_not_3					// } else {
				ld  a, 36 					// rda = 36;
			.gallumb_rda_set 				// }
				ld  (_rda), a


				xor a 
				ld  (_anillo_uses), a 
				ld  (_just_passed_out) , a

				// Show text
				ld  (_redraw_after_text), a
				ld  a, 47
				ld  (_rdb), a 
				jp _show_text_box
		#endasm
	}

	void interactions (void) {
		#asm
				ld  a, (_n_pant)
				cp  0
				jp  z, room_00
				cp  1
				jp  z, room_01
				cp  5
				jp  z, room_05
				cp  12
				jp  z, room_12
				cp  17
				jp  z, room_17
				cp  24
				jp  z, room_24
				cp  28
				jp  z, room_28
				ret

			.no_interact_and_ret
				xor a 
				ld  (_interact_flag), a 
				ret


			.interact_and_ret
				ld  a, 1
				ld  (_interact_flag), a 
				ret


		// ********************************************************************
			.room_00
				// GANDALF

				ld  a, 2*16
				ld  (__x), a 
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, (_interact_flag) 
				or  a
				ret  nz

			// if (gandalf_talk == 1 && player.objs < 13) {
				ld  a, (_gandalf_talk)
				cp  1 
				jr  nz, int_gandalf_t1_done

				ld  a, (_player+27)		// player.objs
				cp  13
				jr  nc, int_gandalf_t1_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 7
				ld  (_rda), a
				call _show_text_box

			.int_gandalf_t1_done

			// if (gandalf_talk == 0)
				ld  a, (_gandalf_talk)
				or  a
				jr  nz, int_gandalf_t2_done

				ld  hl, cuts0
				call run_cutscene

				ld  a, 1
				ld  (_gandalf_talk), a 

				// Reset this to reuse as dwarf name pointer
				xor a
				ld  (_dwarf_ct), a

				// But first, fire up comecocos #0
				ld  (_rda), a
				call _launch_comecocos_screen
				ld  a, 65
				ld  (_cocos_count), a 
				ld  a, 1 
				ld  (_rda), a
				call _update_mission

			.int_gandalf_t2_done

			// if (gandalf_talk == 2) {
				ld  a, (_gandalf_talk)
				cp  2
				jr  nz, int_gandalf_t3_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 8
				ld  (_rda), a
				call _show_text_box

			.int_gandalf_t3_done

			// if (player.objs == 13 && gandalf_talk == 1) {
				ld  a, (_gandalf_talk)
				cp  1
				jr  nz, int_gandalf_t4_done

				ld  a, (_player+27) 		// player.objs
				cp  13
				jr  nz, int_gandalf_t4_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 18
				ld  (_rda), a 
				call _show_text_box

				ld  a, 2 
				ld  (_gandalf_talk), a 
				xor a 
				ld  (_player+27), a 		// player.objs

				ld  a, 1
				ld  (_rda), a 
				call _launch_comecocos_screen
				ld  a, 65
				ld  (_cocos_count), a

				ld  a, 2 
				ld  (_rda), a 
				call _update_mission

			.int_gandalf_t4_done
				jp interact_and_ret

		// ********************************************************************
			.room_01
				
				// Moto seminueva
				ld  a, (_gpx)
	
				// if (gpx > 48 && gpx < 88 && gpy < 32) {

				// gpx > 48 -> gpx >= 49
				cp  49 
				jp  c, no_interact_and_ret			

				// gpx < 88
				cp  88
				jp  nc, no_interact_and_ret

				// gpy < 32
				ld  a, (_gpy)
				cp  32
				jp  nc, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz 

				ld  a, 35
				ld  (_rdb), a 
				ld  a, 10
				ld  (_rda), a 
				call _show_text_box		

				jp  interact_and_ret

		// ********************************************************************
			.room_05
				
				// Smaug / Charmander

				// if (gpx < 12*16) {
				ld  a, (_gpx)
				cp  12*16
				ret nc

				ld  a, (_smaug_talk)
				or  a
				jr  nz, smaug_talk_skip
				inc a 
				ld  (_smaug_talk), a

				ld  hl, cuts4
				call run_cutscene

			.smaug_talk_skip

				// *********** POKEMON ****************
				
				// This is not enough :-/
				//call _saca_a_todo_el_mundo_de_aqui
				ld  b, 4 				// 4 = bilbo + 3 enems will suffice
				ld  hl, _sprite_18_a 
				ld  ix, _sp_sw
			.custom_clear_sprites_loop
				ld  (ix + 0), l
				ld  (ix + 1), h 
				xor a 
				ld  (ix + 8), a 
				ld  (ix + 9), a 
				ld  (ix + 10), a 
				ld  (ix + 11), a 

				push bc 
				ld  bc, 16 
				add ix, bc 
				pop bc 
				djnz custom_clear_sprites_loop
				
				// Clear nametable
				xor a 
				ld  hl, _nametable
				ld  (hl), a
				ld  de, _nametable+1
				ld  bc, 767
				ldir
			#endasm
			recuadrius ();
			wyz_play_music (6); 		// Pokemon
			pokemon_combat ();
			wyz_play_music (3); 		// Cave
			recuadrius ();
			#asm 
				ld  a, (_pk_win)
				or  a 
				jr  z, pokemon_lose

			.pokemon_win 
				ld  a, 1 
				ld  (_game_loop_flag), a 
				ret 

			.pokemon_lose
				// If lose -> one life less, throw right
				dec a 					// A = 0-1 = 255
				ld  (_on_pant), a 
				ld  hl, 256
				ld  (_player + 6), hl 	// player.vx
				ld  a, 1 
				ld  (_player + 26), a 	// player.is_dead
				ret

		// ********************************************************************
			.room_12

				// Gallumb gets angry!
				ld  a, (_gallumb_flag)
				cp  1 
				ret nz

				ld  a, 7*16
				ld  (__x), a 
				ld  a, 9*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jp  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  a, 33
				ld  (_rdb), a
				ld  a, 29
				ld  (_rda), a
				call _show_text_box

				ld  a, 2
				ld  (_gallumb_flag), a
				ld  a, 4 
				ld  (_rda), a 
				call _update_mission

				jp  interact_and_ret

		// ********************************************************************
			.room_17

				// Sonia la momia
				ld  a, (_sonia_talk)
				or  a 
				ret nz 

				ld  a, 12*16
				ld  (__x), a 
				ld  a, 3*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jp  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  hl, cuts1 
				call run_cutscene 

				ld  a, 2
				ld  (_rda), a 
				call _launch_comecocos_screen 

				ld  a, 65
				ld  (_cocos_count), a 

				ld  a, 1
				ld  (_sonia_talk), a

				jp  interact_and_ret

		// ********************************************************************
			.room_24

				// Enano en la cueva
				ld  a, (_dwarf_talk)
				or  a 
				ret nz 

				ld  a, 9*16
				ld  (__x), a 
				ld  a, 7*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jp  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  hl, cuts2
				call run_cutscene 

				ld  a, 1
				ld  (_dwarf_talk), a 

				ld  a, 3
				ld  (_gandalf_talk), a 

				ld  a, 0xff 
				ld  (_on_pant), a 

				#endasm 
				wyz_play_music (3);
				#asm

				jp  interact_and_ret

		// ********************************************************************
			.room_28

				// Amador
				ld  a, (_amador_talk)
				or  a  
				ret nz 

				ld  a, 8*16
				ld  (__x), a 
				ld  a, 6*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jp  z, no_interact_and_ret

				ld  a, 42
				ld  (_rda), a 
				ld  a, 26
				ld  (_rdb), a 
				call _show_text_box 

				ld  a, 1 
				ld  (_amador_talk), a 

				ld  a, 0xff 
				ld  (_on_pant), a 

				xor a 
				ld  (_rda), a 
				call _update_mission
		#endasm
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

			.delayed_text_do
				ld  a, (_tfn_b)
				ld  (_rdb), a 
				ld  a, (_tfn_a)
				ld  (_rda), a 
				call _show_text_box

			.delayed_text_done

		#endasm

		// Comecocos shit

		#asm
			// if (comecocos_on && player.coins == cocos_count) {
			.comecocos_shit
				ld  a, (_comecocos_on) 
				or  a 
				jr  z, comecocos_shit_done

				ld  a, (_player + 45) 		// player.coins 
				ld  c, a 
				ld  a, (_cocos_count) 
				cp  c 
				jr  nz, comecocos_shit_done

			.comecocos_shit_do 
				// back_from_comecocos_screen ();
				// comecocos_on = 0;
				call _back_from_comecocos_screen
				xor a 
				ld  (_comecocos_on), a 

				// switch (n_pant_was) {
				ld  a, (_n_pant_was)
				cp  0
				jr  z, after_comecocos_0
				cp  1
				jr  z, after_comecocos_1
				cp  2
				jr  z, after_comecocos_2
				cp  3
				jr  z, after_comecocos_3
				jr  comecocos_shit_done

			.after_comecocos_0
				ld  hl, 2  					// Play "AYJO"
				call _wyz_play_music 
				ld  a, 46
				ld  (_tfn_b), a 
				ld  a, 7 
				ld  (_tfn_a), a
				ld  a, 3 
				ld  (_delayed_ct), a 
				jr  comecocos_shit_done

			.after_comecocos_1
				ld  hl, 1  					// Play "NOMO"
				call _wyz_play_music 
				ld  a, 46
				ld  (_tfn_b), a 
				ld  a, 8
				ld  (_tfn_a), a
				ld  a, 3 
				ld  (_delayed_ct), a 
				jr  comecocos_shit_done

			.after_comecocos_2
				ld  hl, 3  					// Play "CAVE"
				call _wyz_play_music 				
				jr  comecocos_shit_done

			.after_comecocos_3
				ld  hl, 3  					// Play "CAVE"
				call _wyz_play_music 

				// Enable ring
				ld  a, 1 
				ld  (_anillo_flag), a

				ld  a, 18
				ld  (_tfn_b), a 
				ld  a, 26
				ld  (_tfn_a), a
				ld  a, 3 
				ld  (_delayed_ct), a 
				jr  comecocos_shit_done

			.comecocos_shit_done
		#endasm

		// Interactions
		interactions ();

		// Anillo
		if (anillo_flag) {
			#asm
					// if (player.estado == 0) 
					ld  a, (_player + 23) 			// player.estado
					or  a 
					jp  nz, anillo_done

					/*
					// if (player_estado != last_estado)					
					ld  c, a 
					ld  a, (_last_estado)
					cp  c 
					jp  z, anillo_ct_check
					*/
					// Changed to:
					// if (last_estado == EST_PARP | EST_DIZZY)
					ld  a, (_last_estado)
					cp  EST_PARP | EST_DIZZY
					jp  nz, anillo_ct_check

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

					// Throw the rabas!

					ld  a, (_gpx)
					add 8
					srl a
					srl a 
					srl a
					srl a 
					ld  (__x), a 
					ld  c, a
					ld  a, (_gpy)
					add 8
					srl a
					srl a 
					srl a
					srl a 
					ld  (__y), a 

					ld  a, 32
					ld  (__t), a 
					xor a 
					ld  (__n), a
					call set_map_tile_do					

				#endasm
				cpc_UpdateNow (1);
				wyz_play_sound (3);
				espera_activa (20);
				#asm

					// First time with anillo: text
					
					ld  a, (_anillo_first_time) 
					or  a
					jr  z, anillo_not_first_time
					xor a 
					ld  (_anillo_first_time), a

					// Text!

					ld  a, 34
					ld  (_rda), a 
					ld  a, 47
					ld  (_rdb), a 
					call _show_text_box

				.anillo_not_first_time
					// Count how many times. After sixth time, reset!
					
					ld  a, (_anillo_uses)
					inc a 
					ld  (_anillo_uses), a 
					cp  8
					jr  nz, anillo_done

					// Reset!
					ld  a, 35
					ld  (_rda), a
					ld  a, 47
					ld  (_rdb), a 
					call _bilbos_hangover

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
					call _wyz_play_sound
				.anillo_done
			#endasm 

		}

		// Use this to detect if player.estado changed last frame
		last_estado = player.estado;
	}

	void hook_entering (void) {		
		draw_cur_screen_decos ();

		/*
		// This translates very badly to assembly with z88dk
		inside_gallumb_lair = 
			n_pant == 0x05 || n_pant == 0x06 ||
			n_pant == 0x0c || n_pant == 0x0d ||
			n_pant == 0x13 || n_pant == 0x14 ||
			n_pant == 0x1a || n_pant == 0x1b ||
			n_pant == 0x21 || n_pant == 0x22;
		*/

		#asm
 				ld  a, (_n_pant)
 				cp  0x05
 				jr  z, in_gallumb
 				cp  0x06
 				jr  z, in_gallumb
 				cp  0x0c 
 				jr  z, in_gallumb
 				cp  0x0d 
 				jr  z, in_gallumb
 				cp  0x13
 				jr  z, in_gallumb
 				cp  0x14
 				jr  z, in_gallumb
 				cp  0x1a
 				jr  z, in_gallumb
 				cp  0x1b 
 				jr  z, in_gallumb
 				cp  0x21
 				jr  z, in_gallumb
 				cp  0x22
 				jr  z, in_gallumb

 				xor a 
 				jr  in_gallumb_set

 			.in_gallumb
 				ld  a, 1

 			.in_gallumb_set 
 				ld  (_inside_gallumb_lair), a
		#endasm

 		// Clear door
	}

	void hook_hotspots (void) {	
		/*
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

				wyz_play_sound (6);

				// Make permanent
				hotspot_t = 0;

				break;
		}
		*/

				#asm
				ld  a, (_hotspot_t)
				cp  1
				jr  z, hook_hotspots_1
				cp  2
				jr  z, hook_hotspots_2
				cp  12
				jr  z, hook_hotspots_12
				ret 


			.hook_hotspots_1
				// Hook for objects (dwarves)
				ld  a, (_gandalf_talk)
				or  a 
				jr  nz, hh_gandalf_talked

			.hh_gandalf_not_talked
				ld  a, (_dwarf_ct) 
				ld  (_rda), a 
				inc a
				and 3 
				ld  (_dwarf_ct), a
				ld  a, 47
				ld  (_rdb), a 

				xor a 
				ld  (_hotspot_t), a

				jp _show_text_box

			.hh_gandalf_talked
				call _insert_dwarf_name
				ld  a, 9
				ld  (_rda), a 
				ld  a, 17
				ld  (_rdb), a 
				jp  _show_text_box


			.hook_hotspots_2
				// Anillo
				#endasm
				draw_coloured_tile (19, 22, 18);
				#asm

				ld  a, 18
				ld  (_rdb), a 
				ld  a, 25
				ld  (_rda), a 
				call _show_text_box 

				// We'll be changing current n_pant from a
				// hotspot interaction so we have to do this
				// manually!
				#endasm
				hotspots [n_pant].act = 0;
				#asm 

				// Disable normal interaction 
				xor a 
				ld  (_hotspot_t), a 

				// Fire up comecocos #3
				ld  a, 3
				ld  (_rda), a 
				call _launch_comecocos_screen
				ld  a, 55
				ld  (_cocos_count), a

				ret

			.hook_hotspots_12
				// Special mushroom for pacman stages

				ld  a, (_player + 23) 		// player.estado
				or  a
				jr  nz, hh12_has_estado

				ld  a, EST_PARP
				ld  (_player + 23), a 
				ld  a, 150
				ld  (_player + 24), a 		// player.ct_estado

			.hh12_has_estado
				#endasm
				wyz_play_sound (6);
				#asm

				// Disable normal interaction 
				xor a 
				ld  (_hotspot_t), a 
				
		#endasm
	}

	int hook_game_over (void) {
		// Do your shit then return 1 for normal game over.
		return 1;
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
		/*
		if(_en_t == 3) {
			// Custom collision with Gallumb
			
			if (gallumb_flag == 2) {
				// Gallumb is angered! on touch->text, fade, teleport, text2 <- "on enter"

				// Text & fade & back to the entrance
				rda = 32; rdb = 33; bilbos_hangover ();

				// on reenter, detect this & show text, then set it back to 2.
				gallumb_flag = 3;

			} else {

				if(gallumb_flag == 0) {

					#asm
							ld  hl, cuts3
							call run_cutscene
					#endasm

					gallumb_flag = 1;

					rda = 3; update_mission ();
				} 

				if (gallumb_flag == 1) {
					player.x -= 256;
					
					return 1;
				}
			}

		} 

		return 0;
		*/

		#asm
				ld  hl, 0
				ld  a, (__en_t)
				cp  3 
				ret nz 

				ld  a, (_gallumb_flag) 
				cp  2 
				jr  nz, ecc_gallumb_notangry

				ld  a, 32 
				ld  (_rda), a 
				inc a 
				ld  (_rdb), a 
				call _bilbos_hangover

				ld  a, 3 
				ld  (_gallumb_flag), a 

				ld  hl, 0
				ret

			.ecc_gallumb_notangry
				or  a 					// if(gallumb_flag == 0) {
				jr  nz, ecc_gallumb_repel

				ld  hl, cuts3 
				call run_cutscene

				ld  a, 1 
				ld  (_gallumb_flag), a 
				ld  a, 3 
				ld  (_rda), a 
				call _update_mission 
				ld  hl, 0 
				ret 

			.ecc_gallumb_repel				
				ld  hl, (_player) 
				ld  de, -256
				add hl, de 
				ld  (_player), hl 
				ld  hl, 1 
				ret	
		#endasm
	}
#endif
