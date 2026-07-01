// MTE MK1 v3.2
// Copyleft 2011, 2026 by The Mojon Twins

#ifdef PLAYER_CUSTOM_VENG

	#define PLAYER_MAX_VSWIM		112
	#define PLAYER_ASWIM			40
	#define PLAYER_AFLOAT 			8

	#define PLAYER_G_JUMPING 		16
	#define PLAYER_VY_JUMP_INITIAL 	384
	#define PLAYER_VY_JUMP_STEPS 	8
	#define PLAYER_VY_JUMP_RELEASE 	192

	void player_custom_veng (void) {
		// Modify vy as needed

		// For this game, we use the normal sideways jumping engine if n_pant < 40,
		// and a new, custom one for 40<=n_pant<60.

		#asm
		
			ld  a, (_n_pant)
			cp  40
			jr  c, player_movement_ninnin

			cp  60
			jp  c, player_movement_dx_swim

			//
			// Vanilla Nin Nin! Engine!
			//

			.player_movement_ninnin

			// Jump down platform
				
				ld  a, (_player + 26) 		// player.possee
				or  a
				jr  z, m_vert_jump_down_done

				ld  a, (_pad0)
				and sp_DOWN
				ld  a, 0
				jr  nz, m_vert_jump_down_done

				ld  hl, PLAYER_VY_INICIAL_SALTO*2
				ld  (_player + 8), hl 		// player.vy

				inc a

			.m_vert_jump_down_done
				ld  (_disable_collide_platform), a
	
			// Gravity is reduced while jumping

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
		
			// Jumping is a big boost

			.player_jump_start
				ld  a, (_pad_this_frame)
				and #(sp_UP | sp_FIRE)
				cp  #(sp_UP | sp_FIRE)
				jr  z, player_jump_start_done

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
		
				ld  l, 3 
				call _peta_el_beeper

			.player_jump_start_done

			.player_jump_pressing
				ld  a, (_pad0) 
				and #(sp_UP | sp_FIRE)
				cp  #(sp_UP | sp_FIRE)
				jr  z, player_jump_not_pressing 

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

				ret

			//
			// DX Swim
			//

			.player_movement_dx_swim

			.swim_check_idle
				ld  a, (_pad0)
				and #(sp_DOWN | sp_UP)
				cp  #(sp_DOWN | sp_UP)
				jr  nz, swim_no_idle

				//if(player.y > 512) -> MSB >= 2
				ld  hl, (_player + 2)		// player.y
				ld  a, h 
				cp  2 
				jr  c, swim_float_end

				ld  hl, (_player + 8) 		// player.vy

				ld  de, #(-PLAYER_AFLOAT);
				add hl, de 

				//if (player.vy < (PLAYER_MAX_VSWIM >> 1)) ->
				//if (PLAYER_MAX_VSWIM >> 1) > player.vy
				ld  de, #(PLAYER_MAX_VSWIM * 2)
				call l_gt 						// C if DE > HL
				jr  nc, swim_float_vy_set

				ld  hl, #(-(PLAYER_MAX_VSWIM / 2))

			.swim_float_vy_set
				ld  (_player + 8), hl

			.swim_float_end
				xor a
				ld  (_thrusting), a

			.swim_no_idle

				ld  a, (_pad0)
				and sp_DOWN 
				jr  nz, swim_down_done

			.swim_down
				ld  hl, (_player + 8)
				// if (player.vy < PLAYER_MAX_VSWIM) -> PLAYER_MAX_VSWIM > player.vy)
				ld  de, PLAYER_MAX_VSWIM 
				call l_gt 						// C if DE > HL
				jr  nc, swim_down_done

				ld  de, PLAYER_ASWIM
				add hl, de 
				ld  (_player + 8), hl

			.swim_down_done

				ld  a, (_pad0)
				and sp_UP
				jr  nz, swim_up_done

			.swim_up
				ld  hl, (_player + 8)
				// if (player.vy > -PLAYER_MAX_VSWIM) -> -PLAYER_MAX_VSWIM < player.vy)
				ld  de, #(-PLAYER_MAX_VSWIM)
				call l_lt 						// C if DE < HL
				jr  nc, swim_up_done

				ld  de, #(-PLAYER_ASWIM)
				add hl, de 
				ld  (_player + 8), hl

			.swim_up_done
		#endasm

	}
#endif

#ifdef PLAYER_CUSTOM_HENG
	void player_custom_heng (void) {
		// Modify vx as needed
	}
#endif

#ifdef PLAYER_CUSTOM_FRAME
	unsigned char player_custom_frame (void) {
		// Return a frame NUMBER (0-7)

		#asm 
				ld  a, (_n_pant)
				cp  40
				jr  c, _player_custom_frame_walk

				cp  60
				jp  c, _player_custom_frame_swim

			._player_custom_frame_walk
	
				ld  c, 3 
				
				// if player.possee == 0 && player.gotten == 0
				ld  a, (_player + 26) 		// player.possee 
				ld  b, a 
				ld  a, (_player + 25) 		// player.gotten 
				or  b
				jr  z, m_frame_set

			.m_frame_on_something

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_still 		// Not thrusting -> still

				ld  hl, (_player + 6) 		// player.vx
				ld  a, h 
				or  l 
				jr  z, m_frame_still 		// Not moving -> still

				ld  a, (_gpx)
				srl a 
				srl a 
				srl a 

				and 3 
				ld  h, 0 
				ld  l, a 
				ld  de, _player_walk_cycle 
				add hl, de 
				ld  c, (hl)

				jr  m_frame_set

			.m_frame_still
				ld  c, 1

			.m_frame_set
				ld  a, (_player + 22) 		// player.facing
				add c
				ld  l, a 		
				ld  h, 0
				ret

			._player_custom_frame_swim

				ld  c, 8

				ld  a, (_thrusting)
				or  a 
				jr  z, m_frame_set 			// Not thrusting -> still

				ld  a, (_maincounter)
				srl a
				srl a
				srl a 
				and 3

				ld  h, 0 
				ld  l, a 
				ld  de, _player_walk_cycle 
				add hl, de 
				ld  a, (hl)
				add c
				ld  c, a 

				jr  m_frame_set
		#endasm
	}
#endif

#ifdef PLAYER_CUSTOM_BG_HIT
	unsigned char custom_bg_hit (void) {
		// check hit_v, hit_h and modify player.x / player.y as you need
		// Return 1 if hit registered

		// Special hit handling:
		// Jump'n'run you can only pinch if falling.
		// Swimming normal top view pinch.

		#asm
				ld  hl, 0 
				ld  a, (_n_pant)
				cp  40
				jr  c, _player_custom_pinch_walk

				cp  60
				jp  c, _player_custom_pinch_swim

			._player_custom_pinch_walk

			// Only check hit_v

				ld  a, (_hit_v)
				or  a 
				ret z 

				ld  hl, #(-(PLAYER_MAX_VY_SALTANDO / 2))
				ld  (_player + 8), hl 		// player.vy

				ld  hl, 1 
				ret

			._player_custom_pinch_swim

			// Max velocity component takes precedence

				ld  a, (_hit_v)
				ld  c, a 
				ld  a, (_hit_h)
				or  c 
				ret z
	
			.m_evil_tile_hit_do
				ld  a, (_rdi) 
				or  a
				jr  z, m_evil_tile_hit_v

			.m_evil_tile_hit_h
				ld  hl, (_pvx_total)
				call l_neg 
				ld  (_player + 6), hl 		// player.vx

				ld  hl, 1
				ret

			.m_evil_tile_hit_v
				ld  hl, (_pvy_total)
				call l_neg 
				ld  (_player + 8), hl 		// player.vy
				
				ld  hl, 1
				ret

		#endasm
	}
#endif

#ifdef ENABLE_CUSTOM_ENEMS

	void extra_enems_init (void) {
		// Runs for each enemy when entering a new screen. You should check _en_t
		// Current malote is malotes [enoffsmasi], iterator is enit
		//if (_en_t >= 5  && _en_t < 8)  {
		//	enems_en_an_calc (_en_t - 1);
		//}
		#asm
				ld  a, (__en_t)
				cp  5 
				ret c 
				cp  9
				ret nc 
				ld  h, 0
				ld  l, a 
				dec hl
				jp _enems_en_an_calc
		#endasm
	}

	void extra_enems_move (void) {
		// Check _en_t and update your custom enemies. When you are finished. 
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// write a proper frame pointer to en_an_next_frame
		#asm 
			// if (_en_t >= 5 && _en_t < 8) {

				ld  a, (__en_t)
				cp  5 
				ret c 
				cp  8
				ret nc 

				call en_lineal_do
			
				ld  a, (__en_t)
				cp  7 
				ret nz 

				// if (_en_mx < 0 || _en_my < 0) {
				ld  a, (__en_mx) 
				bit 7, a 
				jr  nz, enm_turn_around 
				ld  a, (__en_my)
				bit 7, a 
				ret z

			.enm_turn_around 
				ld  a, (_enit)
				sla a
				ld  b, 0
				ld  c, a
				ld  hl, _en_an_next_frame
				add hl, bc
			
				push hl 		// en_an_next_frame [enit]
				
				ld  bc, (_enit)
				ld  b, 0
				
				ld  hl, _en_an_frame
				add hl, bc
				ld  a, (hl)

				ld  hl, _en_an_base_frame
				add hl, bc
				add a, (hl)
				add 2 			// + 2

				sla a 			// This will work in 8 bit. Always few frames max.			
				ld  c, a 		// B is already 0
				ld  hl, _sprite_cells

				add hl, bc 		// HL -> sprite_cells [...]
				pop de 			// DE -> en_an_next_frame [enit]

				ldi
				ldi
		#endasm
	}

	void extra_enems_checks (void) {
		// This is called at the end of the enems update loop, after collisions
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
		// with player or bullets have been tested.
	}

	void extra_enems_killed (void) {
		// This is called after enem number enit is killed.
		// _en_t has been already "marked as dead" (OR 128)
		// Current enemy vars are copied to temporary _en_x, _en_y, etc
	}

	unsigned char this_enemy_kills (void) {
		// return 0 for enemies which shouldn't collide.
		// Collide means they will kill the player or get squashed.

		return 1;
	}

#endif

#ifdef ENABLE_CUSTOM_HOTSPOTS
	unsigned char custom_hotspots() {
		// hotspot type is hotspot_t.
		// set rdi to prevent clearing the hotspot.
	}
#endif

// Extra stuff: Shiru's code to play samples
#ifndef CPC
	#asm
		;BeepFX player by Shiru
		;You are free to do whatever you want with this code

		.shiruplay
			ld hl,sfxData		;address of sound effects data

			di
			push ix
			push iy

			ld b,0
			ld c,a
			add hl,bc
			add hl,bc
			ld e,(hl)
			inc hl
			ld d,(hl)
			push de
			pop ix				;put it into ix

			xor a
			rra
			rra
			rra
			and 7
			ld (sfxRoutineToneBorder  +1),a
			ld (sfxRoutineNoiseBorder +1),a
			ld (sfxRoutineSampleBorder+1),a

		.readData
			ld a,(ix+0)			;read block type
			ld c,(ix+1)			;read duration 1
			ld b,(ix+2)
			ld e,(ix+3)			;read duration 2
			ld d,(ix+4)
			push de
			pop iy

			dec a
			jr z,sfxRoutineTone
			dec a
			jr z,sfxRoutineNoise
			dec a
			jr z,sfxRoutineSample
			pop iy
			pop ix
			ei
			ret

		;play sample

		.sfxRoutineSample
			ex de,hl
		.sfxRS0
			ld e,8				;7
			ld d,(hl)			;7
			inc hl				;6
		.sfxRS1
			ld a,(ix+5)			;19
		.sfxRS2
			dec a				;4
			jr nz,sfxRS2		;7/12
			rl d				;8
			sbc a,a				;4
			and 16				;7
			and 16				;7	dummy
		.sfxRoutineSampleBorder
			or 0				;7
			out (254),a			;11
			dec e				;4
			jp nz,sfxRS1		;10=88t
			dec bc				;6
			ld a,b				;4
			or c				;4
			jp nz,sfxRS0		;10=132t

			ld c,6
			
		.nextData
			add ix,bc		;skip to the next block
			jr readData

		;generate tone with many parameters

		.sfxRoutineTone
			ld e,(ix+5)			;freq
			ld d,(ix+6)
			ld a,(ix+9)			;duty
			ld (sfxRoutineToneDuty+1),a
			ld hl,0

		.sfxRT0
			push bc
			push iy
			pop bc
		.sfxRT1
			add hl,de			;11
			ld a,h				;4
		.sfxRoutineToneDuty
			cp 0				;7
			sbc a,a				;4
			and 16				;7
		.sfxRoutineToneBorder
			or 0				;7
			out (254),a			;11
			ld a,(0)			;13	dummy
			dec bc				;6
			ld a,b				;4
			or c				;4
			jp nz,sfxRT1		;10=88t

			ld a,(sfxRoutineToneDuty+1)	 ;duty change
			add a,(ix+10)
			ld (sfxRoutineToneDuty+1),a

			ld c,(ix+7)			;slide
			ld b,(ix+8)
			ex de,hl
			add hl,bc
			ex de,hl

			pop bc
			dec bc
			ld a,b
			or c
			jr nz,sfxRT0

			ld c,11
			jr nextData

		;generate noise with two parameters

		.sfxRoutineNoise
			ld e,(ix+5)			;pitch

			ld d,1
			ld h,d
			ld l,d
		.sfxRN0
			push bc
			push iy
			pop bc
		.sfxRN1
			ld a,(hl)			;7
			and 16				;7
		.sfxRoutineNoiseBorder
			or 0				;7
			out (254),a			;11
			dec d				;4
			jp z,sfxRN2			;10
			nop					;4	dummy
			jp sfxRN3			;10	dummy
		.sfxRN2
			ld d,e				;4
			inc hl				;6
			ld a,h				;4
			and 31				;7
			ld h,a				;4
			ld a,(0)			;13 dummy
		.sfxRN3
			nop					;4	dummy
			dec bc				;6
			ld a,b				;4
			or c				;4
			jp nz,sfxRN1		;10=88 or 112t

			ld a,e
			add a,(ix+6)		;slide
			ld e,a

			pop bc
			dec bc
			ld a,b
			or c
			jr nz,sfxRN0

			ld c,7
			jr nextData

		.sfxData

		.SoundEffectsData
			defw SoundEffect0Data
			defw SoundEffect1Data

		.SoundEffect0Data
			defb 3 ;sample
			defw 740
			defw Sample0Data+0
			defb 39
			defb 0
		.SoundEffect1Data
			defb 3 ;sample
			defw 1043
			defw Sample1Data+0
			defb 33
			defb 0

		.Sample0Data
			defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
			defb 255,255,255,255,255,255,255,255,255,255,255,255,255,253,223,255
			defb 255,255,251,253,255,122,215,239,253,253,95,251,253,127,253,127
			defb 255,255,245,235,245,127,253,255,247,255,239,127,250,255,125,87
			defb 255,122,254,165,191,94,87,213,222,181,214,255,107,127,234,191
			defb 239,235,127,245,255,181,181,173,95,125,173,191,45,95,237,191
			defb 237,254,250,218,215,181,191,237,47,222,191,171,126,183,178,223
			defb 87,93,150,214,219,255,191,182,223,255,5,255,101,167,187,224
			defb 239,31,15,248,7,249,32,254,3,254,12,63,192,63,233,127
			defb 63,240,31,169,234,95,224,63,169,3,254,1,255,104,31,240
			defb 15,235,64,127,128,63,173,3,255,1,255,24,15,254,3,254
			defb 52,15,252,3,250,26,135,254,1,254,143,67,255,0,255,129
			defb 240,127,224,63,240,124,15,244,7,252,7,225,255,64,255,193
			defb 126,31,248,15,254,23,193,254,129,255,213,248,31,240,15,252
			defb 171,192,255,128,255,235,220,31,248,15,253,254,128,255,0,255
			defb 252,15,255,15,255,255,255,255,255,255,255,254,159,255,232,119
			defb 248,31,224,255,199,127,160,63,224,7,255,128,63,240,15,31
			defb 240,1,254,7,135,236,120,63,15,131,251,254,15,135,131,237
			defb 223,7,199,135,206,207,135,195,195,231,227,227,225,225,231,187
			defb 227,227,225,227,187,225,241,225,243,241,241,248,248,255,59,225
			defb 248,248,127,167,193,248,127,31,255,195,255,143,255,255,129,255
			defb 135,255,255,131,255,135,255,254,15,254,7,255,240,127,240,31
			defb 255,7,255,1,255,224,255,192,127,240,126,15,63,192,252,62
			defb 127,131,240,241,252,31,15,159,193,240,241,252,63,30,31,131
			defb 227,225,248,126,124,63,15,199,143,225,241,241,252,126,60,63
			defb 15,135,135,193,240,240,248,62,15,252,15,248,255,240,254,15
			defb 252,63,231,255,159,241,255,71,255,255,31,255,255,15,255,255
			defb 15,251,254,15,255,252,31,255,240,63,255,192,253,255,3,247
			defb 220,63,62,225,125,247,31,207,48,254,251,143,207,129,248,248
			defb 63,31,7,225,240,252,126,31,143,131,225,240,124,62,15,143
			defb 195,225,240,124,126,31,31,199,143,241,227,204,113,230,56,113
			defb 142,56,199,28,115,143,25,199,140,243,199,121,227,184,225,252
			defb 241,252,120,254,120,222,120,222,60,111,60,111,60,63,30,63
			defb 158,55,158,55,142,27,143,27,207,27,199,15,199,141,231,141
			defb 227,140,227,140,243,198,113,199,57,231,60,243,28,115,158,113
			defb 142,57,143,57,199,159,199,207,225,231,248,243,248,121,252,30
			defb 126,7,127,3,189,137,223,228,103,242,51,249,29,221,131,255
			defb 193,223,240,55,252,14,255,131,191,226,110,252,77,191,19,183
			defb 226,126,252,7,255,192,127,248,7,255,128,127,248,7,255,192
			defb 126,252,19,247,228,159,191,100,253,251,19,247,252,95,239,241
			defb 191,151,194,127,79,230,254,31,230,254,63,199,255,63,225,255
			defb 15,244,255,131,252,63,224,255,39,248,63,193,255,7,252,31
			defb 240,127,193,255,131,252,15,248,31,224,63,224,127,192,255,192
			defb 255,129,255,192,255,192,255,192,127,248,31,252,31,255,243,255
			defb 246,255,255,255,255,242,255,255,255,159,255,31,255,255,255,255
			defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
			defb 255,255,255,253

		.Sample1Data
			defb 255,255,255,255,255,255,255,250,239,131,248,7,254,7,255,15
			defb 225,255,240,15,255,255,193,255,5,255,248,255,0,0,31,255
			defb 255,255,225,254,0,128,127,255,247,254,31,192,0,15,255,255
			defb 255,240,63,0,120,31,255,255,255,192,252,3,224,255,255,255
			defb 255,131,240,7,195,255,255,255,255,1,240,7,195,255,255,255
			defb 255,7,224,15,7,255,255,255,255,7,255,252,0,0,127,255
			defb 255,255,191,224,2,3,255,255,255,255,254,0,32,63,255,255
			defb 255,63,224,2,1,255,255,255,247,254,0,0,31,255,255,255
			defb 191,240,0,1,255,255,255,255,255,128,4,7,255,255,255,247
			defb 254,0,32,63,255,255,191,143,248,0,241,255,255,255,252,63
			defb 224,3,79,255,255,255,255,128,160,0,183,255,255,255,255,255
			defb 7,240,0,63,255,255,255,255,192,126,0,3,255,255,225,254
			defb 7,255,248,0,255,255,255,223,255,193,254,0,31,255,255,255
			defb 254,15,240,3,247,255,246,255,135,254,0,224,63,243,255,131
			defb 254,1,224,63,249,255,193,255,0,240,31,253,255,225,255,0
			defb 240,31,251,255,193,255,1,240,31,243,255,131,254,1,224,63
			defb 201,255,7,252,1,224,63,207,254,127,240,0,1,255,255,255
			defb 255,255,128,0,63,255,255,255,255,255,128,63,255,255,255,255
			defb 255,240,0,31,255,255,255,255,255,255,255,255,255,255,255,255
			defb 255,255,255,255,255,255,255,191,247,230,191,230,255,191,227,252
			defb 239,255,254,128,31,143,255,193,255,243,255,255,252,0,7,254
			defb 63,7,252,224,124,231,224,127,129,224,255,31,3,252,127,15
			defb 176,252,63,231,224,251,143,131,248,124,31,97,240,255,31,15
			defb 220,124,63,159,193,230,62,31,255,224,55,62,15,255,226,39
			defb 60,31,255,198,12,120,31,255,60,25,224,127,252,228,7,129
			defb 255,227,240,30,7,255,31,192,120,31,248,63,3,192,255,224
			defb 248,15,193,255,131,240,31,135,255,7,224,63,7,254,7,128
			defb 31,255,255,128,0,55,254,255,248,0,3,255,255,255,192,1
			defb 255,255,255,255,64,0,255,255,255,255,128,31,255,255,255,255
			defb 255,254,0,0,15,255,255,255,255,255,255,255,255,156,255,255
			defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,240,255
			defb 240,71,255,255,252,0,15,195,252,255,224,124,31,240,7,131
			defb 255,7,248,255,240,255,193,254,63,60,127,193,254,31,128,255
			defb 193,252,31,193,255,7,248,127,241,248,63,131,255,31,7,251
			defb 199,227,193,249,241,241,225,248,241,248,1,248,241,248,3,240
			defb 255,240,31,192,127,128,254,7,252,7,240,127,192,127,3,252
			defb 15,224,127,128,254,15,240,31,193,254,7,240,127,192,252,31
			defb 240,127,7,248,63,131,252,15,193,252,15,193,252,15,225,248
			defb 31,227,255,240,127,129,254,15,248,63,193,255,3,252,31,248
			defb 31,224,255,193,254,7,254,15,248,63,240,127,225,255,129,255
			defb 7,254,15,252,63,248,63,240,255,192,255,131,255,7,254,31
			defb 252,15,248,63,240,127,224,255,192,255,131,255,129,255,7,255
			defb 3,254,15,254,7,254,15,254,7,254,31,254,7,254,15,255
			defb 7,255,7,247,129,255,193,252,32,127,248,127,199,159,255,255
			defb 255,253,255,255,255,243,254,127,255,184,239,220,255,204,127,158
			defb 35,254,3,252,120,223,252,7,216,255,191,252,15,192,255,255
			defb 255,227,255,255,255,255,255,255,255,255,255,255,255,254,127,199
			defb 255,129,114,31,255,255,192,156,255,255,255,252,0,255,255,255
			defb 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
			defb 255,255,255,255,255,255,255,255,255,255,191,111,255,255,255,255
			defb 255,127,251,255,255,255,192,127,248,15,248,3,255,0,255,192
			defb 127,248,31,252,7,255,1,255,224,31,248,31,255,128,255,192
			defb 126,254,3,255,1,251,248,7,254,3,247,244,15,252,7,230
			defb 248,15,248,7,231,248,31,248,7,246,252,15,252,3,242,252
			defb 7,254,1,251,126,7,255,0,254,223,129,255,128,127,127,224
			defb 127,224,31,205,248,31,252,3,253,127,3,255,128,255,39,224
			defb 127,240,15,242,252,7,255,0,255,7,224,63,240,15,252,63
			defb 129,255,192,63,224,252,7,255,1,254,131,248,31,252,3,252
			defb 15,224,127,248,7,240,31,248,1,254,15,254,143,243,255,128
			defb 15,240,127,240,127,223,254,0,127,131,255,195,254,255,240,1
			defb 254,15,254,15,255,255,192,7,252,127,248,63,207,255,0,31
			defb 224,255,224,255,191,252,0,127,195,255,193,254,127,248,0,255
			defb 135,255,193,254,255,248,1,255,7,255,131,254,127,240,1,255
			defb 7,255,193,255,63,252,1,255,195,255,192,255,199,255,0,63
			defb 248,255,252,127,248,127,224,3,255,159,255,207,255,239,255,0
			defb 15,255,253
	#endasm
#endif