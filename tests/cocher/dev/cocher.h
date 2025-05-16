// Cocher Engine for MK1vX v0.1.20250516
// Copyleft 2025 by The Mojon Twins

// Use motorlutgen.exe to produce this file

#include "motor_lut.h"

// Constants

#define FRICTION_NORMAL 	2
#define VINC_NORMAL 		8
#define VMAX_NORMAL 		15*16 			// A number 0..15 * 16, how deep in the LUT we can get
#define STEERING_V 			4

unsigned char cocher_friction;
unsigned char cocher_vinc;
unsigned char cocher_vmax;

unsigned char cocher_vr;
unsigned char cocher_ar;

unsigned char cocher_v;
unsigned char cocher_a;

// Hook these routines into your game

void cocher_get_lut_indexes (void) {

	// Prev: use center point detection to modify values
	// TODO
	cocher_friction = FRICTION_NORMAL;
	cocher_vinc = VINC_NORMAL;
	cocher_vmax = VMAX_NORMAL;

	// Accelerate / brake

	if ((pad0 & sp_UP) == 0) {
		if (cocher_vmax - cocher_vr > cocher_vinc) {
			cocher_vr += cocher_vinc; 
		} else {
			cocher_vr = cocher_vmax;
		}
	} else if ((pad0 & sp_DOWN) == 0) {
		if (cocher_vr > cocher_vinc) {
			cocher_vr -= cocher_vinc;
		} else {
			cocher_vr = 0;
		}
	} else {

		// Friction according to tile beh
		if (cocher_vr > cocher_friction) cocher_vr -= cocher_friction;
	}

	// Steer

	if ((pad0 & sp_LEFT) == 0) cocher_ar -= STEERING_V;

	if ((pad0 & sp_RIGHT) == 0) cocher_ar += STEERING_V;

	// Index LUTs
	cocher_v = cocher_vr & 0xf0;
	cocher_a = cocher_ar >> 4;

print_hex(0, 0, cocher_v);
print_hex(4, 0, cocher_a);
print_hex(8, 0, cocher_v | ((4 - cocher_a) & 15));

}

void cocher_vertical (void) {
	//player.vy = motor_lut [cocher_v | cocher_a];
		#asm
			ld  a, (_cocher_a)
			ld  b, a 
			ld  a, (_cocher_v)
			or  b 
			ld  h, 0
			ld  l, a
			add hl, hl  
			ld  bc, _motor_lut
			add hl, bc 
			ld  a, (hl)
			inc hl 
			ld  h, (hl)
			ld  l, a 
			ld  (_player + 8), hl 
	#endasm
}

void cocher_horizontal (void) {
	//player.vx = motor_lut [cocher_v | ((4 - cocher_a) & 15)];
	#asm
			ld  a, (_cocher_a)
			ld  b, a 
			ld  a, 4
			sub b 
			and 15
			ld  c, a 
			ld  a, (_cocher_v)
			or  c 
			ld  h, 0
			ld  l, a
			add hl, hl  
			ld  bc, _motor_lut
			add hl, bc 
			ld  a, (hl)
			inc hl 
			ld  h, (hl)
			ld  l, a 
			ld  (_player + 6), hl 
	#endasm

}

void cocher_bg_hit (void) {
	#asm
		.m_evil_tile_hit_do
			ld  a, (_wall)
			cp  WALL_LEFT
			jr  z, m_evil_tile_vert_wall
			cp  WALL_RIGHT
			jr  z, m_evil_tile_vert_wall
			cp  WALL_UP
			jr  z, m_evil_tile_horz_wall 
			cp  WALL_DOWN
			jr  z, m_evil_tile_horz_wall
			ret

			// Bounce off vertical, a' = PI - a; in my byte wide circle: a' = 0x80 - a
			// Bounce off horizontal, a' = -a; in my byte wide circle: a' = 0x00 - a

			// Also ball should've been expelled from the wall so why this doesn't work?!	

		.m_evil_tile_horz_wall 
			ld  a, (_cocher_ar)
			and 0xf0
			neg a 
			ld  (_cocher_ar), a 
			ret 

		.m_evil_tile_vert_wall
			ld  a, (_cocher_ar)
			and 0xf0
			neg a 
			add 0x80 
			ld  (_cocher_ar), a
	#endasm
}

void cocher_frame (void) {
	player.frame = cocher_a >> 1;
}

