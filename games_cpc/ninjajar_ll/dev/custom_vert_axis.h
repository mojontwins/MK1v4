#define PLAYER_G_JUMPING 		32
#define PLAYER_AY_SWIM          16
#define PLAYER_VY_SWIM_MAX      256
#define PLAYER_VY_JUMP_INITIAL 	384
#define PLAYER_VY_JUMP_STEPS 	8
#define PLAYER_VY_JUMP_RELEASE 	192

// Swim or gravity
#ifdef ENABLE_SWIMMING
	if (pswimming) {

	} else
#endif
{
	// Gravity is reduced while jumping
	/*
	player.vy = player.vy + (player.saltando ? PLAYER_G_JUMPING : PLAYER_G);
	if (player.vy >= PLAYER_MAX_VY_CAYENDO) {
		player.vy = PLAYER_MAX_VY_CAYENDO;
	}
	*/

	#asm
		.player_veng_gravity

			// player.vy = player.vy + (player.saltando ? PLAYER_G_JUMPING : PLAYER_G);

			ld  hl, (_player + 8)			// player.vy
			ld  de, PLAYER_G

			ld  a, (_player + 19) 			// player.saltando
			or  a 
			jr  z, player_veng_gravity_add

			ld  de, PLAYER_G_JUMPING

		.player_veng_gravity_add
			add hl, de 
			push hl 						// New vy

			// Limit

			// player.vy >= PLAYER_MAX_VY_CAYENDO --->
			// player.vy - PLAYER_MAX_VY_CAYENDO >= 0
			ld  de, -PLAYER_MAX_VY_CAYENDO
			add hl, de 
			bit 7, h 
			pop hl  						// Retrieve vy
			jr  nz, player_veng_gravity_done 

			ld  hl, PLAYER_MAX_VY_CAYENDO

		.player_veng_gravity_done 
			ld  (_player + 8), hl
	#endasm


	// Jumping is a big boost
	/*
	if ((pad_this_frame & sp_UP) == 0 && player.saltando == 0) {
		if (player.possee || player.gotten) {
			player.saltando = 1;
			player.just_jumped = 1;
			player.cont_salto = 0;
			player.vy = -PLAYER_VY_JUMP_INITIAL;
			play_sfx (1);
		}
	}
	*/
	#asm
		.player_jump_start
			ld  a, (_pad_this_frame)
			and sp_UP 
			jr  nz, player_jump_start_done

			ld  a, (_player + 19) 			// player.saltando 
			or  a 
			jr  nz, player_jump_start_done

			ld  a, (_player + 26) 			// player.possee 
			or  a 
			jr  nz, player_jump_start_do

			ld  a, (_player + 25) 			// player.gotten
			or  a 
			jr  z, player_jump_start_done

		.player_jump_start_do
			xor a 
			ld  (_player + 14), a			// player.cont_salto
			inc a 
			ld  (_player + 19), a 			// player.saltando;
			ld  (_player + 43), a 			// player.just_jumped;
			ld  hl, -PLAYER_VY_JUMP_INITIAL
			ld  (_player + 8), hl 			// player.vy
	#endasm
	play_sfx (1);
	#asm

		.player_jump_start_done
	#endasm 

	/*
	if ((pad0 & sp_UP) == 0) {
		if (player.saltando) {
			player.cont_salto ++; 
			if (player.cont_salto == PLAYER_VY_JUMP_STEPS) {
				player.saltando = 0;
			}
		}
	} else {
		if (player.saltando) {
			if (player.vy < -PLAYER_VY_JUMP_RELEASE) 
				player.vy = -PLAYER_VY_JUMP_RELEASE;
		}
		player.saltando = 0;
	}
	*/

	#asm
		.player_jump_pressing
			ld  a, (_pad0) 
			and sp_UP 
			jr  nz, player_jump_not_pressing 

			ld  a, (_player + 19) 			// player.saltando
			or  a 
			jr  z, player_jump_done

			ld  a, (_player + 14)			// player.cont_salto 
			inc a 
			ld  (_player + 14), a 			// player.cont_salto 

			cp PLAYER_VY_JUMP_STEPS 
			jr  nz, player_jump_done

			xor a 
			ld  (_player + 19), a 			// player.saltando
			jr  player_jump_done

		.player_jump_not_pressing
			ld  a, (_player + 19) 			// player.saltando
			or  a 
			jr  z, player_jump_done 

			ld  hl, -PLAYER_VY_JUMP_RELEASE
			ld  (_player + 8), hl 			// player.vy

			xor a 
			ld  (_player + 19), a  			// player.saltando

		.player_jump_done
	#endasm
}
