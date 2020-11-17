// MTE MK1 v4.7 // Copyleft 2010, 2011 by The Mojon Twins

// engine.h
// Cointains engine functions (movement, colliding, rendering... )

unsigned char line_of_text_clear [] = "                                ";

unsigned char *player_cells [] = {
	sprite_1_a, sprite_2_a, sprite_3_a, sprite_4_a,
	sprite_5_a, sprite_6_a, sprite_7_a, sprite_8_a,
	#ifdef ENABLE_FRIGOABABOL
		sprite_frigo
	#endif
};

unsigned char *enem_cells [] = {
	sprite_9_a, sprite_10_a, sprite_11_a, sprite_12_a,
	sprite_13_a, sprite_14_a, sprite_15_a, sprite_16_a
};

#ifdef ENABLE_SWORD
	extern unsigned char *sword_cells [0];
	#asm 
		._sword_cells
			defw _sprite_sword, _sprite_sword + 64, _sprite_sword + 128
	#endasm
#endif

void saca_a_todo_el_mundo_de_aqui (void) {
	// ¡Saca a todo el mundo de aquí!
	#asm
			ld  ix, (_sp_player)
			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0
			call SPMoveSprAbs
	
			xor a
		.hide_sprites_enems_loop
			ld  (_gpit), a

			sla a
			ld  c, a
			ld  b, 0
			ld  hl, _sp_moviles
			add hl, bc
			ld  e, (hl)
			inc hl
			ld  d, (hl)
			push de
			pop ix

			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0

			call SPMoveSprAbs

			ld  a, (_gpit)
			inc a
			cp  MAX_ENEMS
			jr  nz, hide_sprites_enems_loop

		#ifdef ENABLE_SWORD
			ld  ix, (_sp_sword)
			ld  iy, vpClipStruct
			ld  bc, 0
			ld  hl, 0xfefe	// -2, -2
			ld  de, 0
			call SPMoveSprAbs			
		#endif
	#endasm
}

#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
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

unsigned int abs (int n) {
	if (n < 0)
		return (unsigned int) (-n);
	else 
		return (unsigned int) n;
}
	

void step (void) {
	#asm
			ld a, 16
			out (254), a
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			xor 16
			out (254), a
	#endasm	
}

void cortina (void) {
	#asm
			;; Antes que nada vamos a limpiar el PAPER de toda la pantalla
			;; para que no queden artefactos feos
			
			ld	de, 22528			; Apuntamos con DE a la zona de atributos
			ld	b,	3				; Procesamos 3 tercios
		.clearb1
			push bc
			
			ld	b, 255				; Procesamos los 256 atributos de cada tercio
		.clearb2
		
			ld	a, (de)				; Nos traemos un atributo
			and	199					; Le hacemos la máscara 11000111 y dejamos PAPER a 0
			ld	(de), a				; Y lo volvemos a poner
			
			inc de					; Siguiente atributo
		
			djnz clearb2
			
			pop bc
			djnz clearb1
			
			;; Y ahora el código original que escribí para UWOL:	
		
			ld	a,	8
		
		.repitatodo
			ld	c,	a			; Salvamos el contador de "repitatodo" en 'c'
		
			ld	hl, 16384
			ld	a,	12
		
		.bucle
			ld	b,	a			; Salvamos el contador de "bucle" en 'b'
			ld	a,	255
		
		.bucle1
			sla (hl)
			inc hl
			dec a
			jr	nz, bucle1
				
			ld	a,	255
		.bucle2
			srl (hl)
			inc hl
			dec a
			jr	nz, bucle2
				
			ld	a,	b			; Restituimos el contador de "bucle" a 'a'
			dec a
			jr	nz, bucle
		
			ld	a,	c			; Restituimos el contador de "repitatodo" a 'a'
			dec a
			jr	nz, repitatodo
	#endasm
}

// Game

#ifndef DEACTIVATE_KEYS
	void clear_cerrojo (unsigned char x, unsigned char y) {
		// search & toggle
			
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) 
			if (cerrojos [gpit].x == x && cerrojos [gpit].y == y && cerrojos [gpit].np == n_pant)
				cerrojos [gpit].st = 0;
	}

	void init_cerrojos (void) {
		// Activate all bolts.
		
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++)
			cerrojos [gpit].st = 1;	
	}
#endif

#ifdef PLAYER_CAN_FIRE
	void init_bullets (void) {
		// Initialize bullets
		
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++)	bullets [gpit].estado = 0;
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
		
		for (gpit = 0; gpit < MAP_W * MAP_H * MAX_ENEMS; gpit ++) {
			malotes [gpit].t = malotes [gpit].t & 15;	
			#if defined PLAYER_CAN_FIRE || defined ENABLE_SWORD
				malotes [gpit].life = ENEMIES_LIFE_GAUGE;
				#ifdef RANDOM_RESPAWN
					if (malotes [gpit].t == 5) malotes [gpit].t |= 16;
				#endif
			#endif
		}
	}
#endif

#ifdef PLAYER_CAN_FIRE
	void fire_bullet (void) {
		
		// Search a free bullet slot...
		
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
			if (bullets [gpit].estado == 0) {
				bullets [gpit].estado = 1;
				if (player.facing == 0) {
					bullets [gpit].x = (player.x >> 6) - 4;
					bullets [gpit].mx = -PLAYER_BULLET_SPEED;
				} else {
					bullets [gpit].x = (player.x >> 6) + 12;
					bullets [gpit].mx = PLAYER_BULLET_SPEED;
				}
				bullets [gpit].y = (player.y >> 6) + PLAYER_BULLET_Y_OFFSET;
				play_sfx (9);
				#ifdef FIRING_DRAINS_LIFE
					player.life -= FIRING_DRAIN_AMOUNT;
				#endif				
				break;	
			}	
		}	
	}
#endif

#if defined PLAYER_CAN_HIDE
	unsigned char player_hidden (void) {
		if ( (gpy & 15) == 0 && player.vx == 0 )
			//if (attr (gpxx, gpyy) == 2 || (attr (1 + gpxx, gpyy) == 2 && (gpx & 15) != 0) )	
			if (attr ((gpx + 8) >> 4, gpyy) & 2)
				return 1;
		return 0;
	}
#endif

#ifdef USE_COINS
	void get_coin(unsigned char xx, unsigned char yy) {
		#ifdef ENABLE_PERSISTENCE
			_x = xx; _y = yy;
			persist ();
		#endif

		flags [COIN_FLAG] ++;
		
		set_map_tile (xx, yy, 0, 0);
		play_sfx (5);

		#if defined ACTIVATE_SCRIPTING && defined COINS_SCRIPTING
			// Run f_script #max_screens + 1
			script = f_scripts [max_screens + 1];
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
		sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, VIEWPORT_Y + (gpy >> 3), VIEWPORT_X + (gpx >> 3), gpx & 7, gpy & 7);
		player.current_frame = player.next_frame;
		sp_UpdateNow ();
		play_sfx (10);	
	}
#endif

void adjust_to_tile_x (void) {
	gpx = gpxx << 4; player.x = gpx << 6;
}

void adjust_to_tile_y (void) {
	gpy = gpyy << 4; player.y = gpy << 6;
}

void player_flicker (void) {
	player.estado = EST_PARP;
	player.ct_estado = 50;
}

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
				sp_UpdateNow ();
				play_sfx (9);
				process_breakable = 1;
				break;
			}
		}
	}
#endif

#ifdef ENABLE_SWORD
	void swing_sword (void) {
		if (s_on) {
			if (s_type == SWORD_TYPE_UP) {
				#ifdef SWORD_STAB
					s_x = gpx + SWORD_STAB;
				#else
					s_x = gpx + swoffs_y [s_frame];
				#endif
				s_y = gpy + 8 - swoffs_x [s_frame];
				s_hit_x = s_x + 4;
				s_hit_y = s_y;			
			} else {
				#ifdef SWORD_STAB
					s_y = gpy + SWORD_STAB;
				#else
					s_y = gpy + swoffs_y [s_frame]; 
				#endif
				s_hit_y = (s_y + 4);

				if (s_type == SWORD_TYPE_LEFT) {
					s_x = gpx + 8 - swoffs_x [s_frame];
					s_hit_x = s_x;				
				} else {
					s_x = gpx + swoffs_x [s_frame];
					s_hit_x = s_x + 7;				
				}
			}

			// Detect breakable
			#ifdef ENABLE_BREAKABLE
				if (s_frame > 2 && s_frame < 6) {
					_x = s_hit_x >> 4;
					_y = s_hit_y >> 4;
					if (attr (_x, _y) & 32) add_to_breakables ();
				}
			#endif

			s_frame ++;
			if (s_frame == 9) s_on = 0;
			rdx = s_x;
		} else {
			rdx = 240;
		}

		sp_MoveSprAbs (sp_sword, spritesClip, s_next_frame - s_current_frame, VIEWPORT_Y + (s_y >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, s_y & 7);
		s_current_frame = s_next_frame;
	}
#endif

void move (void) {
	gpcx = player.x;
	gpcy = player.y;

	// Read device (keyboard, joystick ...)
	pad_this_frame = pad1;
	pad1 = pad0 = (joyfunc) (&keys); 
	pad_this_frame = (~pad_this_frame) | pad1;

	// Keys held this frame

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

	#ifdef PLAYER_NO_INERTIA
		if ((pad0 & sp_UP) == 0) player.vy = -PLAYER_CONST_V;
		if ((pad0 & sp_DOWN) == 0) player.vy = PLAYER_CONST_V;
		if ( ! ((pad0 & sp_UP) == 0 || (pad0 & sp_DOWN) == 0)) player.vy = 0;
	#else	
		#ifndef PLAYER_MOGGY_STYLE
			// If side view, get affected by gravity:
			
			#ifdef RAMIRO_HOVER
				if (player.vy > 0 && (pad0 & sp_DOWN) == 0) {
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
				} else
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

			if ((pad0 & sp_UP) == 0)
				if (player.vy > -PLAYER_MAX_VX) {
					player.vy -= player.ax;
				}

			if ((pad0 & sp_DOWN) == 0)
				if (player.vy < PLAYER_MAX_VX) {
					player.vy += player.ax;
				}
		#endif
	#endif	

	#ifdef PLAYER_DIZZY
		if (player.estado & EST_DIZZY) { player.vy >>= 1; player.vy += (rand () & (PLAYER_CONST_V - 1)) - (PLAYER_CONST_V >> 1); }
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

	gpx = player.x >> 6;				// Divide / 64 for pixels, then / 16 for tiles.
	gpy = player.y >> 6;
	gpxx = gpx >> 4;
	gpyy = gpy >> 4;
	
	// Cool

	/*
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
			ld  (_player + 26), a
			ld  (_player + 37), a

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

			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				// if (attr (gpxx, gpyy) & 8 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy) & 8)) {
					ld  hl, (_gpxx)
					ld  h, 0
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr
					pop bc
					pop bc
					ld  a, l
					and 8

					jr  nz, vert_collision_up

					ld  a, (_gpx)
					and 15
					jp  z, vert_collision_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr
					pop bc
					pop bc
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

					ld  hl, (_gpxx)
					ld  h, 0
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr
					pop bc
					pop bc
					ld  a, l
					and 8

					jr  nz, vert_collision_up

				.vert_collision_if2
					// (gpx & 15) > 4 => (gpx & 15) >= 5
					ld  a, (_gpx)
					and 15
					cp  5
					jp  c, vert_collision_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr
					pop bc
					pop bc
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

					ld  a, (_gpy)
					ld  e, a
					ld  d, 0
					ld  l, 6
					call l_asl
					ld  (_player + 2), hl 	// player.y

					ld  a, 1
					ld  (_player + 37), a 	// player.ceiling
					jr  vert_collision_done
			#endif

		.vert_collision_positive
			// rdj > 0
			// else if ((gpy & 15) <= (player.vy >> 6) -> (player.vy >> 6) >= (gpy & 16)
			ld  a, (_gpy)
			and 15
			ld  c, a

			ld  de, (_player + 8) 	// player.vy
			ld  l, 6
			call l_asr
			ld  a, l

			cp  c
			jr  c, vert_collision_done

			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				// if (attr (gpxx, gpyy + 1) & 12 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 12))
					ld  hl, (_gpxx)
					ld  h, 0
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					inc hl
					push hl
					call _attr
					pop bc
					pop bc
					ld  a, l
					and 12

					jr  nz, vert_collision_down

					ld  a, (_gpx)
					and 15
					jr  z, vert_collision_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					inc hl
					push hl
					call _attr
					pop bc
					pop bc
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

					ld  hl, (_gpxx)
					ld  h, 0
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					inc hl
					push hl
					call _attr
					pop bc
					pop bc
					ld  a, l
					and 12

					jr  nz, vert_collision_down

				.vert_collision_if4
					// (gpx & 15) > 4 => (gpx & 15) >= 5
					ld  a, (_gpx)
					and 15
					cp  5
					jr  c, vert_collision_done

					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					inc hl
					push hl
					call _attr
					pop bc
					pop bc
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

	#ifdef SLIPPERY_TILES
		player.ax = PLAYER_AX; player.rx = PLAYER_RX;

		if (player.possee) {
			rdy = (gpy + 16) >> 4;
			if ((attr (gpx >> 4, rdy) & 16) || (attr ((gpx + 15) >> 4, rdy) & 16)) {
				player.ax = PLAYER_AX_SLIPPERY; player.rx = PLAYER_RX_SLIPPERY;
			}
		}
	#endif

	/* Jump: Jumping is as easy as giving vy a negative value. Nevertheless, we want
	   a somewhat more controllable jump, so we use the "mario bros" kind of controls:
	   the longer you press jump, the higher you reach.
	*/

	#ifdef PLAYER_HAS_JUMP
		#ifdef RAMIRO_HOP
			rdi = (attr (gpxx, gpyy + 1) & 12 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) & 12));
		#endif

		if (
			#if defined BOTH_KEYS_JUMP
				(pad0 & sp_UP) == 0 || (pad0 & sp_FIRE) == 0
			#elif defined PLAYER_CAN_FIRE || !defined FIRE_TO_JUMP
				(pad0 & sp_UP) == 0 
			#else
				(pad0 & sp_FIRE) == 0
			#endif	
		) {
			if (player.saltando == 0) {
				if (
				#ifdef RAMIRO_HOP
					rdi
				#else
					player.possee 
				#endif
					|| player.gotten
				) {
					player.saltando = 1;
					player.cont_salto = 0;
					play_sfx (1);
				}
			}

			if (player.saltando) {
				player.vy -= (player.salto + PLAYER_INCR_SALTO - (player.cont_salto>>1));
				if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
				player.cont_salto ++;
				if (player.cont_salto == 8)
					player.saltando = 0;
			} 
		} else {
			player.saltando = 0;
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
				}
			#endif
		} else {
			jetpac_frame_counter = 0;
		}
	#endif

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
			if ((pad0 & sp_FIRE) == 0 && player.possee) {
				rdx = gpxx;	x0 = x1 = gpxx;	y0 = y1 = gpyy;
				if (player.facing == 0) {				// Looking left
					if ((gpx & 15) == 0 && qtile (gpxx - 1, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0) {
							x0 = gpxx - 1; x1 = gpxx - 2;
						} else if ((pad_this_frame & sp_RIGHT) == 0 && attr (gpxx + 1, gpyy) == 0) {
							x0 = gpxx - 1; x1 = gpxx; 
							gpxx ++; gpx += 16; player.x += (16<<6); 
						}
						pad_this_frame = pad0 |= (sp_FIRE|sp_LEFT|sp_RIGHT);
					}
				} else {								// Looking right
					if ((gpx & 15) == 0 && qtile (gpxx + 1, gpyy) == 14) {
						player.grab_block = 1;
						if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) == 0) {
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
		#else
			if ((pad0 & sp_FIRE) == 0 && player.possee) {				
				rdx = gpx;	x0 = 0xff;	y0 = y1 = gpyy;
				if (player.facing == 0) {				// Looking left
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
		#endif
	#endif

	#ifdef PLAYER_NO_INERTIA
		if ((pad0 & sp_LEFT) == 0) player.vx = -PLAYER_CONST_V;
		if ((pad0 & sp_RIGHT) == 0) player.vx = PLAYER_CONST_V;
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

		if ((pad0 & sp_LEFT) == 0)
			if (player.vx > -PLAYER_MAX_VX) {
				player.facing = 0;
				player.vx -= player.ax;
			}

		if ((pad0 & sp_RIGHT) == 0)
			if (player.vx < PLAYER_MAX_VX) {
				player.vx += player.ax;
				player.facing = 1;
			}
	#endif

	#ifdef PLAYER_DIZZY
		if (player.estado & EST_DIZZY) { player.vx >>= 1; player.vx += (rand () & (PLAYER_CONST_V - 1)) - (PLAYER_CONST_V >> 1); }
	#endif

	player.x += player.vx;
	player.x += ptgmx;
	
	// Safe
	
	if (player.x < 0)
		player.x = 0;
		
	if (player.x > 14336)
		player.x = 14336;

	gpx = player.x >> 6;
	gpxx = gpx >> 4;

	/*
	wall = 0;	
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
		
			xor a 
			ld  (_wall), a

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

		#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER

			.horz_collision_negative
				// rdj < 0

				// if (attr (gpxx, gpyy) & 8 || ((gpy & 15) != 0 && attr (gpxx, gpyy + 1) & 8))
				ld  hl, (_gpxx)
				ld  h, 0
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				push hl
				call _attr
				pop bc
				pop bc
				ld  a, l
				and 8

				jr  nz, horz_collision_left

				ld  a, (_gpy)
				and 15
				jr  z, horz_collision_done

				ld  hl, (_gpxx)
				ld  h, 0
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				inc hl
				push hl
				call _attr
				pop bc
				pop bc
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
				ld  hl, (_gpxx)
				ld  h, 0
				inc hl
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				push hl
				call _attr
				pop bc
				pop bc
				ld  a, l
				and 8

				jr  nz, horz_collision_right

				ld  a, (_gpy)
				and 15
				jr  z, horz_collision_done

				ld  hl, (_gpxx)
				ld  h, 0
				inc hl
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				inc hl
				push hl
				call _attr
				pop bc
				pop bc
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

				ld  hl, (_gpxx)
				ld  h, 0
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				push hl
				call _attr
				pop bc
				pop bc
				ld  a, l
				and 8

				jp  nz, horz_collision_left

			.horz_collision_if2
				ld  a, (_gpy)
				and 15
				jp  z, horz_collision_done

				ld  hl, (_gpxx)
				ld  h, 0
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				inc hl
				push hl
				call _attr
				pop bc
				pop bc
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

				ld  a, (_gpx)
				ld  e, a
				ld  d, 0
				ld  l, 6
				call l_asl
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

				ld  hl, (_gpxx)
				ld  h, 0
				inc hl
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				push hl
				call _attr
				pop bc
				pop bc
				ld  a, l
				and 8

				jp  nz, horz_collision_right				

			.horz_collision_if4
				ld  a, (_gpy)
				and 15
				jp  z, horz_collision_done

				ld  hl, (_gpxx)
				ld  h, 0
				inc hl
				push hl
				ld  hl, (_gpyy)
				ld  h, 0
				inc hl
				push hl
				call _attr
				pop bc
				pop bc
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

				ld  a, (_gpx)
				ld  e, a
				ld  d, 0
				ld  l, 6
				call l_asl
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
			#ifdef SWORD_UP
				if ((pad0 & sp_UP) == 0) {
					s_type = SWORD_TYPE_UP;
				} else 
			#endif
			s_type = player.facing;

			s_on = 1;
			s_frame = 0;
			s_next_frame = sword_cells [s_type];
		}
	#endif
	
	// Keys / bolts engine:

	#ifndef DEACTIVATE_KEYS
		if (
			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				(gpx & 15) == 0 
			#else
				wall
			#endif
			&& (gpy & 15) == 0
		) {
			if (qtile (gpxx + 1, gpyy) == 15 && player.keys > 0) {
				set_map_tile (gpxx + 1, gpyy, 0, 0);
				clear_cerrojo (gpxx + 1, gpyy);
				player.keys --;
				play_sfx (8);
			} else 
			#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
				if (qtile (gpxx - 1, gpyy) == 15 && player.keys > 0) {
					set_map_tile (gpxx - 1, gpyy, 0, 0);
					clear_cerrojo (gpxx - 1, gpyy);
					player.keys --;
					play_sfx (8);
				}
			#else
				if (qtile (gpxx, gpyy) == 15 && player.keys > 0) {
					set_map_tile (gpxx, gpyy, 0, 0);
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
					// Vertically, only when player.y is tile-aligned.
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
				#endif

				#if defined PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER
					// Horizontally, only when player.x is tile-aligned.
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
				#else
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

		#ifdef EVIL_TILE_SIMPLE
			if (attr ((gpx + 8) >> 4, (gpy + 14) >> 4) == 1)
		#else
		if (attr (gpxx, gpyy) == 1 || 
			((gpx & 15) != 0 && attr (gpxx + 1, gpyy) == 1) ||
			((gpy & 15) != 0 && attr (gpxx, gpyy + 1) == 1) ||
			((gpx & 15) != 0 && (gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) == 1)) 
		#endif
		{		
			play_sfx (2);
			player.life -= LINEAR_ENEMY_HIT;	
			player.x = gpcx;
			player.y = gpcy;
			#ifdef PLAYER_MOGGY_STYLE
				if (abs (player.vx) > abs (player.vy)) player.vx = -player.vx;
				else player.vy = -player.vy;
			#else
			player.vy = -player.vy;
			#endif
			#ifdef PLAYER_FLICKERS
				// Flickers. People seem to like this more than the bouncing behaviour.
				player_flicker ();
			#endif			
		}
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
					if (0 == player.killingzone_framecount) play_sfx (3);
					player.life --;	
				}
			} else {
				if (player.killingzone_framecount > EVIL_ZONE_FRAME_COUNT) {
					player.killingzone_framecount = 0;
					player.killingzone_beepcount ++;
					sp_Border (2);
					play_sfx (4);
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
		
		#ifdef COIN_BEH
			if (attr (gpxx, gpyy) & COIN_BEH)
				get_coin (gpxx, gpyy);
			if ((gpx & 15) != 0 && attr (gpxx + 1, gpyy) & COIN_BEH)
				get_coin (gpxx + 1, gpyy);
			if ((gpy & 15) != 0 && attr (gpxx, gpyy + 1) & COIN_BEH) 
				get_coin (gpxx, gpyy + 1);
			if ((gpx & 15) != 0 && (gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) & COIN_BEH)
				get_coin (gpxx + 1, gpyy + 1);
		#else
		if (qtile (gpxx, gpyy) == COIN_TILE)
			get_coin (gpxx, gpyy);
		if ((gpx & 15) != 0 && qtile (gpxx + 1, gpyy) == COIN_TILE)
			get_coin (gpxx + 1, gpyy);
		if ((gpy & 15) != 0 && qtile (gpxx, gpyy + 1) == COIN_TILE) 
			get_coin (gpxx, gpyy + 1);
		if ((gpx & 15) != 0 && (gpy & 15) != 0 && qtile (gpxx + 1, gpyy + 1) == COIN_TILE)
			get_coin (gpxx + 1, gpyy + 1);			
	#endif
	#endif

	// Select next frame to paint...

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
				dec a
				jr  z, _player_cell_sel_set_rdi		// if A = 1, DEC A = 0, so set 0
				ld  a, 4							// if A = 0, DEC A = FF, so set 4
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
				) {
					rdd = 1;
				} else {
					rdd = ((gpx + 4) >> 3) & 3;
					if (rdd == 3) rdd = 1;
				}
			}
		}

		player.next_frame = player_cells [rdi + rdd];
	#else
		// In this case, the spriteset is
		// 1  2  3  4  5  6  7  8
		// R1 R2 L1 L2 U1 U2 D1 D2
		
		#ifdef LOOK_AT_THE_CAMERA
		if (player.vx != 0 || player.vy != 0) {
			player.subframe ++;
			if (player.subframe == 4) {
				player.subframe = 0;
				player.frame = !player.frame;
				step (); 
			}
		}
		
		rdd = player.frame;
		if (player.vx == 0) {		
			if (player.vy < 0) rdd += 4;
			else rdd += 6; 
		} else if (player.vx < 0) rdd += 2;

		player.next_frame = player_cells [rdd];
		#else
			if (player.vx != 0 || player.vy != 0) {
				player.subframe ++;
				if (player.subframe == 4) {
					player.subframe = 0;
					player.frame = !player.frame;
					step (); 
				}

				rdd = player.frame;
			
				if (player.vx == 0) {		
					if (player.vy < 0) rdd += 4;
					else rdd += 6; 
				} else if (player.vx < 0) rdd += 2;

				player.next_frame = player_cells [rdd];
			}
		#endif

	#endif
}

void init_player_values (void) {
	player.x = 			PLAYER_INI_X << 10;
	player.y = 			PLAYER_INI_Y << 10;
	player.vy = 		0;
	player.g = 			PLAYER_G; 
	player.vx = 		0;
	#ifndef SLIPPERY_TILES
		player.ax = 		PLAYER_AX;
		player.rx = 		PLAYER_RX;
	#endif
	player.salto = 		PLAYER_VY_INICIAL_SALTO;
	player.cont_salto = 1;
	player.saltando = 	0;
	player.frame = 		0;
	player.subframe = 	0;
	player.facing = 	1;
	player.estado = 	EST_NORMAL;
	player.ct_estado = 	0;
	player.disparando = 0;
	player.killingzone_beepcount = 0;
	player.killingzone_framecount = 0;	
	player.is_dead =    0;

	#if defined PLAYER_MOGGY_STYLE && !defined LOOK_AT_THE_CAMERA
		player.next_frame = player_cells [7];
	#endif
}

void init_player (void) {
	// Initialize player with initial values.
	// (hence the initialize thing)
	init_player_values ();
	
	player.life = 		PLAYER_LIFE;
	player.objs =		0;
	player.keys = 		0;
	player.killed = 	0;
	#ifndef WIN_ON_SCRIPTING
		#ifdef SCR_FIN
			pant_final = SCR_FIN;
		#endif
	#endif
}

#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
#else
	void init_hotspots (void) {
		for (gpit = 0; gpit < MAP_W * MAP_H; gpit ++)
			hotspots [gpit].act = 1;
	}
#endif

#if !defined TWO_SETS && !defined UNPACKED_MAP
	void draw_and_advance (void) {
		map_attr [rdi] = comportamiento_tiles [_n];
		map_buff [rdi] = _n;
		draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, _n);
		rdx += 2;
		if (rdx == 30) {
			rdx = 0;
			rdy += 2;
		}
		rdi ++;
	}
#endif

void draw_scr_background (void) {
	rdx = 0; rdy = 0;
	
	#ifdef UNPACKED_MAP
		gp_gen = mapa + (n_pant * 150);		
	#else
		gp_gen = mapa + (n_pant * 75);
	#endif
	
	rdi = 0;
	
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
			map_attr [rdi] = comportamiento_tiles [tileoffset + rdt1];
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, tileoffset + rdt1);
			map_buff [rdi] = rdt1;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
			rdi ++;
			map_attr [rdi] = comportamiento_tiles [tileoffset + rdt2];
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, tileoffset + rdt2);
			map_buff [rdi] = rdt2;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
			rdi ++;
		}
	#elif defined TWO_SETS_REAL
		// TWO_SETS_PACKED map, every byte contains two tiles,
		// plus uses several tilesets
		// But *REAL* tile values are written to the buffers
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
	#else	
		// PACKED map, every byte contains two tiles, plus admits
		// some special effects (autoshadows, see below).
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
			#ifndef NO_ALT_BG
				if ((rand () & 15) < 2 && rdt1 == 0 /*&& map_buff [rdi - 16] == 0*/)
					rdt1 = 19;
				if ((rand () & 15) < 2 && rdt2 == 0 /*&& map_buff [rdi - 16] == 0*/)
					rdt2 = 19;
			#endif
			_n = rdt1; draw_and_advance ();
			_n = rdt2; draw_and_advance ();
		}
	#endif	

	#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
	#else
		// Is there an object in this screen?
		
		hotspot_y = 240;
		if (hotspots [n_pant].act) {
			#if defined(ACTIVATE_SCRIPTING) && defined(OBJECTS_ON_VAR)
				if (flags [OBJECTS_ON_VAR])
			#endif
			{
				if (hotspots [n_pant].tipo) {
					// Calculate tile coordinates
					rdx = (hotspots [n_pant].xy >> 4);
					rdy = (hotspots [n_pant].xy & 15);
					// Convert to pixels and store
					hotspot_x = rdx << 4;
					hotspot_y = rdy << 4;
					// Remember which tile was there
					orig_tile = map_buff [15 * rdy + rdx];
					// Draw the object.
					draw_coloured_tile (VIEWPORT_X + (rdx << 1), VIEWPORT_Y + (rdy << 1), 16 + hotspots [n_pant].tipo);
				}

			}

		}
		#ifndef DEACTIVATE_REFILLS
			else if (hotspots [n_pant].act) {
				// Randomly, if there's no active object, we draw a recharge.
				if (rand () % 3 == 2) {
					rdx = (hotspots [n_pant].xy >> 4);
					rdy = (hotspots [n_pant].xy & 15);
					hotspot_x = rdx << 4;
					hotspot_y = rdy << 4;
					orig_tile = map_buff [15 * rdy + rdx];
					draw_coloured_tile (VIEWPORT_X + (rdx << 1), VIEWPORT_Y + (rdy << 1), 16);	
				}
			}
		#endif
	#endif
	
	#ifndef DEACTIVATE_KEYS
		// Is there a bolt which has been already opened in this screen?
		// If so, delete it:
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) {
			if (cerrojos [gpit].np == n_pant && 0 == cerrojos [gpit].st) {
				draw_coloured_tile (VIEWPORT_X + (cerrojos [gpit].x << 1), VIEWPORT_Y + (cerrojos [gpit].y << 1), 0);
				rdi = 15 * cerrojos [gpit].y + cerrojos [gpit].x;
				map_attr [rdi] = 0;
				map_buff [rdi] = 0;
			}
		}
	#endif	
}

void draw_scr (void) {
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
		sp_UpdateNow ();
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
			
	f_zone_ac = 0;

	// Set up enemies.
	
	enoffs = n_pant * MAX_ENEMS;

	#ifdef COUNT_KILLABLE_ON
		flags [COUNT_KILLABLE_ON] = 0;
	#endif

	for (gpit = 0; gpit < MAX_ENEMS; gpit ++) {
		en_an_frame [gpit] = 0;
		
		#ifdef RANDOM_RESPAWN
			en_an_fanty_activo [gpit] = 0;
		#endif

		switch (malotes [enoffs + gpit].t) {
			#ifdef NO_MAX_ENEMS
				case 0:
					#if defined USE_TYPE_6 && defined MAKE_TYPE_6
						if (scenery_info.make_type_6) {
							en_an_next_frame [gpit] = sprite_13_a;
							en_an_x [gpit] = (rand () % 224) << 6;
							en_an_y [gpit] = (rand () % 144) << 6;
							en_an_vx [gpit] = en_an_vy [gpit] = 0;
							en_an_state [gpit] = TYPE_6_IDLE;
						} else {
							en_an_next_frame [gpit] = sprite_18_a;
						}
					#else
						en_an_next_frame [gpit] = sprite_18_a;
					#endif
					break;
			#endif

			case 1:
			case 2:
			case 3:
			case 4:
				en_an_next_frame [gpit] = sprite_9_a + 288 * (malotes [enoffs + gpit].t - 1);
				break;
			#ifdef USE_TYPE_6
				case 6:
					en_an_next_frame [gpit] = sprite_13_a;
					en_an_x [gpit] = malotes [enoffs + gpit].x << 6;
					en_an_y [gpit] = malotes [enoffs + gpit].y << 6;
					en_an_vx [gpit] = en_an_vy [gpit] = 0;
					en_an_state [gpit] = TYPE_6_IDLE;
					break;
			#endif
			#if defined (ENEMIES_MAY_DIE)
				default:
					en_an_next_frame [gpit] = sprite_18_a;
			#endif
		}
		
		#ifdef ENABLE_CUSTOM_ENEMS
			extra_enems_init ();
		#endif

		#ifdef COUNT_KILLABLE_ON			
			#if defined (ENEMIES_MAY_DIE)
				#ifdef BOXES_ONLY_KILL_TYPE
					if (malotes [enoffs + gpit].t == BOXES_ONLY_KILL_TYPE) {
						flags [COUNT_KILLABLE_ON] ++;
						continue;
					}
				#endif
				#ifdef PLAYER_MIN_KILLABLE
					if (malotes [enoffs + gpit].t >= PLAYER_MIN_KILLABLE) {
						flags [COUNT_KILLABLE_ON] ++;
					}
				#endif
				#if !defined(BOXES_ONLY_KILL_TYPE) && !defined (PLAYER_MIN_KILLABLE)
					flags [COUNT_KILLABLE_ON] ++;
				#endif
			#endif
		#endif
	}
		
	#ifdef ACTIVATE_SCRIPTING
		// Delete line of text
		#asm
				xor a
				ld  (_line_of_text_clear+32-LINE_OF_TEXT_SUBSTR), a			
		#endasm
		draw_text (LINE_OF_TEXT_X, LINE_OF_TEXT, LINE_OF_TEXT_ATTR, line_of_text_clear);

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
				bullets [gpit].x += bullets [gpit].mx;
				_x = bullets [gpit].x >> 4;
				_y = bullets [gpit].y >> 4; 
				rdi = attr (_x, _y);
				if ((rdi & 8) || bullets [gpit].x > 240) {
					bullets [gpit].estado = 0;
				}
				if (rdi & 32) add_to_breakables ();
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
	player.gotten = 1;
	gpy = en_ccy - 16; 
	player.y = gpy << 6;
	player.vy = 0;						
	gpyy = gpy >> 4;
	ptgmy = (_en_my << 6);
}

#if defined PLAYER_CAN_FIRE || defined PLAYER_KILLS_ENEMIES || defined ENABLE_SWORD
	void enems_kill (void) {
		#ifdef ENABLE_CODE_HOOKS
			enemy_died = _en_t;
		#endif

		// Kill enemy
		sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an_next_frame [enit] - en_an_current_frame [enit], VIEWPORT_Y + (en_ccy >> 3), VIEWPORT_X + (en_ccx >> 3), en_ccx & 7, en_ccy & 7);
		en_an_current_frame [enit] = en_an_next_frame [enit];
		sp_UpdateNow ();
		play_sfx (10);
		en_an_next_frame [enit] = sprite_18_a;

		_en_t |= 16;			// dead

		// Count
		player.killed ++;

		#ifdef ACTIVATE_SCRIPTING
			script = f_scripts [max_screens + 2];
			run_script ();
		#endif								

		#ifdef RANDOM_RESPAWN								
			en_an_fanty_activo [enit] = 0;
			_en_life = FANTIES_LIFE_GAUGE;
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
				ld  h, 0

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

				ld  de, _malotes
				add hl, de

				ld  (__baddies_pointer), hl 		// Save address for later

				ld  a, (hl)
				ld  (__en_x), a
				inc hl 

				ld  a, (hl)
				ld  (__en_y), a
				inc hl 

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
			if (_en_t & 16) goto enems_loop_continue;
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
				) {
					_en_x += _en_mx;
					_en_y += _en_my;

					if (_en_x == _en_x1 || _en_x == _en_x2)
						_en_mx = -_en_mx;
					if (_en_y == _en_y1 || _en_y == _en_y2)
						_en_my = -_en_my;

					#ifdef PLAYER_PUSH_BOXES			
						// Check for collisions.
						en_xx = _en_x >> 4;
						en_yy = _en_y >> 4;

						if (_en_mx != 0) {
							if (attr (en_xx + ctileoff (_en_mx), en_yy) & 8 || 
							((_en_y & 15) != 0 && attr (en_xx + ctileoff (_en_mx), en_yy + 1) & 8)) {
								_en_mx = -_en_mx;
								_en_x = en_cx;
							}
						}
						if (_en_my != 0) {
							if (attr (en_xx, en_yy + ctileoff (_en_my)) & 8 || 
							((_en_x & 15) != 0 && attr (en_xx + 1, en_yy + ctileoff (_en_mx)) & 8)) {
								_en_my = -_en_my;
								_en_y = en_cy;
							}
						}
					#endif

					rdd = (_en_t - 1) << 1;
				}

				#ifdef RANDOM_RESPAWN
					if (en_an_fanty_activo [enit]) { 
						#ifdef PLAYER_CAN_HIDE			
							if (player_hidden ()) {
								if (player.x < en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
									en_an_vx [enit] += FANTY_A >> 1;
								else if (player.x > en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
									en_an_vx [enit] -= FANTY_A >> 1;
								if (player.y < en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
									en_an_vy [enit] += FANTY_A >> 1;
								else if (player.y > en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
									en_an_vy [enit] -= FANTY_A >> 1;
							} else
						#endif 
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
										
						en_an_x [enit] += en_an_vx [enit];
						en_an_y [enit] += en_an_vy [enit];
						if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
						if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
						if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
						if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;

						rdd = 4;
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
						#endif

						if (scenery_info.allow_type_6) {
							en_an_x [enit] += en_an_vx [enit];
							en_an_y [enit] += en_an_vy [enit];
						}
						if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
						if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
						if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
						if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;

						rdd = 4;
					} 
				#endif

				en_an_count [enit] ++; 
				if (en_an_count [enit] >= 4) {
					en_an_count [enit] = 0;
					en_an_frame [enit] = !en_an_frame [enit];					
				}
				
				en_an_next_frame [enit] = enem_cells [rdd + en_an_frame [enit]];

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
					en_ccx = en_an_x [enit] >> 6;
					en_ccy = en_an_y [enit] >> 6;
				} else 
			#endif
			{
				en_ccx = _en_x;
				en_ccy = _en_y;
			}
				
			// Moving platforms engine:

			#ifndef PLAYER_MOGGY_STYLE	
				if (_en_t == 4 && gpx >= en_ccx - 15 && gpx <= en_ccx + 15) {
					// Vertical
					if (_en_my < 0) {
						// Go up.
						if (gpy >= en_ccy - 16 && gpy <= en_ccy - 11 && player.vy >= -(PLAYER_INCR_SALTO)) {
							platform_get_player ();
						}
					} else if (_en_my > 0) {
						// Go down.
						if (gpy >= en_ccy - 20 && gpy <= en_ccy - 14 && player.vy >= 0) {
							platform_get_player ();
								}
						}

					// Horizontal
					if (_en_mx != 0 && gpy >= en_ccy - 16 && gpy <= en_ccy - 11 && player.vy >= 0) {
						platform_get_player ();
						ptgmx = (_en_mx << 6);
					}
					
				
				} else
			#endif			
			
			// Collision with enemy

			if (
				0 == en_tocado && collide_enem () && 
				(_en_t < 16 
					#ifdef RANDOM_RESPAWN
						|| en_an_fanty_activo [enit] == 1
					#endif
				) && player.estado == EST_NORMAL
			) {
				#ifdef PLAYER_KILLS_ENEMIES
					if (gpy <= en_ccy - 8 && player.vy >= 0 
						#ifdef PLAYER_MIN_KILLABLE
							&& _en_t >= PLAYER_MIN_KILLABLE
						#endif
					) {
						// Step on enemy and kill it.
						en_an_next_frame [enit] = sprite_17_a;
						enems_kill ();
					} else	
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
								if (gpx < en_ccx) player.vx = - (abs (_en_mx + _en_mx) << 7);
								else player.vx = abs (_en_mx + _en_mx) << 7;
							}
							
							// y
							if (_en_my) {
								if (gpy < en_ccy) player.vy = - (abs (_en_my + _en_my) << 7);
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
						if (bullets [en_j].estado == 1) {
							if (bullets [en_j].y >= en_ccy - 4 && bullets [en_j].y <= en_ccy + 12 && bullets [en_j].x >= en_ccx - 4 && bullets [en_j].x <= en_ccx + 12) {
								#if defined (RANDOM_RESPAWN) || defined (USE_TYPE_6)	
									#ifdef RANDOM_RESPAWN	
										if (en_an_fanty_activo [enit]) 
									#else
										if (_en_t == 6)
									#endif
									en_an_vx [enit] += (bullets [enit].mx > 0 ? 128 : -128);
								#endif
								en_an_next_frame [enit] = sprite_17_a;
								en_an_morido [enit] = 1;
								bullets [en_j].estado = 0;
								if (_en_t != 4)
									_en_life --;
								if (_en_life == 0) {
									enems_kill ();
								}
							}
						}
					}
				}
			#endif

			#ifdef ENABLE_SWORD
				if (s_on && s_frame > 2 && s_frame < 6) {
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
						#ifdef PLAYER_MIN_KILLABLE
							if (_en_t >= PLAYER_MIN_KILLABLE)
						#endif
						{
							// Hit!
							play_sfx (2);
							s_on = 0;

							#ifdef SWORD_PARALYZES
								en_an_state [enit] = ENEM_PARALYZED;
								en_an_count [enit] = SWORD_PARALYZES;
							#endif

							// Kill?
							#if SWORD_LINEAL_DAMAGE > 0
								if (_en_t < 6) if (_en_life >= SWORD_LINEAL_DAMAGE) _en_life -= SWORD_LINEAL_DAMAGE; else _en_life = 0;
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
						}
					}
					#asm
						._enems_hit_sword_done
					#endasm
				}
			#endif

			#ifdef RANDOM_RESPAWN
				// Activate fanty

				if (_en_t > 15 && en_an_fanty_activo [enit] == 0 && (rand () & 31) == 1) {
					en_an_fanty_activo [enit] = 1;
					if (player.y > 5120)
						en_an_y [enit] = -1024;
					else
						en_an_y [enit] = 10240;
					en_an_x [enit] = (rand () % 240 - 8) << 6;
					en_an_vx [enit] = en_an_vy [enit] = 0;
				}
			#endif

			#ifdef ENABLE_CUSTOM_ENEMS
				extra_enems_checks ();
			#endif
		}

		enems_loop_continue:
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
