// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

void do_extern_action (unsigned char n) {
	if (n == 128) {
		if (pinv) {
			show_text_box (19);
		} else if (pofrendas) {
			pinv = ofrendas_order [ofrendas_idx ++];
			pinv_next_frame = object_cells [pinv];
			show_text_box (pinv);
		} else show_text_box (0);
	} else if (n < 65) {
		show_text_box (n);
	} else {
		// Work with characters n-64:
		// 1 - Gustavo
		// 2 - Sonia
		// 3 - Clemente
		// 4 - Marisa
	}
}
