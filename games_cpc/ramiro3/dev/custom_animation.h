// Custom animation code

// In this case, the spriteset is:
// 1  2  3  4  5  6  7  8  9  10
// R1 R2 R3 RJ RH L1 L2 L3 LJ LH

{
	#asm
		ld  a, (_player+22)					// player.facing
		or  a
		jr  z, _player_cell_sel_set_rdi		// if A = 0 set 0
		ld  a, 5							// ELSE     set 5
	._player_cell_sel_set_rdi
		ld  (_rdi), a
	#endasm

	if (0 == player.possee && 0 == player.gotten) {
		rdd = 3 + player.hovering;
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
