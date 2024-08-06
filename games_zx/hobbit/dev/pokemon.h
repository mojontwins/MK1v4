// Pokemon routines for the ending

unsigned char pk_base, pk_iv, pk_effort, pk_level;
unsigned char pk_at, pk_df, pk_pw, pk_accuracy;
unsigned char pk_turn;
unsigned int pk_temp;

unsigned char pa1, pa2, pa3, pa4;
unsigned char *p_ptr, *p_dst;

unsigned char pk_pl_attack, pk_op_attack, pk_item;
unsigned char pk_win;

// ****** STATIC DATA LISTS ******

// Attacks. PW ACCURACY PP FX
#define AT_DMG 0
#define AT_ACC 1
#define AT_PP 2 
#define AT_FX 3

// FX is a number:
// 0 - Normal pk_at
#define AFX_NORMAL 0
// 4 - leeches MAX_HP/16 each turn	
#define AFX_LEECH 1
// 3 - 26/256 burn chance
#define AFX_BURN 2		
// 1 - Lowers DF
#define AFX_LOWER_DF 4
// 2 - Lowers AT
#define AFX_LOWER_AT 8		

extern unsigned char a_growl [], a_tackle [], a_leechseed [], a_vinewhip [];
extern unsigned char a_scratch [], a_ember [], a_leer [];

#asm
	._a_list
	// 16 bytes per pk_at definition, last 12 bytes is pk_at name.
	// PW ACCURACY PP FX
	._a_growl      defb 0, 255, 40, AFX_LOWER_AT
	               defm "GROWL%      "
	._a_tackle     defb 35, 242, 35, AFX_NORMAL
	               defm "TACKLE%     "
	._a_leechseed  defb 0, 229, 10, AFX_LEECH
	               defm "LEECH SEED% "
	._a_vinewhip   defb 35, 255, 10, AFX_NORMAL
	               defm "VINE WHIP%  "
	._a_scratch    defb 40, 255, 35, AFX_NORMAL
	               defm "SCRATCH%    "
	._a_ember      defb 40, 255, 25, AFX_BURN
	               defm "EMBER%      "
	._a_leer       defb 0, 255, 30, AFX_LOWER_DF
	               defm "LEER%       "
#endasm	               

// Pokemon definitions: 6 bytes stats, 10 bytes name, 8 bytes attack lists
// Stats. order is HP AT DF SP ST MAXHP
extern unsigned char bubasaur [], charmander [];
#asm
	._bubasaur 
		// Stats 6 bytes
		defb 45, 49, 49, 45, 0, 45
		defm "BUBASAUR% "
		defw _a_growl, _a_tackle, _a_leechseed, _a_vinewhip

	._charmander
		defb 39, 52, 43, 65, 0, 39
		defm "CHARMANDER"
		defw _a_growl, _a_scratch, _a_ember, _a_leer
#endasm

// ****** DYNAMIC (VARIABLE) DATA LISTS ******

// Combatants are HP AT DF SP ST x (6 bytes)
#define C_HP 0
#define C_AT 1
#define C_DF 2
#define C_SP 3
#define C_ST 4
#define C_MAX_HP 5

// ST is a status effect
// 0 - No status effect
#define AST_CLEAR 0
// 1 - Leech (bit 0)
#define AST_LEECH 1 
// 2 - Burning (bit 1)
#define AST_BURN 2
// 4 - Defence halved
#define AST_DEFENCE 4
// 8 - Attack halved
#define AST_ATTACK 8

extern unsigned char pk_data [];

// Reserve 6 bytes for stats HP AT DF SP ST MAXHP 
// Reserve 10 byte for name
// Reserve 64 bytes to copy up to 4 attacks. 
// If an pk_at PP == 0xff, pk_at not present (not implemented here)

#asm 
	._pk_data
	._player_stats         defs 6
	._player_name          defs 10
	._pk_player_attacks    defs 64, 0xFF
	._opponent_stats       defs 6 
	._opponent_name        defs 10
	._opponent_attacks     defs 64, 0xFF
#endasm

#define ATTACKS_OFFSET 16
#define OPPONENT_OFFSET ATTACKS_OFFSET + 64

// So pk_attacks [0] are the player's and pk_attacks [1] are the opponent's

unsigned char pk_calc_stat (void) {
	pk_temp = ((pk_base << 1) + pk_iv + pk_effort) * pk_level / 100 + 5;
	if (pk_temp > 255) return 255; 
	return pk_temp & 0xff;
}

unsigned char pk_calc_hp (void) {
	pk_temp = ((pk_base << 1) + pk_iv + pk_effort) * pk_level / 100 + pk_level + 10;
	if (pk_temp > 255) return 255; 
	return pk_temp & 0xff;
}

unsigned char pk_calc_damage (void) {
	pk_temp = (((pk_level << 1) / 5 + 2) * pk_at * pk_pw / pk_df) / 50 + 2;
	if (pk_temp > 255) return 255; 
	return pk_temp & 0xff;
}

// Inits pokemons

void pk_init_pokemon_pa1_from_ptr (void) {
	// 1.- Generates attack list
	// 2.- Copies & setups stats

	// p_ptr points to a 16 bytes pokemon definition (charmander or bubasaur)
	// pa1 is 0 or 1 (player or opponent), indexing where to copy/setup data

	// iv / effort are fixed for this version, to keep things simple
	pk_iv = 8;
	pk_effort = 0; 	// Never trained. Bilbos is not a good pokemon trainer!
	pk_level = 10; 	// Both pokemon are level 10.

	#asm
		// Copies & setups stats / name
			
			// First point p_dst to the correct attack pool upon pa1
			ld  a, (_pa1) 
			or  a 
			jr  nz, pk_ip_cs_op
			ld  de, _pk_data
			jr  pk_ip_cs
		.pk_ip_cs_op
			ld  de, _pk_data + 16 + 64
		.pk_ip_cs
			// DE -> Stats pool to copy to

			ld  hl, (_p_ptr)

			// 4 bytes of stats to be processed (based upon level, iv, effort)
			// HP AT DF SP MAXHP

			ld  a, (hl)				// Load HP
			inc hl 
			ld  (_pk_base), a
			push hl
			push de 
			call _pk_calc_hp
			ld  a, l
			pop de
			pop hl
			ld  (de), a 			// Store calculated HP
			ld  (_pa1), a 			// Save for later (MAX HP)
			inc de 
			
			ld  a, (hl)				// Load AT
			inc hl 
			ld  (_pk_base), a
			push hl
			push de 
			call _pk_calc_stat
			ld  a, l
			pop de
			pop hl
			ld  (de), a 			// Store calculated AT
			inc de 

			ld  a, (hl)				// Load DF
			inc hl 
			ld  (_pk_base), a
			push hl 
			push de
			call _pk_calc_stat
			ld  a, l
			pop de
			pop hl
			ld  (de), a 			// Store calculated DF
			inc de 

			ld  a, (hl)				// Load SP
			inc hl 
			ld  (_pk_base), a
			push hl 
			push de
			call _pk_calc_stat
			ld  a, l
			pop de
			pop hl
			ld  (de), a 			// Store calculated SP
			inc de 

			ldi  					// Status FX = =

			inc hl 
			ld  a, (_pa1) 
			ld  (de), a 
			inc de 					// MAX HP 

			//ld  hl, (_p_ptr)
			ld  bc, 10				// Copy 10 bytes name
			ldir 					// Do it, now HL -> pointers, DE -> attack pool

			// Populate attacks using attack pointers

			ld  b, 4				// Used to iterate 4 times
		.pk_ip_ca_loop
			push bc 
			push hl  				// Save

			ld  a, (hl) 			// lsb 
			inc hl 
			ld  h, (hl) 
			ld  l, a 				// HL -> attack to copy

			ld  bc, 16				// Copy 16 bytes
			ldir 					// Do it, now DE -> next entry
 
			pop hl 					// Restore hl
			inc hl 
			inc hl  				// Move to next pointer

			pop bc 
			djnz pk_ip_ca_loop
	#endasm
}

#define PK_MENU_ATTR 6*8

#define PK_ATTACK_MENU_X 16
#define PK_ATTACK_MENU_Y 14

// To save code, add 4 dummy bytes so this looks like an attack pool
#ifdef LANG_EN
	unsigned char pk_main_menu [] = {
		"????FIGHT!%     "
		"????USE ITEM%   "
		"????SWAP POKEMON"
		"????RUN%        "
	};

	unsigned char pk_items_menu [] = {
		"????CHICKEN%    "
		"????COCK RING%  "
		"????PENCIL%     "
		"????SYRINGE%    "
	};
#else
	unsigned char pk_main_menu [] = {
		"????ATACAR!%    "
		"????USAR ITEM%  "
		"????OTRO POKEMON"
		"????ESCAPARSE%  "
	};

	unsigned char pk_items_menu [] = {
		"????GALLINA%    "
		"????ANILLO PENE%"
		"????LAPIZ%      "
		"????JERINGUILLA%"
	};
#endif

// Simple menu: Just a cursor >
// _x, _y -> origin
// pa1 -> # of options
// On exit: pa2 = selected option
void pk_simple_menu (void) {
	pa2 = 0; pa3 = 1;

	while (1) {
		pad_read ();
		if ((pad_this_frame & sp_UP) == 0) {
			pa2 --; if (pa2 > pa1) pa2 = pa1 - 1;
		} 
		if ((pad_this_frame & sp_DOWN) == 0) {
			pa2 ++; if (pa2 >= pa1) pa2 = 0;
		}
		if ((pad_this_frame & sp_FIRE) == 0) break;
		if (pa3 != pa2) {
			#asm

				ld  de, PK_MENU_ATTR * 256 + 0x3F   // D = ATTRIBUTE, E = 0x3F (>)
				ld  c, PK_ATTACK_MENU_X
				ld  a, (__y)
				ld  b, a 
				ld  a, (_pa2)
				add b 
				call SPPrintAtInv

				ld  de, PK_MENU_ATTR * 256 	       // D = ATTRIBUTE, E = 0
				ld  c, PK_ATTACK_MENU_X
				ld  a, (__y)
				ld  b, a 
				ld  a, (_pa3)
				add b 
				call SPPrintAtInv

				ld  a, (_pa2)
				ld  (_pa3), a

				call sp_UpdateNow
			#endasm			
		}
	}
}

void pk_print_menu (void) {
	// Preload HL pointing to menu items (or attacks pool)

	#asm
			ld  a, (__y)
			ld  (_rdy), a

			ld  a, PK_ATTACK_MENU_Y
			ld  (_rdy), a 

			ld  b, 4 					// 4 menu itmes
		.pk_pa_loop
			push bc 

			inc hl
			inc hl
			inc hl
			inc hl 						// Skip attack values

			ld  a, PK_ATTACK_MENU_X

			// Insert space first
			ld  d, PK_MENU_ATTR
			ld  e, 0
			ld  c, a 
			inc a 
			ld  (__x), a
			ld  a, (_rdy)
			push hl 
			call SPPrintAtInv
			pop hl 


			ld  b, 12 					// 12 characters
		.pk_pa_can
			push bc 

			ld  a, (hl) 				// E = Get char
			sub 32
			ld  e, a
			inc hl 
			
			ld  d, PK_MENU_ATTR			// D = Attribute

			ld  a, (__x)
			ld  c, a 					// C = X
			inc a 
			ld  (__x), a 

			ld  a, (_rdy) 				// A = Y

			push hl 
			call SPPrintAtInv
			pop hl 	

			pop bc 
			djnz pk_pa_can

			ld  a, (_rdy)
			inc a 
			ld  (_rdy), a

			pop bc 
			djnz pk_pa_loop

			call SPUpdateNow
	#endasm	
}

// Shows all attacks stacked for the player (to be used as a menu)
void pk_print_attacks (void) {
	#asm
			ld  hl, _pk_player_attacks
			jp  _pk_print_menu
	#endasm

}

// Shows main menu
void pk_print_main_menu (void) {
	#asm
			ld  hl, _pk_main_menu
			jp  _pk_print_menu
	#endasm
}

// Shows dummy items menu
void pk_print_items_menu (void) {
	#asm
			ld  hl, _pk_items_menu
			jp  _pk_print_menu
	#endasm
}

// Attack cycle

void pk_attack (void) {
	// pa1 is the attacker, 1 - pa1 is the opponent.
	// pa2 is the attack selected
	// pa1 attacks and causes damages and / or starts a status effect

	// ** ITEM **
	// If pa1 == 0, pk_item != 0xff -> Use item (useless)

	if (pa1 == 0 && pk_item != 0xff) {
		// Use item but fails
		// Print text
		return;
	}

	// If pa2 = 0xff && (pa1 == 1 || pk_item = 0xff) -> pokemon does nothing, return.
	if (pa2 == 0xff) {
		// Does nothing
		// Print text
		return;
	}

	// Show what attack pokemon throws!
	// `CHARMANDER USED TAIL WHIP!', for example

	// Put values into pk_accuracy, pk_level, pk_at, pk_pw, pk_df

	// Attack "pw" and "accuracy" are obtained
	// from the selected attack pa2.

	pa4 = (pa1 == 1 ? OPPONENT_OFFSET : 0);
	pa3 = pa4 + ATTACKS_OFFSET + (pa2 << 4);

	pk_pw = pk_data [pa3 + AT_DMG];
	pk_accuracy = pk_data [pa3 + AT_ACC];

	// iv / effort are fixed for this version, to keep things simple
	
	pk_iv = 8;
	pk_effort = 0; 	// Never trained. Bilbos is not a good pokemon trainer!
	pk_level = 10; 	// Both pokemon are level 10.

	// At / Df come from attacker/defendant stats

	pk_at = pk_data [pa4 + C_AT];
	pk_df = pk_data [OPPONENT_OFFSET - pa4 + C_DF];

	// If miss -> pokemon misses! return.
	if (rand () >= pk_accuracy) {
		// `BUT FAILED!`
		return;
	}

	// Inflict damage
	// HP AT DF SP ST MAXHP 
	pa3 = C_HP + (pa1 ? OPPONENT_OFFSET : 0);
	pa1 = pk_calc_damage ();
	if (pa1 >= pk_data [pa3]) {
		pk_data [pa3] = 0;
	} else {
		pk_data [pa3] -= pa1;
	}
}

// AI : Pick up attack -> pk_op_attack

void pk_op_pickup_attack (void) {
	// Don't run more than 8 times. 
	for (pa4 = 0; pa4 < 8; pa4 ++) {
		// 1st select at random
		pk_op_attack = 0xff;
		pa1 = rand () & 3;

		// Check if enough PP, if not, next until all four have been checked
		for (pa2 = 0; pa2 < 4; pa2 ++) {
			if (pk_data [OPPONENT_OFFSET + ATTACKS_OFFSET + (pa1 << 4) + AT_PP]) {
				pk_op_attack = pa1;
				break;
			}
		}

		// All attacks ran out of PP return 0xff
		if (pk_op_attack == 0xff) return;
			
		// 2nd if picked inflicts status effect and player has status effect -> pick another.
		pa3 = pk_data [OPPONENT_OFFSET + ATTACKS_OFFSET + (pk_op_attack << 4) + AT_FX];
		if (
			pk_data [C_ST] & pa3
		) continue;

		// 3rd 2nd turn, and picked doesn't inflict status effect -> pick another.
		if (pa3 == 0 && pk_turn == 1) continue;

		// 4th super effectiveness: ember rather than scratch <- unimplemented, no use in this demo

		// Finally
		return;
	}
}

// Player : Select attack from menu -> pk_pl_attack

void pk_pl_pickup_attack (void) {
	_x = PK_ATTACK_MENU_X;
	_y = PK_ATTACK_MENU_Y;
	pk_print_attacks ();
	pa1 = 4;
	pk_simple_menu ();
	pk_pl_attack = pa2;
}

// Attack cycle

void pk_attack_cycle (void) {
	// Show main menu
	pk_item = 0xff;
	pk_pl_attack = 0xff;

	_x = PK_ATTACK_MENU_X;
	_y = PK_ATTACK_MENU_Y;
	pk_print_main_menu ();
	pa1 = 4;
	pk_simple_menu ();

	switch (pa2) {
		case 0: // Attack
			// Select player attack -> pk_pl_attack
			pk_pl_pickup_attack ();
			
			break;
		case 1: // Item
			pk_print_items_menu ();
			pa1 = 4;
			pk_simple_menu ();

			pk_item = pa2; 
			break;

		case 2: // Change pokemon
			// Show you can't
			break;

		case 3: // RUN!
			// Show you can't
			break;
	}

	// Select opponent's attack -> pk_op_attack
	pk_op_pickup_attack ();
	
	// Who strikes first? - Fixed for this one. Charmander is faster.

	// Execute attacks in order - check for MISS ofc.
	pa1 = 1; pa2 = pk_op_attack; pk_attack ();
	pa1 = 0; pa2 = pk_pl_attack; pk_attack ();

	// Execute status effects
	// "XXXX" IS HURT BY THE BURN!
	// "XXXX" IS HURT BY DRENADORAS! (or whatever)

	// Update health displays
}

// Combat
unsigned char pokemon_combat(void) {
	pk_win = 0;

	// Init pokemons
	
	pa1 = 0; p_ptr = bubasaur; pk_init_pokemon_pa1_from_ptr ();
	pa1 = 1; p_ptr = charmander; pk_init_pokemon_pa1_from_ptr ();

	// Battle
	while (1) {
		pk_attack_cycle ();

		// Player wins!
		if (pk_data [C_HP + OPPONENT_OFFSET] == 0) { pk_win = 1; break; } 
		
		// Player loses!
		if (pk_data [C_HP] == 0) break;
	}

	// Print XXXXX is defeated

	// Back to main control
}
