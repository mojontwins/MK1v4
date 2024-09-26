// cutscenes.h

// Animated cutscenes!

/*

	cut_pt will point to cutscene data to display. Cutscene data begins with 
	n_pant which is followed by a bunch of commands, and ends in 0xFF.

	The interpreter runs the current animation each frame as it reads new
	commands. There are several commands that pause the consumption of the
	data stream to allow the animation to play.

	Every frame, all actors on screen are updated, which means moving them 
	at speed MX MY from their current location X Y to their destination at
	DX DY (**).

	In this version, 3 cells per actor are needed:

	- cell 0 is used if actor is not moving.
	- cells 0 1 0 2 are used if actor is moving horizontally
	- cell 1 is used if actor is moving up.
	- cell 2 is used if actor is moving down.

	Commands are made of an opcode followed by several byte-long parameters:

	$00 N        - Pauses stream reading for N frames.
	$01          - Pauses stream until all actors are stopped.
	$10 A X Y B F- Define actor A (0-3) at X, Y (pixel) with base cell B
	               if F is 1 then the actor may face left or right
	$11 A MX MY  - Define MX / MY for actor A in ppf. <0 means fpp (***)
	$12 A DX DY  - Set DX / DY for actor A. This causes A to start moving
	$13 A        - Sets DX=X and DY=Y for A, which makes it stop
	$14 A F      - Changes facing if player is stopped 
	$20 N        - Shows a text box with text N. (*)

	(*) This cutscene interpreter needs a Ramiro/Nomos compatible function
	`show_text_box (n)` function at `custom.h`.

	This cutscene interpreter needs a fancy cls routine `recuadrius ()` at
	`custom.h`.

	(**) Using the simplest implementation possible. Move X towards DX at 
	speed MX if X != DX, same for Y.  No further checks, if no $01 pause is
	specified and a $00 pause time passes, new commands will be read and
	movements may be overwritten, so design the streams with care.

	(***) Again, no checks. Actors may be overwritten. To turn an actor
	off define it again with Y >= 144.
*/

void show_text_box (unsigned char n); 	// Prototype. Define @ custom.h!
void recuadrius (void); 				// Prototype. Define @ custom.h!

unsigned char *cut_pt;
unsigned char org_n_pant = 0;

/*
	Actor data

	00 01 02 03 04 05 06 07
	 X  Y DX DY MX MY  B  F

	(X, Y) - coordinates
	(DX, DY) - destination
	(MX, MY) - speed
	B - base frame
	F - facing (0 left 3 right)

*/

extern unsigned char *actor_data;
#asm
	._actor_data
		defs 32
#endasm

unsigned char pause_counter;
unsigned char blocked; 

void run_cutscene (void) {
	// Show screen
	recuadrius ();
	org_n_pant = n_pant;
	n_pant = *cut_pt ++;
	on_pant = 0xff;

	sp_UpdateNow ();
	draw_scr_background ();

	// Setup
	pause_counter = 0;
	blocked = 0;

	#asm
		// Turns off all actors
			ld  b, 4
			ld  hl, _actor_data + 1 		// Means "Y"
			ld  a, 0xff
			ld  de, 8 
		.run_cutscene_off
			ld  (hl), a
			add hl, de  					// Add 8 for next actor
			djnz run_cutscene_off
	#endasm

	// Setup sprites. 

	// Try to code this in assembly directly
	#asm
		.run_cutscene_loop

			call run_consume_stream 	// Read byte to A

			cp  0xFF 					// EOC
			jp  z, run_cutscene_fin

			cp  0x00 					// Pause N
			jp  z, _rc_pause_n

			cp  0x01 					// Pause until stoped
			jp  z, _rc_pause_stopped

			cp  0x10 					// Define actor
			jp  z, _rc_actor_define

			cp  0x11 					// Actor set speed
			jp  z, _rc_actor_set_speed

			cp  0x12 					// Actor set destination
			jp  z, _rc_actor_set_destination

			cp  0x13 					// Actor stop
			jp  z, _rc_actor_stop

			cp  0x14  					// Change facing for A
			jp  z, _rc_actor_change_facing

			cp  0x20 					// Show text
			jp  z, _rc_show_text

		.run_cutscene_update

			// Update sprites
		
			// Wait VBLANK

			// Show stuff on screen

			// Continue if pause = 0 and blocked = 0
			ld  a, (_pause)
			xor a 
			jr  nz, run_cutscene_update

			ld  a, (_blocked)
			xor a 
			jr  nz, run_cutscene_update

			jp run_cutscene_loop

		.run_consume_stream
			ld  hl, _cur_pt
			ld  a, (hl) 				// Consume a byte
			inc (hl) 					// Inc. pointer
			ret

		// Parser routines

		._rc_pause_n
			call run_consume_stream
			ld  (_pause_counter), a

			jp  run_cutscene_update 

		._rc_pause_stopped
			ld  a, 1  
			ld  (_blocked), a

			// Check if all X = DX, Y = DY, set blocked to 0
			ld  hl, _actor_data 
			ld  b, 4 

		._rc_pause_stopped_check_loop
			ld  a, (hl)
			inc hl 
			ld  d, a 					// D = X
			ld  a, (hl)
			inc hl 
			ld  e, a 					// E = Y

			ld  a, (hl) 				// A = DX
			cp  d 						// X == DX?
			jp  nz, run_cutscene_update // Nope, keep blocked.

			ld  a, (hl)  				// A = DY
			cp  e  						// Y == DY?
			jp  nz, run_cutscene_update // Nope, keep blocked.

			inc hl
			inc hl
			inc hl
			inc hl

			djnz _rc_pause_stopped_check_loop

			// Still here? Then unblock
			xor a 
			ld  (_blocked), a

			jp  run_cutscene_update 

		._rc_actor_define
			jp  run_cutscene_update

		._rc_actor_set_speed
			jp  run_cutscene_update

		._rc_actor_set_destination
			jp  run_cutscene_update

		._rc_actor_stop
			jp  run_cutscene_update

		._rc_show_text
			jp  run_cutscene_update

		._rc_actor_change_facing
			jp  run_cutscene_update

		.run_cutscene_fin


	#endasm

	n_pant = org_n_pant;
	recuadrius ();
}
