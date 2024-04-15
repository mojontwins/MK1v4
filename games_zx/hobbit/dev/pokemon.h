// Pokemon routines for the ending

unsigned char pk_base, pk_iv, pk_effort, pk_level;
unsigned char pk_at, pk_df, pk_pw;
unsigned char pk_turn;
unsigned int pk_temp;

unsigned char pa1, pa2, pa3, pa4;
unsigned char *p_ptr, *p_dst;

unsigned char pk_pl_attack, pk_op_attack;

// ****** STATIC DATA LISTS ******

// Attacks. pk_pw ACCURACY PP FX
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
	._a_growl      defb 0, 255, 40, AFX_LOWER_AT
	               defm "GROWL       "
	._a_tackle     defb 35, 242, 35, AFX_NORMAL
	               defm "TACKLE      "
	._a_leechseed  defb 0, 229, 10, AFX_LEECH
	               defm "LEECH SEED  "
	._a_vinewhip   defb 35, 255, 10, AFX_NORMAL
	               defm "VINE WHIP   "
	._a_scratch    defb 40, 255, 35, AFX_NORMAL
	               defm "SCRATCH     "
	._a_ember      defb 40, 255, 25, AFX_BURN
	               defm "EMBER       "
	._a_leer       defb 0, 255, 30, AFX_LOWER_DF
	               defm "LEER        "
#endasm	               

// Pokemon definitions: 6 bytes stats, 10 bytes name, 8 bytes attack lists
// Stats. order is HP AT DF SP - x
extern unsigned char bubasaur [], charmander [];
#asm
	._bubasaur 
		// Stats 6 bytes
		defb 45, 49, 49, 45, 0, 0
		defm "BUBASAUR  "
		defw _a_growl, _a_tackle, _a_leechseed, _a_vinewhip

	._charmander
		defb 39, 52, 43, 65, 0, 0
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
#define C_RESERVED 5

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

// Reserve 6 bytes for stats HP AT DF SP ST x 
// Reserve 10 byte for name
// Reserve 64 bytes to copy up to 4 attacks. 
// If an pk_at PP == 0xff, pk_at not present (not implemented here)

#asm 
	._pk_data
	._player_stats     defs 6
	._player_name      defs 10
	._player_attacks   defs 64, 0xFF
	._opponent_stats   defs 6 
	._opponent_name    defs 10
	._opponent_attacks defs 64, 0xFF
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

			// 4 bytes of stats to be processed (based upon level, iv, effort)
			// TODO
			ldi 
			ldi 
			ldi 
			ldi 

			// 2 bytes of stats to be set to 0
			ldi
			ldi 

			ld  hl, (_p_ptr)
			ld  bc, 10				// Copy 16 bytes: 6 bytes stats + 10 bytes name
			ldir 					// Do it, now HL -> pointers, DE -> attack pool

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

// Simple menu: Just a cursor >
// _x, _y -> origin
// at1 -> # of options
// On exit: at2 = selected option
void pk_simple_menu (void) {
	at2 = 0; at3 = 1;

	while (1) {
		pad_read ();
		if (pad_this_frame & sp_UP) {
			at2 --; if (at2 > at1) at2 = at1 - 1;
		} 
		if (pad_this_frame & sp_DOWN) {
			at2 ++; if (at2 >= at1) at2 = 0;
		}
		if (pad_this_frame & sp_FIRE) break;
		if (at3 != at2) {
			#asm
				//        /\----------D = 0x47 = attribute (bright white on black)
				ld  de, 0x473F
				//          \/--------E = 0x3F = arrow (char # 63)
				ld  a, (__x)
				ld  c, a 
				ld  a, (__y)
				ld  b, a 
				ld  a, (_at2)
				add b 
				call SPPrintAtInv

				//        /\----------D = 0x00 = attribute (black on black)
				ld  de, 0x0000
				//          \/--------E = 0x00 = blank
				ld  a, (__x)
				ld  c, a 
				ld  a, (__y)
				ld  b, a 
				ld  a, (_at3)
				add b 
				call SPPrintAtInv

				ld  a, (_at2)
				ld  (_at3), a
			#endasm			
		}
	}
}


// Attack cycle

void pk_attack (void) {
	// pa1 is the attacker, 1 - pa1 is the opponent.
	// pa2 is the attack selected
	// pa1 attacks and causes damages and / or starts a status effect

	// If pa1 = 0xff -> pokemon does nothing, return.

	// Put values into pk_level, pk_at, pk_pw, pk_df
}

// AI : Pick up attack -> pk_op_attack

void pk_op_pickup_attack (void) {
	// Don't run more than 8 times. 
	for (at4 = 0; at4 < 8; at4 ++) {
		// 1st select at random
		pk_op_attack = 0xff;
		at1 = rand () & 3;

		// Check if enough PP, if not, next until all four have been checked
		for (at2 = 0; at2 < 4; at2 ++) {
			if (pk_data [OPPONENT_OFFSET + ATTACKS_OFFSET + (at1 << 4) + AT_PP]) {
				pk_op_attack = at1;
				break;
			}
		}

		// All attacks ran out of PP return 0xff
		if (pk_op_attack == 0xff) return;
			
		// 2nd if picked inflicts status effect and player has status effect -> pick another.
		at3 = pk_data [OPPONENT_OFFSET + ATTACKS_OFFSET + (pk_op_attack << 4) + AT_FX];
		if (
			pk_data [C_ST] & at3
		) continue;

		// 3rd 2nd turn, and picked doesn't inflict status effect -> pick another.
		if (at3 == 0 && pk_turn == 1) continue;

		// 4th super effectiveness: ember rather than scratch <- unimplemented, no use in this demo

		// Finally
		return;
	}
}

// Player : Select attack from menu -> pk_pl_attack

void pk_pl_pickup_attack (void) {

}

// Attack cycle

void pk_attack_cycle (void) {
	// Select opponent's attack -> pk_op_attack
	pk_op_pickup_attack ();

	// Select player attack -> pk_pl_attack
	pk_pl_pickup_attack ();

	// Who strikes first? - Fixed for this one. Charmander is faster.

	// Execute attacks in order - check for MISS ofc.
	pa1 = 1; pa2 = pk_op_attack; pk_attack ();
	pa1 = 0; pa2 = pk_pl_attack; pk_attack ();
}
