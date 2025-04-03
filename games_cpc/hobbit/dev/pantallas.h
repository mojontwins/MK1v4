// MTE MK1 v4.10
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// pantallas.h
// Includes the binary of the aplib-compressed static screens.
// title.bin, marco.bin (if suited) and ending.bin should be
// in the same directory.

extern unsigned char s_title [];
extern unsigned char s_marco [];
extern unsigned char s_ending [];

#ifndef NO_COMPRESSED_TITLE_SCR
#asm
	._s_title
		BINARY "titlec.bin"
	._s_marco
#endasm
#endif
#ifndef DIRECT_TO_PLAY
	#asm
			BINARY "marcoc.bin"
	#endasm
#endif
#ifndef NO_COMPRESSED_ENDING_SCR
#asm
	._s_ending
		BINARY "endingc.bin"
#endasm
#endif

#asm
	.str_gameover
		defm "GAME OVER!"
		defb 0
#endasm

void blackout (void) {
	rda = BLACK_COLOUR_BYTE;
	#asm
			ld  a, 0xc0
		.bo_l1
			ld  h, a
			ld  l, 0
			ld  b, a
			ld  a, (_rda)
			ld  (hl), a
			ld  a, b
			ld  d, a
			ld  e, 1
			ld  bc, 0x5ff
			ldir

			add 8
			jr  nz, bo_l1
	#endasm
}

void title_screen (void) {
	blackout ();
	//unpack ((unsigned int) (s_title), BASE_SUPERBUFF);
	#asm
			ld  hl, _s_title
			ld  de, BASE_SUPERBUFF
			call depack
	#endasm
	draw_text (11, 13, "1 KEYBOARD");
	draw_text (11, 14, "2 JOYSTICK");

	cpc_UpdScr ();
	cpc_ShowTileMap (1);

	AY_PLAY_MUSIC (0);

	#asm
		.title_loop
			call _pad_read 
			
			ld  a, (_pad_this_frame) 
			and sp_AUX3 
			jr  nz, title_not_aux3

			ld  hl, _def_keys
			jr  copy_keys_to_extern
			
		.title_not_aux3

			ld  a, (_pad_this_frame) 
			and sp_AUX4
			jr  nz, title_loop

			ld  hl, _def_keys_joy
	
		// Copy keys to extern 
	
		.copy_keys_to_extern
			ld  de, cpc_KeysData + 12
			ld  bc, 24
			ldir
	#endasm

	AY_STOP_SOUND ();
}

void game_ending (void) {
	blackout ();
	
	// Using a custom for this
	#asm
			call cpc_ResetTouchedTiles
			ld  hl, _decos_ending 
			ld  (_gp_gen), hl 
			call _draw_decos
	#endasm

	draw_text (8, 8, "SOY RICO POTRICO");
	draw_text (8, 16, "ESTA NOCHE PAJA!");
	cpc_UpdateNow (0);			
	
	AY_PLAY_MUSIC (9);
	espera_activa (5000);
	AY_STOP_SOUND ();
}

void game_over (void) {
	AY_PLAY_MUSIC (8);

	#asm
			call _recuadrius

			ld  a, 11
			ld  (__x), a 
			ld  a, 14
			ld  (__y), a 
			ld  a, 7
			ld  (__n), a 
			ld  hl, str_gameover
			call draw_text_loop

			ld hl, _pokemon_tiles
			call _set_ts

			xor a 
			ld  (_rda), a 		// offset			
			
			// Paint
			ld  a, 6
			ld  (_psk), a
			ld  a, 12
			ld  (__x), a 
			ld  a, 8
			ld  (__y), a 
			ld  a, 3
			ld  (__n), a 

			call _pk_portrait
	#endasm

	AY_PLAY_MUSIC (7);

	rdb = wyz_beat_ct;
	rdc = 32; 			// Skip # notes before dance!
	
	#asm
		.gameover_loop
			ld  a, (_rdb) 
			ld  c, a 
			ld  a, (_wyz_beat_ct);
			cp  c 
			jr  z, gameover_animate_done 			// No new note

			ld  (_rdb), a 					// Update local counter

		.gameover_animate

			// Erase
			ld  a, (_rda)
			ld  c, a 
			
			ld  a, 6
			ld  (_psk), a
			ld  a, 12
			sub c
			ld  (__x), a 
			ld  a, 8
			ld  (__y), a 
			ld  a, 2
			ld  (__n), a 

			call _pk_portrait

			// Flip Flop dx
			ld  a, (_rda)
			ld  c, a 

			ld  a, (_rdc)
			or  a 
			jr  z, gameover_animate_do

			dec a 
			ld  (_rdc), a 
			jr  gameover_animate_paint
			
		.gameover_animate_do
			ld  a, 1
			sub c 
			ld  (_rda), a 
			ld  c, a 

		.gameover_animate_paint

			// Paint
			ld  a, 6
			ld  (_psk), a
			ld  a, 12
			sub c
			ld  (__x), a 
			ld  a, 8
			ld  (__y), a 
			ld  a, 3
			ld  (__n), a 

			call _pk_portrait

		.gameover_animate_done

	#endasm
	cpc_UpdateNow (0);
		
	#asm
		// Break on key
		call _pad_read 
		ld  a, (_pad_this_frame)
		inc a
		jp z, gameover_loop
	#endasm

	AY_PLAY_MUSIC (8);

	#asm
		ld hl, _tilesetc
		call _set_ts
		call _recuadrius
	#endasm

}
