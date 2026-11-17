	.vert_collision
		xor a
		ld  (_player + 26), a
		ld  (_player + 37), a

		ld  de, (_player + 8)
		ld  hl, (_ptgmy)
		add hl, de
		ld  (_rdj), hl

		ld  a, h
		or  l
		jr  z, vert_collision_done

		// check sign of rdj. If bit 7 of h is 1, negative.
		ld  a, h
		bit 7, a
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

				jr  nz, .vert_collision_up

				ld  a, (_gpx)
				and 15
				jr  z, vert_collision_done

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
				jr  z, vert_collision_done

			.vert_collision_up
				// player.vy = 0; gpyy ++; adjust_to_tile_y (); player.ceiling = 1;
				ld  hl, 0
				ld  (_player + 8), hl	// player.vy

				ld  hl, _gpyy
				inc (hl)

				call _adjust_to_tile_y

				ld  a, 1
				ld  (_player + 37), a 	// player.ceiling
				jr  vert_collision_done
		#else
			// if ((gpy & 15) < 12)
				ld  a, (_gpy)
				and 15
				cp  12
				jr  nc, vert_collision_done

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

				jr  nz, .vert_collision_up

			.vert_collision_if2
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
				push hl
				call _attr
				pop bc
				pop bc
				ld  a, l
				and 8
				jr  z, vert_collision_done

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
				ld  (_gpyy), a

				ld  a, (_gpy)
				ld  e, a
				ld  d, 0
				ld  l, 6
				call l_asl
				ld  (_player + 2), hl

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

				jr  nz, .vert_collision_down

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

				jr  nz, .vert_collision_down

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
				and 8
				jr  z, vert_collision_done
		#endif

	.vert_collision_down
		ld  hl, 0
		ld  (_player + 8), hl	// player.vy
		
		call _adjust_to_tile_y

		ld  a, 1
		ld  (_player + 26), a 	// player.possee

	.vert_collision_done