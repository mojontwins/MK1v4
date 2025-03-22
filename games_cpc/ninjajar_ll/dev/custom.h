// MTE MK1 v4.10
// Copyleft 2010-2013, 2020-2024 by The Mojon Twins

// Add here your custom routines & vars

// ***********************
// STORAGE FOR MULTI LEVEL
// ***********************

// What you need:
// An empty `enems.h` with enough space.
// A set of RLE'd maps in binary format.
// A set of ZX0'd tilesets, not including the font.
// A set of ZX0'd spritesets, just the enemies part.
// A set of ZX0'd enems+hotspots.
// Arrays of behs.

// Stuff to check if this goes haywire: 
// 1.- Are your compressed enemies in the right format? 

#define TS_SIZE 16 						// # of tiles in your tilesets 

unsigned char level;
unsigned char new_level;

// RLE'd maps will be accessed directly using custom_map_pointer_calculator

extern unsigned char map0 [0];
extern unsigned char map1 [0];
extern unsigned char map2 [0];

#asm
	._map0 
		BINARY "mapa0.map.bin"
	._map1
		BINARY "mapa1.map.bin"
	._map2
		BINARY "mapa2.map.bin"
#endasm

unsigned char *maps [] = { map0, map1, map2 };

// Compressed enems / hotspots

extern unsigned char enems_hotspots0 [0];
extern unsigned char enems_hotspots1 [0];
extern unsigned char enems_hotspots2 [0];

#asm 
	._enems_hotspots0 
		BINARY "enems_hotspots0c.bin"
	._enems_hotspots1
		BINARY "enems_hotspots1c.bin"
	._enems_hotspots2 
		BINARY "enems_hotspots2c.bin"
#endasm 

unsigned char *enems_hotspotss [] = { enems_hotspots0, enems_hotspots1, enems_hotspots2 };

// Tile behaviours for each level
// LDIR this to `_comportamiento_tiles`

unsigned char ts0_behs [] = { 0,0,0,8,8,8,8,0,0,0,0,136,136,136,1,1 };
unsigned char ts1_behs [] = { 0,0,0,40,41,8,8,8,8,8,136,136,136,1,1,4 };
unsigned char ts2_behs [] = { 0,8,8,0,0,0,0,0,4,8,136,136,136,1,1,0 };
unsigned char *ts_behs [] = { ts0_behs, ts1_behs, ts2_behs };

// Compressed TS graphics

extern unsigned char ts0 [0];
extern unsigned char ts1 [0];
extern unsigned char ts2 [0];

#asm
	._ts0 
		BINARY "work0c.bin"
	._ts1
		BINARY "work1c.bin"
	._ts2
		BINARY "work2c.bin"
#endasm

unsigned char *tss [] = { ts0, ts1, ts2 };

// Compressed SS graphics (enemy cells)

extern unsigned char ss0 [0];
extern unsigned char ss1 [0]; 

#asm
	._ss0 
		BINARY "ss0c.bin"
	._ss1
		BINARY "ss1c.bin"
#endasm

unsigned char *sss [] = { ss0, ss1, ss1 };

// Level dimensions

unsigned char l_map_w [] = { 10, 10, 12 };
unsigned char l_map_h [] = { 2, 2, 1 };
unsigned char l_scr_ini [] = { 0, 0, 0 };
unsigned char l_ini_x [] = { 2, 2, 2 };
unsigned char l_ini_y [] = { 2, 2, 2 };

unsigned char map_w, map_h;

// Helper

#asm
	// SRC collection in HL
	// Uses `level`
	.get_pointer_from_array
		ld  a, (_level) 
	.get_pointer_from_array_hijack
		sla a 
		ld  b, 0 
		ld  c, a 
		add hl, bc
		
		ld  a, (hl)
		inc hl 
		ld  h, (hl)
		ld  l, a 

		// Now HL points to the collection item
		ret

	// SRC collection in HL, 
	// Uses `level`
	// DST in DE
	.depack_asset
		call get_pointer_from_array 
		call depack
		ret 
#endasm

#ifdef ENABLE_CODE_HOOKS

	// Hooks

	void hook_system_inits (void) {
	}

	void hook_init_game (void) {
		level = 0; 
		new_level = 1;					// Force new level
	}

	void hook_init_mainloop (void) {
		if (new_level) {
			new_level = 0;

			// TODO : LEVEL XXX SCREEN

			map_w = l_map_w [level];
			map_h = l_map_h [level];

			n_pant = l_scr_ini [level];
			on_pant = 0xff;

			// I've tricked the engine via defines, PLAYER_INI_X / Y are defined to read the arrays.
			init_player_values ();

			// Decompress stuff
			#asm
					ld  hl, _tss
					ld  de, _tspatterns
					call depack_asset

					ld  hl, _sss
					ld  de, _sprites + 512 
					call depack_asset
			
					ld  hl, _enems_hotspotss 
					ld  de, _malotes
					call depack_asset 						

					ld  hl, _ts_behs
					call get_pointer_from_array 
					ld  de, _comportamiento_tiles
					ld  bc, TS_SIZE
					ldir
			#endasm 
		}
	}

	void hook_mainloop (void) {
	}

	void hook_entering (void) {		
	}

	void hook_hotspots (void) {	
	}

	int hook_game_over (void) {
		// Do your shit then return 1 for normal game over.
		return 1;
	}

#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
	}

	void extra_enems_move (void) {		
	}

	void extra_enems_checks (void) {
	}

	void extra_enems_killed (void) {
	}
	
#endif

#ifdef ENABLE_CUSTOM_LINEAR_ENEM_CELLS
	unsigned char get_cell_n (void) {
		// Change this:
		return _en_t - 1;
	}
#endif

#ifdef ENEMS_CUSTOM_COLLISION
	unsigned char enems_custom_collision (void) {
		return 0;
	}
#endif

#ifdef CUSTOM_MAP_POINTER_CALCULATOR
	void custom_map_pointer_calculator (void) {
		// custom calculate gp_gen based on n_pant (and level, etc...)
		// to point to the screen that's to be rendered.

		#asm
			._draw_scr_get_scr_address
				ld  hl, _maps
				call get_pointer_from_array				// HL = current map address

				push hl 								// Save map address

				ld  a, (_n_pant)
				call get_pointer_from_array_hijack		// HL = current screen offset

				pop de 									// Retrieve map address
				
				add hl, de      						// Add offset to get screen address

				ld  (_gp_gen), hl
		#endasm
	}

#endif

#ifdef CUSTOM_FLICK_SCREEN_HANDLER
	void custom_flick_screen_handler (void) {
	 	// Changes n_pant when it's needed.
	 	// Substitutes normal flick screen code. Use for multilevel, etc.

	 	// TODO
	 }

#endif