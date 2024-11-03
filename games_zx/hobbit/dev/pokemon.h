// Pokemon routines for the ending

void unpack(void);

unsigned char pk_base, pk_iv, pk_effort, pk_level;
unsigned char pk_at, pk_df, pk_pw, pk_accuracy;
unsigned char pk_turn;
unsigned int pk_temp;

unsigned char pa1, pa2, pa3, pa4, pa5, pa6;
unsigned char *p_ptr, *p_dst;

unsigned char pk_pl_attack, pk_op_attack, pk_item;
unsigned char pk_win;

unsigned char *pk_ml1, *pk_ml2;

extern unsigned char s_pokemon [];
#asm
	._s_pokemon
		BINARY "pokemon.bin"
#endasm

// ****** STATIC DATA LISTS ******

// Attacks. PW ACCURACY PP FX
#define AT_DMG 0
#define AT_ACC 1
#define AT_PP 2 
#define AT_FX 3
#define AT_NAME 4

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
		defm "CHRMANDER%"
		defw _a_growl, _a_scratch, _a_ember, _a_leer
#endasm

// Strings (translatable)
unsigned char str_wipe [] = "               "; // 15 spaces
unsigned char str_used [] = " USED";
unsigned char str_failed [] = "BUT FAILED!";
unsigned char str_useless [] = "IT WAS USELESS";
unsigned char str_nomore1[] = "YOU GOT NO";
unsigned char str_nomore2[] = "MORE POKEMONS!";
unsigned char str_leech [] = "LECH SEED SAPS";
unsigned char str_is [] = " IS";
unsigned char str_burn [] ="HURT BY BURN";
unsigned char str_regain [] = "REGAINS HEALTH!";
unsigned char str_infected[] = "WAS INFECTED!";
unsigned char str_burning [] = "IS BURNING!";
unsigned char str_genitive [] = "'S";
unsigned char str_low_def [] = "DEFENSE LOW!";
unsigned char str_low_attack [] = "ATTACK LOW!";

// ****** DYNAMIC (VARIABLE) DATA LISTS ******

// Combatants are HP AT DF SP ST x (6 bytes)
#define C_HP 0
#define C_AT 1
#define C_DF 2
#define C_SP 3
#define C_ST 4
#define C_MAX_HP 5
#define C_NAME 6

// ST is a status effect
// 0 - No status effect
#define AST_CLEAR 0
// 1 - Leech (bit 0)
#define AST_LEECH 1 
// 2 - Burning (bit 1)
#define AST_BURN 2
// 4 - Defence halved
#define AST_LOWER_DF 4
// 8 - Attack halved
#define AST_LOWER_AT 8

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

#define C_HP_OP OPPONENT_OFFSET+C_HP
#define C_MAX_HP_OP OPPONENT_OFFSET+C_MAX_HP

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

#define PK_ATTACK_MENU_X 17
#define PK_ATTACK_MENU_Y 15

#define PK_ATTACK_TB_Y 15

#define PK_BLINK_Y 18
#define PK_BLINK_X 15

#define PK_LIFE_ATTR 68

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

// pa1 is HP, pa2 = MAX_HP
// _x, _y is where
unsigned char pk_display_life (void) {

	pa1 = (pa1 << 3) / pa2;
	
	#asm
			ld  b, 0

		.pk_dl_loop
			push bc 

			// if B >= pa1 -> space, else bar
			ld  de, PK_LIFE_ATTR * 256 + 8 			// attribute + space
			ld  a, (_pa1)
			cp  b 
			jr  nc, pk_dl_nobar

			ld  e, 9 								// bar

		.pk_dl_nobar

			ld  a, (__x)
			ld  c, a 
			inc a 
			ld  (__x), a 
			ld  a, (__y)

			call SPPrintAtInv

			pop bc 
			inc b
			ld  a, b 
			cp  8
			jr  nz, pk_dl_loop

	#endasm
}

unsigned char pk_update_displays (void) {
	// pa1 = pk_data[C_HP + OPPONENT_OFFSET]; pa2 = pk_data[C_MAX_HP + OPPONENT_OFFSET];
	#asm
		ld  ix, _pk_data
		ld  a, (ix + C_HP + OPPONENT_OFFSET)
		ld  (_pa1), a
		ld  a, (ix + C_MAX_HP + OPPONENT_OFFSET)
		ld  (_pa2), a
	#endasm

	_x = 8; _y = 3; pk_display_life ();

	// pa1 = pk_data[C_HP]; pa2 = pk_data[C_MAX_HP];
	#asm
		ld  ix, _pk_data
		ld  a, (ix + C_HP)
		ld  (_pa1), a
		ld  a, (ix + C_MAX_HP)
		ld  (_pa2), a
	#endasm

	#asm 
		ld  a, 12
		ld  (__y), a 

		ld  a, 20
		ld  (__x), a 
		ld  a, (_pa1)
		call draw_2_digits_shortcut

		ld  a, 24
		ld  (__x), a 
		ld  a, (_pa2)
		call draw_2_digits_shortcut
	#endasm


	_x = 18; _y = 11; pk_display_life ();
}

// Simple menu: Just a cursor >
// _x, _y -> origin
// pa1 -> # of options
// On exit: pa2 = selected option
void pk_simple_menu (void) {
	#asm
			// pa2 = 0; pa3 = 1;

			xor a 
			ld  (_pa2), a 
			inc a 
			ld  (_pa3), a

		.pk_simple_menu_loop
			call _pad_read 

			// UP

			ld  a, (_pad_this_frame)
			and sp_UP
			jr  nz, pk_sm_up_done

			ld  a, (_pa1)
			ld  c, a

			ld  a, (_pa2)
			dec a 

			// pa2 > pa1
			cp  c
			jr  c, pk_sm_up_set
			jr  z, pk_sm_up_set

			ld  a, c 
			dec a

		.pk_sm_up_set
			ld  (_pa2), a

		.pk_sm_up_done

			// DOWN

			ld  a, (_pad_this_frame)
			and sp_DOWN
			jr  nz, pk_sm_down_done

			ld  a, (_pa1)
			ld  c, a

			ld  a, (_pa2)
			inc a 

			// pa2 >= pa1
			cp  c 
			jr  c, pk_sm_down_set

			xor a

		.pk_sm_down_set
			ld  (_pa2), a

		.pk_sm_down_done

			// FIRE TO BREAK

			ld  a, (_pad_this_frame)
			and sp_FIRE 
			jr  z, pk_simple_menu_done

			// pa3 != pa2 -> Update

			ld  a, (_pa3)
			ld  c, a 
			ld  a, (_pa2)
			cp  c 
			jr  z, pk_simple_menu_loop

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

			call SPUpdateNow

			jr  pk_simple_menu_loop
		.pk_simple_menu_done
	#endasm
}


void pk_pad_wait (void) {
	#asm
			ld  a, 1
			ld  (_rdb), a

		.pk_pad_wait_loop

			call _pad_read

			ld  a, (_pad_this_frame)
			and sp_FIRE 
			jr  nz, pk_pad_wait_nobreak

			xor a 
			ld  (_rdb), a

		.pk_pad_wait_nobreak

			ld  de, PK_MENU_ATTR * 256

			ld  a, (_rda)
			inc a 
			ld  (_rda), a 

			and 32
			jr  z, pk_pad_wait_skip_arrow

			ld  a, (_rdb) 
			or  a
			jr  z, pk_pad_wait_skip_arrow

			ld  e, 0x3F 							// Arrow

		.pk_pad_wait_skip_arrow
			ld  a, PK_BLINK_Y 
			ld  c, PK_BLINK_X 

			call SPPrintAtInv
			call SPUpdateNow

			ld  a, (_rdb) 
			or  a 
			jr  nz, pk_pad_wait_loop
	#endasm
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

			ld  a, (hl) 				// Save PP
			ld  (_rda), a

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

// Silly secuential printer
unsigned char ssp_x, ssp_y;
void pk_ssp (void) {
	// Prints @ ssp_x, ssp_y with PK_MENU_ATTR
	// from gp_gen to \0
	#asm
			ld  hl, (_gp_gen)
		.pk_ssp_loop
			ld  a, (hl) 

			// Finish when \0
			or  a
			ret z

			cp  '%'
			ret z

			inc hl

			push hl 

			// Send character to output
			sub 32 
			ld  e, a 

			ld  d, PK_MENU_ATTR

			ld  a, (_ssp_x) 
			ld  c, a 
			inc a 
			ld  (_ssp_x), a 
			
			ld  a, (_ssp_y)
			
			call SPPrintAtInv

			halt 
			call SPUpdateNow

			pop hl

			jr  pk_ssp_loop
	#endasm
}

void pk_message (void) {
	#asm
		ld  a, 1 
		ld  (_ssp_x), a 
		ld  a, PK_ATTACK_TB_Y
		ld  (_ssp_y), a 

	// With name: write a name if gp_gen != 0

		ld  hl, (_gp_gen) 
		ld  a, h 
		or  l 
		jr  z, pk_message_name_done

		call _pk_ssp
	.pk_message_name_done

	// Message line 1
		ld  hl, (_pk_ml1)
		ld  a, h 
		or  l 
		jr  z, pk_message_l1_done 

		ld  (_gp_gen), hl 
		call _pk_ssp
	.pk_message_l1_done

	// Message line 2 
		ld  hl, (_pk_ml2)
		ld  a, h 
		or  l 
		jr  z, pk_message_l2_done

		ld  (_gp_gen), hl 
		ld  a, 1 
		ld  (_ssp_x), a 
		ld  a, PK_ATTACK_TB_Y + 2
		ld  (_ssp_y), a 
		call _pk_ssp
	.pk_message_l2_done

		ld  hl, 0
		ld  (_gp_gen), hl

	#endasm
}

void pk_message_wipe (void) {
	#asm 
		ld  hl, _str_wipe
		ld  (_pk_ml1), hl 
		ld  (_pk_ml2), hl

		jr  _pk_message 
	#endasm
}

void pk_message_cycle (void) {
	pk_message ();
	pk_pad_wait ();
	pk_message_wipe ();
}

// Attack cycle

#define OPONENT_STATS pa4
#define ATTACKER_ATTACK pa3
#define ATTACKER_STATS pa5

void pk_attack (void) {
	// Assembly redo attempt 1
	#asm
		// pa1 is the attacker (0 player 1 CPU)
		// pa2 is the selected attack (0-3)

		// Make it so IX points to the ATTACKER
		//            IY points to the OPPONENNT

			ld  a, (_pa1)
			or  a
			jr  nz, pka_CPU_attacks

		.pka_PLA_attacks
			ld  ix, _pk_data
			ld  iy, _pk_data + OPPONENT_OFFSET
			jr  pka_setup_done

		.pka_CPU_attacks
			ld  ix, _pk_data + OPPONENT_OFFSET
			ld  iy, _pk_data

		.pka_setup_done

		// Make an offset to the current attack in BC
		// so BC can be added to IX to get attack stats

			ld  a, (_pa2)

			cp  0xff
			ret z 					// No attack selected

			sla a
			sla a
			sla a
			sla a
			add ATTACKS_OFFSET

			ld  b, 0
			ld  c, a

		// Show what attack pokemon throws!
		// `CHARMANDER USED TAIL WHIP!', for example

			// Get pokemon name
			push ix
			ld  de, C_NAME
			add ix, de
			ld  (_gp_gen), ix
			pop ix
			
			ld  hl, _str_used
			ld  (_pk_ml1), hl

			// Get attack name
			push ix
			add ix, bc 				// IX->attack
			ld  de, AT_NAME
			add ix, de
			ld  (_pk_ml2), ix

			push bc 
			push iy
			call _pk_message_cycle
			pop iy 
			pop bc

			pop ix  				// Get pointer back

			// Put values into pk_accuracy, pk_level, pk_at, pk_pw, pk_df

			// Attack "pw" and "accuracy" are obtained
			// from the selected attack pa2.

			push ix
			add ix, bc 				// IX->attack

			ld  a, (ix + AT_DMG)
			ld  (_pk_pw), a
			ld  a, (ix + AT_ACC)
			ld  (_pk_accuracy), a

			// Decrease attack PP
			dec (ix + AT_PP)

			pop ix

			// iv / effort are fixed for this version, to keep things simple
			
			ld  a, 8
			ld  (_pk_iv), a
			xor a 
			ld  (_pk_effort), a 	
			ld  a, 10
			ld  (_pk_effort), a

			// At / Df come from attacker/defendant stats

			ld  a, (ix + C_AT)
			ld  (_pk_at), a
			ld  a, (iy + C_DF)
			ld  (_pk_df), a

		// STATUS EFFECTS

			// Check C_FX to lower pk_at or pk_df!
			// Attacker:

			ld  a, (ix + C_ST)
			and AFX_LOWER_AT
			jr  z, pka_at_nost

			ld  a, (_pk_at)
			ld  e, a  				// E = pk_at
			srl a 	
			srl a
			ld  d, a 				// D = pk_at >> 2 
			ld  a, e
			sub d
			ld  (_pk_at), a

		.pka_at_nost

			// Defendant:

			ld  a, (iy + C_ST)
			and AFX_LOWER_DF
			jr  z, pka_df_nost

			ld  a, (_pk_df)
			ld  e, a  				// E = pk_df
			srl a 	
			srl a
			ld  d, a 				// D = pk_df >> 2 
			ld  a, e
			sub d
			ld  (_pk_df), a

		.pka_df_nost

		// POKEMON MISS ?

			// Miss if rand() >= pk_accuracy
			call _rand 				// uses HL, DE.
			ld  d, l
			ld  a, (_pk_accuracy)
			ld  e, a 
			ld  a, d 
			cp  e
			jr  c, pka_nomiss

			//  MISS!

			ld  hl, _str_failed
			ld  (_pk_ml1), hl 
			ld  hl, 0
			ld  (_pk_ml2), hl

			// We are returning so no need to save
			call _pk_message_cycle

			ret

		.pka_nomiss

		// INFLICT DAMAGE!
			push bc 
			push ix 
			push iy
			call _pk_calc_damage	// L = Damage
			pop iy 
			pop ix 
			pop bc

			ld  a, (iy + C_HP)		// Opponent HL
			cp  l
			jr  c, pka_hp_zero

			sub l 
			jr  pka_hp_set

		.pka_hp_zero
			xor a 

		.pka_hp_set
			ld  (iy + C_HP), a

		// INFLICT STATUS EFFECTS!

			// Oponent name
			ld  d, 0
			ld  e, C_NAME
			push iy 
			add iy, de
			ld  (_pk_ml1), iy 
			pop iy

			push ix
			add ix, bc 				// IX->attack
			ld  a, (ix + AT_FX)
			pop ix

			cp  AFX_LEECH
			jr  z, pka_fx_leech

			cp  AFX_BURN
			jr  z, pka_fx_burn

			cp  AFX_LOWER_DF
			jr  z, pka_fx_lower_df

			cp  AFX_LOWER_AT
			jr  z, pka_fx_lower_at

		// Nothing to do: return

			ret

		// STATUS EFFECTS DO

		.pka_fx_leech
			// Check if already leeched
			ld  a, (iy + C_ST)
			ld  d, a
			and AST_LEECH
			ret nz

			ld  a, d
			or  AST_LEECH
			ld  (iy + C_ST), a

			// pk_ml1 has already opponent's name

			ld  hl, _str_infected
			ld  (_pk_ml2), hl
			jr  pka_message

		.pka_fx_burn
			// Check if already burnt
			ld  a, (iy + C_ST)
			ld  d, a
			and AST_BURN
			ret nz

			ld  a, d
			or  AST_BURN
			ld  (iy + C_ST), a

			// pk_ml1 has already opponent's name

			ld  hl, _str_burning
			ld  (_pk_ml2), hl
			jr  pka_message

		.pka_fx_lower_df
			ld  a, AST_LOWER_DF
			or  (iy + C_ST)
			ld  (iy + C_ST), a

			// pk_ml1 has already opponent's name
			ld  hl, (_pk_ml1)
			ld  (_gp_gen), hl 

			ld  hl, _str_genitive
			ld  (_pk_ml1), hl

			ld  hl, _str_low_def
			ld  (_pk_ml2), hl
			jr  pka_message

		.pka_fx_lower_at
			ld  a, AST_LOWER_AT
			or  (iy + C_ST)
			ld  (iy + C_ST), a

			// pk_ml1 has already opponent's name
			ld  hl, (_pk_ml1)
			ld  (_gp_gen), hl 

			ld  hl, _str_genitive
			ld  (_pk_ml1), hl

			ld  hl, _str_low_def
			ld  (_pk_ml2), hl

		// Print message & exit

		.pka_message
			call _pk_message_cycle
	#endasm

	/*
	// pa1 is the attacker, 1 - pa1 is the opponent.
	// pa2 is the attack selected

	// pa1 attacks (1 - pa1) with pa2 and inflicts damage and/or effects on (1 - pa1).

	// pa4 points to opponent stats
	OPONENT_STATS = (pa1 == 0 ? OPPONENT_OFFSET : 0);
	ATTACKER_STATS = (pa1 == 0 ? 0 : OPPONENT_OFFSET);

	// p3 poits to the attack selected
	ATTACKER_ATTACK = ATTACKER_STATS + ATTACKS_OFFSET + (pa2 << 4);

	// pa1 attacks and causes damages and / or starts a status effect

	// If pa2 = 0xff && (pa1 == 1 || pk_item = 0xff) -> pokemon does nothing, return.
	if (pa2 == 0xff) {
		// Does nothing
		// Print text
		return;
	}

	// Show what attack pokemon throws!
	// `CHARMANDER USED TAIL WHIP!', for example
	gp_gen = pk_data + ATTACKER_STATS + C_NAME;
	pk_ml1 = str_used;
	pk_ml2 = pk_data + ATTACKER_ATTACK + AT_NAME;
	pk_message_cycle ();

	// Put values into pk_accuracy, pk_level, pk_at, pk_pw, pk_df

	// Attack "pw" and "accuracy" are obtained
	// from the selected attack pa2.

	pk_pw = pk_data [ATTACKER_ATTACK + AT_DMG];
	pk_accuracy = pk_data [ATTACKER_ATTACK + AT_ACC];

	// iv / effort are fixed for this version, to keep things simple
	
	pk_iv = 8;
	pk_effort = 0; 	// Never trained. Bilbos is not a good pokemon trainer!
	pk_level = 10; 	// Both pokemon are level 10.

	// At / Df come from attacker/defendant stats

	pk_at = pk_data [ATTACKER_STATS + C_AT];
	pk_df = pk_data [OPONENT_STATS + C_DF];

	// Decrease attack PP
	pk_data [ATTACKER_ATTACK + AT_PP] --;

	// Check C_FX to lower pk_at or pk_df!
	// Attacker:
	if (pk_data [ATTACKER_STATS + C_ST] & AFX_LOWER_AT) pk_at -= (pk_at >> 2);
	
	// Defendant
	if (pk_data [OPONENT_STATS + C_ST] & AFX_LOWER_DF) pk_df -= (pk_df >> 2);

	// If miss -> pokemon misses! return.
	if (rand () >= pk_accuracy) {
		pk_ml1 = str_failed; pk_ml2 = 0; 
		pk_message_cycle ();
		return;
	}

	// Inflict damage
	// HP AT DF SP ST MAXHP 
	rda = OPONENT_STATS + C_HP;
	pa1 = pk_calc_damage ();
	if (pa1 >= pk_data [rda]) {
		pk_data [rda] = 0;
	} else {
		pk_data [rda] -= pa1;
	}

	// Inflict status effects
	rda = pk_data [ATTACKER_ATTACK + AT_FX]; 			// rda = attack's FX
	rdb = OPONENT_STATS + C_ST; 						// rdb = point to player ST

	if (rda == AFX_LEECH) {
		if(0 == (pk_data [rdb] & AST_LEECH)) {
			pk_data [rdb] |= AST_LEECH;
			pk_ml1 = pk_data + pa4 + C_NAME;
			pk_ml2 = str_infected;
			pk_message_cycle ();
		}
	}

	if (rda == AFX_BURN) {
		if(0 == (pk_data [rdb] & AST_BURN) && rand() < 85) {
			pk_data [rdb] |= AST_BURN;			
			pk_ml1 = pk_data + pa4 + C_NAME;
			pk_ml2 = str_burning;
			pk_message_cycle ();
		}
	}

	if (rda == AFX_LOWER_DF) {
		pk_data [rdb] |= AST_LOWER_DF;
		gp_gen = pk_data + pa4 + C_NAME;
		pk_ml1 = str_genitive;
		pk_ml2 = str_low_def;
		pk_message_cycle ();
	}

	if (rda == AFX_LOWER_AT) {
		pk_data [rdb] |= AST_LOWER_AT;
		gp_gen = pk_data + pa4 + C_NAME;
		pk_ml1 = str_genitive;
		pk_ml2 = str_low_attack;
		pk_message_cycle ();
	}

	*/
}

#define APPLY_STATUS_EFFECTS_ON pa3 
#define APPLY_STATUS_EFFECTS_OTHER pa4
void pk_status_effects (void) {

	#asm
		// pa1 is the attacker (0 player 1 CPU)
		// pa2 is the selected attack (0-3)

		// Make it so IX points to the ATTACKER
		//            IY points to the AFFECTED

		// i.e. IY will receive the status effects
		// which may refrect on IX.

			ld  a, (_pa1)
			or  a
			jr  nz, pks_CPU_attacks

		.pks_PLA_attacks
			ld  ix, _pk_data
			ld  iy, _pk_data + OPPONENT_OFFSET
			jr  pks_setup_done

		.pks_CPU_attacks
			ld  ix, _pk_data + OPPONENT_OFFSET
			ld  iy, _pk_data

		.pks_setup_done

		// The amount of damage made by AST_LEECH
		// or AST_BURN is min(HP / 16, 1). Store in pa1 

			ld  a, (iy + C_HP) 		// Affected HP
			srl a 
			srl a 
			srl a 
			srl a 

			or  a 					// if 0 make it 1
			jr  nz, pks_dmg_store

			inc a 					// 0 -> 1

		.pks_dmg_store
			ld  (_pa1), a

		// Get which status

			ld  a, (iy + C_ST)
			and AST_LEECH
			call nz, pks_leech

			ld  a, (iy + C_ST)
			and AST_BURN
			ret z

		.pks_burn
			// Hurt affected
			ld  a, (_pa1) 			// Damage
			ld  c, a
			ld  a, (iy + C_HP) 		// affected's HP
			sub c
			jr  nc, pks_burn_af_store

			xor a 					// if < 0 -> 0

		.pks_burn_af_store
			ld  (iy + C_HP), a

			// Message name IS / HURT BY BURN
			push iy 
			ld  de, C_NAME
			add iy, de 
			ld  (_gp_gen), iy
			pop iy 

			ld  hl, _str_is
			ld  (_pk_ml1), hl 

			ld  hl, _str_burn 
			ld  (_pk_ml2), hl

			call _pk_message_cycle

			ret

		.pks_leech
			// Hurt affected, give life to opponent

			ld  a, (_pa1) 			// Damage
			ld  c, a
			ld  a, (iy + C_HP) 		// affected's HP
			sub c
			jr  nc, pks_leech_af_store

			xor a 					// if < 0 -> 0

		.pks_leech_af_store
			ld  (iy + C_HP), a

			ld  a, (ix + C_HP) 		// attacker's HP
			add c
			cp  (ix + C_MAX_HP)		// Never surpass mx
			jr  c, pks_leech_at_store

			ld  a, (ix + C_MAX_HP)

		.pks_leech_at_store
			ld  (ix + C_HP), a

			// Message LEECH SEEDS SAP / name
			ld  hl, _str_leech
			ld  (_pk_ml1), hl 

			ld  de, C_NAME
			push iy 
			add iy, de 
			ld  (_pk_ml2), iy
			
			push ix
			call _pk_message_cycle
			pop ix 
			pop iy

			// name / REGAINS HEALTH
			ld  de, C_NAME
			push ix
			add ix, de 
			ld  (_pk_ml1), ix
			
			ld  hl, _str_regain
			ld  (_pk_ml2), hl

			push iy
			call _pk_message_cycle
			pop iy
			pop ix

			ret
	#endasm

	/*
	// pa1 is the attacker, 1 - pa1 is the opponent.
	APPLY_STATUS_EFFECTS_ON = (pa1 == 0 ? 0 : OPPONENT_OFFSET);
	APPLY_STATUS_EFFECTS_OTHER = (pa1 == 0 ? OPPONENT_OFFSET : 0);

	// "XXXX" IS HURT BY THE BURN!
	// "XXXX" IS HURT BY DRENADORAS! (or whatever)

	pa2 = pk_data [APPLY_STATUS_EFFECTS_ON + C_ST]; 		// Cache status effect
	pa1 = pk_data [APPLY_STATUS_EFFECTS_ON + C_HP] >> 4;  	// Damage
	if (pa1 == 0) pa1 = 1; 									// Min damage = 1;

	if(pa2 & AST_LEECH) {
		// Hurt affected, give life to opponent
		pk_data [APPLY_STATUS_EFFECTS_ON + C_HP] -= pa1;
		pk_data [APPLY_STATUS_EFFECTS_OTHER + C_HP] += pa1;

		// Message LECH SEEDS SAP / name
		pk_ml1 = str_leech;
		pk_ml2 = pk_data + APPLY_STATUS_EFFECTS_ON + C_NAME;
		pk_message_cycle ();

		// name / REGAINS HEALTH
		pk_ml1 = pk_data + APPLY_STATUS_EFFECTS_OTHER + C_NAME;
		pk_ml2 = str_regain;
		pk_message_cycle ();
	}

	if(pa2 & AST_BURN) {
		// Hurt affected
		pk_data [APPLY_STATUS_EFFECTS_ON + C_HP] -= pa1;		

		// Message name IS / HURT BY BURN
		gp_gen = pk_data + APPLY_STATUS_EFFECTS_ON + C_NAME;
		pk_ml1 = str_is;
		pk_ml2 = str_burn;
		pk_message_cycle ();
	}
	*/
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

			// pk_item is always useless in this version
			pk_ml1 = str_useless; pk_ml2 = 0; 
			pk_message ();
			pk_pad_wait ();
			pk_message_wipe ();			

			break;

		case 2: // Change pokemon
			// Show you can't
			pk_ml1 = str_nomore1; pk_ml2 = str_nomore2; 
			pk_message ();
			pk_pad_wait();
			pk_message_wipe ();

			break;

		case 3: // RUN!
			pk_ml1 = str_useless; pk_ml2 = 0;
			pk_message ();
			pk_pad_wait ();
			pk_message_wipe ();

			break;
	}

	// Select opponent's attack -> pk_op_attack
	pk_op_pickup_attack ();
	
	// Who strikes first? - Fixed for this one. Charmander is faster.

	// Execute attacks in order - check for MISS ofc.
	// And update displays	
	pa1 = 1; pa2 = pk_op_attack; pk_attack ();
	pk_update_displays ();

	pa1 = 0; pa2 = pk_pl_attack; pk_attack ();
	pk_update_displays ();

	// Execute status effects
	// "XXXX" IS HURT BY THE BURN!
	// "XXXX" IS HURT BY DRENADORAS! (or whatever)
	pa1 = 1; pk_status_effects ();
	pk_update_displays ();

	pa1 = 0; pk_status_effects ();
	pk_update_displays ();

	// Update health displays
}

// Combat
unsigned char pokemon_combat(void) {

	#asm 
		call SPUpdateNow
	#endasm
	asm_int = (unsigned int) (s_pokemon); unpack ();

	pk_win = 0;

	// Init pokemons
	
	pa1 = 0; p_ptr = bubasaur; pk_init_pokemon_pa1_from_ptr ();
	pa1 = 1; p_ptr = charmander; pk_init_pokemon_pa1_from_ptr ();

	// Battle
	while (1) {
		pk_update_displays ();
		pk_attack_cycle ();

		// Player wins!
		if (pk_data [C_HP + OPPONENT_OFFSET] == 0) { pk_win = 1; break; } 
		
		// Player loses!
		if (pk_data [C_HP] == 0) break;
	}

	// Print XXXXX is defeated

	// Back to main control
}
