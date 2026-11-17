' bin2ts v0.1.20250515
' mainBin to tileset (!)

#include "fbpng.bi"
#include once "crt.bi"

Dim Shared As Integer speccyColors (16) => { _
	RGB(0, 0, 0), _
	RGB(0, 0, 192), _ 
	RGB(192, 0, 0), _
	RGB(192, 0, 192), _
	RGB(0, 192, 0), _
	RGB(0, 192, 192), _
	RGB(192, 192, 0), _
	RGB(192, 192, 192),_
	RGB(0, 0, 0), _
	RGB(0, 0, 255), _ 
	RGB(255, 0, 0), _
	RGB(255, 0, 255), _
	RGB(0, 255, 0), _
	RGB(0, 255, 255), _
	RGB(255, 255, 0), _
	RGB(255, 255, 255) _
}

Dim Shared As uByte mainBin(2304) 
Dim Shared As Any Ptr img2

Sub Usage () 
	Print "** USO **"
	Print "   bin2ts in.bin out.png"
	Print
End Sub

Sub drawChar (x As Integer, y As Integer, fromIdx As Integer, c1 As Integer, c2 As Integer) 
	Dim As Integer i, j, c 
	Dim As uByte d

	For i = 0 To 7 
		d = mainBin (fromIdx + i)

		For j = 0 To 7 
			c = c1
			If (d And (2 ^ (7 - j))) = 0 Then c = c2

			Pset img2, (x + j, y + i), speccyColors(c)

		Next j

	Next i

End Sub

Dim As Integer fIn, i, c1, c2, ink, paper, bright, x, y, ai
Dim As uByte d

If Command (2) = "" Then usage: End

' Create output

screenres 640, 480, 32, , -1
img2 = ImageCreate (256, 64)

' Read binary

fIn = FreeFile
Open Command (1) For Binary As #fIn

i = 0
While Not Eof (fIn)
	Get #fIn, , mainBin (i)
	i = i + 1
Wend

Close fIn

' Draw

' 1.- First 64*8 bytes are straight.

x = 0
y = 0

For i = 0 To 63 * 8 Step 8 

	' Build c1, c2 from attribute
	d = mainBin (i / 8 + 2048)

	ink = d And 7
	paper = (d And 63) \ 8
	bright = ((d And 127) \ 64) * 8

	c1 = ink + bright 
	c2 = paper + bright 

	drawChar (x, y, i, c1, c2)

	x = x + 8: If x = 256 Then x = 0: y = y + 8

Next i

' 2.- Next 192*8 bytes are 16x16 tiles

x = 0
y = 16
ai = 2048 + 64

For i = 0 To 47 * 32 Step 32

	' Build c1, c2 from attribute
	d = mainBin (ai): ai = ai + 1

	ink = d And 7
	paper = (d And 63) \ 8
	bright = ((d And 127) \ 64) * 8

	c1 = ink + bright 
	c2 = paper + bright 

	drawChar (x, y, 512 + i, c1, c2)

	' Build c1, c2 from attribute
	d = mainBin (ai): ai = ai + 1

	ink = d And 7
	paper = (d And 63) \ 8
	bright = ((d And 127) \ 64) * 8

	c1 = ink + bright 
	c2 = paper + bright 

	drawChar (x + 8, y, 512 + i + 8, c1, c2)

	' Build c1, c2 from attribute
	d = mainBin (ai): ai = ai + 1

	ink = d And 7
	paper = (d And 63) \ 8
	bright = ((d And 127) \ 64) * 8

	c1 = ink + bright 
	c2 = paper + bright 

	drawChar (x, y + 8, 512 + i + 16, c1, c2)

	' Build c1, c2 from attribute
	d = mainBin (ai): ai = ai + 1

	ink = d And 7
	paper = (d And 63) \ 8
	bright = ((d And 127) \ 64) * 8

	c1 = ink + bright 
	c2 = paper + bright 

	drawChar (x + 8, y + 8, 512 + i + 24, c1, c2)

	x = x + 16: If x = 256 Then x = 0: y = y + 16

Next i


png_save( Command (2), img2 )

puts "Todo correcto!"
