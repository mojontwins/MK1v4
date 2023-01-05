// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

unsigned char which_character;

void speech (unsigned char a, unsigned char b, unsigned char c) {
	show_text_box (a); 
	#asm
		call SPUpdateNow
	#endasm

	show_text_box (b);
	#asm
		call SPUpdateNow
	#endasm

	show_text_box (c); 
	#asm
		call SPUpdateNow
	#endasm

}

void do_extern_action (unsigned char n) {
	redraw_after_text = 1;
	if (n == 3) {
		if (flags [19]) {
			show_text_box (38);
		} else if (pinv) {
			show_text_box (19);
		} else {
			pinv = 5; 
			pinv_next_frame = object_cells [pinv];
			show_text_box (36);
			flags [19] = 1;
			PSCORE += SCORE_FALSE_INTERACTION;
		}
	} else if (n == 128) {
		if (pinv) {
			show_text_box (19);
		} else if (pofrendas) {
			pinv = ofrendas_order [ofrendas_idx ++];
			pinv_next_frame = object_cells [pinv];
			show_text_box (pinv);
			pofrendas --;
			PSCORE += SCORE_GET_OBJECT;
		} else show_text_box (0);
	} else if (n == 64) {
		// Final sequence (call before win game)
		for (rdi = 15; rdi < 18; rdi ++) {
			#asm
				call SPUpdateNow
			#endasm
			clear_gamearea ();
			redraw_after_text = 0; show_text_box (rdi);
		}
	} else if (n == 1) {
		// Ramon speech
		speech (14, 13, 30);
	} else if (n == 2) {
		speech (33, 34, 35);
	} else if (n < 64) {
		show_text_box (n);
	} else {
		// Work with characters n-64:
		which_character = n - 64;
		show_text_box (25 + which_character);
		#asm
			call SPUpdateNow
		#endasm
		
		if (pinv == 5 && which_character == 1) {
			show_text_box (37);
			pinv = 0;
			PSCORE += SCORE_FALSE_INTERACTION;
			return;
		}

		if (flags [which_character] == 2) {
			show_text_box (20);
		} else if (flags [which_character] == 0 || pinv == 0) {
			show_text_box (8 + which_character);
			if (flags [which_character] == 0) {
				flags [which_character] = 1;
				PSCORE += SCORE_CHARACTER_TALK;
			}
			#asm
				call SPUpdateNow
			#endasm
			
		} else if (pinv != which_character) {
			show_text_box (4 + which_character);
		} 

		if (pinv == which_character) {
			show_text_box (20 + which_character);
			draw_text (LINE_OF_TEXT_X + 1, LINE_OF_TEXT, LINE_OF_TEXT_ATTR, "CRIPTA ABIERTA! PUEDES PASAR");
			on_pant = 0xff; 		// Force reenter
			flags [which_character] = 2;
			pinv = 0;
			play_sfx (6);
			PSCORE += SCORE_OPEN_CRYPT;
			player.life += 10; 		// Life boost
		}
	}
}
