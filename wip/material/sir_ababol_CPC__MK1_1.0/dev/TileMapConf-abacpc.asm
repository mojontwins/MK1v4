; TILEMAPCONF PARA PHANTOMAS TALES #1: MARSPORT / CPC
; (C) 2009 THE MOJON TWINS

	XLIB TileMapConf
	
	XDEF tiles
	XDEF pantalla_juego
	XDEF tiles_tocados
	XDEF posiciones_pantalla
	XDEF posiciones_super_buffer
	
	XDEF posicion_inicial_area_visible
	XDEF posicion_inicial_superbuffer
	XDEF ancho_pantalla_bytes
	XDEF alto_pantalla_bytes
	XDEF ancho_pantalla_bytes_visible
	
	XDEF tile11
	XDEF _tile_0

	XDEF mascara1
	XDEF mascara2
	
	; Voy a definir como máscara de los sprites el color 2
	
	; 0: $00, $00
	; 1: $80, $40
	; 2: $04, $08
	; 3: $44, $88
	; 4: $10, $20
	; 5: $50, $A0
	; 6: $14, $28
	; 7: $54, $A8
	; 8: $01, $02
	; 9: $41, $82
	; 10: $05, $0A
	; 11: $45, $8A
	; 12: $11, $22
	
	;defc mascara1 = $05 ;
	;defc mascara2 = $0A ;
	defc mascara1 = $45;
	defc mascara2 = $8A;
	
; VALORES QUE DEFINEN EL BUFFER Y LA PANTALLA

	defc posicion_inicial_area_visible = $f0aa
	defc posicion_inicial_superbuffer = $100
	
	defc T_WIDTH = 	30 ;32 ;28 ;32 ;28 ;16			;max=40		;dimensiones de la pantalla en tiles
	defc T_HEIGHT = 20 ;16							;max=20
		
	defc ancho_pantalla_bytes = 2*T_WIDTH ; 2*T_WIDTH;		; El ancho de pantalla influye determinantemente en 
															; numerosas rutinas que hay que actualizar si se cambia
															; OJO con el modo
	defc alto_pantalla_bytes = 8*T_HEIGHT ;
	
	defc ancho_pantalla_bytes_visible = 2*T_WIDTH ;32  ; 64;		;dentro del area definida, cuanto se debe mostrar. 2*T_WIDTH

;El tamaño del buffer es ancho_pantalla_bytes*alto_pantalla_bytes


.TileMapConf
;Con la definición del mapeado hay que tener en cuenta que las coordenadas son:
;ANCHO=64 bytes (128 pixels en modo 0)
;ALTO=128 pixels

;el máximo que entra en el CPC es 20 líneas
;SI NO SE VAN A USAR TODAS LAS LINEAS, PARA AHORRA MEMORIA ES INTERESANTE COMENTARLAS

.posiciones_pantalla		;Posiciones en las que se dibujan los tiles
	defw posicion_inicial_area_visible+$50*0
	defw posicion_inicial_area_visible+$50*1  
	defw posicion_inicial_area_visible+$50*2
	defw posicion_inicial_area_visible+$50*3
	defw posicion_inicial_area_visible+$50*4
	defw posicion_inicial_area_visible+$50*5 
	defw posicion_inicial_area_visible+$50*6 
	defw posicion_inicial_area_visible+$50*7 
	defw posicion_inicial_area_visible+$50*8 
	defw posicion_inicial_area_visible+$50*9 
	defw posicion_inicial_area_visible+$50*10 
	defw posicion_inicial_area_visible+$50*11 
	defw posicion_inicial_area_visible+$50*12 
	defw posicion_inicial_area_visible+$50*13 
	defw posicion_inicial_area_visible+$50*14 
	defw posicion_inicial_area_visible+$50*15
	defw posicion_inicial_area_visible+$50*16
	defw posicion_inicial_area_visible+$50*17
	defw posicion_inicial_area_visible+$50*18
	defw posicion_inicial_area_visible+$50*19

.posiciones_super_buffer	;muestra el inicio de cada línea (son 10 tiles de 8x16 de alto)

	;defw $1000, $1200, $1400, $1600, $1800, $1a00, $1c00, $1e00, $2000, $2200, $2400, $2600, $2800, $2a00, $2c00, $2f00
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*0
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*1
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*2
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*3
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*4
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*5
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*6
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*7
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*8
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*9
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*10
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*11
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*12
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*13
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*14
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*15
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*16
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*17
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*18
	defw posicion_inicial_superbuffer+8*ancho_pantalla_bytes*19
	
	;defw $1000, $1480, $1900, $1d80, $2200, $2680, $2b00, $2f80, $3400, $3880
	
;Rutinas para transferir bloques independientes a la pantalla

;Se busca el subbloque de 8x8 correspondiente a las coordenadas x,y
;el bloque se calcula dividiendo la coordenada x /8

.pantalla_actual 
	defw 0

.pantalla_juego  ;en tiles
	defs T_WIDTH*T_HEIGHT
	defb $FF	;Este byte es importante, marca el fin de la pantalla.

.tiles_tocados defs 150 ;150	;cuando un tile es tocado, se marca en esta tabla para luego restaurarlo. Es una tabla sin duplicados.

.tiles ;Son de 2x8 bytes
._tiles

._tile_0

._tile_0_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_1

._tile_1_DATA
defb $0, $0
defb $10, $88
defb $31, $C4
defb $31, $C4
defb $10, $88
defb $0, $0
defb $10, $8
defb $0, $0
._tile_2

._tile_2_DATA
defb $0, $0
defb $31, $62
defb $31, $62
defb $62, $C4
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_3

._tile_3_DATA
defb $0, $0
defb $62, $C4
defb $F7, $EE
defb $62, $C4
defb $62, $C4
defb $87, $E
defb $42, $84
defb $0, $0
._tile_4

._tile_4_DATA
defb $10, $88
defb $31, $CC
defb $72, $EA
defb $31, $88
defb $31, $C4
defb $A5, $84
defb $43, $8
defb $21, $0
._tile_5

._tile_5_DATA
defb $0, $0
defb $D4, $88
defb $10, $88
defb $31, $0
defb $31, $0
defb $42, $10
defb $42, $94
defb $0, $0
._tile_6

._tile_6_DATA
defb $10, $88
defb $31, $C4
defb $31, $C4
defb $73, $88
defb $E6, $E6
defb $29, $8
defb $18, $C
defb $87, $42
._tile_7

._tile_7_DATA
defb $0, $0
defb $31, $0
defb $31, $0
defb $62, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_8

._tile_8_DATA
defb $0, $0
defb $31, $0
defb $62, $0
defb $62, $0
defb $62, $0
defb $42, $0
defb $21, $0
defb $0, $0
._tile_9

._tile_9_DATA
defb $0, $0
defb $10, $88
defb $0, $C4
defb $0, $C4
defb $0, $C4
defb $0, $84
defb $10, $8
defb $0, $0
._tile_10

._tile_10_DATA
defb $0, $0
defb $0, $0
defb $62, $C4
defb $31, $88
defb $31, $88
defb $42, $84
defb $0, $0
defb $0, $0
._tile_11

._tile_11_DATA
defb $0, $0
defb $0, $0
defb $31, $88
defb $73, $CC
defb $73, $CC
defb $21, $8
defb $0, $0
defb $0, $0
._tile_12

._tile_12_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $21, $8
defb $21, $8
defb $0, $0
._tile_13

._tile_13_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $CC
defb $73, $CC
defb $0, $0
defb $0, $0
defb $0, $0
._tile_14

._tile_14_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $10, $C
defb $21, $8
defb $0, $0
._tile_15

._tile_15_DATA
defb $0, $0
defb $10, $88
defb $10, $88
defb $31, $0
defb $31, $0
defb $42, $0
defb $42, $0
defb $0, $0
._tile_16

._tile_16_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $88
defb $73, $C4
defb $43, $84
defb $21, $8
defb $0, $0
._tile_17

._tile_17_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $88
defb $21, $8
defb $21, $8
defb $0, $0
._tile_18

._tile_18_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $10, $CC
defb $31, $C4
defb $10, $8
defb $21, $C
defb $0, $0
._tile_19

._tile_19_DATA
defb $0, $0
defb $0, $0
defb $73, $88
defb $62, $C4
defb $10, $CC
defb $0, $84
defb $21, $8
defb $0, $0
._tile_20

._tile_20_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $C4
defb $21, $C
defb $0, $84
defb $0, $0
._tile_21

._tile_21_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $CC
defb $31, $0
defb $10, $C
defb $21, $8
defb $0, $0
._tile_22

._tile_22_DATA
defb $0, $0
defb $0, $0
defb $10, $CC
defb $31, $0
defb $31, $88
defb $21, $84
defb $21, $C
defb $0, $0
._tile_23

._tile_23_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $CC
defb $0, $C4
defb $10, $8
defb $21, $0
defb $0, $0
._tile_24

._tile_24_DATA
defb $0, $0
defb $0, $0
defb $31, $88
defb $31, $C4
defb $10, $88
defb $21, $84
defb $21, $8
defb $0, $0
._tile_25

._tile_25_DATA
defb $0, $0
defb $0, $0
defb $10, $CC
defb $31, $C4
defb $10, $CC
defb $0, $84
defb $0, $84
defb $0, $0
._tile_26

._tile_26_DATA
defb $0, $0
defb $0, $0
defb $31, $88
defb $31, $88
defb $0, $0
defb $21, $8
defb $21, $8
defb $0, $0
._tile_27

._tile_27_DATA
defb $0, $0
defb $0, $0
defb $31, $88
defb $31, $88
defb $0, $0
defb $21, $8
defb $43, $0
defb $0, $0
._tile_28

._tile_28_DATA
defb $0, $0
defb $31, $88
defb $62, $0
defb $62, $0
defb $62, $0
defb $42, $0
defb $21, $8
defb $0, $0
._tile_29

._tile_29_DATA
defb $0, $0
defb $0, $0
defb $73, $CC
defb $0, $0
defb $73, $CC
defb $0, $0
defb $0, $0
defb $0, $0
._tile_30

._tile_30_DATA
defb $0, $0
defb $31, $88
defb $0, $C4
defb $0, $C4
defb $0, $C4
defb $0, $84
defb $21, $8
defb $0, $0
._tile_31

._tile_31_DATA
defb $0, $0
defb $10, $88
defb $0, $C4
defb $10, $88
defb $10, $88
defb $0, $0
defb $10, $8
defb $0, $0
._tile_32

._tile_32_DATA
defb $0, $0
defb $D4, $88
defb $10, $88
defb $31, $0
defb $31, $0
defb $42, $0
defb $42, $84
defb $0, $0
._tile_33

._tile_33_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $F6, $CC
defb $87, $C
defb $96, $C
defb $0, $0
._tile_34

._tile_34_DATA
defb $0, $0
defb $0, $0
defb $73, $CC
defb $73, $C4
defb $73, $88
defb $43, $84
defb $43, $C
defb $0, $0
._tile_35

._tile_35_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $E6, $0
defb $86, $0
defb $43, $8
defb $0, $0
._tile_36

._tile_36_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $73, $C4
defb $43, $84
defb $43, $C
defb $0, $0
._tile_37

._tile_37_DATA
defb $0, $0
defb $0, $0
defb $31, $CC
defb $73, $0
defb $73, $CC
defb $43, $0
defb $21, $C
defb $0, $0
._tile_38

._tile_38_DATA
defb $0, $0
defb $0, $0
defb $31, $88
defb $73, $0
defb $73, $0
defb $43, $8
defb $43, $0
defb $0, $0
._tile_39

._tile_39_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $E6, $0
defb $96, $C
defb $87, $8
defb $0, $0
._tile_40

._tile_40_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $CC
defb $43, $C
defb $43, $84
defb $0, $0
._tile_41

._tile_41_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $10, $88
defb $31, $88
defb $21, $8
defb $21, $8
defb $0, $0
._tile_42

._tile_42_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $88
defb $31, $88
defb $43, $8
defb $43, $0
defb $0, $0
._tile_43

._tile_43_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $88
defb $43, $84
defb $43, $84
defb $0, $0
._tile_44

._tile_44_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $88
defb $31, $88
defb $21, $8
defb $21, $C
defb $0, $0
._tile_45

._tile_45_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $F7, $C4
defb $96, $4A
defb $86, $42
defb $0, $0
._tile_46

._tile_46_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $43, $84
defb $43, $84
defb $0, $0
._tile_47

._tile_47_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $88
defb $73, $C4
defb $43, $84
defb $21, $8
defb $0, $0
._tile_48

._tile_48_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $73, $C4
defb $43, $8
defb $43, $0
defb $0, $0
._tile_49

._tile_49_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $0
defb $F6, $88
defb $96, $8
defb $43, $84
defb $0, $0
._tile_50

._tile_50_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $88
defb $73, $C4
defb $43, $8
defb $43, $84
defb $0, $0
._tile_51

._tile_51_DATA
defb $0, $0
defb $0, $0
defb $10, $CC
defb $31, $88
defb $31, $88
defb $0, $84
defb $21, $8
defb $0, $0
._tile_52

._tile_52_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $31, $CC
defb $31, $88
defb $10, $8
defb $10, $8
defb $0, $0
._tile_53

._tile_53_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $C4
defb $43, $C
defb $21, $8
defb $0, $0
._tile_54

._tile_54_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $C4
defb $21, $C
defb $21, $C
defb $0, $0
._tile_55

._tile_55_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $E6, $62
defb $96, $4A
defb $43, $C
defb $0, $0
._tile_56

._tile_56_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $21, $8
defb $43, $84
defb $0, $0
._tile_57

._tile_57_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $73, $C4
defb $73, $CC
defb $0, $84
defb $21, $8
defb $0, $0
._tile_58

._tile_58_DATA
defb $0, $0
defb $0, $0
defb $73, $CC
defb $10, $CC
defb $31, $0
defb $42, $0
defb $43, $C
defb $0, $0
._tile_59

._tile_59_DATA
defb $0, $0
defb $0, $0
defb $10, $88
defb $31, $0
defb $62, $0
defb $21, $0
defb $10, $8
defb $0, $0
._tile_60

._tile_60_DATA
defb $0, $0
defb $31, $0
defb $31, $0
defb $10, $88
defb $10, $88
defb $0, $84
defb $0, $84
defb $0, $0
._tile_61

._tile_61_DATA
defb $0, $0
defb $0, $0
defb $31, $0
defb $10, $88
defb $0, $C4
defb $10, $8
defb $21, $0
defb $0, $0
._tile_62

._tile_62_DATA
defb $0, $0
defb $0, $0
defb $31, $62
defb $31, $62
defb $62, $C4
defb $0, $0
defb $0, $0
defb $0, $0
._tile_63

._tile_63_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_64

._tile_64_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_65

._tile_65_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_66

._tile_66_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_67

._tile_67_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_68

._tile_68_DATA
defb $0, $0
defb $E7, $B1
defb $7F, $5F
defb $AF, $AF
defb $4F, $5B
defb $A5, $A5
defb $50, $50
defb $20, $0
._tile_69

._tile_69_DATA
defb $0, $0
defb $BC, $9E
defb $DF, $4F
defb $AF, $EF
defb $1E, $5E
defb $A5, $A5
defb $50, $52
defb $80, $20
._tile_70

._tile_70_DATA
defb $0, $0
defb $80, $A0
defb $D0, $50
defb $A4, $70
defb $5A, $52
defb $2D, $25
defb $16, $52
defb $60, $0
._tile_71

._tile_71_DATA
defb $0, $0
defb $0, $80
defb $50, $50
defb $B0, $A0
defb $1A, $E0
defb $83, $A4
defb $3, $4A
defb $21, $84
._tile_72

._tile_72_DATA
defb $0, $10
defb $73, $B1
defb $77, $FB
defb $F7, $FB
defb $E7, $FB
defb $57, $3B
defb $63, $B1
defb $0, $0
._tile_73

._tile_73_DATA
defb $C0, $0
defb $E4, $F6
defb $EE, $EF
defb $BE, $DF
defb $5E, $AF
defb $9E, $4F
defb $2C, $96
defb $0, $0
._tile_74

._tile_74_DATA
defb $20, $A0
defb $50, $50
defb $30, $A0
defb $52, $B0
defb $30, $A1
defb $10, $10
defb $0, $0
defb $0, $0
._tile_75

._tile_75_DATA
defb $20, $A0
defb $50, $50
defb $A0, $E0
defb $E0, $F0
defb $E0, $B4
defb $C0, $40
defb $0, $0
defb $0, $0
._tile_76

._tile_76_DATA
defb $0, $30
defb $0, $D7
defb $10, $FC
defb $31, $CB
defb $33, $B7
defb $72, $7E
defb $76, $FE
defb $65, $F8
._tile_77

._tile_77_DATA
defb $C0, $0
defb $1E, $0
defb $43, $80
defb $2D, $48
defb $CE, $C
defb $67, $A4
defb $77, $6
defb $11, $82
._tile_78

._tile_78_DATA
defb $75, $88
defb $75, $EE
defb $75, $EE
defb $75, $EE
defb $75, $6E
defb $55, $FF
defb $55, $BF
defb $55, $EF
._tile_79

._tile_79_DATA
defb $F1, $4A
defb $E7, $8A
defb $D7, $4A
defb $E7, $8A
defb $D7, $4A
defb $AF, $82
defb $5E, $4A
defb $AD, $82
._tile_80

._tile_80_DATA
defb $0, $0
defb $10, $0
defb $0, $0
defb $50, $20
defb $20, $0
defb $10, $20
defb $30, $10
defb $42, $12
._tile_81

._tile_81_DATA
defb $0, $0
defb $80, $20
defb $10, $0
defb $80, $40
defb $0, $A0
defb $40, $40
defb $4, $F0
defb $42, $24
._tile_82

._tile_82_DATA
defb $24, $4
defb $12, $2
defb $1, $1
defb $2, $12
defb $3, $24
defb $6, $6
defb $6, $6
defb $3, $3
._tile_83

._tile_83_DATA
defb $20, $42
defb $42, $21
defb $0, $5A
defb $4, $2D
defb $2, $16
defb $4, $2
defb $2, $6
defb $6, $7
._tile_84

._tile_84_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $CC
defb $0, $CC
defb $33, $EF
defb $3, $DE
defb $0, $8C
._tile_85

._tile_85_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_86

._tile_86_DATA
defb $0, $8C
defb $2, $C1
defb $10, $28
defb $0, $4
defb $2, $92
defb $4, $29
defb $5, $1
defb $41, $90
._tile_87

._tile_87_DATA
defb $8, $0
defb $0, $4
defb $2, $80
defb $1, $12
defb $0, $84
defb $80, $48
defb $9, $A0
defb $49, $82
._tile_88

._tile_88_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_89

._tile_89_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_90

._tile_90_DATA
defb $0, $0
defb $2, $1
defb $10, $28
defb $0, $4
defb $2, $92
defb $4, $29
defb $5, $1
defb $41, $90
._tile_91

._tile_91_DATA
defb $8, $0
defb $0, $4
defb $2, $80
defb $1, $12
defb $0, $84
defb $80, $48
defb $9, $A0
defb $49, $82
._tile_92

._tile_92_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $40, $0
defb $0, $1
._tile_93

._tile_93_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $40, $0
defb $0, $0
defb $A, $0
defb $5, $4
._tile_94

._tile_94_DATA
defb $A, $2
defb $5, $5
defb $0, $8
defb $20, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_95

._tile_95_DATA
defb $8, $A
defb $20, $1
defb $0, $0
defb $0, $20
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_96

._tile_96_DATA
defb $0, $0
defb $0, $80
defb $0, $10
defb $0, $40
defb $0, $10
defb $80, $80
defb $0, $10
defb $A0, $A0
._tile_97

._tile_97_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $80
defb $0, $0
defb $A0, $A0
._tile_98

._tile_98_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $10, $0
defb $0, $0
defb $A0, $A0
._tile_99

._tile_99_DATA
defb $0, $10
defb $0, $80
defb $0, $10
defb $0, $40
defb $0, $10
defb $80, $80
defb $0, $10
defb $A0, $A0
._tile_100

._tile_100_DATA
defb $78, $F0
defb $C0, $0
defb $8, $0
defb $A5, $A5
defb $F0, $78
defb $0, $C0
defb $0, $8
defb $A5, $A5
._tile_101

._tile_101_DATA
defb $78, $F0
defb $C0, $0
defb $8, $0
defb $A5, $A5
defb $F0, $78
defb $0, $C0
defb $0, $8
defb $A5, $A5
._tile_102

._tile_102_DATA
defb $78, $F0
defb $C0, $0
defb $8, $0
defb $A5, $A5
defb $F0, $78
defb $0, $C0
defb $0, $8
defb $A5, $A5
._tile_103

._tile_103_DATA
defb $78, $F0
defb $C0, $0
defb $8, $0
defb $A5, $A5
defb $F0, $78
defb $0, $C0
defb $0, $8
defb $A5, $A5
._tile_104

._tile_104_DATA
defb $0, $0
defb $0, $42
defb $10, $7F
defb $21, $FF
defb $2, $4E
defb $40, $4
defb $26, $0
defb $67, $4
._tile_105

._tile_105_DATA
defb $0, $0
defb $AC, $0
defb $FF, $80
defb $FF, $48
defb $A, $0
defb $0, $0
defb $5, $26
defb $7F, $EE
._tile_106

._tile_106_DATA
defb $77, $7F
defb $37, $FF
defb $73, $EF
defb $13, $8C
defb $21, $EE
defb $10, $7F
defb $0, $53
defb $0, $0
._tile_107

._tile_107_DATA
defb $FF, $EE
defb $FF, $CE
defb $44, $6C
defb $0, $0
defb $2A, $0
defb $EF, $80
defb $AC, $0
defb $0, $0
._tile_108

._tile_108_DATA
defb $0, $0
defb $EF, $FB
defb $DF, $7B
defb $AF, $7B
defb $0, $0
defb $0, $90
defb $0, $21
defb $0, $52
._tile_109

._tile_109_DATA
defb $0, $0
defb $EF, $FB
defb $DF, $7B
defb $AF, $7B
defb $0, $0
defb $E0, $0
defb $84, $0
defb $18, $0
._tile_110

._tile_110_DATA
defb $0, $2D
defb $11, $E
defb $23, $8C
defb $57, $8
defb $AF, $0
defb $C6, $0
defb $40, $0
defb $0, $0
._tile_111

._tile_111_DATA
defb $30, $8
defb $61, $C
defb $30, $E
defb $1, $A4
defb $0, $48
defb $0, $0
defb $0, $0
defb $0, $0
._tile_112

._tile_112_DATA
defb $0, $0
defb $E, $AF
defb $1E, $F
defb $5A, $5A
defb $0, $0
defb $F0, $10
defb $5A, $12
defb $A5, $21
._tile_113

._tile_113_DATA
defb $0, $0
defb $F, $57
defb $F, $87
defb $2D, $A5
defb $0, $0
defb $F0, $10
defb $5A, $12
defb $A5, $21
._tile_114

._tile_114_DATA
defb $0, $0
defb $52, $29
defb $25, $90
defb $70, $48
defb $30, $90
defb $10, $0
defb $40, $40
defb $0, $0
._tile_115

._tile_115_DATA
defb $0, $0
defb $A4, $A4
defb $4A, $5A
defb $C0, $F0
defb $A0, $60
defb $C0, $40
defb $10, $20
defb $0, $0
._tile_116

._tile_116_DATA
defb $0, $0
defb $5F, $5F
defb $AF, $AF
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
._tile_117

._tile_117_DATA
defb $0, $0
defb $5F, $5F
defb $AF, $AF
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
._tile_118

._tile_118_DATA
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
._tile_119

._tile_119_DATA
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
defb $F, $F
._tile_120

._tile_120_DATA
defb $72, $40
defb $47, $14
defb $52, $11
defb $10, $FC
defb $11, $AE
defb $11, $CE
defb $D4, $AC
defb $CE, $C0
._tile_121

._tile_121_DATA
defb $A0, $E4
defb $C8, $CE
defb $8C, $A4
defb $58, $80
defb $31, $6C
defb $73, $9E
defb $77, $CF
defb $F7, $8F
._tile_122

._tile_122_DATA
defb $94, $BE
defb $31, $DF
defb $33, $EF
defb $33, $DF
defb $33, $AF
defb $31, $4F
defb $14, $1E
defb $0, $60
._tile_123

._tile_123_DATA
defb $77, $4F
defb $E3, $9E
defb $A9, $3C
defb $48, $C0
defb $18, $D9
defb $91, $1C
defb $50, $48
defb $44, $0
._tile_124

._tile_124_DATA
defb $0, $20
defb $20, $72
defb $72, $77
defb $77, $22
defb $2, $2
defb $F7, $F7
defb $20, $20
defb $22, $22
._tile_125

._tile_125_DATA
defb $20, $0
defb $72, $20
defb $20, $72
defb $22, $77
defb $22, $22
defb $8A, $2
defb $77, $EE
defb $20, $20
._tile_126

._tile_126_DATA
defb $22, $22
defb $2, $2
defb $33, $FF
defb $E4, $42
defb $22, $32
defb $30, $E0
defb $C2, $2
defb $2, $2
._tile_127

._tile_127_DATA
defb $2, $0
defb $FF, $EA
defb $20, $20
defb $2, $22
defb $EE, $2
defb $31, $EE
defb $2, $20
defb $2, $2
._tile_128

._tile_128_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $10
defb $0, $1
defb $0, $1
defb $0, $21
._tile_129

._tile_129_DATA
defb $10, $80
defb $43, $2C
defb $97, $E
defb $2F, $9E
defb $F, $1E
defb $F, $E
defb $F, $2C
defb $F, $48
._tile_130

._tile_130_DATA
defb $0, $3
defb $0, $61
defb $0, $E4
defb $30, $C8
defb $73, $80
defb $31, $80
defb $10, $0
defb $0, $0
._tile_131

._tile_131_DATA
defb $1E, $0
defb $48, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_132

._tile_132_DATA
defb $0, $0
defb $0, $40
defb $0, $85
defb $0, $2C
defb $0, $E
defb $0, $96
defb $0, $43
defb $0, $10
._tile_133

._tile_133_DATA
defb $0, $0
defb $40, $0
defb $24, $0
defb $86, $0
defb $2C, $0
defb $C0, $0
defb $8, $0
defb $0, $0
._tile_134

._tile_134_DATA
defb $0, $11
defb $0, $DD
defb $0, $FD
defb $0, $31
defb $0, $55
defb $0, $31
defb $0, $11
defb $0, $11
._tile_135

._tile_135_DATA
defb $0, $0
defb $0, $0
defb $66, $0
defb $E6, $0
defb $80, $0
defb $0, $0
defb $C4, $0
defb $0, $0
._tile_136

._tile_136_DATA
defb $0, $0
defb $0, $0
defb $0, $33
defb $0, $33
defb $0, $33
defb $0, $33
defb $0, $13
defb $0, $0
._tile_137

._tile_137_DATA
defb $0, $0
defb $0, $0
defb $CE, $0
defb $E6, $0
defb $66, $0
defb $46, $0
defb $AC, $0
defb $8, $0
._tile_138

._tile_138_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $11
defb $0, $10
defb $0, $11
defb $0, $10
defb $0, $0
._tile_139

._tile_139_DATA
defb $88, $0
defb $88, $0
defb $88, $0
defb $88, $0
defb $88, $0
defb $88, $0
defb $80, $0
defb $0, $0
._tile_140

._tile_140_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_141

._tile_141_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_142

._tile_142_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $88
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_143

._tile_143_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_144

._tile_144_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_145

._tile_145_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_146

._tile_146_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_147

._tile_147_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_148

._tile_148_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_149

._tile_149_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_150

._tile_150_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_151

._tile_151_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_152

._tile_152_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_153

._tile_153_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_154

._tile_154_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_155

._tile_155_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_156

._tile_156_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_157

._tile_157_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_158

._tile_158_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
._tile_159

._tile_159_DATA
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
defb $0, $0
