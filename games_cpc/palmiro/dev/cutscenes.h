// cutscenes.h

// Animated cutscenes!

/*

	cut_pt will point to cutscene data to display. Cutscene data begins with 
	n_pant which is followed by a bunch of commands, and ends in 0xFF.

	The interpreter runs the current animation each frame as it reads new
	commands. There are several commands that pause the consumption of the
	data stream to allow the animation to play.

	Every frame, all actors on screen are updated, which means moving them 
	at speed MX MY from their current location X Y to their destination DX DY.

	In this version, 3 cells per actor are needed:

	- cell 0 is used if actor is not moving.
	- cells 0 1 0 2 are used if actor is moving horizontally
	- cell 1 is used if actor is moving up.
	- cell 2 is used if actor is moving down.

	Commands are made of an opcode followed by several byte-long parameters:

	$00 N        - Pauses stream reading for N frames.
	$01          - Pauses stream until all actors are stopped.
	$10 A X Y B  - Define actor A (0-3) at X, Y (pixel) with base cell B
	$11 A MX MY  - Define MX / MY for actor A in ppf. Negative means fpp
	$12 A DX DY  - Set DX / DY for actor A. This causes A to start moving
	$13 A        - Sets DX=X and DY=Y for A, which makes it stop
	$20 N        - Shows a text box with text N. (*)

	(*) This cutscene interpreter needs a Ramiro/Nomos compatible function
	`show_text_box (n)` function at `custom.h`.

	This cutscene interpreter needs a fancy cls routine `recuadrius ()` at
	`custom.h`.

*/

void show_text_box (unsigned char n); 	// Prototype. Define @ custom.h!
void recuadrius (void); 				// Prototype. Define @ custom.h!

unsigned char *cut_pt;
unsigned char org_n_pant = 0;

void run_cutscene (void) {
	// Show screen
	recuadrius ();
	org_n_pant = n_pant;
	n_pant = *cut_pt ++;
	on_pant = 0xff;

	// Try to code this in assembly directly
	#asm
		.run_cutscene_loop

			ld  hl, _cur_pt
			ld  a, (hl) 				// Consume a byte
			inc (hl) 					// Inc. pointer

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

			cp  0x20 					// Show text
			jp  z, _rc_show_text

		.run_cutscene_update

			// Wait VBLANK

			// Update sprites

			// Show stuff on screen

			jp run_cutscene_loop

		// Parser routines

		._rc_pause_n
			jp  run_cutscene_update 

		._rc_pause_stopped
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

		.run_cutscene_fin


	#endasm

	n_pant = org_n_pant;
	recuadrius ();
}
