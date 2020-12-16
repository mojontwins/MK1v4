#include "fbpng.bi"
#include "fbgfx.bi"
#include once "crt.bi"

#define RGBA_R( c ) ( CUInt( c ) Shr 16 And 255 )
#define RGBA_G( c ) ( CUInt( c ) Shr  8 And 255 )
#define RGBA_B( c ) ( CUInt( c )        And 255 )
#define RGBA_A( c ) ( CUInt( c ) Shr 24         )

Dim Shared As Any Ptr img 			' will contain the image loaded from the PNG

Sub Usage () 
	Print "** USO **"
	Print "   sprcnv archivo.png archivo.h [nomask]"
	Print
	Print "Convierte un Spriteset de 16 sprites"
End Sub

Function ReadBinValue (x As Integer, y As Integer) As Integer
	Dim As Integer ac, xx, p1
	ac = 0
	for xx = 0 to 7
		p1 = point (x + xx, y, img)
		if RGBA_R (p1) <> 0 Or RGBA_G (p1) <> 0 Or RGBA_B (p1) <> 0 Then
			ac = ac + 2 ^ (7 - xx)
		end if
	next xx
	Return ac
End Function

'
'
'

Dim as String filename, o
Dim as integer i, j, f, sprite, x, y, xx, yy, ac, nomask
Dim as unsigned long p1, p2

If Len (Command (1)) = 0 Or Len (Command (2)) = 0 Then 
	Usage
	End
End If

If lcase(Command (3)) = "nomask" Then nomask = -1 else nomask = 0

' Primero cargo el archivo de imagen
screenres 640, 480, 32, , -1

filename = Command (1)
img = png_load ( filename )

if img then
'	put( 0, 0 ), img
'	deallocate( img )
else
	print "Failed to load"
end if

' Ahora lo recorro y voy generando el código con sus etiquetas y
' sus mascaritas y toda la pesca

f = FreeFile

Open Command (2) for Output as f


Print #f, "// MTE MK1 (la Churrera) v5.0"
Print #f, "// Copyleft 2010-2014, 2020 by the Mojon Twins"
Print #f, ""
print #f, "// Sprites.h"
if nomask then print #f, "// No masks"

print #f, " "

for sprite = 1 to 16
	print #f, "extern unsigned char sprite_" + Trim(Str(sprite)) + "_a []; "
	print #f, "extern unsigned char sprite_" + Trim(Str(sprite)) + "_b []; "
	print #f, "extern unsigned char sprite_" + Trim(Str(sprite)) + "_c []; "
next sprite

print #f, " "

print #f, "#asm"

x = 0
y = 0



If nomask Then
	for i = 0 to 7: print #f, "        defb 0, 0":next i: print #f, " "
	For sprite = 1 To 16 Step 2

		' Interleaved stuff
		
		' Sprite L: c1, c2
		For yy = 0 To 15
			If yy = 0 Then Print #f, "    ._sprite_" & sprite & "_a"
			o = "        defb "
			ac = ReadBinValue (x, y+yy)		
			o = o + Trim (Str(ac))
			If yy > 0 Then 
				o = o + ", " 
			Else 
				Print #f, o
				o = "        defb "
			End If
			If yy = 0 Then Print #f, "    ._sprite_" & (sprite+1) & "_a"
			ac = ReadBinValue (x + 16, y+yy)		
			o = o + Trim (Str(ac))
			print #f, o
		Next yy
		For yy = 0 To 7
			Print #f, "        defb 0, 0"
		Next yy

		' Sprite L: c3, L+1: c1
		For yy = 0 To 15
			If yy = 0 Then Print #f, "    ._sprite_" & sprite & "_b"
			o = "        defb "
			ac = ReadBinValue (x + 8, y+yy)
			o = o + Trim (Str(ac))
			If yy > 0 Then 
				o = o + ", " 
			Else 
				Print #f, o
				o = "        defb "
			End If
			If yy = 0 Then Print #f, "    ._sprite_" & (sprite+1) & "_b"
			ac = ReadBinValue (x + 24, y+yy)		
			o = o + Trim (Str(ac))
			print #f, o
		Next yy
		For yy = 0 To 7
			Print #f, "        defb 0, 0"
		Next yy

		' Sprite L+1: c2, c3
		For yy = 0 To 15
			If yy = 0 Then Print #f, "    ._sprite_" & sprite & "_c"
			o = "        defb "
			ac = 0		
			o = o + Trim (Str(ac))
			If yy > 0 Then 
				o = o + ", " 
			Else 
				Print #f, o
				o = "        defb "
			End If
			If yy = 0 Then Print #f, "    ._sprite_" & (sprite+1) & "_c"
			ac = 0
			o = o + Trim (Str(ac))
			print #f, o
		Next yy
		For yy = 0 To 7
			Print #f, "        defb 0, 0"
		Next yy

		x = x + 32
		if x = 256 then
			y = y + 16
			x = 0
		end if
	Next
Else
	for i = 0 to 7: print #f, "        defb 0, 255":next i: print #f, " "
	For sprite = 1 to 16

		' Primera columna 
		
		print #f, "    ._sprite_" + Trim (Str(Sprite)) + "_a"
		
		' Ahora tengo que calcular los dos valores de la primera columna
		for yy = 0 to 15
			o = "        defb "
			ac = ReadBinValue (x, y+yy)		
			o = o + Trim (Str(ac)) + ", "
			ac = ReadBinValue (x + 16, y+yy)
			o = o + Trim (Str(ac))
			print #f, o
		next yy
		for yy = 0 to 7
			print #f, "        defb 0, 255"
		next yy
		print #f, " "
		
		' Segunda columna 
		
		print #f, "    ._sprite_" + Trim (Str(Sprite)) + "_b"
		
		' Ahora tengo que calcular los dos valores de la primera columna
		for yy = 0 to 15
			o = "        defb "
			ac = ReadBinValue (x + 8, y+yy)		
			o = o + Trim (Str(ac)) + ", "
			ac = ReadBinValue (x + 24, y+yy)
			o = o + Trim (Str(ac))
			print #f, o
		next yy
		for yy = 0 to 7
			print #f, "        defb 0, 255"
		next yy
		print #f, " "
		
		' Tercera columna
		
		print #f, "    ._sprite_" + Trim (Str(Sprite)) + "_c"
		for yy = 0 to 23
			print #f, "        defb 0, 255"
		next yy
		print #f, " "
		
		x = x + 32
		if x = 256 then
			y = y + 16
			x = 0
		end if
	Next sprite
End If

print #f, "#endasm"
print #f, " "

Close f

puts "¡Todo correcto!"