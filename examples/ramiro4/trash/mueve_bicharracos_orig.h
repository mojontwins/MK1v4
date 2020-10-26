
void mueve_bicharracos (void) {
	// This function moves the active enemies.
	en_tocado = 0;
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
					if (attr (en_x + ctileoff (malotes [enoffsmasi].mx), en_y) & 8 || 
					((malotes [enoffsmasi].y & 15) != 0 && attr (en_x + ctileoff (malotes [enoffsmasi].mx), en_y + 1) & 8)) {
						malotes [enoffsmasi].mx = -malotes [enoffsmasi].mx;
						malotes [enoffsmasi].x = en_cx;
					}
				}
				if (malotes [enoffsmasi].my != 0) {
					if (attr (en_x, en_y + ctileoff (malotes [enoffsmasi].my)) & 8 || 
					((malotes [enoffsmasi].x & 15) != 0 && attr (en_x + 1, en_y + ctileoff (malotes [enoffsmasi].mx)) & 8)) {
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
								if (attr (en_xx, en_yy) & 8 || ((en_x & 15) != 0 && attr (en_xx + 1, en_yy) & 8)) {
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
								if (attr (en_xx, en_yy + 1) & 8 || ((en_x & 15) != 0 && attr (en_xx + 1, en_yy + 1) & 8)) {
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
							if (attr (en_xx, en_yy) & 8 || ((en_y & 15) != 0 && attr (en_xx, en_yy + 1) & 8)) {
								player.vx = 0;
								player.x = (en_xx + 1) << 10;
							}
						} else if (malotes [enoffsmasi].mx > 0) {
							if (attr (en_xx + 1, en_yy) & 8 || ((en_y & 15) != 0 && attr (en_xx + 1, en_yy + 1) & 8)) {
								player.vx = 0;
								player.x = en_xx << 10;
							}
						}					
					}
					
				// Collision with enemy
				
				#ifdef RANDOM_RESPAWN
					} else if (!en_tocado && collide_enem () && (malotes [enoffsmasi].t < 16 || en_an [enit].fanty_activo == 1) && player.estado == EST_NORMAL)
				#else
					} else if (!en_tocado && collide_enem () && malotes [enoffsmasi].t < 16 && player.estado == EST_NORMAL)
				#endif
			#else
				#ifdef RANDOM_RESPAWN
					if (!en_tocado && collide_enem () && (malotes [enoffsmasi].t < 16 || en_an [enit].fanty_activo == 1) && player.estado == EST_NORMAL)
				#else
					if (!en_tocado && collide_enem () && malotes [enoffsmasi].t < 16 && player.estado == EST_NORMAL)
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
