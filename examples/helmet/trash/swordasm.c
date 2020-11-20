	void swing_sword (void) {
		#asm
				ld  a, (_s_on)
				or  a
				jp  z, swing_sword_off

			.sword_check

			#ifdef SWORD_UP
				.sword_check_up
					ld  a, (_s_type)
					cp  SWORD_TYPE_UP
					jr  z, sword_up_done

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

				ld  bc, (s_frame)
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

			.sword_check_done

			// Detect breakable
			#ifdef ENABLE_BREAKABLE
				// if (s_frame > 2 -> >= 3
					ld  a, (_s_frame)
					cp  3
					jr  c, sword_breakable_done

				// && s_frame < 6)
					cp  6
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
				ld  (rdx), a
		#endasm

		sp_MoveSprAbs (sp_sword, spritesClip, s_next_frame - s_current_frame, VIEWPORT_Y + (s_y >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, s_y & 7);
		s_current_frame = s_next_frame;		
	}