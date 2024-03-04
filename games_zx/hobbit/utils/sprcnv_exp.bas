#include "fbpng.bi"
#include "fbgfx.bi"
#include once "crt.bi"

#define RGBA_R( c ) ( CUInt( c ) Shr 16 And 255 )
#define RGBA_G( c ) ( CUInt( c ) Shr  8 And 255 )
#define RGBA_B( c ) ( CUInt( c )        And 255 )
#define RGBA_A( c ) ( CUInt( c ) Shr 24         )

Dim Shared As Any Ptr img 			' will contain the image loaded from the PNG

Function inCommand (spec As String) As Integer
	Dim As Integer res, i

	i = 0: res = 0

	Do
		If Command (i) = "" Then Exit Do
		If Command (i) = spec Then res = -1: Exit Do
		i = i + 1
	Loop

	Return res
End Function

Sub Usage () 
	Print "** USO **"
	Print "   sprcnv2 archivo.png archivo.h n [nomask] [extra] [tall]"
	Print
	Print "Convierte un Spriteset de n sprites"
	Print
	Print "Experimental version"
	Print "- Won't generate third column (1/3 savings in spriteset size)"
	Print "- tall will cut the first 8 frames As 16x24"
End Sub

Function ReadBinValue (x As Integer, y As Integer) As Integer
	Dim As Integer ac, xx, p1
	ac = 0
	For xx = 0 To 7
		p1 = point (x + xx, y, img)
		If RGBA_R (p1) <> 0 Or RGBA_G (p1) <> 0 Or RGBA_B (p1) <> 0 Then
			ac = ac + 2 ^ (7 - xx)
		end If
	Next xx
	Return ac
End Function

Function labelName (extra As Integer, i As Integer) As String
	If i <= 16 Or extra = 0 Then Return "sprite"
	Return "extra_sprite"
End Function

'
'
'

Dim As String filename, o
Dim As integer i, j, f, sprite, x, y, xx, yy, ac, nomask, extra, n, s
Dim As unsigned long p1, p2
Dim As Integer tallMain, vertSize

If Len (Command (1)) = 0 Or Len (Command (2)) = 0 Or len (Command (3)) = 0 Then 
	Usage
	End
End If

If inCommand ("nomask") Then nomask = -1 Else nomask = 0
If inCommand ("extra") Then extra = -1 Else extra = 0
if inCommand ("tall") then tallMain = -1 Else tallMain = 0

' Primero cargo el archivo de imagen
screenres 640, 480, 32, , -1

filename = Command (1)
img = png_load ( filename )

If img Then
'	put( 0, 0 ), img
'	deallocate( img )
Else
	Print "Failed To load"
end If

' Ahora lo recorro y voy generando el código con sus etiquetas y
' sus mascaritas y toda la pesca

f = FreeFile

Open Command (2) For Output As f

Print #f, "// MTE MK1 (la Churrera) v5.0"
Print #f, "// Copyleft 2010-2014, 2020 by the Mojon Twins"
Print #f, ""
Print #f, "// Sprites.h"
If nomask Then Print #f, "// No masks"
Print #f, " "

For sprite = 1 To Val (Command (3))

	Print #f, "extern unsigned char " & labelName (extra, sprite) & "_" + Trim(Str(sprite)) + "_a []; "
	Print #f, "extern unsigned char " & labelName (extra, sprite) & "_" + Trim(Str(sprite)) + "_b []; "
Next sprite

Print #f, " "

Print #f, "#asm"

x = 0
y = 0

If nomask Then
	For i = 0 To 7: Print #f, "        defb 0, 0": Next i: Print #f, " "
Else
	For i = 0 To 7: Print #f, "        defb 0, 255": Next i: Print #f, " "
Endif

n = Val (Command (3))
If nomask Then
	s = 2
Else
	s = 1
end If

For sprite = 1 To n Step s
	If tallMain And sprite <= 8 Then
		vertSize = 23
	Else
		vertSize = 15
	End If

	' Primera columna 
	
	If nomask Then
		Print #f,"; Sprites #" & str (sprite-1) & " y " & str (sprite)
	Else
		Print #f,"; Sprite #" & str (sprite-1) &" y máscara"
	end If
	Print #f,"; Primera columna"
	Print #f, "    ._" & labelName (extra, sprite) & "_" + Trim (Str(Sprite)) + "_a"
	
	' Ahora tengo que calcular los dos valores de la primera columna
	For yy = 0 To vertSize
		o = "        defb "
		ac = ReadBinValue (x, y+yy)		
		If nomask And yy = 0 Then
			o = o + "0x" + Trim (Hex(ac, 2))
			Print #f, o
			o = "        defb "
			Print #f, "    ._" & labelName (extra, sprite+1) & "_" + Trim (Str(Sprite+1)) + "_a"
		Else
			o = o + "0x" + Trim (Hex(ac, 2)) + ", "
		End If
		ac = ReadBinValue (x + 16, y+yy)
		o = o + "0x" + Trim (Hex(ac, 2))
		Print #f, o
	Next yy
	For yy = 0 To 7
		If nomask Then 
			Print #f, "        defb 0x00, 0x00"
		Else
			Print #f, "        defb 0x00, 0xFF"
		end If
	Next yy
	Print #f, " "
	
	' Segunda columna 
	
	Print #f,"; Segunda columna"
	Print #f, "    ._" & labelName (extra, sprite) & "_" + Trim (Str(Sprite)) + "_b"
	
	' Ahora tengo que calcular los dos valores de la primera columna
	For yy = 0 To vertSize
		o = "        defb "
		ac = ReadBinValue (x + 8, y+yy)		
		If nomask And yy = 0 Then
			o = o + "0x" + Trim (Hex(ac, 2))
			Print #f, o
			o = "        defb "
			Print #f, "    ._" & labelName (extra, sprite+1) & "_" + Trim (Str(Sprite+1)) + "_b"
		Else
			o = o + "0x" + Trim (Hex(ac, 2)) + ", "
		End If
		ac = ReadBinValue (x + 24, y+yy)
		o = o + "0x" + Trim (Hex(ac, 2))
		Print #f, o
	Next yy
	For yy = 0 To 7
		If nomask Then 
			Print #f, "        defb 0x00, 0x00"
		Else
			Print #f, "        defb 0x00, 0xFF"
		end If
	Next yy
	Print #f, " "	
	
	x = x + 32
	If x = 256 Then
		y = y + vertSize + 1
		x = 0
	end If
	
Next sprite

Print #f, "#endasm"
Print #f, " "

Close f

puts "¡Todo correcto!"