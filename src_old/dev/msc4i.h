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

extern unsigned char script_n;
extern unsigned char script_result;
extern unsigned char script_tx, script_ty, script_tn;

extern void script_do (void);

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
#endasm
