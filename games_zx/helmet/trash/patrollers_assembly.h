#asm
		ld  bc, (_enit)
		ld  bc, 0 							// bc will be our index

		ld  hl, _en_an_facing
		add hl, bc							// hl -> en_an_facing [enit]

	._patroller_alarm_check
		ld  a, (_alarm)
		or  a
		jr  z, _patroller_no_alarm

	._patroller_alarm
		ld  a, (__en_x)
		ld  d, a
		ld  a, (_gpx)
		cp  d
		jr  nc, _patroller_alarm_set_facing_right

	._patroller_alarm_set_facing_left
		ld  a, 2
		jr  _patroller_alarm_set_facing

	._patroller_alarm_set_facing_right
		xor a

	._patroller_alarm_set_facing
		ld  (hl), a 						// hl -> en_an_facing [enit]
		jr _patroller_alarm_check_done

	._patroller_no_alarm
		ld  a, (__en_mx)
		cp  1
		jr  z, _patroller_no_alarm_set_facing_right
		cp  -1
		jr  nz, _patroller_no_alarm_set_facing_done
	
	._patroller_no_alarm_set_facing_left
		ld  a, 2
		jr  _patroller_no_alarm_set_facing

	._patroller_no_alarm_set_facing_right
		xor a

	._patroller_no_alarm_set_facing
		ld  (hl), a 						// hl -> en_an_facing [enit]

	._patroller_no_alarm_set_facing_done

		ld  hl, _en_an_walk_ct
		add hl, bc
		ld  a, (hl)
		or  a
		jr  nz, _patroller_set_direction_count_done

	._patroller_set_direction_count
		push hl
		push bc 							// _rand will destroy everything!
		
		call _rand

		ld  a, l
		and 7
		ld  e, a
		ld  d, 0
		ld  hl, _en_directions
		add hl, de
		ld  a, (hl)
		ld  (__en_mx), a

		call _rand
		ld  a, l
		and 3
		inc a 
		sla a
		sla a
		sla a
		sla a

		pop bc 								// retrieve our index
		pop hl 								// retrieve HL -> en_an_walk_ct [enit]

	._patroller_set_direction_count_done

	._patroller_move
		dec a 								// A = en_an_walk_ct [enit]
		ld  (hl), a

		ld  a, (__en_x)
		ld  (_rdx), a

	._patroller_bg_collision

		// Collision is VERY simple as patrollers don't move vertically
		// and horizontal movement is constant (no acceleration)

		push bc

		lf  a, (__en_mx)
		or  a
		jr  z, _patroller_bg_collision_done

		ld  a, (__en_x)
		ld  d, a
		sla a
		sla a
		sla a
		sla a
		ld  (_en_xx), a
		
		ld  a, (__en_y)
		sla a
		sla a
		sla a
		sla a
		ld  (_en_yy), a

		// Tile aligned horizontally?
		ld  a, d 
		and 15
		jr  nz, _patroller_advance

		// Floor to walk, no obstacles?
		// (attr (en_xx, en_yy + 1) & 12) checks floor

		ld  a, (_en_xx)
		ld  c, a
		ld  a, (_en_yy)
		inc a
		call _attr_enems
		ld  a, l
		and 12
		jr  z, _patroller_turn_around

		// (attr (en_xx, en_yy) & 12) == 0 checks obstacles
		ld  a, (_en_xx)
		ld  c, a
		ld  a, (_en_yy)
		call _attr_enems
		ld  a, l
		and 12
		jr  nz, _patroller_turn_around

	._patroller_advance
		ld  a, (__en_mx)
		ld  c, a
		ld  a, (__en_x)
		add c
		ld  (__en_x), a
		jr  _patroller_bg_collision_done

	._patroller_turn_around
		ld  a, (__en_mx)
		neg
		ld  (__en_mx), a

	._patroller_bg_collision_done
		pop bc

	._patroller_alarm_check_done

		ld  a, (_rdx)
		ld  d, a 
		ld  a, (__en_x)
		cp  d 
		jr  nz, _patroller_set_frame_walking

	._patroller_set_frame_idle
		xor a 
		jr  _patroller_set_frame

	._patroller_set_frame_idle
		srl a 
		srl a
		srl a
		and 1 

	._patroller_set_frame 
		ld  (_rdd), a 
		push bc
#endasm
en_an_next_frame [enit] = patrullero_cells [en_an_facing [enit] + rdd];
#asm

		// I can see you!

	._patroller_sees_player
		xor a 
		ld  (_rdi), a 
		call _player_hidden
		ld  a, l
		ld  (_gpit), a

		pop bc

		ld  hl, _en_an_facing
		add hl, bc 
		ld  e, (hl) 						// e = en_an_facing [enit]

		// Rather arbitrary vertical range !
		// (gpy + 41 >= _en_y && _en_y + 27 = gpy)
		ld  a, (__en_y)
		ld  d, a 
		ld  a, (_gpy)
		add 41
		cp  d
		jr  c, _patroller_sees_player_done

		ld  a, (_gpy)
		ld  d, a 
		ld  a, (__en_y)
		add 27
		cp  d
		jr  c, _patroller_sees_player_done

	._patroller_check_right
		// Enemy facing right, player to the right,

		// en_an_facing [enit] == 0
		xor a 
		or  e 
		jr  nz, _patroller_check_left

		// gpx >= _en_x + 15
		ld  a, (__en_x)
		add 15
		ld  d, a 
		ld  a, (_gpx)
		cp  d 
		jr  c, _patroller_check_left 

		// If not hidden or too close: gotcha!

		// gpit == 0
		ld  a, (_gpit)
		or  a 
		jr  z, _patroller_saw_you 

		// gpx < _en_x + 32
		ld  a, (__en_x)
		add 32 
		ld  d, a 
		ld  a, (_gpx)
		cp  d
		jr  nc, _patroller_sees_player_done
		jr  _patroller_saw_you

	._patroller_check_left
		// Enemy facing left, player to the left

		// en_an_facing [enit]
		xor a
		or  e 
		jr  z, _patroller_sees_player_done

		// _en_x - 15 >= gpx
		ld  a, (_gpx)
		ld  d, a 
		ld  a, (__en_x)
		sub 15
		cp  d
		jr  c, _patroller_sees_player_done

		// If not hidden or too close: gotcha!

		// gpit == 0
		ld  a, (_gpit)
		or  a 
		jr  z, _patroller_saw_you 

		// _en_x < gpx + 16
		ld  a, (_gpx)
		add 16
		ld  d, a 
		ld  a, (__en_x)
		cp  d 
		jr  nc, _patroller_sees_player_done

	._patroller_saw_you 
		ld  a, 1
		ld  (_rdi), a

	._patroller_sees_player_done 

	// ALARM!

		ld  a, (_rdi)
		or  a 
		jr  z, _patroller_not_alarm

		ld  a, (__en_x)
		add 4 
		ld  (_alarm_x), a 

		ld  a, (__en_y)
		sub 8 
		ld  (_alarm_y), a 

		ld  a, 1
		ld  (_noticed), a

	._patroller_not_alarm

#endasm	
