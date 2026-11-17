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
	Print "   sprcnv2 archivo.png archivo.h n [nomask]"
	Print
	Print "Convierte un Spriteset de n sprites"
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

Function labelName (extra As Integer, i As Integer) As String
	If i <= 16 Or extra = 0 Then Return "sprite"
	Return "extra_sprite"
End Function

'
'
'

Dim as String filename, o
Dim as integer i, j, f, sprite, x, y, xx, yy, ac, nomask, extra, n, s
Dim as unsigned long p1, p2

If Len (Command (1)) = 0 Or Len (Command (2)) = 0 Or len (Command (3)) = 0 Then 
	Usage
	End
End If

If inCommand ("nomask") Then nomask = -1 else nomask = 0
If inCommand ("extra") Then extra = -1 else extra = 0

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

for sprite = 1 to Val (Command (3))

	print #f, "extern unsigned char " & labelName (extra, sprite) & "_" + Trim(Str(sprite)) + "_a []; "
	print #f, "extern unsigned char " & labelName (extra, sprite) & "_" + Trim(Str(sprite)) + "_b []; "
	print #f, "extern unsigned char " & labelName (extra, sprite) & "_" + Trim(Str(sprite)) + "_c []; "
next sprite

print #f, " "

print #f, "#asm"

x = 0
y = 0

if nomask then
	for i = 0 to 7: print #f, "        defb 0, 0": next i: print #f, " "
else
	for i = 0 to 7: print #f, "        defb 0, 255":next i: print #f, " "
endif

n = Val (Command (3))
If nomask then
	s = 2
else
	s = 1
end if

For sprite = 1 To n Step s

	' Primera columna 
	
	if nomask then
		print #f,"; Sprites #" & str (sprite-1) & " y " & str (sprite)
	else
		print #f,"; Sprite #" & str (sprite-1) &" y máscara"
	end if
	print #f,"; Primera columna"
	print #f, "    ._" & labelName (extra, sprite) & "_" + Trim (Str(Sprite)) + "_a"
	
	' Ahora tengo que calcular los dos valores de la primera columna
	for yy = 0 to 15
		o = "        defb "
		ac = ReadBinValue (x, y+yy)		
		If nomask And yy = 0 Then
			o = o + Trim (Str(ac))
			Print #f, o
			o = "        defb "
			print #f, "    ._" & labelName (extra, sprite+1) & "_" + Trim (Str(Sprite+1)) + "_a"
		Else
			o = o + Trim (Str(ac)) + ", "
		End If
		ac = ReadBinValue (x + 16, y+yy)
		o = o + Trim (Str(ac))
		print #f, o
	next yy
	for yy = 0 to 7
		if nomask then 
			print #f, "        defb 0, 0"
		else
			print #f, "        defb 0, 255"
		end if
	next yy
	print #f, " "
	
	' Segunda columna 
	
	print #f,"; Segunda columna"
	print #f, "    ._" & labelName (extra, sprite) & "_" + Trim (Str(Sprite)) + "_b"
	
	' Ahora tengo que calcular los dos valores de la primera columna
	for yy = 0 to 15
		o = "        defb "
		ac = ReadBinValue (x + 8, y+yy)		
		If nomask And yy = 0 Then
			o = o + Trim (Str(ac))
			Print #f, o
			o = "        defb "
			print #f, "    ._" & labelName (extra, sprite+1) & "_" + Trim (Str(Sprite+1)) + "_b"
		Else
			o = o + Trim (Str(ac)) + ", "
		End If
		ac = ReadBinValue (x + 24, y+yy)
		o = o + Trim (Str(ac))
		print #f, o
	next yy
	for yy = 0 to 7
		if nomask then 
			print #f, "        defb 0, 0"
		else
			print #f, "        defb 0, 255"
		end if
	next yy
	print #f, " "
	
	' Tercera columna
	
	print #f, "; tercera columna"
	print #f, "    ._" & labelName (extra, sprite) & "_" + Trim (Str(Sprite)) + "_c"
	for yy = 0 to 23
		o = "        defb "
		ac = 0
		If nomask And yy = 0 Then
			o = o + Trim (Str(ac))
			Print #f, o
			o = "        defb "
			print #f, "    ._" & labelName (extra, sprite+1) & "_" + Trim (Str(Sprite+1)) + "_c"
		Else
			o = o + Trim (Str(ac)) + ", "
		End If
		If nomask Then
			ac = 0
		Else
			ac = 255
		End If
		o = o + Trim (Str(ac))
		print #f, o
	next yy
	print #f, " "
	
	x = x + 32
	if x = 256 then
		y = y + 16
		x = 0
	end if
	
next sprite

print #f, "#endasm"
print #f, " "

Close f

puts "¡Todo correcto!"