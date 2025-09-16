// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// engine.h

#ifndef ENEMIES_COLLIDE_MASK
	#define ENEMIES_COLLIDE_MASK 9
#endif

#ifndef HOTSPOTS_FIRST_TILE
	#define HOTSPOTS_FIRST_TILE 16
#endif

#asm
	.HLshr6_A
		// HL shr 6 -> CCBBBBBB AAxxxxxx -> BBBBBBAA
		sla h 
		sla h 			// BBBBBB00

		ld  a, l 
		rlca
		rlca 
		and 0x03 		// 000000AA

		or  h 			// BBBBBBAA
		ret 

	.Ashl16_HL
		// A shl 6 -> BBBBBBAA -> 00BBBBBB AA000000
		ld  l, 0

		ld  h, a
		srl h 			// H = 0BBBBBBA, C = A
		rr  l 			// L = A0000000
		srl h 			// H = 00BBBBBB, C = A
		rr  l 			// L = AA000000
		ret

	.withSign
		// To be called after Ashl16_HL to copy sign & extend
		bit 7, a
		ret z
		ld  a, $C0 		// 11000000
		or  h
		ld  h, a 
		ret

	._abs_a
		bit 7, a
		ret z
		neg
		ret
#endasm

unsigned char player_walk_cycle [] = {
	0, 1, 2, 1
};

unsigned char qtile (unsigned char x, unsigned char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x
		
			dec hl
			dec hl
			ld  a, (hl) 	// y

			// If you put x in C and y in A you can call here
			
		.qtile_do	
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_buff
			add hl, de

			ld  l, (hl)
			ld  h, 0
	#endasm
}

unsigned char attr (unsigned char x, unsigned char y) {
	#asm
			ld  hl, 4
			add hl, sp
			ld  c, (hl) 	// x

			dec hl
			dec hl
			ld  a, (hl) 	// y
			
			// If you put x in C and y in A you can call here
			
		._attr_2
			// A = y, C = x
			cp  10
			jr  c, _attr_1

			ld  hl, 0
			ret

		._attr_1
			ld  b, a 		// save y
			ld  a, c 		// x
			cp  15
			jr  c, _attr_1b
			ld  hl, 0
			ret

			// If you put x in C and y in A you can use this entry point for enemies

		._attr_enems
			cp  10
			jr  c, _attr_enems_skip_1

			ld  hl, 8
			ret

		._attr_enems_skip_1
			ld  b, a
			ld  a, c
			cp  15
			jr  c, _attr_1b
			ld  hl, 8
			ret

		._attr_1b
			ld  a, b 		// restore y
			sla a
			sla a
			sla a
			sla a
			sub b
			add c

			ld  d, 0
			ld  e, a
			ld  hl, _map_attr
			add hl, de
			ld  l, (hl)

		._attr_end
			ld  h, 0
	#endasm
}

#define BOUNDING_SIZE 12
unsigned char collide_enem (void) {
	#asm
			// Normal 16x16 player:
			// (_en_x + 12 >= gpx && _en_x <= gpx + 12 && _en_y + 12 >= gpy && _en_y <= gpy + 12)
			ld  hl, 0

			// _en_x + 12 >= gpx
			ld  a, (_gpx)
			ld  c, a
			ld  a, (__en_x)
			add BOUNDING_SIZE
			cp  c
			ret c

			// _en_x <= gpx + 12; gpx + 12 >= _en_x
			ld  a, (__en_x)
			ld  c, a
			ld  a, (_gpx)
			add BOUNDING_SIZE
			cp  c
			ret c

			// _en_y + 12 >= gpy or _en_y + 16 >= gpy
			ld  a, (_gpy)
			ld  c, a
			ld  a, (__en_y)
			add BOUNDING_SIZE
			cp  c
			ret c

			// _en_y <= gpy + 12; gpy + 12 >= _en_y
			ld  a, (__en_y)
			ld  c, a
			ld  a, (_gpy)
			add BOUNDING_SIZE
			cp  c
			ret c

			ld  l, 1
	#endasm
}

unsigned char rand (void) {
	#asm
		.rand16
			ld	hl, _seed
			ld	a, (hl)
			ld	e, a
			inc	hl
			ld	a, (hl)
			ld	d, a
			
			// Ahora DE = [SEED]
						
			ld	a,	d
			ld	h,	e
			ld	l,	253
			or	a
			sbc	hl,	de
			sbc	a, 	0
			sbc	hl,	de
			ld	d, 	0
			sbc	a, 	d
			ld	e,	a
			sbc	hl,	de
			jr	nc,	nextrand
			inc	hl
		.nextrand
			ld	d,	h
			ld	e,	l
			ld	hl, _seed
			ld	a,	e
			ld	(hl), a
			inc	hl
			ld	a,	d
			ld	(hl), a
			
			// Ahora [SEED] = HL
		
			ld  l, e 
			ld  h, 0		
	#endasm
}

unsigned int __FASTCALL__ abs (int n) {
	#asm
		// HL = n
		bit 7, h
		ret z

		// neg HL
		call l_neg
	#endasm
}

#ifndef DEACTIVATE_KEYS
	void check_and_clear_cerrojo (void) {
		// search & toggle @ rdx, rdy
		if (qtile (rdx, rdy) == 15 && player.keys) {

			#asm
					xor a
					ld  (__t), a
					ld  a, (_comportamiento_tiles)	;; beh [0]
					ld  (__n), a

					ld  a, (_rdx)
					ld  (__x), a 
					ld  c, a
					ld  a, (_rdy)
					ld  (__y), a
					call set_map_tile_do

				// The cerrojos struct is db np, x, y st
					ld  b, MAX_CERROJOS
					ld  hl, _cerrojos
				.clear_cerrojo_loop
					ld  c, (hl) 		// np
					inc hl
					ld  d, (hl) 		// x
					inc hl 
					ld  e, (hl) 		// y
					inc hl

					ld  a, (_n_pant)
					cp  c
					jr  nz, clear_cerrojo_loop_continue

					ld  a, (_rdx)
					cp  d 
					jr  nz, clear_cerrojo_loop_continue

					ld  a, (_rdy)
					cp  e 
					jr  nz, clear_cerrojo_loop_continue

					xor a 
					ld  (hl), a
					jr  clear_cerrojo_loop_done

				.clear_cerrojo_loop_continue
					inc hl
					djnz clear_cerrojo_loop

				.clear_cerrojo_loop_done
			#endasm

			player.keys --;
			peta_el_beeper (8);
		}
	}

	void init_cerrojos (void) {
		// Activate all bolts.
		
		#asm
				// Iterate MAX_CERROJOS time
				// Start with _cerrojos + 3
				// Set to 1 and add 4
				ld  b, MAX_CERROJOS
				ld  hl, _cerrojos + 3
				ld  de, 4
				ld  a, 1
			.init_cerrojos_loop
				ld  (hl), a
				add hl, de
				djnz init_cerrojos_loop
		#endasm	
	}
#endif

#ifdef PLAYER_CAN_FIRE
	void init_bullets (void) {
		// Initialize bullets
		
		#asm
				ld  hl, _bullets_estado
				ld  de, _bullets_estado + 1
				ld  bc, MAX_BULLETS - 1
				xor a
				ld  (hl), a
				ldir
		#endasm
	}
#endif

#ifdef ENEMIES_MAY_DIE
	void init_malotes (void) {
		#asm
			// 0  1  2   3   4   5   6   7   8   9
			// x, y, x1, y1, x2, y2, mx, my, t[, life]

			// 0  1  2    3    4   5   6   7
			// x, y, xy1, xy2, mx, my, t[, life]

			ld  bc, TOTAL_EXISTING_ENEMS

			#if (defined PLAYER_CAN_FIRE && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
					ld  de, 10
			#else
					ld  de, 9
			#endif
	
				ld  ix, _malotes
			
			.init_malotes_loop
				// Clear 'enem is dead' flag				
				ld  a, (ix+8) 	// .t
				and 127
				
			#ifdef RANDOM_RESPAWN
					cp  5
					jr  nz, init_malotes_not_5	

					or  128
				.init_malotes_not_5
			#endif

				ld  (ix+8), a 	// .t
			
			#if (defined PLAYER_CAN_FIRE && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
					ld  a, ENEMS_LIFE_GAUGE
					ld  (ix+9), a 	// .life
			#endif

				add ix, de

				dec bc
				ld  a, b 
				or  c
				jr  nz, init_malotes_loop
		#endasm
	}
#endif

#ifdef PLAYER_CAN_FIRE
	void fire_bullet (void) {
		
		// Search a free bullet slot...

		#asm
				ld  bc, 0
			.fire_bullet_search_loop
				ld  hl, _bullets_estado
				add hl, bc
				ld  a, (hl)
				or  a
				jr  z, fire_bullet_found
				inc c
				ld  a, c
				cp  MAX_BULLETS
				jr  nz, fire_bullet_search_loop
				ret

			.fire_bullet_found
				inc a
				ld  (hl), a 			// bullets_estado [gpit] = 1;

				ld  a, (_player + 22)	// player.facing
				or  a
				ld  a, (_gpx)
				jr  z, fire_bullet_right

			.fire_bullet_left
				sub 4
				ld  hl, _bullets_x
				add hl, bc
				ld  (hl), a 			// bullets_x [gpit] = (player.x >> 6) - 4;

				ld  a, -PLAYER_BULLET_SPEED
				ld  hl, _bullets_mx
				add hl, bc
				ld  (hl), a 			// bullets_mx [gpit] = -PLAYER_BULLET_SPEED;

				jr  fire_bullet_facing_done

			.fire_bullet_right
				add 12
				ld  hl, _bullets_x
				add hl, bc
				ld  (hl), a 			// bullets_x [gpit] = (player.x >> 6) + 12;

				ld  a, PLAYER_BULLET_SPEED
				ld  hl, _bullets_mx
				add hl, bc
				ld  (hl), a 			// bullets_mx [gpit] = PLAYER_BULLET_SPEED;

			.fire_bullet_facing_done
				ld  a, (_gpy)
				add PLAYER_BULLET_Y_OFFSET
				ld  hl, _bullets_y
				add hl, bc
				ld  (hl), a 			// bullets_y [gpit] = (player.y >> 6) + PLAYER_BULLET_Y_OFFSET;				
		#endasm

		peta_el_beeper (6);
		#ifdef FIRING_DRAINS_LIFE
			player.drain_amount = FIRING_DRAIN_AMOUNT;
			player.is_dead = PLAYER_KILLED_BY_SELF;
		#endif

		#ifdef PLAYER_AX_RECOIL
			player.vx += (player.facing ? PLAYER_AX_RECOIL : -PLAYER_AX_RECOIL);
		#endif
	}
#endif

#if defined RANDOM_RESPAWN
	unsigned char player_hidden (void) {
		#ifndef HIDDEN_CAN_MOVE
			if ( player.possee && player.vx == 0 )
		#endif
		{
			return (attr ((gpx + 8) >> 4, (gpy + 8) >> 4) & 2);
		}
		return 0;
	}
#endif

#ifdef PLAYER_FLICKERS
	void player_flicker (void) {
		/*
		player.estado = EST_PARP;
		player.ct_estado = PLAYER_FLICKERS;
		*/

		#asm
				ld  a, EST_PARP 
				ld  (_player + 23), a 	// player.estado
				ld  a, 50 
				ld  (_player + 24), a 	// player.ct_estado
		#endasm
	}
#endif

#ifdef PLAYER_PUSH_BOXES
	void move_tile_with_check (void) {
		// Moves to x0, y0 to x1, y1 if x1, y1 is walkable
		#asm
				ld  a, (_x1)
				ld  c, a 
				ld  a, (_y1)
				call _attr_enems 
				xor a 
				or l 
				ret nz
		#endasm
			set_map_tile (x0, y0, 0, 0);
			set_map_tile (x1, y1, 14, 8);
			peta_el_beeper (2);

	}
#endif

unsigned char cm_two_points (void) {
	/*
	if (_x > 14 || _y > 9) at1 = 0; 
	else at1 = map_attr [_x + (_y << 4) - _y];

	if (_x2 > 14 || _y2 > 9) at2 = 0; 
	else at2 = map_attr [_x2 + (_y2 << 4) - _y2];
	*/
	#asm
			ld  a, (_cx1)
			cp  15
			jr  nc, _cm_two_points_at1_reset

			ld  a, (_cy1)
			cp  10
			jr  c, _cm_two_points_at1_do

		._cm_two_points_at1_reset
			xor a
			jr  _cm_two_points_at1_done

		._cm_two_points_at1_do
			ld  a, (_cy1)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			ld  b, a
			ld  a, (_cx1)
			add b
			ld  e, a
			ld  d, 0
			ld  hl, _map_attr
			add hl, de
			ld  a, (hl)

		._cm_two_points_at1_done
			ld (_at1), a

			ld  a, (_cx2)
			cp  15
			jr  nc, _cm_two_points_at2_reset

			ld  a, (_cy2)
			cp  10
			jr  c, _cm_two_points_at2_do

		._cm_two_points_at2_reset
			xor a
			jr  _cm_two_points_at2_done

		._cm_two_points_at2_do
			ld  a, (_cy2)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			ld  b, a
			ld  a, (_cx2)
			add b
			ld  e, a
			ld  d, 0
			ld  hl, _map_attr
			add hl, de
			ld  a, (hl)

		._cm_two_points_at2_done
			ld (_at2), a
	#endasm
}

#if !defined DEACTIVATE_KEYS || defined PLAYER_PUSH_BOXES
	void check_lock_or_box_horz (void) {
		#asm
				ld  a, (_cx1)
				ld  (_rdx), a 
				ld  c, a
				ld  a, (_gpy)
				add 8 
				srl a 
				srl a
				srl a 
				srl a
				ld  (_rdy), a 

				call qtile_do

				ld  a, l
				ld  (_rda), a

			#ifdef PLAYER_PUSH_BOXES
					cp 14
					jr  nz, box_horz_done

					ld  a, (_rdx)
					ld  (_x0), a 
					ld  a, (_rdy)
					ld  (_y0), a 
					ld  (_y1), a

					ld  hl, (_player + 6) 		// player.vx
					bit 7, h
					jr  nz, box_horz_left

				.box_horz_right
					ld  a, (_x0)
					inc a 
					ld  (_x1), a
					jr  box_horz_do

				.box_horz_left
					ld  a, (_x0)
					dec a 
					ld  (_x1), a

				.box_horz_do
					call _move_tile_with_check

				.box_horz_done
			#endif

			#ifndef DEACTIVATE_KEYS
					ld  a, (_rda)
					cp  15
					jr  nz, lock_horz_done

					call _check_and_clear_cerrojo

				.lock_horz_done
			#endif
		#endasm
	}

	void check_lock_or_box_vert (void) {
		#asm
				ld  a, (_gpx)
				add 8 
				srl a 
				srl a
				srl a 
				srl a
				ld  (_rdx), a 
				ld  c, a
				ld  a, (_cy1)
				ld  (_rdy), a 

				call qtile_do

				ld  a, l
				ld  (_rda), a

			#ifdef PLAYER_PUSH_BOXES
					cp 14
					jr  nz, box_vert_done

					ld  a, (_rdy)
					ld  (_y0), a 
					ld  a, (_rdx)
					ld  (_x0), a 
					ld  (_x1), a

					ld  hl, (_player + 8) 		// player.vy
					bit 7, h
					jr  nz, box_vert_up

				.box_vert_down
					ld  a, (_y0)
					inc a 
					ld  (_y1), a
					jr  box_vert_do

				.box_vert_up
					ld  a, (_y0)
					dec a 
					ld  (_y1), a

				.box_vert_do
					call _move_tile_with_check

				.box_vert_done
			#endif

			#ifndef DEACTIVATE_KEYS
					ld  a, (_rda)
					cp  15
					jr  nz, lock_vert_done

					call _check_and_clear_cerrojo

				.lock_vert_done
			#endif
		#endasm
	}
#endif

void move (void) {
	
	// Move player
	
	#asm 
			xor a 
			ld  (_hit_h), a 
			ld  (_hit_v), a 
			ld  (_thrusting), a 
			ld  (_wall), a

			call _pad_read
	#endasm

	// =================================================
	//                     Vertical
	// =================================================

	// Modify Velocity

	#ifdef PLAYER_CUSTOM_VENG
		player_custom_veng ();
	#elif defined PLAYER_MOGGY_STYLE
		#asm
				ld  a, (_pad0)
				ld  c, a

			// If neither UP nor DOWN pressed, apply RX

				// if ((pad0 & sp_UP) && (pad0 & sp_DOWN)) {
				and sp_UP
				jr  z, m_vert_kp_up_or_down_p

				ld  a, c 
				and sp_DOWN
				jr  z, m_vert_kp_up_or_down_p

				// Not up or down pressed, apply vertical RX
				// Depending on the current vy sign, add or subtract:

				// if (player.vy > 0)
				ld  hl, (_player + 8) 			// player.vy 

				// If player.vy is zero do nothing!
				ld  a, h 
				or  l 
				jr  z, m_vert_kp_done

				bit 7, h 						// bit 7 = 0 positive, 1 negative

				jr  nz, m_vert_kp_rx_negative

			.m_vert_kp_rx_positive
				ld  de, -PLAYER_RX
				add hl, de 

				// Changed sign?
				bit 7, h
				jr  z, m_vert_kp_vy_write

				ld  hl, 0
				jr  m_vert_kp_vy_write

			.m_vert_kp_rx_negative
				ld  de, PLAYER_RX
				add hl, de 

				// Changed sign?
				bit 7, h
				jr  nz, m_vert_kp_vy_write

				ld  hl, 0
				jr  m_vert_kp_vy_write

			.m_vert_kp_up_or_down_p

			// UP or DOWN pressed, which?

				ld  a, c
				and sp_UP
				jr  nz, m_vert_kp_up_done

			.m_vert_kp_up_do
				ld  a, THRUST_UP
				ld  (_thrusting), a

				ld  de, -PLAYER_AX
				ld  hl, (_player + 8) 			// player.vy 
				add hl, de 

				// Limit, never get below -PLAYER_MAX_VX
				// if (player.vy < -PLAYER_MAX_VX) player.vy = -PLAYER_MAX_VX;
				// if (-PLAYER_MAX_VX > player.vy) ...
				ld  de, -PLAYER_MAX_VX
				call l_gt 						// C if DE > HL
				jr  nc, m_vert_kp_up_facing

				ex  de, hl 						// HL = -PLAYER_MAX_VX

			.m_vert_kp_up_facing
			#ifndef FAKE_SIDE_VIEW
					ld  a, GENITAL_FACING_UP
					ld  (_player + 22), a 			// facing
			#endif
				jr  m_vert_kp_vy_write

			.m_vert_kp_up_done

				ld  a, c
				and sp_DOWN
				jr  nz, m_vert_kp_down_done

			.m_vert_kp_down_do
				ld  a, THRUST_DOWN
				ld  (_thrusting), a

				ld  de, PLAYER_AX
				ld  hl, (_player + 8) 			// player.vy 
				add hl, de 

				// Limit, never get over PLAYER_MAX_VX
				// if (player.vy > PLAYER_MAX_VX) player.vy = PLAYER_MAX_VX;
				// if (PLAYER_MAX_VX < player.vy) ...
				ld  de, PLAYER_MAX_VX
				call l_lt 						// C if DE > HL
				jr  nc, m_vert_kp_down_facing

				ex  de, hl 						// HL = PLAYER_MAX_VX

			.m_vert_kp_down_facing
			#ifndef FAKE_SIDE_VIEW
					ld  a, GENITAL_FACING_DOWN
					ld  (_player + 22), a 			// facing
			#endif
	
			.m_vert_kp_down_done

			.m_vert_kp_vy_write
				ld  (_player + 8), hl 			// player.vy

			.m_vert_kp_done
		#endasm
	#else
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

		#ifdef PLAYER_HAS_JUMP
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


		#elif defined PLAYER_HAS_JETPAC
			// Make jetpac
		#endif

		#ifdef JUMP_DOWN_PLATFORM
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
		#endif
	#endif 

	// Vertical thrust: apply vy to y

	#asm
			ld  hl, (_player + 8) 				// player.vy
			ex  de, hl  						// DE = player.vy

			ld  hl, (_player + 2)				// player.y

			add hl, de 							// HL = player.y + player.vy

			bit 7, h 			
			jr  z, m_vert_thrust_notneg

			// HL is negative, crop to 0:
			ld  hl, 0
			jr  m_vert_thurst_write

		.m_vert_thrust_notneg

			// if (player.y > 144*64) player.y = 144*64;
			// if (144*64 < player.y) ...
			ld  de, 144*64
			call l_lt  							// c if DE < HL
			jr  nc, m_vert_thurst_write

			ex  de, hl 							// HL = 144 * 64

		.m_vert_thurst_write
			ld  (_player + 2), hl 				// player.y
			call HLshr6_A
			ld  (_gpy), a

		#ifdef JUMP_DOWN_PLATFORM
				and 15
				cp  8
				jr  c, m_vert_jd_disable_done

				xor a 
				ld  (_disable_collide_platform), a

			.m_vert_jd_disable_done
		#endif
	#endasm

	// Collide vertical.
	// Includes evil tile detection, open lock & push boxes

	#asm
			// cx1 = (gpx + 4) >> 4; cx2 = (gpx + 11) >> 4;
			ld  a, (_gpx)
			ld  c, a
			add 4
			srl a 
			srl a 
			srl a 
			srl a
			ld  (_cx1), a
			ld  a, c
			add 11
			srl a 
			srl a 
			srl a 
			srl a
			ld  (_cx2), a

			ld  hl, (_ptgmy)
			ex  de, hl 
			ld  hl, (_player + 8) 				// player.vy
			add hl, de
			ld  (_pvy_total), hl

			// If no vertical speed, do nothing at this stage

			ld  a, h 
			or  l
			jp  z, m_vert_coll_done

		.m_vert_coll_do

			// Check bit 7 of HL to see if pvy_total is negative or positive

			bit 7, h
			jr nz, m_vert_coll_up

		.m_vert_coll_down

			// Collide down

			ld  a, (_gpy)
			add 15
			srl a
			srl a
			srl a 
			srl a 
			ld  (_cy1), a 
			ld  (_cy2), a

			call _cm_two_points 

			// Collision down check is simpler for genital or if you don't have 8s on 4s:

		#if defined PLAYER_MOGGY_STYLE || defined SIMPLE_PLATFORMS || defined PLAYER_CUSTOM_VENG
				ld  c, 12

			#ifdef JUMP_DOWN_PLATFORM
					ld  a, (_disable_collide_platform)
					or  a 
					jr  z, jump_down_platform_done
					ld  c, 8
				.jump_down_platform_done					
			#endif

				// (at1 & 12) || (at2 & 12)
				ld  a, (_at1)
				and c
				jr  nz, m_vert_coll_down_adjust

				ld  a, (_at2)
				and c
				jp  z, m_vert_coll_checks_done
		#else
				// 	(at1 & 8) || (at2 & 8) || (       ch3
				// 		((gpy - 1) & 15) < 8 && ( 	  ch2
				// 			(at1 & 4) || (at2 & 4)    ch1
				// 		)
				// 	)

				#ifdef AVOID_PLATFORM_HOP
					ld  hl, (_player + 8) 				// player.vy
					call HLshr6_A
					inc a 
					ld  c, a 							// C = VY in pixels + 1
				#endif

				// We have an OR outside, discard easier conditions first
				ld  a, (_at1)
				and 8 
				jr  nz, m_vert_coll_down_adjust

				ld  a, (_at2)
				and 8 
				jr  nz, m_vert_coll_down_adjust

				// Gotten here, we have to check the big condition.
				// We have an AND, so BOTH sides must be true
			
			#ifdef JUMP_DOWN_PLATFORM
					ld  a, (_disable_collide_platform)
					or  a 
					jr  nz, m_vert_coll_checks_done
			#endif

				ld  a, (_at1)
				and 4
				jr  nz, m_vert_coll_down_ch2 		// ch1 is true, check ch2

				ld  a, (_at2)
				and 4
				jp  z, m_vert_coll_checks_done 		// ch1 is false, so ch2 is false.

			.m_vert_coll_down_ch2
				ld  a, (_gpy)
				dec a 
				and 15
				#ifdef AVOID_PLATFORM_HOP
					cp  c  // was: 8
				#else
					cp  8
				#endif
				jr  nc, m_vert_coll_checks_done		// Everything failed!
		#endif

		.m_vert_coll_down_adjust
			#if (!defined DEACTIVATE_KEYS || defined PLAYER_PUSH_BOXES) && (defined PLAYER_MOGGY_STYLE || defined PLAYER_CUSTOM_VENG)
					call _check_lock_or_box_vert
			#endif

			ld  hl, 0 
		#ifdef ENABLE_BOTIBOINS
				ld  a, (_at1)
				and 2 
				jr  nz, m_vert_coll_down_botiboin

				ld  a, (_at2) 
				and 2
				jr  z, m_vert_coll_down_set_vy

			.m_vert_coll_down_botiboin
				ld  l, 2 
				call _peta_el_beeper
				ld  hl, -PLAYER_MAX_VX

		#endif
		.m_vert_coll_down_set_vy
			ld  (_player + 8), hl 	// player.vy

			ld  a, (_gpy)
			and 0xf0 
			ld  (_gpy), a 
			call Ashl16_HL
			ld  (_player + 2), HL 	// player.y

			ld  a, WALL_DOWN
			ld  (_wall), a

			jr  m_vert_coll_checks_done

		.m_vert_coll_up

			// Collide up

			ld  a, (_gpy) 
			add 4 
			srl a 
			srl a 
			srl a 
			srl a 
			ld  (_cy1), a 
			ld  (_cy2), a

			call _cm_two_points

			ld  a, (_at1)
			and 8 
			jr  nz, m_vert_coll_up_adjust

			ld  a, (_at2)
			and 8 
			jr  z, m_vert_coll_checks_done

		.m_vert_coll_up_adjust

			#if (!defined DEACTIVATE_KEYS || defined PLAYER_PUSH_BOXES) && (defined PLAYER_MOGGY_STYLE || defined PLAYER_CUSTOM_VENG)
					call _check_lock_or_box_vert
			#endif	

			ld  hl, 0 
		#ifdef ENABLE_BOTIBOINS
				ld  a, (_at1)
				and 2 
				jr  nz, m_vert_coll_up_botiboin

				ld  a, (_at2) 
				and 2
				jr  z, m_vert_coll_up_set_vy

			.m_vert_coll_up_botiboin
				ld  l, 2 
				call _peta_el_beeper
				ld  hl, PLAYER_MAX_VX

		#endif
		.m_vert_coll_up_set_vy
			ld  (_player + 8), hl 	// player.vy

			ld  a, (_gpy)
			and 0xf0
			add 12 
			ld  (_gpy), a 
			call Ashl16_HL
			ld  (_player + 2), HL 

			ld  a, WALL_UP
			ld  (_wall), a

		.m_vert_coll_checks_done

		#ifndef DEACTIVATE_EVIL_TILE
				ld  a, (_at1)
				and 1
				jr  nz, m_vert_coll_sethit

				ld  a, (_at2)
				and 1
				jr  z, m_vert_coll_done

			.m_vert_coll_sethit

				// This, as is, is problematic. We need more checks:
				// If at1 or at2 are obstacle and not "1", hit shouldn't be set.
				// if (at1 == 8 || at1 == 4 || at2 == 8 || at2 == 4) -> abort
				ld  a, (_at1)
			#ifndef PLAYER_MOGGY_STYLE
					cp  4
					jr  z, m_vert_coll_done
			#endif
				cp  8
				jr  z, m_vert_coll_done
				ld  a, (_at2)
			#ifndef PLAYER_MOGGY_STYLE
					cp  4
					jr  z, m_vert_coll_done
			#endif
				cp  8
				jr  z, m_vert_coll_done

				ld  a, 1
				ld  (_hit_v), a
		#endif

		.m_vert_coll_done

	#endasm

	#ifndef PLAYER_MOGGY_STYLE
		// Calculate if possee

		#asm
				ld  a, (_gpy)
				add 16
				srl a 
				srl a 
				srl a 
				srl a 
				ld  (_cy1), a 
				ld  (_cy2), a 

				call _cm_two_points

				ld  a, (_at1)
				and 12 
				jr  nz, m_vert_set_possee

				ld  a, (_at2)
				and 12
				jr  nz, m_vert_set_possee

				xor a 
				jr  m_vert_set_possee_write

			.m_vert_set_possee
				ld  a, 1

			.m_vert_set_possee_write
				ld  (_player + 26), a 		// player.possee
		#endasm
	#endif

	// =================================================
	//                     Horizontal
	// =================================================

	// Modify Velocity

	#ifdef PLAYER_CUSTOM_HENG
		player_custom_heng ();
	#else

		// Read keyboard and apply A/R to VX
		// Nomenclature: m -> move, horz->axis, kp->keypress

		#asm
				ld  a, (_pad0)
				ld  c, a

			// If neither LEFT nor RIGHT pressed, apply RX

				// if ((pad0 & sp_LEFT) && (pad0 & sp_RIGHT)) {
				and sp_LEFT
				jr  z, m_horz_kp_left_or_right_p

				ld  a, c 
				and sp_RIGHT
				jr  z, m_horz_kp_left_or_right_p

				// Not left or right pressed, apply horizontal RX
				// Depending on the current vx sign, add or subtract:

				// if (player.vx > 0)
				ld  hl, (_player + 6) 		// player.vx 

				// If player.vx is zero do nothing!
				ld  a, h 
				or  l 
				jr  z, m_horz_kp_done

				bit 7, h 					// bit 7 = 0 positive, 1 negative

				jr  nz, m_horz_kp_rx_negative

			.m_horz_kp_rx_positive
				ld  de, -PLAYER_RX
				add hl, de 

				// Changed sign?
				bit 7, h
				jr  z, m_horz_kp_vx_write

				ld  hl, 0
				jr  m_horz_kp_vx_write

			.m_horz_kp_rx_negative
				ld  de, PLAYER_RX
				add hl, de 

				// Changed sign?
				bit 7, h
				jr  nz, m_horz_kp_vx_write

				ld  hl, 0
				jr  m_horz_kp_vx_write

			.m_horz_kp_left_or_right_p

			// LEFT or RIGHT pressed, which?
				ld  a, c
				and sp_LEFT
				jr  nz, m_horz_kp_left_done

			.m_horz_kp_left_do
				ld  a, THRUST_LEFT
				ld  (_thrusting), a

				ld  de, -PLAYER_AX
				ld  hl, (_player + 6) 		// player.vx 
				add hl, de 

				// Limit, never get below -PLAYER_MAX_VX
				// if (player.vx < -PLAYER_MAX_VX) player.vx = -PLAYER_MAX_VX;
				// if (-PLAYER_MAX_VX > player.vx) ...
				ld  de, -PLAYER_MAX_VX
				call l_gt 						// C if DE > HL
				jr  nc, m_horz_kp_left_facing

				ex  de, hl 						// HL = -PLAYER_MAX_VX

			.m_horz_kp_left_facing
			#if defined PLAYER_MOGGY_STYLE && !defined FAKE_SIDE_VIEW
					ld  a, GENITAL_FACING_LEFT
			#else
		 			ld  a, SIDEVIEW_FACING_LEFT
			#endif
				ld  (_player + 22), a 			// facing
				jr  m_horz_kp_vx_write

			.m_horz_kp_left_done

				ld  a, c
				and sp_RIGHT
				jr  nz, m_horz_kp_right_done

			.m_horz_kp_right_do
				ld  a, THRUST_RIGHT 
				ld  (_thrusting), a

				ld  de, PLAYER_AX
				ld  hl, (_player + 6) 		// player.vx 
				add hl, de 

				// Limit, never get over PLAYER_MAX_VX
				// if (player.vx > PLAYER_MAX_VX) player.vx = PLAYER_MAX_VX;
				// if (PLAYER_MAX_VX < player.vx) ...
				ld  de, PLAYER_MAX_VX
				call l_lt 						// C if DE > HL
				jr  nc, m_horz_kp_right_facing

				ex  de, hl 						// HL = PLAYER_MAX_VX

			.m_horz_kp_right_facing
			#if defined PLAYER_MOGGY_STYLE && !defined FAKE_SIDE_VIEW
					ld  a, GENITAL_FACING_RIGHT
			#else
		 			ld  a, SIDEVIEW_FACING_RIGHT
			#endif
				ld  (_player + 22), a 			// facing
				//jr  m_horz_kp_vx_write

			.m_horz_kp_right_done

			.m_horz_kp_vx_write
				ld  (_player + 6), hl 		// player.vx

			.m_horz_kp_done
		#endasm
	#endif

	// Horizontal thrust: apply vx to x

	#asm
			ld  hl, (_player + 6) 		// player.vx
			ex  de, hl  				// DE = player.vx

			ld  hl, (_player + 0)		// player.x

			add hl, de 					// HL = player.x + player.vx

		#ifndef PLAYER_MOGGY_STYLE
				ex  de, hl 				// DE = player.x + player.vx
				ld  hl, (_ptgmx) 
				add hl, de 				// HL = player.x + player.vy + ptgmx
		#endif

			bit 7, h 			
			jr  z, m_horz_thrust_notneg

			// HL is negative, crop to 0:
			ld  hl, 0
			jr  m_horz_thurst_write

		.m_horz_thrust_notneg

			// if (player.x > 224*64) player.x = 224*64;
			// if (224*64 < player.x) ...
			ld  de, 224*64
			call l_lt  					// c if DE < HL
			jr  nc, m_horz_thurst_write

			ex  de, hl 					// HL = 224 * 64

		.m_horz_thurst_write
			ld  (_player + 0), hl 		// player.x
			call HLshr6_A
			ld  (_gpx), A
	#endasm

	// Collide horizontal.
	// Includes evil tile detection, open lock & push boxes

	#asm
			ld  hl, (_ptgmx)
			ex  de, hl 
			ld  hl, (_player + 6) 		// player.vx
			add hl, de
			ld  (_pvx_total), hl

			// If no horizontal speed, do nothing at this stage

			ld  a, h 
			or  l
			jp  z, m_horz_coll_done

		.m_horz_coll_do

			// _y = (gpy + 4) >> 4; _y2 = (gpy + 15) >> 4;
			ld  a, (_gpy)
			ld  c, a
			add 4
			srl a 
			srl a 
			srl a 
			srl a
			ld  (_cy1), a
			ld  a, c
			add 15
			srl a 
			srl a 
			srl a 
			srl a
			ld  (_cy2), a

			// Check bit 7 of HL to see if pvx_total is negative or positive

			bit 7, h
			jr nz, m_horz_coll_left

		.m_horz_coll_right

			// Collide right

			ld  a, (_gpx)
			add 12
			srl a
			srl a
			srl a 
			srl a 
			ld  (_cx1), a 
			ld  (_cx2), a

			call _cm_two_points 

			// (at1 & 8) || (at2 & 8)
			ld  a, (_at1)
			and 8
			jr  nz, m_horz_coll_right_adjust

			ld  a, (_at2)
			and 8
			jp  z, m_horz_coll_checks_done

		.m_horz_coll_right_adjust
			#if !defined DEACTIVATE_KEYS || defined PLAYER_PUSH_BOXES
					call _check_lock_or_box_horz
			#endif

			ld  hl, 0 
		#ifdef ENABLE_BOTIBOINS
				ld  a, (_at1)
				and 2 
				jr  nz, m_vert_coll_right_botiboin

				ld  a, (_at2) 
				and 2
				jr  z, m_vert_coll_right_set_vy

			.m_vert_coll_right_botiboin
				ld  l, 2 
				call _peta_el_beeper
				ld  hl, -PLAYER_MAX_VX

		#endif
		.m_vert_coll_right_set_vy
			ld  (_player + 6), hl 	// player.vx

			ld  a, (_gpx)
			and 0xf0 
			add 4
			ld  (_gpx), a 
			call Ashl16_HL
			ld  (_player + 0), HL 	// player.x

			ld  a, WALL_RIGHT
			ld  (_wall), a

			jr  m_horz_coll_checks_done

		.m_horz_coll_left

			// Collide left

			ld  a, (_gpx) 
			add 4 
			srl a 
			srl a 
			srl a 
			srl a 
			ld  (_cx1), a 
			ld  (_cx2), a

			call _cm_two_points

			ld  a, (_at1)
			and 8 
			jr  nz, m_horz_coll_left_adjust

			ld  a, (_at2)
			and 8 
			jr  z, m_horz_coll_checks_done

		.m_horz_coll_left_adjust

			#if !defined DEACTIVATE_KEYS || defined PLAYER_PUSH_BOXES
					call _check_lock_or_box_horz
			#endif	

			ld  hl, 0 
		#ifdef ENABLE_BOTIBOINS
				ld  a, (_at1)
				and 2 
				jr  nz, m_vert_coll_left_botiboin

				ld  a, (_at2) 
				and 2
				jr  z, m_vert_coll_left_set_vy

			.m_vert_coll_left_botiboin
				ld  l, 2 
				call _peta_el_beeper
				ld  hl, PLAYER_MAX_VX

		#endif
		.m_vert_coll_left_set_vy
			ld  (_player + 6), hl 	// player.vx

			ld  a, (_gpx)
			and 0xf0
			add 12 
			ld  (_gpx), a 
			call Ashl16_HL
			ld  (_player + 0), HL 

			ld  a, WALL_LEFT
			ld  (_wall), a

		.m_horz_coll_checks_done

		#ifndef DEACTIVATE_EVIL_TILE

				ld  a, (_at1)
				and 1
				jr  nz, m_horz_coll_sethit

				ld  a, (_at2)
				and 1
				jr  z, m_horz_coll_done

			.m_horz_coll_sethit
				ld  a, 1
				ld  (_hit_h), a
		#endif

		.m_horz_coll_done

	#endasm

	// bigger vx or vy?
	//rdi = abs (pvx_total) > abs (pvy_total);
	#asm
			ld  hl, (_pvx_total)
			call _abs 
			ex  de, hl 				// DE = abs (pvx_total)
			ld  hl, (_pvy_total)
			call _abs  				// HL = abs (pvy_total), won't trash DE
			call l_gt 				// C set if DE > HL
			rl  a 					// put carry in A's bit 0
			and 1
			ld  (_rdi), a
	#endasm

	#ifndef DEACTIVATE_EVIL_TILE

		// Evil tile hit?

		#asm
			#ifdef PLAYER_CUSTOM_BG_HIT
					call _custom_bg_hit
					xor a 
					or  l
					jr  z, m_evil_tile_hit_done

			#elif defined PLAYER_MOGGY_STYLE
				// In top view, max velocity component takes precedence
					ld  a, (_hit_v)
					ld  c, a 
					ld  a, (_hit_h)
					or  c 
					jr  z, m_evil_tile_hit_done
			
					.m_evil_tile_hit_do
						ld  a, (_rdi) 
						or  a
						jr  z, m_evil_tile_hit_v

					.m_evil_tile_hit_h
						ld  hl, (_pvx_total)
						call l_neg 
						ld  (_player + 6), hl 		// player.vx
						jr  m_evil_tile_vel_set

					.m_evil_tile_hit_v
						ld  hl, (_pvy_total)
						call l_neg 
						ld  (_player + 8), hl 		// player.vy
						
			#else
				// In side view, vertical hit takes precedence

				.m_evil_tile_hit_check_v
					ld  a, (_hit_v)
					or  a 
					jr  z, m_evil_tile_hit_check_h

					ld  hl, (_pvy_total)
					call l_neg 
					ld  (_player + 8), hl 		// player.vy
					jr  m_evil_tile_vel_set

				.m_evil_tile_hit_check_h
					ld  a, (_hit_h)
					or  a
					jr  z, m_evil_tile_hit_done

					ld  hl, (_pvx_total)
					call l_neg 
					ld  (_player + 6), hl 		// player.vx

			#endif

			.m_evil_tile_vel_set

			#ifdef PLAYER_FLICKERS
					// Cancel if flickering
					ld  a, (_player + 23)			// player.estado 
					or  a 
					jr  nz, m_evil_tile_hit_done
			#endif 
					
				ld  l, 2 
				call _peta_el_beeper 
				ld  a, 1 
				ld  (_player + 46), a		// player.drain_amount
				ld  a, PLAYER_KILLED_BY_BG
				ld  (_player + 36), a 		// player.is_dead

			.m_evil_tile_hit_done

		#endasm
	#endif

	// =================================================
	//                       Extras
	// =================================================

	#ifdef PLAYER_CAN_FIRE
		#ifdef PLAYER_MOGGY_STYLE
			// TODO
		#else
			if ((pad_this_frame & sp_FIRE) == 0) fire_bullet ();
		#endif
	#endif

	#ifdef ACTIVATE_SCRIPTING
		#asm 
				ld  a, (_gpx)
				add 8
				srl a 
				srl a 
				srl a 
				srl a 
				ld  c, a 
				ld  (_tpx), a

				ld  a, (_gpy)
				add 8
				srl a 
				srl a 
				srl a 
				srl a 
				ld  (_tpy), a
				
				call _attr_2 
				ld  a, l
				ld  (_tat), a
				and 128
				jr  z, nospecial
				
				ld  hl, SC_SPECIAL_TILE_TOUCHED
				call _script
			.nospecial
		#endasm 
	#endif

	// =================================================
	//                       Select frame
	// =================================================

	#ifdef PLAYER_CUSTOM_FRAME
		player.frame = player_custom_frame ();

	#elif defined PLAYER_MOGGY_STYLE
		/*
		player.frame = player.facing;
		if (thrusting) player.frame += (((rdi ? gpx : gpy) >> 3) & 1); 
		*/
		#asm
				ld  c, 0

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_set

				ld  a, (_rdi)
				or  a 

				ld  a, (_gpx)
				jr  nz, m_frame_thrust_set
				ld  a, (_gpy)

			.m_frame_thrust_set
				srl a 
				srl a 
				srl a 
				and 1 
				ld  c, a
				
			.m_frame_set
				ld  a, (_player + 22)		// player.facing
				add c
				ld  (_player + 20), a 		// player.frame
		#endasm

	#else
			
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

			#ifdef PLAYER_ALTERNATE_ANIMATION
					// de / hl, module in de 
					ld  d, 0 
					ld  e, a 
					ld  hl, 3 
					call l_div_u
					ld  c, e 				// (_gpx >> 3) % 3
			#else
					and 1 
					ld  h, 0 
					ld  l, a 
					ld  de, _player_walk_cycle 
					add hl, de 
					ld  c, (hl)
			#endif
				jr  m_frame_set

			.m_frame_still

			#ifdef PLAYER_ALTERNATE_ANIMATION
				ld  c, 0
			#else
				ld  c, 1
			#endif

			.m_frame_set
				ld  a, (_player + 22) 		// player.facing
				add c
				ld  (_player + 20), a 		// flayer.frame
		#endasm 
	#endif

	//player.next_frame = player_cells [player.frame];
	#asm
			ld  hl, (_player + 20) 		// player.frame 
			ld  h, 0
			add hl, hl 
			ld  de, _player_cells 
			add hl, de 
			ld  a, (hl) 
			inc hl 
			ld  h, (hl)
			ld  l, a 
			ld  (_player + 17), hl 		// player.next_frame
	#endasm
}

void shl_player_coords (void) {
	#asm
			ld  a, (_gpx)
			call Ashl16_HL
			ld  (_player), hl

			ld  a, (_gpy)
			call Ashl16_HL
			ld  (_player + 2), hl
	#endasm
}

void init_player_values (void) {
	gpx = 		PLAYER_INI_X << 4;
	gpy =		PLAYER_INI_Y << 4;
	
	#asm
			call _shl_player_coords

			ld  hl, 0
			ld  (_player + 6), hl 				// .vx
			ld  (_player + 8), hl 				// .vy

			xor a
			ld  (_player + 19), a 				// .saltando
			ld  (_player + 20), a 				// .frame
			ld  (_player + 23), a 				// .estado
			ld  (_player + 24), a 				// .ct_estado
			ld  (_player + 36), a 				// .is_dead

		#if defined PLAYER_MOGGY_STYLE && !defined FAKE_SIDE_VIEW
				ld  a, GENITAL_FACING_DOWN
		#endif

			ld (_player + 22), a 				// .facing
	#endasm
}

void init_player (void) {
	// Initialize player with initial values.
	// (hence the initialize thing)
	init_player_values ();

	#asm
			ld  hl, PLAYER_LIFE
			ld  (_player + 29), hl 				// .life
			xor a
			ld  (_player + 27), a 				// .objs
			ld  (_player + 28), a 				// .keys
			ld  (_player + 32), a 				// .killed
	#endasm
}

void init_hotspots (void) {
	#asm
			// iterate MAP_W*MAP_H times
			// start with _hotspots + 2
			// set to 1, increment pointer by 3
			ld  b, MAP_W * MAP_H
			ld  hl, _hotspots + 2
			ld  de, 3
			ld  a, 1
		.init_hotspots_loop
			ld  (hl), a
			add hl, de
			djnz init_hotspots_loop
	#endasm
}

#if !defined UNPACKED_MAP
	void draw_and_advance (void) {
		#asm
				ld  bc, (__n)
				ld  b, 0
				ld  hl, _comportamiento_tiles
				add hl, bc
				ld  a, (hl)

				ld  bc, (_rdi)
				ld  b, 0

				ld  hl, _map_attr
				add hl, bc
				ld  (hl), a

				ld  hl, _map_buff
				add hl, bc
				ld  a, (__n)
				ld  (hl), a

				ld  a, (_rdx)
				add VIEWPORT_X
				ld  h, 0
				ld  l, a
				push hl

				ld  a, (_rdy)
				add VIEWPORT_Y
				ld  h, 0
				ld  l, a
				push hl

				ld  hl, (__n)
				ld  h, 0
				push hl

				call _draw_coloured_tile

				pop bc
				pop bc
				pop bc

			#ifdef ENABLE_ANIMATED_TILES
					ld  a, (__n)
					cp  ENABLE_ANIMATED_TILES
					jr  c, tilanims_add_done

				.tilanims_add
					ld  a, (_ta_i)
					ld  b, 0
					ld  c, a 
					
					ld  hl, _ta_x
					add hl, bc 
					ld  a, (_rdx)
					srl a
					ld  (hl), a 
					
					ld  hl, _ta_y
					add hl, bc 
					ld  a, (_rdy)
					srl a
					ld  (hl), a 
					
					ld  hl, _ta_t
					add hl, bc 
					ld  a, (__n)
					ld  (hl), a 
					
					call _rand 		// Doesn't trash BC
					ld  a, l 
					and TILANIM_PERIOD-1
					ld  hl, _ta_c 
					add hl, bc 
					ld  (hl), a 

					ld  hl, _ta_i
					inc (hl) 
				.tilanims_add_done
			#endif

				ld  a, (_rdx)
				add 2
				cp  30
				jr  nz, draw_and_advance_x_set

				ld  a, (_rdy)
				add 2
				ld  (_rdy), a

				xor a
			
			.draw_and_advance_x_set
				ld  (_rdx), a

				ld  hl, _rdi
				inc (hl)
		#endasm
	}
#endif

void calc_hotspot_ptr (void) {
	#asm
			ld  hl, (_n_pant)
			ld  h, 0
			ld  b, h
			ld  c, l
			add hl, hl 			// x2
			add hl, bc 			// x3
			ex  de, hl
	#endasm
}

void hotspot_paint (void) {
	// Is there an object in this screen?
	
	#asm
			ld  a, 240
			ld  (_hotspot_y), a 
			xor a
			ld  (_hotspot_t_r), a 					// Hotspot type set to 0

			// Check if hotspots are disabled

			ld  a, (_scenery_info + 0) 				// scenery_info.hide_hotspots
			or  a 
			ret nz

			call _calc_hotspot_ptr
			
			ld  ix, _hotspots
			add ix, de 								// ix points to current room's hotspot

			// Struct is xy, tipo, act

			ld  a, (ix+2) 		// .act
			cp  1
			jr  nz, hotspot_paint_act_skip 			// If taken, jump to skip

			ld  a, (ix+1)		// .tipo
			or  a
			jr  z, hotspot_paint_act_skip 			// If 0 (no hotspot) jump to skip

			ld  (_hotspot_t_r), a 					// save hotspot type

		.hotspot_paint_act_skip 					

		#if !defined DEACTIVATE_REFILLS 
				ld  a, (ix+2) 		// .act
				or  a
				jr  nz, hotspot_paint_noact_skip

				call _rand
				ld  a, l
				and 3
				cp  2
				jr  nz, hotspot_paint_noact_skip

				ld  a, 3
				ld  (_hotspot_t_r), a

			.hotspot_paint_noact_skip
		#endif		

			ld  a, (_hotspot_t_r)
			or  a
			ret z

			// Calculate tile coordinates
			// Convert to pixels and store

			ld  a, (ix+0) 		// .xy, byte = XY (nibbles)
			ld  b, a
			and 0xf0
			ld  (_hotspot_x), a
			srl a
			srl a
			srl a
			srl a
			ld  (_rdx), a
			ld  e, a 			// E = rdx
			ld  a, b
			and 15
			ld  (_rdy), a
			ld  b, a 			// B = rdy
			sla a
			sla a
			sla a
			sla a
			ld  (_hotspot_y), a

			// orig_tile = map_buff [15 * rdy + rdx];
			// 15*rdy + rdx = 16*rdy - rdy + rdx = hotspot_y - rdy + rdx
			sub b
			add e

			ld  c, a
			ld  b, 0
			ld  hl, _map_buff
			add hl, bc
			ld  a, (hl)
			ld  (_orig_tile), a
		
		// Draw the object.
	
			ld  a, (_rdx)
			sla a 
			add VIEWPORT_X
			ld  (__x), a

			ld  a, (_rdy)
			sla a 
			add VIEWPORT_Y
			ld  (__y), a

			ld  a, (_hotspot_t_r)
			ld  b, a
			cp  3
			
			ld  a, HOTSPOTS_FIRST_TILE
			jr  z, hotspot_paint_set_t

			add b
		.hotspot_paint_set_t
			ld  (__t), a
			call _draw_coloured_tile_do
	#endasm
}

void draw_scr_background (void) {
	#asm
			xor a
			ld  (_rdx), a
			ld  (_rdy), a
			ld  (_rdi), a
		#ifdef ENABLE_ANIMATED_TILES
				ld  (_ta_i), a
		#endif
	#endasm

	#ifdef RLE_MAP
		#asm
			._draw_scr_get_scr_address
				// Full 16 bits calculation
				ld  hl, (_n_pant)
				ld  h, 0
				add hl, hl
				ld  de, _mapa

				add hl, de 		; HL = map + (n_pant << 1)
				ld  e, (hl)
				inc hl
				ld  d, (hl) 	; DE = index
				ld  hl, _mapa
				add hl, de      ; HL = map + index
				ld  (_gp_gen), hl		
		#endasm
	#elif defined UNPACKED_MAP
		gp_gen = mapa + (n_pant * 150);
	#else
		gp_gen = mapa + (n_pant * 75);
	#endif

	#ifdef UNPACKED_MAP
		// UNPACKED map, every byte represents one tile.
		
		for (gpit = 0; gpit < 150; gpit ++) {
			rdd = *gp_gen ++;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdd == COIN_TILE && 0 == scenery_info.show_coins) rdd = COIN_TILE_DEACT_SUBS;
			#endif
			map_attr [rdi] = comportamiento_tiles [rdd];
			map_buff [rdi] = rdd;
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rdd);
			rdi ++;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
		}
	#elif defined RLE_MAP
		// RLE'd map, inserted as an insert from a future age

		#asm
			._draw_scr_rle
				
			._draw_scr_loop
				ld  a, (_rdi)
				cp  150
				jr  z, _draw_scr_loop_done

				ld  hl, (_gp_gen)
				ld  a, (hl)
				inc hl
				ld  (_gp_gen), hl
				
				ld  (_rdn), a

			#if RLE_MAP == 44
				and 0x0f
			#elif RLE_MAP == 53
				and 0x1f
			#else
				and 0x3f
			#endif			

			#ifdef MAPPED_TILESETS
				ld  hl, (_tileset_mappings)
				add a, l
				ld  l, a
				jr  nc, dsl_noinc
				inc h
			.dsl_noinc
				ld  a, (hl)
			#endif

				ld  (_rdc), a

			._draw_scr_advance_loop
				ld  a, (_rdn)
			#if RLE_MAP == 44
				cp  0x10
			#elif RLE_MAP == 53			
				cp  0x20
			#else
				cp  0x40
			#endif

				jr  c, _draw_scr_advance_loop_done

			#if RLE_MAP == 44
				sub 0x10
			#elif RLE_MAP == 53
				sub 0x20
			#else
				sub 0x40
			#endif
				ld  (_rdn), a

				call _advance_worm

				// That's it!

				jr _draw_scr_advance_loop

			._draw_scr_advance_loop_done
				call _advance_worm

				jr _draw_scr_loop

				#ifndef NO_ALT_BG
					.no_alt_bg_subst
						or  a
						ret  nz

						call _rand
						ld  a, l
						and 15
						cp  2
						jr  nc, draw_scr_alt_no

						ld  a, HOTSPOTS_FIRST_TILE + 3
						ret

					.draw_scr_alt_no
						xor a
						ret
				#endif

			._advance_worm
				ld  a, (_rdc)

				#ifndef NO_ALT_BG
					call no_alt_bg_subst
				#endif

				ld  (__n), a
				call _draw_and_advance
				ret

			._draw_scr_loop_done
		#endasm		
	#else
		// PACKED map, every byte packs two tiles.

		#asm
				xor a
				ld  (_rdi), a
				ld  (_gpit), a

			.draw_scr_bg_loop
				
				ld  hl, (_gp_gen)
				ld  a, (hl)
				inc hl
				ld  (_gp_gen), hl
				ld  b, a

				srl a
				srl a
				srl a
				srl a

				#if defined USE_COINS && defined COINS_DEACTIVABLE
						call coins_check
				#endif

				ld  (_rdt1), a

				ld  a, b
				and 15

				#if defined USE_COINS && defined COINS_DEACTIVABLE
						call coins_check
				#endif

				ld  (_rdt2), a


				ld  a, (_rdt1)
				#ifndef NO_ALT_BG
						call no_alt_bg_subst
				#endif
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_rdt2)
				#ifndef NO_ALT_BG
						call no_alt_bg_subst
				#endif
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_gpit)
				inc a
				ld  (_gpit), a
				cp  75
				jr  nz, draw_scr_bg_loop

				jr  draw_scr_bg_loop_end

				#ifndef NO_ALT_BG
					.no_alt_bg_subst
						ld  c, a
						call _rand
						ld  a, l
						and 15
						cp  2
						jr  nc, draw_scr_alt_no

						ld  a, c
						or  a
						ret  nz

						ld  a, HOTSPOTS_FIRST_TILE + 3
						ret

					.draw_scr_alt_no
						ld  a, c
						ret
				#endif
			.draw_scr_bg_loop_end
		#endasm
	#endif	

	hotspot_paint ();

	#ifndef DEACTIVATE_KEYS
		// Is there a bolt which has been already opened in this screen?
		// If so, delete it:

		#asm
				ld  hl, _cerrojos
				ld  b, MAX_CERROJOS

			.draw_scr_bolts_loop
				; Cerrojos structure is np, x, y, st
				ld  c, (hl)		; np
				inc hl
				ld  d, (hl) 	; x
				inc hl
				ld  e, (hl)		; y 
				inc hl 
				ld  a, (hl) 	; st
				inc hl

				; Open lock? (st == 0)
				or  a 
				jr  nz, draw_scr_bolts_continue

				; Current screen? 
				ld  a, (_n_pant)
				cp  c
				jr  nz, draw_scr_bolts_continue

				; Clear bolt
				push bc

				ld  a, d
				ld  c, d 				;; Call directly needs C
				ld  (__x), a
				ld  a, e
				ld  (__y), a
				xor a
				ld  (__t), a
				ld  a, (_comportamiento_tiles)	;; beh [0]
				ld  (__n), a

				call set_map_tile_do

				pop bc

			.draw_scr_bolts_continue
				djnz draw_scr_bolts_loop
		#endasm
	#endif	
}

#ifdef ENABLE_ANIMATED_TILES
	void tilanims_do (void) {
		#asm
				ld  a, (_ta_i)
				or  a 
				ret z

				ld  bc, 0
			.tilanims_do_loop
				ld  hl, _ta_c 
				add hl, bc 
				dec (hl)
				jr  nz, tilanims_do_continue

				ld  a, TILANIM_PERIOD
				ld  (hl), a

				// Get tile, flip bit 1, write back
				ld  hl, _ta_t
				add hl, bc 
				ld  a, (hl)
				xor 1 
				ld  (hl), a 

				// We'll be painting tile iN A
				ld  (__t), a 
				ld  e, a 
				ld  d, 0 
				ld  hl, _comportamiento_tiles 
				add hl, de 
				ld  a, (hl)
				ld  (__n), a  				// Tile beh

				ld  hl, _ta_y 
				add hl, bc 
				ld  a, (hl)
				ld  (__y), a 

				ld  hl, _ta_x 
				add hl, bc 
				ld  a, (hl)
				ld  (__x), a 

				push bc 
				ld  c, a 					// Call directly needs C
				call set_map_tile_do
				pop bc

			.tilanims_do_continue
				inc c 
				ld  a, (_ta_i)
				cp  c
				jr  nz, tilanims_do_loop
		#endasm
	}
#endif

void enems_calc_frame (void) {
	// en_an_next_frame [enit] = enem_cells [en_an_base_frame [enit] + en_an_frame [enit]];
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

			sla a 			// This will work in 8 bit. Always few frames max.			
			ld  c, a 		// B is already 0
			ld  hl, _enem_cells

			add hl, bc 		// HL -> enem_cells [...]
			pop de 			// DE -> en_an_next_frame [enit]

			ldi
			ldi
	#endasm
}

void draw_scr (void) {
	// This function draws and sets up current screen.

	// Seed the RNG
	seed = n_pant + 1;
	
	// Draw tiles
	draw_scr_background ();

	// Set up enemies.

	#asm
		._enems_init
	#endasm

	enoffs = n_pant * MAX_ENEMS;
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		#asm
				ld  bc, (_enit)
				xor a
				ld  b, a
				ld  hl, _en_an_frame
				add hl, bc
				ld  (hl), a 				// en_an_frame [enit] = 0;
				ld  hl, _en_an_state
				add hl, bc
				ld  (hl), a 				// en_an_state [enit] = 0;

			#ifdef RANDOM_RESPAWN
					ld  hl, _en_an_fanty_activo
					add hl, bc 
					ld  (hl), a 				// en_an_fanty_activo [enit] = 0;
			#endif
				
				ld  hl, (_enoffs)
				add hl, bc
				ld  (_enoffsmasi), hl 		// enoffsmasi = enit + enoffs;

				// Get values to temp vars for size & speed
				call enems_get_values
		#endasm

		switch (_en_t) {
			case 1:
			case 2:
			case 3:
			case 4:
				enems_en_an_calc (_en_t - 1);
				break;
			default:
				en_an_next_frame [enit] = sprite_18_a;
		}

		#ifdef ENABLE_CUSTOM_ENEMS
			extra_enems_init ();
		#endif

		#asm
			// Store temp values in array
				call enems_update_values_store
		#endasm
	}

	#ifdef PLAYER_CAN_FIRE
		init_bullets ();
	#endif

	#ifdef ACTIVATE_SCRIPTING
		// Run "ENTERING ANY" script (if available)
		script (SC_ENTERING_ANY);

		#ifndef NO_INDEXED_SCRIPTING
			// Run "ENTERING" script for THIS screen (if available)
			script (SC_ENTERING_SCREEN + (n_pant << 1));
		#endif
	#endif
}

#ifdef PLAYER_CAN_FIRE
	void mueve_bullets (void) {		
		#ifdef PLAYER_MOGGY_STYLE
			// TODO
		#else	
			for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
				bullets_x [gpit] += bullets_mx [gpit];
				_x = bullets_x [gpit] >> 4;
				_y = bullets_y [gpit] >> 4; 
				rdi = attr (_x, _y);
				if ((rdi & 8) || bullets_x [gpit] > 240) {
					bullets_estado [gpit] = 0;
				}
			}	
		#endif
	}
#endif	

#ifndef PLAYER_MOGGY_STYLE
	void platform_get_player (void) {
		#asm
				ld  a, 1
				ld  (_player + 25), a 		// .gotten
				ld  a, (__en_y)
				sub 16
				ld  (_gpy), a 
				call Ashl16_HL
				ld  (_player + 2), hl 		// .y
				ld  hl, 0
				ld  (_player + 8), hl 		// .vy
				srl a
				srl a
				srl a
				srl a
				ld  a, (__en_my)
				call Ashl16_HL
				call withSign
				ld  (_ptgmy), hl
		#endasm
	}
#endif

#if defined ENEMIES_MAY_DIE
	void enems_kill (unsigned char damage) {
		// Kill enemy

		#if ENEMS_LIFE_GAUGE > 1
			if (_en_life >= damage) {
				_en_life -= damage;
			} else {
				_en_life = 0;
			}
		#endif

		// Update frame
		
		en_an_next_frame [enit] = sprite_17_a;											
												
		#asm
				ld  a, (__en_x)
				ld  (_rdx), a
				ld  a, (__en_y)
				ld  (_rdy), a 
				call _render_this_enemy
		#endasm

		// Show changes
		
		#ifdef CPC
			cpc_UpdateNow (1);
		#else 
			#asm
				call SPUpdateNow
			#endasm
		#endif

		#if ENEMS_LIFE_GAUGE > 1
			if (_en_life == 0) 
		#else
			if (damage)
		#endif
		{
			peta_el_beeper (0);

			#ifdef CPC
				cpc_HardPause (10);
			#endif 

			// Sprite empty
			en_an_next_frame [enit] = sprite_18_a;
			
			// Mark dead
			_en_t |= 128;			// dead

			// Count
			player.killed ++;

			#ifdef ACTIVATE_SCRIPTING
				script (SC_PLAYER_KILLS_ENEMY);
			#endif								

			#ifdef RANDOM_RESPAWN								
				en_an_fanty_activo [enit] = 0;
				#if ENEMS_LIFE_GAUGE > 1
					_en_life = FANTIES_LIFE_GAUGE;
				#endif
			#endif

			#ifdef ENABLE_CUSTOM_ENEMS
				extra_enems_killed ();
			#endif		
		} else {
			peta_el_beeper (1);
		}
	}
#endif

void mueve_bicharracos (void) {
	// This function moves the active enemies.
	en_tocado = 0;
	player.gotten = 0;
	ptgmx = ptgmy = 0;
	
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		enoffsmasi = enoffs + enit;

		// Copy array values to temporary variables as fast as possible
		#asm
				call enems_get_values
		#endasm

		#if defined ENEMIES_MAY_DIE
			// Is enem dead?
			if ((_en_t & 128)
				#ifdef RANDOM_RESPAWN
					&& (en_an_fanty_activo [enit] == 0)
				#endif
			) goto enems_loop_continue;
		#endif

		if (_en_t != 0) {

			// Animate
			#asm
					ld  a, (_maincounter)
					and 3
					jr  nz, enems_animate_done

					ld  bc, (_enit)
					ld  b, 0

					ld  hl, _en_an_frame
					add hl, bc
					ld  a, (hl)
					xor 1
					ld  (hl), a

				.enems_animate_done
			#endasm

			// Basic linear movement x = x + mx, etc.
			if (_en_t <= 4) {
				#asm
						call en_lineal_do
				#endasm
			}

			// Fanties engine
			#ifdef RANDOM_RESPAWN
				#asm

						ld  bc, (_enit)
						ld  b, 0

					// if (!fanty_activo) goto .end

						ld  hl, _en_an_fanty_activo
						add hl, bc 
						ld  a, (hl) 
						or  a 
						jp  z, fantys_end

					// Save frame to ixl 

						ld  hl, _en_an_frame 
						add hl, bc 
						ld  a, (hl)
						ld  ixl, a

					// Prepare a 16 bits index (enit) I can use when I need

						ld  a, c
						sla a  							// enit * 2, 16 bits here
						ld  (_gp_gen), a 
						xor a 
						ld  (_gp_gen + 1), a 

					// Determine if player should repel or attract fanties

						call _player_hidden 
						ld  a, l 

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

					// UPDATE VELOCITY
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
						call l_gt 						// C if DE >= HL
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
						call l_gt 						// C if DE >= HL
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
					.fantys_update

					// MOVE FANTY WITH VELOCITY

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
						call l_gt  						// C if DE >= HL 
						jr  c, fanty_x_ex_de_zero_velocity

					.fanty_x_limit_1
						// if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
						ld  hl, 0 // -1024 
						call l_lt  						// C if DE < HL
						jr  nc, fanty_x_write

					.fanty_x_ex_de_zero_velocity
						ex  de, hl
						ld  hl, (_gp_gen) 				// INDEX
						ld  bc, _en_an_vx 
						add hl, bc 
						xor a 
						ld  (hl), a 
						inc hl
						ld  (hl), a 

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
						ld  hl, 9216  
						call l_gt  						// C if DE >= HL 
						jr  c, fanty_y_ex_de_zero_velocity

					.fanty_y_limit_1
						// if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;
						ld  hl, 0  
						call l_lt 						// C if DE < HL
						jr  nc, fanty_y_write

					.fanty_y_ex_de_zero_velocity
						ex  de, hl
						
						ld  hl, (_gp_gen) 				// INDEX
						ld  bc, _en_an_vy 
						add hl, bc 
						xor a 
						ld  (hl), a 
						inc hl
						ld  (hl), a 

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

					.fanty_rr_done

						ld  bc, (_enit)
						ld  b, 0 
						ld  hl, _en_an_frame
						add hl, bc 
						ld  a, ixl 
						;ld  (hl), a

					.fantys_end
				#endasm 
			#endif

			enems_calc_frame ();

			#ifdef ENABLE_CUSTOM_ENEMS
				extra_enems_move ();
			#endif		

			#ifndef PLAYER_MOGGY_STYLE	
				if ( (_en_t == 4
					) && gpx >= _en_x - 15 && gpx <= _en_x + 15
				) {
					#asm
						.moving_platforms
							// if (player.saltando == 0 || player.cont_salto > 4)
							ld  a, (_player + 19) 		// .saltando
							or  a
							jr  z, moving_platforms_do

							ld  a, (_player + 14)			// .cont_salto
							cp  5 						// a > 4 === a >= 5
							jp  c, moving_platforms_done

						.moving_platforms_do

						.moving_platforms_vert
							// Vertical
							// if (_en_my) 
							ld  a, (__en_my)
							or  a
							jr  z, moving_platforms_vert_done

							// Negative/positive
							bit 7, a
							jr  z, moving_platforms_vert_down

						.moving_platforms_vert_up
							// if (gpy + 17 >= _en_y && gpy + 11 <= _en_y)

							// gpy + 17 >= _en_y
							ld  a, (__en_y)
							ld  c, a
							ld  a, (_gpy)
							add 17
							cp  c
							jr  c, moving_platforms_vert_done

							// gpy + 11 <= _en_y -> _en_y >= gpy + 11
							ld  a, (_gpy)
							add 11
							ld  c, a
							ld  a, (__en_y)
							cp  c
							jr  c, moving_platforms_vert_done

							call _platform_get_player

							jr  moving_platforms_vert_done

						.moving_platforms_vert_down
							// if (gpy + 20 >= _en_y && gpy + 13 <= _en_y)

							// gpy + 20 >= _en_y
							ld  a, (__en_y)
							ld  c, a
							ld  a, (_gpy)
							add 20
							cp  c
							jr  c, moving_platforms_vert_done

							// gpy + 13 <= _en_y -> _en_y >= gpy + 13
							ld  a, (_gpy)
							add 13
							ld  c, a
							ld  a, (__en_y)
							cp  c
							jr  c, moving_platforms_vert_done

							call _platform_get_player

						.moving_platforms_vert_done

						.moving_platforms_horz
							// if (_en_mx != 0 && gpy >= _en_y - 16 && gpy <= _en_y - 11 && player.vy >= 0)
							ld  a, (__en_mx)
							or  a
							jr  z, moving_platforms_done

							// gpy >= _en_y - 16 -> gpy + 16 >= _en_y
							ld  a, (__en_y)
							ld  c, a
							ld  a, (_gpy)
							add 16
							cp  c
							jr  c, moving_platforms_done

							// gpy <= _en_y - 11 -> gpy + 11 <= _en_y -> _en_y >= gpy + 11
							ld  a, (_gpy)
							add 11
							ld  c, a
							ld  a, (__en_y)
							cp  c
							jr  c, moving_platforms_done

							// player.vy >= 0
							ld  a, (_player + 9)		// .vy MSB
							bit 7, a
							jr  nz, moving_platforms_done

							call _platform_get_player

							//ptgmx = (_en_mx << 6);
							ld  a, (__en_mx)
							call Ashl16_HL
							call withSign
							ld  (_ptgmx), hl

						.moving_platforms_done

					#endasm
				} else
			#endif
			{
				// Collision with enemy

				if (collide_enem ()) {
					if (
						0 == en_tocado &&
						#ifdef ENABLE_CUSTOM_ENEMS
							this_enemy_kills () &&
						#endif
						(_en_t < 128 
							#ifdef RANDOM_RESPAWN
								|| en_an_fanty_activo [enit] == 1
							#endif
						) 
					) {
						#ifdef PLAYER_KILLS_ENEMIES
							if (
								gpy <= _en_y - 4
								&& player.vy >= -PLAYER_G 
								#ifdef PLAYER_MIN_KILLABLE
									&& _en_t >= PLAYER_MIN_KILLABLE
								#endif
								#ifdef PLAYER_MAX_KILLABLE
									&& _en_t <= PLAYER_MAX_KILLABLE
								#endif
							) {
								// Step on enemy and kill it.
								player.vy = -PLAYER_MAX_VY_SALTANDO;
								#asm
										ld  a, (__en_y)
										cp  BOUNDING_SIZE
										jr  c, cwepke_zero
										sub BOUNDING_SIZE
										jr  cwepke_w
									.cwepke_zero
										xor a 
									.cwepke_w
										ld  (_gpy), a
										call Ashl16_HL
										ld  (_player + 2), hl 		// player.y
								#endasm
								enems_kill (0xff);
							} else	
						#endif
							
						if (player.estado == EST_NORMAL) {
							en_tocado = 1; player.is_dead = 1; peta_el_beeper (2);
							
							player.drain_amount = 1;
							player.is_dead = PLAYER_KILLED_BY_ENEM;
							
							#ifdef PLAYER_BOUNCES
								#ifndef PLAYER_MOGGY_STYLE	
									#if defined(RANDOM_RESPAWN)
										if (0 == en_an_fanty_activo [enit]) {
											// Bouncing!
											#asm
												// Linear colision
												.en_col_lin_h
													ld  a, (__en_mx)
													or  a 
													jr  z, en_col_lin_v

													bit 7, a 
													jr  z, en_col_lin_h_pos

												.en_col_lin_h_neg
													ld  hl, -PLAYER_MAX_VX
													jr  en_col_lin_h_write

												.en_col_lin_h_pos
													ld  hl, PLAYER_MAX_VX

												.en_col_lin_h_write
													ld  (_player + 6), hl 		// player.vx

												.en_col_lin_v
													ld  a, (__en_my)
													or  a
													jr  z, en_col_lin_end

													bit 7, a
													jr  z, en_col_lin_v_pos

												.en_col_lin_v_neg
													ld  hl, -PLAYER_MAX_VX
													jr  en_col_lin_v_write

												.en_col_lin_v_pos
													ld  hl, PLAYER_MAX_VX

												.en_col_lin_v_write
													ld  (_player + 8), hl 		// player.vy

												.en_col_lin_end
											#endasm
										} else {
											//player.vx = en_an_vx [enit] + en_an_vx [enit];
											//player.vy = en_an_vy [enit] + en_an_vy [enit];
											#asm
													ld  a, (_enit)
													sla a
													ld  b, 0
													ld  c, a

													ld  hl, _en_an_vx
													add hl, bc 

													ld  a, (hl)
													inc hl 
													ld  h, (hl)
													ld  l, a

													add hl, hl
													ld  (_player + 6), hl 			// player.vx

													ld  hl, _en_an_vy 
													add hl, bc 

													ld  a, (hl)
													inc hl 
													ld  h, (hl) 
													ld  l, a 

													add hl, hl
													ld  (_player + 8), hl 			// player.vy
											#endasm
										}
									#else
										#asm
												// Linear colision
												.en_col_lin_h
													ld  a, (__en_mx)
													or  a 
													jr  z, en_col_lin_v

													bit 7, a 
													jr  z, en_col_lin_h_pos

												.en_col_lin_h_neg
													ld  hl, -PLAYER_MAX_VX*2
													jr  en_col_lin_h_write

												.en_col_lin_h_pos
													ld  hl, PLAYER_MAX_VX*2

												.en_col_lin_h_write
													ld  (_player + 6), hl 		// player.vx

												.en_col_lin_v
													ld  a, (__en_my)
													or  a
													jr  z, en_col_lin_end

													bit 7, a
													jr  z, en_col_lin_v_pos

												.en_col_lin_v_neg
													ld  hl, -PLAYER_MAX_VX*2
													jr  en_col_lin_v_write

												.en_col_lin_v_pos
													ld  hl, PLAYER_MAX_VX*2

												.en_col_lin_v_write
													ld  (_player + 8), hl 		// player.vy

												.en_col_lin_end
											#endasm
									#endif
								#else
									// Bouncing:
									
									// x
									if (_en_mx) {
										if (gpx < _en_x) player.vx = - (abs (_en_mx << 1) << 7);
										else player.vx = abs (_en_mx + _en_mx) << 7;
									}
									
									// y
									if (_en_my) {
										if (gpy < _en_y) player.vy = - (abs (_en_my << 1) << 7);
										else player.vy = abs (_en_my + _en_my) << 7;
									}
								#endif
							#endif
						}
					}

					#ifdef ACTIVATE_SCRIPTING
						script (SC_ENEMY_TOUCHED);
					#endif
				}

				#ifdef PLAYER_CAN_FIRE
					// Collision with bullets
					if (
					#ifdef RANDOM_RESPAWN
						(_en_t < 128 || en_an_fanty_activo [enit] == 1)
					#else
						(_en_t < 128)
					#endif
					#ifndef PLAYER_MOGGY_STYLE
						&& _en_t != 4
					#endif
					) {
						for (en_j = 0; en_j < MAX_BULLETS; en_j ++) {
							#asm
									ld  bc, (_en_j)
									ld  b, 0

									ld  hl, _bullets_estado
									add hl, bc
									ld  a, (hl)
									or  a
									jp  z, enems_coll_bullets_continue

								// Bullet is active. Collide?
								// if (bullets_y [en_j] >= _en_y - 4 

									ld  a, (__en_y)
									sub 4
									ld  d, a
									ld  hl, _bullets_y
									add hl, bc
									ld  a, (hl)
									cp  d 
									jp  c, enems_coll_bullets_continue

								// && bullets_y [en_j] <= _en_y + 12 -> _en_y + 12 >= bullets_y [en_j]
									ld  d, a
									ld  a, (__en_y)
									add 12
									cp  d
									jp  c, enems_coll_bullets_continue

								// && bullets_x [en_j] >= _en_x - 4 
									ld  a, (__en_x)
									sub 4
									ld  d, a 
									ld  hl, _bullets_x
									add hl, bc 
									ld  a, (hl) 
									cp  d 
									jp  c, enems_coll_bullets_continue

								// && bullets_x [en_j] <= _en_x + 12) { -> _en_x + 12 >= bullets_x [en_j]
									ld  d, a
									ld  a, (__en_x)
									add 12
									cp  d
									jp  c, enems_coll_bullets_continue
							#endasm
							
							#ifdef RANDOM_RESPAWN	
								if (en_an_fanty_activo [enit]) {
									en_an_vx [enit] += (bullets_mx [en_j] > 0 ? 128 : -128);
								}
							#endif
							
							bullets_estado [en_j] = 0;
							
							enems_kill (1);
							
							#asm
								.enems_coll_bullets_continue
							#endasm
						}
					}
				#endif
			}

			#ifdef ENABLE_CUSTOM_ENEMS
				extra_enems_checks ();
			#endif
		}

		enems_loop_continue:

		#ifdef RANDOM_RESPAWN
			// Activate fanty

			#asm
				// Should we create?

					ld  a, (_scenery_info + 1) 	// scenery_info.dont_make_rr
					or  a 
					jr  nz, enems_create_fanty_done 

					ld  a, (__en_t) 
					and 128 
					jr  z, enems_create_fanty_done 

					call _rand 
					ld  a, l
					and 31 
					jr  nz, enems_create_fanty_done

					ld  bc, (_enit) 
					ld  b, 0 
					ld  hl, _en_an_fanty_activo 
					add hl, bc 
					ld  a, (hl) 
					or  a 
					jr  nz, enems_create_fanty_done

				// Create a fanty!

					inc a 				// A was 0, now it is 1.
					ld  (hl), a 		// en_an_fanty_activo [enit] = 1.

					// Position Y depends on player Y

					ld  h, b 
					ld  l, c 
					add hl, hl 
					ld  b, h 
					ld  c, l 			// We'll be indexing 16 bits from now on
					
					ld  hl, _en_an_y 
					add hl, bc 

					ld  de, 0
					ld  a, (_gpy) 
					cp  120 
					jr  nc, fanty_create_set_y

					ld  de, 144*64

				.fanty_create_set_y
					ld  (hl), e 
					inc hl 
					ld  (hl), d 
					
					ex  de, hl
					call HLshr6_A
					ld  (__en_y), a

					// Position X is random

				.fanty_create_pick_x
					call _rand 			// Won't trash BC
					ld  a, l 
					cp  224
					jr  nc, fanty_create_pick_x 	// Well, meh
					call Ashl16_HL 
					ex  de, hl 			// DE = rand (240) * 64

					ld  hl, _en_an_x 
					add hl, bc 
					ld  (hl), e 
					inc hl 
					ld  (hl), d

					ex  de, hl
					call HLshr6_A
					ld  (__en_x), a

					// Init velocities

					xor a 
					ld  hl, _en_an_vx 
					add hl, bc
					ld  (hl), a 
					inc hl 
					ld  (hl), a 
					ld  hl, _en_an_vy
					add hl, bc
					ld  (hl), a 
					inc hl 
					ld  (hl), a 
					
					// Ready to go fanty!

					ld	hl, 2
					call _enems_en_an_calc

				.enems_create_fanty_done
			#endasm
		#endif

		#asm		
			.enems_update_values_and_exit
				call enems_update_values_store
		#endasm
	}
}

// We've separated several routines so they can be reused,
// Maybe from custom.h, maybe from extern.h, etc.

#asm

	// ***********************************************************************
	// calc_baddies_pointer - calculates pointer to current enem in HL
	//
	// IN: 
	//     HL = enemy number (absolute) in malotes.
	// OUT:
	//     HL = pointer to enemy struct in malotes.
	// ***********************************************************************
	
	._calc_baddies_pointer
		#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
			add hl, hl 				// x2
			ld  d, h
			ld  e, l 				// DE = x2
			add hl, hl 				// x4
			add hl, hl 				// x8

			add hl, de 				// HL = x8 + x2 = x10
		#else
			ld  d, h
			ld  e, l 				// DE = x1
			add hl, hl 				// x2
			add hl, hl 				// x4
			add hl, hl 				// x8

			add hl, de 				// HL = x8 + x1 = x9
		#endif

		ld  de, _malotes
		add hl, de
		ret

	// ***********************************************************************
	// enems_get_values - Gets data from malotes into temporal variables
	//
	// IN: 
	//     `enoffsmasi` is the index of the enemy we want to extract.
	// OUT:
	//     `_en_x`, `_en_y`, `_en_mx`, `_en_my`, `_en_x1`, `_en_y1`, 
	//     `_en_x2`, `_en_y2`, `_en_t`, `_en_life` filled.
	// ***********************************************************************

	.enems_get_values
		// Those values are stored in this order:
		// x, y, x1, y1, x2, y2, mx, my, t[, life]
		// Point HL to baddies [enoffsmasi]. The struct is 9 or 10 bytes long
		// so this is baddies + enoffsmasi*(9|10) depending on PLAYER_CAN_FIRE
		ld 	hl, (_enoffsmasi)

		call _calc_baddies_pointer

		ld  (__baddies_pointer), hl 		// Save address for later

		ld  a, (hl)
		ld  (__en_x), a
		inc hl 

		ld  a, (hl)
		ld  (__en_y), a
		inc hl 

	#ifdef PACKED_ENEMS
			ld  a, (hl) 					// XY1
			ld  b, a 						// save

			and 0xf0 
			ld  (__en_x1), a

			ld  a, b
			sla a
			sla a
			sla a
			sla a
			ld  (__en_y1), a

			inc hl

			ld  a, (hl) 					// XY2
			ld  b, a 						// save

			and 0xf0 
			ld  (__en_x2), a

			ld  a, b
			sla a
			sla a
			sla a
			sla a
			ld  (__en_y2), a

			inc hl
	#else
			ld  a, (hl)
			ld  (__en_x1), a
			inc hl 

			ld  a, (hl)
			ld  (__en_y1), a
			inc hl 

			ld  a, (hl)
			ld  (__en_x2), a
			inc hl 

			ld  a, (hl)
			ld  (__en_y2), a
			inc hl 
	#endif

		ld  a, (hl)
		ld  (__en_mx), a
		inc hl 

		ld  a, (hl)
		ld  (__en_my), a
		inc hl 

		ld  a, (hl)
		ld  (__en_t), a

	#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
			inc hl 

			ld  a, (hl)
			ld  (__en_life), a
	#endif

		ret

	// ***********************************************************************
	// enems_update_values_store - Puts temp data back into malotes
	//
	// IN: 
	//     `__baddies_pointer` has a valid pointer
	// OUT:
	//     `malotes` is updated with `_en_x`, `_en_y`, `_en_mx`, `_en_my`, 
	//     `_en_x1`, `_en_y1`, `_en_x2`, `_en_y2`, `_en_t`, `_en_life`
	//
	// This routine is designed to be called after enems_get_values
	// ***********************************************************************

	.enems_update_values_store

		// Those values are stored in this order:
		// x, y, x1, y1, x2, y2, mx, my, t[, life]

		ld  hl, (__baddies_pointer) 		// Restore pointer

		ld  a, (__en_x)
		ld  (hl), a
		inc hl

		ld  a, (__en_y)
		ld  (hl), a
		inc hl

	#ifdef PACKED_ENEMS
		#ifdef FIXED_ENEMS_LIMITS
			inc hl
			inc hl
		#else
			ld  a, (__en_x1)
			ld  b, a
			ld  a, (__en_y1)
			srl a
			srl a
			srl a
			srl a
			or  b
			ld  (hl), a
			inc hl

			ld  a, (__en_x2)
			ld  b, a
			ld  a, (__en_y2)
			srl a
			srl a
			srl a
			srl a
			or  b
			ld  (hl), a
			inc hl					
		#endif
	#else
		#ifdef FIXED_ENEMS_LIMITS
			ld  bc, 4
			add hl, bc
		#else
			ld  a, (__en_x1)
			ld  (hl), a
			inc hl

			ld  a, (__en_y1)
			ld  (hl), a
			inc hl

			ld  a, (__en_x2)
			ld  (hl), a
			inc hl

			ld  a, (__en_y2)
			ld  (hl), a
			inc hl
		#endif
	#endif
		ld  a, (__en_mx)
		ld  (hl), a
		inc hl

		ld  a, (__en_my)
		ld  (hl), a
		inc hl

		ld  a, (__en_t)
		ld  (hl), a
		inc hl

	#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
		ld  a, (__en_life)
		ld  (hl), a
	#endif
		ret

	#if defined PLAYER_PUSH_BOXES || defined ENABLE_CUSTOM_ENEMS

		._en_bg_collision_check
			ld  a, (_ptx1)
			ld  c, a
			ld  a, (_pty1)
			call _attr_enems
			ld  a, l
			and ENEMIES_COLLIDE_MASK
			ret  nz 			// Non zero, A = TRUE

			ld  a, (_ptx2)
			ld  c, a
			ld  a, (_pty2)
			call _attr_enems
			ld  a, l
			and ENEMIES_COLLIDE_MASK
			ret 				// A = result

		.__ctileoff
			// A signed; A >= 0 -> 1, else 0.
			bit 7, a
			jr  z, __ctileoff_1

			xor a
			ret

		.__ctileoff_1
			ld  a, 1
			ret

		.en_xx_calc
			ld  a, (__en_x)
			srl a
			srl a
			srl a
			srl a
			ld  (_en_xx), a
			ret

		.en_yy_calc
			ld  a, (__en_y)
			srl a
			srl a
			srl a
			srl a
			ld  (_en_yy), a
			ret

	// ***********************************************************************
	// en_bg_collision_horz - checks if current enemy collided horizontally
	//                        with the BG & moves it out of the obstacle.
	//
	// IN: 
	//     * Temporal variables must be filled.
	// OUT:
	//     L = 1 if collided.
	// ***********************************************************************

		.en_bg_collision_horz
			// L = 1 if collided (also adjusts)

			ld  a, (__en_mx)
			or  a
			ld  l, a
			ret z

			call __ctileoff
			ld  (_rdi), a
			ld  c, a

			call en_xx_calc
			call en_yy_calc

			ld  a, (_en_xx)
			add c
			ld  (_ptx1), a
			ld  (_ptx2), a

			ld  a, (_en_yy)
			ld  (_pty1), a

			ld  a, (__en_y)
			add 15
			srl a
			srl a
			srl a
			srl a
			ld  (_pty2), a

			call _en_bg_collision_check
			or  a
			ld  l, a
			ret z

			ld  a, (_en_xx)
			ld  c, a
			ld  a, (_rdi)
			xor 1
			add c
			sla a
			sla a
			sla a
			sla a
			ld  (__en_x), a

		._en_bg_collision_horz_done
			ld  l, 1
			ret

	// ***********************************************************************
	// en_bg_collision_vert - checks if current enemy collided vertically
	//                        with the BG & moves it out of the obstacle.
	//
	// IN: 
	//     * Temporal variables must be filled.
	// OUT:
	//     L = 1 if collided.
	// ***********************************************************************

		.en_bg_collision_vert
			// L = 1 if collided (also adjusts)
			
			ld  a, (__en_my)
			or  a
			ld  l, a
			ret z

			call __ctileoff
			ld  (_rdi), a
			ld  c, a

			call en_xx_calc
			call en_yy_calc

			ld  a, (_en_yy)
			add c
			ld  (_pty1), a
			ld  (_pty2), a

			ld  a, (_en_xx)
			ld  (_ptx1), a

			ld  a, (__en_x)
			add 15
			srl a
			srl a
			srl a
			srl a
			ld  (_ptx2), a

			call _en_bg_collision_check
			ld  hl, 0
			
			or  a
			ld  l, a
			ret z

			ld  a, (_en_yy)
			ld  c, a
			ld  a, (_rdi)
			xor 1
			add c
			sla a
			sla a
			sla a
			sla a
			ld  (__en_y), a

		._en_bg_collision_vert_done
			ld  l, 1
			ret
	#endif

	// ***********************************************************************
	// en_lineal_do - Moves current enemy linearly. You can call this from 
	//                your custom.
	//
	// IN: 
	//     * Temporal variables must be filled.
	// OUT:
	//     L = 1 if collided.
	// ***********************************************************************

	.en_lineal_do
	
	// ***************
	// HORIZONTAL AXIS
	// ***************
	.en_linear_horizontal_axis
		ld  a, (__en_mx)
		or  a
		jr  z, en_linear_horizontal_axis_done

		// Move: en_x += _en_mx;
		ld  c, a
		ld  a, (__en_x)
		add c 
		ld  (__en_x), a

	// Now check horz. boundaries
	.en_linear_horz_bounds

		// Left of x1
		// _en_x <= _en_x1 -> _en_x1 >= _en_x
		ld  a, (__en_x)
		ld  c, a
		ld  a, (__en_x1)
		cp  c
		jr  c, horz_limit_skip_1

		ld  a, (__en_x1)
		ld  (__en_x), a

		ld  a, (__en_mx)
		call _abs_a
		ld  (__en_mx), a

		jr  horz_limit_skip_2

	.horz_limit_skip_1

		// Right of x2
		// _en_x >= _en_x2
		ld  a, (__en_x2)
		ld  c, a
		ld  a, (__en_x)
		cp  c
		jr  c, horz_limit_skip_2

		ld  a, (__en_x2)
		ld  (__en_x), a

		ld  a, (__en_mx)
		call _abs_a
		neg
		ld  (__en_mx), a

	.horz_limit_skip_2

	.en_linear_horizontal_axis_done

	#ifdef PLAYER_PUSH_BOXES
			// Check for collisions.
			
			call en_bg_collision_horz
			xor a 
			or  l
			jr  z, en_linear_horz_no_coll

			ld  a, (__en_mx)
			neg
			ld  (__en_mx), a

		.en_linear_horz_no_coll
	#endif

	// *************
	// VERTICAL AXIS
	// *************
	.en_linear_vertical_axis
		ld  a, (__en_my) 
		or  a 
		jr  z, en_linear_vertical_axis_done

		// Move: _en_y += _en_my;
		ld  c, a
		ld  a, (__en_y)
		add c 
		ld  (__en_y), a

	// Now check vert. boundaries
	.en_linear_vert_bounds

		// _en_y <= _en_y1 -> _en_y1 >= _en_y
		ld  a, (__en_y)
		ld  c, a
		ld  a, (__en_y1)
		cp  c
		jr  c, vert_limit_skip_1

		ld  a, (__en_y1)
		ld  (__en_y), a

		ld  a, (__en_my)
		call _abs_a
		ld  (__en_my), a

		jr  vert_limit_skip_2

	.vert_limit_skip_1

		// _en_y >= _en_y2
		ld  a, (__en_y2)
		ld  c, a
		ld  a, (__en_y)
		cp  c
		jr  c, vert_limit_skip_2

		ld  a, (__en_y2)
		ld  (__en_y), a

		ld  a, (__en_my)
		call _abs_a
		neg
		ld  (__en_my), a

	.vert_limit_skip_2		

	.en_linear_vertical_axis_done

	#ifdef PLAYER_PUSH_BOXES
			// Check for collisions.
			
			call en_bg_collision_vert
			xor a 
			or  l
			jr  z, en_linear_vert_no_coll

			ld  a, (__en_my)
			neg
			ld  (__en_my), a
			
		.en_linear_vert_no_coll
	#endif

	.en_linear_done
		ret

#endasm
