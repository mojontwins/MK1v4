// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

void do_extern_action (unsigned char n, unsigned char m) {
	if (n == 0) player.vy = -PLAYER_MAX_VY_SALTANDO;
}

#ifdef ENABLE_ENCODED_TEXT
	void __FASTCALL__ textbox (unsigned char *ptr) {
		// Custom implementation. text is pointed to by ptr.		
	}
#endif 
