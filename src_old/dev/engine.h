// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// engine.h

#ifndef ENEMIES_COLLIDE_MASK
	#define ENEMIES_COLLIDE_MASK 9
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

unsigned char *player_cells [] = {
	sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
	sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a,
};

unsigned char *enem_cells [] = {
	sprite_9_a, sprite_10_a, sprite_11_a, sprite_12_a,
	sprite_13_a, sprite_14_a, sprite_15_a, sprite_16_a
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
	void check_and_clear_cerrojo (unsigned char x, unsigned char y) {
		// search & toggle
		
		#asm
				ld  hl, 4
				add hl, sp
				ld  a, (hl)
				ld  (__x), a
				ld  (_rdx), a
				ld  c, a
				dec hl
				dec hl
				ld  a, (hl)
				ld  (__y), a
				ld  (_rdy), a
		#endasm 

		if (qtile (_x, _y) == 15) {

			#asm
					xor a
					ld  (__t), a
					ld  a, (_comportamiento_tiles)	;; beh [0]
					ld  (__n), a

					call set_map_tile_do

					ld  a, (_rdx)
					ld  (__x), a
					ld  a, (_rdy)
					ld  (__y), a

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

					ld  a, (__x)
					cp  d 
					jr  nz, clear_cerrojo_loop_continue

					ld  a, (__y)
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
					ld  a, ENEMIES_LIFE_GAUGE
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

		peta_el_beeper (9);
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
			//if (attr (gpxx, gpyy) == 2 || (attr (1 + gpxx, gpyy) == 2 && (gpx & 15) != 0) )	
			if (attr ((gpx + 8) >> 4, gpyy) & 2)
				return 1;
		}
		return 0;
	}
#endif

void adjust_to_tile_x (void) {
	// gpx = gpxx << 4; player.x = gpx << 6;
	#asm
			ld  a, (_gpxx)
			sla a
			sla a
			sla a
			sla a
			ld  (_gpx), a
			call Ashl16_HL
			ld  (_player), hl
	#endasm
}

void adjust_to_tile_y (void) {
	// gpy = gpyy << 4; player.y = gpy << 6;
	#asm
			ld a, (_gpyy)
			sla a
			sla a
			sla a
			sla a
			ld  (_gpy), a
			call Ashl16_HL
			ld  (_player+2), hl
	#endasm
}

#ifdef PLAYER_FLICKERS
	void player_flicker (void) {
		/*
		player.estado = EST_PARP;
		player.ct_estado = PLAYER_FLICKERS;
		*/

		#asm
				ld  a, EST_PARP 
				ld  (_player + 23), a 	// player.estado
				ld  a, PLAYER_FLICKERS 
				ld  (_player + 24), a 	// player.ct_estado
		#endasm
	}
#endif

#ifdef PLAYER_PUSH_BOXES
	void move_tile_with_check (void) {
		// Moves to x0, y0 to x1, y1 if x1, y1 is walkable
		if (attr (x1, y1) == 0) {
			set_map_tile (x0, y0, 0, 0);
			set_map_tile (x1, y1, 14, 8);
			peta_el_beeper (2);
		}
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
			ld  a, (__x)
			cp  15
			jr  nc, _cm_two_points_at1_reset

			ld  a, (__y)
			cp  10
			jr  c, _cm_two_points_at1_do

		._cm_two_points_at1_reset
			xor a
			jr  _cm_two_points_at1_done

		._cm_two_points_at1_do
			ld  a, (__y)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			ld  b, a
			ld  a, (__x)
			add b
			ld  e, a
			ld  d, 0
			ld  hl, _map_attr
			add hl, de
			ld  a, (hl)

		._cm_two_points_at1_done
			ld (_at1), a

			ld  a, (__x2)
			cp  15
			jr  nc, _cm_two_points_at2_reset

			ld  a, (__y2)
			cp  10
			jr  c, _cm_two_points_at2_do

		._cm_two_points_at2_reset
			xor a
			jr  _cm_two_points_at2_done

		._cm_two_points_at2_do
			ld  a, (__y2)
			ld  b, a
			sla a
			sla a
			sla a
			sla a
			sub b
			ld  b, a
			ld  a, (__x2)
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

void move (void) {
	hit = 0; 

	// Move player
	pad_read ();

	// =================================================
	//                     Vertical
	// =================================================

	#ifdef PLAYER_MOGGY_STYLE
		// Read keyboard and apply A/R to VY
		if ((pad0 & sp_UP) && (pad0 & sp_DOWN)) {
			if (player.vy > 0) player.vy -= PLAYER_RX;
			else if (player.vy < 0) player.vy += PLAYER_RX;
		} else {
			if ((pad0 & sp_UP) == 0) {
				player.vy -= PLAYER_AX;
				if (player.vy > PLAYER_MAX_VX) player.vy = PLAYER_MAX_VX;
				player.frame = GENITAL_FACING_UP;
			}

			if ((pad0 & sp_DOWN) == 0) {
				player.vy += PLAYER_AX;
				if (player.vy < -PLAYER_MAX_VX) player.vy = -PLAYER_MAX_VX;
				player.frame = GENITAL_FACING_DOWN;
			}
		}
	#else
		// Apply gravity
		player.vy += PLAYER_G;
		if (player.vy > PLAYER_MAX_VY_CAYENDO) player.vy = PLAYER_MAX_VY_CAYENDO;

		#ifdef PLAYER_HAS_JUMP
			// Make jump
			if (
				#ifdef PLAYER_CAN_FIRE
					((pad_this_frame & sp_UP) == 0)
				#else
					((pad_this_frame & sp_FIRE) == 0)
				#endif
				&& player.saltando == 0 && (player.possee || player.gotten)
			) {
				player.saltando = 1;
				player.cont_salto = 0;
				peta_el_beeper (3);
			}

			if (
				#ifdef PLAYER_CAN_FIRE
					((pad0 & sp_UP) == 0)
				#else
					((pad0 & sp_FIRE) == 0)
				#endif
			) {
				if (player.saltando) {
					player.cont_salto ++; if (player.cont_salto == 8) player.saltando = 0;
					player.vy -= PLAYER_VY_INICIAL_SALTO + PLAYER_INCR_SALTO - (player.cont_salto >> 1);
				}
			} else {
				player.saltando = 0;
			}

		#elif defined PLAYER_HAS_JETPAC
			// Make jetpac
		#endif
	#endif 

	player.y += player.vy;
	if (player.y < 0) player.y = 0;
	if (player.y > 144*64) player.y = 144*64;

	#asm
			ld  hl, (_player + 2)		// player.y
			call HLshr6_A
			ld  (_gpy), A
	#endasm

	// Collide vertical.
	// Includes evil tile detection, open lock & push boxes
	#ifndef PLAYER_MOGGY_STYLE
		player.possee = 0;
	#endif
	rdj = (player.vy + ptgmy);

	#ifdef PLAYER_MOGGY_STYLE
		if (rdj != 0)
	#endif 
	{
		_x = (gpx + 4) >> 4; _x2 = (gpx + 11) >> 4;
		if (rdj >= 0) {
			// Collide down

			_y = _y2 = (gpy + 15) >> 4;
			cm_two_points ();

			if (
				#if defined PLAYER_MOGGY_STYLE || defined SIMPLE_PLATFORMS
					(at1 & 12) || (at2 & 12)
				#else
					if ((at1 & 8) || (at2 & 8) || (((gpy - 1) & 15) < 8 && ((at1 & 4) || (at2 & 4))))
				#endif
			) {
				player.vy = 0;
				#asm 
						ld  a, (_gpy)
						and 0xf0 
						ld  (_gpy), a 
						call Ashl16_HL
						ld  (_player + 2), HL 	// player.y
				#endasm
				#ifndef PLAYER_MOGGY_STYLE
					player.possee = 1;
				#endif
			}

		} else if (rdj < 0) {
			// Collide up

			_y = _y2 = (gpy + 4) >> 4;
			cm_two_points ();

			if ((at1 & 8) || (at2 & 8)) {
				player.vy = 0;
				#asm 
						ld  a, (_gpy)
						and 0xf0
						add 12 
						ld  (_gpy), a 
						call Ashl16_HL
						ld  (_player + 2), HL 
				#endasm 
			}
		}

		#ifndef DEACTIVATE_EVIL_TILE
			if ((at1 & 1) || (at2 & 1)) {
				hit = 1;
			}
		#endif
	}

	// =================================================
	//                     Horizontal
	// =================================================

	// Read keyboard and apply A/R to VX
	// Read keyboard and apply A/R to VY
	
	if ((pad0 & sp_LEFT) && (pad0 & sp_RIGHT)) {
		if (player.vx > 0) player.vx -= PLAYER_RX;
		else if (player.vx < 0) player.vx += PLAYER_RX;
	} else {
		if ((pad0 & sp_LEFT) == 0) {
			player.vx -= PLAYER_AX;
			if (player.vx > PLAYER_MAX_VX) player.vx = PLAYER_MAX_VX;
			player.frame = GENITAL_FACING_LEFT;
		}

		if ((pad0 & sp_RIGHT) == 0) {
			player.vx += PLAYER_AX;
			if (player.vx < -PLAYER_MAX_VX) player.vx = -PLAYER_MAX_VX;
			player.frame = GENITAL_FACING_RIGHT;
		}
	}

	player.x += player.vx;

	#ifndef PLAYER_MOGGY_STYLE
		player.x += ptgmx;
	#endif

	if (player.x < 0) player.x = 0;
	if (player.x > 224*64) player.x = 224*64;

	#asm
			ld  hl, (_player)		// player.x
			call HLshr6_A
			ld  (_gpx), A
	#endasm

	// Collide horizontal.
	// Includes evil tile detection, open lock & push boxes
	rdj = player.vx + ptgmx;
	if (rdj != 0) {
		_y = (gpy + 4) >> 4; _y2 = (gpy + 15) >> 4;
		if (player.vx > 0) {
			// Collide right

			_x = _x2 = (gpx + 11) >> 4;
			cm_two_points ();

			if ((at1 & 8) || (at2 & 8)) {
				player.vx = 0;
				#asm 
						ld  a, (_gpx)
						and 0xf0 
						add 4
						ld  (_gpx), a 
						call Ashl16_HL
						ld  (_player), HL 	// player.x
				#endasm
			}

		} else if (rdj < 0) {
			// Collide left

			_x = _x2 = (gpx + 4) >> 4;
			cm_two_points ();

			if ((at1 & 8) || (at2 & 8)) {
				player.vx = 0;
				#asm 
						ld  a, (_gpx)
						and 0xf0
						add 12 
						ld  (_gpx), a 
						call Ashl16_HL
						ld  (_player), HL 
				#endasm 
			}
		}

		#ifndef DEACTIVATE_EVIL_TILE
			if ((at1 & 1) || (at2 & 1)) {
				hit = 1;
			}
		#endif
	}

	// Evil tile hit?
	if (hit) {
		// change sign of velocity with higher magnitude
		if (abs (player.vx) > abs (player.vy)) {
			player.vx = -player.vx;
		} else {
			player.vy = -player.vy;
		}

		player.drain_amount = 1;
		player.is_dead = PLAYER_KILLED_BY_BG;
	}

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

	// =================================================
	//                       Select frame
	// =================================================

}

void init_player_values (void) {
	gpx = 		PLAYER_INI_X << 4;
	gpy =		PLAYER_INI_Y << 4;
	
	#asm
			ld  a, (_gpx)
			call Ashl16_HL
			ld  (_player), hl

			ld  a, (_gpy)
			call Ashl16_HL
			ld  (_player + 2), hl

			ld  hl, 0
			ld  (_player+6), hl 				// .vx
			ld  (_player+8), hl 				// .vy

			xor a
			ld  (_player+19),a 					// .saltando
			ld  (_player+20),a 					// .frame
			ld  (_player+21),a 					// .subframe
			ld  (_player+23), a 				// .estado
			ld  (_player+24),a 					// .ct_estado
			ld  (_player+36),a 					// .is_dead

		#ifdef PLAYER_MOGGY_STYLE
				ld  a, GENITAL_FACING_DOWN
		#endif

			ld (_player+22),a 					// .facing
	#endasm
}

void init_player (void) {
	// Initialize player with initial values.
	// (hence the initialize thing)
	init_player_values ();

	#asm
			ld  hl, PLAYER_LIFE
			ld  (_player+29), hl 				// .life
			xor a
			ld  (_player+27), a 				// .objs
			ld  (_player+28), a 				// .keys
			ld  (_player+32), a 				// .killed
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
			ld  (_hotspot_t_r), a

			call _calc_hotspot_ptr
			
			ld  ix, _hotspots
			add ix, de

			// Struct is xy, tipo, act

			ld  a, (ix+2) 		// .act
			cp  1
			jr  nz, hotspot_paint_act_skip

			ld  a, (ix+1)		// .tipo
			or  a
			jr  z, hotspot_paint_act_skip

			ld  (_hotspot_t_r), a

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
			
			ld  a, 16
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
	#endasm

	#ifdef UNPACKED_MAP
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

						ld  a, 19
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

				#if defined USE_COINS && defined COINS_DEACTIVABLE
					call coins_check
				#endif

				ld  (__n), a
				call _draw_and_advance
				ret

				#if defined USE_COINS && defined COINS_DEACTIVABLE
					.coins_check
						cp  COIN_TILE
						ret  nz

						ld  a, (_scenery_info + 0) 	// scenery_info.showcoins
						or  a
						ret  nz

						ld  a, COIN_TILE_DEACT_SUBS					
						ret
				#endif

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

						ld  a, 19
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

		#ifdef RANDOM_RESPAWN
				// 0xff means invisible
				cp  0xff 
				jr  z, enems_calc_frame_invisible
		#endif

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

		#ifdef RANDOM_RESPAWN
				ret
			.enems_calc_frame_invisible
				pop de 			// DE -> en_an_next_frame [enit]
				ld  (de), _sprite_18_a % 256
				inc de 
				ld  (de), _sprite_18_a / 256
		#endif
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
		#endasm

		_en_t = malotes [enoffsmasi].t;

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

		#ifdef ACTIVATE_SCRIPTING
			// Run "ENTERING ANY" script (if available)
			script = e_scripts [MAP_W * MAP_H + 1];
			run_script ();
			// Run "ENTERING" script for THIS screen (if available)
			script = e_scripts [n_pant];
			run_script ();
		#endif

		#ifdef PLAYER_CAN_FIRE
			init_bullets ();
		#endif
	}
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
				ld  (_player+25), a 		// .gotten
				ld  a, (__en_y)
				sub 16
				ld  (_gpy), a 
				call Ashl16_HL
				ld  (_player+2), hl 		// .y
				ld  hl, 0
				ld  (_player+8), hl 		// .vy
				srl a
				srl a
				srl a
				srl a
				ld  (_gpyy), a 
				ld  a, (__en_my)
				call Ashl16_HL
				call withSign
				ld  (_ptgmy), hl
		#endasm
	}
#endif

#if defined PLAYER_CAN_FIRE || defined PLAYER_KILLS_ENEMIES
	void enems_kill (unsigned char damage) {
		// Kill enemy

		#if ENEMIES_LIFE_GAUGE > 1
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
			call SPUpdateNow
		#endif

		#if ENEMS_LIFE_GAUGE > 1
			if (_en_life == 0) 
		#else
			if (damage)
		#endif
		{
			peta_el_beeper (10);

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
				script = f_scripts [MAX_SCREENS + 2];
				run_script ();
			#endif								

			#ifdef RANDOM_RESPAWN								
				en_an_fanty_activo [enit] = 0;
				#if ENEMS_LIFE_GAUGE > 1
					_en_life = FANTIES_LIFE_GAUGE;
				#endif
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
			en_cx = _en_x;
			en_cy = _en_y;

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
			if (
				_en_t <= 4
				#ifdef RANDOM_RESPAWN
					|| 0 == en_an_fanty_activo [enit]
				#endif
			) {
				#asm
					
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

					.en_linear_done

				#endasm
			}

			// Fanties engine
			#ifdef RANDOM_RESPAWN
				#asm
						call _player_hidden 
						ld  a, l 
						ld  iyh, a

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

						ld  bc, (_enit)
						ld  b, 0

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

					// if (!fanty_activo) goto .end

						ld  hl, _en_an_fanty_activo
						add hl, bc 
						ld  a, (hl) 
						or  a 
						jp  z, fantys_end

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
						call _abs_a 
						cp  16
						ret

					.fanty_rr_done

						ld  bc, (_enit)
						ld  b, 0 
						ld  hl, _en_an_frame
						add hl, bc 
						ld  a, ixl 
						ld  (hl), a
				#endasm 
			#endif

			#ifdef PLAYER_PUSH_BOXES
				// Check for collisions.
				#asm
					._en_bg_collision
						call en_xx_calc
						call en_yy_calc

						ld  a, (__en_mx)
						or  a
						jr  z, _en_bg_collision_horz_done

					._en_bg_collision_horz
						ld  a, (__en_mx)
						call __ctileoff
						ld  (_rdi), a

						ld  c, a
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
						jr  z, _en_bg_collision_horz_done

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

						ld  a, (__en_mx)
						ld  c, a
						xor a
						sub c
						ld  (__en_mx), a
					
					._en_bg_collision_horz_done

						call en_xx_calc

						ld  a, (__en_my)
						or  a
						jr  z, _en_bg_collision_vert_done

					._en_bg_collision_vert
						ld  a, (__en_my)
						call __ctileoff
						ld  (_rdi), a

						ld  c, a
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
						or  a
						jr  z, _en_bg_collision_vert_done

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

						ld  a, (__en_my)
						ld  c, a
						xor a
						sub c
						ld  (__en_my), a

					._en_bg_collision_vert_done

						call en_yy_calc

						jr _en_bg_collision_end

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

					._en_bg_collision_end

				#endasm
			#endif

			enems_calc_frame ();

			#ifndef PLAYER_MOGGY_STYLE	
				if ( (_en_t == 4
					) && gpx >= _en_x - 15 && gpx <= _en_x + 15
				) {
					#asm
						.moving_platforms
							// if (player.saltando == 0 || player.cont_salto > 4)
							ld  a, (_player+19) 		// .saltando
							or  a
							jr  z, moving_platforms_do

							ld  a, (_player+14)			// .cont_salto
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
							ld  a, (_player+9)		// .vy MSB
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

				if (
					0 == en_tocado && collide_enem () && 
					(_en_t < 128 
						#ifdef RANDOM_RESPAWN
							|| en_an_fanty_activo [enit] == 1
						#endif
					) 
				) {
					#ifdef PLAYER_KILLS_ENEMIES
						if (
							gpy <= _en_y - 8 
							&& player.vy >= 0 
							#ifdef PLAYER_MIN_KILLABLE
								&& _en_t >= PLAYER_MIN_KILLABLE
							#endif
							#ifdef PLAYER_MAX_KILLABLE
								&& _en_t <= PLAYER_MAX_KILLABLE
							#endif
						) {
							// Step on enemy and kill it.
							player.vy = -PLAYER_MAX_VY_SALTANDO;
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
										if (_en_mx > 0) player.vx = PLAYER_MAX_VX;
										if (_en_mx < 0) player.vx = -PLAYER_MAX_VX;
										if (_en_my > 0) player.vy = PLAYER_MAX_VX;
										if (_en_my < 0) player.vy = -PLAYER_MAX_VX;
									} else {
										player.vx = en_an_vx [enit] + en_an_vx [enit];
										player.vy = en_an_vy [enit] + en_an_vy [enit];
									}
								#else
									// Bouncing!
									if (_en_mx > 0) player.vx = (PLAYER_MAX_VX + PLAYER_MAX_VX);
									if (_en_mx < 0) player.vx = -(PLAYER_MAX_VX + PLAYER_MAX_VX);
									if (_en_my > 0) player.vy = (PLAYER_MAX_VX + PLAYER_MAX_VX);
									if (_en_my < 0) player.vy = -(PLAYER_MAX_VX + PLAYER_MAX_VX);
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

				#ifdef PLAYER_CAN_FIRE
					// Collision with bullets
					#ifdef RANDOM_RESPAWN
						if (_en_t < 128 || en_an_fanty_activo [enit] == 1)
					#else
						if (_en_t < 128)
					#endif
					{
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
		}

		enems_loop_continue:

		#ifdef RANDOM_RESPAWN
			// Activate fanty

			#asm
				// Should we create?

					ld  a, (__en_t) 
					and 128 
					jr  z, enems_create_fanty_done 

					call _rand 
					and 31 
					xor a 
					or  l 
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

#asm
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
#endasm
