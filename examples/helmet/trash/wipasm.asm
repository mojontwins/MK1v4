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
				ld  (_player + 8), hl

				ld  hl, _gpyy
				inc (hl)

				call _adjust_to_tile_y

				ld  a, 1
				ld  (_player + 37), a
				jr  vert_collision_done
		#else
			// if ((gpy & 15) < 12)
				ld  a, (_gpy)
				and 15
				cp  12
				jr  nc, vert_collision_done

			// if (((gpx & 15) < 12 && attr (gpxx, gpyy) & 8) || ((gpx & 15) > 4 && attr (gpxx + 1, gpyy) & 8)) {
		#endif



	.vert_collision_positive
		// rdj > 0

	.vert_collision_done