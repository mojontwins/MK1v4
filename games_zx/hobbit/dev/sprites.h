// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

// Sprites.h
 
extern unsigned char sprite_1_a []; 
extern unsigned char sprite_1_b []; 
extern unsigned char sprite_1_c []; 
extern unsigned char sprite_2_a []; 
extern unsigned char sprite_2_b []; 
extern unsigned char sprite_2_c []; 
extern unsigned char sprite_3_a []; 
extern unsigned char sprite_3_b []; 
extern unsigned char sprite_3_c []; 
extern unsigned char sprite_4_a []; 
extern unsigned char sprite_4_b []; 
extern unsigned char sprite_4_c []; 
extern unsigned char sprite_5_a []; 
extern unsigned char sprite_5_b []; 
extern unsigned char sprite_5_c []; 
extern unsigned char sprite_6_a []; 
extern unsigned char sprite_6_b []; 
extern unsigned char sprite_6_c []; 
extern unsigned char sprite_7_a []; 
extern unsigned char sprite_7_b []; 
extern unsigned char sprite_7_c []; 
extern unsigned char sprite_8_a []; 
extern unsigned char sprite_8_b []; 
extern unsigned char sprite_8_c []; 
extern unsigned char sprite_9_a []; 
extern unsigned char sprite_9_b []; 
extern unsigned char sprite_9_c []; 
extern unsigned char sprite_10_a []; 
extern unsigned char sprite_10_b []; 
extern unsigned char sprite_10_c []; 
extern unsigned char sprite_11_a []; 
extern unsigned char sprite_11_b []; 
extern unsigned char sprite_11_c []; 
extern unsigned char sprite_12_a []; 
extern unsigned char sprite_12_b []; 
extern unsigned char sprite_12_c []; 
extern unsigned char sprite_13_a []; 
extern unsigned char sprite_13_b []; 
extern unsigned char sprite_13_c []; 
extern unsigned char sprite_14_a []; 
extern unsigned char sprite_14_b []; 
extern unsigned char sprite_14_c []; 
extern unsigned char sprite_15_a []; 
extern unsigned char sprite_15_b []; 
extern unsigned char sprite_15_c []; 
extern unsigned char sprite_16_a []; 
extern unsigned char sprite_16_b []; 
extern unsigned char sprite_16_c []; 
extern unsigned char extra_sprite_17_a []; 
extern unsigned char extra_sprite_17_b []; 
extern unsigned char extra_sprite_17_c []; 
 
#asm
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #0 y máscara
; Primera columna
    ._sprite_1_a
        defb 3, 224
        defb 12, 192
        defb 16, 192
        defb 8, 192
        defb 3, 192
        defb 25, 192
        defb 13, 192
        defb 5, 224
        defb 1, 224
        defb 12, 192
        defb 18, 192
        defb 27, 192
        defb 26, 192
        defb 0, 192
        defb 7, 240
        defb 0, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_1_b
        defb 96, 7
        defb 144, 3
        defb 8, 3
        defb 0, 3
        defb 160, 3
        defb 168, 3
        defb 248, 3
        defb 152, 3
        defb 240, 3
        defb 0, 3
        defb 168, 3
        defb 224, 3
        defb 0, 7
        defb 208, 7
        defb 208, 7
        defb 0, 7
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_1_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #1 y máscara
; Primera columna
    ._sprite_2_a
        defb 0, 255
        defb 3, 224
        defb 12, 192
        defb 16, 192
        defb 8, 192
        defb 3, 192
        defb 25, 192
        defb 13, 192
        defb 1, 192
        defb 29, 128
        defb 50, 128
        defb 51, 128
        defb 8, 128
        defb 15, 224
        defb 7, 224
        defb 0, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_2_b
        defb 0, 255
        defb 96, 7
        defb 144, 3
        defb 8, 3
        defb 0, 3
        defb 160, 3
        defb 168, 3
        defb 248, 3
        defb 152, 1
        defb 244, 1
        defb 12, 1
        defb 224, 1
        defb 12, 1
        defb 92, 1
        defb 56, 1
        defb 0, 131
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_2_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #2 y máscara
; Primera columna
    ._sprite_3_a
        defb 6, 224
        defb 9, 192
        defb 16, 192
        defb 0, 192
        defb 5, 192
        defb 21, 192
        defb 31, 192
        defb 25, 192
        defb 15, 192
        defb 0, 192
        defb 21, 192
        defb 7, 192
        defb 0, 224
        defb 11, 224
        defb 11, 224
        defb 0, 224
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_3_b
        defb 192, 7
        defb 48, 3
        defb 8, 3
        defb 16, 3
        defb 192, 3
        defb 152, 3
        defb 176, 3
        defb 160, 7
        defb 128, 7
        defb 48, 3
        defb 72, 3
        defb 216, 3
        defb 88, 3
        defb 0, 3
        defb 224, 15
        defb 0, 15
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_3_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #3 y máscara
; Primera columna
    ._sprite_4_a
        defb 0, 255
        defb 6, 224
        defb 9, 192
        defb 16, 192
        defb 0, 192
        defb 5, 192
        defb 21, 192
        defb 31, 192
        defb 25, 128
        defb 47, 128
        defb 48, 128
        defb 7, 128
        defb 48, 128
        defb 58, 128
        defb 28, 128
        defb 0, 193
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_4_b
        defb 0, 255
        defb 192, 7
        defb 48, 3
        defb 8, 3
        defb 16, 3
        defb 192, 3
        defb 152, 3
        defb 176, 3
        defb 128, 3
        defb 184, 1
        defb 76, 1
        defb 204, 1
        defb 16, 1
        defb 240, 7
        defb 224, 7
        defb 0, 15
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_4_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #4 y máscara
; Primera columna
    ._sprite_5_a
        defb 6, 224
        defb 9, 192
        defb 16, 128
        defb 48, 128
        defb 16, 128
        defb 16, 192
        defb 8, 224
        defb 7, 224
        defb 8, 192
        defb 19, 192
        defb 27, 192
        defb 27, 192
        defb 0, 192
        defb 3, 240
        defb 7, 240
        defb 0, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_5_b
        defb 224, 7
        defb 16, 3
        defb 8, 1
        defb 12, 1
        defb 8, 1
        defb 8, 3
        defb 16, 7
        defb 224, 3
        defb 8, 3
        defb 232, 3
        defb 224, 3
        defb 96, 15
        defb 0, 15
        defb 96, 15
        defb 0, 15
        defb 0, 127
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_5_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #5 y máscara
; Primera columna
    ._sprite_6_a
        defb 6, 224
        defb 9, 192
        defb 16, 128
        defb 48, 128
        defb 16, 128
        defb 16, 192
        defb 8, 224
        defb 7, 192
        defb 16, 192
        defb 23, 192
        defb 7, 192
        defb 6, 240
        defb 0, 240
        defb 6, 240
        defb 0, 240
        defb 0, 254
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_6_b
        defb 224, 7
        defb 16, 3
        defb 8, 1
        defb 12, 1
        defb 8, 1
        defb 8, 3
        defb 16, 7
        defb 224, 7
        defb 16, 3
        defb 200, 3
        defb 216, 3
        defb 216, 3
        defb 0, 3
        defb 192, 15
        defb 224, 15
        defb 0, 15
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_6_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #6 y máscara
; Primera columna
    ._sprite_7_a
        defb 6, 240
        defb 9, 224
        defb 8, 224
        defb 0, 128
        defb 53, 128
        defb 21, 128
        defb 23, 192
        defb 6, 224
        defb 11, 192
        defb 16, 192
        defb 25, 192
        defb 27, 192
        defb 0, 192
        defb 3, 240
        defb 7, 240
        defb 0, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_7_b
        defb 192, 15
        defb 48, 7
        defb 8, 3
        defb 0, 1
        defb 172, 1
        defb 168, 1
        defb 232, 3
        defb 96, 3
        defb 200, 3
        defb 40, 3
        defb 160, 3
        defb 224, 15
        defb 0, 15
        defb 96, 15
        defb 0, 15
        defb 0, 127
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_7_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #7 y máscara
; Primera columna
    ._sprite_8_a
        defb 6, 240
        defb 9, 224
        defb 8, 224
        defb 0, 128
        defb 53, 128
        defb 21, 128
        defb 23, 192
        defb 6, 224
        defb 19, 192
        defb 20, 192
        defb 5, 192
        defb 7, 240
        defb 0, 240
        defb 6, 240
        defb 0, 240
        defb 0, 254
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_8_b
        defb 192, 15
        defb 48, 7
        defb 8, 3
        defb 0, 1
        defb 172, 1
        defb 168, 1
        defb 232, 3
        defb 96, 3
        defb 208, 3
        defb 8, 3
        defb 152, 3
        defb 216, 3
        defb 0, 3
        defb 192, 15
        defb 224, 15
        defb 0, 15
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_8_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #8 y máscara
; Primera columna
    ._sprite_9_a
        defb 1, 248
        defb 3, 24
        defb 66, 8
        defb 162, 0
        defb 34, 0
        defb 35, 0
        defb 27, 128
        defb 1, 192
        defb 0, 248
        defb 1, 248
        defb 0, 248
        defb 1, 224
        defb 12, 192
        defb 19, 192
        defb 16, 0
        defb 112, 7
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_9_b
        defb 128, 31
        defb 192, 8
        defb 163, 0
        defb 165, 0
        defb 164, 0
        defb 229, 0
        defb 104, 0
        defb 32, 3
        defb 0, 7
        defb 240, 0
        defb 70, 0
        defb 234, 0
        defb 82, 0
        defb 227, 0
        defb 0, 8
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_9_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #9 y máscara
; Primera columna
    ._sprite_10_a
        defb 1, 248
        defb 3, 16
        defb 197, 0
        defb 165, 0
        defb 37, 0
        defb 167, 0
        defb 22, 0
        defb 4, 192
        defb 0, 224
        defb 15, 0
        defb 98, 0
        defb 87, 0
        defb 74, 0
        defb 199, 0
        defb 0, 16
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_10_b
        defb 128, 31
        defb 192, 24
        defb 66, 16
        defb 69, 0
        defb 68, 0
        defb 196, 0
        defb 216, 1
        defb 128, 3
        defb 0, 31
        defb 128, 31
        defb 0, 31
        defb 128, 7
        defb 48, 3
        defb 200, 3
        defb 8, 0
        defb 14, 224
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_10_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #10 y máscara
; Primera columna
    ._sprite_11_a
        defb 3, 240
        defb 6, 240
        defb 5, 240
        defb 5, 240
        defb 5, 240
        defb 6, 240
        defb 7, 192
        defb 27, 128
        defb 61, 128
        defb 62, 128
        defb 63, 128
        defb 63, 128
        defb 59, 128
        defb 28, 128
        defb 6, 192
        defb 30, 192
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_11_b
        defb 224, 7
        defb 48, 7
        defb 208, 7
        defb 80, 7
        defb 208, 7
        defb 48, 7
        defb 240, 3
        defb 104, 1
        defb 220, 1
        defb 60, 0
        defb 249, 0
        defb 249, 0
        defb 255, 0
        defb 15, 0
        defb 0, 224
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_11_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #11 y máscara
; Primera columna
    ._sprite_12_a
        defb 7, 224
        defb 12, 224
        defb 11, 224
        defb 10, 224
        defb 11, 224
        defb 12, 224
        defb 15, 192
        defb 22, 128
        defb 59, 128
        defb 60, 0
        defb 159, 0
        defb 159, 0
        defb 255, 0
        defb 240, 0
        defb 0, 7
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_12_b
        defb 192, 15
        defb 96, 15
        defb 160, 15
        defb 160, 15
        defb 160, 15
        defb 96, 15
        defb 224, 3
        defb 216, 1
        defb 188, 1
        defb 124, 1
        defb 252, 1
        defb 252, 1
        defb 220, 1
        defb 56, 1
        defb 96, 3
        defb 120, 3
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_12_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #12 y máscara
; Primera columna
    ._sprite_13_a
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 248
        defb 3, 192
        defb 21, 192
        defb 13, 192
        defb 7, 128
        defb 54, 0
        defb 69, 0
        defb 51, 0
        defb 48, 128
        defb 2, 128
        defb 6, 224
        defb 14, 224
        defb 0, 224
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_13_b
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 31
        defb 192, 3
        defb 168, 3
        defb 176, 3
        defb 224, 3
        defb 104, 1
        defb 164, 1
        defb 200, 1
        defb 0, 3
        defb 96, 7
        defb 0, 15
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_13_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #13 y máscara
; Primera columna
    ._sprite_14_a
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 248
        defb 3, 192
        defb 21, 192
        defb 13, 192
        defb 7, 192
        defb 22, 128
        defb 37, 128
        defb 19, 128
        defb 0, 192
        defb 6, 224
        defb 0, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_14_b
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 31
        defb 192, 3
        defb 168, 3
        defb 176, 3
        defb 224, 1
        defb 108, 0
        defb 162, 0
        defb 204, 0
        defb 12, 1
        defb 64, 1
        defb 96, 7
        defb 112, 7
        defb 0, 7
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_14_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #14 y máscara
; Primera columna
    ._sprite_15_a
        defb 1, 248
        defb 3, 248
        defb 2, 128
        defb 59, 0
        defb 122, 0
        defb 123, 0
        defb 92, 0
        defb 87, 0
        defb 111, 0
        defb 111, 0
        defb 15, 0
        defb 3, 128
        defb 56, 128
        defb 48, 3
        defb 112, 7
        defb 0, 7
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_15_b
        defb 128, 31
        defb 192, 3
        defb 140, 0
        defb 222, 0
        defb 26, 0
        defb 186, 0
        defb 122, 0
        defb 230, 0
        defb 246, 0
        defb 240, 0
        defb 112, 7
        defb 192, 7
        defb 0, 3
        defb 24, 195
        defb 24, 195
        defb 28, 192
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_15_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #15 y máscara
; Primera columna
    ._sprite_16_a
        defb 1, 248
        defb 3, 192
        defb 50, 0
        defb 123, 0
        defb 90, 0
        defb 91, 0
        defb 92, 0
        defb 103, 0
        defb 111, 0
        defb 15, 0
        defb 15, 224
        defb 3, 224
        defb 0, 192
        defb 24, 195
        defb 24, 195
        defb 56, 3
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._sprite_16_b
        defb 128, 31
        defb 192, 31
        defb 128, 1
        defb 220, 0
        defb 30, 0
        defb 190, 0
        defb 122, 0
        defb 234, 0
        defb 246, 0
        defb 246, 0
        defb 112, 0
        defb 192, 1
        defb 28, 1
        defb 12, 192
        defb 14, 224
        defb 0, 224
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._sprite_16_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #16 y máscara
; Primera columna
    ._extra_sprite_17_a
        defb 0, 198
        defb 16, 194
        defb 24, 194
        defb 8, 0
        defb 125, 0
        defb 55, 0
        defb 7, 128
        defb 15, 224
        defb 7, 0
        defb 127, 0
        defb 103, 0
        defb 12, 0
        defb 25, 192
        defb 17, 192
        defb 1, 196
        defb 0, 252
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._extra_sprite_17_b
        defb 0, 63
        defb 128, 3
        defb 216, 3
        defb 240, 3
        defb 192, 7
        defb 128, 0
        defb 222, 0
        defb 248, 0
        defb 248, 1
        defb 220, 1
        defb 192, 1
        defb 192, 7
        defb 240, 3
        defb 24, 3
        defb 0, 67
        defb 0, 127
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._extra_sprite_17_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
#endasm
 
