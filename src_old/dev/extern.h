// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

void do_extern_action (unsigned char n, unsigned char m) {
}

#ifdef ENABLE_ENCODED_TEXT
	
	// Text has been decoded in a 256 bytes buffer pointed by ptr.
	void __FASTCALL__ textbox (unsigned char *ptr) {
	}

	#ifdef ENABLE_DIALOG
		// Options have been decoded in three 32 bytes buffers pointed by ptr.
		unsigned char __FASTCALL__ dialog (unsigned char *ptr) {
			return 0;
		}
	#endif
#endif 
