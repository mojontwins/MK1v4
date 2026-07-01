// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

#define SC_ENTERING_GAME 0
#define SC_ENTERING_ANY 1
#define SC_PRESS_FIRE_AT_ANY 2
#define SC_PLAYER_GOT_SOMETHING 3
#define SC_PLAYER_KILLS_ENEMY 4
#define SC_SPECIAL_TILE_TOUCHED 5
#define SC_ENEMY_TOUCHED 8
#define SC_ENTERING_SCREEN 16
#define SC_PRESS_FIRE_AT_SCREEN 17

#define TEXT_BUFFER BASE_FREE

extern unsigned char script_n;
extern unsigned char script_result;
extern unsigned char script_tx, script_ty, script_tn;
unsigned char script_param;

extern void script_do (void);

#ifdef ENABLE_ENCODED_TEXT
	void __FASTCALL__ decode_text (unsigned char *ptr) {
		#asm
				ld  de, script_encoded_text
				add hl, de 

				ld  de, #(TEXT_BUFFER)

				// 5 bit escaped depacker v2 by na_th_an
				// Contains code by A. Villena.

				// C works as a "mark" to read the bit stream
				ld  c, 0x80 

			.fbsd_mainb 
				
				// Read new 5 bit value
				call fbsd_unpackc 

				// A contains last byte read from stream.
				// B contains latest 5 bit value read from stream.

				// If we read a 0 -> ESC

				or  a 
				jr  z, fbsd_escaped 

				// Otherwise, output a + 64
				add 64
				jr  fbsd_stor

			.fbsd_escaped 
				// Read new 5 bit value
				call fbsd_unpackc 
				
				or  a 			// ESC 0 = END 
				jr  z, fbsd_done

				cp  31 			// ESC 31 = NL
				jr  nz, fbsd_nonl
				ld  a, '%'
				jr  fbsd_stor 
			.fbsd_nonl

				// Otherwise, output a + 32
				add 32

			.fbsd_stor
				ld  (de), a 
				inc de
				jr  fbsd_mainb

			.fbsd_unpackc
				ld  a, c
				ld  b, 0x08 	// 00001000 will get bits from the right
								// Until that 1 gets into the carry.
			.fbsd_bucle 
				call fbsd_getbit 
				rl  b 
				jr  nc, fbsd_bucle 
				ld  c, a 
				ld  a, b
				ret 

			.fbsd_getbit
				add a, a 
				ret nz 
				ld  a, (hl) 
				inc hl 
				rla 
				ret

			.fbsd_done
				ld  (de), a 	// End of string

				ld  hl, #(TEXT_BUFFER)
				jp  _textbox
		#endasm
	}
#endif

void __FASTCALL__ script (unsigned char a) {
	#asm 
			ld  a, l 
			ld  (_script_n), a 

			ld  a, (_tpx) 
			ld  c, a
			ld  a, (_tpy)
			call qtile_do
			ld  a, l 
			ld  (_tqt), a

			ld  a, 0xff 
			ld  (_script_param), a
			
			call _script_do

			// gpx, gpy may have changed, so update player.x/player.y
			call _shl_player_coords
	#endasm
}

#asm
	XDEF script_bytecode
	XDEF _attr_2
	XDEF qtile_do
	XDEF set_map_tile_do
	XDEF _peta_el_beeper
	XDEF draw_line_of_text
	XDEF _tpx
	XDEF _tpy
	XDEF _tat 
	XDEF _tqt
	XDEF _hotspot_t
	XDEF _scenery_info
	XDEF _do_extern_action

	#ifdef CPC
		XDEF _cpc_UpdateNow
	#endif

	.script_bytecode
		BINARY "script.spt.bin"

	#ifdef ENABLE_ENCODED_TEXT
		.script_encoded_text
			BINARY "text.bin"
	#endif
#endasm
