// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

#define SC_ENTERING_GAME 0
#define SC_ENTERING_ANY 1
#define SC_PRESS_FIRE_AT_ANY 2
#define SC_PLAYER_GETS_COIN 3
#define SC_PLAYER_KILLS_ENEMY 4
#define SC_SPECIAL_TILE_TOUCHED 5
#define SC_ENTERING_SCREEN 8
#define SC_PRESS_FIRE_AT_SCREEN 9

extern unsigned char script_n;
extern unsigned char script_result;
extern unsigned char script_tx, script_ty, script_tn;

extern void script_do (void);

void do_extern_action (unsigned char n, unsigned char m) {

}

void __FASTCALL__ script (unsigned char a) {
	#asm 
			ld  a, l 
			ld  (_script_n), a 

			ld  a, (_gpx)
			add 8
			srl a 
			srl a 
			srl a 
			srl a 
			ld  (_script_tx), a
			ld  c, a 

			ld  a, (_gpy)
			add 8
			srl a 
			srl a 
			srl a 
			srl a 
			ld  (_script_ty), a

			call qtile_do
			ld  a, l 
			ld  (_script_tn), a

			jp _script_do
	#endasm
}

#asm
	XDEF script_bytecode
	XDEF _attr_2
	XDEF qtile_do
	XDEF set_map_tile_do
	XDEF _peta_el_beeper
	#ifdef CPC
		XDEF _cpc_UpdateNow
	#endif
	XDEF draw_line_of_text

	.script_bytecode
		BINARY "script.spt.bin"
#endasm
