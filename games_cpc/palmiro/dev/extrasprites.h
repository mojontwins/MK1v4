// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// Extrasprites.h
// Contiene sprites extra para el modo de matar enemigos de MTE MK1
// Sólo se incluirá (tras los sprites) si se define PLAYER_KILLS_ENEMIES
// Copyleft 2010 The Mojon Twins

// Frames extra por si se pueden eliminar los enemigos:

#ifdef ENEMIES_MAY_DIE
	extern unsigned char sprite_17_a []; 
#endif

extern unsigned char sprite_18_a []; 

#ifdef PLAYER_CAN_FIRE
	extern unsigned char sprite_19_a [];
	extern unsigned char sprite_19_b [];
#endif

#ifdef ENABLE_SWORD
	extern unsigned char sprite_sword [];
#endif

#ifdef ENABLE_FRIGOABABOL
	extern unsigned char sprite_frigo [];
#endif

#ifdef ENEMIES_MAY_DIE
	#asm
		._sprite_17_a
			BINARY "sprites_extra.bin"
	#endasm
#endif
			
#asm	
	._sprite_18_a
		defs 96, 0
#endasm

#ifdef PLAYER_CAN_FIRE
	#asm
		._sprite_19_a
			BINARY "sprites_bullet.bin"
	#endasm
#endif

#ifdef ENABLE_SWORD
	#asm
		._sprite_sword
			BINARY "sprites_sword.bin"
	#endasm
#endif

#ifdef ENABLE_FRIGOABABOL
	#asm
		._sprite_frigo
			BINARY "sprites_frigo.bin"
	#endasm
#endif

#define SPRFR_EXPL  sprite_17_a
#define SPRFR_EMPTY sprite_18_a
