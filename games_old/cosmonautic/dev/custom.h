// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins


#ifdef PLAYER_CUSTOM_VENG
	void player_custom_veng (void) {
		// Modify vy as needed
	}
#endif

#ifdef PLAYER_CUSTOM_HENG
	void player_custom_heng (void) {
		// Modify vx as needed
	}
#endif

#ifdef PLAYER_CUSTOM_FRAME
	unsigned char player_custom_frame (void) {
		// Return a frame NUMBER (0-7)
		#asm
				ld  c, 0

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_set 

				inc c
				cp  THRUST_UP
				jr  z, m_frame_set 

				inc c
				cp  THRUST_DOWN 
				jr  z, m_frame_set

				inc c

			.m_frame_set
				ld  a, (_player + 22)		// player.facing
				add c 
				ld  h, 0
				ld  l, a 
				ret
		#endasm
	}
#endif

#ifdef PLAYER_CUSTOM_BG_HIT
	unsigned char custom_bg_hit (void) {
		// check hit_v, hit_h and modify player.x / player.y as you need
		// Return 1 if hit registered

		// hit_b has preference
		#asm
				ld  hl, 0

			.m_evil_tile_hit_check_v
				ld  a, (_hit_v)
				or  a 
				jr  z, m_evil_tile_hit_check_h

				ld  hl, (_pvy_total)
				call l_neg 
				ld  (_player + 8), hl 		// player.vy

				ld  hl, 1
				ret

			.m_evil_tile_hit_check_h
				ld  a, (_hit_h)
				or  a
				ret z

				ld  hl, (_pvx_total)
				call l_neg 
				ld  (_player + 6), hl 		// player.vx
				ld  hl, 1
		#endasm
	}
#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		// Runs for each enemy when entering a new screen. You should check _en_t
		// Current malote is malotes [enoffsmasi], iterator is enit
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame
	}

	void extra_enems_checks (void) {
		// This is called at the end of the enems update loop, after collisions
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// with player or bullets have been tested.
	}

	void extra_enems_killed (void) {
		// This is called after enem number enit is killed.
		// _en_t has been already "marked as dead" (OR 128)
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
	}

	unsigned char this_enemy_kills (void) {
		// return 0 for enemies which shouldn't collide.
		// Collide means they will kill the player or get squashed.

		return 1;
	}

#endif
