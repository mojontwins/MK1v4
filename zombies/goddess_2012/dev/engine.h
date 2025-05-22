// Churrera Engine
// ===============
// Copyleft 2010, 2011 by The Mojon Twins

// engine.h
// Cointains engine functions (movement, colliding, rendering... )

void clear_gamearea_tiles (void) {
	for (gpit = 0; gpit < 10; gpit ++) {
		for (gpjt = 0; gpjt < 15; gpjt ++) {
			draw_coloured_tile (VIEWPORT_X + (gpjt<<1), VIEWPORT_Y + (gpit<<1), 47);
		}
	}
}

unsigned char attr (char x, char y) {
	// x + 15 * y = x + (16 - 1) * y = x + 16 * y - y = x + (y << 4) - y.
	#ifdef PLAYER_AUTO_CHANGE_SCREEN
		if (x < 0 || y < 0 || x > 14 || y > 9) return 0;
	#else
		if (x < 0 || y < 0) return 8;
	#endif
	return map_attr [x + (y << 4) - y];	
}

unsigned char qtile (unsigned char x, unsigned char y) {
	// x + 15 * y = x + (16 - 1) * y = x + 16 * y - y = x + (y << 4) - y.
	return map_buff [x + (y << 4) - y];	
}

unsigned char l1x, l1y, l2x, l2y;
unsigned char collide (unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2) {
	// Secure and dirty box collision.
	l1x = (x1 > 13) ? x1 - 13 : 0;
	l2x = x1 + 13;
	l1y = (y1 > 13) ? y1 - 13 : 0;
	l2y = y1 + 13;
	return (x2 >= l1x && x2 <= l2x && y2 >= l1y && y2 <= l2y);
}

void srand (unsigned int new_seed) {
	seed [0] = new_seed;	
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

unsigned int abs (signed int n) {
	if (n < 0)
		return (unsigned int) (-n);
	else 
		return (unsigned int) n;
}

void step (void) {
	#ifndef CPC
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
	#endif	
}

void cortina (void) {
	#ifndef CPC
		#asm
			// Antes que nada vamos a limpiar el PAPER de toda la pantalla
			// para que no queden artefactos feos
			
			ld	de, 22528			// Apuntamos con DE a la zona de atributos
			ld	b,	3				// Procesamos 3 tercios
		.clearb1
			push bc
			
			ld	b, 255				// Procesamos los 256 atributos de cada tercio
		.clearb2
		
			ld	a, (de)				// Nos traemos un atributo
			and	199					// Le hacemos la máscara 11000111 y dejamos PAPER a 0
			ld	(de), a				// Y lo volvemos a poner
			
			inc de					// Siguiente atributo
		
			djnz clearb2
			
			pop bc
			djnz clearb1
			
			//// Y ahora el código original que escribí para UWOL:	
		
			ld	a,	8
		
		.repitatodo
			ld	c,	a			// Salvamos el contador de "repitatodo" en 'c'
		
			ld	hl, 16384
			ld	a,	12
		
		.bucle
			ld	b,	a			// Salvamos el contador de "bucle" en 'b'
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
				
			ld	a,	b			// Restituimos el contador de "bucle" a 'a'
			dec a
			jr	nz, bucle
		
			ld	a,	c			// Restituimos el contador de "repitatodo" a 'a'
			dec a
			jr	nz, repitatodo
		#endasm
	#endif
}

// Game

char espera_activa (signed int espera) {
	// Waits until "espera" halts have passed 
	// or a key has been pressed.
	
	res = 1;
	
	for (gpint = 0; gpint < espera && res; gpint ++) {
		for (gpjt = 0; gpjt < 250; gpjt ++) res = 1;
		pad_read (); if (pad0 != 0xff) res = 0;
	}
	
	return res;
}

void game_ending (void) {
	sp_UpdateNow();
	unpack ((unsigned int) (s_ending));
	
	for (gpit = 0; gpit < 4; gpit ++) {
		peta_el_beeper (7);
		peta_el_beeper (2);
	}
	peta_el_beeper (9);
	
	espera_activa (500);
}

void game_over (void) {
	
	for (gpjt = 11; gpjt < 14; gpjt ++)
		for (gpit = 10; gpit < 22; gpit ++)
			sp_PrintAtInv (gpjt, gpit, 95, 0);
			
	sp_PrintAtInv (12, 11, 95, 39);
	sp_PrintAtInv (12, 12, 95, 33);
	sp_PrintAtInv (12, 13, 95, 45);
	sp_PrintAtInv (12, 14, 95, 37);
	sp_PrintAtInv (12, 16, 95, 47);
	sp_PrintAtInv (12, 17, 95, 54);
	sp_PrintAtInv (12, 18, 95, 37);
	sp_PrintAtInv (12, 19, 95, 50);
	sp_PrintAtInv (12, 20, 95, 1);

	sp_UpdateNow ();
		
	for (gpit = 0; gpit < 4; gpit ++) {
		peta_el_beeper (7);
		peta_el_beeper (2);
	}
	peta_el_beeper (9);
	
	espera_activa (500);
}

#ifndef DEACTIVATE_KEYS
	void clear_cerrojo (unsigned char np, unsigned char x, unsigned char y) {
		// search & toggle
			
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) 
			if (cerrojos [gpit].x == x && cerrojos [gpit].y == y && cerrojos [gpit].np == np)
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
		
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) 
			bullets_estado [gpit] = 0;
	}
#endif

#if defined(PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)
	void init_malotes (void) {
		for (gpit = 0; gpit < MAP_W * MAP_H * 3; gpit ++) {
			malotes [gpit].t = malotes [gpit].t & 15;	
			#ifdef PLAYER_CAN_FIRE
				malotes [gpit].life = ENEMS_LIFE_GAUGE;
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
		
		for (bit = 0; bit < MAX_BULLETS; bit ++) {
			if (bullets_estado [bit] == 0) {
				bullets_estado [bit] = 1;
				if (player.facing == 0) {
					bullets_x [bit] = gpx - 4;
					bullets_mx [bit] = -PLAYER_BULLET_SPEED;
				} else {
					bullets_x [bit] = gpx + 12;
					bullets_mx [bit] = PLAYER_BULLET_SPEED;
				}
				bullets_y [bit] = (player.y >> 6) + PLAYER_BULLET_Y_OFFSET;
				peta_el_beeper (6);
				#ifdef FIRING_DRAINS_LIFE
					if (player.life > FIRING_DRAIN_AMOUNT) {
						player.life -= FIRING_DRAIN_AMOUNT;
					} else {
						player.life = 0;
					}
				#endif				
				break;	
			}	
		}	
	}
#endif

#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
	char player_hidden (void) {
		_xx = gpx >> 4;
		_yy = gpy >> 4;
		if ( (gpy & 15) == 0 && player.vx == 0 )
			if (attr (_xx, _yy) == 2 || (attr (1 + _xx, _yy) == 2 && (gpx & 15) != 0) )	
				return 1;
			
		
		return 0;
	}
#endif

#ifdef PLAYER_PUSH_BOXES
	void move_tile (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
		// Move the tile
		gpit = 15 * y1 + x1;
		gpjt = 15 * y0 + x0;
		map_attr [gpit] = 8;
		map_buff [gpit] = 14;
		map_attr [gpjt] = 0;
		map_buff [gpjt] = 0;
		// Draw
		draw_coloured_tile (VIEWPORT_X + x0 + x0, VIEWPORT_Y + y0 + y0, 0);
		draw_coloured_tile (VIEWPORT_X + x1 + x1, VIEWPORT_Y + y1 + y1, 14);
		// Sound
		peta_el_beeper (2);	
	}
#endif

unsigned char move (unsigned char n_pant) {
	cx = player.x;
	cy = player.y;

	// Read device (keyboard, joystick ...)
	pad_read (); gpit = pad0; 

	/* Vertical movement. The ecuations used are:

	   1.- vy = vy + g
	   2.- gpy = gpy + vy

	*/

	#ifndef PLAYER_MOGGY_STYLE
		// If side view, get affected by gravity:
		
		if (player.vy < PLAYER_MAX_VY_CAYENDO)
			player.vy += player.g;
		else
			player.vy = PLAYER_MAX_VY_CAYENDO;

		if (player.gotten) player.vy = 0;		
	#else
		// If top-down view, vertical movement = horizontal movement.
		
		if ( ! ((gpit & sp_UP) == 0 || (gpit & sp_DOWN) == 0))
			if (player.vy > 0) {
				player.vy -= player.rx;
				if (player.vy < 0)
					player.vy = 0;
			} else if (player.vy < 0) {
				player.vy += player.rx;
				if (player.vy > 0)
					player.vy = 0;
			}

		if ((gpit & sp_UP) == 0)
			if (player.vy > -PLAYER_MAX_VX) {
				player.vy -= player.ax;
			}

		if ((gpit & sp_DOWN) == 0)
			if (player.vy < PLAYER_MAX_VX) {
				player.vy += player.ax;
			}
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
	_xx = gpx >> 4;
	_yy = gpy >> 4;
	
	// Cool

	if (player.vy < 0) { 			// Going up
		//if (player.y >= 1024)
			if (attr (_xx, _yy) > 7 || ((gpx & 15) != 0 && attr (_xx + 1, _yy) > 7)) {
				// Stop and adjust.
				player.vy = 0;
				player.y = (_yy + 1) << 10;
			}
	} else if (player.vy > 0 && (gpy & 15) < 8) { 	// Going down
		if (player.y < 9216)
			if (attr (_xx, _yy + 1) > 3 || ((gpx & 15) != 0 && attr (_xx + 1, _yy + 1) > 3))
			{
				// Stop and adjust.
				player.vy = 0;
				player.y = _yy << 10;
			}
	}

	/* Jump: Jumping is as easy as giving vy a negative value. Nevertheless, we want
	   a somewhat more controllable jump, so we use the "mario bros" kind of controls:
	   the longer you press jump, the higher you reach.
	*/

	#ifdef PLAYER_HAS_JUMP
		#ifdef PLAYER_CAN_FIRE
			if (((gpit & sp_UP) == 0) && ((player.vy == 0 && player.saltando == 0 && (attr (_xx, _yy + 1) > 3 || ((gpx & 15) != 0 && attr (_xx + 1, _yy + 1) > 3))) || player.gotten)) {
				player.saltando = 1;
				player.cont_salto = 0;
				peta_el_beeper (3);
			}

			if ( ((gpit & sp_UP) == 0) && player.saltando ) {
				player.vy -= (player.salto + PLAYER_INCR_SALTO - (player.cont_salto>>1));
				if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
				player.cont_salto ++;
				if (player.cont_salto == 8)
					player.saltando = 0;
			}
			
			if ((gpit & sp_UP) != 0)
				player.saltando = 0;
		#else
			if (((gpit & sp_FIRE) == 0) && ((player.vy == 0 && player.saltando == 0 && (attr (_xx, _yy + 1) > 3 || ((gpx & 15) != 0 && attr (_xx + 1, _yy + 1) > 3))) || player.gotten)) {
				player.saltando = 1;
				player.cont_salto = 0;
				peta_el_beeper (3);
			}

			if ( ((gpit & sp_FIRE) == 0) && player.saltando ) {
				player.vy -= (player.salto + PLAYER_INCR_SALTO - (player.cont_salto>>1));
				if (player.vy < -PLAYER_MAX_VY_SALTANDO) player.vy = -PLAYER_MAX_VY_SALTANDO;
				player.cont_salto ++;
				if (player.cont_salto == 8)
					player.saltando = 0;
			}
			
			if ((gpit & sp_FIRE) != 0)
				player.saltando = 0;
		#endif
	#endif

	#ifdef PLAYER_HAS_JETPAC
		if ((gpit & sp_UP) == 0) {
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
	   
	   gpx = gpx + vx
	   vx = vx + ax

	   Direction key not pressed:

	   gpx = gpx + vx
	   vx = vx - rx
	*/

	if ( ! ((gpit & sp_LEFT) == 0 || (gpit & sp_RIGHT) == 0))
		if (player.vx > 0) {
			player.vx -= player.rx;
			if (player.vx < 0)
				player.vx = 0;
		} else if (player.vx < 0) {
			player.vx += player.rx;
			if (player.vx > 0)
				player.vx = 0;
		}

	if ((gpit & sp_LEFT) == 0)
		if (player.vx > -PLAYER_MAX_VX) {
			player.facing = 0;
			player.vx -= player.ax;
		}

	if ((gpit & sp_RIGHT) == 0)
		if (player.vx < PLAYER_MAX_VX) {
			player.vx += player.ax;
			player.facing = 1;
		}

	player.x = player.x + player.vx;
	
	// Safe
	
	if (player.x < 0)
		player.x = 0;
		
	if (player.x > 14336)
		player.x = 14336;

	gpy = player.y >> 6;
	gpx = player.x >> 6;
	_yy = gpy >> 4;
	_xx = gpx >> 4;
	
	if (player.vx < 0) {
		if (attr (_xx, _yy) > 7 || ((gpy & 15) != 0 && attr (_xx, _yy + 1) > 7)) {
			// Stop and adjust
			player.vx = 0;
			player.x = (_xx + 1) << 10;
		}
	} else {
		if (attr (_xx + 1, _yy) > 7 || ((gpy & 15) != 0 && attr (_xx + 1, _yy + 1) > 7)) {
			// Stop and adjust
			player.vx = 0;
			player.x = _xx << 10;
		}
	}
	
	// Shooting engine:
		
	#ifdef PLAYER_CAN_FIRE
		#ifdef PLAYER_MOGGY_STYLE
			// TODO. Not implemented yet. 
		#else
			if ((gpit & sp_FIRE) == 0 && player.disparando == 0) {
				player.disparando = 1;
				fire_bullet ();
			}
			
			if ((gpit & sp_FIRE) != 0) 
				player.disparando = 0;
		#endif
	#endif
	
	// Keys / bolts engine:

	#ifndef DEACTIVATE_KEYS
		if ((gpx & 15) == 0 && (gpy & 15) == 0) {
			if (qtile (_xx + 1, _yy) == 15 && player.keys > 0) {
				map_attr [15 * _yy + _xx + 1] = 0;
				map_buff [15 * _yy + _xx + 1] = 0;
				clear_cerrojo (n_pant, _xx + 1, _yy);
				draw_coloured_tile (VIEWPORT_X + _xx + _xx + 2, VIEWPORT_Y + _yy + _yy, 0);
				player.keys --;
				peta_el_beeper (8);
			} else if (qtile (_xx - 1, _yy) == 15 && player.keys > 0) {
				map_attr [15 * _yy + _xx - 1] = 0;
				map_buff [15 * _yy + _xx - 1] = 0;
				clear_cerrojo (n_pant, _xx - 1, _yy);
				draw_coloured_tile (VIEWPORT_X + _xx + _xx - 2, VIEWPORT_Y + _yy + _yy, 0);
				player.keys --;
				peta_el_beeper (8);
			}
		}
	#endif
	
	// Pushing boxes (tile #14) engine

	#ifdef PLAYER_PUSH_BOXES
		#ifdef PLAYER_MOGGY_STYLE
			if ((gpit & sp_FIRE) == 0)
		#endif		
		{
			gpx = player.x >> 6;
			gpy = player.y >> 6;
			_xx = gpx >> 4;
			_yy = gpy >> 4;
			#ifdef PLAYER_AUTO_CHANGE_SCREEN
				// In this case, there's nothing in the screen boundaries which will stop
				// the boxes from getting out of the screen, so we have to explicitly 
				// make sure that this won't happen.
				
				// In side-view mode, you can't push boxes vertically.
				#ifdef PLAYER_MOGGY_STYLE
					// Vertically, only when player.y is tile-aligned.
					if ((gpy & 15) == 0) {
						if ((gpit & sp_UP) == 0 && _yy > 1) {
							if (qtile (_xx, _yy - 1) == 14 && attr (_xx, _yy - 2) == 0) {				
								move_tile (_xx, _yy - 1, _xx, _yy - 2);
							}
							if ((gpx & 15) != 0) {
								if (qtile (_xx + 1, _yy - 1) == 14 && attr (_xx + 1, _yy - 2) == 0) {
									move_tile (_xx + 1, _yy - 1, _xx + 1, _yy - 2);
								}
							}
						} else if ((gpit & sp_DOWN) == 0 && _yy < 8) {
							if (qtile (_xx, _yy + 1) == 14 && attr (_xx, _yy + 2) == 0) {
								move_tile (_xx, _yy + 1, _xx, _yy + 2);
							}
							if ((gpx & 15) != 0) {
								if (qtile (_xx + 1, _yy + 1) == 14 && attr (_xx + 1, _yy + 2) == 0) {
									move_tile (_xx + 1, _yy + 1, _xx + 1, _yy + 2);
								}	
							}
						}
					}
				#endif

				// Horizontally, only when player.x is tile-aligned.
				if ((gpx & 15) == 0) {
					if ((gpit & sp_RIGHT) == 0 && _xx < 14) {
						if (qtile (_xx + 1, _yy) == 14 && attr (_xx + 2, _yy) == 0) {
							move_tile (_xx + 1, _yy, _xx + 2, _yy);
						}
						if ((gpy & 15) != 0) {
							if (qtile (_xx + 1, _yy + 1) == 14 && attr (_xx + 2, _yy + 1) == 0) {
								move_tile (_xx + 1, _yy + 1, _xx + 2, _yy + 1);
							}
						}
					} else if ((gpit & sp_LEFT) == 0 && _xx > 1) {
						if (qtile (_xx - 1, _yy) == 14 && attr (_xx - 2, _yy) == 0) {
							move_tile (_xx - 1, _yy, _xx - 2, _yy);
						}
						if ((gpy & 15) != 0) {
							if (qtile (_xx - 1, _yy + 1) == 14 && attr (_xx - 2, _yy + 1) == 0) {
								move_tile (_xx - 1, _yy + 1, _xx - 2, _yy + 1);
							}
						}
					}	
				}			
			#else

				// In side-view mode, you can't push boxes vertically.
				#ifdef PLAYER_MOGGY_STYLE
					// Vertically, only when player.y is tile-aligned.
					if ((gpy & 15) == 0) {
						if ((gpit & sp_UP) == 0) {
							if (qtile (_xx, _yy - 1) == 14 && attr (_xx, _yy - 2) == 0) {				
								move_tile (_xx, _yy - 1, _xx, _yy - 2);
							}
							if ((gpx & 15) != 0) {
								if (qtile (_xx + 1, _yy - 1) == 14 && attr (_xx + 1, _yy - 2) == 0) {
									move_tile (_xx + 1, _yy - 1, _xx + 1, _yy - 2);
								}
							}
						} else if ((gpit & sp_DOWN) == 0) {
							if (qtile (_xx, _yy + 1) == 14 && attr (_xx, _yy + 2) == 0) {
								move_tile (_xx, _yy + 1, _xx, _yy + 2);
							}
							if ((gpx & 15) != 0) {
								if (qtile (_xx + 1, _yy + 1) == 14 && attr (_xx + 1, _yy + 2) == 0) {
									move_tile (_xx + 1, _yy + 1, _xx + 1, _yy + 2);
								}	
							}
						}
					}
				#endif

				// Horizontally, only when player.x is tile-aligned.
				if ((gpx & 15) == 0) {
					if ((gpit & sp_RIGHT) == 0) {
						if (qtile (_xx + 1, _yy) == 14 && attr (_xx + 2, _yy) == 0) {
							move_tile (_xx + 1, _yy, _xx + 2, _yy);
						}
						if ((gpy & 15) != 0) {
							if (qtile (_xx + 1, _yy + 1) == 14 && attr (_xx + 2, _yy + 1) == 0) {
								move_tile (_xx + 1, _yy + 1, _xx + 2, _yy + 1);
							}
						}
					} else if ((gpit & sp_LEFT) == 0) {
						if (qtile (_xx - 1, _yy) == 14 && attr (_xx - 2, _yy) == 0) {
							move_tile (_xx - 1, _yy, _xx - 2, _yy);
						}
						if ((gpy & 15) != 0) {
							if (qtile (_xx - 1, _yy + 1) == 14 && attr (_xx - 2, _yy + 1) == 0) {
								move_tile (_xx - 1, _yy + 1, _xx - 2, _yy + 1);
							}
						}
					}	
				}	
			#endif
		}	
	#endif

	// Evil tile engine

	#ifndef DEACTIVATE_EVIL_TILE	
		gpx = player.x >> 6;
		gpy = player.y >> 6;
		_xx = gpx >> 4;
		_yy = gpy >> 4;

		if (attr (_xx, _yy) == 1 || 
			((gpx & 15) != 0 && attr (_xx + 1, _yy) == 1) ||
			((gpy & 15) != 0 && attr (_xx, _yy + 1) == 1) ||
			((gpx & 15) != 0 && (gpy & 15) != 0 && attr (_xx + 1, _yy + 1) == 1)) {
			if (player.life > 0) {
				peta_el_beeper (4);
				player.life --;	
				player.x = cx;
				player.y = cy;
				player.vy = -player.vy;
				player.vx = -player.vx;
			}
		}
	#endif

	gpy = player.y >> 6;
	gpx = player.x >> 6;

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

void init_player (void) {
	// Initialize player with initial values.
	// (hence the initialize thing)
	
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
	player.life = 		PLAYER_LIFE;
	player.objs =		0;
	player.keys = 		0;
	player.killed = 	0;
	player.disparando = 0;
	
	pant_final = SCR_FIN;
}

#if defined(DEACTIVATE_KEYS) && defined(DEACTIVATE_OBJECTS)
#else
	void init_hotspots (void) {
		for (gpit = 0; gpit < MAP_W * MAP_H; gpit ++)
			hotspots [gpit].act = 1;
	}
#endif

void draw_scr (unsigned char n_pant) {

	// This function draws and sets up current screen.
		
	rdx = rdy = rdm = 0;
	#ifdef UNPACKED_MAP
		gpint = n_pant * 150;
	#else
		gpint = n_pant * 75;
	#endif
	
	#ifdef UNPACKED_MAP
		// UNPACKED map, every byte represents one tile.
		for (gpit = 0; gpit < 150; gpit ++) {
			rdd = mapa [gpint++];
			map_attr [rdm] = comportamiento_tiles [rdd];
			map_buff [rdm] = rdd;
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rdd);
			rdm ++;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
		}
	#else
		// PACKED map, every byte contains two tiles, plus admits
		// some special effects (autoshadows, see below).
		for (gpit = 0; gpit < 75; gpit ++) {
			rdm = 15 * (rdy >> 1) + (rdx >> 1);
			rdd = mapa [gpint++];
			rda = rdd >> 4;
			rdb = rdd & 15;
			map_attr [rdm] = comportamiento_tiles [rda];
			if ((rand () & 15) < 2 && rda == 0 && map_buff [rdm - 16] == 0)
				rda = 19;
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rda);
			map_buff [rdm] = rda;
			rdx += 2;
			if (rdx == 30) {
				rdx = 0;
				rdy += 2;
			}
			rdm ++;
			map_attr [rdm] = comportamiento_tiles [rdb];
			if ((rand () & 15) < 2 && rdb == 0 && map_buff [rdm - 16] == 0)
				rdb = 19;
			draw_coloured_tile (VIEWPORT_X + rdx, VIEWPORT_Y + rdy, rdb);
			map_buff [rdm] = rdb;
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
		} else if (hotspots [n_pant].act == 0) {
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
	
	#ifndef DEACTIVATE_KEYS
		// Is there a bolt which has been already opened in this screen?
		// If so, delete it:
		for (gpit = 0; gpit < MAX_CERROJOS; gpit ++) {
			if (cerrojos [gpit].np == n_pant && !cerrojos [gpit].st) {
				draw_coloured_tile (VIEWPORT_X + (cerrojos [gpit].x << 1), VIEWPORT_Y + (cerrojos [gpit].y << 1), 0);
				rdm = 15 * cerrojos [gpit].y + cerrojos [gpit].x;
				map_attr [rdm] = 0;
				map_buff [rdm] = 0;
			}
		}
	#endif
	
	// Set up enemies.
	
	enoffsmasi = enoffs = n_pant * 3;
	
	for (gpit = 0; gpit < 3; gpit ++) {
		en_an_frame [gpit] = 0;
		en_an_count [gpit] = 0;
		#ifdef RANDOM_RESPAWN
			en_an_fanty_activo [gpit] = 0;
		#endif
		switch (malotes [enoffsmasi].t) {
			/*
			case 0:
				sp_MoveSprAbs (sp_moviles [gpit], spritesClip, 0, 22, 0, 0, 0);
				break;
			*/
			case 1:
				en_an_next_frame [gpit] = sprite_9_a;
				break;
			case 2:
				en_an_next_frame [gpit] = sprite_11_a;
				break;
			case 3:
				en_an_next_frame [gpit] = sprite_13_a;
				break;
			case 4:
				en_an_next_frame [gpit] = sprite_15_a;
				break;
			#ifdef USE_TYPE_6
				case 6:
					en_an_next_frame [gpit] = sprite_13_a;
					en_an_x [gpit] = malotes [enoffsmasi].x << 6;
					en_an_y [gpit] = malotes [enoffsmasi].y << 6;
					en_an_vx [gpit] = en_an_vy [gpit] = 0;
					en_an_state [gpit] = TYPE_6_IDLE;
			#endif
			#if defined (PLAYER_KILLS_ENEMIES) || defined (PLAYER_CAN_FIRE)			
				default:
					en_an_next_frame [gpit] = sprite_18_a;
			#endif
		}

		enoffsmasi ++;
	}
	
	#ifdef ACTIVATE_SCRIPTING
		// Delete line of text
		for (gpit = 0; gpit < 30; gpit ++)
			sp_PrintAtInv (LINE_OF_TEXT, 1 + gpit, 71, 0);
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

#ifdef PLAYER_CAN_FIRE
	void mueve_bullets (void) {
		#ifdef PLAYER_MOGGY_STYLE
			// TODO
		#else	
			for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
				bullets_x [gpit] += bullets_mx [gpit];
				if (attr (bullets_x [gpit] >> 4, bullets_y [gpit] >> 4) > 7) {
					bullets_estado [gpit] = 0;
				}
				if (bullets_x [gpit] < 8 || bullets_x [gpit] > 240)
					bullets_estado [gpit] = 0;
			}	
		#endif
	}
#endif	

unsigned char distance (unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2) {
	// return abs (x2 - x1 + y2 - y1);
	// Better version:
	dx = abs (x2 - x1);
	dy = abs (y2 - y1);
	mn = dx < dy ? dx : dy;
	return (dx + dy - (mn >> 1) - (mn >> 2) + (mn >> 4));
}

void mueve_bicharracos (unsigned char n_pant) {
	// This function moves the active enemies.
	
	player.gotten = 0;
	
	for (enit = 0; enit < 3; enit ++) {
		enoffsmasi = enoffs + enit;
		if (malotes [enoffsmasi].t != 0) {
			cx = malotes [enoffsmasi].x;
			cy = malotes [enoffsmasi].y;

			#ifdef RANDOM_RESPAWN
				if (!en_an_fanty_activo [enit])
			#endif
			{
				malotes [enoffsmasi].x += malotes [enoffsmasi].mx;
				malotes [enoffsmasi].y += malotes [enoffsmasi].my;
			}
		
			#ifdef PLAYER_PUSH_BOXES			
				// Check for collisions.
				_x = malotes [enoffsmasi].x >> 4;
				_y = malotes [enoffsmasi].y >> 4;

				if (malotes [enoffsmasi].mx != 0) {
					if (attr (_x + ctileoff (malotes [enoffsmasi].mx), _y) > 7 || 
					((malotes [enoffsmasi].y & 15) != 0 && attr (_x + ctileoff (malotes [enoffsmasi].mx), _y + 1) > 7)) {
						malotes [enoffsmasi].mx = -malotes [enoffsmasi].mx;
						malotes [enoffsmasi].x = cx;
					}
				}
				if (malotes [enoffsmasi].my != 0) {
					if (attr (_x, _y + ctileoff (malotes [enoffsmasi].my)) > 7 || 
					((malotes [enoffsmasi].x & 15) != 0 && attr (_x + 1, _y + ctileoff (malotes [enoffsmasi].mx)) > 7)) {
						malotes [enoffsmasi].my = -malotes [enoffsmasi].my;
						malotes [enoffsmasi].y = cy;
					}
				}
			#endif

			// Select frame to display

			en_an_count [enit] ++; 
			if (en_an_count [enit] == 4) {
				en_an_count [enit] = 0;
				en_an_frame [enit] = !en_an_frame [enit];

				switch (malotes [enoffsmasi].t) {
					case 1:
						en_an_next_frame [enit] = en_an_frame [enit] ? sprite_9_a : sprite_10_a;
						break;
					case 2:
						en_an_next_frame [enit] = en_an_frame [enit] ? sprite_11_a : sprite_12_a;
						break;
					case 3:
					case 6:
						en_an_next_frame [enit] = en_an_frame [enit] ? sprite_13_a : sprite_14_a;
						break;
					case 4:
						en_an_next_frame [enit] = en_an_frame [enit] ? sprite_15_a : sprite_16_a;
					#ifdef RANDOM_RESPAWN
							break;
						default:
							if (en_an_fanty_activo [enit])
								en_an_next_frame [enit] = en_an_frame [enit] ? sprite_13_a : sprite_14_a;
					#endif					
				}	
			}

			// Simplify coordinates (to byte values)

			#ifdef RANDOM_RESPAWN
				if (en_an_fanty_activo [enit]) {
					ccx = en_an_x [enit] >> 6;
					ccy = en_an_y [enit] >> 6;
				} else 
			#elif defined USE_TYPE_6
				if (malotes [enoffsmasi].t == 6) {
					ccx = en_an_x [enit] >> 6;
					ccy = en_an_y [enit] >> 6;
				} else 
			#endif
			{
				ccx = malotes [enoffsmasi].x;
				ccy = malotes [enoffsmasi].y;
			}
			
			// Moving platforms engine:

			#ifndef PLAYER_MOGGY_STYLE	
				if (malotes [enoffsmasi].t == 4) {
					_xx = gpx >> 4;
					// Vertical
					if (malotes [enoffsmasi].my < 0) {
						// Go up.
						if (gpx >= ccx - 15 && gpx <= ccx + 15 && gpy >= ccy - 16 && gpy <= ccy - 11 && player.vy >= -(PLAYER_INCR_SALTO)) {
							player.gotten = 1;
							player.vy = 0;						
							gpy = (ccy - 16);
							player.y = gpy << 6;
							_yy = gpy >> 4;
							// Collide?
							if (player.y > 1024)
								if (attr (_xx, _yy) > 7 || ((gpx & 15) != 0 && attr (_xx + 1, _yy) > 7)) {
									// ajust:
									gpy = (_yy + 1) << 4;
									player.y = gpy << 6;
								}
						}
					} else if (malotes [enoffsmasi].my > 0) {
						// Go down.
						if (gpx >= ccx - 15 && gpx <= ccx + 15 && gpy >= ccy - 20 && gpy <= ccy - 14 && player.vy >= 0) {
							player.gotten = 1;
							player.vy = 0;						
							gpy = (ccy - 16);
							player.y = gpy << 6;
							_yy = gpy >> 4;
							// Collide?
							if (player.y < 9216)
								if (attr (_xx, _yy + 1) > 7 || ((gpx & 15) != 0 && attr (_xx + 1, _yy + 1) > 7)) {
									// ajust:
									gpy = _yy << 4;
									player.y = gpy << 6;
								}
						}
					}

					// Horizontal
					if (malotes [enoffsmasi].mx != 0 && gpx >= ccx - 15 && gpx <= ccx + 15 && gpy >= ccy - 16 && gpy <= ccy - 11 && player.vy >= 0) {
						player.gotten = 1;
						gpy = (ccy - 16);
						player.y = gpy << 6;
						_yy = gpy >> 4;
						gpx = gpx + malotes [enoffsmasi].mx;
						player.x = gpx << 6;
						_xx = gpx >> 4;
						if (malotes [enoffsmasi].mx < 0) {
							if (attr (_xx, _yy) > 7 || ((gpy & 15) != 0 && attr (_xx, _yy + 1) > 7)) {
								player.vx = 0;
								gpx = (_xx + 1) << 4;
								player.x = gpx << 6;
							}
						} else if (malotes [enoffsmasi].mx > 0) {
							if (attr (_xx + 1, _yy) > 7 || ((gpy & 15) != 0 && attr (_xx + 1, _yy + 1) > 7)) {
								player.vx = 0;
								gpx = _xx << 4;
								player.x = gpx << 6;
							}
						}					
					}
				} else
			#endif	
			// Collision with enemy
			
			if (
				!tocado && collide (gpx, gpy, ccx, ccy) && (malotes [enoffsmasi].t < 16 
					#ifdef RANDOM_RESPAWN
						|| en_an_fanty_activo [enit] == 1
					#endif
				) && player.estado == EST_NORMAL) {
				#ifdef PLAYER_KILLS_ENEMIES
					if (gpy < ccy - 8 && player.vy > 0 && malotes [enoffsmasi].t >= PLAYER_MIN_KILLABLE) {
						// Step on enemy and kill it.
						en_an_next_frame [enit] = sprite_17_a;
						#ifdef CPC
							sp_sw [SP_ENEMS_BASE + enit].sp0 = (unsigned int) (sprite_17_a);
							sp_UpdateNow (1);
							peta_el_beeper (5);
							espera_activa (20);
						#else
							sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an_next_frame [enit] - en_an_current_frame [enit], VIEWPORT_Y + (malotes [enoffs + enit].y >> 3), VIEWPORT_X + (malotes [enoffs + enit].x >> 3), malotes [enoffs + enit].x & 7, malotes [enoffs + enit].y & 7);
							en_an_current_frame [enit] = en_an_next_frame [enit];
							sp_UpdateNow ();
							peta_el_beeper (5);
						#endif
						en_an_next_frame [enit] = sprite_18_a;
						malotes [enoffsmasi].t |= 16;			// Marked as "dead"
						// Count it
						player.killed ++;
						#ifdef ACTIVATE_SCRIPTING					
							// Run script?
							script = f_scripts [n_pant];
							run_script ();
						#endif
					} else 
				#endif

				if (player.life > 0) {
					tocado = 1;
					peta_el_beeper (4);
					
					// We decide which kind of life drain we do:
					#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
						if (malotes [enoffsmasi].t > 4) {
							if (player.life > FLYING_ENEMY_HIT) 
								player.life -= FLYING_ENEMY_HIT;
							else
								player.life = 0;
						} else
					#endif
					{
						if (player.life > LINEAR_ENEMY_HIT) 
							player.life -= LINEAR_ENEMY_HIT;
						else
							player.life = 0;
					}
					
					#ifdef PLAYER_BOUNCES
						#ifndef PLAYER_MOGGY_STYLE	
							#if defined(RANDOM_RESPAWN) || defined(USE_TYPE_6)
								if (!en_an_fanty_activo [enit]) {
									// Bouncing!
									if (malotes [enoffsmasi].mx > 0) player.vx = PLAYER_MAX_VX;
									if (malotes [enoffsmasi].mx < 0) player.vx = -PLAYER_MAX_VX;
									if (malotes [enoffsmasi].my > 0) player.vy = PLAYER_MAX_VX;
									if (malotes [enoffsmasi].my < 0) player.vy = -PLAYER_MAX_VX;
								} else {
									player.vx = en_an_vx [enit] + en_an_vx [enit];
									player.vy = en_an_vy [enit] + en_an_vy [enit];
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
							
							// X
							if (malotes [enoffsmasi].mx != 0) {
								if (gpx < ccx) {
									player.vx = - (abs (malotes [enoffsmasi].mx + malotes [enoffsmasi].mx) << 7);
								} else {
									player.vx = abs (malotes [enoffsmasi].mx + malotes [enoffsmasi].mx) << 7;
								}
							}
							
							// Y
							if (malotes [enoffsmasi].my != 0) {
								if (gpy < ccy) {
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
				if (en_an_fanty_activo [enit]) {
					
					if (player_hidden ()) {
						if (player.x < en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
							en_an_vx [enit] += FANTY_A >> 1;
						else if (player.x > en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
							en_an_vx [enit] -= FANTY_A >> 1;
						if (player.y < en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
							en_an_vy [enit] += FANTY_A >> 1;
						else if (player.y > en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
							en_an_vy [enit] -= FANTY_A >> 1;
					} else if ((rand () & 7) > 1) {
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
				} else {
			#endif

			#ifdef USE_TYPE_6
				if (malotes [enoffsmasi].t == 6) {
					rdd = distance (ccx, ccy, gpx, gpy);
					switch (en_an_state [enit]) {
						case TYPE_6_IDLE:
							if (rdd <= SIGHT_DISTANCE && !player_hidden ()) 
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
							if (rdd >= SIGHT_DISTANCE || player_hidden ()) 
								en_an_state [enit] = TYPE_6_RETREATING;
							break;
						case TYPE_6_RETREATING:
							if ((malotes [enoffsmasi].x << 6) > en_an_x [enit] && en_an_vx [enit] < FANTY_MAX_V)
								en_an_vx [enit] += FANTY_A;
							else if ((malotes [enoffsmasi].x << 6) < en_an_x [enit] && en_an_vx [enit] > -FANTY_MAX_V)
								en_an_vx [enit] -= FANTY_A;
							if ((malotes [enoffsmasi].y << 6) > en_an_y [enit] && en_an_vy [enit] < FANTY_MAX_V)
								en_an_vy [enit] += FANTY_A;
							else if ((malotes [enoffsmasi].y << 6) < en_an_y [enit] && en_an_vy [enit] > -FANTY_MAX_V)
								en_an_vy [enit] -= FANTY_A;
							if (rdd <= SIGHT_DISTANCE && !player_hidden ()) 
								en_an_state [enit] = TYPE_6_PURSUING;
							break;	
					}
					en_an_x [enit] += en_an_vx [enit];
					en_an_y [enit] += en_an_vy [enit];
					if (en_an_x [enit] > 15360) en_an_x [enit] = 15360;
					if (en_an_x [enit] < -1024) en_an_x [enit] = -1024;
					if (en_an_y [enit] > 10240) en_an_y [enit] = 10240;
					if (en_an_y [enit] < -1024) en_an_y [enit] = -1024;
				} else
			#endif
			{
				if (ccx == malotes [enoffsmasi].x1 || ccx == malotes [enoffsmasi].x2)
					malotes [enoffsmasi].mx = -malotes [enoffsmasi].mx;
				if (ccy == malotes [enoffsmasi].y1 || ccy == malotes [enoffsmasi].y2)
					malotes [enoffsmasi].my = -malotes [enoffsmasi].my;
			}
							
			#ifdef PLAYER_CAN_FIRE
				// Collision with bullets
				if (malotes [enoffsmasi].t < 16 
					#ifdef RANDOM_RESPAWN
						|| en_an_fanty_activo [enit] == 1
					#endif
				) {

					for (bit = 0; bit < MAX_BULLETS; bit ++) {		
						if (bullets_estado [bit] == 1) {
							if (bullets_y [bit] >= ccy - 4 && bullets_y [bit] <= ccy + 12 && bullets_x [bit] >= ccx - 4 && bullets_x [bit] <= ccx + 12) {
								#if defined (RANDOM_RESPAWN) || defined (USE_TYPE_6)	
									#ifdef RANDOM_RESPAWN	
										if (en_an_fanty_activo [enit]) 
									#else
										if (malotes [enoffsmasi].t == 6)
									#endif
									en_an_vx [enit] += (bullets_mx [enit] > 0 ? 128 : -128);
								#endif

								en_an_next_frame [enit] = sprite_17_a;
								en_an_morido [enit] = 1;
								bullets_estado [bit] = 0;
								if (malotes [enoffsmasi].t != 4)
									malotes [enoffsmasi].life --;
								if (malotes [enoffsmasi].life == 0) {
									// Kill enemy
									#ifdef CPC
										sp_sw [SP_ENEMS_BASE + enit].sp0 = (unsigned int) (sprite_17_a);
										sp_UpdateNow (1);
										peta_el_beeper (5);
										espera_activa (20);
									#else
										sp_MoveSprAbs (sp_moviles [enit], spritesClip, en_an_next_frame [enit] - en_an_current_frame [enit], VIEWPORT_Y + (ccy >> 3), VIEWPORT_X + (ccx >> 3), ccx & 7, ccy & 7);
										en_an_current_frame [enit] = en_an_next_frame [enit];
										sp_UpdateNow ();
										peta_el_beeper (5);
									#endif
									en_an_next_frame [enit] = sprite_18_a;
									malotes [enoffsmasi].t |= 16;			// dead
									// Count
									player.killed ++;
									#ifdef RANDOM_RESPAWN								
										en_an_fanty_activo [enit] = 0;
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

				if (malotes [enoffsmasi].t > 15 && en_an_fanty_activo [enit] == 0 && (rand () & 31) == 1) {
					en_an_fanty_activo [enit] = 1;
					if (player.y > 5120)
						en_an_y [enit] = -1024;
					else
						en_an_y [enit] = 10240;
					en_an_x [enit] = (rand () % 240 - 8) << 6;
					en_an_vx [enit] = en_an_vy [enit] = 0;
				}
			#endif

		}
	}
}
