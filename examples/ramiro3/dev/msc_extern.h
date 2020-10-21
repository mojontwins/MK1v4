// Extern actions.
// Add code here at your wish.
// Will be run from scripting (EXTERN n)

void do_extern_action (unsigned char n) {
}

// This is a dirty hack
unsigned char tileset_offset_calc () {
	if (
		n_pant < 10 ||
		n_pant == 12 || 
		n_pant == 13
	) return 0;
	return 32;
}
