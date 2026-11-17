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
        defb 0, 240
        defb 7, 224
        defb 15, 224
        defb 15, 224
        defb 15, 224
        defb 2, 224
        defb 12, 192
        defb 24, 192
        defb 29, 192
        defb 13, 192
        defb 0, 192
        defb 22, 192
        defb 22, 192
        defb 16, 192
        defb 0, 199
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
        defb 0, 31
        defb 192, 15
        defb 96, 15
        defb 160, 3
        defb 248, 3
        defb 0, 3
        defb 224, 15
        defb 0, 15
        defb 160, 15
        defb 0, 15
        defb 224, 15
        defb 96, 15
        defb 0, 7
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
        defb 0, 240
        defb 7, 224
        defb 15, 224
        defb 15, 224
        defb 15, 224
        defb 14, 224
        defb 2, 192
        defb 29, 128
        defb 48, 128
        defb 59, 128
        defb 26, 128
        defb 0, 192
        defb 6, 240
        defb 6, 240
        defb 0, 240
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
    ._sprite_2_b
        defb 0, 31
        defb 192, 15
        defb 96, 15
        defb 160, 3
        defb 248, 3
        defb 0, 3
        defb 224, 15
        defb 192, 15
        defb 0, 3
        defb 88, 3
        defb 80, 3
        defb 128, 3
        defb 192, 31
        defb 192, 31
        defb 0, 15
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
        defb 0, 240
        defb 7, 224
        defb 15, 224
        defb 15, 224
        defb 15, 224
        defb 2, 128
        defb 56, 0
        defb 96, 0
        defb 118, 0
        defb 52, 0
        defb 0, 128
        defb 5, 240
        defb 5, 240
        defb 4, 240
        defb 0, 241
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
        defb 0, 31
        defb 192, 15
        defb 96, 15
        defb 160, 3
        defb 248, 3
        defb 0, 3
        defb 224, 15
        defb 192, 3
        defb 24, 3
        defb 208, 3
        defb 0, 3
        defb 160, 7
        defb 128, 3
        defb 56, 3
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
        defb 0, 224
        defb 15, 192
        defb 30, 192
        defb 31, 192
        defb 31, 192
        defb 28, 192
        defb 29, 192
        defb 1, 128
        defb 56, 0
        defb 71, 0
        defb 51, 0
        defb 32, 0
        defb 5, 128
        defb 11, 224
        defb 10, 224
        defb 8, 224
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
        defb 0, 63
        defb 128, 31
        defb 192, 31
        defb 64, 7
        defb 240, 7
        defb 0, 7
        defb 192, 1
        defb 140, 1
        defb 8, 1
        defb 224, 1
        defb 0, 7
        defb 240, 7
        defb 128, 1
        defb 28, 1
        defb 0, 1
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
        defb 0, 248
        defb 3, 240
        defb 6, 240
        defb 5, 192
        defb 31, 192
        defb 0, 192
        defb 7, 240
        defb 3, 192
        defb 24, 192
        defb 11, 192
        defb 0, 192
        defb 5, 224
        defb 1, 192
        defb 28, 192
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
    ._sprite_5_b
        defb 0, 255
        defb 0, 15
        defb 224, 7
        defb 240, 7
        defb 240, 7
        defb 240, 7
        defb 64, 1
        defb 28, 0
        defb 6, 0
        defb 110, 0
        defb 44, 0
        defb 0, 1
        defb 160, 15
        defb 160, 15
        defb 32, 15
        defb 0, 143
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
        defb 0, 248
        defb 3, 240
        defb 6, 240
        defb 5, 192
        defb 31, 192
        defb 0, 192
        defb 7, 240
        defb 3, 240
        defb 0, 192
        defb 26, 192
        defb 10, 192
        defb 1, 192
        defb 3, 248
        defb 3, 248
        defb 0, 240
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
    ._sprite_6_b
        defb 0, 15
        defb 224, 7
        defb 240, 7
        defb 240, 7
        defb 240, 7
        defb 112, 7
        defb 64, 3
        defb 184, 1
        defb 12, 1
        defb 220, 1
        defb 88, 1
        defb 0, 3
        defb 96, 15
        defb 96, 15
        defb 0, 15
        defb 224, 15
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
        defb 0, 248
        defb 3, 240
        defb 6, 240
        defb 5, 192
        defb 31, 192
        defb 0, 192
        defb 7, 240
        defb 0, 240
        defb 5, 240
        defb 0, 240
        defb 7, 240
        defb 6, 240
        defb 0, 224
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
    ._sprite_7_b
        defb 0, 255
        defb 0, 15
        defb 224, 7
        defb 240, 7
        defb 240, 7
        defb 240, 7
        defb 64, 7
        defb 48, 3
        defb 24, 3
        defb 184, 3
        defb 176, 3
        defb 0, 3
        defb 104, 3
        defb 104, 3
        defb 8, 3
        defb 0, 227
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
        defb 0, 252
        defb 1, 248
        defb 3, 248
        defb 2, 224
        defb 15, 224
        defb 0, 224
        defb 3, 128
        defb 49, 128
        defb 16, 128
        defb 7, 128
        defb 0, 224
        defb 15, 224
        defb 1, 128
        defb 56, 128
        defb 0, 128
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
        defb 0, 7
        defb 240, 3
        defb 120, 3
        defb 248, 3
        defb 248, 3
        defb 56, 3
        defb 184, 3
        defb 128, 1
        defb 28, 0
        defb 226, 0
        defb 204, 0
        defb 4, 0
        defb 160, 1
        defb 208, 7
        defb 80, 7
        defb 16, 7
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
        defb 0, 255
        defb 0, 248
        defb 3, 248
        defb 3, 248
        defb 1, 248
        defb 0, 252
        defb 0, 254
        defb 0, 252
        defb 1, 248
        defb 3, 248
        defb 3, 248
        defb 3, 248
        defb 1, 248
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
 
; Segunda columna
    ._sprite_9_b
        defb 0, 255
        defb 0, 127
        defb 0, 63
        defb 128, 31
        defb 192, 15
        defb 224, 15
        defb 96, 15
        defb 224, 15
        defb 192, 15
        defb 128, 31
        defb 0, 63
        defb 128, 31
        defb 192, 31
        defb 192, 31
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
        defb 0, 255
        defb 0, 254
        defb 0, 252
        defb 1, 248
        defb 3, 248
        defb 3, 248
        defb 3, 248
        defb 1, 248
        defb 0, 252
        defb 0, 254
        defb 0, 252
        defb 1, 248
        defb 3, 248
        defb 3, 248
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
    ._sprite_10_b
        defb 0, 255
        defb 0, 255
        defb 192, 31
        defb 192, 31
        defb 128, 31
        defb 0, 63
        defb 128, 31
        defb 192, 79
        defb 224, 47
        defb 96, 15
        defb 224, 15
        defb 192, 15
        defb 128, 31
        defb 0, 63
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
        defb 127, 0
        defb 127, 0
        defb 0, 0
        defb 63, 128
        defb 63, 128
        defb 43, 128
        defb 23, 128
        defb 0, 192
        defb 25, 128
        defb 36, 0
        defb 74, 0
        defb 82, 0
        defb 36, 0
        defb 24, 129
        defb 0, 195
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
        defb 242, 0
        defb 242, 0
        defb 0, 0
        defb 228, 1
        defb 228, 1
        defb 72, 1
        defb 200, 3
        defb 0, 3
        defb 152, 1
        defb 36, 0
        defb 74, 0
        defb 82, 0
        defb 36, 0
        defb 24, 129
        defb 0, 195
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
        defb 127, 0
        defb 127, 0
        defb 0, 0
        defb 63, 128
        defb 63, 128
        defb 43, 128
        defb 23, 128
        defb 0, 192
        defb 0, 195
        defb 24, 129
        defb 36, 0
        defb 82, 0
        defb 74, 0
        defb 36, 0
        defb 24, 129
        defb 0, 195
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
        defb 242, 0
        defb 242, 0
        defb 0, 0
        defb 228, 1
        defb 228, 1
        defb 72, 1
        defb 200, 3
        defb 0, 3
        defb 0, 195
        defb 24, 129
        defb 36, 0
        defb 82, 0
        defb 74, 0
        defb 36, 0
        defb 24, 129
        defb 0, 195
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
        defb 0, 192
        defb 17, 128
        defb 59, 128
        defb 59, 0
        defb 17, 0
        defb 64, 0
        defb 255, 0
        defb 255, 0
        defb 255, 0
        defb 0, 0
        defb 31, 128
        defb 0, 128
        defb 7, 224
        defb 0, 224
        defb 1, 224
        defb 5, 224
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
        defb 0, 63
        defb 0, 7
        defb 176, 1
        defb 188, 0
        defb 62, 0
        defb 122, 0
        defb 245, 0
        defb 251, 0
        defb 255, 0
        defb 0, 0
        defb 248, 1
        defb 0, 1
        defb 224, 15
        defb 0, 15
        defb 128, 15
        defb 128, 15
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
        defb 0, 252
        defb 0, 224
        defb 13, 128
        defb 61, 0
        defb 124, 0
        defb 94, 0
        defb 175, 0
        defb 223, 0
        defb 255, 0
        defb 0, 0
        defb 31, 128
        defb 0, 128
        defb 7, 240
        defb 0, 240
        defb 1, 240
        defb 1, 240
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
        defb 0, 3
        defb 136, 1
        defb 220, 1
        defb 220, 0
        defb 136, 0
        defb 2, 0
        defb 255, 0
        defb 255, 0
        defb 255, 0
        defb 0, 0
        defb 248, 1
        defb 0, 1
        defb 224, 7
        defb 0, 7
        defb 128, 7
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
        defb 0, 0
        defb 127, 0
        defb 0, 0
        defb 63, 0
        defb 63, 0
        defb 0, 0
        defb 127, 0
        defb 0, 0
        defb 6, 224
        defb 6, 224
        defb 6, 224
        defb 6, 224
        defb 6, 224
        defb 1, 224
        defb 0, 240
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
    ._sprite_15_b
        defb 0, 0
        defb 254, 0
        defb 0, 0
        defb 252, 0
        defb 252, 0
        defb 0, 0
        defb 254, 0
        defb 0, 0
        defb 96, 7
        defb 224, 7
        defb 96, 7
        defb 224, 7
        defb 96, 7
        defb 192, 7
        defb 0, 15
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
        defb 0, 0
        defb 127, 0
        defb 0, 0
        defb 63, 0
        defb 63, 0
        defb 0, 0
        defb 127, 0
        defb 0, 0
        defb 6, 224
        defb 6, 224
        defb 6, 224
        defb 1, 224
        defb 0, 240
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
    ._sprite_16_b
        defb 0, 0
        defb 254, 0
        defb 0, 0
        defb 252, 0
        defb 252, 0
        defb 0, 0
        defb 254, 0
        defb 0, 0
        defb 96, 7
        defb 224, 7
        defb 96, 7
        defb 192, 7
        defb 0, 15
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
        defb 0, 224
        defb 15, 192
        defb 30, 192
        defb 31, 192
        defb 30, 192
        defb 28, 192
        defb 5, 0
        defb 58, 0
        defb 96, 0
        defb 118, 0
        defb 52, 0
        defb 1, 0
        defb 14, 192
        defb 12, 192
        defb 16, 192
        defb 24, 192
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
        defb 0, 31
        defb 192, 15
        defb 224, 15
        defb 96, 15
        defb 0, 15
        defb 224, 15
        defb 224, 15
        defb 0, 0
        defb 254, 0
        defb 194, 0
        defb 24, 0
        defb 0, 0
        defb 192, 31
        defb 192, 31
        defb 0, 15
        defb 224, 15
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
        defb 0, 224
        defb 15, 192
        defb 30, 192
        defb 31, 192
        defb 30, 192
        defb 28, 192
        defb 5, 0
        defb 58, 0
        defb 96, 0
        defb 118, 0
        defb 52, 0
        defb 1, 0
        defb 5, 224
        defb 5, 224
        defb 0, 224
        defb 5, 224
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
        defb 0, 31
        defb 192, 15
        defb 224, 15
        defb 96, 15
        defb 0, 15
        defb 224, 15
        defb 224, 15
        defb 0, 0
        defb 254, 0
        defb 194, 0
        defb 24, 0
        defb 0, 0
        defb 128, 63
        defb 128, 63
        defb 0, 31
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
        defb 0, 248
        defb 3, 240
        defb 7, 240
        defb 6, 240
        defb 0, 240
        defb 7, 240
        defb 7, 240
        defb 0, 0
        defb 127, 0
        defb 67, 0
        defb 24, 0
        defb 0, 0
        defb 1, 252
        defb 1, 252
        defb 0, 248
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
    ._extra_sprite_19_b
        defb 0, 7
        defb 240, 3
        defb 120, 3
        defb 248, 3
        defb 120, 3
        defb 56, 3
        defb 160, 0
        defb 92, 0
        defb 6, 0
        defb 110, 0
        defb 44, 0
        defb 128, 0
        defb 160, 7
        defb 160, 7
        defb 0, 7
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
        defb 0, 248
        defb 3, 240
        defb 7, 240
        defb 6, 240
        defb 0, 240
        defb 7, 240
        defb 7, 240
        defb 0, 0
        defb 127, 0
        defb 67, 0
        defb 24, 0
        defb 0, 0
        defb 3, 248
        defb 3, 248
        defb 0, 240
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
    ._extra_sprite_20_b
        defb 0, 7
        defb 240, 3
        defb 120, 3
        defb 248, 3
        defb 120, 3
        defb 56, 3
        defb 160, 0
        defb 92, 0
        defb 6, 0
        defb 110, 0
        defb 44, 0
        defb 128, 0
        defb 112, 3
        defb 48, 3
        defb 8, 3
        defb 24, 3
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
 
#endasm
 
