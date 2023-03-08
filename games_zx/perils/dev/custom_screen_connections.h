// custom_screen_connections.h

unsigned char override_flick_up (void) {
	/*
	if (n_pant >= 72 && n_pant < 84) {
		player.vy = 0; return 1;
	} else return 0;
	*/
	#asm
			ld  hl, 0

			ld  a, (_n_pant)
			cp  72
			ret c

			cp 84
			ret nc 

			ld  (_player + 8), hl 	// player.vy = 0;

			inc hl
			; ret
	#endasm
}

unsigned char override_flick_down (void) {
	return 0;
}

unsigned char override_flick_left (void) {
	/*
	if (n_pant == 84) { 
		n_pant += 11; gpx = 224; player.x = 224<<6; 
		return 1;
	}
	return 0;
	*/
	#asm
			ld  hl, 0

			// First, the hub
			ld  a, (_n_pant)
			cp  72
			jr  nz, ofl_nothub

		.ofl_hub
			ld  hl, 1
			ld  a, l
			ld  (_new_level), a

			ld  a, (_gpy)
			cp  48
			jr  c, jump_level_1

		.jump_level_0
			xor a
			ld  (_level), a
			ret

		.jump_level_1
			ld  a, 1
			ld  (_level), a
			ret

		.ofl_nothub
			cp  84
			ret nz

		.ofl_do
			add 11
			ld  (_n_pant), a 

			ld  a, 224
			ld  (_gpx), a

			ld  hl, #(224*64)
			ld  (_player), hl 		// player.x = 224<<6

			ld  hl, 1
			;ret
	#endasm
}

unsigned char override_flick_right (void) {
	/*
	if (n_pant == 95) { 
		n_pant -= 11; gpx = 0; player.x = 0; 
		return 1;
	}
	return 0;
	*/
	#asm
			ld  hl, 0
			ld  a, (_n_pant)
			cp  72
			jr  nz, ofr_nothub

		.ofr_hub
			ld  hl, 1
			ld  a, l
			ld  (_new_level), a

			ld  a, (_gpy)
			cp  48
			jr  c, jump_level_3

		.jump_level_2
			ld  a, 2
			ld  (_level), a
			ret

		.jump_level_3
			ld  a, 3
			ld  (_level), a
			ret

		.ofr_nothub
			cp  95
			ret nz 

		.ofr_do
			sub 11 
			ld  (_n_pant), a 

			xor a
			ld  (_gpx), a

			ld  (_player), hl 		// player.x = 0

			inc hl
			; ret
	#endasm
}
