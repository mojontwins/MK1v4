' enresizer v0.4.20210615-v4
' fbc enresizer.bas cmdlineparser.bas mtparser.bas

#include "cmdlineparser.bi"
#include "mtparser.bi"

sub usage
	Print "usage:"
	Print 
	Print "$ enresizer in=enems.old.ene out=enems.ene newsize=w,h [offset=x,y] [2bytes] [nenems=nenems]"
	Print "           in is the input filename."
	Print "           out is the output filename."
	Print "           newsize is the new size."
	Print "           offset is the offset to place the old map inside the new."
	Print "           2bytes if this is a legacy ene file."
	Print "           nenems is new # of enems per screen (optional)"
end sub

Dim As Integer fIn, fOut
Dim As Integer mapW, mapH, scrW, scrH, nEnems, mapPants
Dim As Integer mapWn, mapHn
Dim As Integer ctr, i, x, y, t, a
Dim As Integer ofsx, ofsy
Dim As uByte d
Dim As String mandatory (2) = { "in", "out", "newsize" }
Dim As String dummy
Dim As Integer typeCounters (255)
Dim As String*8 enemyChunks (100,100,5)
Dim As String*3 hotspotsChunks (100,100)
Dim As String*2 legacyHotspotsChunks (100,100)
Dim As Integer coords (10)
Dim As Integer legacyMode
Dim As Integer newNEnems

Print "enresizer v0.4.20210615-v4 ";
sclpParseAttrs
If Not sclpCheck (mandatory ()) Then usage: End

parseCoordinatesString sclpGetValue ("newsize"), coords ()
mapWn = coords (0): mapHn = coords (1)

If sclpGetValue ("offset") <> "" Then
	parseCoordinatesString sclpGetValue ("offset"), coords ()
	ofsx = coords (0): ofsy = coords (1)
Else
	ofsx = 0: ofsy = 0
End If

legacyMode = (sclpGetValue ("2bytes") <> "")

newNEnems = Val (sclpGetValue ("nenems"))
If newNEnems = 0 Then newNEnems = nEnems

fIn = FreeFile
Open sclpGetValue ("in") For Binary As #fIn
fOut = FreeFile
Open sclpGetValue ("out") For Binary As #fOut

dummy = Input (256, fIn)
Get #fIn, , d: mapW = d
Get #fIn, , d: mapH = d
Get #fIn, , d: scrW = d
Get #fIn, , d: scrH = d
Get #fIn, , d: nEnems = d

mapPants = mapW * mapH

Put #fOut, , dummy
d = mapWn: Put #fOut, , d
d = mapHn: Put #fOut, , d
d = scrW: Put #fOut, , d
d = scrH: Put #fOut, , d
d = newNEnems: Put #fOut, , d

Print "> " & mapW & "x" & mapH & " -> " & mapWn & "x" & mapHn & " @ offs (" & ofsx & ", " & ofsy & ")"

'' One enemy chunk is exactly 8 bytes.
For y = 0 To mapH-1
	For x = 0 To mapW-1
		For i = 0 To nEnems-1
			dummy = Input (8, fIn)
			enemyChunks (ofsy + y, ofsx + x, i) = dummy
		Next i
	Next x
Next y

'' One hotspot chunk is exactly 3 or 2 bytes.
For y = 0 To mapH-1
	For x = 0 To mapW-1
		If legacyMode Then
			dummy = Input (2, fIn)
			legacyHotspotsChunks (ofsy + y, ofsx + x) = dummy
		Else
			dummy = Input (3, fIn)
			hotspotsChunks (ofsy + y, ofsx + x) = dummy
		End If
	Next x
Next y

'' Now resize!

For y = 0 To mapHn-1
	For x = 0 To mapWn-1
		For i = 0 To newNEnems-1
			Put #fOut, , enemyChunks (y, x, i)
		Next i 
	Next x
Next y

For y = 0 To mapHn-1
	For x = 0 To mapWn-1
		If legacyMode Then
			Put #fOut, , legacyHotspotsChunks (y, x)
		Else
			Put #fOut, , hotspotsChunks (y, x)
		End If
	Next x
Next y

close fIn, fOut
?"DONE!"
