// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins

// ---------------------------------------------------------------------------
// Custom stuff we need for our marrullers
// ---------------------------------------------------------------------------

// Very simple marrullers. They appear where you put them and move freely 
// confiend by these boundaries. They also will bounce off obstacles:

// Limits
#define MARRULLER_LEFTMOST   16
#define MARRULLER_TOPMOST    16
#define MARRULLER_RIGHTMOST  208
#define MARRULLER_BOTTOMMOST 128

unsigned char hit_bg;

void marrullers_select_direction (void) {
	#asm
			ld  hl, (_enit)
			ld  h, 0
			ld  de, _en_an_ff
			add hl, de 
			ld  c, (hl)
			xor a 
			sub c 
			ld  b, a 				// b = negative, c = positive speed.
			
			call _rand 				// Doesn't trash BC 
			ld  a, l 
			and 3
			cp  1
			jr  z, msd1 
			cp  2 
			jr  z, msd2 
			cp  3
			jr  z, msd3 

		.msd0	// 0, rdd
			xor a 
			ld  (__en_mx), a 
			ld  a, b
			ld  (__en_my), a 
			ret

		.msd1 	// 0, -rdd
			xor a 
			ld  (__en_mx), a 
			ld  a, c 
			ld  (__en_my), a 
			ret

		.msd2 	// rdd, 0 
			ld  a, c 
			ld  (__en_mx), a
			xor a 
			ld  (__en_my), a 
			ret 

		.msd3 	// -rdd, 0 
			ld  a, b 
			ld  (__en_mx), a
			xor a 
			ld  (__en_my), a 
			ret 
	#endasm
}

// ---------------------------------------------------------------------------

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		// Runs for each enemy when entering a new screen. You should check _en_t
		// Current malote is malotes [enoffsmasi], iterator is enit

		if (_en_t >= 11 && _en_t <= 14) {
			enems_en_an_calc (_en_t - 11);
			
			// Adjust to tile
			#asm 
					ld  a, (__en_x)
					and 0xf0 
					ld  (__en_x), a 
					ld  a, (__en_y)
					and 0xf0 
					ld  (__en_y), a 

					// en_an_ff [enit] = abs (_en_mx + _en_my);

					ld  a, (__en_my) 
					ld  c, a 
					ld  a, (__en_mx)
					add c 
					call _abs_a
					ld  de, (_enit)
					ld  d, 0 
					ld  hl, _en_an_ff
					add hl, de 
					ld  (hl), a
			#endasm
			
		}
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame

		if (_en_t >= 11 && _en_t <= 14) {
			#asm
					xor a 
					ld  (_hit_bg), a 

				// ***************
				// HORIZONTAL AXIS
				// ***************
				.en_marruller_horizontal_axis
					ld  a, (__en_mx)
					or  a
					jr  z, en_marruller_horizontal_axis_done

					// Move: en_x += _en_mx;
					ld  c, a
					ld  a, (__en_x)
					add c 
					ld  (__en_x), a
								
				// Now check horz. boundaries
				.en_marruller_horz_bounds

					// Left of MARRULLER_LEFTMOST
					// if MARRULLER_LEFTMOST >= _en_x
					ld  c, a 
					ld  a, MARRULLER_LEFTMOST
					cp  c
					jr  c, ma_horz_limit_skip_1

					jp _marrullers_select_direction 	// Will ret itself
					
				.ma_horz_limit_skip_1

					// Right of x2
					// _en_x >= MARRULLER_RIGHTMOST
					cp  MARRULLER_RIGHTMOST
					jr  c, ma_horz_limit_skip_2

					jp _marrullers_select_direction 	// Will ret itself

				.ma_horz_limit_skip_2

				.en_marruller_horizontal_axis_done

					call en_bg_collision_horz	// Defined in the engine

				// *************
				// VERTICAL AXIS
				// *************

				.en_marruller_vertical_axis
					ld  a, (__en_my) 
					or  a 
					jr  z, en_marruller_vertical_axis_done

					// Move: _en_y += _en_my;
					ld  c, a
					ld  a, (__en_y)
					add c 
					ld  (__en_y), a

				// Now check vert. boundaries
				.en_marruller_vert_bounds

					// MARRULLER_TOPMOST >= _en_y 
					ld  c, a
					ld  a, MARRULLER_TOPMOST
					cp  c
					jr  c, ma_vert_limit_skip_1

					jp _marrullers_select_direction 	// Will ret itself

				.ma_vert_limit_skip_1

					// _en_y >= MARRULLER_BOTTOMMOST
					cp  MARRULLER_BOTTOMMOST
					jr  c, ma_vert_limit_skip_2

					jp _marrullers_select_direction 	// Will ret itself

				.ma_vert_limit_skip_2		

				.en_marruller_vertical_axis_done

					call en_bg_collision_vert	// Defined in the engine
				
				.en_marruller_done

			#endasm
		}
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

	unsigned char should_collide (void) {
		// return 0 for enemies which shouldn't collide.
		// Collide means they will kill the player or get squashed.

		return 1;
	}

#endif
