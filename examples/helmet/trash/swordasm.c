	void swing_sword (void) {
		#asm
				ld  a, (_s_on)
				or  a
				jp  z, swong_sword_done

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

			.sword_check_done

			.swong_sword_done
		#endasm

		sp_MoveSprAbs (sp_sword, spritesClip, s_next_frame - s_current_frame, VIEWPORT_Y + (s_y >> 3), VIEWPORT_X + (rdx >> 3), rdx & 7, s_y & 7);
		s_current_frame = s_next_frame;		
	}