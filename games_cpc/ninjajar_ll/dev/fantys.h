// MTE MK1 v4.11
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// fantys.h

// The new fantys! (In fact, the good ol' fantys, but in assembly and better organized)

#asm 	
	#ifdef USE_TYPE_6
		// Is this enemy a fanty?

			ld  a, (__en_t)
			cp  6
			jp  nz, fantys_end
	#endif

	// We'll need distance
	#if defined USE_TYPE_6 && defined USE_SIGHT_DISTANCE
		.fantys_calc_distance
			ld  a, (__en_x) 
			ld  (_cx1), a 
			ld  a, (__en_y)
			ld  (_cy1), a 
			ld  a, (_gpx)
			ld  (_cx2), a 
			ld  a, (_gpy)
			ld  (_cy2), a 
			call _distance 
			ld  a, l 
			ld  iyl, a
	#endif

	#ifdef PLAYER_CAN_HIDE
			call _player_hidden 
			ld  a, l 
			ld  iyh, a

		#ifdef RANDOM_RESPAWN
				// Self modifying code.
				// ld HL, NN -> 21 L H
				// ld DE, NN -> 11 L H

				ld  hl, FANTY_A
				or  a 
				jr  z, fantys_rr_set

				ld  hl, -FANTY_A

			.fantys_rr_set
				ld  (fanty_A_mod_1 + 1), hl
				ld  (fanty_A_mod_2 + 1), hl
				ld  (fanty_A_mod_3 + 1), hl
				ld  (fanty_A_mod_4 + 1), hl
		#endif
	#endif

		ld  bc, (_enit)
		ld  b, 0

	#ifdef FANTY_FACING
			ld  hl, _en_an_frame 
			add hl, bc 
			ld  a, (hl)
			ld  ixl, a
	#endif

	// Prepare a 16 bits index (enit) I can use when I need

		ld  a, c
		sla a  							// enit * 2, 16 bits here
		ld  (_gp_gen), a 
		xor a 
		ld  (_gp_gen + 1), a 

	#ifdef RANDOM_RESPAWN
		// If RANDOM_RESPAWN is set, any en_t becomes a fanty if en_an_fanty_activo is set for that enemy.

		#ifdef USE_TYPE_6
			// But fanties are always fanties so
				ld  a, (__en_t) 
				cp  6
				jr  z, fanty_not_random_respawn
		#endif

			// if (!fanty_activo) goto .end
			ld  hl, _en_an_fanty_activo
			add hl, bc 
			ld  a, (hl) 
			or  a 
			jr  z, fantys_end

			jr  fantys_pursuing
		.fanty_not_random_respawn
	#endif

	// ********************************************************************
	//                           SET VELOCITY
	// ********************************************************************

	#if defined USE_TYPE_6 && (defined USE_SIGHT_DISTANCE || defined PLAYER_CAN_HIDE || defined FANTYS_EXIT_STATE_V)
		// If those are enabled, fanties may have three states: IDLE, PURSUING or RETREATING
		
			ld  hl, _en_an_state
			add hl, bc 
			ld  a, (hl)

		#if defined USE_SIGHT_DISTANCE || defined PLAYER_CAN_HIDE			
			cp  TYPE_6_IDLE
			jp  z, fantys_idle

			cp  TYPE_6_RETREATING
			jp  z, fantys_retreating

		#elif defined FANTYS_EXIT_STATE_V
			// This was created as a very simple 'don't pursue' option in Ramiro 3.
			cp  TYPE_6_PURSUING
			jp  nz, fantys_end

		#endif
	
	#endif

	// ----------------------------------------------------------------
	//                        STATE PURSUING
	// ----------------------------------------------------------------					

	.fantys_pursuing

	// Normal fanties (vanilla, no sight distance) or RANDOM_RESPAWN fanties are always pursuing.
	// This block will execute for all fanties. The main difference is what acceleration is applied,
	// which depends on `player_hidden` if `PLAYER_CAN_HIDE` for `RANDOM_RESPAWN` fanties.

	// X AXIS

	.fanty_x_axis

		ld  bc, _en_an_x
		ld  hl, (_gp_gen) 				// INDEX
		add hl, bc 

		ld  e, (hl) 
		inc hl 
		ld  d, (hl) 					// DE = en_an_x [enit]

	.fanty_vx_sk0
		ld  hl, (_player)				// HL = player.x

		push hl 
		call l_lt 						// C if DE < HL, so C if en < pl
		pop  hl 
		
		jr  nc, fanty_vx_sk1

		// ** player.x is > en_an_x, increase vx **
	#ifdef FANTY_FACING
			ld  ixl, 1
	#endif

		// en_an_vx [enit] += FANTY_A

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vx
		add hl, bc 						// HL -> en_an_vx [enit]
		
		ld  e, (hl)
		inc hl 
		ld  d, (hl)  					// DE = en_an_vx [enit]
	.fanty_A_mod_1
		ld  hl, FANTY_A
		add hl, de 						// HL = en_an_vx [enit] + FANTY_A

		// if (FANTY_MAX_V < en_an_vx [enit]) en_an_vx [enit] = FANTY_MAX_V

		ld  de, FANTY_MAX_V 
		push hl
		call l_lt 						// C if DE < HL
		pop hl 
		jr  nc, fanty_vx_write

		ex  de, hl  					// HL = FANTY_MAX_V

		jr  fanty_vx_write

	.fanty_vx_sk1
		//push hl  						// No need to save.
		call l_eq 						// C if DE == HL
		//pop hl
		jr  c, fanty_vx_done

		// ** player.x is < en_an_x, decrease vx **
	#ifdef FANTY_FACING
			ld  ixl, 0
	#endif

		// en_an_vx [enit] -= FANTY_A
		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vx
		add hl, bc 						// HL -> en_an_vx [enit]
		ld  a, (hl)
		inc hl 
		ld  h, (hl)
		ld  l, a
	.fanty_A_mod_2
		ld  de, FANTY_A 
		sbc hl, de 						// HL = en_an_vx [enit] - FANTY_A

		// if (-FANTY_MAX_V >= en_an_vx [enit]) en_an_vx [enit] = -FANTY_MAX_V
		
		ld  de, -FANTY_MAX_V
		
		push hl 
		call l_ge 						// C if DE >= HL
		pop hl
		
		jr  nc, fanty_vx_write

		ex  de, hl  					// HL = -FANTY_MAX_V

	.fanty_vx_write 					// Write HL to en_an_vx [enit]
		ex  de, hl 

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vx
		add hl, bc

		ld  (hl), e
		inc hl
		ld  (hl), d 					// DE = en_an_vx [enit]

	.fanty_vx_done

	// Y AXIS
	
	.fanty_y_axis

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_y
		add hl, bc 
		ld  e, (hl) 
		inc hl 
		ld  d, (hl) 					// DE = en_an_y [enit]

	.fanty_vy_sk0
		ld  hl, (_player + 2)			// HL = player.y

		push hl 
		call l_lt 						// C if DE < HL
		pop hl 
		
		jr  nc, fanty_vy_sk1

		// ** player.y is > en_an_y, increase vy **

		// en_an_vy [enit] += FANTY_A

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vy
		add hl, bc 						// HL -> en_an_vy [enit]
		
		ld  e, (hl)
		inc hl 
		ld  d, (hl) 
	.fanty_A_mod_3
		ld  hl, FANTY_A
		add hl, de 						// HL = en_an_vy [enit] + FANTY_A

		// if (FANTY_MAX_V < en_an_vy [enit]) en_an_vy [enit] = FANTY_MAX_V

		ld  de, FANTY_MAX_V 
		push hl 
		call l_lt 						// C if DE < HL
		pop hl 
		jr  nc, fanty_vy_write

		ex  de, hl  					// HL = FANTY_MAX_V

		jr  fanty_vy_write

	.fanty_vy_sk1
		push hl 
		call l_eq 						// C if DE == HL
		pop hl 
		jr  c, fanty_vy_done

		// ** player.y is < en_an_y, decrease vy **

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vy
		add hl, bc 						// HL -> en_an_vy [enit]
		ld  a, (hl)
		inc hl 
		ld  h, (hl)
		ld  l, a
	.fanty_A_mod_4
		ld  de, FANTY_A 
		sbc hl, de 						// HL = en_an_vy [enit] - FANTY_A

		// if (-FANTY_MAX_V >= en_an_vy [enit]) en_an_vy [enit] = -FANTY_MAX_V
		
		ld  de, -FANTY_MAX_V
		push hl
		call l_ge 						// C if DE >= HL
		pop hl 
		jr  nc, fanty_vy_write

		ex  de, hl  					// HL = -FANTY_MAX_V

	.fanty_vy_write 					// Write HL to en_an_vy [enit]

		ex  de, hl 

		ld  a, (_enit)
		sla a  							// enit * 2, 16 bits here
		ld  b, 0
		ld  c, a 						// BC will serve as INDEX

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vy
		add hl, bc

		ld  (hl), e
		inc hl
		ld  (hl), d

	.fanty_vy_done

	#if defined USE_TYPE_6
		#if defined USE_SIGHT_DISTANCE || defined PLAYER_CAN_HIDE
				// Should change state ? if hidden OR > sight distance -> retreating
				#ifdef PLAYER_CAN_HIDE 
					xor a 
					or  iyh 
					jr  nz, fantys_set_retreating 
				#endif 			

				#ifdef USE_SIGHT_DISTANCE 
					ld  a, iyl
					cp  SIGHT_DISTANCE 
					jr  nc, fantys_set_retreating
				#endif 

				jp  fantys_update

			.fantys_set_retreating
				ld  a, TYPE_6_RETREATING
				jr  fantys_set_state

		#elif defined FANTYS_EXIT_STATE_V
				jp  fantys_update
		#endif

		#if defined USE_SIGHT_DISTANCE || defined PLAYER_CAN_HIDE

			// ----------------------------------------------------------------
			//                         STATE IDLE 
			// ----------------------------------------------------------------

			.fantys_idle

				// Fanties are idle until player comes closer (USE_SIGHT_DISTANCE) or is not hidden (PLAYER_CAN_HIDE)

				#ifdef PLAYER_CAN_HIDE 
					xor a 
					or  iyh 
					jr  nz, fantys_update 
				#endif 

				#ifdef USE_SIGHT_DISTANCE
					// if rdd >= SIGHT_DISTANCE -> break
					ld  a, iyl 
					cp  SIGHT_DISTANCE
					jr  nc, fantys_update
				#endif

				// Set state pursuing
				ld  a, TYPE_6_PURSUING
			.fantys_set_state 
				ld  bc, (_enit)
				ld  b, 0
				ld  hl, _en_an_state
				add hl, bc 
				ld  (hl), a

				jp  fantys_update

			// ----------------------------------------------------------------
			//                        STATE RETREATING
			// ----------------------------------------------------------------

			.fantys_retreating

				// In this state, fanties retreat to en_x1, en_y1.

			.fantys_retreating_x
				// if (_en_x < _en_x1) en_an_vx = FANTY_V_RETREATING
				ld  a, (__en_x1) 
				ld  c, a 
				ld  a, (__en_x)
				cp  c 

				jr  z, fantys_retreating_y 		// en_x == en_x1, so skip past to vertical.

				jr  nc, fantys_rsk1

				ld  bc, FANTY_V_RETREATING
				jr  fantys_retreating_set_vx

			.fantys_rsk1
				ld  bc, -FANTY_V_RETREATING

			.fantys_retreating_set_vx
				ld  hl, (_enit)
				ld  h, 0
				add hl, hl 
				ld  de, _en_an_vx 
				add hl, de 
				ld  (hl), c 
				inc hl 
				ld  (hl), b 

			.fantys_retreating_y
				// if (_en_y < _en_y1) en_an_vy = FANTY_V_RETREATING 
				ld  a, (__en_y1) 
				ld  c, a 
				ld  a, (__en_y) 
				cp  c 

				jr  z, fantys_retreating_check_home		// en_y == en_y1, so skip.

				jr  nc, fantys_rsk2

				ld  bc, FANTY_V_RETREATING 
				jr  fantys_retreating_set_vy

			.fantys_rsk2
				ld  bc, -FANTY_V_RETREATING

			.fantys_retreating_set_vy
				ld  hl, (_enit)
				ld  h, 0
				add hl, hl 
				ld  de, _en_an_vy
				add hl, de 
				ld  (hl), c 
				inc hl 
				ld  (hl), b 

			.fantys_retreating_check_home
				ld  a, (__en_x) 
				ld  c, a 
				ld  a, (__en_x1) 
				cp  c 
				// Reuse code to change state 
				jr  nz, fantys_idle 

				ld  a, (__en_y)
				ld  c, a 
				ld  a, (__en_y1)
				cp  c 
				jr  nz, fantys_idle 

				// If we got to this point, en_x == en_x1 && en_y == en_y1, so set to idle

				// Reuse code to change state 
				ld  a, TYPE_6_IDLE
				jr  fantys_set_state

		#endif
	#endif

	.fantys_update

	// ********************************************************************
	//                          MOVE WITH VELOCITY
	// ********************************************************************

		// if (scenery_info.allow_type_6)
		ld  a, (_scenery_info + 3) 		// scenery_info.allow_type_6
		or  a
		jp  z, fantys_end

	// X AXIS

		// en_an_x [enit] += en_an_vx [enit];

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vx
		add hl, bc 						// HL -> en_an_vx [enit]
		ld  e, (hl)
		inc hl
		ld  d, (hl)						//  DE = en_an_vx [enit] 

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_x
		add hl, bc 
		push hl 						// HL -> en_an_x [enit]

		ld  a, (hl)
		inc hl 
		ld  h, (hl)
		ld  l, a  						// HL = en_an_x [enit]
		add hl, de 
		ex  de, hl 						// DE = en_an_x [enit] + en_an_vx [enit];

		// Screen boundaries

	.fanty_x_limit_0
		// if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
		ld  hl, 14336 // 15360 								
		call l_ge  						// C if DE >= HL 
		ld  hl, 14336 // 15360 
		jr  nc, fanty_x_limit_1

		ex  de, hl  					// DE = 15360

		jr fanty_x_write

	.fanty_x_limit_1
		// if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
		ld  hl, 0 // -1024 
		call l_lt  						// C if DE < HL
		ld  hl, 0 // -1024
		jr  nc, fanty_x_write

		ex  de, hl 						// DE = -1024

	.fanty_x_write

		// Write DE to en_an_x [enit];

		pop hl 
		ld  (hl), e
		inc hl 
		ld  (hl), d 

		// Update integer _en_x
		ex  de, hl
		call HLshr6_A
		ld  (__en_x), a

	// Y AXIS

		// en_an_y [enit] += en_an_vy [enit];

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_vy
		add hl, bc 						// HL -> en_an_vy [enit]
		ld  e, (hl)
		inc hl
		ld  d, (hl)						//  DE = en_an_vy [enit] DE =

		ld  hl, (_gp_gen) 				// INDEX
		ld  bc, _en_an_y
		add hl, bc 

		push hl 						// Save ptr to  en_an_y [enit]

		ld  a, (hl)
		inc hl 
		ld  h, (hl)
		ld  l, a  						// HL = en_an_y [enit]
		add hl, de 
		ex  de, hl 						// DE = en_an_y [enit] + en_an_vy [enit];

		// Screen boundaries

	.fanty_y_limit_0
		// if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
		ld  hl, 9216 // 10240 
		call l_ge  						// C if DE >= HL 
		ld  hl, 9216 // 10240 
		jr  nc, fanty_y_limit_1

		ex  de, hl  					// DE = 15360

		jr fanty_y_write

	.fanty_y_limit_1
		// if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;
		ld  hl, 0 // -1024 
		call l_lt  						// C if DE < HL
		ld  hl, 0 // -1024 
		jr  nc, fanty_y_write

		ex  de, hl 						// DE = -1024

	.fanty_y_write

		// Write DE to en_an_y [enit];

		pop hl 							// Restore ptr to en_an_y [enit]
		ld  (hl), e
		inc hl 
		ld  (hl), d 

		// Update integer _en_y
		ex  de, hl
		call HLshr6_A
		ld  (__en_y), a

	#ifdef RANDOM_RESPAWN
		// Make fanty blink when next to the edges of the screen
		// Make invisible if close and even x or even y

		.fanty_rr_blink
			// Is it close to an edge?
			ld  a, (__en_x)
			ld  c, 0 
			call fanty_close_to_edge
			jr  c, fanty_rr_is_close_to_edge

			ld  a, (__en_x)
			ld  c, 224 
			call fanty_close_to_edge
			jr  c, fanty_rr_is_close_to_edge

			ld  a, (__en_y)
			ld  c, 0 
			call fanty_close_to_edge
			jr  c, fanty_rr_is_close_to_edge

			ld  a, (__en_y)
			ld  c, 144
			call fanty_close_to_edge
			jr  nc, fanty_rr_done

		.fanty_rr_is_close_to_edge
			// even X or Y?
			ld  a, (__en_x) 
			and 1 
			jr  z, fanty_rr_is_close_to_edge

			ld  a, (__en_y)
			and 1 
			jr  nz, fanty_rr_done

			// So make invisible

			ld  ixl, 0xff
			jr  fanty_rr_done

		.fanty_close_to_edge
			// IN:
			// A = coordinate
			// C = edge
			// OUT:
			// carry set if close

			sub c 
			call abs_a 
			cp  16
			ret

		.fanty_rr_done
	#endif		

	#ifdef FANTY_FACING
			ld  bc, (_enit)
			ld  b, 0 
			ld  hl, _en_an_frame
			add hl, bc 
			ld  a, ixl 
			ld  (hl), a
	#endif

	.fantys_end

#endasm
