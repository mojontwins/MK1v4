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
        defb 3
    ._sprite_6_a
        defb 7
        defb 15, 1
        defb 3, 1
        defb 1, 1
        defb 1, 3
        defb 3, 5
        defb 7, 127
        defb 127, 127
        defb 127, 1
        defb 3, 1
        defb 3, 3
        defb 3, 3
        defb 3, 1
        defb 6, 1
        defb 6, 1
        defb 14, 3
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
        defb 0
    ._sprite_6_b
        defb 128
        defb 192, 224
        defb 0, 128
        defb 240, 240
        defb 236, 232
        defb 220, 236
        defb 248, 220
        defb 192, 248
        defb 224, 192
        defb 112, 192
        defb 48, 128
        defb 48, 192
        defb 24, 240
        defb 8, 176
        defb 12, 144
        defb 28, 128
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
        defb 7
    ._sprite_8_a
        defb 1
        defb 30, 7
        defb 6, 1
        defb 3, 1
        defb 7, 3
        defb 11, 229
        defb 255, 255
        defb 255, 31
        defb 3, 3
        defb 15, 7
        defb 28, 14
        defb 30, 28
        defb 7, 14
        defb 1, 6
        defb 0, 12
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
    ._sprite_7_b
        defb 128
    ._sprite_8_b
        defb 128
        defb 0, 128
        defb 0, 224
        defb 224, 192
        defb 208, 240
        defb 216, 232
        defb 184, 236
        defb 240, 220
        defb 128, 248
        defb 192, 96
        defb 192, 48
        defb 192, 62
        defb 64, 30
        defb 96, 2
        defb 96, 0
        defb 224, 0
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
 
#endasm
 
