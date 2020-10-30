// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

unsigned char temp_string [] = "                        ";

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

unsigned char text3 [] = "UNAS BRAGAS PRINCESA%"
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

unsigned char text9 [] = "SOY SONIA LA MOMIA%"
						 "ME DUELE LA PETACA.%"
						 "COMI MUCHAS CHUCHES%"
						 "Y ME HAGO MUCHA CACA.%";

unsigned char text10 [] = "SOY CLEMENTE, LA%"
						  "SERPIENTE, Y NO PUEO%"
						  "DORMIR. TENGO MUCHO%"
						  "INSOMNIO. QUE PUEDO%"
						  "HACIR?";

unsigned char text11 [] = "SOY MARISA LA SACER-%"
						  "DOTISA, Y AYER FUI%"
						  "LO PEOR. ME DESMADRE%"
						  "EN UN CUMPLE Y PERDI%"
						  "LA ROPA INTERIOR.";

unsigned char text12 [] = "GUSTAVO EL ESCLAVO%"
						  "A SU SERVICIO.%"
						  "TRABAJO MUY BARATO%"
						  "PERO EL CUERO ES MI%"
						  "VICIO...";

unsigned char text13 [] = "JUSTO LO QUE QUERIA!%"
						  "PUEDES PASAR.";

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

unsigned char *texts [] = {
	text0, 								// Bienvenida altar
	text1, text2, text3, text4, 		// Altar describe objetos
	text5, text6, text7, text8, 		// Guardianes mosqueados
	text9, text10, text11, text12, 		// Presentación guardianes
	text13, 							// Puedes pasar
	text14, 							// Ramón el faraón
	text15, text16, text17 				// Final
};

void clear_temp_string (void) {
	#asm
			ld  hl, _temp_string
			ld  de, _temp_string+1
			ld  bc, 23
			ld  a, 32
			ld  (hl), a
			ldir
	#endasm
}

unsigned char talk_sounds [] = { 7, 11 };

void do_extern_action (unsigned char n) {
	if (n < 64) {
		gp_gen = texts [n];

		// Text renderer will read the string and
		// build substrings for draw_text.

		//clear_temp_string ();
		draw_text (4, 6, 40, temp_string);
		rdy = 7;

		while (1) {
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
			clear_temp_string ();
			draw_text (4, rdy ++, 40, temp_string);

			sp_UpdateNow ();
			peta_el_beeper (talk_sounds [rand () & 1]);
		
			if (*gp_gen == 0) break;
			gp_gen ++;
		}

		while (any_key ()); while (!any_key ()); 
	} else {
		// Change carried object.

		pinv = n - 64; if (pinv) pinv_next_frame = object_cells [pinv];
	}
}
