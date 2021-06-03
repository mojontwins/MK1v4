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
extern unsigned char extra_sprite_19_a []; 
extern unsigned char extra_sprite_19_b []; 
extern unsigned char extra_sprite_19_c []; 
extern unsigned char extra_sprite_20_a []; 
extern unsigned char extra_sprite_20_b []; 
extern unsigned char extra_sprite_20_c []; 
extern unsigned char extra_sprite_21_a []; 
extern unsigned char extra_sprite_21_b []; 
extern unsigned char extra_sprite_21_c []; 
extern unsigned char extra_sprite_22_a []; 
extern unsigned char extra_sprite_22_b []; 
extern unsigned char extra_sprite_22_c []; 
extern unsigned char extra_sprite_23_a []; 
extern unsigned char extra_sprite_23_b []; 
extern unsigned char extra_sprite_23_c []; 
 
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
        defb 1, 254
        defb 2, 252
        defb 4, 248
        defb 0, 248
        defb 4, 248
        defb 0, 248
        defb 4, 248
        defb 8, 240
        defb 16, 224
        defb 32, 192
        defb 64, 128
        defb 65, 128
        defb 152, 0
        defb 164, 24
        defb 65, 184
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
    ._sprite_1_b
        defb 160, 31
        defb 0, 15
        defb 80, 7
        defb 240, 7
        defb 0, 7
        defb 208, 7
        defb 208, 7
        defb 148, 3
        defb 242, 1
        defb 226, 1
        defb 2, 1
        defb 176, 1
        defb 162, 1
        defb 4, 3
        defb 16, 7
        defb 184, 7
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
        defb 1, 254
        defb 2, 252
        defb 4, 248
        defb 0, 248
        defb 4, 248
        defb 0, 248
        defb 4, 248
        defb 8, 240
        defb 16, 224
        defb 32, 192
        defb 64, 128
        defb 73, 128
        defb 148, 8
        defb 161, 24
        defb 67, 184
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
        defb 160, 31
        defb 0, 15
        defb 80, 7
        defb 240, 7
        defb 0, 7
        defb 208, 7
        defb 212, 3
        defb 146, 1
        defb 242, 1
        defb 226, 1
        defb 0, 1
        defb 178, 1
        defb 160, 3
        defb 8, 3
        defb 156, 3
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
        defb 1, 254
        defb 2, 252
        defb 0, 252
        defb 2, 252
        defb 0, 252
        defb 2, 252
        defb 4, 248
        defb 8, 240
        defb 16, 224
        defb 32, 192
        defb 33, 192
        defb 76, 128
        defb 82, 140
        defb 32, 220
        defb 1, 252
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
        defb 208, 15
        defb 0, 7
        defb 40, 3
        defb 120, 3
        defb 0, 3
        defb 104, 3
        defb 104, 3
        defb 74, 1
        defb 121, 0
        defb 113, 0
        defb 1, 0
        defb 176, 0
        defb 161, 0
        defb 2, 1
        defb 136, 3
        defb 220, 3
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
        defb 1, 254
        defb 2, 252
        defb 0, 252
        defb 2, 252
        defb 12, 240
        defb 18, 224
        defb 32, 192
        defb 64, 128
        defb 64, 128
        defb 152, 0
        defb 164, 24
        defb 64, 188
        defb 2, 248
        defb 7, 240
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
    ._sprite_4_b
        defb 208, 15
        defb 0, 7
        defb 40, 3
        defb 120, 3
        defb 0, 3
        defb 106, 1
        defb 105, 0
        defb 73, 0
        defb 121, 0
        defb 112, 0
        defb 1, 0
        defb 218, 1
        defb 80, 1
        defb 4, 1
        defb 14, 0
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
        defb 5, 248
        defb 0, 240
        defb 10, 224
        defb 15, 224
        defb 0, 224
        defb 11, 224
        defb 11, 224
        defb 41, 192
        defb 79, 128
        defb 71, 128
        defb 64, 128
        defb 13, 128
        defb 69, 128
        defb 32, 192
        defb 8, 224
        defb 29, 224
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
        defb 128, 127
        defb 64, 63
        defb 32, 31
        defb 0, 31
        defb 32, 31
        defb 0, 31
        defb 32, 31
        defb 16, 15
        defb 8, 7
        defb 4, 3
        defb 2, 1
        defb 130, 1
        defb 25, 0
        defb 37, 24
        defb 130, 29
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
        defb 0, 255
        defb 5, 248
        defb 0, 240
        defb 10, 224
        defb 15, 224
        defb 0, 224
        defb 11, 224
        defb 43, 192
        defb 73, 128
        defb 79, 128
        defb 71, 128
        defb 0, 128
        defb 77, 128
        defb 5, 192
        defb 16, 192
        defb 57, 192
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
        defb 0, 255
        defb 128, 127
        defb 64, 63
        defb 32, 31
        defb 0, 31
        defb 32, 31
        defb 0, 31
        defb 32, 31
        defb 16, 15
        defb 8, 7
        defb 4, 3
        defb 2, 1
        defb 146, 1
        defb 41, 16
        defb 133, 24
        defb 194, 29
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
        defb 11, 240
        defb 0, 224
        defb 20, 192
        defb 30, 192
        defb 0, 192
        defb 22, 192
        defb 22, 192
        defb 82, 128
        defb 158, 0
        defb 142, 0
        defb 128, 0
        defb 13, 0
        defb 133, 0
        defb 64, 128
        defb 17, 192
        defb 59, 192
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
        defb 128, 127
        defb 64, 63
        defb 0, 63
        defb 64, 63
        defb 0, 63
        defb 64, 63
        defb 32, 31
        defb 16, 15
        defb 8, 7
        defb 4, 3
        defb 132, 3
        defb 50, 1
        defb 74, 49
        defb 4, 59
        defb 128, 63
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
        defb 11, 240
        defb 0, 224
        defb 20, 192
        defb 30, 192
        defb 0, 192
        defb 86, 128
        defb 150, 0
        defb 146, 0
        defb 158, 0
        defb 14, 0
        defb 128, 0
        defb 91, 128
        defb 10, 128
        defb 32, 128
        defb 112, 0
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
    ._sprite_8_b
        defb 0, 255
        defb 128, 127
        defb 64, 63
        defb 0, 63
        defb 64, 63
        defb 48, 15
        defb 72, 7
        defb 4, 3
        defb 2, 1
        defb 2, 1
        defb 25, 0
        defb 37, 24
        defb 2, 61
        defb 64, 31
        defb 224, 15
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
        defb 1, 240
        defb 7, 224
        defb 3, 192
        defb 12, 192
        defb 26, 128
        defb 30, 128
        defb 12, 128
        defb 0, 128
        defb 30, 128
        defb 31, 128
        defb 11, 192
        defb 11, 192
        defb 3, 192
        defb 10, 192
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
 
; Segunda columna
    ._sprite_11_b
        defb 192, 15
        defb 192, 15
        defb 224, 7
        defb 0, 7
        defb 96, 7
        defb 208, 3
        defb 240, 3
        defb 96, 3
        defb 0, 3
        defb 176, 3
        defb 240, 3
        defb 224, 7
        defb 96, 7
        defb 96, 7
        defb 64, 15
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
        defb 3, 240
        defb 3, 240
        defb 7, 224
        defb 0, 224
        defb 6, 224
        defb 11, 192
        defb 15, 192
        defb 6, 192
        defb 0, 192
        defb 13, 192
        defb 15, 192
        defb 7, 224
        defb 6, 224
        defb 6, 224
        defb 2, 240
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
    ._sprite_12_b
        defb 128, 15
        defb 224, 7
        defb 192, 3
        defb 48, 3
        defb 88, 1
        defb 120, 1
        defb 48, 1
        defb 0, 1
        defb 120, 1
        defb 248, 1
        defb 208, 3
        defb 208, 3
        defb 192, 3
        defb 80, 3
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
        defb 0, 195
        defb 60, 129
        defb 124, 1
        defb 248, 3
        defb 248, 1
        defb 250, 0
        defb 255, 0
        defb 253, 0
        defb 247, 0
        defb 254, 0
        defb 117, 0
        defb 119, 0
        defb 19, 128
        defb 0, 236
        defb 0, 255
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
    ._sprite_13_b
        defb 0, 195
        defb 60, 129
        defb 62, 128
        defb 31, 192
        defb 31, 128
        defb 95, 0
        defb 255, 0
        defb 191, 0
        defb 239, 0
        defb 127, 0
        defb 174, 0
        defb 238, 0
        defb 200, 1
        defb 0, 55
        defb 0, 255
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
        defb 0, 223
        defb 32, 141
        defb 66, 24
        defb 67, 24
        defb 101, 0
        defb 247, 0
        defb 254, 0
        defb 245, 0
        defb 255, 0
        defb 251, 0
        defb 252, 0
        defb 124, 1
        defb 124, 1
        defb 30, 128
        defb 6, 224
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
        defb 0, 251
        defb 4, 177
        defb 66, 24
        defb 194, 24
        defb 166, 0
        defb 239, 0
        defb 127, 0
        defb 175, 0
        defb 255, 0
        defb 223, 0
        defb 63, 0
        defb 62, 128
        defb 62, 128
        defb 120, 1
        defb 96, 7
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
        defb 127, 0
        defb 0, 128
        defb 5, 240
        defb 7, 240
        defb 1, 248
        defb 2, 248
        defb 3, 248
        defb 1, 248
        defb 3, 248
        defb 4, 240
        defb 4, 241
        defb 2, 248
        defb 1, 252
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
    ._sprite_15_b
        defb 255, 0
        defb 255, 0
        defb 254, 0
        defb 0, 1
        defb 64, 15
        defb 160, 15
        defb 192, 31
        defb 128, 31
        defb 192, 31
        defb 64, 31
        defb 192, 31
        defb 32, 15
        defb 32, 143
        defb 64, 31
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
        defb 127, 0
        defb 0, 128
        defb 5, 240
        defb 7, 240
        defb 1, 248
        defb 2, 248
        defb 3, 248
        defb 0, 252
        defb 1, 252
        defb 1, 252
        defb 0, 254
        defb 0, 255
        defb 0, 255
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
        defb 254, 0
        defb 0, 1
        defb 64, 15
        defb 160, 15
        defb 192, 31
        defb 192, 31
        defb 192, 31
        defb 128, 63
        defb 128, 63
        defb 0, 63
        defb 128, 63
        defb 0, 127
        defb 0, 255
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
        defb 0, 255
        defb 0, 255
        defb 0, 224
        defb 29, 192
        defb 62, 128
        defb 119, 0
        defb 98, 0
        defb 119, 0
        defb 62, 128
        defb 28, 192
        defb 0, 224
        defb 0, 254
        defb 0, 254
        defb 0, 254
        defb 0, 254
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
    ._extra_sprite_17_b
        defb 0, 255
        defb 0, 255
        defb 0, 3
        defb 168, 1
        defb 212, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 254, 0
        defb 170, 0
        defb 0, 84
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
        defb 0, 15
        defb 96, 1
        defb 124, 0
        defb 58, 0
        defb 58, 128
        defb 39, 128
        defb 31, 128
        defb 6, 192
        defb 1, 240
        defb 0, 252
        defb 0, 254
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
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
    ._extra_sprite_18_b
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 127
        defb 0, 127
        defb 0, 63
        defb 128, 31
        defb 192, 15
        defb 160, 7
        defb 112, 3
        defb 40, 1
        defb 28, 128
        defb 14, 192
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
 
; Sprite #18 y máscara
; Primera columna
    ._extra_sprite_19_a
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 128
        defb 126, 0
        defb 127, 0
        defb 31, 0
        defb 111, 0
        defb 119, 0
        defb 57, 128
        defb 59, 128
        defb 29, 192
        defb 5, 224
        defb 0, 248
        defb 0, 255
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
    ._extra_sprite_19_b
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 1
        defb 126, 0
        defb 254, 0
        defb 248, 0
        defb 246, 0
        defb 238, 0
        defb 92, 1
        defb 220, 1
        defb 184, 3
        defb 160, 7
        defb 0, 31
        defb 0, 255
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
    ._extra_sprite_19_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #19 y máscara
; Primera columna
    ._extra_sprite_20_a
        defb 0, 255
        defb 0, 248
        defb 7, 224
        defb 24, 192
        defb 32, 128
        defb 65, 0
        defb 66, 0
        defb 65, 0
        defb 32, 0
        defb 88, 0
        defb 103, 0
        defb 56, 128
        defb 31, 192
        defb 7, 224
        defb 0, 248
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
    ._extra_sprite_20_b
        defb 0, 255
        defb 0, 31
        defb 224, 7
        defb 24, 3
        defb 4, 1
        defb 194, 0
        defb 2, 0
        defb 194, 0
        defb 4, 0
        defb 26, 0
        defb 230, 0
        defb 28, 1
        defb 248, 3
        defb 224, 7
        defb 0, 31
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
    ._extra_sprite_20_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #20 y máscara
; Primera columna
    ._extra_sprite_21_a
        defb 7, 240
        defb 15, 224
        defb 29, 192
        defb 24, 192
        defb 29, 192
        defb 15, 192
        defb 21, 192
        defb 31, 192
        defb 13, 192
        defb 23, 192
        defb 13, 192
        defb 23, 192
        defb 13, 192
        defb 23, 192
        defb 13, 224
        defb 7, 240
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Segunda columna
    ._extra_sprite_21_b
        defb 0, 127
        defb 128, 63
        defb 192, 31
        defb 192, 31
        defb 192, 31
        defb 128, 31
        defb 64, 7
        defb 248, 3
        defb 80, 3
        defb 248, 3
        defb 80, 3
        defb 248, 3
        defb 80, 3
        defb 248, 3
        defb 80, 3
        defb 248, 3
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; tercera columna
    ._extra_sprite_21_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #21 y máscara
; Primera columna
    ._extra_sprite_22_a
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 1, 254
        defb 30, 224
        defb 34, 192
        defb 64, 128
        defb 128, 0
        defb 146, 0
        defb 104, 144
        defb 4, 248
        defb 0, 248
        defb 4, 240
        defb 14, 224
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
 
; Segunda columna
    ._extra_sprite_22_b
        defb 0, 255
        defb 0, 255
        defb 208, 15
        defb 0, 7
        defb 42, 1
        defb 121, 0
        defb 1, 0
        defb 104, 0
        defb 105, 0
        defb 72, 1
        defb 122, 1
        defb 112, 1
        defb 2, 0
        defb 219, 0
        defb 80, 0
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
    ._extra_sprite_22_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
 
; Sprite #22 y máscara
; Primera columna
    ._extra_sprite_23_a
        defb 0, 255
        defb 0, 255
        defb 11, 240
        defb 0, 224
        defb 84, 128
        defb 158, 0
        defb 128, 0
        defb 22, 0
        defb 150, 0
        defb 18, 128
        defb 94, 128
        defb 14, 128
        defb 64, 0
        defb 219, 0
        defb 10, 0
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
    ._extra_sprite_23_b
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 128, 127
        defb 120, 7
        defb 68, 3
        defb 2, 1
        defb 1, 0
        defb 73, 0
        defb 22, 9
        defb 32, 31
        defb 0, 31
        defb 32, 15
        defb 112, 7
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
 
; tercera columna
    ._extra_sprite_23_c
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
        defb 0, 255
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
 
