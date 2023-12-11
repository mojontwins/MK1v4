// MTE MK1 v4.9
// Copyleft 2010-2013, 2020-2023 by The Mojon Twins

// engine.h
// Cointains engine functions (movement, colliding, rendering... )

#if defined ENEMIES_COLLIDE && !defined ENEMIES_COLLIDE_MASK
	#define ENEMIES_COLLIDE_MASK 9
#endif

#if defined RAMIRO_HOVER_ON_VAR && !defined RAMIRO_HOVER
	#define RAMIRO_HOVER
#endif

#ifndef MIN_SWORD_HIT_FRAME
	#define MIN_SWORD_HIT_FRAME 3
#endif

#ifndef MAX_SWORD_HIT_FRAME
	#define MAX_SWORD_HIT_FRAME 6
#endif

unsigned char line_of_text_clear [] = "                                ";

#ifdef PLAYER_CUSTOM_CELLS
	#include "custom_player_cells.h"
#else
	extern unsigned char *player_cells [0];
	#asm
		._player_cells 
			defw SPRITE_00, SPRITE_01, SPRITE_02, SPRITE_03
			defw SPRITE_04, SPRITE_05, SPRITE_06, SPRITE_07
			#ifdef ENABLE_FRIGOABABOL
				defw _sprite_frigo
			#else
				defw 0
			#endif
			#if defined ENABLE_SWORD && defined PLAYER_MOGGY_STYLE && defined GENITAL_HIT_FRAMES
				defw SPRITE_10, SPRITE_11, SPRITE_12, SPRITE_13
			#endif
	#endasm
#endif

#ifdef ENEMS_CUSTOM_CELLS
	#include "custom_enem_cells.h"
#else
	extern unsigned char *enem_cells [0];
	#asm
			._enem_cells
				defw SPRITE_08, SPRITE_09, SPRITE_0A, SPRITE_0B
				defw SPRITE_0C, SPRITE_0D, SPRITE_0E, SPRITE_0F
	#endasm
#endif

#ifdef ENABLE_SWORD
	extern unsigned char *sword_cells [0];
	#asm 
		._sword_cells
			defw _sprite_sword, _sprite_sword + 16, _sprite_sword + 32, _sprite_sword + 48
	#endasm
#endif

void abs_a (void) {
	#asm
		bit 7, a
		ret z
		neg
	#endasm
}

void saca_a_todo_el_mundo_de_aqui (void) {
	/*
	for (gpit = 0; gpit < SW_SPRITES_ALL; gpit ++) {
		sp_sw [gpit].sp0 = (int) (SPRFR_EMPTY);
	}
	*/
	#asm
			ld  de, 15
			ld  b, SW_SPRITES_ALL
		.clear_sprites_loop
			ld  hl, BASE_SPRITES
			ld  a, #(_sprite_18_a%256)
			ld  (hl), a
			inc hl
			ld  a, #(_sprite_18_a/256)
			ld  (hl), a 
			add hl, de
			djnz clear_sprites_loop
	#endasm
}

void render_this_enemy (void) {
	// sp_sw struct is 16 bytes wide. This is easy
	// 0   2   4      6   7   8  9  10 11 12      14
	// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc
	#asm
			ld  a, (_enit)
			add SP_ENEMS_BASE
			ld  h, 0
			ld  l, a
			add hl, hl
			add hl, hl
			add hl, hl
			add hl, hl 		// x16
			ld  de, BASE_SPRITES
			add hl, de
			push hl
			pop ix

			// sp_sw [rda].cx = (rdx + VIEWPORT_X * 8 + sp_sw [rda].cox) >> 1;
			ld  a, (_rdx)
			add #(VIEWPORT_X*8)
			add (ix + 6)
			#ifndef MODE_1
				srl a
			#endif
			ld  (ix + 8), a

			// sp_sw [rda].cy = (rdy + VIEWPORT_Y * 8 + sp_sw [rda].coy);
			ld  a, (_rdy) 
			add #(VIEWPORT_Y*8)
			add (ix + 7)
			ld  (ix + 9), a

			// sp_sw [rda].sp0 = (int) (en_an_next_frame [enit]);
			ld  a, (_enit)
			sla a
			ld  b, 0
			ld  c, a
			ld  hl, _en_an_next_frame			
			add hl, bc
			ld  a, (hl)
			inc hl
			ld  h, (hl)
			ld  l, a

			ld (ix + 0), l
			ld (ix + 1), h
	#endasm
}

void calc_baddies_pointer (void) {
	#asm
		#if defined PACKED_ENEMS
			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD				
				add hl, hl 				// x2
				add hl, hl 				// x4
				add hl, hl 				// HL = x8
			#else
				ld  d, h
				ld  e, l 				// DE = x1
				add hl, hl 				// x2		
				add hl, hl 				// x4
				add hl, hl 				// x8
				or  a
				sbc hl, de 				// HL = x8 - x1 = x7
			#endif
		#else
			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
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
		#endif

		ld  de, _malotes
		add hl, de			
	#endasm
}

void render_all_sprites (void) {
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
			#ifdef RANDOM_RESPAWN
				if (en_an_fanty_activo [enit])
			#else
				if (malotes [enoffs + enit].t == 6 || malotes [enoffs + enit].t == 0)
			#endif
			{
				/*
				rdx = en_an_x [enit] >> 6;
				rdy = en_an_y [enit] >> 6;
				*/
				#asm
						ld  a, (_enit)
						sla a
						ld  c, a
						ld  b, 0

						ld  hl, _en_an_x
						add hl, bc
						ld  a, (hl)
						inc hl
						ld  h, (hl)
						ld  l, a 

						call HLshr6_A
						ld  (_rdx), a

						ld  hl, _en_an_y
						add hl, bc
						ld  a, (hl)
						inc hl
						ld  h, (hl)
						ld  l, a 

						call HLshr6_A
						ld  (_rdy), a
				#endasm
			} else 
		#endif
		{
			/*
			rdx = malotes [enoffs + enit].x;
			rdy = malotes [enoffs + enit].y;
			*/
			#asm
					ld  hl, (_enoffs)
					ld  bc, (_enit)
					ld  b, 0
					add hl, bc
					
					call _calc_baddies_pointer

					// malotes struct is:
					// x, y, x1, y1, x2, y2, mx, my, t[, life]

					ld  a, (hl)
					ld  (_rdx), a 
					inc hl 

					ld  a, (hl)
					ld  (_rdy), a 
			#endasm
		}

		#asm
				call _render_this_enemy
		#endasm
	}

	rdy = gpy; if ( 0 == (player.estado & EST_PARP) || half_life ) { rdx = gpx; } else { rdx = 240;	}
	//#ifdef BETTER_VERTICAL_CONNECTIONS
		/*
		if (rdy >= 248) rdi = VIEWPORT_Y - 1; else rdi = VIEWPORT_Y + (rdy >> 3);
		sp_MoveSprAbs (
			sp_player, spritesClip, player.next_frame - player.current_frame, 
			rdi, VIEWPORT_X + (rdx >> 3), rdx & 7, rdy & 7
		);
		*/
		// TODO
	//#else
		// This ASSUMES SP_PLAYER = 0.
		// 0   2   4      6   7   8  9  10 11 12      14
		// sp0 sp1 coord0 cox coy cx cy ox oy invfunc updfunc
		#asm
			.render_player
				ld  ix, #(BASE_SPRITES + (SP_PLAYER*16))

				// sp_sw [SP_PLAYER].cx = (gpx + VIEWPORT_X*8 + sp_sw [SP_PLAYER].cox) >> 1;
				ld  a, (_gpx)
				add #(VIEWPORT_X*8)
				add (ix + 6)
				#ifndef MODE_1
					srl a
				#endif
				ld  (ix + 8), a

				// sp_sw [SP_PLAYER].cy = (gpy + VIEWPORT_Y*8 + sp_sw [SP_PLAYER].coy);
				ld  a, (_gpy)
				add #(VIEWPORT_Y*8)
				add (ix + 7)
				ld  (ix + 9), a

				// if ( (player.estado & EST_PARP) && half_life ) 
				ld  a, (_player + 23) 		// player.estado
				and EST_PARP
				jr  z, player_render_graphic

				ld  a, (_half_life)
				or  a
				jr  z, player_render_graphic

			.player_render_empty
				ld  hl, _sprite_18_a
				jr  player_render_set_sp0

			.player_render_graphic
				ld  hl, (_player + 17)		// player.next_frame

			.player_render_set_sp0
				ld  (ix + 0), l
				ld  (ix + 1), h
		#endasm
	//#endif
	player.current_frame = player.next_frame;
	
	#ifdef PLAYER_CAN_FIRE
		bspr_it = SP_BULLETS_BASE;
		for (rdi = 0; rdi < MAX_BULLETS; rdi ++) {
			if (bullets_estado [rdi]) {
				sp_sw [bspr_it].cx = (bullets_x [rdi] + VIEWPORT_X * 8) >> 2;
				sp_sw [bspr_it].cy = (bullets_y [rdi] + VIEWPORT_Y * 8);
				sp_sw [bspr_it].sp0 = (int) (sprite_19_a);	
			} else {
				//sp_MoveSprAbs (sp_bullets [rdi], spritesClip, 0, -2, -2, 0, 0);
				sp_sw [bspr_it].cx = (VIEWPORT_X * 8) >> 2;
				sp_sw [bspr_it].cy = (VIEWPORT_Y * 8);
				sp_sw [bspr_it].sp0 = (int) (SPRFR_EMPTY);
			}
			bspr_it ++;
		}
	#endif
}

#if !defined SHORT_PLAYER
	#define BOUNDING_WIDTH 12
#else
	#define BOUNDING_WIDTH 8
#endif

unsigned char collide_enem (void) {
	#asm
			ld  hl, 0
			// (en_ccx + 12 >= gpx && en_ccx <= gpx + 12 && en_ccy + 12 >= gpy && en_ccy <= gpy + 12)

			// en_ccx + 12 >= gpx
			ld  a, (_gpx)
			ld  c, a
			ld  a, (_en_ccx)
			
			add BOUNDING_WIDTH
			
			cp  c
			ret c

			// en_ccx <= gpx + 12; gpx + 12 >= en_ccx
			ld  a, (_en_ccx)
			ld  c, a
			ld  a, (_gpx)
			
			add BOUNDING_WIDTH
			
			cp  c
			ret c

			// en_ccy + 12 >= gpy
			ld  a, (_gpy)
			ld  c, a
			ld  a, (_en_ccy)
			
			add 12
			
			cp  c
			ret c

			// en_ccy <= gpy + 12; gpy + 12 >= en_ccy
			ld  a, (_en_ccy)
			ld  c, a
			ld  a, (_gpy)
			
			add 12
			
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
			
			;; Ahora DE = [SEED]
						
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
			
			;; Ahora [SEED] = HL
		
			ld  l, e 
			ld  h, 0		
			;; Return 8 bit
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

// Game

#ifndef DEACTIVATE_KEYS
	void clear_cerrojo (unsigned char x, unsigned char y) {
		// search & toggle
		
		/*
		set_map_tile (x, y, 0, comportamiento_tiles [0]);
		_x = x; _y = y;
		*/
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
				xor a
				ld  (__t), a
				ld  (__n), a

				call set_map_tile_do

				ld  a, (_rdx)
				ld  (__x), a
				ld  a, (_rdy)
				ld  (__y), a
		#endasm

		/*	
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) 
			if (cerrojos [gpit].x == x && cerrojos [gpit].y == y && cerrojos [gpit].np == n_pant)
				cerrojos [gpit].st = 0;
		*/
		#asm
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
				ret

			.clear_cerrojo_loop_continue
				inc hl
				djnz clear_cerrojo_loop
		#endasm
	}

	void init_cerrojos (void) {
		// Activate all bolts.
		
		/*
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++)
			cerrojos [gpit].st = 1;	
		*/
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
		
		//for (gpit = 0; gpit < MAX_BULLETS; gpit ++)	bullets_estado [gpit] = 0;
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

#ifdef ENABLE_BREAKABLE
	void init_breakable (void) {
		// Initialize breakable

		#asm
				ld  hl, _b_f
				ld  de, _b_f + 1
				ld  bc, MAX_BREAKABLE - 1
				xor a
				ld  (hl), a
				ldir
		#endasm

		process_breakable = 0;
	}
#endif

#ifdef ENEMIES_MAY_DIE
	void init_malotes (void) {
		/*
		for (gpit = 0; gpit < MAP_W * MAP_H * MAX_ENEMS; gpit ++) {
			malotes [gpit].t = malotes [gpit].t & 15;	
			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
				malotes [gpit].life = ENEMIES_LIFE_GAUGE;
				#ifdef RANDOM_RESPAWN
					if (malotes [gpit].t == 5) malotes [gpit].t |= 16;
				#endif
			#endif
		}
		*/
		#asm
			// 0  1  2   3   4   5   6   7   8   9
			// x, y, x1, y1, x2, y2, mx, my, t[, life]

			// 0  1  2    3    4   5   6   7
			// x, y, xy1, xy2, mx, my, t[, life]

			ld  bc, MAP_W * MAP_H * MAX_ENEMS
			#if defined PACKED_ENEMS
				#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
					ld  de, 8
				#else
					ld  de, 7
				#endif
			#else
				#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
					ld  de, 10
				#else
					ld  de, 9
				#endif
			#endif
			ld  ix, _malotes
			
			.init_malotes_loop
				//malotes [gpit].t = malotes [gpit].t & 15;
			#if defined PACKED_ENEMS
					ld  a, (ix+6) 	// .t
			#else
					ld  a, (ix+8) 	// .t
			#endif
				and 15
				
			#ifdef RANDOM_RESPAWN
					cp  5
					jr  nz, init_malotes_not_5	

					or  16
				.init_malotes_not_5
			#endif

			#if defined PACKED_ENEMS
					ld  (ix+6), a 	// .t
			#else
					ld  (ix+8), a 	// .t
			#endif

			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
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
		/*
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
			if (bullets_estado [gpit] == 0) {
				bullets_estado [gpit] = 1;
				if (player.facing) {
					bullets_x [gpit] = (player.x >> 6) - 4;
					bullets_mx [gpit] = -PLAYER_BULLET_SPEED;
				} else {
					bullets_x [gpit] = (player.x >> 6) + 12;
					bullets_mx [gpit] = PLAYER_BULLET_SPEED;
				}
				bullets_y [gpit] = (player.y >> 6) + PLAYER_BULLET_Y_OFFSET;
				play_sfx (9);
				#ifdef FIRING_DRAINS_LIFE
					player.life -= FIRING_DRAIN_AMOUNT;
				#endif				
				break;	
			}	
		}	
		*/
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
			player.life -= FIRING_DRAIN_AMOUNT;
			player_just_died = PLAYER_KILLED_BY_SELF;
		#endif

		#ifdef PLAYER_AX_RECOIL
			player.vx += (player.facing ? PLAYER_AX_RECOIL : -PLAYER_AX_RECOIL);
		#endif
	}
#endif

#if defined PLAYER_CAN_HIDE
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

#ifdef USE_COINS
	void get_coin (void) {
		#ifdef ENABLE_PERSISTENCE			
			persist ();
		#endif

		flags [COIN_FLAG] ++;
		
		set_map_tile (_x, _y, 0, 0);
		play_sfx (5);

		#if defined ACTIVATE_SCRIPTING && defined COINS_SCRIPTING
			// Run f_script #MAX_SCREENS + 1
			script = f_scripts [MAX_SCREENS + 1];
			run_script ();
		#endif

		#ifdef COINS_REFILL
			player.life += COINS_REFILL;
		#endif
	}
#endif

#if defined RESPAWN_REENTER || defined BOXES_KILL_PLAYER
	void explode_player (void) {
		player.next_frame = sprite_17_a;
		//sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, VIEWPORT_Y + (gpy >> 3), VIEWPORT_X + (gpx >> 3), gpx & 7, gpy & 7);
		player.current_frame = player.next_frame;
		play_sfx (10);	
		cpc_UpdateNow (1);
		cpc_HardPause (50);
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
		player.estado = EST_PARP;
		player.ct_estado = PLAYER_FLICKERS;
	}
#endif

#ifdef ENABLE_BREAKABLE
	void actualiza_breakables (void) {
		process_breakable = 0;
		for (gpit = 0; gpit < MAX_BREAKABLE; gpit ++) {
			if (b_f [gpit]) {
				b_f [gpit] --;
				if (b_f [gpit] == 0) {
					#ifdef BREAKABLE_SPAWN_CHANCE
						rdi = ((rand () & BREAKABLE_SPAWN_CHANCE) == 1) ? BREAKABLE_SPAWN_TILE : BREAKABLE_ERASE_TILE;
						set_map_tile (b_x [gpit], b_y [gpit], rdi, comportamiento_tiles [rdi]);
					#else
						set_map_tile (b_x [gpit], b_y [gpit], BREAKABLE_ERASE_TILE, comportamiento_tiles [BREAKABLE_ERASE_TILE]);
					#endif
				} else process_breakable = -1;
			}
		}
	}

	void add_to_breakables (void) {
		for (gpit = 0; gpit < MAX_BREAKABLE; gpit ++) {
			if (b_f [gpit] == 0) {
				#ifdef ENABLE_PERSISTENCE
					persist ();
				#endif					
				b_x [gpit] = _x;
				b_y [gpit] = _y;
				b_f [gpit] = MAX_BREAKABLE_FRAMES;
				set_map_tile (b_x [gpit], b_y [gpit], BREAKABLE_BREAKING_TILE, comportamiento_tiles [BREAKABLE_BREAKING_TILE]);
				play_sfx (9);
				process_breakable = 1;
				break;
			}
		}
	}
#endif

#ifdef ENABLE_SWORD
	void swing_sword (void) {
		#asm
				ld  a, (_s_on)
				or  a
				jp  z, swing_sword_off

			.sword_check

			#ifdef PLAYER_MOGGY_STYLE

					ld  bc, (_s_frame)
					ld  b, 0

					// In genital mode, every swing direction is different, so 
					ld  a, (_s_type)
					cp  SWORD_TYPE_LEFT
					jr  z, sword_left
					cp  SWORD_TYPE_RIGHT
					jr  z, sword_right
					cp  SWORD_TYPE_UP
					jr  z, sword_up				
					;cp  SWORD_TYPE_DOWN
					;jr  z, sword_down

				.sword_down
					// s_y = gpy + swoffs_x [s_frame]; s_x = gpx + 8 - swoffs_y [s_frame]|SWORD_STAB;
					// s_hit_y = s_y + 8; s_hit_x = s_x + 3;
					#ifdef SWORD_STAB
						ld  d, SWORD_STAB
					#else
						ld  hl, _swoffs_x
						add hl, bc
						ld  d, (hl)
					#endif
					ld  a, (_gpy)
					add d
					ld  (_s_y), a
					add 7
					ld  (_s_hit_y), a

					ld  hl, _swoffs_y
					add hl, bc 
					ld  d, (hl)
					ld  a, (_gpx)
					add 8
					sub d 
					ld  (_s_x), a
					add 3
					ld  (_s_hit_x), a

					jr  sword_check_done

				.sword_up
					// s_y = gpy + 8 - swoffs_x [s_frame]; s_x = gpx + swoffs_y [s_frame]|SWORD_STAB;
					// s_hit_y = s_y; s_hit_x = s_x + 4;
					#ifdef SWORD_STAB
						ld  d, SWORD_STAB
					#else
						ld  hl, _swoffs_x
						add hl, bc
						ld  d, (hl)
					#endif
					ld  a, (_gpy)
					add 8
					sub d
					ld  (_s_y), a
					ld  (_s_hit_y), a

					ld  hl, _swoffs_y
					add hl, bc 
					ld  d, (hl)
					ld  a, (_gpx)
					add d 
					ld  (_s_x), a
					add 4
					ld  (_s_hit_x), a

					jr  sword_check_done

				.sword_left
					// s_y = gpy + 12 - swoffs_y [s_frame]|SWORD_STAB; s_x = gpx + 8 - swoffs_x [s_frame];
					// s_hit_y = s_y + 3; s_hit_x = s_x;
					#ifdef SWORD_STAB
						ld  d, SWORD_STAB
					#else
						ld  hl, _swoffs_y
						add hl, bc
						ld  d, (hl)
					#endif
					ld  a, (_gpy)
					add 12
					sub d
					ld  (_s_y), a
					add 3
					ld  (_s_hit_y), a

					ld  hl, _swoffs_x
					add hl, bc 
					ld  d, (hl)
					ld  a, (_gpx)
					add 8
					sub d 
					ld  (_s_x), a
					ld  (_s_hit_x), a

					jr  sword_check_done

				.sword_right
					// s_y = gpy + swoffs_y [s_frame]|SWORD_STAB; s_x = gpx + swoffs_x [s_frame];
					// s_hit_y = s_y + 4; s_hit_x = s_x + 7;
					#ifdef SWORD_STAB
						ld  d, SWORD_STAB
					#else
						ld  hl, _swoffs_y
						add hl, bc
						ld  d, (hl)
					#endif
					ld  a, (_gpy)
					add d
					ld  (_s_y), a
					add 4
					ld  (_s_hit_y), a

					ld  hl, _swoffs_x
					add hl, bc 
					ld  d, (hl)
					ld  a, (_gpx)
					add d 
					ld  (_s_x), a
					add 7
					ld  (_s_hit_x), a

					;jr  sword_check_done
			#else
				#ifdef SWORD_UP
					.sword_check_up
						ld  a, (_s_type)
						cp  SWORD_TYPE_UP
						jr  nz, sword_up_done

						ld  a, (_gpx)
						#ifdef SWORD_STAB
							add SWORD_STAB
						#else
							ld  bc, (_s_frame)
							ld  b, 0
							ld  hl, _swoffs_y
							add hl, bc
							ld  c, (hl)
							add c
						#endif
						ld  (_s_x), a

						add 4
						ld  (_s_hit_x), a

						ld  bc, (_s_frame)
						ld  b, 0
						ld  hl, _swoffs_x
						add hl, bc 
						ld  c, (hl)

						ld  a, (_gpy)
						add 8
						sub c 
						ld  (_s_y), a

						ld  (_s_hit_y), a
						jp  sword_check_done

					.sword_up_done
				#endif

					ld  a, (_gpy)
					#ifdef SWORD_STAB 
						add SWORD_STAB
					#else
						ld  bc, (_s_frame)
						ld  b, 0
						ld  hl, _swoffs_y
						add hl, bc
						ld  c, (hl)
						add c 
					#endif
					ld  (_s_y), a
					add 4
					ld  (_s_hit_y), a

					ld  bc, (_s_frame)
					ld  b, 0
					ld  hl, _swoffs_x
					add hl, bc
					ld  c, (hl) 

					ld  a, (_s_type)
					cp  SWORD_TYPE_LEFT
					jr  nz, sword_right

				.sword_left 
					ld  a, (_gpx)
					add 8
					sub c 
					ld  (_s_x), a
					ld  (_s_hit_x), a
					jr  sword_check_done

				.sword_right
					ld  a, (_gpx)
					add c
					ld  (_s_x), a
					add 7
					ld  (_s_hit_x), a
			#endif

			.sword_check_done

			// Detect breakable
			#ifdef ENABLE_BREAKABLE
				// if (s_frame > 2 -> >= 3
					ld  a, (_s_frame)
					cp  MIN_SWORD_HIT_FRAME
					jr  c, sword_breakable_done

				// && s_frame < 6)
					cp  MAX_SWORD_HIT_FRAME
					jr  nc, sword_breakable_done

					ld  h, 0

					ld  a, (_s_hit_x)
					srl a
					srl a
					srl a
					srl a
					ld  (__x), a
					ld  l, a
					push hl

					ld  a, (_s_hit_y)
					srl a
					srl a
					srl a
					srl a
					ld  (__y), a
					ld  l, a
					push hl

					call _attr

					pop bc
					pop bc

					ld  a, l
					and 32
					jr  z, sword_breakable_done

					call _add_to_breakables

				.sword_breakable_done				
			#endif

				ld  a, (_s_frame)
				inc a
				ld  (_s_frame), a
				cp  9
				jr  nz, swing_sword_goon

				xor a
				ld  (_s_on), a

			.swing_sword_goon
				ld  a, (_s_x)
				jr swing_sword_done

			.swing_sword_off
				ld  a, 240
				
			.swing_sword_done
				ld  (_rdx), a
		#endasm

		//sp_MoveSprAbs (sp_sword, spritesClip, s_next_frame - s_current_frame, VIEWPORT_Y + (s_y >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, s_y & 7);
		//s_current_frame = s_next_frame;		
		#asm
				ld  ix, #(BASE_SPRITES + (SP_SWORD_BASE*16))

				ld  a, (_rdx)
				add #(VIEWPORT_X*8)
				add (ix + 6)
				#ifndef MODE_1
					srl a 
				#endif
				ld  (ix + 8), a 

				ld  a, (_s_y)
				add #(VIEWPORT_Y*8)
				add (ix + 7)
				ld  (ix + 9), a 

				ld  hl, (_s_next_frame)
				ld  (ix + 0), l
				ld  (ix + 1), h
		#endasm
	}
#endif

#if defined QUICKSAND_TILES || defined SLIPPERY_TILES || defined CONVEYOR_TILES
	void two_points_attr (void) {
		#asm
				ld  a, (_gpx)
				add 4
				srl a
				srl a
				srl a
				srl a
				ld  c, a
				ld  a, (_pty1)
				call _attr_2
				ld  a, l
				ld  (_rdt1), a

				ld  a, (_gpx)
				add 11
				srl a
				srl a
				srl a
				srl a
				ld  c, a
				ld  a, (_pty1)
				call _attr_2
				ld  a, l
				ld  (_rdt2), a
		#endasm
	}
#endif

// player_move
void move (void) {
	gpcx = player.x;
	gpcy = player.y;

	// Read device (keyboard, joystick ...)
	pad_read ();

	// Jump button
	#ifndef PLAYER_MOGGY_STYLE
		#if defined BOTH_KEYS_JUMP
			button_jump = (pad0 & (sp_UP|sp_FIRE)) != (sp_UP|sp_FIRE);
		#elif defined PLAYER_CAN_FIRE || !defined FIRE_TO_JUMP
			button_jump = ((pad0 & sp_UP) == 0); 
		#else
			button_jump = ((pad0 & sp_FIRE) == 0);
		#endif
	#endif

	#ifdef ENABLE_FRIGOABABOL
		if (player.estado == EST_FRIGOABABOL) {
			pad0 |= (sp_LEFT | sp_RIGHT | sp_UP | sp_DOWN);

			#ifdef FRIGO_UNFREEZE_TIME
				player.ct_estado --;
			#endif

			#ifdef FRIGO_UNFREEZE_FIRE
				if ((pad0 & sp_FIRE) == 0) {
					player.ct_estado --;

					#ifdef FRIGO_FIGHT
						player.vx += ((rand () % 3) << 6) - 64;
						player.vy += ((rand () % 3) << 6) - 64;
					#endif
				}
			#endif

			#ifdef FRIGO_NO_FIRE
				#ifdef PLAYER_CAN_FIRE
					pad0 |= sp_FIRE;
				#endif

				#ifdef ENABLE_SWORD
					pad_this_frame |= sp_FIRE;
				#endif
			#endif

			if (player.ct_estado == 0) {
				#ifdef PLAYER_FLICKERS
					player_flicker ();
				#else
					player.estado = EST_NORMAL;
				#endif
			}
		}
	#endif

	/* Vertical movement. The ecuations used are:

	   1.- vy = vy + g
	   2.- y = y + vy

	*/

	#ifdef PLAYER_CUSTOM_VERT_AXIS
		#include "custom_vert_axis.h"
	#else

		/* Jump: Jumping is as easy as giving vy a negative value. Nevertheless, we want
		   a somewhat more controllable jump, so we use the "mario bros" kind of controls:
		   the longer you press jump, the higher you reach.
		*/

		#ifdef PLAYER_HAS_JUMP
			#ifdef RAMIRO_HOP
				#ifdef SHORT_PLAYER
					rdi = ((attr ((gpx + 4) >> 4, gpyy + 1) & 12) || (attr ((gpx + 11) >> 4, gpyy + 1) & 12));
				#else
					rdi = (attr (gpxx, gpyy + 1) & 12 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 12));
				#endif
			#endif

			if (button_jump) {
				if (player.saltando == 0
					#ifdef RAMIRO_HOVER
						&& player.just_hovered == 0
					#endif
				) {
					if (
					#ifdef RAMIRO_HOP
						rdi
					#else
						player.possee 
					#endif
						|| player.gotten
					) {
						player.saltando = 1;
						player.just_jumped = 1;
						player.cont_salto = 0;
						play_sfx (1);
					}
				}

				if (player.saltando) {
					player.vy -= (PLAYER_VY_INICIAL_SALTO + PLAYER_INCR_SALTO - (player.cont_salto>>1));
					if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
					player.cont_salto ++;
					if (player.cont_salto == 8)
						player.saltando = 0;
				} 
			} else {
				player.saltando = 0;
				player.just_jumped = 0;
			}
		#endif

		#ifdef PLAYER_HAS_JETPAC
			if ((pad0 & sp_UP) == 0) {
				player.vy -= PLAYER_INCR_JETPAC;
				if (player.vy < -PLAYER_MAX_VY_JETPAC) player.vy = -PLAYER_MAX_VY_JETPAC;
				#ifdef JETPAC_DRAINS_LIFE
					jetpac_frame_counter ++;
					if (jetpac_frame_counter == JETPAC_DRAIN_OFFSET + JETPAC_DRAIN_RATIO) {
						jetpac_frame_counter = JETPAC_DRAIN_OFFSET;
						player.life --;
						player_just_died = PLAYER_KILLED_BY_SELF;
					}
				#endif
			} else {
				jetpac_frame_counter = 0;
			}
		#endif

		#ifdef PLAYER_NO_INERTIA
			if ((pad0 & sp_UP) == 0) { player.vy = -PLAYER_CONST_V; player.facing = GENITAL_FACING_UP; }
			if ((pad0 & sp_DOWN) == 0) { player.vy = PLAYER_CONST_V; player.facing = GENITAL_FACING_DOWN; }
			if ( ! ((pad0 & sp_UP) == 0 || (pad0 & sp_DOWN) == 0)) player.vy = 0;
		#else	
			#ifndef PLAYER_MOGGY_STYLE
				// If side view, get affected by gravity:
				
				#ifdef RAMIRO_HOVER
					rda = player.hovering;
					player.hovering = 0;
					if (((pad0 & sp_DOWN) == 0 
						#ifdef HOVER_WITH_JUMP_ALSO
							|| (button_jump && player.just_jumped == 0)
						#endif
						)
						#ifdef RAMIRO_HOVER_ON_VAR
							&& ramiro_hover 
						#endif
					) {
						player.just_hovered = 1;
						if (player.vy > 0) {
							if (rda == 0) play_sfx (12);
							player.hovering = 1;
							#asm
								._player_hover
									ld  a, (_pad0)
									or  sp_DOWN
									ld  (_pad0), a

									ld  hl, (_player + 8) 		// player.vy
									ld  de, PLAYER_MAX_VY_CAYENDO_H - PLAYER_G_HOVER
									or  a
									push hl 
									sbc hl, de 
									pop hl 
									jr  nc, player_hover_maximum

									ld  de, PLAYER_G_HOVER
									add hl, de 
									jr  player_hover_set

								.player_hover_maximum
									ld  hl, PLAYER_MAX_VY_CAYENDO_H

								.player_hover_set
									ld  (_player + 8), hl
							#endasm
						} 
					} else player.just_hovered = 0;

					if (player.hovering == 0)
				#endif
				{
					#asm
						._player_gravity
							// Signed comparison shortcut by my picha
							// If player.vy < 0 add PLAYER_G
							// If player.vy > 0 do a signed comparison
							ld  hl, (_player + 8) 		// player.vy
							bit 7, h
							jr  nz, player_gravity_add  // < 0

							ld  de, PLAYER_MAX_VY_CAYENDO - PLAYER_G
							or  a
							push hl 
							sbc hl, de 
							pop hl 
							jr  nc, player_gravity_maximum

						.player_gravity_add
							ld  de, PLAYER_G
							add hl, de 
							jr  player_gravity_vy_set

						.player_gravity_maximum
							ld  hl, PLAYER_MAX_VY_CAYENDO

						.player_gravity_vy_set
							ld  (_player + 8), hl 

						.player_gravity_done
					#endasm
				}

				if (player.gotten) player.vy = 0;		
			#else
				// If top-down view, vertical movement = horizontal movement.
				#if defined ENABLE_FRIGOABABOL && defined FRIGO_FROZEN_NO_RX
					if (player.estado != EST_FRIGOABABOL)
				#endif
				if ( ((pad0 & sp_UP) != 0 && (pad0 & sp_DOWN) != 0)) {
					if (player.vy > 0) {
						player.vy -= player.rx;
						if (player.vy < 0)
							player.vy = 0;
					} else if (player.vy < 0) {
						player.vy += player.rx;
						if (player.vy > 0)
							player.vy = 0;
					}
				}

				if ((pad0 & sp_UP) == 0) {
					if (player.vy > -player.max_vx) {
						player.vy -= player.ax;					
					}
					player.facing = GENITAL_FACING_UP;
				}

				if ((pad0 & sp_DOWN) == 0) {
					if (player.vy < player.max_vx) {
						player.vy += player.ax;
					}
					player.facing = GENITAL_FACING_DOWN;
				}
			#endif
		#endif	

		#ifdef PLAYER_DIZZY
			if (player.estado & EST_DIZZY) { player.vy >>= 1; player.vy += (rand () & (PLAYER_CONST_V - 1)) - (PLAYER_CONST_V >> 1); }
		#endif
	#endif

	player.y += player.vy;

	// Safe
	#ifdef BETTER_VERTICAL_CONNECTIONS
		if (player.y < -512)
			player.y = -512;
	#else	
		if (player.y < 0)
			player.y = 0;
	#endif
			
	if (player.y > 9216)
		player.y = 9216;

	/* 
		Check for collisions with obstacles. If so, we have to move
		back until the edge of the tile.
	*/

	/*
	gpx = player.x >> 6;				// Divide / 64 for pixels, then / 16 for tiles.
	gpy = player.y >> 6;
	gpxx = gpx >> 4;
	gpyy = gpy >> 4;
	*/

	#asm
			ld  hl, (_player + 0) 		// player.x
			call HLshr6_A
			ld  (_gpx), a
			srl a
			srl a 
			srl a 
			srl a
			ld  (_gpxx), a

			ld  hl, (_player + 2) 		// player.y
			call HLshr6_A
			ld  (_gpy), a 
			srl a 
			srl a 
			srl a 
			srl a
			ld  (_gpyy), a
	#endasm
	
	// Cool

	/*
	wall = 0;
	player.possee = 0;
	player.ceiling = 0;
	rdj = (player.vy + ptgmy);
	if (rdj) {
		if (rdj < 0) { 			// Going up
			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				if (attr (gpxx, gpyy) & 8 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy) & 8)) {
					player.vy = 0; gpyy ++;	adjust_to_tile_y ();
					player.ceiling = 1;
				}
			#else
				if ((gpy & 15) < 12)
					if (((gpx & 15) < 12 && attr (gpxx, gpyy) & 8) || ((gpx & 15) > 4 && attr (gpxx + 1, gpyy) & 8)) {
						player.vy = 0; gpy = (gpyy << 4) + 12; player.y = gpy << 6;
						player.ceiling = 1;
					}
			#endif
		} else if ((gpy & 15) <= (player.vy >> 6)) { 	// Going down
			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				if (attr (gpxx, gpyy + 1) & 12 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 12))
			#else
				if (((gpx & 15) < 12 && (attr (gpxx, gpyy + 1) & 12)) || ((gpx & 15) > 4 && attr (gpxx + 1, gpyy + 1) & 12))
			#endif
			{
				player.vy = 0; adjust_to_tile_y ();
				player.possee = 1;
			}
		}
	}
	*/

	#asm
			.vert_collision
			xor a
			ld  (_player + 26), a 			// possee
			ld  (_player + 37), a 			// ceiling
			ld  (_wall), a


			ld  de, (_player + 8)
			ld  hl, (_ptgmy)
			add hl, de
			ld  (_rdj), hl

			// if (rdj)
			ld  a, h
			or  l
			jp  z, vert_collision_done

			// check sign of rdj. If bit 7 of h is 1, negative.
			bit 7, h
			jr  z, vert_collision_positive

		.vert_collision_negative
			// rdj < 0

			#if !defined SHORT_PLAYER
				// if (attr (gpxx, gpyy) & 8 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy) & 8)) {
					ld  a, (_gpxx)
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					and 8

					jr  nz, vert_collision_up

					ld  a, (_gpx)
					and 15
					jp  z, vert_collision_done

					ld  a, (_gpxx)
					inc a
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					and 8
					jp  z, vert_collision_done

				.vert_collision_up
					// player.vy = 0; gpyy ++; adjust_to_tile_y (); player.ceiling = 1;
					ld  hl, 0
					ld  (_player + 8), hl	// player.vy

					ld  hl, _gpyy
					inc (hl)

					call _adjust_to_tile_y

					ld  a, 1
					ld  (_player + 37), a 	// player.ceiling

					ld  a, WALL_UP
					ld  (_wall), a 

					jp  vert_collision_done
			#else
				// if ((gpy & 15) < 12)
					ld  a, (_gpy)
					and 15
					cp  12
					jp  nc, vert_collision_done

				// if (((gpx & 15) < 12 && attr (gpxx, gpyy) & 8) || ((gpx & 15) > 4 && attr (gpxx + 1, gpyy) & 8)) {

				.vert_collision_if1
					ld  a, (_gpx)
					and 15
					cp  12
					jr  nc, vert_collision_if2

					ld  a, (_gpxx)
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					and 8

					jr  nz, vert_collision_up

				.vert_collision_if2
					// (gpx & 15) > 4 => (gpx & 15) >= 5
					ld  a, (_gpx)
					and 15
					cp  5
					jp  c, vert_collision_done

					ld  a, (_gpxx)
					inc a
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					and 8
					jp  z, vert_collision_done

				.vert_collision_up
					// player.vy = 0; gpy = (gpyy << 4) + 12; player.y = gpy << 6;
					// player.ceiling = 1;
					ld  hl, 0
					ld  (_player + 8), hl	// player.vy

					ld  a, (_gpyy)
					sla a
					sla a
					sla a
					sla a
					add 12
					ld  (_gpy), a

					/*
					ld  a, (_gpy)
					ld  e, a
					ld  d, 0
					ld  l, 6
					call l_asl
					*/
					call Ashl16_HL
					ld  (_player + 2), hl 	// player.y

					ld  a, 1
					ld  (_player + 37), a 	// player.ceiling

					ld  a, WALL_UP
					ld  (_wall), a 
					
					jr  vert_collision_done
			#endif

		.vert_collision_positive
			// rdj > 0
			// else if ((gpy & 15) <= (player.vy >> 6) -> (player.vy >> 6) >= (gpy & 16)
			ld  a, (_gpy)
			and 15
			ld  c, a

			/*
			ld  de, (_player + 8) 	// player.vy
			ld  l, 6
			call l_asr
			ld  a, l
			*/
			ld  hl, (_player + 8) 	// player.vy
			call HLshr6_A

			cp  c
			jr  c, vert_collision_done

			#if !defined SHORT_PLAYER
				// if (attr (gpxx, gpyy + 1) & 12 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 12))
					ld  a, (_gpxx)
					ld  c, a
					ld  a, (_gpyy)
					inc a 
					call _attr_2
					ld  a, l
					and 12

					jr  nz, vert_collision_down

					ld  a, (_gpx)
					and 15
					jr  z, vert_collision_done

					ld  a, (_gpxx)
					inc a
					ld  c, a
					ld  a, (_gpyy)
					inc a 
					call _attr_2
					ld  a, l
					and 12
					jr  z, vert_collision_done
			#else
				// if (((gpx & 15) < 12 && (attr (gpxx, gpyy + 1) & 12)) || ((gpx & 15) > 4 && attr (gpxx + 1, gpyy + 1) & 12))
				.vert_collision_if3
					ld  a, (_gpx)
					and 15
					cp  12
					jr  nc, vert_collision_if4

					ld  a, (_gpxx)
					ld  c, a
					ld  a, (_gpyy)
					inc a 
					call _attr_2
					ld  a, l
					and 12

					jr  nz, vert_collision_down

				.vert_collision_if4
					// (gpx & 15) > 4 => (gpx & 15) >= 5
					ld  a, (_gpx)
					and 15
					cp  5
					jr  c, vert_collision_done

					ld  a, (_gpxx)
					inc a
					ld  c, a
					ld  a, (_gpyy)
					inc a 
					call _attr_2
					ld  a, l
					and 12
					jr  z, vert_collision_done
			#endif

		.vert_collision_down
			ld  hl, 0
			ld  (_player + 8), hl	// player.vy
			
			call _adjust_to_tile_y

			ld  a, 1
			ld  (_player + 26), a 	// player.possee

		.vert_collision_done
	#endasm

	#if defined QUICKSAND_TILES || defined SLIPPERY_TILES
		player.ax = PLAYER_AX; player.rx = PLAYER_RX;
	#endif

	#if defined QUICKSAND_TILES
		player.max_vx = PLAYER_MAX_VX;
		/*
		pty1 = (gpy + 15) >> 4;
		two_points_attr ();
		*/
		#asm
				ld  a, (_gpy)
				#ifdef PLAYER_MOGGY_STYLE
					add 15
				#else
					add 16
				#endif
				srl a
				srl a
				srl a
				srl a
				ld  (_pty1), a
				call _two_points_attr
		#endasm

		if ((rdt1 & 64) || (rdt2 & 64)) {
			if (rdj < 0) player.saltando = 0;
			else {
				player.vy = PLAYER_VY_SINKING;
				player.possee = 1;
				player.ax = PLAYER_AX_QUICKSANDS;
				player.rx = PLAYER_RX_QUICKSANDS;
				player.max_vx = PLAYER_MAX_VX_QUICKSANDS;	
			}
		}
	#endif

	#if defined SLIPPERY_TILES || defined CONVEYOR_TILES
		/*
		#ifdef PLAYER_MOGGY_STYLE
			pty1 = (gpy + 15) >> 4;
		#else
			pty1 = (gpy + 16) >> 4;
		#endif
		two_points_attr ();
		*/

		#asm
				ld  a, (_gpy)
				#ifdef PLAYER_MOGGY_STYLE
					add 15
				#else
					add 16
				#endif
				srl a
				srl a
				srl a
				srl a
				ld  (_pty1), a
				call _two_points_attr				
		#endasm
	#endif

	#if defined SLIPPERY_TILES || defined CONVEYOR_TILES
		if (player.possee) 
	#endif
	{
		#ifdef SLIPPERY_TILES
			/*
			if ((rdt1 & 16) || (rdt2 & 16)) {
				#ifdef DISABLE_SLIPPERY_ON_VAR
					if (disable_slippery == 0)
				#endif
				{
					player.ax = PLAYER_AX_SLIPPERY; player.rx = PLAYER_RX_SLIPPERY;
				}
			}
			*/

			#asm
					ld  a, (_rdt1)
					and 16
					jr  nz, slippery_check_do

					ld  a, (_rdt2)
					and 16
					jr  z, slippery_check_done

				.slippery_check_do

					#ifdef DISABLE_SLIPPERY_ON_VAR
						ld  a, (_disable_slippery)
						or  a
						jr  nz, slippery_check_done
					#endif

					ld  a, PLAYER_AX_SLIPPERY
					ld  (_player+11), a 			// player.ax

					ld  a, PLAYER_RX_SLIPPERY
					ld  (_player+12), a 			// player.rx

				.slippery_check_done
			#endasm
		#endif

		#ifdef CONVEYOR_TILES
			#ifdef PLAYER_MOGGY_STYLE

			#else
				/*
				rdj = 0;
				if (rdt1 & 2) { rdj = (rdt1 & 1) ? 1 : -1; }
				if (rdt2 & 2) { rdj += (rdt2 & 1) ? 1 : -1; }
				if (rdj < 0) ptgmx = -PLAYER_VX_CONVEYORS;
				else if (rdj > 0) ptgmx = PLAYER_VX_CONVEYORS;
				*/
				#asm
						// c ~ rdj in this rewrite
						ld  c, 0

						ld  a, (_rdt1)
						bit 1, a 			// rdt1 & 2
						call nz, conveyor_add_to_rdj

						ld  a, (_rdt2)
						bit 1, a
						call nz, conveyor_add_to_rdj

						// check rdj 0, <0 or >0...
						xor a
						or  c
						jr  z, conveyor_check_done

						bit 7, a 			// Positive or negative?
						ld  hl, (_ptgmx)
						ld  bc, PLAYER_VX_CONVEYORS
						jr  z, conveyor_right

					.conveyor_left
						sbc hl, bc
						jr  conveyor_set_ptgmx

					.conveyor_add_to_rdj
						and 1
						sla a
						dec a
						add c
						ld  c, a
						ret

					.conveyor_right
						add hl, bc

					.conveyor_set_ptgmx
						ld  (_ptgmx), hl

					.conveyor_check_done
				#endasm
			#endif
		#endif
	}


	// Done with vertical movement.

	/* Horizontal movement. Equations are:

	   Direction key pressed:
	   
	   x = x + vx
	   vx = vx + ax

	   Direction key not pressed:

	   x = x + vx
	   vx = vx - rx
	*/

	// Push / pull boxes

	#if defined PLAYER_PUSH_BOXES && defined PUSH_AND_PULL && !defined PLAYER_MOGGY_STYLE
		player.grab_block = 0;

		#if !defined SHORT_PLAYER
			/*
			if ((pad0 & sp_FIRE) == 0 && player.possee) {
				rdx = gpxx;	x0 = x1 = gpxx;	y0 = y1 = gpyy;
				if (player.facing) {				// Looking left
					if ((gpx & 15) == 0 && qtile (gpxx - 1, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0) {
							x0 = gpxx - 1; x1 = gpxx - 2;
						} else if ((pad_this_frame & sp_RIGHT) == 0 && attr (gpxx + 1, gpyy) < 8) {
							x0 = gpxx - 1; x1 = gpxx; 
							gpxx ++; gpx += 16; player.x += (16<<6); 
						}
						pad_this_frame = pad0 |= (sp_FIRE|sp_LEFT|sp_RIGHT);
					}
				} else {								// Looking right
					if ((gpx & 15) == 0 && qtile (gpxx + 1, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) < 0) {
							x0 = gpxx + 1; x1 = gpxx;
							gpxx --; gpx -= 16; player.x -= (16<<6); 
						} else if ((pad_this_frame & sp_RIGHT) == 0) {
							x0 = gpxx + 1; x1 = gpxx + 2; 
						}
						pad_this_frame = pad0 |= (sp_FIRE|sp_LEFT|sp_RIGHT);
					}
				}

				if (x0 != x1) {
					if (can_move_box ()) move_tile (1);
					else { gpx = rdx << 4; player.x = gpx << 6;	}
				}
			}
			*/
			#asm
				.push_pull
					ld  a, (_pad0)
					and sp_FIRE
					jp  nz, push_pull_done

					#ifdef PUSH_ON_FLOOR
						ld  a, (_player + 26) 	// player.possee
						or  a
						jp  z, push_pull_done
					#endif

				.push_pull_do 

					// rdx = gpx;	x0 = 0xff;	y0 = y1 = gpyy;
					ld  a, (_gpx)
					ld  (_rdx), a

					ld  a, 0xff
					ld  (_x0), a

					ld  a, (_gpyy)
					ld  (_y0), a
					ld  (_y1), a

					// if (player.facing) {
					ld  a, (_player + 22) 	// player.facing
					or  a
					jr  z, push_pull_facing_right

				.push_pull_facing_left
					// Facing left

					//if ((gpx & 15) == 0 && qtile (gpxx - 1, gpyy) == 14) {
					ld  a, (_gpx)
					and 15
					jp  nz, push_pull_done

					ld  hl, (_gpxx)
					ld  h, 0
					dec hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _qtile
					pop bc 
					pop bc 
					ld  a, l
					cp  14
					jp  nz, push_pull_done

				.push_pull_facing_left_do

					ld  a, 1
					ld  (_player + 38), a	// player.grab_block

					// if ((pad_this_frame & sp_LEFT) == 0) {
					ld  a, (_pad_this_frame)
					and sp_LEFT
					jr  nz, push_pull_facing_left_do_not_left

				.push_pull_facing_left_do_left
					// x0 = gpxx - 1; x1 = gpxx - 2;
					ld  a, (_gpxx)
					dec a
					ld  (_x0), a
					dec a
					ld  (_x1), a
					jp push_pull_invalidate_keys

				.push_pull_facing_left_do_not_left
					ld  a, (_pad_this_frame)
					and sp_RIGHT
					jp  nz, push_pull_invalidate_keys

					// attr (gpxx + 1, gpyy) < 8
					ld  a, (_gpxx)
					inc a
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					
					ld  a, l
					cp  8
					jp  nc, push_pull_invalidate_keys

				.push_pull_facing_left_do_right
					// x0 = gpxx; x1 = gpxx + 1; 
					ld  a, (_gpxx)
					dec a
					ld  (_x0), a
					inc a
					ld  (_x1), a
					inc a

					// gpxx ++; gpx += 16; player.x += (16<<6); 
					ld  a, (_gpx)
					add 16
					ld  (_gpx), a

					ld  hl, (_player) 		// player.x
					ld  bc, 1024 			// 16<<6
					add hl, bc
					ld  (_player), hl 		// player.x
					jp  nc, push_pull_invalidate_keys

				.push_pull_facing_right
					// Facing right

					// if ((gpx & 15) == 0 && qtile (gpxx + 1, gpyy) == 14)
					ld  a, (_gpx)
					and 15
					
					jp  nz, push_pull_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _qtile
					pop bc 
					pop bc 
					ld  a, l
					cp  14
					jp  nz, push_pull_done

				.push_pull_facing_right_do	

					ld  a, 1
					ld  (_player + 38), a	// player.grab_block

					// if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) < 8) {
					ld  a, (_pad_this_frame)
					and sp_LEFT
					jr  nz, push_pull_facing_right_do_not_left

					ld  a, (_gpxx)
					dec a
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					cp  8
					jr  nc, push_pull_facing_right_do_not_left

				.push_pull_facing_right_do_left
					// x0 = gpxx + 1; x1 = gpxx;
					ld  a, (_gpxx)
					ld  c, a
					ld  (_x1), a
					inc a
					ld  (_x0), a

					// gpxx --; gpx -= 16; player.x -= (16<<6); 
					ld  a, c
					dec a
					ld  (_gpxx), a

					ld  a, (_gpx)
					sub a, 16
					ld  (_gpx), a 

					ld  hl, (_player) 		// player.x
					ld  bc, 1024			// 16 << 6
					sbc hl, bc 
					ld  (_player), hl, 		// player.x
					jr  push_pull_invalidate_keys

				.push_pull_facing_right_do_not_left
					// else if ((pad_this_frame & sp_RIGHT) == 0) {
					ld  a, (_pad_this_frame)
					and sp_RIGHT
					jr  nz, push_pull_invalidate_keys

				.push_pull_facing_right_do_right
					// 	x0 = gpxx + 1; x1 = gpxx + 2;
					ld  a, (_gpxx)
					inc a
					ld  (_x0), a
					inc a
					ld  (_x1), a

				.push_pull_invalidate_keys
					ld  a, (_pad0)
					or  sp_FIRE|sp_LEFT|sp_RIGHT
					ld  (_pad0), a
					ld  (_pad_this_frame), a

				.push_pull_move
					// if (x0 != 0xff) {
					ld  a, (_x0)
					cp  0xff
					jr  z, push_pull_done

					call _can_move_box
					xor a
					or  l
					jr  z, push_pull_undo

				#ifdef PUSH_AND_PULL_PILES 
						ld  a, (_y1)
						ld  (_y0), a
				#endif
					ld  hl, 1
					call _move_tile
					jp  push_pull_done 

				.push_pull_undo
					//  gpxx = rdx >> 4; gpx = rdx; player.x = gpx << 6; 
				
					ld  a, (_rdx)
					ld  c, a
					ld  (_gpx), a
					srl a
					srl a
					srl a
					srl a
					ld  (_gpxx), a

					/*
					ld  a, (_gpx)
					ld  e, a
					ld  d, 0
					ld  l, 6
					call l_asl
					*/
					ld  a, c
					call Ashl16_HL
					ld  (_player), hl 		// player.x

				.push_pull_done

			#endasm

		#else
			/*
			if ((pad0 & sp_FIRE) == 0 && player.possee) {				
				rdx = gpx;	x0 = 0xff;	y0 = y1 = gpyy;
				if (player.facing) {				// Looking left
					if ((gpx & 15) == 12 && qtile (gpxx, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0) {
							x0 = gpxx; x1 = gpxx - 1;
						} else if ((pad_this_frame & sp_RIGHT) == 0 && attr (gpxx + 2, gpyy) < 4) {
							x0 = gpxx; x1 = gpxx + 1; 
							gpxx ++; gpx += 16; player.x += (16<<6); 
						}
						pad_this_frame = pad0 |= (sp_FIRE|sp_LEFT|sp_RIGHT);
					}
				} else {								// Looking right
					if ((gpx & 15) == 4 && qtile (gpxx + 1, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) < 4) {
							x0 = gpxx + 1; x1 = gpxx;
							gpxx --; gpx -= 16; player.x -= (16<<6); 
						} else if ((pad_this_frame & sp_RIGHT) == 0) {
							x0 = gpxx + 1; x1 = gpxx + 2; 
						}						
						pad_this_frame = pad0 |= (sp_FIRE|sp_LEFT|sp_RIGHT);
					}
				}

				if (x0 != 0xff) {
					if (can_move_box ()) move_tile (1);
					else { gpxx = rdx >> 4; gpx = rdx; player.x = gpx << 6; }
				}
			}
			*/

			#asm
				.push_pull
					ld  a, (_pad0)
					and sp_FIRE
					jp  nz, push_pull_done

					#ifdef PUSH_ON_FLOOR
						ld  a, (_player + 26) 	// player.possee
						or  a
						jp  z, push_pull_done
					#endif

				.push_pull_do 

					// rdx = gpx;	x0 = 0xff;	y0 = y1 = gpyy;
					ld  a, (_gpx)
					ld  (_rdx), a

					ld  a, 0xff
					ld  (_x0), a

					ld  a, (_gpyy)
					ld  (_y0), a
					ld  (_y1), a

					// if (player.facing) {
					ld  a, (_player + 22) 	// player.facing
					or  a
					jr  z, push_pull_facing_right

				.push_pull_facing_left
					// Facing left

					// if ((gpx & 15) == 12 && qtile (gpxx, gpyy) == 14) {
					ld  a, (_gpx)
					and 15
					cp  12
					jp  nz, push_pull_done

					ld  hl, (_gpxx)
					ld  h, 0
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _qtile
					pop bc 
					pop bc 
					ld  a, l
					cp  14
					jp  nz, push_pull_done

				.push_pull_facing_left_do

					ld  a, 1
					ld  (_player + 38), a	// player.grab_block

					// if ((pad_this_frame & sp_LEFT) == 0) {
					ld  a, (_pad_this_frame)
					and sp_LEFT
					jr  nz, push_pull_facing_left_do_not_left

				.push_pull_facing_left_do_left
					// x0 = gpxx; x1 = gpxx - 1;
					ld  a, (_gpxx)
					ld  (_x0), a
					dec a
					ld  (_x1), a
					jp push_pull_invalidate_keys

				.push_pull_facing_left_do_not_left
					ld  a, (_pad_this_frame)
					and sp_RIGHT
					jp  nz, push_pull_invalidate_keys

					// attr (gpxx + 2, gpyy) < 8
					ld  a, (_gpxx)
					add 2
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2

					ld  a, l
					cp  8
					jp  nc, push_pull_invalidate_keys

				.push_pull_facing_left_do_right
					// x0 = gpxx; x1 = gpxx + 1; 
					ld  a, (_gpxx)
					ld  (_x0), a
					inc a
					ld  (_x1), a

					// gpxx ++; gpx += 16; player.x += (16<<6); 
					ld  a, (_gpx)
					add 16
					ld  (_gpx), a

					ld  hl, (_player) 		// player.x
					ld  bc, 1024 			// 16<<6
					add hl, bc
					ld  (_player), hl 		// player.x
					jp  nc, push_pull_invalidate_keys

				.push_pull_facing_right
					// Facing right

					// if ((gpx & 15) == 4 && qtile (gpxx + 1, gpyy) == 14)
					ld  a, (_gpx)
					and 15
					cp  4
					jp  nz, push_pull_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _qtile
					pop bc 
					pop bc 
					ld  a, l
					cp  14
					jp  nz, push_pull_done

				.push_pull_facing_right_do	

					ld  a, 1
					ld  (_player + 38), a	// player.grab_block

					// if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) < 8) {
					ld  a, (_pad_this_frame)
					and sp_LEFT
					jr  nz, push_pull_facing_right_do_not_left

					ld  a, (_gpxx)
					dec a
					ld  c, a
					ld  a, (_gpyy)
					call _attr_2
					ld  a, l
					cp  8
					jr  nc, push_pull_facing_right_do_not_left

				.push_pull_facing_right_do_left
					// x0 = gpxx + 1; x1 = gpxx;
					ld  a, (_gpxx)
					ld  c, a
					ld  (_x1), a
					inc a
					ld  (_x0), a

					// gpxx --; gpx -= 16; player.x -= (16<<6); 
					ld  a, c
					dec a
					ld  (_gpxx), a

					ld  a, (_gpx)
					sub a, 16
					ld  (_gpx), a 

					ld  hl, (_player) 		// player.x
					ld  bc, 1024			// 16 << 6
					sbc hl, bc 
					ld  (_player), hl, 		// player.x
					jr  push_pull_invalidate_keys

				.push_pull_facing_right_do_not_left
					// else if ((pad_this_frame & sp_RIGHT) == 0) {
					ld  a, (_pad_this_frame)
					and sp_RIGHT
					jr  nz, push_pull_invalidate_keys

				.push_pull_facing_right_do_right
					// 	x0 = gpxx + 1; x1 = gpxx + 2;
					ld  a, (_gpxx)
					inc a
					ld  (_x0), a
					inc a
					ld  (_x1), a

				.push_pull_invalidate_keys
					ld  a, (_pad0)
					or  sp_FIRE|sp_LEFT|sp_RIGHT
					ld  (_pad0), a
					ld  (_pad_this_frame), a

				.push_pull_move
					// if (x0 != 0xff) {
					ld  a, (_x0)
					cp  0xff
					jr  z, push_pull_done

					call _can_move_box
					xor a
					or  l
					jr  z, push_pull_undo

				#ifdef PUSH_AND_PULL_PILES 
						ld  a, (_y1)
						ld  (_y0), a
				#endif

					ld  hl, 1
					call _move_tile
					jp  push_pull_done 

				.push_pull_undo
					//  gpxx = rdx >> 4; gpx = rdx; player.x = gpx << 6; 
					ld  a, (_rdx)
					ld  (_gpx), a
					ld  c, a
					srl a
					srl a
					srl a
					srl a
					ld  (_gpxx), a

					/*
					ld  a, (_gpx)
					ld  e, a
					ld  d, 0
					ld  l, 6
					call l_asl
					*/
					ld  a, c
					call Ashl16_HL
					ld  (_player), hl 		// player.x

				.push_pull_done
			#endasm
		#endif
	#endif

	#ifdef PLAYER_CUSTOM_HORZ_AXIS
		#include "custom_horz_axis.h"
	#else
		#ifdef PLAYER_NO_INERTIA
			if ((pad0 & sp_LEFT) == 0) { player.vx = -PLAYER_CONST_V; player.facing = GENITAL_FACING_LEFT; }
			if ((pad0 & sp_RIGHT) == 0) { player.vx = PLAYER_CONST_V; player.facing = GENITAL_FACING_RIGHT; }
			if ((pad0 & sp_LEFT) != 0 && (pad0 & sp_RIGHT) != 0) player.vx = 0;
		#else
			#if defined ENABLE_FRIGOABABOL && defined FRIGO_FROZEN_NO_RX
				if (player.estado != EST_FRIGOABABOL)
			#endif
			if ((pad0 & sp_LEFT) != 0 && (pad0 & sp_RIGHT) != 0) {
				if (player.vx > 0) {
					player.vx -= player.rx;
					if (player.vx < 0)
						player.vx = 0;
				} else if (player.vx < 0) {
					player.vx += player.rx;
					if (player.vx > 0)
						player.vx = 0;
				}
			}

			if ((pad0 & sp_LEFT) == 0) {
				if (player.vx > -player.max_vx) {
					#ifndef PLAYER_MOGGY_STYLE
						player.facing = 1;
					#endif
					player.vx -= player.ax;
				}
				#ifdef PLAYER_MOGGY_STYLE
					player.facing = GENITAL_FACING_LEFT;
				#endif
			}

			if ((pad0 & sp_RIGHT) == 0) {
				if (player.vx < player.max_vx) {
					player.vx += player.ax;
					#ifndef PLAYER_MOGGY_STYLE
						player.facing = 0;
					#endif
				}
				#ifdef PLAYER_MOGGY_STYLE
					player.facing = GENITAL_FACING_RIGHT;
				#endif
			}
		#endif

		#ifdef PLAYER_DIZZY
			if (player.estado & EST_DIZZY) { player.vx >>= 1; player.vx += (rand () & (PLAYER_CONST_V - 1)) - (PLAYER_CONST_V >> 1); }
		#endif
	#endif

	player.x += player.vx;
	player.x += ptgmx;
	
	// Safe
	
	if (player.x < 0)
		player.x = 0;
		
	if (player.x > 14336)
		player.x = 14336;

	/*
	gpx = player.x >> 6;
	gpxx = gpx >> 4;
	*/
	#asm
			ld  hl, (_player + 0) 		// player.x
			call HLshr6_A
			ld  (_gpx), a 
			srl a
			srl a 
			srl a
			srl a 
			ld  (_gpxx), a
	#endasm

	/*
	rdj = player.vx + ptgmx;
	if (rdj) {
		#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
			if (rdj < 0) {
				if (attr (gpxx, gpyy) & 8 || ((gpy & 15) != 0 && attr (gpxx, gpyy + 1) & 8)) {
					player.vx = 0; gpxx ++; adjust_to_tile_x ();
				}
			} else {
				if (attr (gpxx + 1, gpyy) & 8 || ((gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 8)) {
					player.vx = 0; adjust_to_tile_x ();
				}
			}
		#else
			if (rdj < 0 && (gpx & 15) < 12) {
				if ( ((gpy & 15) < 12 && attr (gpxx, gpyy) & 8) || ((gpy & 15) && attr (gpxx, gpyy + 1) & 8)) {
					player.vx = 0; gpx = (gpxx << 4) + 12; player.x = gpx << 6;
					wall = WALL_LEFT;
				}
			} else if ((gpx & 15) >= 4)	{
				if ( ((gpy & 15) < 12 && attr (gpxx + 1, gpyy) & 8) || ((gpy & 15) && attr (gpxx + 1, gpyy + 1) & 8)) {
					player.vx = 0; gpx = (gpxx << 4) + 4; player.x = gpx << 6;
					wall = WALL_RIGHT;
				}
			}
		#endif
	}
	*/

	#asm
			ld  hl, (_player + 6)		// player.vx
			ld  de, (_ptgmx)
			add hl, de
			ld  (_rdj), hl

			// if (rdj)
			ld  a, h
			or  l
			jp  z, horz_collision_done
			
			// if (rdj < 0)
			bit 7, h
			jp  z, horz_collision_positive

		#if !defined SHORT_PLAYER

			.horz_collision_negative
				// rdj < 0

				// if (attr (gpxx, gpyy) & 8 || ((gpy & 15) != 0 && attr (gpxx, gpyy + 1) & 8))
				ld  a, (_gpxx)
				ld  c, a
				ld  a, (_gpyy)
				call _attr_2
				ld  a, l
				and 8

				jr  nz, horz_collision_left

				ld  a, (_gpy)
				and 15
				jr  z, horz_collision_done

				ld  a, (_gpxx)
				ld  c, a
				ld  a, (_gpyy)
				inc a
				call _attr_2
				ld  a, l
				and 8
				jp  z, horz_collision_done

			.horz_collision_left
				ld  hl, 0
				ld  (_player + 6), hl 	// player.vx

				ld  hl, _gpxx
				inc (hl)

				call _adjust_to_tile_x
				jr  horz_collision_done

			.horz_collision_positive
				// rdj > 0

				// if (attr (gpxx + 1, gpyy) & 8 || ((gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 8))
				ld  a, (_gpxx)
				inc a
				ld  c, a
				ld  a, (_gpyy)
				call _attr_2
				ld  a, l
				and 8

				jr  nz, horz_collision_right

				ld  a, (_gpy)
				and 15
				jr  z, horz_collision_done

				ld  a, (_gpxx)
				inc a
				ld  c, a
				ld  a, (_gpyy)
				inc a
				call _attr_2
				ld  a, l
				and 8
				jp  z, horz_collision_done

			.horz_collision_right
				ld  hl, 0
				ld  (_player + 6), hl 	// player.vx

				call _adjust_to_tile_x
		#else

			.horz_collision_negative
				// rdj < 0

				// if (gpx & 15) < 12
				ld  a, (_gpx)
				and 15
				cp  12
				jp  nc, horz_collision_done

				// ((gpy & 15) < 12 && attr (gpxx, gpyy) & 8) ||
				// ((gpy & 15) && attr (gpxx, gpyy + 1) & 8))

			.horz_collision_if1
				ld  a, (_gpy)
				and 15
				cp  12
				jp  nc, horz_collision_if2

				ld  a, (_gpxx)
				ld  c, a
				ld  a, (_gpyy)
				call _attr_2
				ld  a, l
				and 8

				jp  nz, horz_collision_left

			.horz_collision_if2
				ld  a, (_gpy)
				and 15
				jp  z, horz_collision_done

				ld  a, (_gpxx)
				ld  c, a
				ld  a, (_gpyy)
				inc a
				call _attr_2
				ld  a, l
				and 8

				jp  z, horz_collision_done

			.horz_collision_left

				// player.vx = 0; gpx = (gpxx << 4) + 12; player.x = gpx << 6; wall = WALL_LEFT;
				ld  hl, 0
				ld  (_player + 6), hl 	// player.vx

				ld  a, (_gpxx)
				sla a
				sla a 
				sla a 
				sla a 
				add 12
				ld  (_gpx), a

				/*
				ld  a, (_gpx)
				ld  e, a
				ld  d, 0
				ld  l, 6
				call l_asl
				*/
				call Ashl16_HL
				ld  (_player), hl 		// player.x

				ld  a, WALL_LEFT
				ld  (_wall), a

				jr  horz_collision_done

			.horz_collision_positive
				// if ((gpx & 15) >= 4)
				ld  a, (_gpx)
				and 15
				cp  4
				jp  c, horz_collision_done

				// ((gpy & 15) < 12 && attr (gpxx + 1, gpyy) & 8) ||
				// ((gpy & 15) && attr (gpxx + 1, gpyy + 1) & 8))

			.horz_collision_if3
				ld  a, (_gpy)
				and 15
				cp  12
				jp  nc, horz_collision_if4

				ld  a, (_gpxx)
				inc a
				ld  c, a
				ld  a, (_gpyy)
				call _attr_2
				ld  a, l
				and 8

				jp  nz, horz_collision_right				

			.horz_collision_if4
				ld  a, (_gpy)
				and 15
				jp  z, horz_collision_done

				ld  a, (_gpxx)
				inc a
				ld  c, a
				ld  a, (_gpyy)
				inc a
				call _attr_2
				ld  a, l
				and 8

				jp  z, horz_collision_done

			.horz_collision_right

				// player.vx = 0; gpx = (gpxx << 4) + 4; player.x = gpx << 6; wall = WALL_RIGHT;
				ld  hl, 0
				ld  (_player + 6), hl 	// player.vx

				ld  a, (_gpxx)
				sla a
				sla a 
				sla a 
				sla a 
				add 4
				ld  (_gpx), a

				/*
				ld  a, (_gpx)
				ld  e, a
				ld  d, 0
				ld  l, 6
				call l_asl
				*/
				call Ashl16_HL
				ld  (_player), hl 		// player.x

				ld  a, WALL_RIGHT
				ld  (_wall), a
		#endif

		.horz_collision_done
	#endasm	
	
	// Shooting engine:
	
	#ifdef PLAYER_CAN_FIRE
		#ifdef PLAYER_MOGGY_STYLE
			// TODO. Not implemented yet. 
		#else
			if ((pad0 & sp_FIRE) == 0 && player.disparando == 0) {
				player.disparando = 1;
				fire_bullet ();
			}
			
			if ((pad0 & sp_FIRE) != 0) 
				player.disparando = 0;
		#endif
	#endif

	// Sword
	#ifdef ENABLE_SWORD
		if (s_on == 0 && (pad_this_frame & sp_FIRE) == 0) {
			#if !defined PLAYER_MOGGY_STYLE && defined SWORD_UP
				if ((pad0 & sp_UP) == 0) {
					s_type = SWORD_TYPE_UP;
				} else 
			#endif
			s_type = player.facing;

			#ifdef SWORD_DEPLETES
				if (player.sword_g)
			#endif
			{
				s_on = 1;
				s_frame = 0;
				s_next_frame = sword_cells [s_type];
			}
		}
	#endif
	
	// Keys / bolts engine:

	#ifndef DEACTIVATE_KEYS
		if (
			#if !defined SHORT_PLAYER
				(gpx & 15) == 0 
			#else
				wall
			#endif
			&& (gpy & 15) == 0
			&& (player.keys > 0
				#ifdef MASTER_OF_KEYS
					|| master_of_keys
				#endif
			)
		) {
			if (qtile (gpxx + 1, gpyy) == 15) {
				clear_cerrojo (gpxx + 1, gpyy);
				player.keys --;
				play_sfx (8);
			} else 
			#if !defined SHORT_PLAYER
				if (qtile (gpxx - 1, gpyy) == 15) {
					clear_cerrojo (gpxx - 1, gpyy);
					player.keys --;
					play_sfx (8);
				}
			#else
				if (qtile (gpxx, gpyy) == 15) {
					clear_cerrojo (gpxx, gpyy);
					player.keys --;
					play_sfx (8);
				}
			#endif
		}
	#endif
	
	// Pushing boxes (tile #14) engine

	#if defined PLAYER_PUSH_BOXES && !defined PUSH_AND_PULL
		#ifdef PLAYER_MOGGY_STYLE
			if ((pad0 & sp_FIRE) == 0)
		#endif
		{
				
				// In side-view mode, you can't push boxes vertically.
				#ifdef PLAYER_MOGGY_STYLE
					/*
					if ((gpy & 15) == 0) {
						x0 = x1 = gpxx; 
						if ((pad0 & sp_UP) == 0 && gpyy > 1) {
							y0 = gpyy - 1; y1 = gpyy - 2;
							if (can_move_box ()) move_tile (1);
							
							if ((gpx & 15) != 0) {
								x0 = x1 = gpxx + 1;
								if (can_move_box ()) move_tile (1);
							}
						} else if ((pad0 & sp_DOWN) == 0 && gpyy < 8) {
							y0 = gpyy + 1; y1 = gpyy + 2;
							if (can_move_box ()) move_tile (1);
							
							if ((gpx & 15) != 0) {
								x0 = x1 = gpxx + 1;
								if (can_move_box ()) move_tile (1);
							}
						}
					}
					*/

					#asm	
						.push_box_vert				
		

						#ifdef SHORT_PLAYER
								ld  a, (_wall)
								cp  WALL_UP
								jr  nz, push_box_vert_up_done	
						#else
						// Vertically, only when player.y is tile-aligned.
								ld  a, (_gpy)
								and 15
								jp  nz, push_box_vert_done
						#endif

						.push_box_vert_do

							ld  a, (_gpxx)
							ld  (_x0), a
							ld  (_x1), a 

							ld  a, (_pad0) 
							and sp_UP 
							jr  nz, push_box_vert_up_done

							ld  a, (_gpyy)
							cp  2
							jr  c, push_box_vert_up_done

							ld  a, (_gpyy)
						#ifndef SHORT_PLAYER
								dec a
						#endif
							ld  (_y0), a
							dec a 
							ld  (_y1), a

							call _can_move_box
							xor a
							or  l 
							jr  z, push_box_vert_s1

							ld  hl, 1
							call _move_tile

						.push_box_vert_s1
							ld  a, (_gpx) 
							and 15 
							jr  z, push_box_vert_done 

							ld  a, (_gpxx)
							inc a 
							ld  (_x0), a
							ld  (_x1), a

							call _can_move_box 
							xor a 
							or  l
							jr  z, push_box_vert_done

							ld  hl, 1
							call _move_tile

							jr  push_box_vert_done

						.push_box_vert_up_done

							#ifdef SHORT_PLAYER
								ld  a, (_gpy)
								and 15
								jp  nz, push_box_vert_done
							#endif

							ld  a, (_pad0) 
							and sp_DOWN
							jr  nz, push_box_vert_done

							ld  a, (_gpyy)
							cp  8
							jr  nc, push_box_vert_done

							ld  a, (_gpyy)
							inc a
							ld  (_y0), a
							inc a 
							ld  (_y1), a

							call _can_move_box
							xor a
							or  l 
							jr  z, push_box_vert_s2

							ld  hl, 1
							call _move_tile

						.push_box_vert_s2
							ld  a, (_gpx) 
							and 15 
							jr  z, push_box_vert_done 

							ld  a, (_gpxx)
							inc a 
							ld  (_x0), a
							ld  (_x1), a

							call _can_move_box 
							xor a 
							or  l
							jr  z, push_box_vert_done

							ld  hl, 1
							call _move_tile

						.push_box_vert_done
					#endasm					
				#endif

				#if !defined SHORT_PLAYER	
					/*		
					if ((gpx & 15) == 0) {
						y0 = y1 = gpyy; 
						if ((pad0 & sp_RIGHT) == 0 && gpxx < 14) {
							x0 = gpxx + 1; x1 = gpxx + 2;
							if (can_move_box ()) move_tile (1);
					
							if ((gpy & 15) != 0) {
								y0 = y1 = gpyy + 1;
								if (can_move_box ()) move_tile (1);
							}
						} else if ((pad0 & sp_LEFT) == 0 && gpxx > 1) {
							x0 = gpxx - 1; x1 = gpxx - 2;
							if (can_move_box ()) move_tile (1);
							
							if ((gpy & 15) != 0) {
								y0 = y1 = gpyy + 1;
								if (can_move_box ()) move_tile (1);
							}
						}	
					}
					*/

					#asm	
						.push_box_horz				
		
						// Horizontally, only when player.x is tile-aligned.

							ld  a, (_gpx)
							and 15
							jp  nz, push_box_horz_done

						.push_box_horz_do

							ld  a, (_gpyy)
							ld  (_y0), a
							ld  (_y1), a 

							ld  a, (_pad0) 
							and sp_LEFT 
							jr  nz, push_box_horz_left_done

							ld  a, (_gpxx)
							cp  2
							jr  c, push_box_horz_left_done

							ld  a, (_gpxx)
							dec a
							ld  (_x0), a
							dec a 
							ld  (_x1), a

							call _can_move_box
							xor a
							or  l 
							jr  z, push_box_horz_s1

							ld  hl, 1
							call _move_tile

						.push_box_horz_s1
							ld  a, (_gpy) 
							and 15 
							jr  z, push_box_horz_done 

							ld  a, (_gpyy)
							inc a 
							ld  (_y0), a
							ld  (_y1), a

							call _can_move_box 
							xor a 
							or  l
							jr  z, push_box_horz_done

							ld  hl, 1
							call _move_tile

							jr  push_box_horz_done

						.push_box_horz_left_done

							ld  a, (_pad0) 
							and sp_RIGHT
							jr  nz, push_box_horz_done

							ld  a, (_gpxx)
							cp  14
							jr  nc, push_box_horz_done

							ld  a, (_gpxx)
							inc a
							ld  (_x0), a
							inc a 
							ld  (_x1), a

							call _can_move_box
							xor a
							or  l 
							jr  z, push_box_horz_s2

							ld  hl, 1
							call _move_tile

						.push_box_horz_s2
							ld  a, (_gpy) 
							and 15 
							jr  z, push_box_horz_done 

							ld  a, (_gpyy)
							inc a 
							ld  (_y0), a
							ld  (_y1), a

							call _can_move_box 
							xor a 
							or  l
							jr  z, push_box_horz_done

							ld  hl, 1
							call _move_tile

						.push_box_horz_done
					#endasm							
				#else
					// TODO: This into assembly (probably won't)

					y0 = y1 = gpyy;

					if (wall == WALL_RIGHT && (pad0 & sp_RIGHT) == 0 && gpxx < 14) {
						x0 = gpxx + 1; x1 = gpxx + 2;
						if (can_move_box ()) move_tile (1);
				
						if ((gpy & 15) != 0) {
							y0 = y1 = gpyy + 1;
							if (can_move_box ()) move_tile (1);
						}
					} else if (wall == WALL_LEFT && (pad0 & sp_LEFT) == 0 && gpxx > 0) {
						x0 = gpxx; x1 = gpxx - 1;

						if (can_move_box ()) move_tile (1);
				
						if ((gpy & 15) != 0) {
							y0 = y1 = gpyy + 1;
							if (can_move_box ()) move_tile (1);
						}
					}
				#endif
		}
	#endif

	#ifndef DEACTIVATE_EVIL_TILE	
		// Evil tile engine

		#asm
			#ifdef EVIL_TILE_SIMPLE
				//if (attr ((gpx + 8) >> 4, (gpy + 14) >> 4) == 1)
					ld  a, (_gpx)
					add 8
					srl a
					srl a
					srl a
					srl a
					
					ld  c, a

					ld  a, (_gpy)
					add 14
					srl a
					srl a 
					srl a
					srl a

					call _attr_2

					ld a, l
					dec a

					jr nz, evil_tile_collision_done
			#else
				/*
				if (attr (gpxx, gpyy) == 1 || 
					((gpx & 15) != 0 && attr (gpxx + 1, gpyy) == 1) ||
					((gpy & 15) != 0 && attr (gpxx, gpyy + 1) == 1) ||
					((gpx & 15) != 0 && (gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) == 1)) 
				*/				
				// Rewrite: use 4 points from a smaller bounding box.
					ld  a, (_gpx)
					ld  b, a
					add 4
					srl a
					srl a
					srl a
					srl a
					ld  (_ptx1), a
					ld  a, b
					add 11
					srl a
					srl a
					srl a
					srl a
					ld  (_ptx2), a
					ld  a, (_gpy)
					ld  b, a
					add 4
					srl a
					srl a
					srl a
					srl a
					ld  (_pty1), a
					ld  a, b
					add 11
					srl a
					srl a
					srl a
					srl a
					ld  (_pty2), a

					//
					ld  a, (_ptx1)
					ld  c, a
					ld  a, (_pty1)
					call _attr_2
					ld  a, l
					dec a 		// CP 1
					jr  z, evil_tile_collision

					ld  a, (_ptx2)
					ld  c, a
					ld  a, (_pty1)
					call _attr_2
					ld  a, l
					dec a 		// CP 1
					jr  z, evil_tile_collision

					ld  a, (_ptx2)
					ld  c, a
					ld  a, (_pty1)
					call _attr_2
					ld  a, l
					dec a 		// CP 1
					jr  z, evil_tile_collision

					ld  a, (_ptx2)
					ld  c, a
					ld  a, (_pty2)
					call _attr_2
					ld  a, l
					dec a 		// CP 1
					jr  nz, evil_tile_collision_done
			#endif

			.evil_tile_collision				
		#endasm
		{		
			if (player.estado == EST_NORMAL) {
				play_sfx (2);
				player.life -= LINEAR_ENEMY_HIT;	
				#ifdef PLAYER_FLICKERS
					// Flickers. People seem to like this more than the bouncing behaviour.
					player_flicker ();
				#endif
				player_just_died = PLAYER_KILLED_BY_BG;
			}			
			player.x = gpcx;
			player.y = gpcy;
			#ifdef PLAYER_MOGGY_STYLE
				if (abs (player.vx) > abs (player.vy)) player.vx = -player.vx;
				else player.vy = -player.vy;
			#else
				#ifdef EVIL_TILE_SIMPLE
					player.vy = -abs (player.vy);
					if (player.vy > -(PLAYER_G*9)) player.vy = -(PLAYER_G*9);
				#else
					player.vy = -player.vy;
				#endif
			#endif
		}
		#asm
			.evil_tile_collision_done
		#endasm
	#endif

	#ifndef DEACTIVATE_EVIL_ZONE
		// Evil zone engine

		if (attr ((gpx + 4) >> 4, (gpy + 4) >> 4) == 3
			#ifdef EVIL_ZONE_CONDITIONAL
				&& scenery_info.evil_zone_active
			#endif
		) {
			if (player.killingzone_beepcount >= EVIL_ZONE_BEEPS_COUNT || 0 == scenery_info.evil_kills_slowly) {
				if (0 == (player.estado & EST_PARP)
					#ifdef EVIL_ZONE_FREQ
						&& 0 == (maincounter & EVIL_ZONE_FREQ)
					#endif
				) {
					player.killingzone_framecount = (player.killingzone_framecount + 1) & 3;
					if (
						0 == player.killingzone_framecount
					) play_sfx (3);
					player.life --;	
					player_just_died = PLAYER_KILLED_BY_EZ;
				}
			} else {
				if (player.killingzone_framecount > EVIL_ZONE_FRAME_COUNT) {
					player.killingzone_framecount = 0;
					player.killingzone_beepcount ++;
					cpc_Border (0x4C);
					play_sfx (4);
					#asm
						halt
					#endasm
					cpc_Border (0x54);
				} else {
					player.killingzone_framecount ++;
				}
			}
		} else {
			if (player.killingzone_beepcount > 0)
				player.killingzone_beepcount --;
		}
	#endif

	#ifdef USE_COINS
		// Coins interaction
		#asm
			.player_get_coin
		#endasm
		
		#ifdef COIN_BEH
			/*
			_x = gpxx; _y = gpyy; if (attr (_x, _y) & COIN_BEH) get_coin ();

			if (gpx & 15) {
				_x = gpxx + 1; _y = gpyy; if (attr (_x, _y) & COIN_BEH) get_coin ();
			} 

			if (gpy & 15) {
				_x = gpxx; _y = gpyy + 1; if (attr (_x, _y) & COIN_BEH) get_coin ();
			}

			if ((gpx & 15) && (gpy & 15)) {
				_x = gpxx + 1; _y = gpyy + 1; if (attr (_x, _y) & COIN_BEH) get_coin ();
			}
			*/
			#asm
					ld  a, (_gpxx)
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					ld  (__y), a

					call _attr_2
					ld  a, l
					and COIN_BEH
					jr  nz, player_get_coin_A_done

					call _get_coin
				.player_get_coin_A_done


					ld  a, (_gpx)
					and 15
					jr  z, player_get_coin_B_done

					ld  a, (_gpxx)
					inc a
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					ld  (__y), a

					call _attr_2
					ld  a, l
					and COIN_BEH
					jr  nz, player_get_coin_B_done

					call _get_coin
				.player_get_coin_B_done


					ld  a, (_gpy)
					and 15
					jr  z, player_get_coin_C_done

					ld  a, (_gpxx)
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					inc a
					ld  (__y), a

					call _attr_2
					ld  a, l
					and COIN_BEH
					jr  nz, player_get_coin_C_done

					call _get_coin
				.player_get_coin_C_done


					ld  a, (_gpx)
					and 15
					jr  z, player_get_coin_D_done
					ld  a, (_gpy)
					and 15
					jr  z, player_get_coin_D_done

					ld  a, (_gpxx)
					inc a
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					inc a
					ld  (__y), a

					call _attr_2
					ld  a, l
					and COIN_BEH
					jr  nz, player_get_coin_D_done

					call _get_coin
				.player_get_coin_D_done

			#endasm
		#else
			/*
			_x = gpxx; _y = gpyy; if (qtile (_x, _y) == COIN_TILE) get_coin ();

			if (gpx & 15) {
				_x = gpxx + 1; _y = gpyy; if (qtile (_x, _y) == COIN_TILE) get_coin ();
			} 

			if (gpy & 15) {
				_x = gpxx; _y = gpyy + 1; if (qtile (_x, _y) == COIN_TILE) get_coin ();
			}

			if ((gpx & 15) && (gpy & 15)) {
				_x = gpxx + 1; _y = gpyy + 1; if (qtile (_x, _y) == COIN_TILE) get_coin ();
			}
			*/
			#asm
					ld  a, (_gpxx)
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					ld  (__y), a

					call qtile_do
					ld  a, l
					cp  COIN_TILE
					jr  nz, player_get_coin_A_done

					call _get_coin
				.player_get_coin_A_done


					ld  a, (_gpx)
					and 15
					jr  z, player_get_coin_B_done

					ld  a, (_gpxx)
					inc a
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					ld  (__y), a

					call qtile_do
					ld  a, l
					cp  COIN_TILE
					jr  nz, player_get_coin_B_done

					call _get_coin
				.player_get_coin_B_done


					ld  a, (_gpy)
					and 15
					jr  z, player_get_coin_C_done

					ld  a, (_gpxx)
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					inc a
					ld  (__y), a

					call qtile_do
					ld  a, l
					cp  COIN_TILE
					jr  nz, player_get_coin_C_done

					call _get_coin
				.player_get_coin_C_done


					ld  a, (_gpx)
					and 15
					jr  z, player_get_coin_D_done
					ld  a, (_gpy)
					and 15
					jr  z, player_get_coin_D_done

					ld  a, (_gpxx)
					inc a
					ld  (__x), a
					ld  c, a
					ld  a, (_gpyy)
					inc a
					ld  (__y), a

					call qtile_do
					ld  a, l
					cp  COIN_TILE
					jr  nz, player_get_coin_D_done

					call _get_coin
				.player_get_coin_D_done

			#endasm
		#endif
	#endif

	// Select next frame to paint...

	#ifdef PLAYER_CUSTOM_ANIMATION
		#include "custom_animation.h"
	#else
		#ifndef PLAYER_MOGGY_STYLE
			// In this case, the spriteset is:
			// 1  2  3  4  5  6  7  8
			// R1 R2 R3 RJ L1 L2 L3 LJ

			#ifdef ENABLE_FRIGOABABOL
				if (player.estado == EST_FRIGOABABOL) {
					rdd = 8; rdi = 0;
				} else
			#endif

			{
				#asm
					ld  a, (_player+22)					// player.facing
					or  a
					jr  z, _player_cell_sel_set_rdi		// if A = 0 set 0
					ld  a, 4							// ELSE     set 4
				._player_cell_sel_set_rdi
					ld  (_rdi), a
				#endasm

				#ifdef PUSH_AND_PULL
					if (player.grab_block) rdd = PLAYER_GRAB_FRAME; else
				#endif
				#ifdef ENABLE_SWORD
					if (s_on) rdd = SWORD_HIT_FRAME; else
				#endif
				if (0 == player.possee && 0 == player.gotten) {
					rdd = 3;
				} else {
					if (
						#ifdef SLIPPERY_TILES
							((pad0 & sp_LEFT) != 0 && (pad0 & sp_RIGHT) != 0)
						#else
							player.vx == 0
						#endif
					)
					#ifdef PLAYER_ALTERNATE_ANIMATION
						{
							rdd = player.facing ? 2 : 0;
						} else {
							rdd = ((gpx + 4) >> 3) % 3;
						}
					#else 
						{
							rdd = 1;
						} else {
							rdd = ((gpx + 4) >> 3) & 3;
							if (rdd == 3) rdd = 1;
						}
					#endif
				}
			}

			player.next_frame = player_cells [rdi + rdd];
		#else
			// In this case, the spriteset is
			// 1  2  3  4  5  6  7  8
			// R1 R2 L1 L2 U1 U2 D1 D2
			
			#ifdef ENABLE_FRIGOABABOL
				if (player.estado == EST_FRIGOABABOL) {
					player.next_frame = sprite_frigo;
				} else
			#endif
			{
				#if defined ENABLE_SWORD && defined GENITAL_HIT_FRAMES
					if (s_on) {
						rdd = 9 + player.facing;
					} else
				#endif
				{
					if ((pad0 ^ (sp_LEFT|sp_RIGHT|sp_UP|sp_DOWN)) & (sp_LEFT|sp_RIGHT|sp_UP|sp_DOWN)) {
						player.subframe ++;
						if (player.subframe == 4) {
							player.subframe = 0;
							player.frame = !player.frame;							
						}
					}
					
					#ifdef LOOK_AT_THE_CAMERA				
						rdd = player.frame;
						if (player.vx == 0) {		
							if (player.vy < 0) rdd += 4;
							else rdd += 6; 
						} else if (player.vx < 0) rdd += 2;
					#else
						rdd = player.frame + (player.facing << 1);
					#endif
				}
				player.next_frame = player_cells [rdd];
			}

		#endif
	#endif
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

	#ifndef SLIPPERY_TILES
				ld  a, PLAYER_AX
				ld  (_player+11), a 			// .ax

				ld  a, PLAYER_RX
				ld  (_player+12), a 			// .rx
	#endif
	#ifndef QUICKSAND_TILES
				ld  hl, PLAYER_MAX_VX
				ld  (_player+39), hl 			// .max_vx
	#endif

			ld  hl, 0
			ld  (_player+6), hl 				// .vx
			ld  (_player+8), hl 				// .vy

			xor a
			ld  (_player+19),a 					// .saltando
			ld  (_player+20),a 					// .frame
			ld  (_player+21),a 					// .subframe
			ld  (_player+23), a 				// .estado
			ld  (_player+24),a 					// .ct_estado
			ld  (_player+33),a 					// .disparando
			ld  (_player+34),a 					// .killingzone_framecount
			ld  (_player+35),a 					// .killingzone_beepcount
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
	
	/*
	player.life = 		PLAYER_LIFE;
	player.objs =		0;
	player.keys = 		0;
	player.killed = 	0;
	*/
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
	/*
	for (gpit = 0; gpit < MAP_W * MAP_H; gpit ++)
		hotspots [gpit].act = 1;
	*/
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

#if !defined TWO_SETS && !defined UNPACKED_MAP
	void draw_and_advance (void) {
		/*
		map_attr [rdi] = comportamiento_tiles [_n];
		map_buff [rdi] = _n;
		draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, _n);
		rdx += 2;
		if (rdx == 30) {
			rdx = 0;
			rdy += 2;
		}
		rdi ++;
		*/

		#asm
			#ifdef ENABLE_ANIMATED_TILES
					ld  a, (__n)
					cp  ANIMATED_TILE
					jr  nz, _animated_tiles_add_done

					ld  hl, (_animated_ptr)
					
					// Encode Y, X in nibbles
					ld  a, (_rdx)
					srl a 				
					ld  b, a 			// b = X / 2 = 0000XXXX
					ld  a, (_rdy)
					;and 0xfe            // xxxYYYY0
					sla a
					sla a
					sla a 				// YYYY0000
					or  b 				// YYYYXXXX

					ld  (hl), a
					inc hl
					ld  (_animated_ptr), hl

				._animated_tiles_add_done
			#endif

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

#ifdef TWO_SETS
	void draw_and_advance (void) {
		/*
		map_attr [rdi] = comportamiento_tiles [_n];
		map_buff [rdi] = _t;
		draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, _n);
		rdx += 2;
		if (rdx == 30) {
			rdx = 0;
			rdy += 2;
		}
		rdi ++;
		*/

		#asm
			#ifdef ENABLE_ANIMATED_TILES
					ld  a, (__n)
					cp  ANIMATED_TILE
					jr  nz, _animated_tiles_add_done

					ld  hl, (_animated_ptr)
					
					// Encode Y, X in nibbles
					ld  a, (_rdx)
					srl a 				
					ld  b, a 			// b = X / 2 = 0000XXXX
					ld  a, (_rdy)
					;and 0xfe            // xxxYYYY0
					sla a
					sla a
					sla a 				// YYYY0000
					or  b 				// YYYYXXXX

					ld  (hl), a
					inc hl
					ld  (_animated_ptr), hl

				._animated_tiles_add_done
			#endif

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
				ld  a, (__t)
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
			ld  (_hotspot_t), a

			call _calc_hotspot_ptr
			
			ld  ix, _hotspots
			add ix, de

			// Struct is xy, tipo, act

			ld  a, (ix+2) 		// .act
			cp  1
			jr  nz, hotspot_paint_act_skip

			#if defined(ACTIVATE_SCRIPTING) && defined(OBJECTS_ON_VAR)
				ld  a, (_flags + OBJECTS_ON_VAR)
				or  a
				jr  z, hotspot_paint_act_skip
			#endif

			ld  a, (ix+1)		// .tipo
			or  a
			jr  z, hotspot_paint_act_skip

		#ifdef MASTER_OF_KEYS
				cp  2
				jr  nz, hotspot_paint_mok_done

				ld  a, (_master_of_keys)
				or  a
				jr  z, hotspot_paint_mok_set2

				ld  a, 3
				jr  hotspot_paint_mok_done

			.hotspot_paint_mok_set2
				ld  a, 2

			.hotspot_paint_mok_done
		#endif

			ld  (_hotspot_t), a

		.hotspot_paint_act_skip

		#if !defined DEACTIVATE_REFILLS && defined LEGACY_REFILLS
				ld  a, (ix+2) 		// .act
				or  a
				jr  nz, hotspot_paint_noact_skip

				call _rand
				ld  a, l
				and 3
				cp  2
				jr  nz, hotspot_paint_noact_skip

				ld  a, 3
				ld  (_hotspot_t), a

			.hotspot_paint_noact_skip
		#endif		

			ld  a, (_hotspot_t)
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

			ld  a, (_hotspot_t)
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
	#ifdef ENABLE_ANIMATED_TILES
		#asm
				ld  hl, ANIMATED_BASE
				ld  (_animated_ptr), hl
				ld  de, ANIMATED_BASE + 1
				ld  bc, MAX_ANIMATED_TILES - 1
				ld  a, 0xff
				ld  (hl), a
				ldir
		#endasm
	#endif

	#asm
			xor a
			ld  (_rdx), a
			ld  (_rdy), a
			ld  (_rdi), a
	#endasm
	
	#ifdef RLE_MAP
		#asm
			._draw_scr_get_scr_address
				/*
				ld  a, (_n_pant)
				sla a
				ld  d, 0
				ld  e, a
				ld  hl, _mapa
				*/

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
	#elif defined (UNPACKED_MAP)
		gp_gen = mapa + (n_pant * 150);		
	#else
		gp_gen = mapa + (n_pant * 75);
	#endif
		
	#if defined TWO_SETS || defined TWO_SETS_REAL
		tileoffset = TWO_SETS_CONDITION;
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
	#elif defined TWO_SETS
		// TWO_SETS_PACKED map, every byte contains two tiles,
		// plus uses several tilesets
		/*
		rdi = 0; 
		for (gpit = 0; gpit < 75; gpit ++) {
			rdd = *gp_gen ++;
			rdt1 = rdd >> 4;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt1 == COIN_TILE && 0 == scenery_info.show_coins) rdt1 = COIN_TILE_DEACT_SUBS;
			#endif
			rdt2 = rdd & 15;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt2 == COIN_TILE && 0 == scenery_info.show_coins) rdt2 = COIN_TILE_DEACT_SUBS;
			#endif

			_t = rdt1; _n = tileoffset + rdt1; draw_and_advance ();
			_t = rdt2; _n = tileoffset + rdt2; draw_and_advance ();
		}
		*/

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

				ld  a, (_tileoffset)
				ld  c, a
				ld  a, (_rdt1)
				ld  (__t), a
				add c
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_tileoffset)
				ld  c, a
				ld  a, (_rdt2)
				ld  (__t), a
				add c
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_gpit)
				inc a
				ld  (_gpit), a
				cp  75
				jr  nz, draw_scr_bg_loop


				#if defined USE_COINS && defined COINS_DEACTIVABLE
						jr  draw_scr_bg_loop_end
					.coins_check
						cp  COIN_TILE
						ret nz

						ld  a, (_scenery_info + 0) 	// scenery_info.showcoins
						or  a

						ld  a, COIN_TILE
						ret nz

						ld  a, COIN_TILE_DEACT_SUBS				
						ret

					.draw_scr_bg_loop_end
				#endif
		#endasm	

	#elif defined TWO_SETS_REAL
		// TWO_SETS_PACKED map, every byte contains two tiles,
		// plus uses several tilesets
		// But *REAL* tile values are written to the buffers
		/*
		rdi = 0;
		for (gpit = 0; gpit < 75; gpit ++) {			
			rdd = *gp_gen ++;
			rdt1 = (rdd >> 4) + tileoffset;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt1 == COIN_TILE && 0 == scenery_info.show_coins) rdt1 = COIN_TILE_DEACT_SUBS;
			#endif
			rdt2 = (rdd & 15) + tileoffset;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt2 == COIN_TILE && 0 == scenery_info.show_coins) rdt2 = COIN_TILE_DEACT_SUBS;
			#endif
			_n = rdt1; draw_and_advance ();
			_n = rdt2; draw_and_advance ();
		}
		*/

		#asm
				xor a
				ld  (_rdi), a
				ld  (_gpit), a

			.draw_scr_bg_loop
				ld  a, (_tileoffset)
				ld  c, a
				
				ld  hl, (_gp_gen)
				ld  a, (hl)
				inc hl
				ld  (_gp_gen), hl
				ld  b, a

				srl a
				srl a
				srl a
				srl a
				add c

				#if defined USE_COINS && defined COINS_DEACTIVABLE
						call coins_check
				#endif

				ld  (_rdt1), a

				ld  a, b
				and 15
				add c

				#if defined USE_COINS && defined COINS_DEACTIVABLE
						call coins_check
				#endif

				ld  (_rdt2), a

				ld  a, (_rdt1)
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_rdt2)
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_gpit)
				inc a
				ld  (_gpit), a
				cp  75
				jr  nz, draw_scr_bg_loop


				#if defined USE_COINS && defined COINS_DEACTIVABLE
						jr  draw_scr_bg_loop_end
					.coins_check
						cp  COIN_TILE
						ret nz

						ld  a, (_scenery_info + 0) 	// scenery_info.showcoins
						or  a

						ld  a, COIN_TILE
						ret nz

						ld  a, COIN_TILE_DEACT_SUBS				
						ret

					.draw_scr_bg_loop_end
				#endif
		#endasm				
	#elif defined RLE_MAP
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

			._advance_worm
				ld  a, (_rdc)

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
	#elif defined MAPPED_TILESETS
		// PACKED map, but tile N is in fact tileset_mappings [N].
		// tileset_mappings is a pointer!

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

				ld  bc, (_rdt1)
				call tile_lookup
				ld  (__n), a
				call _draw_and_advance

				ld  bc, (_rdt2)
				call tile_lookup
				ld  (__n), a
				call _draw_and_advance

				ld  a, (_gpit)
				inc a
				ld  (_gpit), a
				cp  75
				jr  nz, draw_scr_bg_loop

				jr  draw_scr_bg_loop_end

			.tile_lookup
				ld  b, 0
				ld  hl, (_tileset_mappings)
				add hl, bc
				ld  a, (hl)
				ret

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

			.draw_scr_bg_loop_end	
		#endasm				
	#else
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

void enems_en_an_calc (unsigned char n) {
	rdb = en_an_base_frame [enit] = 
		#ifdef ENEMS_OFFSET
			ENEMS_OFFSET +
		#endif
		n << 1;

	rda = SP_ENEMS_BASE + enit;
	sp_sw [rda].cox = sm_cox [rdb];
	sp_sw [rda].coy = sm_coy [rdb];
	sp_sw [rda].invfunc = sm_invfunc [rdb];
	sp_sw [rda].updfunc = sm_updfunc [rdb];
		
	enems_calc_frame ();
}

#ifdef ENABLE_MARRULLERS
	void marrullers_select_direction (void) {
		rdd = en_an_ff [enit];
		switch (rand () & 3) {
			case 0:
				_en_mx = 0; _en_my = rdd; break;
			case 1:
				_en_mx = 0; _en_my = -rdd; break;
			case 2:
				_en_mx = rdd; _en_my = 0; break;
			case 3:
				_en_mx = -rdd; _en_my = 0; break;
		}
	}
#endif

void draw_scr (void) {
	#ifndef DEACTIVATE_EVIL_ZONE
		cpc_Border (0x54);
	#endif

	#ifdef SHOW_LEVEL_INFO
		char *cad_level = "LEVEL";

		saca_a_todo_el_mundo_de_aqui ();

		sp_ClearRect (spritesClip, 0, 0, sp_CR_TILES);
		sp_Invalidate (spritesClip, spritesClip);
		#ifdef SHOW_LEVEL_SUBLEVEL
			draw_text (VIEWPORT_X + 9, VIEWPORT_Y + 10, 71, cad_level);
			draw_2_digits (VIEWPORT_X + 16, VIEWPORT_Y + 10, 1+(n_pant / MAP_W));
			sp_PrintAtInv (VIEWPORT_Y + 10, VIEWPORT_X + 18, 71, 15);
			draw_2_digits (VIEWPORT_X + 19, VIEWPORT_Y + 10, 1+(n_pant % MAP_W));
		#else
			draw_text (VIEWPORT_X + 11, VIEWPORT_Y + 10, 71, cad_level);
			draw_2_digits (VIEWPORT_X + 17, VIEWPORT_Y + 10, (n_pant+1));
		#endif
		cpc_UpdScr ();
		cpc_ShowTileMap (1);
		play_sfx (6);
		espera_activa (1000);
	#endif

	#ifdef FALLING_BOXES
		init_falling_box_buffer ();
	#endif

	#ifdef RESET_BODY_COUNT_ON_ENTER
		player.killed = 0;
	#endif
	
	// This function draws and sets up current screen.
	
	seed = n_pant + 1;
	
	draw_scr_background ();

	#ifdef ENABLE_PERSISTENCE		
		draw_persistent ();
	#endif
			
	#if defined ACTIVATE_SCRIPTING && !defined DEACTIVATE_FIRE_ZONE
		f_zone_ac = 0;
	#endif

	// Set up enemies.

	#asm
		._enems_init
	#endasm
	
	enoffs = n_pant * MAX_ENEMS;

	#ifdef COUNT_KILLABLE_ON
		flags [COUNT_KILLABLE_ON] = 0;
	#endif

	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		/*
		en_an_frame [enit] = 0;
		en_an_state [enit] = 0;
		enoffsmasi = enit + enoffs;
		*/
		
		#asm
				ld  bc, (_enit)
				xor a
				ld  b, a
				ld  hl, _en_an_frame
				add hl, bc
				ld  (hl), a
				ld  hl, _en_an_state
				add hl, bc
				ld  (hl), a
				
				ld  hl, (_enoffs)
				add hl, bc
				ld  (_enoffsmasi), hl
		#endasm

		#if defined NO_MAX_ENEMS || (defined USE_TYPE_6 && defined MAKE_TYPE_6) 
			en_an_next_frame [enit] = sprite_18_a;
		#endif
		
		#ifdef RANDOM_RESPAWN
			en_an_fanty_activo [enit] = 0;
		#endif

		_en_t = malotes [enoffsmasi].t;

		switch (_en_t) {

			// Empty

			#if defined USE_TYPE_6 && defined MAKE_TYPE_6
				case 0:
					if (scenery_info.make_type_6) {
						enems_en_an_calc (2);
						en_an_x [enit] = (rand () % 224) << 6;
						en_an_y [enit] = (rand () % 144) << 6;
						en_an_vx [enit] = en_an_vy [enit] = 0;							
					} 
					break;
			#endif	

			// Linear enemies

			case 1:
			case 2:
			case 3:
			case 4:
				enems_en_an_calc (_en_t - 1);
				break;

			#ifdef USE_TYPE_6
				case 6:
					enems_en_an_calc (2);
					en_an_x [enit] = malotes [enoffsmasi].x << 6;
					en_an_y [enit] = malotes [enoffsmasi].y << 6;
					en_an_vx [enit] = en_an_vy [enit] = 0;					
					break;
			#endif

			#ifdef ENABLE_CUADRATORS
				case 7:
				case 8:
				case 9:
				case 10:
					en_an_ff [enit] = 0;
					enems_en_an_calc (_en_t - 7);

					break;
			#endif

			#ifdef ENABLE_MARRULLERS
				case 11:
				case 12:
				case 13:
				case 14:
					enems_en_an_calc (_en_t - 11);
					malotes [enoffsmasi].x &= 0xf0;
					malotes [enoffsmasi].y &= 0xf0;
					en_an_ff [enit] = abs (malotes [enoffsmasi].mx + malotes [enoffsmasi].my);
					break;
			#endif

			#if defined (ENEMIES_MAY_DIE)
				default:
					en_an_next_frame [enit] = SPRFR_EMPTY;
			#endif
		}
		
		#ifdef ENABLE_CUSTOM_ENEMS
			extra_enems_init ();
		#endif

		#ifdef COUNT_KILLABLE_ON			
			#if defined (ENEMIES_MAY_DIE)
				if (1
				#ifdef BOXES_ONLY_KILL_TYPE
						&& _en_t == BOXES_ONLY_KILL_TYPE
				#endif
				#ifdef PLAYER_MIN_KILLABLE
						&& _en_t >= PLAYER_MIN_KILLABLE
					#endif
					#ifdef PLAYER_MAX_KILLABLE
						&& _en_t <= PLAYER_MAX_KILLABLE
					#endif
				) {
						flags [COUNT_KILLABLE_ON] ++;
					}
				#endif
		#endif
	}
		
	#ifdef ACTIVATE_SCRIPTING
		#ifdef LINE_OF_TEXT
			// Delete line of text
			#asm
					xor a
					ld  (_line_of_text_clear+32-LINE_OF_TEXT_SUBSTR), a			
			#endasm
			draw_text (LINE_OF_TEXT_X, LINE_OF_TEXT, LINE_OF_TEXT_ATTR, line_of_text_clear);
		#endif

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

	#ifdef ENABLE_CODE_HOOKS
		hook_entering ();
	#endif

	#ifdef ENABLE_BREAKABLE
		init_breakable ();
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
				#ifdef ENABLE_BREAKABLE
					if (rdi & 32) add_to_breakables ();
				#endif
			}	
		#endif
	}
#endif	

#ifdef USE_SIGHT_DISTANCE
	unsigned char distance (unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2) {
		// return abs (x2 - x1 + y2 - y1);
		// Better version:
		unsigned char dx = abs (x2 - x1);
		unsigned char dy = abs (y2 - y1);
		unsigned char mn = dx < dy ? dx : dy;
		return (dx + dy - (mn >> 1) - (mn >> 2) + (mn >> 4));
	}
#endif

void platform_get_player (void) {
	#asm
			ld  a, 1
			ld  (_player+25), a 		// .gotten
			ld  a, (_en_ccy)
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

#if defined PLAYER_CAN_FIRE || defined PLAYER_KILLS_ENEMIES || defined ENABLE_SWORD
	void enems_kill (void) {
		#ifdef ENABLE_CODE_HOOKS
			enemy_died = _en_t;
		#endif

		// Kill enemy
		/*
		sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an_next_frame [enit] - en_an_current_frame [enit], VIEWPORT_Y + (en_ccy >> 3), VIEWPORT_X + (en_ccx >> 3), en_ccx & 7, en_ccy & 7);
		en_an_current_frame [enit] = en_an_next_frame [enit];
		*/
		#asm
				ld  a, (_en_ccx)
				ld  (_rdx), a
				ld  a, (_en_ccy)
				ld  (_rdy), a 
				call _render_this_enemy
		#endasm

		cpc_UpdateNow (1);
		cpc_HardPause (50);

		play_sfx (10);
		en_an_next_frame [enit] = sprite_18_a;

		_en_t |= 16;			// dead

		// Count
		player.killed ++;

		#ifdef ACTIVATE_SCRIPTING
			script = f_scripts [MAX_SCREENS + 2];
			run_script ();
		#endif								

		#ifdef RANDOM_RESPAWN								
			en_an_fanty_activo [enit] = 0;
			_en_life = FANTIES_LIFE_GAUGE;
		#endif

		#ifdef ENABLE_CUSTOM_ENEMS
			extra_enems_killed ();
		#endif
	}
#endif

void mueve_bicharracos (void) {
	// This function moves the active enemies.
	en_tocado = 0;
	player.gotten = 0;
	ptgmx =  ptgmy = 0;
	
	for (enit = 0; enit < MAX_ENEMS; enit ++) {
		enoffsmasi = enoffs + enit;

		// Copy array values to temporary variables as fast as possible
		
		#asm
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

			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
				inc hl 

				ld  a, (hl)
				ld  (__en_life), a
			#endif
		#endasm

		#if (defined ENABLE_SWORD && defined SWORD_PARALYZES) || defined (ENEMIES_MAY_BE_PARALIZED)
			if (en_an_state [enit] == ENEM_PARALYZED) {
				en_an_count [enit] --;
				if (en_an_count [enit] == 0)
					en_an_state [enit] = 0;
			}
		#endif

		#if defined ENEMIES_MAY_DIE
			if ((_en_t & 16)
				#ifdef RANDOM_RESPAWN
					&& (en_an_fanty_activo [enit] == 0)
				#endif
			) goto enems_loop_continue;
		#endif

		if (_en_t != 0
			#if defined USE_TYPE_6 && defined MAKE_TYPE_6
				|| scenery_info.make_type_6
			#endif
		) {
			en_cx = _en_x;
			en_cy = _en_y;
		
			#if (defined ENABLE_SWORD && defined SWORD_PARALYZES) || defined (ENEMIES_MAY_BE_PARALIZED)
				if (en_an_state [enit] != ENEM_PARALYZED)
			#endif
			{

				if (
					_en_t <= 4
					#ifdef RANDOM_RESPAWN
						|| 0 == en_an_fanty_activo [enit]
					#endif
					#ifdef ENABLE_MARRULLERS
						|| (_en_t >= 11 && _en_t <= 14)
					#endif
				) {
					/*
					_en_x += _en_mx;
					_en_y += _en_my;

					if (_en_x <= _en_x1) _en_mx = ABS (_en_mx);
					if (_en_x >= _en_x2) _en_mx = -ABS (_en_mx);

					if (_en_y <= _en_y1) _en_my = ABS (_en_my);
					if (_en_y >= _en_y2) _en_my = -ABS (_en_my);
					*/
					#asm
						
						// _en_x += _en_mx;
							ld  a, (__en_mx)
							ld  c, a
							ld  a, (__en_x)
							add c 
							ld  (__en_x), a

						// _en_y += _en_my;
							ld  a, (__en_my)
							ld  c, a
							ld  a, (__en_y)
							add c 
							ld  (__en_y), a

						#ifdef ENABLE_MARRULLERS
							ld  a, (__en_t)
							cp  11
							jr  nc, vert_limit_skip_2
						#endif
						
						.en_linear_horz_bounds
							// _en_x <= _en_x1 -> _en_x1 >= _en_x
							ld  a, (__en_x)
							ld  c, a
							ld  a, (__en_x1)
							cp  c
							jr  c, horz_limit_skip_1

							ld  a, (__en_mx)
							call _abs_a
							ld  (__en_mx), a

							#ifdef ENEMIES_COLLIDE	
								ld  a, (__en_x1)
								ld  (__en_x), a
							#endif

						.horz_limit_skip_1

							// _en_x >= _en_x2
							ld  a, (__en_x2)
							ld  c, a
							ld  a, (__en_x)
							cp  c
							jr  c, horz_limit_skip_2

							ld  a, (__en_mx)
							call _abs_a
							neg
							ld  (__en_mx), a

							#ifdef ENEMIES_COLLIDE	
								ld  a, (__en_x2)
								ld  (__en_x), a
							#endif

						.horz_limit_skip_2

						.en_linear_vert_bounds
							// _en_y <= _en_y1 -> _en_y1 >= _en_y
							ld  a, (__en_y)
							ld  c, a
							ld  a, (__en_y1)
							cp  c
							jr  c, vert_limit_skip_1

							ld  a, (__en_my)
							call _abs_a
							ld  (__en_my), a

							#ifdef ENEMIES_COLLIDE	
								ld  a, (__en_y1)
								ld  (__en_y), a
							#endif

						.vert_limit_skip_1

							// _en_y >= _en_y2
							ld  a, (__en_y2)
							ld  c, a
							ld  a, (__en_y)
							cp  c
							jr  c, vert_limit_skip_2

							ld  a, (__en_my)
							call _abs_a
							neg
							ld  (__en_my), a

							#ifdef ENEMIES_COLLIDE	
								ld  a, (__en_y2)
								ld  (__en_y), a
							#endif

						.vert_limit_skip_2

					#endasm
				}

				#ifdef ENABLE_CUADRATORS
					if (_en_t >= 7 && _en_t <= 10) {

						#asm
						// Flipflop tells which axis to update
							ld  bc, (_enit)
							ld  b, 0
							ld  hl, _en_an_ff
							add hl, bc
							ld  a, (hl)
							or  a
							jr  z, _cuadrators_update_y							

						._cuadrators_update_x
						// _en_x += _en_mx;
							ld  a, (__en_mx)
							ld  c, a
							ld  a, (__en_x)
							add c 
							ld  (__en_x), a

						.cuadrators_horz_bounds
							// _en_x <= _en_x1 -> _en_x1 >= _en_x
							ld  a, (__en_x)
							ld  c, a
							ld  a, (__en_x1)
							cp  c
							jr  c, cuadrators_limit_skip_1

							ld  a, (__en_mx)
							call _abs_a
							ld  (__en_mx), a
							jr  _cuadrators_flipflop

						.cuadrators_limit_skip_1

							// _en_x >= _en_x2
							ld  a, (__en_x2)
							ld  c, a
							ld  a, (__en_x)
							cp  c
							jr  c, _cuadrators_update_done

							ld  a, (__en_mx)
							call _abs_a
							neg
							ld  (__en_mx), a
							jr  _cuadrators_flipflop

						._cuadrators_update_y
						// _en_y += _en_my;
							ld  a, (__en_my)
							ld  c, a
							ld  a, (__en_y)
							add c 
							ld  (__en_y), a     

						.cuadrators_vert_bounds
							// _en_y <= _en_y1 -> _en_y1 >= _en_y
							ld  a, (__en_y)
							ld  c, a
							ld  a, (__en_y1)
							cp  c
							jr  c, cuadrators_limit_skip_2

							ld  a, (__en_my)
							call _abs_a
							ld  (__en_my), a
							jr  _cuadrators_flipflop

						.cuadrators_limit_skip_2

							// _en_y >= _en_y2
							ld  a, (__en_y2)
							ld  c, a
							ld  a, (__en_y)
							cp  c
							jr  c, _cuadrators_update_done

							ld  a, (__en_my)
							call _abs_a
							neg
							ld  (__en_my), a      

						._cuadrators_flipflop
							ld  bc, (_enit)
							ld  b, 0
							ld  hl, _en_an_ff
							add hl, bc 
							ld  a, (hl)
							xor 1 
							ld  (hl), a

						._cuadrators_update_done

						#ifdef ENEMIES_COLLIDE
								// Cuadrators don't like collisions with BG!
								jp _en_bg_collision_end
						#endif
					#endasm						
					}
				#endif

				#ifdef RANDOM_RESPAWN
					if (en_an_fanty_activo [enit]) { 
						#ifdef PLAYER_CAN_HIDE
							rds = player_hidden () ? (-(FANTY_A>>1)) : FANTY_A;
						#else
							rds = FANTY_A;
						#endif

						if (player.x > en_an_x [enit]) en_an_vx [enit] += rds;
						else en_an_vx [enit] -= rds;

						if (player.y > en_an_y [enit]) en_an_vy [enit] += rds;
						else en_an_vy [enit] -= rds;

						if (en_an_vx [enit] < -FANTY_MAX_V) en_an_vx [enit] = -FANTY_MAX_V;
						if (en_an_vy [enit] < -FANTY_MAX_V) en_an_vy [enit] = -FANTY_MAX_V;
						if (en_an_vx [enit] > FANTY_MAX_V) en_an_vx [enit] = FANTY_MAX_V;
						if (en_an_vy [enit] > FANTY_MAX_V) en_an_vy [enit] = FANTY_MAX_V;
									
						en_an_x [enit] += en_an_vx [enit];
						en_an_y [enit] += en_an_vy [enit];
						
						if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
						if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
						
						#if VIEWPORT_Y <= 2
							if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
						#else
							if (en_an_y [enit] > (10240-(VIEWPORT_Y-2)*8*64)) en_an_y [enit] = 10240;
						#endif
						#if VIEWPORT_Y >= 2
							if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;
						#else
							if (en_an_y [enit] < -(VIEWPORT_Y*8*64)) en_an_y [enit] = -1024;
						#endif

						/*
						if (en_an_x [enit] > (224*64)) en_an_x [enit] = (224*64);
						if (en_an_x [enit] < 0) en_an_x [enit] = 0;
						if (en_an_y [enit] > (144*64)) en_an_y [enit] = (144*64);
						if (en_an_y [enit] < 0) en_an_y [enit] = 0;
						*/
					} 
				#endif

				#ifdef USE_TYPE_6
					if (_en_t == 6 || _en_t == 0) {
						#if defined (USE_SIGHT_DISTANCE) || defined (PLAYER_CAN_HIDE)
							// Idle, retreat or pursue depending on player status (distance or hidden)

							switch (en_an_state [enit]) {
								case TYPE_6_IDLE:
									#ifdef PLAYER_CAN_HIDE
										if (distance (en_ccx, en_ccy, gpx, gpy) <= SIGHT_DISTANCE && 0 == player_hidden ()) 
									#else
										if (distance (en_ccx, en_ccy, gpx, gpy) <= SIGHT_DISTANCE) 
									#endif
										en_an_state [enit] = TYPE_6_PURSUING;
									break;
								case TYPE_6_PURSUING:
									if ((rand () & 7) > 1) {
										if (player.x > en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
											en_an_vx [enit] += FANTY_A;
										else if (player.x < en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
											en_an_vx [enit] -= FANTY_A;
										if (player.y > en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
											en_an_vy [enit] += FANTY_A;
										else if (player.y < en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
											en_an_vy [enit] -= FANTY_A;
									}
									
									#ifdef PLAYER_CAN_HIDE
										if (distance (en_ccx, en_ccy, gpx, gpy) >= SIGHT_DISTANCE || player_hidden ()) 
									#else
										if (distance (en_ccx, en_ccy, gpx, gpy) >= SIGHT_DISTANCE)
									#endif
										en_an_state [enit] = TYPE_6_RETREATING;
									break;
								case TYPE_6_RETREATING:
									if ((_en_x << 6) > en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
										en_an_vx [enit] += FANTY_A;
									else if ((_en_x << 6) < en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
										en_an_vx [enit] -= FANTY_A;
									if ((_en_y << 6) > en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
										en_an_vy [enit] += FANTY_A;
									else if ((_en_y << 6) < en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
										en_an_vy [enit] -= FANTY_A;
									
									#ifdef PLAYER_CAN_HIDE
										if (distance (en_ccx, en_ccy, gpx, gpy) <= SIGHT_DISTANCE && 0 == player_hidden ()) 
									#else
										if (distance (en_ccx, en_ccy, gpx, gpy) <= SIGHT_DISTANCE) 
									#endif
										en_an_state [enit] = TYPE_6_PURSUING;
									break;	
							}
						#else
							#ifdef FANTIES_EXIT_STATE_V
								if (en_an_state [enit] != 1) 
							#endif
							{
								// Always pursue
	
								if ((rand () & 7) > 1) {
									if (player.x > en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
										en_an_vx [enit] += FANTY_A;
									else if (player.x < en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
										en_an_vx [enit] -= FANTY_A;
									if (player.y > en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
										en_an_vy [enit] += FANTY_A;
									else if (player.y < en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
										en_an_vy [enit] -= FANTY_A;
								}
							}
						#endif

						if (scenery_info.allow_type_6) {
							en_an_x [enit] += en_an_vx [enit];
							en_an_y [enit] += en_an_vy [enit];
						}

						if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
						if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
						
						#if VIEWPORT_Y <= 2
							if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
						#else
							if (en_an_y [enit] > (10240-(VIEWPORT_Y-2)*8*64)) en_an_y [enit] = 10240;
						#endif
						#if VIEWPORT_Y >= 2
							if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;
						#else
							if (en_an_y [enit] < -(VIEWPORT_Y*8*64)) en_an_y [enit] = -1024;
						#endif
					} 
				#endif

				#ifdef ENEMIES_COLLIDE			
					// Check for collisions.
					/*
					en_xx = _en_x >> 4;
					en_yy = _en_y >> 4;
					
					if (_en_mx) {
						rdi = ctileoff (_en_mx);
						ptx1 = ptx2 = en_xx + rdi;
						pty1 = en_yy; 
						pty2 = (_en_y + 15) >> 4;
						if ((attr (ptx1, pty1) & 8) || (attr (ptx2, pty2) & 8)) {
							_en_mx = -_en_mx;
							_en_x = (en_xx + (rdi ^ 1)) << 4;
						}
					}
					if (_en_my) {
						rdi = ctileoff (_en_my);
						ptx1 = en_xx; 
						ptx2 = (_en_x + 15) >> 4;
						pty1 = pty2 = en_yy + rdi;
						if ((attr (ptx1, pty1) & 8) || (attr (ptx2, pty2) & 8)) {
							_en_my = -_en_my;
							_en_y = (en_yy + (rdi ^ 1)) << 4;
						}
					}
					*/
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

							#ifdef ENABLE_MARRULLERS
								ld  a, (__en_t)
								cp  11
								jr  c, _en_bg_col_marrh_done
								cp  15
								jr  nc, _en_bg_col_marrh_done

								call _marrullers_select_direction
								jp  _en_bg_collision_end

							._en_bg_col_marrh_done
							#endif

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

							#ifdef ENABLE_MARRULLERS
								ld  a, (__en_t)
								cp  11
								jr  c, _en_bg_col_marrv_done
								cp  15
								jr  nc, _en_bg_col_marrv_done

								call _marrullers_select_direction
								jr  _en_bg_collision_end

							._en_bg_col_marrv_done
							#endif

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

				// Animate
				/*
				en_an_count [enit] ++; 
				if (en_an_count [enit] >= 4) {
					en_an_count [enit] = 0;
					en_an_frame [enit] = !en_an_frame [enit];					
				}
				*/
				#asm
						ld  bc, (_enit)
						ld  b, 0

						ld  hl, _en_an_count
						add hl, bc
						ld  a, (hl)
						inc a
						cp  4
						jr  c, _enemy_animate_update_count

						push hl

						ld  hl, _en_an_frame
						add hl, bc
						ld  a, (hl)
						xor 1
						ld  (hl), a

						pop hl
						xor a
					._enemy_animate_update_count
						ld  (hl), a
				#endasm
				
				enems_calc_frame ();				

				#ifdef ENABLE_CUSTOM_ENEMS
					extra_enems_move ();
				#endif
			}

			// Select coordinates for collision

			#if defined RANDOM_RESPAWN || defined USE_TYPE_6				
				if (
					#ifdef RANDOM_RESPAWN
						en_an_fanty_activo [enit]
					#else
						_en_t == 6 
						#ifdef MAKE_TYPE_6
						|| _en_t == 0
						#endif
					#endif
				) {
					/*
					en_ccx = en_an_x [enit] >> 6;
					en_ccy = en_an_y [enit] >> 6;
					*/
					#asm
							ld  a, (_enit)
							sla a
							ld  c, a
							ld  b, 0

							ld  hl, _en_an_x
							add hl, bc
							ld  a, (hl)
							inc hl
							ld  h, (hl)
							ld  l, a 

							call HLshr6_A
							ld  (_en_ccx), a

							ld  hl, _en_an_y
							add hl, bc
							ld  a, (hl)
							inc hl
							ld  h, (hl)
							ld  l, a 

							call HLshr6_A
							ld  (_en_ccy), a
					#endasm
				} else 
			#endif
			{
				en_ccx = _en_x;
				en_ccy = _en_y;
			}
	
			// Moving platforms engine:

			#ifndef PLAYER_MOGGY_STYLE	
				if ( (_en_t == 4 
					#ifdef ENABLE_CUADRATORS
						|| _en_t == 10
					#endif
					) && gpx >= en_ccx - 15 && gpx <= en_ccx + 15
				) {
					/*
					if (player.saltando == 0 || player.cont_salto > 4) {
						// Vertical
						if (_en_my) {
							if (_en_my < 0) {
								// Go up.
								if (gpy + 17 >= en_ccy && gpy + 11 <= en_ccy) {
									platform_get_player ();
								}
							} else {
								// Go down.
								if (gpy + 20 >= en_ccy && gpy + 13 <= en_ccy) {
									platform_get_player ();
								}
							}
						}

						// Horizontal
						if (_en_mx != 0 && gpy >= en_ccy - 16 && gpy <= en_ccy - 11 && player.vy >= 0) {
							platform_get_player ();
							#if (defined ENABLE_SWORD && defined SWORD_PARALYZES) || defined (ENEMIES_MAY_BE_PARALIZED)
								if (en_an_state [enit] != ENEM_PARALYZED)
							#endif
							//ptgmx = (_en_mx << 6);
							#asm
									ld  a, (__en_mx)
									call Ashl16_HL
									call withSign
									ld  (_ptgmx), hl
							#endasm
						}
					}
					*/
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
							// if (gpy + 17 >= en_ccy && gpy + 11 <= en_ccy)

							// gpy + 17 >= en_ccy
							ld  a, (_en_ccy)
							ld  c, a
							ld  a, (_gpy)
							add 17
							cp  c
							jr  c, moving_platforms_vert_done

							// gpy + 11 <= en_ccy -> en_ccy >= gpy + 11
							ld  a, (_gpy)
							add 11
							ld  c, a
							ld  a, (_en_ccy)
							cp  c
							jr  c, moving_platforms_vert_done

							call _platform_get_player

							jr  moving_platforms_vert_done

						.moving_platforms_vert_down
							// if (gpy + 20 >= en_ccy && gpy + 13 <= en_ccy)

							// gpy + 20 >= en_ccy
							ld  a, (_en_ccy)
							ld  c, a
							ld  a, (_gpy)
							add 20
							cp  c
							jr  c, moving_platforms_vert_done

							// gpy + 13 <= en_ccy -> en_ccy >= gpy + 13
							ld  a, (_gpy)
							add 13
							ld  c, a
							ld  a, (_en_ccy)
							cp  c
							jr  c, moving_platforms_vert_done

							call _platform_get_player

						.moving_platforms_vert_done

						.moving_platforms_horz
							// if (_en_mx != 0 && gpy >= en_ccy - 16 && gpy <= en_ccy - 11 && player.vy >= 0)
							ld  a, (__en_mx)
							or  a
							jr  z, moving_platforms_done

							// gpy >= en_ccy - 16 -> gpy + 16 >= en_ccy
							ld  a, (_en_ccy)
							ld  c, a
							ld  a, (_gpy)
							add 16
							cp  c
							jr  c, moving_platforms_done

							// gpy <= en_ccy - 11 -> gpy + 11 <= en_ccy -> en_ccy >= gpy + 11
							ld  a, (_gpy)
							add 11
							ld  c, a
							ld  a, (_en_ccy)
							cp  c
							jr  c, moving_platforms_done

							// player.vy >= 0
							ld  a, (_player+9)		// .vy MSB
							bit 7, a
							jr  nz, moving_platforms_done

							call _platform_get_player

						#if (defined ENABLE_SWORD && defined SWORD_PARALYZES) || defined (ENEMIES_MAY_BE_PARALIZED)
								// if (en_an_state [enit] != ENEM_PARALYZED)
								ld  bc, (_enit)
								ld  b, 0
								ld  hl, _en_an_state
								add hl, bc
								ld  a, (hl)
								cp  ENEM_PARALYZED
								jr  z, moving_platforms_done
						#endif		

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

				// Swording

				#ifdef ENABLE_SWORD
					if (s_on && 
						s_frame >= MIN_SWORD_HIT_FRAME && s_frame < MAX_SWORD_HIT_FRAME
					) {
						//if (s_hit_x >= _en_x - 15 && s_hit_x <= _en_x + 15 && s_hit_y >= _en_y - 15 && s_hit_y <= _en_y + 15) 
						#asm
								// s_hit_x >= en_ccx
								ld  a, (_en_ccx)
								ld  c, a
								ld  a, (_s_hit_x) 
								cp  c
								jp  c, _enems_hit_sword_done

								// s_hit_x <= en_ccx + 15 -> en_ccx + 15 >= s_hit_x
								ld  a, (_s_hit_x)
								ld  c, a
								ld  a, (_en_ccx)
								add 15
								cp  c
								jp  c, _enems_hit_sword_done

								// s_hit_y >= en_ccy 
								ld  a, (_en_ccy)
								ld  c, a
								ld  a, (_s_hit_y)
								cp  c 
								jp  c, _enems_hit_sword_done

								// s_hit_y <= en_ccy + 15 -> en_ccy + 15 >= s_hit_y
								ld  a, (_s_hit_y)
								ld  c, a
								ld  a, (_en_ccy)
								add 15
								cp  c
								jp  c, _enems_hit_sword_done
						#endasm
						{	
							if (1
							#ifdef PLAYER_MIN_KILLABLE
								&& _en_t >= PLAYER_MIN_KILLABLE
							#endif
							#ifdef PLAYER_MAX_KILLABLE
								&& _en_t <= PLAYER_MAX_KILLABLE
							#endif
							#ifndef PLAYER_MOGGY_STYLE
								&& _en_t != 4
							#endif
							) {
								// Hit!
								#ifdef SWORD_CUSTOM_HIT
									#include "sword_custom_hit.h"
								#endif

								#ifndef SWORD_DISABLE_HIT
									play_sfx (2);
									s_on = 0;

									#ifdef SWORD_PARALYZES
										en_an_state [enit] = ENEM_PARALYZED;
										en_an_count [enit] = SWORD_PARALYZES;
									#endif

									// Kill?
									#if SWORD_LINEAL_DAMAGE > 0
										if (_en_t != 6) if (_en_life >= SWORD_LINEAL_DAMAGE) _en_life -= SWORD_LINEAL_DAMAGE; else _en_life = 0;
									#endif

									#if SWORD_FLYING_DAMAGE > 0
										if (_en_t == 6) if (_en_life >= SWORD_FLYING_DAMAGE) _en_life -= SWORD_FLYING_DAMAGE; else _en_life = 0;
									#endif

									#if SWORD_LINEAL_DAMAGE > 0 || SWORD_FLYING_DAMAGE > 0
										if (_en_life == 0) {
											en_an_next_frame [enit] = sprite_17_a;
											enems_kill ();
										}
									#endif
								#endif

								goto enems_loop_continue;
							}
						}
						#asm
							._enems_hit_sword_done
						#endasm
					}
				#endif
				

				// Collision with enemy

				if (
					0 == en_tocado && collide_enem () && 
					(_en_t < 16 
						#ifdef RANDOM_RESPAWN
							|| en_an_fanty_activo [enit] == 1
						#endif
					) 
				) {
					#ifdef PLAYER_KILLS_ENEMIES
						if (
							#ifdef SHORT_PLAYER
								gpy < en_ccy
							#else
								gpy <= en_ccy - 8 
							#endif
							&& player.vy >= 0 
							#ifdef PLAYER_MIN_KILLABLE
								&& _en_t >= PLAYER_MIN_KILLABLE
							#endif
							#ifdef PLAYER_MAX_KILLABLE
								&& _en_t <= PLAYER_MAX_KILLABLE
							#endif
						) {
							// Step on enemy and kill it.
							en_an_next_frame [enit] = sprite_17_a;
							player.vy = -PLAYER_MAX_VY_SALTANDO;
							enems_kill ();
						} else	
					#endif
					if (
						player.estado == EST_NORMAL
						#ifdef PARALYZED_DONT_KILL
							&& en_an_state [enit] != ENEM_PARALYZED
						#endif
						#ifdef PARALYZED_DONT_KILL_ON_VAR
							&& (en_an_state [enit] != ENEM_PARALYZED || paralyzed_dont_kill == 0)
						#endif
					) {
						#ifdef ENEMS_CUSTOM_COLLISION
							if (enems_custom_collision () == 0)
						#endif
						{
							en_tocado = 1; player.is_dead = 1; play_sfx (2);
							#ifdef ENABLE_CODE_HOOKS
								enemy_killer = enit;
							#endif
							
							// We decide which kind of life drain we do:
							#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
								if (_en_t > 4) {
									player.life -= FLYING_ENEMY_HIT;
								} else
							#endif
							{
								player.life -= LINEAR_ENEMY_HIT;
							}
							player_just_died = PLAYER_KILLED_BY_ENEM;
							
							#ifdef PLAYER_BOUNCES
								#ifndef PLAYER_MOGGY_STYLE	
									#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
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
										if (gpx < en_ccx) player.vx = - (abs (_en_mx << 1) << 7);
										else player.vx = abs (_en_mx + _en_mx) << 7;
									}
									
									// y
									if (_en_my) {
										if (gpy < en_ccy) player.vy = - (abs (_en_my << 1) << 7);
										else player.vy = abs (_en_my + _en_my) << 7;
									}
								#endif
							#endif

							#ifdef ENABLE_FRIGOABABOL
								player.estado = EST_FRIGOABABOL;
								player.ct_estado = FRIGO_MAX_FRAMES;
							#elif defined PLAYER_FLICKERS
								// Flickers. People seem to like this more than the bouncing behaviour.
								player_flicker ();
							#endif				
						}
					}
				}
				
				// Enemy update
					
				#ifdef PLAYER_CAN_FIRE
					// Collision with bullets
					#ifdef RANDOM_RESPAWN
						if (_en_t < 16 || en_an_fanty_activo [enit] == 1)
					#else
						if (_en_t < 16)
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
								// if (bullets_y [en_j] >= en_ccy - 4 

									ld  a, (_en_ccy)
									sub 4
									ld  d, a
									ld  hl, _bullets_y
									add hl, bc
									ld  a, (hl)
									cp  d 
									jp  c, enems_coll_bullets_continue

								// && bullets_y [en_j] <= en_ccy + 12 -> en_ccy + 12 >= bullets_y [en_j]
									ld  d, a
									ld  a, (_en_ccy)
									add 12
									cp  d
									jp  c, enems_coll_bullets_continue

								// && bullets_x [en_j] >= en_ccx - 4 
									ld  a, (_en_ccx)
									sub 4
									ld  d, a 
									ld  hl, _bullets_x
									add hl, bc 
									ld  a, (hl) 
									cp  d 
									jp  c, enems_coll_bullets_continue

								// && bullets_x [en_j] <= en_ccx + 12) { -> en_ccx + 12 >= bullets_x [en_j]
									ld  d, a
									ld  a, (_en_ccx)
									add 12
									cp  d
									jp  c, enems_coll_bullets_continue
							#endasm

							#if defined (RANDOM_RESPAWN) || defined (USE_TYPE_6)	
								#ifdef RANDOM_RESPAWN	
									if (en_an_fanty_activo [enit]) 
								#else
									if (_en_t == 6)
								#endif
								en_an_vx [enit] += (bullets_mx [en_j] > 0 ? 128 : -128);
							#endif
							en_an_next_frame [enit] = sprite_17_a;
							en_an_morido [enit] = 1;
							bullets_estado [en_j] = 0;
							_en_life --;
							if (_en_life == 0) enems_kill ();
							
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

			if ((_en_t & 16) && en_an_fanty_activo [enit] == 0 && (rand () & 31) == 1) {
					en_an_fanty_activo [enit] = 1;
					if (player.y > 5120)
						en_an_y [enit] = -1024;
					else
						en_an_y [enit] = 10240;
					en_an_x [enit] = (rand () % 240 - 8) << 6;
					en_an_vx [enit] = en_an_vy [enit] = 0;
				enems_en_an_calc (2);
				}
			#endif

		#asm		
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

			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
				ld  a, (__en_life)
				ld  (hl), a
			#endif
		#endasm	
	}
}
