// Custom animation code

// In this case, the spriteset is:
// 0  1  2  3  4  5  6  7
// R1 R2 R3 RJ L1 L2 L3 LJ
// Add 8 if unlit

{
	#asm
		ld  a, (_player+22)					// player.facing
		or  a
		jr  z, _player_cell_sel_set_rdi		// if A = 0 set 0
		ld  a, 4							// ELSE     set 4
	._player_cell_sel_set_rdi
		ld  (_rdi), a
	#endasm

	// If player is "inside" a building and not lit (i.e. hidden) add 8
	if (inside && player_hidden ()) rdi += 8;

	if (0 == player.possee && 0 == player.gotten) {
		rdd = 3;
	} else {
		if (player.vx == 0) {
			rdd = 1;
		} else {
			rdd = ((gpx + 4) >> 3) & 3;
			if (rdd == 3) rdd = 1;
		}
	}
}

player.next_frame = player_cells [rdi + rdd];
