	#asm
		
			xor a 
			ld  (_wall), a

			ld  hl, (_player + 6)		// player.vx
			ld  de, (_ptgmx)
			add hl, defined
			ld  (_rdj), hl

			// if (rdj)
			ld  a, h
			or  l
			jp  z, horz_collision_done
			
			// if (rdj < 0)
			bit 7, h
			jp  z, vert_collision_positive

		#ifdef PLAYER_MOGGY_STYLE || !defined SHORT_PLAYER

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

				jr  nz, vert_collision_left

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

				ld  hl, (_gpxx)
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

				jr  nz, vert_collision_right

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

				lf  a, (_gpxx)
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

				lf  a, (_gpxx)
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