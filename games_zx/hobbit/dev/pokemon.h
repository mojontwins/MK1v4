// Pokemon routines for the ending

// Stats. order is HP AT DF SP

unsigned char base, iv, effort, level;
unsigned char attack, defence, power;
unsigned int scratchpad;

extern unsigned char *bubasaur, *charmander;
#asm
	._bubasaur 
		defb 45, 49, 49, 45

	._charmander
		defb 39, 52, 43, 65

	unsigned char calc_stat (void) {
		scratchpad = ((base << 1) + iv + effort) * level / 100 + 5;
		if (scratchpad > 255) return 255; 
		return scratchpad & 0xff;
	}

	unsigned char calc_hp (void) {
		scratchpad = ((base << 1) + iv + effort) * level / 100 + level + 10;
		if (scratchpad > 255) return 255; 
		return scratchpad & 0xff;
	}

	unsigned char calc_damage (void) {
		scratchpad = (((level << 1) / 5 + 2) * attack * power / defence) / 50 + 2;
		if (scratchpad > 255) return 255; 
		return scratchpad & 0xff;
	}

#endasm

