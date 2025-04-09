// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// engine.h

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
					jr  .clear_cerrojo_loop_done

				.clear_cerrojo_loop_continue
					inc hl
					djnz clear_cerrojo_loop

				.clear_cerrojo_loop_done
			#endasm

			player.keys --;
			play_sfx (8);
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
			#if defined PACKED_ENEMS
				#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
					ld  de, 8
				#else
					ld  de, 7
				#endif
			#else
				#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
					ld  de, 10
				#else
					ld  de, 9
				#endif
			#endif
			ld  ix, _malotes
			
			.init_malotes_loop
				// Clear 'enem is dead' flag				
			#if defined PACKED_ENEMS
					ld  a, (ix+6) 	// .t
			#else
					ld  a, (ix+8) 	// .t
			#endif
				and 127
				
			#ifdef RANDOM_RESPAWN
					cp  5
					jr  nz, init_malotes_not_5	

					or  128
				.init_malotes_not_5
			#endif

			#if defined PACKED_ENEMS
					ld  (ix+6), a 	// .t
			#else
					ld  (ix+8), a 	// .t
			#endif

			#if ((defined PLAYER_CAN_FIRE || defined ENABLE_SWORD) && ENEMS_LIFE_GAUGE > 1) || defined FORCE_ENEMS_LIFE
					ld  a, ENEMIES_LIFE_GAUGE
				#if defined PACKED_ENEMS
						ld  (ix+7), a 	// .life
				#else
						ld  (ix+9), a 	// .life
				#endif
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

		play_sfx (9);
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

#ifndef DEACTIVATE_KEYS

#endif

void move (void) {
	// Move player
	pad_read ();

	// =================================================
	//                     Vertical
	// =================================================

	#ifdef PLAYER_MOGGY_STYLE
		// Read keyboard and apply A/R to VY
	#else
		// Apply gravity

		#ifdef PLAYER_HAS_JUMP
			// Make jump
		#elif defined PLAYER_HAS_JETPAC
			// Make jetpac
		#endif
	#endif 

	// Collide vertical.
	// Includes evil tile detection, open lock & push boxes

	// =================================================
	//                     Horizontal
	// =================================================

	// Read keyboard and apply A/R to VX

	// Collide horizontal.
	// Includes evil tile detection, open lock & push boxes

	// Horizontal

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

	if defined (UNPACKED_MAP)
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

