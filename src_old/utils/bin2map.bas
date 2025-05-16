' bin2map 

Sub usage
	Print "usage:"
	Print
	Print "bin2map.exe in.bin out.map w h scrw scrh [packed]"
End Sub

Dim As Integer packed
Dim As Integer x, y, scrSize, nPants, fIn, fOut, i, j, xx, yy
Dim As Integer w, h, scrw, scrh
ReDim As uByte fullMap(0, 0)
Dim As uByte d

If Command (6) = "" Then usage: End

packed = (Command (7) = "packed")
w = Val(Command (3))
h = Val(Command (4))
scrw = Val(Command (5))
scrh = Val(Command (6))

ReDim As uByte fullMap (w * scrw - 1, h * scrh - 1)

fIn = FreeFile
Open Command (1) For Binary As #fIn

If packed Then scrSize = 75 Else scrSize = 150
nPants = Lof (fIn) / scrSize

Print "Found " & nPants & " in " & Command (1) & ", ";
If nPants = w * h Then Print "which seems right." Else Print "which isn't really what I expected."

xx = 0: yy = 0

For i = 0 To nPants -1 

	x = 0: y = 0
	For j = 0 To scrSize - 1
		Get #fIn, , d 

		If packed Then
			fullMap (xx + x, yy + y) = d \ 16
			x = x + 1: If x = scrw Then x = 0 : y = y + 1 
			fullMap (xx + x, yy + y) = d Mod 16
			x = x + 1: If x = scrw Then x = 0 : y = y + 1 
			
		Else
			fullMap (xx + x, yy + y) = d
			x = x + 1: If x = scrw Then x = 0 : y = y + 1 

		End If

	Next j 

	xx = xx + scrw: If xx = scrw * w Then xx = 0: yy = yy + scrh

Next i

Close #fIn

Print "Writing map (which should be " & (w * scrw) & " x " & (h * scrh) & " tiles."

fOut = FreeFile
Open Command (2) For Binary As #fOut

For i = 0 To h * scrh - 1
	For j = 0 To w * scrw - 1
		Put #fOut, , fullMap (j, i)
	Next j
Next i

Close #fOut
