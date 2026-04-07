// MTE MK1 v3.2
// Copyleft 2011 by The Mojon Twins


#ifdef PLAYER_CUSTOM_VENG
	void player_custom_veng (void) {
		// Modify vy as needed

		// For this game, we use the normal sideways jumping engine if n_pant < 40,
		// and a new, custom one for 40<=n_pant<60.

		if (n_pant < 40) {
			// Vanilla

			// Apply gravity
		
			#asm
				.m_vert_gravity_do
					ld  hl, (_player + 8) 			// player.vy
					ld  de, PLAYER_G 
					add hl, de 

					ld  de, PLAYER_MAX_VY_CAYENDO 

					// if PLAYER_MAX_VY_CAYENDO < player.vy
					call l_lt 						// C set if DE < HL 
					jr  nc, m_vert_gravity_done

					ex  de, hl 						// HL = PLAYER_MAX_VY_CAYENDO

				.m_vert_gravity_done
					ld  (_player + 8), hl 
			#endasm 

			// Make jump
		
			#asm

					ld  a, (_pad_this_frame)

					#ifdef PLAYER_CAN_FIRE
						and sp_UP
						jr  nz, m_jump_start_done
					#else
						and #(sp_UP | sp_FIRE)
						cp  #(sp_UP | sp_FIRE)
						jr  z, m_jump_start_done
					#endif

					ld  a, (_player + 19)		// player.saltando 
					or  a
					jr  nz, m_jump_start_done 

					ld  a, (_player + 26) 		// player.possee 
					ld  c, a 
					ld  a, (_player + 25) 		// player.gotten 
					or  c
					jr  z, m_jump_start_done 

					ld  (_player + 19), a  		// player.saltando
					xor a 
					ld  (_player + 14), a  		// player.cont_salto

					ld  l, 3 
					call _peta_el_beeper
				.m_jump_start_done

					ld  a, (_pad0)
					#ifdef PLAYER_CAN_FIRE
						and sp_UP
						jr  nz, m_jump_perform_not_pressing
					#else
						and #(sp_UP | sp_FIRE)
						cp  #(sp_UP | sp_FIRE)
						jr  z, m_jump_perform_not_pressing
					#endif

					ld  a, (_player + 19) 		// player.saltando
					or  a 
					jr  z, m_jump_perform_done

					// player.vy -= (PLAYER_VY_INICIAL_SALTO + PLAYER_INCR_SALTO - (player.cont_salto >> 1));
					ld  a, (_player + 14) 		// player.cont_salto
					srl a
					ld  d, 0 
					ld  e, a 
					ld  hl, PLAYER_VY_INICIAL_SALTO + PLAYER_INCR_SALTO
					sbc hl, de 
					ex  de, hl 
					ld  hl, (_player + 8) 		// player.vy 
					sbc hl, de 

					// if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
					// if (-PLAYER_MAX_VY_SALTANDO > player.vy) ...
					ld  de, -PLAYER_MAX_VY_SALTANDO
					call l_gt 
					jr  nc, m_jump_perform_write_vy

					ex  de, hl 					// HL = -PLAYER_MAX_VY_SALTANDO

				.m_jump_perform_write_vy
					ld  (_player + 8), hl 		// player.vy 

					ld  a, (_player + 14) 		// player.cont_salto
					inc a 
					ld  (_player + 14), a 
					cp  8
					jr  c, m_jump_perform_done 

				.m_jump_perform_not_pressing
					xor a 
					ld  (_player + 19), a 		// player.saltando

				.m_jump_perform_done

			#endasm

			// Jump down platform

			#asm
					ld  a, (_pad0)
					and sp_DOWN
					ld  a, 0
					jr  nz, m_vert_jump_down_done

					ld  hl, PLAYER_VY_INICIAL_SALTO
					ld  (_player + 8), hl 		// player.vy

					inc a 

				.m_vert_jump_down_done
					ld  (_disable_collide_platform), a
			#endasm

		} else {
			// DX Swim

			// TODO
		}
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

		if (n_pant < 40) {
			// Normal

			#asm
					ld  c, 3 
					
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

					and 1 
					ld  h, 0 
					ld  l, a 
					ld  de, _player_walk_cycle 
					add hl, de 
					ld  c, (hl)

					jr  m_frame_set

				.m_frame_still
					ld  c, 1

				.m_frame_set
					ld  a, (_player + 22) 		// player.facing
					add c
					ld  (_player + 20), a 		// flayer.frame
			#endasm 
		} else {
			// DX Swim 

		}
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
		if (_en_t >= 5  && _en_t < 8)  {
			enems_en_an_calc (_en_t - 1);
		}
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame
		if (_en_t >= 5 && _en_t < 8) {
			#asm
				call en_lineal_do
			#endasm

			if (_en_t == 7) {
				// Look right if going right
				if (_en_mx > 0 || _en_my > 0) {
					// en_an_next_frame [enit] = sprite_cells [en_an_base_frame [enit] + en_an_frame [enit] + 2];
					#asm
							ld  a, (_enit)
							sla a
							ld  b, 0
							ld  c, a
							ld  hl, _en_an_next_frame
							add hl, bc
						
							push hl 		// en_an_next_frame [enit]
							
							ld  bc, (_enit)
							ld  b, 0
							
							ld  hl, _en_an_frame
							add hl, bc
							ld  a, (hl)

							ld  hl, _en_an_base_frame
							add hl, bc
							add a, (hl)
							add 2 			// + 2

							sla a 			// This will work in 8 bit. Always few frames max.			
							ld  c, a 		// B is already 0
							ld  hl, _sprite_cells

							add hl, bc 		// HL -> sprite_cells [...]
							pop de 			// DE -> en_an_next_frame [enit]

							ldi
							ldi
					#endasm
				}
			}
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

	unsigned char this_enemy_kills (void) {
		// return 0 for enemies which shouldn't collide.
		// Collide means they will kill the player or get squashed.

		return 1;
	}

#endif
