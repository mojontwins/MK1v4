// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

unsigned char temp_string [] = "                        ";

//                       XXXXXXXXXXXXXXXXXXXXXX
unsigned char text1 [] = "ESTO ES UNA PRUEBA DE%"
                        "CUADRO DE TEXTO. OUH%"
                        "YEAH PEPINILLOS!";

unsigned char *texts [] = {
	text1
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

void do_extern_action (unsigned char n) {
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
	
		if (*gp_gen == 0) break;
		gp_gen ++;
	}

	sp_UpdateNow ();
	while (sp_GetKey ()); while (!sp_GetKey ()); 
}
