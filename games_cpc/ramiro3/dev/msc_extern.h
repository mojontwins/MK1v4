// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

void do_extern_action (unsigned char n) {
	redraw_after_text = 1;
	show_text_box (n);
}
