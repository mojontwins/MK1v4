// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

void do_extern_action (unsigned char n) {
	switch (n) {
		case 0xfe: AY_PLAY_MUSIC (1); break;
		case 0xff: AY_PLAY_MUSIC (2); break;
		default:
			redraw_after_text = 1;
			show_text_box (n);
	}
}
