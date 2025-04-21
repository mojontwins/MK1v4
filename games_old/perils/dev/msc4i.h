// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

#define SC_ENTERING_GAME 0
#define SC_ENTERING_ANY 1
#define SC_PRESS_FIRE_AT_ANY 2
#define SC_PLAYER_GETS_COIN 3
#define SC_PLAYER_KILLS_ENEMY 4
#define SC_ENTERING_SCREEN 8
#define SC_PRESS_FIRE_AT_SCREEN 9

extern unsigned char script_n;
extern unsigned char script_result;

extern void script_do (void);

void do_extern_action (unsigned char n, unsigned char m) {

}

#asm
	.script_bytecode
		BINARY "script.spt.bin"
#endasm
