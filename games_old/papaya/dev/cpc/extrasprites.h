// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// Extrasprites.h
// Contiene sprites extra para el modo de matar enemigos de MTE MK1
// Sólo se incluirá (tras los sprites) si se define PLAYER_KILLS_ENEMIES
// Copyleft 2010 The Mojon Twins

// Frames extra por si se pueden eliminar los enemigos:

#ifdef ENEMIES_MAY_DIE
	extern unsigned char spr_boom []; 
#endif

extern unsigned char spr_empty []; 

#ifdef PLAYER_CAN_FIRE
	extern unsigned char spr_bullet [];
	extern unsigned char spr_bullet_b [];
#endif

#ifdef ENEMIES_MAY_DIE
	#asm
		._spr_boom
			BINARY "sprites_extra.bin"
	#endasm
#endif
			
#asm	
	._spr_empty
		defs 96, 0
#endasm

#ifdef PLAYER_CAN_FIRE
	#asm
		._spr_bullet
			BINARY "sprites_bullet.bin"
	#endasm
#endif

#define SPRFR_EXPL  spr_boom
#define SPRFR_EMPTY spr_empty
