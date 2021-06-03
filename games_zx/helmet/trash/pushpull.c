			#asm
				.push_pull
					ld  a, (_pad0)
					and sp_FIRE
					jp  nz, push_pull_done

					ld  a, (_player + 26) 	// player.possee
					or  a
					jp  z, push_pull_done

				.push_pull_do 

					// rdx = gpx;	x0 = 0xff;	y0 = y1 = gpyy;
					ld  a, (_gpx)
					ld  (_rdx), a

					ld  a, 0xff
					ld  (_x0), a

					ld  a, (_gpyy)
					ld  (_y0), a
					ld  (_y1), a

					// if (player.facing == 0) {
					ld  a, (_player + 22) 	// player.facing
					or  a
					jr  nz, push_pull_facing_right

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
					and sp_RIGHT
					jr  nz, push_pull_invalidate_keys

					// attr (gpxx + 2, gpyy) < 4
					ld  hl, (_gpxx)
					ld  h, 0
					inc hl
					inc hl
					push hl
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr
					pop bc 
					pop bc

					ld  a, l
					cp  4
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

					// if ((pad_this_frame & sp_LEFT) == 0 && attr (gpxx - 1, gpyy) < 4) {
					ld  a, (_pad_this_frame)
					and sp_LEFT
					jr  nz, push_pull_facing_right_do_not_left

					ld  hl, (_gpxx)
					ld  h, 0
					dec hl
					push hl 
					ld  hl, (_gpyy)
					ld  h, 0
					push hl
					call _attr 
					pop bc 
					pop bc 
					ld  a, l
					cp  4
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
					and sp_FIRE|sp_LEFT|sp_RIGHT
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

					ld  hl, 1
					push hl
					call _move_tile
					pop hl 
					jp  push_pull_done 

				.push_pull_undo
					//  gpxx = rdx >> 4; gpx = rdx; player.x = gpx << 6; 
				
					ld  a, (_rdx)
					ld  (_gpx), a
					srl a
					srl a
					srl a
					srl a
					ld  (_gpxx), a

					ld  a, (_gpx)
					ld  e, a
					ld  d, 0
					ld  l, 6
					call l_asl
					ld  (_player), hl 		// player.x


				.push_pull_done
