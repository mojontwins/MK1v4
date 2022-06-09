// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

void do_extern_action (unsigned char n) {
	if (n >= 253) {
		AY_PLAY_MUSIC (n-252); 
	} else if (n == 252) {
		// Make fanties retreat
		for (gpit = 0; gpit < 3; gpit ++) {
			en_an_state [gpit] = 1;
		}
	} else {
		redraw_after_text = 1;
		show_text_box (n);
	}
}
