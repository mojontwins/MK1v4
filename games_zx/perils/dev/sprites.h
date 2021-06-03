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
extern unsigned char extra_sprite_18_a []; 
extern unsigned char extra_sprite_18_b []; 
extern unsigned char extra_sprite_18_c []; 
 
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
        defb 0, 255
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 16, 224
        defb 96, 128
        defb 144, 0
        defb 144, 0
        defb 161, 0
        defb 129, 0
        defb 96, 128
        defb 27, 224
        defb 3, 240
        defb 7, 224
        defb 23, 192
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
    ._sprite_1_b
        defb 0, 255
        defb 224, 31
        defb 24, 7
        defb 4, 3
        defb 4, 3
        defb 104, 7
        defb 160, 15
        defb 160, 15
        defb 96, 15
        defb 128, 15
        defb 192, 15
        defb 96, 15
        defb 128, 7
        defb 176, 3
        defb 120, 1
        defb 28, 1
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
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 16, 224
        defb 96, 128
        defb 144, 0
        defb 144, 0
        defb 161, 0
        defb 131, 0
        defb 98, 128
        defb 27, 224
        defb 5, 240
        defb 6, 240
        defb 3, 240
        defb 3, 248
        defb 3, 248
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
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 4, 3
        defb 68, 3
        defb 168, 7
        defb 160, 15
        defb 96, 15
        defb 128, 15
        defb 224, 15
        defb 96, 15
        defb 64, 15
        defb 128, 31
        defb 128, 63
        defb 128, 63
        defb 192, 31
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
        defb 0, 255
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 16, 224
        defb 96, 128
        defb 144, 0
        defb 144, 0
        defb 161, 0
        defb 131, 0
        defb 98, 128
        defb 20, 224
        defb 1, 240
        defb 1, 224
        defb 26, 192
        defb 28, 192
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
        defb 0, 255
        defb 224, 31
        defb 24, 7
        defb 4, 3
        defb 4, 3
        defb 104, 7
        defb 160, 15
        defb 160, 15
        defb 96, 15
        defb 128, 15
        defb 224, 15
        defb 224, 15
        defb 192, 7
        defb 240, 3
        defb 248, 1
        defb 28, 1
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
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 16, 224
        defb 112, 128
        defb 144, 0
        defb 144, 0
        defb 160, 0
        defb 135, 0
        defb 64, 128
        defb 56, 192
        defb 1, 248
        defb 5, 240
        defb 6, 224
        defb 12, 192
        defb 24, 193
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
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 4, 3
        defb 68, 3
        defb 168, 7
        defb 160, 15
        defb 96, 15
        defb 128, 15
        defb 224, 15
        defb 224, 15
        defb 192, 7
        defb 240, 3
        defb 248, 1
        defb 28, 1
        defb 0, 193
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
        defb 0, 255
        defb 7, 248
        defb 24, 224
        defb 32, 192
        defb 32, 192
        defb 22, 224
        defb 5, 240
        defb 5, 240
        defb 6, 240
        defb 1, 240
        defb 7, 240
        defb 7, 240
        defb 3, 224
        defb 15, 192
        defb 31, 128
        defb 56, 128
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
        defb 0, 255
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 8, 7
        defb 6, 1
        defb 9, 0
        defb 9, 0
        defb 133, 0
        defb 193, 0
        defb 70, 1
        defb 40, 7
        defb 128, 15
        defb 128, 7
        defb 88, 3
        defb 56, 3
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
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 32, 192
        defb 34, 192
        defb 21, 224
        defb 5, 240
        defb 6, 240
        defb 1, 240
        defb 7, 240
        defb 6, 240
        defb 2, 240
        defb 1, 248
        defb 1, 252
        defb 1, 252
        defb 3, 248
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
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 8, 7
        defb 6, 1
        defb 9, 0
        defb 9, 0
        defb 133, 0
        defb 193, 0
        defb 70, 1
        defb 216, 7
        defb 160, 15
        defb 96, 15
        defb 192, 15
        defb 192, 31
        defb 192, 31
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
        defb 0, 255
        defb 7, 248
        defb 24, 224
        defb 32, 192
        defb 32, 192
        defb 22, 224
        defb 5, 240
        defb 5, 240
        defb 6, 240
        defb 1, 240
        defb 3, 240
        defb 6, 240
        defb 1, 224
        defb 13, 192
        defb 30, 128
        defb 56, 128
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
        defb 0, 255
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 8, 7
        defb 6, 1
        defb 9, 0
        defb 9, 0
        defb 133, 0
        defb 129, 0
        defb 6, 1
        defb 216, 7
        defb 192, 15
        defb 224, 7
        defb 232, 3
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
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 32, 192
        defb 34, 192
        defb 21, 224
        defb 5, 240
        defb 6, 240
        defb 1, 240
        defb 7, 240
        defb 7, 240
        defb 3, 224
        defb 15, 192
        defb 31, 128
        defb 56, 128
        defb 0, 131
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
        defb 224, 31
        defb 16, 15
        defb 8, 7
        defb 8, 7
        defb 14, 1
        defb 9, 0
        defb 9, 0
        defb 5, 0
        defb 225, 0
        defb 2, 1
        defb 28, 3
        defb 128, 31
        defb 160, 15
        defb 96, 7
        defb 48, 3
        defb 24, 131
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
        defb 2, 252
        defb 52, 200
        defb 72, 128
        defb 139, 0
        defb 133, 0
        defb 133, 0
        defb 135, 0
        defb 131, 0
        defb 128, 0
        defb 140, 0
        defb 140, 0
        defb 131, 0
        defb 74, 128
        defb 80, 128
        defb 34, 216
        defb 6, 240
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
        defb 160, 31
        defb 28, 3
        defb 82, 1
        defb 209, 0
        defb 65, 0
        defb 65, 0
        defb 193, 0
        defb 129, 0
        defb 1, 0
        defb 49, 0
        defb 49, 0
        defb 193, 0
        defb 82, 1
        defb 10, 1
        defb 68, 11
        defb 96, 15
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
        defb 0, 255
        defb 5, 248
        defb 56, 192
        defb 74, 128
        defb 131, 0
        defb 130, 0
        defb 130, 0
        defb 131, 0
        defb 129, 0
        defb 152, 0
        defb 152, 0
        defb 128, 0
        defb 135, 0
        defb 68, 128
        defb 80, 129
        defb 44, 209
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
        defb 0, 255
        defb 64, 63
        defb 44, 19
        defb 18, 1
        defb 193, 0
        defb 161, 0
        defb 161, 0
        defb 225, 0
        defb 193, 0
        defb 25, 0
        defb 25, 0
        defb 1, 0
        defb 225, 0
        defb 34, 1
        defb 10, 129
        defb 52, 139
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
        defb 15, 192
        defb 25, 128
        defb 54, 128
        defb 51, 128
        defb 54, 128
        defb 25, 128
        defb 15, 192
        defb 0, 128
        defb 53, 0
        defb 77, 0
        defb 65, 0
        defb 33, 8
        defb 2, 128
        defb 4, 240
        defb 2, 240
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
        defb 240, 3
        defb 56, 1
        defb 220, 1
        defb 92, 1
        defb 216, 1
        defb 56, 1
        defb 240, 3
        defb 0, 1
        defb 72, 1
        defb 36, 1
        defb 36, 1
        defb 24, 1
        defb 0, 67
        defb 0, 127
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
        defb 15, 192
        defb 25, 128
        defb 54, 128
        defb 53, 128
        defb 54, 128
        defb 25, 128
        defb 15, 192
        defb 0, 192
        defb 5, 224
        defb 9, 224
        defb 9, 224
        defb 9, 224
        defb 5, 224
        defb 5, 224
        defb 9, 224
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
    ._sprite_14_b
        defb 240, 3
        defb 56, 1
        defb 220, 1
        defb 156, 1
        defb 216, 1
        defb 56, 1
        defb 240, 3
        defb 0, 7
        defb 64, 15
        defb 32, 15
        defb 32, 15
        defb 64, 15
        defb 64, 15
        defb 64, 15
        defb 32, 15
        defb 0, 31
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
        defb 255, 0
        defb 255, 0
        defb 170, 0
        defb 0, 0
        defb 7, 224
        defb 7, 224
        defb 0, 240
        defb 3, 240
        defb 3, 240
        defb 0, 224
        defb 3, 224
        defb 4, 224
        defb 4, 224
        defb 2, 224
        defb 1, 240
        defb 0, 248
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
        defb 255, 0
        defb 255, 0
        defb 171, 0
        defb 0, 0
        defb 224, 7
        defb 224, 7
        defb 0, 15
        defb 192, 15
        defb 192, 15
        defb 0, 7
        defb 192, 7
        defb 32, 7
        defb 32, 7
        defb 64, 7
        defb 0, 15
        defb 0, 31
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
        defb 255, 0
        defb 255, 0
        defb 170, 0
        defb 0, 0
        defb 7, 224
        defb 7, 224
        defb 0, 240
        defb 3, 240
        defb 3, 240
        defb 0, 240
        defb 1, 248
        defb 1, 248
        defb 0, 248
        defb 0, 252
        defb 0, 255
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
    ._sprite_16_b
        defb 255, 0
        defb 255, 0
        defb 171, 0
        defb 0, 0
        defb 224, 7
        defb 224, 7
        defb 0, 15
        defb 192, 15
        defb 192, 15
        defb 0, 15
        defb 128, 31
        defb 0, 31
        defb 128, 31
        defb 0, 63
        defb 0, 255
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
        defb 5, 224
        defb 23, 192
        defb 31, 128
        defb 63, 0
        defb 124, 0
        defb 121, 0
        defb 242, 0
        defb 116, 1
        defb 244, 1
        defb 114, 0
        defb 249, 0
        defb 60, 0
        defb 95, 0
        defb 31, 128
        defb 11, 192
        defb 2, 224
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
        defb 64, 7
        defb 240, 3
        defb 248, 1
        defb 254, 0
        defb 60, 0
        defb 159, 0
        defb 78, 0
        defb 47, 128
        defb 46, 128
        defb 79, 0
        defb 158, 0
        defb 62, 0
        defb 252, 0
        defb 248, 1
        defb 232, 3
        defb 160, 7
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
 
; Sprite #17 y máscara
; Primera columna
    ._extra_sprite_18_a
        defb 3, 252
        defb 12, 240
        defb 20, 232
        defb 7, 248
        defb 8, 240
        defb 16, 224
        defb 28, 224
        defb 50, 192
        defb 64, 128
        defb 66, 128
        defb 34, 192
        defb 125, 128
        defb 128, 0
        defb 128, 0
        defb 64, 128
        defb 63, 192
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._extra_sprite_18_b
        defb 128, 127
        defb 64, 63
        defb 32, 31
        defb 32, 31
        defb 16, 15
        defb 8, 7
        defb 56, 7
        defb 76, 3
        defb 2, 1
        defb 66, 1
        defb 68, 3
        defb 190, 1
        defb 1, 0
        defb 1, 0
        defb 2, 1
        defb 252, 3
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._extra_sprite_18_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
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
 
