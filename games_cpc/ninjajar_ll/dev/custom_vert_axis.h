#define PLAYER_G_JUMPING 		8
#define PLAYER_AY_SWIM          16
#define PLAYER_VY_SWIM_MAX      256
#define PLAYER_VY_JUMP_INITIAL 	512
#define PLAYER_VY_JUMP_STEPS 	16
#define PLAYER_VY_JUMP_RELEASE 	96

// Swim or gravity
#ifdef ENABLE_SWIMMING
	if (pswimming) {

	} else
#endif
{
	// Gravity is reduced while jumping
	player.vy = player.vy + player.jumping ? PLAYER_G_JUMPING : PLAYER_G;
	if (player.vy >= PLAYER_MAX_VY_CAYENDO) {
		player.vy = PLAYER_MAX_VY_CAYENDO;
	}

	// Jumping is a big boost
	if ((pad_this_frame & sp_UP) == 0 && player.jumping == 0) {
		if (player.possee || player.gotten) {
			player.saltando = 1;
			player.just_jumped = 1;
			player.cont_salto = 0;
			player.vy = -PLAYER_VY_INICIAL_SALTO;
			play_sfx (1);
		}
	}

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
}
