// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins


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
		#asm
				ld  c, 1 					// AIRBORNE
				
				// if player.possee == 0 && player.gotten == 0
				ld  a, (_player + 26) 		// player.possee 
				ld  b, a 
				ld  a, (_player + 25) 		// player.gotten 
				or  b
				jr  z, m_frame_set

			.m_frame_on_something

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_still 		// Not thrusting -> still

				ld  hl, (_player + 6) 		// player.vx
				ld  a, h 
				or  l 
				jr  z, m_frame_still 		// Not moving -> still

				ld  a, (_gpx)
				srl a 
				srl a 
				srl a 

				// Cycle cells 1 2 3 1 2 3 ...

				// de / hl, module in de 
				ld  d, 0 
				ld  e, a 
				ld  hl, 3 
				call l_div_u
				ld  c, e 					// (_gpx >> 3) % 3
				inc c 						// + 1

				jr  m_frame_set

			.m_frame_still
				ld  c, 0 					(// IDLE))

			.m_frame_set
				ld  a, (_player + 22) 		// player.facing
				add c

				ld  h, 0
				ld  l, a 					// Return value
		#endasm 
	}
#endif

#ifdef PLAYER_CUSTOM_BG_HIT
	unsigned char custom_bg_hit (void) {
		// check hit_v, hit_h and modify player.x / player.y as you need
		// Return 1 if hit registered
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

		// Viejo no mata.
		if (_en_t == 1) return 0;

		return 1;
	}

#endif

#ifdef ENABLE_CUSTOM_HOTSPOTS
	unsigned char custom_hotspots() {
		// hotspot type is hotspot_t.
		// set rdi to prevent clearing the hotspot.
	}
#endif
