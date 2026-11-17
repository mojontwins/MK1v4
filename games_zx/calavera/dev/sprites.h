// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

// Sprites.h
// No masks
 
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
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #0 y 1
; Primera columna
    ._sprite_1_a
        defb 0
    ._sprite_2_a
        defb 1
        defb 3, 7
        defb 0, 1
        defb 15, 15
        defb 55, 23
        defb 59, 55
        defb 31, 59
        defb 3, 31
        defb 7, 3
        defb 14, 3
        defb 12, 1
        defb 12, 3
        defb 24, 15
        defb 16, 13
        defb 48, 9
        defb 56, 1
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_1_b
        defb 192
    ._sprite_2_b
        defb 224
        defb 240, 128
        defb 192, 128
        defb 128, 128
        defb 128, 192
        defb 192, 160
        defb 224, 254
        defb 254, 254
        defb 254, 128
        defb 192, 128
        defb 192, 192
        defb 192, 192
        defb 192, 128
        defb 96, 128
        defb 96, 128
        defb 112, 192
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_1_c
        defb 0
    ._sprite_2_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #2 y 3
; Primera columna
    ._sprite_3_a
        defb 1
    ._sprite_4_a
        defb 1
        defb 0, 1
        defb 0, 7
        defb 7, 3
        defb 11, 15
        defb 27, 23
        defb 29, 55
        defb 15, 59
        defb 1, 31
        defb 3, 6
        defb 3, 12
        defb 3, 124
        defb 2, 120
        defb 6, 64
        defb 6, 0
        defb 7, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_3_b
        defb 224
    ._sprite_4_b
        defb 128
        defb 120, 224
        defb 96, 128
        defb 192, 128
        defb 224, 192
        defb 208, 167
        defb 255, 255
        defb 255, 248
        defb 192, 192
        defb 240, 224
        defb 56, 112
        defb 120, 56
        defb 224, 112
        defb 128, 96
        defb 0, 48
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_3_c
        defb 0
    ._sprite_4_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #4 y 5
; Primera columna
    ._sprite_5_a
        defb 7
    ._sprite_6_a
        defb 7
        defb 30, 1
        defb 6, 1
        defb 3, 1
        defb 7, 3
        defb 11, 5
        defb 255, 127
        defb 255, 127
        defb 3, 1
        defb 15, 1
        defb 28, 3
        defb 30, 3
        defb 7, 1
        defb 1, 1
        defb 0, 1
        defb 0, 3
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_5_b
        defb 128
    ._sprite_6_b
        defb 128
        defb 0, 224
        defb 0, 128
        defb 224, 240
        defb 208, 232
        defb 216, 236
        defb 184, 220
        defb 240, 248
        defb 128, 192
        defb 192, 192
        defb 192, 128
        defb 192, 192
        defb 64, 240
        defb 96, 176
        defb 96, 144
        defb 224, 128
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_5_c
        defb 0
    ._sprite_6_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #6 y 7
; Primera columna
    ._sprite_7_a
        defb 3
    ._sprite_8_a
        defb 1
        defb 15, 7
        defb 3, 1
        defb 1, 1
        defb 1, 3
        defb 3, 229
        defb 7, 255
        defb 127, 31
        defb 127, 3
        defb 3, 7
        defb 3, 14
        defb 3, 28
        defb 3, 14
        defb 6, 6
        defb 6, 12
        defb 14, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_7_b
        defb 0
    ._sprite_8_b
        defb 128
        defb 192, 128
        defb 0, 224
        defb 240, 192
        defb 236, 240
        defb 220, 232
        defb 248, 236
        defb 192, 220
        defb 224, 248
        defb 112, 96
        defb 48, 48
        defb 48, 62
        defb 24, 30
        defb 8, 2
        defb 12, 0
        defb 28, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_7_c
        defb 0
    ._sprite_8_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #8 y 9
; Primera columna
    ._sprite_9_a
        defb 1
    ._sprite_10_a
        defb 1
        defb 3, 3
        defb 66, 197
        defb 162, 165
        defb 34, 37
        defb 35, 167
        defb 27, 22
        defb 1, 4
        defb 0, 0
        defb 1, 15
        defb 0, 98
        defb 1, 87
        defb 12, 74
        defb 19, 199
        defb 16, 0
        defb 112, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_9_b
        defb 128
    ._sprite_10_b
        defb 128
        defb 192, 192
        defb 163, 66
        defb 165, 69
        defb 164, 68
        defb 229, 196
        defb 104, 216
        defb 32, 128
        defb 0, 0
        defb 240, 128
        defb 70, 0
        defb 234, 128
        defb 82, 48
        defb 227, 200
        defb 0, 8
        defb 0, 14
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_9_c
        defb 0
    ._sprite_10_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #10 y 11
; Primera columna
    ._sprite_11_a
        defb 7
    ._sprite_12_a
        defb 3
        defb 15, 7
        defb 15, 15
        defb 7, 15
        defb 11, 7
        defb 21, 7
        defb 42, 27
        defb 40, 101
        defb 40, 138
        defb 40, 144
        defb 40, 72
        defb 36, 36
        defb 32, 0
        defb 16, 0
        defb 8, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_11_b
        defb 224
    ._sprite_12_b
        defb 192
        defb 240, 224
        defb 240, 240
        defb 224, 240
        defb 208, 224
        defb 168, 224
        defb 84, 216
        defb 20, 166
        defb 20, 81
        defb 20, 9
        defb 20, 18
        defb 36, 36
        defb 4, 0
        defb 8, 0
        defb 16, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_11_c
        defb 0
    ._sprite_12_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #12 y 13
; Primera columna
    ._sprite_13_a
        defb 0
    ._sprite_14_a
        defb 0
        defb 60, 0
        defb 124, 32
        defb 248, 66
        defb 248, 67
        defb 250, 103
        defb 255, 247
        defb 255, 255
        defb 255, 255
        defb 255, 255
        defb 119, 251
        defb 119, 252
        defb 19, 124
        defb 0, 124
        defb 0, 30
        defb 0, 6
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_13_b
        defb 0
    ._sprite_14_b
        defb 0
        defb 60, 0
        defb 62, 4
        defb 31, 66
        defb 31, 194
        defb 95, 230
        defb 255, 239
        defb 255, 255
        defb 255, 255
        defb 255, 255
        defb 238, 223
        defb 238, 63
        defb 200, 62
        defb 0, 62
        defb 0, 120
        defb 0, 96
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_13_c
        defb 0
    ._sprite_14_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #14 y 15
; Primera columna
    ._sprite_15_a
        defb 255
    ._sprite_16_a
        defb 255
        defb 255, 255
        defb 255, 255
        defb 3, 3
        defb 7, 7
        defb 7, 7
        defb 1, 1
        defb 3, 3
        defb 3, 3
        defb 1, 0
        defb 3, 1
        defb 4, 1
        defb 4, 0
        defb 2, 0
        defb 1, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._sprite_15_b
        defb 255
    ._sprite_16_b
        defb 255
        defb 255, 255
        defb 255, 255
        defb 224, 224
        defb 224, 224
        defb 224, 224
        defb 192, 192
        defb 192, 192
        defb 192, 192
        defb 192, 128
        defb 192, 128
        defb 32, 0
        defb 32, 128
        defb 64, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._sprite_15_c
        defb 0
    ._sprite_16_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #16 y 17
; Primera columna
    ._extra_sprite_17_a
        defb 1
    ._extra_sprite_18_a
        defb 0
        defb 1, 3
        defb 1, 3
        defb 0, 3
        defb 1, 1
        defb 3, 3
        defb 3, 7
        defb 3, 7
        defb 3, 7
        defb 3, 7
        defb 3, 7
        defb 15, 6
        defb 15, 14
        defb 9, 28
        defb 1, 24
        defb 1, 28
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._extra_sprite_17_b
        defb 128
    ._extra_sprite_18_b
        defb 0
        defb 192, 0
        defb 192, 128
        defb 192, 128
        defb 128, 128
        defb 255, 0
        defb 227, 254
        defb 192, 198
        defb 192, 128
        defb 192, 128
        defb 224, 224
        defb 224, 112
        defb 192, 48
        defb 128, 48
        defb 128, 48
        defb 192, 56
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._extra_sprite_17_c
        defb 0
    ._extra_sprite_18_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #18 y 19
; Primera columna
    ._extra_sprite_19_a
        defb 1
    ._extra_sprite_20_a
        defb 0
        defb 3, 0
        defb 3, 1
        defb 3, 1
        defb 1, 1
        defb 255, 0
        defb 199, 127
        defb 3, 99
        defb 3, 1
        defb 3, 1
        defb 7, 7
        defb 7, 14
        defb 3, 12
        defb 1, 12
        defb 1, 12
        defb 3, 28
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._extra_sprite_19_b
        defb 128
    ._extra_sprite_20_b
        defb 0
        defb 128, 192
        defb 128, 192
        defb 0, 192
        defb 128, 128
        defb 192, 192
        defb 192, 224
        defb 192, 224
        defb 192, 224
        defb 192, 224
        defb 192, 224
        defb 240, 96
        defb 240, 112
        defb 144, 56
        defb 128, 24
        defb 128, 56
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._extra_sprite_19_c
        defb 0
    ._extra_sprite_20_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #20 y 21
; Primera columna
    ._extra_sprite_21_a
        defb 0
    ._extra_sprite_22_a
        defb 14
        defb 3, 15
        defb 3, 15
        defb 3, 7
        defb 1, 143
        defb 3, 78
        defb 7, 63
        defb 11, 7
        defb 7, 7
        defb 3, 7
        defb 3, 15
        defb 7, 15
        defb 7, 15
        defb 15, 8
        defb 4, 4
        defb 12, 8
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._extra_sprite_21_b
        defb 0
    ._extra_sprite_22_b
        defb 0
        defb 128, 0
        defb 192, 0
        defb 192, 128
        defb 224, 0
        defb 192, 0
        defb 160, 0
        defb 144, 0
        defb 160, 128
        defb 192, 128
        defb 192, 192
        defb 192, 192
        defb 192, 224
        defb 224, 128
        defb 32, 64
        defb 64, 64
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._extra_sprite_21_c
        defb 0
    ._extra_sprite_22_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Sprites #22 y 23
; Primera columna
    ._extra_sprite_23_a
        defb 3
    ._extra_sprite_24_a
        defb 0
        defb 5, 0
        defb 7, 0
        defb 3, 0
        defb 3, 0
        defb 0, 0
        defb 1, 0
        defb 1, 0
        defb 1, 0
        defb 1, 0
        defb 29, 0
        defb 7, 0
        defb 29, 0
        defb 23, 0
        defb 29, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; Segunda columna
    ._extra_sprite_23_b
        defb 192
    ._extra_sprite_24_b
        defb 0
        defb 160, 0
        defb 224, 0
        defb 192, 0
        defb 64, 0
        defb 0, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 128, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
; tercera columna
    ._extra_sprite_23_c
        defb 0
    ._extra_sprite_24_c
        defb 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
        defb 0, 0
 
#endasm
 
