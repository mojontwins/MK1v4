		#asm
				ld  a, (_n_pant)
				cp  0
				jp  z, room_00
				cp  1
				jr  z, room_01
				cp  5
				jr  z, room_05
				cp  12
				jr  z, room_12
				cp  17
				jr  z, room_17
				cp  24
				jr  z, room_24
				cp  28
				jr  z, room_28
				ret

			.no_interact_and_ret
				xor a 
				ld  (_interact_flag), a 
				ret


			.interact_and_ret
				ld  a, 1
				ld  (_interact_flag), a 
				ret


		// ********************************************************************
			.room_00
				// GANDALF

				ld  a, 2*16
				ld  (__x), a 
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, (_interact_flag) 
				or  a
				ret  nz

			// if (gandalf_talk == 1 && player.objs < 13) {
				ld  a, (_gandalf_talk)
				cp  1 
				jr  nz, int_gandalf_t1_done

				ld  a, (_player+27)		// player.objs
				cp  13
				jr  nc, int_gandalf_t1_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 7
				ld  (_rda), a
				call show_text_box

			.int_gandalf_t1_done

			// if (gandalf_talk == 0)
				ld  a, (_gandalf_talk)
				or  a
				jr  nz, int_gandalf_t2_done

				ld  hl, cuts0
				call run_cutscene

				ld  a, 1
				ld  (_gandalf_talk), a 

				// Reset this to reuse as dwarf name pointer
				xor a
				ld  (_dwarf_ct), a

				// But first, fire up comecocos #0
				ld  (_rda), a
				call _launch_comecocos_screen
				ld  a, 65
				ld  (_cocos_count), a 
				ld  a, 1 
				ld  (_rda), a
				call _update_mission

			.int_gandalf_t2_done

			// if (gandalf_talk == 2) {
				ld  a, (_gandalf_talk)
				cp  2
				jr  nz, int_gandalf_t3_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 8
				ld  (_rda), a
				call _show_text_box

			.int_gandalf_t3_done

			// if (player.objs == 13 && gandalf_talk == 1) {
				ld  a, (_gandalf_talk)
				cp  1
				jr  nz, int_gandalf_t4_done

				ld  a, (_player+27) 		// player.objs
				cp  13
				jr  nz, int_gandalf_t4_done

				ld  a, 46
				ld  (_rdb), a 
				ld  a, 18
				ld  (_rda), a 
				call _show_text_box

				ld  a, 2 
				ld  (_gandalf_talk), a 
				xor a 
				ld  (_player+27), a 		// player.objs

				ld  a, 1
				ld  (_rda), a 
				call _launch_comecocos_screen
				ld  a, 65
				ld  (_cocos_count), a

				ld  a, 2 
				ld  (_rda), a 
				call _update_mission

			.int_gandalf_t4_done
				jp interact_and_ret

		// ********************************************************************
			.room_01
				
				// Moto seminueva
				ld  a, (_gpx)
	
				// if (gpx > 48 && gpx < 88 && gpy < 32) {

				// gpx > 48 -> gpx >= 49
				cp  49 
				jp  c, no_interact_and_ret			

				// gpx < 88
				cp  88
				jp  nc, no_interact_and_ret

				// gpy < 32
				ld  a, (_gpy)
				cp  32
				jp  nc, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz 

				ld  a, 35
				ld  (_rdb), a 
				ld  a, 10
				ld  (_rda), a 
				call _show_text_box		

				jp  interact_and_ret

		// ********************************************************************
			.room_05
				
				// Smaug / Charmander

				// if (gpx < 12*16) {
				ld  a, (_gpx)
				cp  12*16
				ret nc

				ld  a, (_smaug_talk)
				or  a
				ret nz 

				ld  hl, cuts4
				call run_cutscene

				// *********** POKEMON ****************
				/*
				saca_a_todo_el_mundo_de_aqui ();
				wyz_play_music (6); 		// Pokemon
				pokemon_combat ();
				wyz_play_music (3); 		// Cave

				if(pk_win) {
					game_loop_flag = 1;

				} else {
					// If lose -> one life less, throw right	
					on_pant = 0xff;						
					player.vx = 256;
					player.is_dead = 1;
				}
				*/

				ret

		// ********************************************************************
			.room_12

				// Gallumb gets angry!
				ld  a, (_gallumb_flag)
				cp  1 
				ret nz

				ld  a, 7*16
				ld  (__x), a 
				ld  a, 9*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  a, 33
				ld  (_rdb), a
				ld  a, 29
				ld  (_rda), a
				call _show_text_box

				ld  a, 2
				ld  (_gallumb_flag), 2 
				ld  a, 4 
				ld  (_rda), a 
				call _update_mission

				jp  interact_and_ret

		// ********************************************************************
			.room17

				// Sonia la momia
				ld  a, (_sonia_talk)
				or  a 
				ret nz 

				ld  a, 12*16
				ld  (__x), a 
				ld  a, 3*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  hl, cuts1 
				call run_cutscene 

				ld  a, 2
				ld  (_rda), a 
				call _launch_comecocos_screen 

				ld  a, 65
				ld  (_cocos_count), a 

				ld  a, 1
				ld  (_sonia_talk), a

				jp  interact_and_ret

		// ********************************************************************
			.room24

				// Enano en la cueva
				ld  a, (_dwarf_talk)
				or  a 
				ret nz 

				ld  a, 9*16
				ld  (__x), a 
				ld  a, 7*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, (_interact_flag)
				or  a
				ret nz

				ld  hl, cuts2
				call run_cutscene 

				ld  a, 1
				ld  (_dwarf_talk), a 

				ld  a, 3
				ld  (_gandalf_talk), a 

				ld  a, 0xff 
				ld  (_on_pant), a 

				#endasm 
				wyz_play_music (3);
				#asm

				jp  interact_and_ret

		// ********************************************************************
			.room28

				// Amador
				ld  a, (_amador_talk)
				or  a  
				ret nz 

				ld  a, 8*16
				ld  (__x), a 
				ld  a, 6*16
				ld  (__y), a 
				call _touch_tile
				ld  a, l
				or  a
				jr  z, no_interact_and_ret

				ld  a, 42
				ld  (_rda), a 
				ld  a, 26
				ld  (_rdb), a 
				call _show_text_box 

				ld  a, 1 
				ld  (_amador_talk), a 

				ld  a, 0xff 
				ld  (_on_pant), a 

				xor a 
				ld  (_rda), a 
				call _update_mission
		#endasm