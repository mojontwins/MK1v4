// MTE MK1 v4.7
// Copyleft 2010, 2011 by The Mojon Twins

// engine.h
// Cointains engine functions (movement, colliding, rendering... )

void saca_a_todo_el_mundo_de_aqui (void) {
	// ¡Saca a todo el mundo de aquí!
	sp_MoveSprAbs (sp_player, spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);				
	for (gpit = 0; gpit < 3; gpit ++) {
		if (malotes [enoffs + gpit].t != 0)
			sp_MoveSprAbs (sp_moviles [gpit], spritesClip, 0, VIEWPORT_Y + 30, VIEWPORT_X + 20, 0, 0);
	}
}

unsigned char collide (unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2) {
	// 13x13 box collision
	return  (x1 + 13 >= x2 && x1 <= x2 + 13 && y1 + 13 >= y2 && y1 <= y2 + 13);
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

#if defined(PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE) || defined(BOXES_KILL_ENEMIES)
	void init_malotes (void) {
		
		for (gpit = 0; gpit < MAP_W * MAP_H * 3; gpit ++) {
			malotes [gpit].t = malotes [gpit].t & 15;	
			#ifdef PLAYER_CAN_FIRE
				malotes [gpit].life = ENEMIES_LIFE_GAUGE;
				#ifdef RANDOM_RESPAWN
				if (malotes [gpit].t == 5)
					malotes [gpit].t |= 16;
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
				peta_el_beeper (9);
				#ifdef FIRING_DRAINS_LIFE
					player.life -= FIRING_DRAIN_AMOUNT;
				#endif				
				break;	
			}	
		}	
	}
#endif

#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
	#if defined PLAYER_CAN_HIDE
	char player_hidden (void) {
		if ( (gpy & 15) == 0 && player.vx == 0 )
			if (attr (gpxx, gpyy) == 2 || (attr (1 + gpxx, gpyy) == 2 && (gpx & 15) != 0) )	
				return 1;
		return 0;
	}
	#endif
#endif

#ifdef USE_COINS
	void get_coin(unsigned char xx, unsigned char yy) {
		++ flags [COIN_FLAG];
		draw_2_digits (COINS_X, COINS_Y, flags [COIN_FLAG]);
		map_attr [15 * yy + xx] = 0;
		map_buff [15 * yy + xx] = 0;
		draw_coloured_tile (VIEWPORT_X + xx + xx, VIEWPORT_Y + yy + yy, 0);	
		peta_el_beeper (5);
		#ifdef ACTIVATE_SCRIPTING
			// Run f_script #max_screens + 1
			script = f_scripts [max_screens + 1];
			run_script ();
		#endif
	}
#endif

#ifdef PLAYER_PUSH_BOXES
	void move_tile (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1, unsigned char act) {
		// Move the tile
		map_attr [15 * y1 + x1] = 8;
		map_buff [15 * y1 + x1] = 14;
		map_attr [15 * y0 + x0] = 0;
		map_buff [15 * y0 + x0] = 0;
		// Draw
		draw_coloured_tile (VIEWPORT_X + x0 + x0, VIEWPORT_Y + y0 + y0, 0);
		draw_coloured_tile (VIEWPORT_X + x1 + x1, VIEWPORT_Y + y1 + y1, 14);
		// Sound
		if (act) {
			peta_el_beeper (8);
			#ifdef FALLING_BOXES
				// Añadir al buffer de cajas cayentes.
				fall_box (x1, y1);
			#endif
		}
	}
#endif

#if defined RESPAWN_REENTER || defined BOXES_KILL_PLAYER
	void explode_player (void) {
		player.next_frame = sprite_17_a;
		sp_MoveSprAbs (sp_player, spritesClip, player.next_frame - player.current_frame, VIEWPORT_Y + (gpy >> 3), VIEWPORT_X + (gpx >> 3), gpx & 7, gpy & 7);
		player.current_frame = player.next_frame;
		sp_UpdateNow ();
		peta_el_beeper (10);	
	}
#endif

unsigned char move (void) {
	gpcx = player.x;
	gpcy = player.y;

	// Read device (keyboard, joystick ...)
	pad0 = (joyfunc) (&keys); 

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
			
			if (player.vy < PLAYER_MAX_VY_CAYENDO)
				player.vy += player.g;
			else
				player.vy = PLAYER_MAX_VY_CAYENDO;

			if (player.gotten) player.vy = 0;		
		#else
			// If top-down view, vertical movement = horizontal movement.
			
			if ( ! ((pad0 & sp_UP) == 0 || (pad0 & sp_DOWN) == 0))
				if (player.vy > 0) {
					player.vy -= player.rx;
					if (player.vy < 0)
						player.vy = 0;
				} else if (player.vy < 0) {
					player.vy += player.rx;
					if (player.vy > 0)
						player.vy = 0;
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
		
	if (player.y < 0)
		player.y = 0;
		
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

	if (player.vy < 0) { 			// Going up
		//if (player.y >= 1024)
			if (attr (gpxx, gpyy) > 7 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy) > 7)) {
				// Stop and adjust.
				player.vy = 0;
				/*
				player.y = (gpyy + 1) << 10;
				gpy = player.y >> 6;
				gpyy = gpy >> 4;
				*/
				++ gpyy; gpy = gpyy << 4; player.y = gpy << 6;
			}
	} else if (player.vy > 0 && (gpy & 15) < 8) { 	// Going down
		if (player.y < 9216)
			if (attr (gpxx, gpyy + 1) > 3 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) > 3))
			{
				// Stop and adjust.
				player.vy = 0;
				/*
				player.y = gpyy << 10;
				gpy = player.gpy >> 6;
				gpyy = gpy >> 4;
				*/
				gpy = gpyy << 4; player.y = gpy << 6;
			}
	}

	/* Jump: Jumping is as easy as giving vy a negative value. Nevertheless, we want
	   a somewhat more controllable jump, so we use the "mario bros" kind of controls:
	   the longer you press jump, the higher you reach.
	*/

	#ifdef PLAYER_HAS_JUMP
		#ifdef PLAYER_CAN_FIRE
			if (((pad0 & sp_UP) == 0) && ((player.vy == 0 && player.saltando == 0 && (attr (gpxx, gpyy + 1) > 3 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) > 3))) || player.gotten)) {
				player.saltando = 1;
				player.cont_salto = 0;
				peta_el_beeper (1);
			}

			if ( ((pad0 & sp_UP) == 0) && player.saltando ) {
				player.vy -= (player.salto + PLAYER_INCR_SALTO - (player.cont_salto>>1));
				if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
				player.cont_salto ++;
				if (player.cont_salto == 8)
					player.saltando = 0;
			}
			
			if ((pad0 & sp_UP) != 0)
				player.saltando = 0;
		#else
			if (((pad0 & sp_FIRE) == 0 || (pad0 & sp_UP) == 0) && ((player.vy == 0 && player.saltando == 0 && (attr (gpxx, gpyy + 1) > 3 || ((gpx & 15) != 0 && attr (gpxx + 1, gpyy + 1) > 3))) || player.gotten)) {
				player.saltando = 1;
				player.cont_salto = 0;
				peta_el_beeper (1);
			}

			if ( ((pad0 & sp_FIRE) == 0 || (pad0 & sp_UP) == 0) && player.saltando ) {
				player.vy -= (player.salto + PLAYER_INCR_SALTO - (player.cont_salto>>1));
				if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
				player.cont_salto ++;
				if (player.cont_salto == 8)
					player.saltando = 0;
			}
			
			if ((pad0 & sp_FIRE) != 0 && (pad0 & sp_UP) != 0)
				player.saltando = 0;
		#endif
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
	#ifdef PLAYER_NO_INERTIA
		if ((pad0 & sp_LEFT) == 0) player.vx = -PLAYER_CONST_V;
		if ((pad0 & sp_RIGHT) == 0) player.vx = PLAYER_CONST_V;
		if ( ! ((pad0 & sp_LEFT) == 0 || (pad0 & sp_RIGHT) == 0)) player.vx = 0;
	#else
		if ( ! ((pad0 & sp_LEFT) == 0 || (pad0 & sp_RIGHT) == 0))
			if (player.vx > 0) {
				player.vx -= player.rx;
				if (player.vx < 0)
					player.vx = 0;
			} else if (player.vx < 0) {
				player.vx += player.rx;
				if (player.vx > 0)
					player.vx = 0;
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
	
	// Safe
	
	if (player.x < 0)
		player.x = 0;
		
	if (player.x > 14336)
		player.x = 14336;

	gpx = player.x >> 6;
	gpxx = gpx >> 4;
	
	if (player.vx < 0) {
		if (attr (gpxx, gpyy) > 7 || ((gpy & 15) != 0 && attr (gpxx, gpyy + 1) > 7)) {
			// Stop and adjust
			player.vx = 0;
			/*
			player.x = (gpxx + 1) << 10;
			gpx = player.x >> 6;
			gpxx = gpx >> 4;
			*/
			++ gpxx; gpx = gpxx << 4; player.x = gpx << 6;
		}
	} else {
		if (attr (gpxx + 1, gpyy) > 7 || ((gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) > 7)) {
			// Stop and adjust
			player.vx = 0;
			/*
			player.x = gpxx << 10;
			gpx = player.x >> 6;
			gpxx = gpx >> 4;
			*/
			gpx = gpxx << 4; player.x = gpx << 6;
		}
	}
	
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
	
	// Keys / bolts engine:

	#ifndef DEACTIVATE_KEYS
		if ((gpx & 15) == 0 && (gpy & 15) == 0) {
			if (qtile (gpxx + 1, gpyy) == 15 && player.keys > 0) {
				map_attr [15 * gpyy + gpxx + 1] = 0;
				map_buff [15 * gpyy + gpxx + 1] = 0;
				clear_cerrojo (gpxx + 1, gpyy);
				draw_coloured_tile (VIEWPORT_X + gpxx + gpxx + 2, VIEWPORT_Y + gpyy + gpyy, 0);
				player.keys --;
				peta_el_beeper (8);
			} else if (qtile (gpxx - 1, gpyy) == 15 && player.keys > 0) {
				map_attr [15 * gpyy + gpxx - 1] = 0;
				map_buff [15 * gpyy + gpxx - 1] = 0;
				clear_cerrojo (gpxx - 1, gpyy);
				draw_coloured_tile (VIEWPORT_X + gpxx + gpxx - 2, VIEWPORT_Y + gpyy + gpyy, 0);
				player.keys --;
				peta_el_beeper (8);
			}
		}
	#endif
	
	// Pushing boxes (tile #14) engine

	#ifdef PLAYER_PUSH_BOXES
		#ifdef PLAYER_MOGGY_STYLE
			if ((pad0 & sp_FIRE) == 0)
		#endif
		{
			#ifdef PLAYER_AUTO_CHANGE_SCREEN
				// In this case, there's nothing in the screen boundaries which will stop
				// the boxes from getting out of the screen, so we have to explicitly 
				// make sure that this won't happen.
				
				// In side-view mode, you can't push boxes vertically.
				#ifdef PLAYER_MOGGY_STYLE
					// Vertically, only when player.y is tile-aligned.
					if ((gpy & 15) == 0) {
						if ((pad0 & sp_UP) == 0 && gpyy > 1) {
							if (can_move_box (gpxx, gpyy - 1, gpxx, gpyy - 2))
								move_tile (gpxx, gpyy - 1, gpxx, gpyy - 2, 1);
							}
							if ((gpx & 15) != 0) {
								if (can_move_box (gpxx + 1, gpyy - 1, gpxx + 1, gpyy - 2)) {		
									move_tile (gpxx + 1, gpyy - 1, gpxx + 1, gpyy - 2, 1);
								}
							}
						} else if ((pad0 & sp_DOWN) == 0 && gpyy < 8) {
							if (can_move_box (gpxx + 1, gpyy + 1, gpxx, gpyy + 2)) {
								move_tile (gpxx, gpyy + 1, gpxx, gpyy + 2, 1);
							}
							if ((gpx & 15) != 0) {
								if (can_move_box (gpxx + 1, gpyy + 1, gpxx + 1, gpyy + 2)) {
									move_tile (gpxx + 1, gpyy + 1, gpxx + 1, gpyy + 2, 1);
								}	
							}
						}
					}
				#endif

				// Horizontally, only when player.x is tile-aligned.
				if ((gpx & 15) == 0) {
					if ((pad0 & sp_RIGHT) == 0 && gpxx < 14) {
						if (can_move_box (gpxx + 1, gpyy, gpxx + 2, gpyy)) {
							move_tile (gpxx + 1, gpyy, gpxx + 2, gpyy, 1);
						}
						if ((gpy & 15) != 0) {
							if (can_move_box (gpxx + 1, gpyy + 1, gpxx + 2, gpyy + 1)) {
								move_tile (gpxx + 1, gpyy + 1, gpxx + 2, gpyy + 1, 1);
							}
						}
					} else if ((pad0 & sp_LEFT) == 0 && gpxx > 1) {
						if (can_move_box (gpxx - 1, gpyy, gpxx - 2, gpyy)) {
							move_tile (gpxx - 1, gpyy, gpxx - 2, gpyy, 1);
						}
						if ((gpy & 15) != 0) {
							if (can_move_box (gpxx - 1, gpyy + 1, gpxx - 2, gpyy + 1)) {
								move_tile (gpxx - 1, gpyy + 1, gpxx - 2, gpyy + 1, 1);
							}
						}
					}	
				}			
			#else

				// In side-view mode, you can't push boxes vertically.
				#ifdef PLAYER_MOGGY_STYLE
					// Vertically, only when player.y is tile-aligned.
					if ((gpy & 15) == 0) {
						if ((pad0 & sp_UP) == 0) {
							if (can_move_box (gpxx, gpyy - 1, gpxx, gpyy - 2)) {
								move_tile (gpxx, gpyy - 1, gpxx, gpyy - 2, 1);
							}
							if ((gpx & 15) != 0) {
								if (can_move_box (gpxx + 1, gpyy - 1, gpxx + 1, gpyy - 2)) {
									move_tile (gpxx + 1, gpyy - 1, gpxx + 1, gpyy - 2, 1);
								}
							}
						} else if ((pad0 & sp_DOWN) == 0) {
							if (can_move_box (gpxx, gpyy + 1, gpxx, gpyy + 2)) {
								move_tile (gpxx, gpyy + 1, gpxx, gpyy + 2, 1);
							}
							if ((gpx & 15) != 0) {
								if (can_move_box (gpxx + 1, gpyy + 1, gpxx + 1, gpyy + 2)) {
									move_tile (gpxx + 1, gpyy + 1, gpxx + 1, gpyy + 2, 1);
								}	
							}
						}
					}
				#endif

				// Horizontally, only when player.x is tile-aligned.
				if ((gpx & 15) == 0) {
					if ((pad0 & sp_RIGHT) == 0) {
						if (can_move_box (gpxx + 1, gpyy, gpxx + 2, gpyy)) {
							move_tile (gpxx + 1, gpyy, gpxx + 2, gpyy, 1);
						}
						if ((gpy & 15) != 0) {
							if (can_move_box (gpxx + 1, gpyy + 1, gpxx + 2, gpyy + 1)) {
								move_tile (gpxx + 1, gpyy + 1, gpxx + 2, gpyy + 1, 1);
							}
						}
					} else if ((pad0 & sp_LEFT) == 0) {
						if (can_move_box (gpxx - 1, gpyy, gpxx - 2, gpyy)) {
							move_tile (gpxx - 1, gpyy, gpxx - 2, gpyy, 1);
						}
						if ((gpy & 15) != 0) {
							if (can_move_box (gpxx - 1, gpyy + 1, gpxx - 2, gpyy + 1)) {
								move_tile (gpxx - 1, gpyy + 1, gpxx - 2, gpyy + 1, 1);
							}
						}
					}	
				}	
			#endif
		}
	#endif

	#ifndef DEACTIVATE_EVIL_TILE	
		// Evil tile engine

		if (attr (gpxx, gpyy) == 1 || 
			((gpx & 15) != 0 && attr (gpxx + 1, gpyy) == 1) ||
			((gpy & 15) != 0 && attr (gpxx, gpyy + 1) == 1) ||
			((gpx & 15) != 0 && (gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) == 1)) {		
			peta_el_beeper (2);
			player.life -= LINEAR_ENEMY_HIT;	
			player.x = gpcx;
			player.y = gpcy;
			player.vy = -player.vy;
			//player.vx = -player.vx;
			#ifdef PLAYER_FLICKERS
				// Flickers. People seem to like this more than the bouncing behaviour.
				player.estado = EST_PARP;
				player.ct_estado = 50;
			#endif			
		}
	#endif

	#ifndef DEACTIVATE_EVIL_ZONE
		// Evil zone engine

		/* 
		//NO NEED FOR THIS TO BE THIS COMPLEX!! 
		if (attr (gpxx, gpyy) == 3 || 
			((gpx & 15) != 0 && attr (gpxx + 1, gpyy) == 3) ||
			((gpy & 15) != 0 && attr (gpxx, gpyy + 1) == 3) ||
			((gpx & 15) != 0 && (gpy & 15) != 0 && attr (gpxx + 1, gpyy + 1) == 3)) {
		*/
		if (attr ((gpx+4) >> 4, (gpy+4) >> 4) == 3
			#ifdef EVIL_ZONE_CONDITIONAL
				&& scenery_info.evil_zone_active
			#endif
		) {
			if (player.killingzone_beepcount >= EVIL_ZONE_BEEPS_COUNT || !scenery_info.evil_kills_slowly) {
				if (!(player.estado & EST_PARP)) {
					player.killingzone_framecount = (player.killingzone_framecount + 1) & 3;
					if (!player.killingzone_framecount) peta_el_beeper (3);
					player.life --;	
				}
			} else {
				if (player.killingzone_framecount > EVIL_ZONE_FRAME_COUNT) {
					player.killingzone_framecount = 0;
					player.killingzone_beepcount ++;
					sp_Border (2);
					peta_el_beeper (4);
					sp_Border (0);
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
		
		if (qtile (gpxx, gpyy) == COIN_TILE)
			get_coin (gpxx, gpyy);
		if ((gpx & 15) != 0 && qtile (gpxx + 1, gpyy) == COIN_TILE)
			get_coin (gpxx + 1, gpyy);
		if ((gpy & 15) != 0 && qtile (gpxx, gpyy + 1) == COIN_TILE) 
			get_coin (gpxx, gpyy + 1);
		if ((gpx & 15) != 0 && (gpy & 15) != 0 && qtile (gpxx + 1, gpyy + 1) == COIN_TILE)
			get_coin (gpxx + 1, gpyy + 1);			
	#endif

	// Select next frame to paint...

	#ifndef PLAYER_MOGGY_STYLE
		// In this case, the spriteset is:
		// 1  2  3  4  5  6  7  8
		// R1 R2 R3 RJ L1 L2 L3 LJ

		if (player.vy != 0) {
			if (player.facing == 0)
				player.next_frame = sprite_8_a;
			else
				player.next_frame = sprite_4_a;
		} else {
			if (player.vx == 0) {
				if (player.facing == 0)
					#ifdef PLAYER_ALTERNATE_ANIMATION
						player.next_frame = sprite_5_a;
					#else
						player.next_frame = sprite_6_a;
					#endif
				else
					#ifdef PLAYER_ALTERNATE_ANIMATION
						player.next_frame = sprite_1_a;
					#else
						player.next_frame = sprite_2_a;
					#endif
			} else {
				player.subframe ++;
				if (player.subframe == 4) {
					player.subframe = 0;
					#ifdef PLAYER_ALTERNATE_ANIMATION
						player.frame ++;
						if (player.frame == 3) 
							player.frame = 0;
					#else
						player.frame = (player.frame + 1) & 3;
					#endif
					step ();
				}
				
				#ifdef PLAYER_ALTERNATE_ANIMATION
					if (player.facing == 0) {
						if (player.frame == 0)
							player.next_frame = sprite_5_a;
						else if (player.frame == 1)
							player.next_frame = sprite_6_a;
						else if (player.frame == 2)
							player.next_frame = sprite_7_a;
					} else {
						if (player.frame == 0)
							player.next_frame = sprite_1_a;
						else if (player.frame == 1)
							player.next_frame = sprite_2_a;
						else if (player.frame == 2)
							player.next_frame = sprite_3_a;	
					}
				#else			

					if (player.facing == 0) {
						if (player.frame == 1 || player.frame == 3)
							player.next_frame = sprite_6_a;
						else if (player.frame == 0)
							player.next_frame = sprite_5_a;
						else if (player.frame == 2)
							player.next_frame = sprite_7_a;
					} else {
						if (player.frame == 1 || player.frame == 3)
							player.next_frame = sprite_2_a;
						else if (player.frame == 0)
							player.next_frame = sprite_1_a;
						else if (player.frame == 2)
							player.next_frame = sprite_3_a;
					}
				#endif
			}	
		}
	#else
		// In this case, the spriteset is
		// 1  2  3  4  5  6  7  8
		// R1 R2 L1 L2 U1 U2 D1 D2
		
		if (player.vx != 0 || player.vy != 0) {
			player.subframe ++;
			if (player.subframe == 4) {
				player.subframe = 0;
				player.frame = !player.frame;
				step (); 
			}
		}
		
		if (player.vx > 0) {
			if (player.frame)
				player.next_frame = sprite_1_a;
			else	
				player.next_frame = sprite_2_a;
		} else if (player.vx < 0) {
			if (player.frame)
				player.next_frame = sprite_3_a;
			else
				player.next_frame = sprite_4_a;
		} else {
			if (player.vy < 0) {
				if (player.frame)
					player.next_frame = sprite_5_a;
				else
					player.next_frame = sprite_6_a;
			} else {
				if (player.frame)
					player.next_frame = sprite_7_a;
				else
					player.next_frame = sprite_8_a;
			}
		}
	#endif
}

void init_player_values (void) {
	player.x = 			PLAYER_INI_X << 10;
	player.y = 			PLAYER_INI_Y << 10;
	player.vy = 		0;
	player.g = 			PLAYER_G; 
	player.vx = 		0;
	player.ax = 		PLAYER_AX;
	player.rx = 		PLAYER_RX;
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

#ifdef ACTIVATE_SCRIPTING
	void delete_text (void) {
		for (gpit = 0; gpit < 32 - LINE_OF_TEXT_SUBSTR; gpit ++)
			sp_PrintAtInv (LINE_OF_TEXT, LINE_OF_TEXT_X + gpit, LINE_OF_TEXT_ATTR, 0);
	}
#endif

void draw_scr_background (void) {
	rdx = 0; rdy = 0;
	
	#ifdef UNPACKED_MAP
		idx = n_pant * 150;
	#else
		idx = n_pant * 75;
	#endif
	
	rdi = 0;
	
	#ifdef TWO_SETS
		tileoffset = TWO_SETS_CONDITION;
	#endif

	#ifdef UNPACKED_MAP
		// UNPACKED map, every byte represents one tile.
		for (gpit = 0; gpit < 150; gpit ++) {
			rdd = mapa [idx++];
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdd == COIN_TILE && !scenery_info.show_coins) rdd = COIN_TILE_DEACT_SUBS;
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
		for (gpit = 0; gpit < 75; gpit ++) {
			rdi = 15 * (rdy >> 1) + (rdx >> 1);
			rdd = mapa [idx++];
			rdt1 = rdd >> 4;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt1 == COIN_TILE && !scenery_info.show_coins) rdt1 = COIN_TILE_DEACT_SUBS;
			#endif
			rdt2 = rdd & 15;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt2 == COIN_TILE && !scenery_info.show_coins) rdt2 = COIN_TILE_DEACT_SUBS;
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
		}
		//
	#else	
		// PACKED map, every byte contains two tiles, plus admits
		// some special effects (autoshadows, see below).
		for (gpit = 0; gpit < 75; gpit ++) {
			rdi = 15 * (rdy >> 1) + (rdx >> 1);
			rdd = mapa [idx++];
			rdt1 = rdd >> 4;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt1 == COIN_TILE && !scenery_info.show_coins) rdt1 = COIN_TILE_DEACT_SUBS;
			#endif
			rdt2 = rdd & 15;
			#if defined(USE_COINS) && defined(COINS_DEACTIVABLE)
				if (rdt2 == COIN_TILE && !scenery_info.show_coins) rdt2 = COIN_TILE_DEACT_SUBS;
			#endif
			map_attr [rdi] = comportamiento_tiles [rdt1];
			#ifndef NO_ALT_BG
				if ((rand () & 15) < 2 && rdt1 == 0 && map_buff [rdi - 16] == 0)
					rdt1 = 19;
			#endif
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rdt1);
			map_buff [rdi] = rdt1;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
			rdi ++;
			map_attr [rdi] = comportamiento_tiles [rdt2];
			#ifndef NO_ALT_BG
				if ((rand () & 15) < 2 && rdt2 == 0 && map_buff [rdi - 16] == 0)
					rdt2 = 19;
			#endif
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rdt2);
			map_buff [rdi] = rdt2;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
		}
	#endif	

	#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
	#else
		// Is there an object in this screen?
		
		hotspot_x = hotspot_y = 240;
		if (hotspots [n_pant].act == 1) {
			#if defined(ACTIVATE_SCRIPTING) && defined(OBJECTS_ON_VAR)
				if (flags [OBJECTS_ON_VAR] == 1)
			#endif
			{
				if (hotspots [n_pant].tipo != 0) {
					// Calculate tile coordinates
					rdx = (hotspots [n_pant].xy >> 4);
					rdy = (hotspots [n_pant].xy & 15);
					// Convert to pixels and store
					hotspot_x = rdx << 4;
					hotspot_y = rdy << 4;
					// Remember which tile was there
					orig_tile = map_buff [15 * rdy + rdx];
					// Draw the object.
					draw_coloured_tile (VIEWPORT_X + rdx + rdx, VIEWPORT_Y + rdy + rdy, 16 + hotspots [n_pant].tipo);
				}

			}

		}
		#ifndef DEACTIVATE_REFILLS
			else if (hotspots [n_pant].act == 0) {
				// Randomly, if there's no active object, we draw a recharge.
				if (rand () % 3 == 2) {
					rdx = (hotspots [n_pant].xy >> 4);
					rdy = (hotspots [n_pant].xy & 15);
					hotspot_x = rdx << 4;
					hotspot_y = rdy << 4;
					orig_tile = map_buff [15 * rdy + rdx];
					draw_coloured_tile (VIEWPORT_X + rdx + rdx, VIEWPORT_Y + rdy + rdy, 16);	
				}
			}
		#endif
	#endif
	
	#ifndef DEACTIVATE_KEYS
		// Is there a bolt which has been already opened in this screen?
		// If so, delete it:
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) {
			if (cerrojos [gpit].np == n_pant && !cerrojos [gpit].st) {
				draw_coloured_tile (VIEWPORT_X + cerrojos [gpit].x + cerrojos [gpit].x, VIEWPORT_Y + cerrojos [gpit].y + cerrojos [gpit].y, 0);
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
		peta_el_beeper (6);
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
			
	f_zone_ac = 0;

	// Set up enemies.
	
	enoffs = n_pant * 3;

	#ifdef COUNT_KILLABLE_ON
		flags [COUNT_KILLABLE_ON] = 0;
	#endif

	for (gpit = 0; gpit < 3; gpit ++) {
		en_an [gpit].frame = 0;
		en_an [gpit].count = 0;
		#ifdef RANDOM_RESPAWN
			en_an [gpit].fanty_activo = 0;
		#endif

		switch (malotes [enoffs + gpit].t) {
			#ifdef NO_MAX_ENEMS
				case 0:
					#ifdef USE_TYPE_6
						if (scenery_info.make_type_6) {
							en_an [gpit].next_frame = sprite_13_a;
							en_an [gpit].x = (rand () % 224) << 6;
							en_an [gpit].y = (rand () % 144) << 6;
							en_an [gpit].vx = en_an [gpit].vy = 0;
							en_an [gpit].state = TYPE_6_IDLE;
						} else {
							en_an [gpit].next_frame = sprite_18_a;
						}
					#else
						en_an [gpit].next_frame = sprite_18_a;
					#endif
					break;
			#endif

			case 1:
			case 2:
			case 3:
			case 4:
				en_an [gpit].next_frame = sprite_9_a + 288 * (malotes [enoffs + gpit].t - 1);
				break;
			#ifdef USE_TYPE_6
				case 6:
					en_an [gpit].next_frame = sprite_13_a;
					en_an [gpit].x = malotes [enoffs + gpit].x << 6;
					en_an [gpit].y = malotes [enoffs + gpit].y << 6;
					en_an [gpit].vx = en_an [gpit].vy = 0;
					en_an [gpit].state = TYPE_6_IDLE;
					break;
			#endif
			#if defined (PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)			
				default:
					en_an [gpit].next_frame = sprite_18_a;
			#endif
		}
		
		#ifdef COUNT_KILLABLE_ON			
			#if defined(BOXES_KILL_ENEMIES) || defined(PLAYER_KILLS_ENEMIES)
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
		delete_text ();
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
}

#ifdef PLAYER_CAN_FIRE
	void mueve_bullets (void) {		
		#ifdef PLAYER_MOGGY_STYLE
			// TODO
		#else	
			for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
				bullets [gpit].x += bullets [gpit].mx;
				if (attr (bullets [gpit].x >> 4, bullets [gpit].y >> 4) > 7) {
					bullets [gpit].estado = 0;
				}
				if (bullets [gpit].x < 8 || bullets [gpit].x > 240)
					bullets [gpit].estado = 0;
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


void mueve_bicharracos (void) {
	// This function moves the active enemies.
	
	unsigned char en_j, enoffsmasi, en_x, en_y, en_xx, en_yy;
	unsigned char en_cx, en_cy;
	unsigned char en_ccx, en_ccy;
	// Only one enemy may hurt the player at once, so we need this flag:
	unsigned char en_tocado = 0; 		

	player.gotten = 0;
	
	for (enit = 0; enit < 3; enit ++) {
		enoffsmasi = enoffs + enit;
		if (malotes [enoffsmasi].t != 0
			#ifdef USE_TYPE_6
				|| scenery_info.make_type_6
			#endif
		) {
			en_cx = malotes [enoffsmasi].x;
			en_cy = malotes [enoffsmasi].y;
			#ifdef RANDOM_RESPAWN
				if (!en_an [enit].fanty_activo) {
					malotes [enoffsmasi].x += malotes [enoffsmasi].mx;
					malotes [enoffsmasi].y += malotes [enoffsmasi].my;
				}
			#else
				malotes [enoffsmasi].x += malotes [enoffsmasi].mx;
				malotes [enoffsmasi].y += malotes [enoffsmasi].my;
			#endif

			#ifdef PLAYER_PUSH_BOXES			
				// Check for collisions.
				en_x = malotes [enoffsmasi].x >> 4;
				en_y = malotes [enoffsmasi].y >> 4;

				if (malotes [enoffsmasi].mx != 0) {
					if (attr (en_x + ctileoff (malotes [enoffsmasi].mx), en_y) > 7 || 
					((malotes [enoffsmasi].y & 15) != 0 && attr (en_x + ctileoff (malotes [enoffsmasi].mx), en_y + 1) > 7)) {
						malotes [enoffsmasi].mx = -malotes [enoffsmasi].mx;
						malotes [enoffsmasi].x = en_cx;
					}
				}
				if (malotes [enoffsmasi].my != 0) {
					if (attr (en_x, en_y + ctileoff (malotes [enoffsmasi].my)) > 7 || 
					((malotes [enoffsmasi].x & 15) != 0 && attr (en_x + 1, en_y + ctileoff (malotes [enoffsmasi].mx)) > 7)) {
						malotes [enoffsmasi].my = -malotes [enoffsmasi].my;
						malotes [enoffsmasi].y = en_cy;
					}
				}
			#endif

			en_an [enit].count ++; 
			if (en_an [enit].count == 4) {
				en_an [enit].count = 0;
				en_an [enit].frame = !en_an [enit].frame;

				switch (malotes [enoffsmasi].t) {
					case 1:
						en_an [enit].next_frame = en_an [enit].frame ? sprite_9_a : sprite_10_a;
						break;
					case 2:
						en_an [enit].next_frame = en_an [enit].frame ? sprite_11_a : sprite_12_a;
						break;
					case 3:
					case 6:
					case 0:
						en_an [enit].next_frame = en_an [enit].frame ? sprite_13_a : sprite_14_a;
						break;
					case 4:
						en_an [enit].next_frame = en_an [enit].frame ? sprite_15_a : sprite_16_a;
							break;
					#ifdef RANDOM_RESPAWN
						default:
							if (en_an [enit].fanty_activo)
								en_an [enit].next_frame = en_an [enit].frame ? sprite_13_a : sprite_14_a;
					#endif					
				}	
			}

			en_x = player.x >> 6;
			en_y = player.y >> 6;
			
			#ifdef RANDOM_RESPAWN
				if (en_an [enit].fanty_activo) {
					en_ccx = en_an [enit].x >> 6;
					en_ccy = en_an [enit].y >> 6;
				} else {
					en_ccx = malotes [enoffsmasi].x;
					en_ccy = malotes [enoffsmasi].y;
				}
			#else
				#ifdef USE_TYPE_6
					if (malotes [enoffsmasi].t == 6 || malotes [enoffsmasi].t == 0) {
						en_ccx = en_an [enit].x >> 6;
						en_ccy = en_an [enit].y >> 6;
					} else {
						en_ccx = malotes [enoffsmasi].x;
						en_ccy = malotes [enoffsmasi].y;
					}
					#else
					en_ccx = malotes [enoffsmasi].x;
					en_ccy = malotes [enoffsmasi].y;
				#endif
			#endif
				
			// Moving platforms engine:

			#ifndef PLAYER_MOGGY_STYLE	
				if (malotes [enoffsmasi].t == 4) {
					en_xx = player.x >> 10;
					// Vertical
					if (malotes [enoffsmasi].my < 0) {
						// Go up.
						if (en_x >= en_ccx - 15 && en_x <= en_ccx + 15 && en_y >= en_ccy - 16 && en_y <= en_ccy - 11 && player.vy >= -(PLAYER_INCR_SALTO)) {
							player.gotten = 1;
							player.y = (en_ccy - 16) << 6;
							player.vy = 0;						
							en_yy = player.y >> 10;
							// Collide?
							if (player.y > 1024)
								if (attr (en_xx, en_yy) > 7 || ((en_x & 15) != 0 && attr (en_xx + 1, en_yy) > 7)) {
									// ajust:
									player.y = (en_yy + 1) << 10;
								}
						}
					} else if (malotes [enoffsmasi].my > 0) {
						// Go down.
						if (en_x >= en_ccx - 15 && en_x <= en_ccx + 15 && en_y >= en_ccy - 20 && en_y <= en_ccy - 14 && player.vy >= 0) {
							player.gotten = 1;
							player.y = (en_ccy - 16) << 6;
							player.vy = 0;
							en_yy = player.y >> 10;
							// Collide?
							if (player.y < 9216)
								if (attr (en_xx, en_yy + 1) > 7 || ((en_x & 15) != 0 && attr (en_xx + 1, en_yy + 1) > 7)) {
									// ajust:
									player.y = en_yy << 10;
								}
						}
					}
					en_y = player.y >> 6;
					en_yy = player.y >> 10;
					// Horizontal
					if (malotes [enoffsmasi].mx != 0 && en_x >= en_ccx - 15 && en_x <= en_ccx + 15 && en_y >= en_ccy - 16 && en_y <= en_ccy - 11 && player.vy >= 0) {
						player.gotten = 1;
						player.y = (en_ccy - 16) << 6;
						en_yy = player.y >> 10;
						en_x = en_x + malotes [enoffsmasi].mx;
						player.x = en_x << 6;
						en_xx = player.x >> 10;
						if (malotes [enoffsmasi].mx < 0) {
							if (attr (en_xx, en_yy) > 7 || ((en_y & 15) != 0 && attr (en_xx, en_yy + 1) > 7)) {
								player.vx = 0;
								player.x = (en_xx + 1) << 10;
							}
						} else if (malotes [enoffsmasi].mx > 0) {
							if (attr (en_xx + 1, en_yy) > 7 || ((en_y & 15) != 0 && attr (en_xx + 1, en_yy + 1) > 7)) {
								player.vx = 0;
								player.x = en_xx << 10;
							}
						}					
					}
					
				// Collision with enemy
				
				#ifdef RANDOM_RESPAWN
					} else if (!en_tocado && collide (en_x, en_y, en_ccx, en_ccy) && (malotes [enoffsmasi].t < 16 || en_an [enit].fanty_activo == 1) && player.estado == EST_NORMAL)
				#else
					} else if (!en_tocado && collide (en_x, en_y, en_ccx, en_ccy) && malotes [enoffsmasi].t < 16 && player.estado == EST_NORMAL)
				#endif
			#else
				#ifdef RANDOM_RESPAWN
					if (!en_tocado && collide (en_x, en_y, en_ccx, en_ccy) && (malotes [enoffsmasi].t < 16 || en_an [enit].fanty_activo == 1) && player.estado == EST_NORMAL)
				#else
					if (!en_tocado && collide (en_x, en_y, en_ccx, en_ccy) && malotes [enoffsmasi].t < 16 && player.estado == EST_NORMAL)
				#endif
			#endif			
			{
				#ifdef PLAYER_KILLS_ENEMIES
					if (en_y < en_ccy - 8 && player.vy > 0 && malotes [enoffsmasi].t >= PLAYER_MIN_KILLABLE) {
						// Step on enemy and kill it.
						en_an [enit].next_frame = sprite_17_a;
						sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an [enit].next_frame - en_an [enit].current_frame, VIEWPORT_Y + (malotes [enoffs + enit].y >> 3), VIEWPORT_X + (malotes [enoffs + enit].x >> 3), malotes [enoffs + enit].x & 7, malotes [enoffs + enit].y & 7);
						en_an [enit].current_frame = en_an [enit].next_frame;
						sp_UpdateNow ();
						peta_el_beeper (10);
						en_an [enit].next_frame = sprite_18_a;
						malotes [enoffsmasi].t |= 16;			// Marked as "dead"
						// Count it
						player.killed ++;
						#ifdef ACTIVATE_SCRIPTING
							script = f_scripts [max_screens + 2];
							run_script ();
						#endif
					} else	
				#endif
				{
					en_tocado = 1;
					peta_el_beeper (2);
					player.is_dead = 1;
					
					// We decide which kind of life drain we do:
					#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
						if (malotes [enoffsmasi].t > 4) {
							player.life -= FLYING_ENEMY_HIT;
						} else
					#endif
					{
						player.life -= LINEAR_ENEMY_HIT;
					}
					
					#ifdef PLAYER_BOUNCES
						#ifndef PLAYER_MOGGY_STYLE	
							#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
								if (!en_an [enit].fanty_activo) {
									// Bouncing!
									if (malotes [enoffsmasi].mx > 0) player.vx = PLAYER_MAX_VX;
									if (malotes [enoffsmasi].mx < 0) player.vx = -PLAYER_MAX_VX;
									if (malotes [enoffsmasi].my > 0) player.vy = PLAYER_MAX_VX;
									if (malotes [enoffsmasi].my < 0) player.vy = -PLAYER_MAX_VX;
								} else {
									player.vx = en_an [enit].vx + en_an [enit].vx;
									player.vy = en_an [enit].vy + en_an [enit].vy;
								}
							#else
								// Bouncing!
								if (malotes [enoffsmasi].mx > 0) player.vx = (PLAYER_MAX_VX + PLAYER_MAX_VX);
								if (malotes [enoffsmasi].mx < 0) player.vx = -(PLAYER_MAX_VX + PLAYER_MAX_VX);
								if (malotes [enoffsmasi].my > 0) player.vy = (PLAYER_MAX_VX + PLAYER_MAX_VX);
								if (malotes [enoffsmasi].my < 0) player.vy = -(PLAYER_MAX_VX + PLAYER_MAX_VX);
							#endif
						#else
							// Bouncing:
							
							// x
							if (malotes [enoffsmasi].mx != 0) {
								if (en_x < en_ccx) {
									player.vx = - (abs (malotes [enoffsmasi].mx + malotes [enoffsmasi].mx) << 7);
								} else {
									player.vx = abs (malotes [enoffsmasi].mx + malotes [enoffsmasi].mx) << 7;
								}
							}
							
							// y
							if (malotes [enoffsmasi].my != 0) {
								if (en_y < en_ccy) {
									player.vy = - (abs (malotes [enoffsmasi].my + malotes [enoffsmasi].my) << 7);
								} else {
									player.vy = abs (malotes [enoffsmasi].my + malotes [enoffsmasi].my) << 7;
								}
							}
						#endif
					#endif

					#ifdef PLAYER_FLICKERS
						// Flickers. People seem to like this more than the bouncing behaviour.
						player.estado = EST_PARP;
						player.ct_estado = 50;
					#endif
				}
			}
			
			// Trajectory limits for linear enemies
			
			#ifdef RANDOM_RESPAWN
				if (en_an [enit].fanty_activo) { 
					#ifdef PLAYER_CAN_HIDE			
						if (player_hidden ()) {
							if (player.x < en_an [enit].x && en_an [enit].vx < FANTY_MAX_V)
								en_an [enit].vx += FANTY_A >> 1;
							else if (player.x > en_an [enit].x && en_an [enit].vx > -FANTY_MAX_V)
								en_an [enit].vx -= FANTY_A >> 1;
							if (player.y < en_an [enit].y && en_an [enit].vy < FANTY_MAX_V)
								en_an [enit].vy += FANTY_A >> 1;
							else if (player.y > en_an [enit].y && en_an [enit].vy > -FANTY_MAX_V)
								en_an [enit].vy -= FANTY_A >> 1;
						} else
					#endif 
					if ((rand () & 7) > 1) {
						if (player.x > en_an [enit].x && en_an [enit].vx < FANTY_MAX_V)
							en_an [enit].vx += FANTY_A;
						else if (player.x < en_an [enit].x && en_an [enit].vx > -FANTY_MAX_V)
							en_an [enit].vx -= FANTY_A;
						if (player.y > en_an [enit].y && en_an [enit].vy < FANTY_MAX_V)
							en_an [enit].vy += FANTY_A;
						else if (player.y < en_an [enit].y && en_an [enit].vy > -FANTY_MAX_V)
							en_an [enit].vy -= FANTY_A;
					}
									
					en_an [enit].x += en_an [enit].vx;
					en_an [enit].y += en_an [enit].vy;
					if (en_an [enit].x > 15360) en_an [enit].x = 15360;
					if (en_an [enit].x < -1024) en_an [enit].x = -1024;
					if (en_an [enit].y > 10240) en_an [enit].y = 10240;
					if (en_an [enit].y < -1024) en_an [enit].y = -1024;
				} else
			#endif

			#ifdef USE_TYPE_6
				if (malotes [enoffsmasi].t == 6 || malotes [enoffsmasi].t == 0) {
					#if defined (USE_SIGHT_DISTANCE) || defined (PLAYER_CAN_HIDE)
						// Idle, retreat or pursue depending on player status (distance or hidden)

						switch (en_an [enit].state) {
							case TYPE_6_IDLE:
								#ifdef PLAYER_CAN_HIDE
									if (distance (en_ccx, en_ccy, en_x, en_y) <= SIGHT_DISTANCE && !player_hidden ()) 
								#else
									if (distance (en_ccx, en_ccy, en_x, en_y) <= SIGHT_DISTANCE) 
								#endif
									en_an [enit].state = TYPE_6_PURSUING;
								break;
							case TYPE_6_PURSUING:
								if ((rand () & 7) > 1) {
									if (player.x > en_an [enit].x && en_an [enit].vx < FANTY_MAX_V)
										en_an [enit].vx += FANTY_A;
									else if (player.x < en_an [enit].x && en_an [enit].vx > -FANTY_MAX_V)
										en_an [enit].vx -= FANTY_A;
									if (player.y > en_an [enit].y && en_an [enit].vy < FANTY_MAX_V)
										en_an [enit].vy += FANTY_A;
									else if (player.y < en_an [enit].y && en_an [enit].vy > -FANTY_MAX_V)
										en_an [enit].vy -= FANTY_A;
								}
								
								#ifdef PLAYER_CAN_HIDE
									if (distance (en_ccx, en_ccy, en_x, en_y) >= SIGHT_DISTANCE || player_hidden ()) 
								#else
									if (distance (en_ccx, en_ccy, en_x, en_y) >= SIGHT_DISTANCE)
								#endif
									en_an [enit].state = TYPE_6_RETREATING;
								break;
							case TYPE_6_RETREATING:
								if ((malotes [enoffsmasi].x << 6) > en_an [enit].x && en_an [enit].vx < FANTY_MAX_V)
									en_an [enit].vx += FANTY_A;
								else if ((malotes [enoffsmasi].x << 6) < en_an [enit].x && en_an [enit].vx > -FANTY_MAX_V)
									en_an [enit].vx -= FANTY_A;
								if ((malotes [enoffsmasi].y << 6) > en_an [enit].y && en_an [enit].vy < FANTY_MAX_V)
									en_an [enit].vy += FANTY_A;
								else if ((malotes [enoffsmasi].y << 6) < en_an [enit].y && en_an [enit].vy > -FANTY_MAX_V)
									en_an [enit].vy -= FANTY_A;
								
								#ifdef PLAYER_CAN_HIDE
									if (distance (en_ccx, en_ccy, en_x, en_y) <= SIGHT_DISTANCE && !player_hidden ()) 
								#else
									if (distance (en_ccx, en_ccy, en_x, en_y) <= SIGHT_DISTANCE) 
								#endif
									en_an [enit].state = TYPE_6_PURSUING;
								break;	
						}
					#else
						// Always pursue

						if ((rand () & 7) > 1) {
							if (player.x > en_an [enit].x && en_an [enit].vx < FANTY_MAX_V)
								en_an [enit].vx += FANTY_A;
							else if (player.x < en_an [enit].x && en_an [enit].vx > -FANTY_MAX_V)
								en_an [enit].vx -= FANTY_A;
							if (player.y > en_an [enit].y && en_an [enit].vy < FANTY_MAX_V)
								en_an [enit].vy += FANTY_A;
							else if (player.y < en_an [enit].y && en_an [enit].vy > -FANTY_MAX_V)
								en_an [enit].vy -= FANTY_A;
						}
					#endif

					if (scenery_info.allow_type_6) {
						en_an [enit].x += en_an [enit].vx;
						en_an [enit].y += en_an [enit].vy;
					}
					if (en_an [enit].x > 15360) en_an [enit].x = 15360;
					if (en_an [enit].x < -1024) en_an [enit].x = -1024;
					if (en_an [enit].y > 10240) en_an [enit].y = 10240;
					if (en_an [enit].y < -1024) en_an [enit].y = -1024;
				} else 
			#endif
			{
				if (en_ccx == malotes [enoffsmasi].x1 || en_ccx == malotes [enoffsmasi].x2)
					malotes [enoffsmasi].mx = -malotes [enoffsmasi].mx;
				if (en_ccy == malotes [enoffsmasi].y1 || en_ccy == malotes [enoffsmasi].y2)
					malotes [enoffsmasi].my = -malotes [enoffsmasi].my;
			}
									
			#ifdef PLAYER_CAN_FIRE
				// Collision with bullets
				#ifdef RANDOM_RESPAWN
					if (malotes [enoffsmasi].t < 16 || en_an [enit].fanty_activo == 1)
				#else
					if (malotes [enoffsmasi].t < 16)
				#endif
				{
					for (en_j = 0; en_j < MAX_BULLETS; en_j ++) {		
						if (bullets [en_j].estado == 1) {
							if (bullets [en_j].y >= en_ccy - 4 && bullets [en_j].y <= en_ccy + 12 && bullets [en_j].x >= en_ccx - 4 && bullets [en_j].x <= en_ccx + 12) {
								#if defined (RANDOM_RESPAWN) || defined (USE_TYPE_6)	
									#ifdef RANDOM_RESPAWN	
										if (en_an [enit].fanty_activo) 
									#else
										if (malotes [enoffsmasi].t == 6)
									#endif
									en_an [enit].vx += (bullets [enit].mx > 0 ? 128 : -128);
								#endif
								en_an [enit].next_frame = sprite_17_a;
								en_an [enit].morido = 1;
								bullets [en_j].estado = 0;
								if (malotes [enoffsmasi].t != 4)
									malotes [enoffsmasi].life --;
								if (malotes [enoffsmasi].life == 0) {
									// Kill enemy
									sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an [enit].next_frame - en_an [enit].current_frame, VIEWPORT_Y + (en_ccy >> 3), VIEWPORT_X + (en_ccx >> 3), en_ccx & 7, en_ccy & 7);
									en_an [enit].current_frame = en_an [enit].next_frame;
									sp_UpdateNow ();
									peta_el_beeper (10);
									en_an [enit].next_frame = sprite_18_a;
									malotes [enoffsmasi].t |= 16;			// dead
									// Count
									player.killed ++;
									#ifdef ACTIVATE_SCRIPTING
										script = f_scripts [max_screens + 2];
										run_script ();
									#endif								
									#ifdef RANDOM_RESPAWN								
										en_an [enit].fanty_activo = 0;
										malotes [enoffsmasi].life = FANTIES_LIFE_GAUGE;
									#endif
								}
							}
						}
					}
				}
			#endif

			#ifdef RANDOM_RESPAWN
				// Activate fanty

				if (malotes [enoffsmasi].t > 15 && en_an [enit].fanty_activo == 0 && (rand () & 31) == 1) {
					en_an [enit].fanty_activo = 1;
					if (player.y > 5120)
						en_an [enit].y = -1024;
					else
						en_an [enit].y = 10240;
					en_an [enit].x = (rand () % 240 - 8) << 6;
					en_an [enit].vx = en_an [enit].vy = 0;
				}
			#endif

		}
	}
}
