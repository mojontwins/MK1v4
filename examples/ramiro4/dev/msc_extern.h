// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

unsigned char which_character;

void do_extern_action (unsigned char n) {
	if (n == 128) {
		if (pinv) {
			show_text_box (19);
		} else if (pofrendas) {
			pinv = ofrendas_order [ofrendas_idx ++];
			pinv_next_frame = object_cells [pinv];
			show_text_box (pinv);
			pofrendas --;
		} else show_text_box (0);
	} else if (n == 64){
		// Final sequence (call before win game)
		for (rdi = 15; rdi < 18; rdi ++) {
			sp_UpdateNow ();
			clear_gamearea ();
			redraw_after_text = 0; show_text_box (rdi);
		}
	} else if (n < 64) {
		show_text_box (n);
	} else {
		// Work with characters n-64:
		which_character = n - 64;
		if (flags [which_character]) {
			show_text_box (20);
		} else if (pinv == 0) {
			show_text_box (8 + which_character);
		} else if (pinv != which_character) {
			show_text_box (4 + which_character);
		} else {
			show_text_box (20 + which_character);
			draw_text (LINE_OF_TEXT_X + 1, LINE_OF_TEXT, LINE_OF_TEXT_ATTR, "CRIPTA ABIERTA! PUEDES PASAR");
			on_pant = 0xff; 		// Force reenter
			flags [which_character] = 1;
			pinv = 0;
			peta_el_beeper (6);
		}
	}
}
