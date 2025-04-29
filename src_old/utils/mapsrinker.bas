''
'' This program will shrink a NES map (16x12) to a C64 map (16x10)
'' of course this conversion is LOSSY and you'll have to retouch the map.
''

'' I'll try and make this a bit intelligent just as an exercise and 'cause I'm
'' mildly bored. I mean, I will try to select which two rows have to go in
'' each screen based upon complexity.

'' Let's say that the first and last rows are untouched. From the rest, let's
'' select the two which are less complex and delete them.

'' This will probably end up being over-complex for no reason and the results
'' won't be better than those obtained by simply removing two equally spaced 
'' rows (for instance rows 4 & 7)

'' Let's work with REAL data, I mean, let's feed actual behaviour data.
'' Complexity = the sum of changes from tile behaviours 0, 1, 4 and 8.

#include "cmdlineparser.bi"
#include "mtparser.bi"

Sub usage
	Print "Mapsrinker v0.1.20220722 shrinks a NES/SG1000 16x12 map to C64 16x10"
	Print "usage:"
	Print "$ mapsrinker in=input.map out=output.map size=w,h behs=<comma separated list> [verbose]"
End Sub

' Vars
Dim As Integer f, w, h, i, j, x, y, xx, yy, tidx, nPant, maxPants, prev
Redim As uByte myMap (0, 0, 0)
Redim As uByte outputMap (0, 0, 0)
Dim As uByte d
Dim As Integer onlyWidthExtrude, sizeT, module

Dim As String mandatory (3) => { "in", "out", "size", "behs" }
Dim As Integer behs (63), coords (9), complexity (11), order (11)
Dim As Integer verbose

sclpParseAttrs
If Not sclpCheck (mandatory ()) Then usage: End

parseCoordinatesString sclpGetValue ("behs"), behs ()
parseCoordinatesString sclpGetValue ("size"), coords ()

verbose = (sclpGetValue ("verbose") <> "")

w = coords (0): h = coords (1)
maxPants = w*h
Redim myMap (maxPants - 1, 15, 11)
Redim outputMap (maxPants - 1, 15, 9)

' read map
f = Freefile
Open sclpGetValue ("in") For Binary as #f

' Read maxPants screens worth of tiles (16x12=192 per screen)
For tidx = 0 To maxPants * 192 - 1
	' Screen location
	x = (tidx \ 16) Mod w
	y = tidx \ (w * 192)
	nPant = y * w + x
	
	' Screen coordinates
	xx = tidx Mod 16
	yy = (tidx \ (16 * w)) Mod 12
	
	' Read byte
	Get #f, , d
	
	' Write to mem
	myMap (nPant, xx, yy) = d
Next tidx

Close f

' Process every screen
For nPant = 0 To maxPants - 1

	' Calculate the complexity of all lines 1-10
	
	complexity (0) = 99: complexity (11) = 99 	' Never chose these

	For y = 1 To 10
		prev = behs (myMap (nPant, 0, y))
		If verbose Then Print Hex (prev, 1);
		complexity (y) = 0
		For x = 1 To 15
			If verbose Then Print Hex (behs (myMap (nPant, x, y)), 1);
			If behs (myMap (nPant, x, y)) <> prev Then	
				complexity (y) = complexity (y) + 1 
				prev = behs (myMap (nPant, x, y))
			End If 			
		Next x
		If verbose Then Print "="; complexity (y)
	Next y

	' Bubble sort the complexity array 
	For y = 0 To 11: order (y) = y: Next y

	For i = 0 To 10
		For j = 0 To 10 - i
			If complexity (j) > complexity (j + 1) Then
				Swap complexity (j), complexity (j + 1)
				Swap order (j), order (j + 1)
			End If 
		Next j 
	Next i

	If verbose Then 
		Print "Least complex lines = " & order (0) & " (" & complexity (0) & ") & " & order (1) & " (" & complexity (1) & ")"
		Print
	End If

	' Copy to new map skipping two least complex lines

	yy = 0
	For y = 0 To 11 
		If y <> order (0) And y <> order (1) Then
			For x = 0 To 15
				outputMap (nPant, x, yy) = myMap (nPant, x, y)
			Next x
			yy = yy + 1
		End If
	Next y

Next nPant

' Write results
f = Freefile
Open sclpGetValue ("out") For Binary As #f 

sizeT = 160: module = 10 

For tidx = 0 To maxPants * sizeT - 1 
	' Screen location
	x = (tidx \ 16) Mod w
	y = tidx \ (w * sizeT)
	nPant = y * w + x
	
	' Screen coordinates
	xx = tidx Mod 16
	yy = (tidx \ (16 * w)) Mod module
		
	Put #f, , outputMap (nPant, xx, yy)
Next tidx

Close 

Print "mapsrinker v0.1.20220722, " & sclpGetValue ("in") & " shrinked into " & sclpGetValue ("out") & ". " & maxPants & " screens processed."
