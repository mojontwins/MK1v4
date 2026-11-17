' ene2bin_mk1v4.bas v0.8.20250311-v4

' Commands first draft
' CMD=C,T,O,V where C = command, T = type, O = output member, V = value
'
' First version CMD=S,T,O,V (SET), example CMD=S,15,Y2,0, sets Y2=0 for t=15

' Have to parse & encode commands into a numeric array.
' Then 'Run' the array for each enemy processed.

#include "mtparser.bi"
#include "cmdlineparser.bi"

Type CMD
	cmd As String * 1
	t As Integer
	o As String * 2
	v As Integer
End Type

Sub usage
	Print
	Print "$ ene2bin_mk1v4.exe enems.ene|empty=W,H,N enems.bin [2bytes] [dslight|dsall] [compacted] [indexed] [CMD=C,T,O,V] [marrullers] [life]"
	Print
	Print "empty en vez de enems.ene generará todo a 0 contando WxH con N enems"
	Print
	Print "2bytes (optional) - support really old .ene files which stored the hotspots"
	Print "    2 bytes each instead of 3 bytes.  As a rule of thumb: "
	Print "    * .ene file created with ponedor.exe -> 3 bytes."
	Print "    * .ene file created with colocador.exe for MK1 -> 2 bytes."
	Print
	Print "dslight (optional) - x1/x2 and y1/y2 are usually switched to make sure 1<2."
	Print "    If 'dslight' is specified, only types 1-4 and 7-14 are switched."
	Print
	Print "dsall (optional) - Like dslight, but only types 1-4 are switched."
	Print
	Print "compacted (optional) - pack x1, y1 and x2, y2 in 1 byte XY each."
	Print
	Print "indexed (optional) - stores only existing enemies + an index."
	Print
	Print "marrullers (optional) - enems 11-14 are marrullers & will make x1=1, y1=1, x2=13, y2=8"
	Print
	Print "life (optionals) - saves an extra byte = 0 to store life."
End Sub

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

Const DS_NONE = 0
Const DS_LIGHT = 1
Const DS_ALL = 2

Dim As Integer use2bytes, dontswitch
Dim As Integer fIn, fOut, i, j, k, mapPants
Dim As uByte d, mapW, mapH, nEnems
Dim As uByte t, a, b, xx, yy, mn, x, y, s1, s2, xy, whichCommand
Dim As Integer typeCounters (255)
Dim As Integer enTypeCounters (255)
Dim As String Dummy, cmm
Dim As Integer sx, sy, equals
Dim As Integer compacted
Dim As Integer marrullers
Dim As Integer indexed
Dim As Integer coords (16)
Dim As Integer outX, outY, outX1, outX2, outY1, outY2, outMX, outMY, outT
Dim As CMD cmds (31)
Dim As Integer cmdIndex
Dim As String tokens (16)
Dim As Integer enoffsIndex(999)
Dim As Integer nonEmptyEnems
Dim As Integer first
Dim As Integer empty
Dim As Integer bytecounter
Dim As Integer exportLife

Print "ene2bin_mk1v4.bas v0.8.20250311-v4 ";

sclpParseAttrs

If Command (2) = "" Then usage: End

For i = 0 To 255
	enTypeCounters (i) = 0
	typecounters (i) = 0
Next i

use2bytes = inCommand ("2bytes")

If inCommand ("dsall") Then 
	dontswitch = DS_ALL
ElseIf inCommand ("dslight") Then
	dontswitch = DS_LIGHT
Else
	dontswitch = DS_NONE
End If

compacted = inCommand ("compacted")

marrullers = inCommand ("marrullers")

indexed = inCommand ("indexed")

exportLife = inCommand ("life")

empty = sclpGIsDef ("empty")
If empty Then
	parseCommaSeparatedString sclpGetValue ("empty"), tokens ()
	mapW = Val (tokens (0))
	mapH = Val (tokens (1))
	nEnems = Val (tokens (2))
End If 

' Look for & parse CMDs
i = 3
cmdIndex = 0
While (Command (i) <> "")
	If Len (Command (i)) > 4 And Left (Command (i), 4) = "CMD=" Then
		parseCommaSeparatedString Right (Command (i), Len (Command (i)) - 4), tokens ()
		cmds (cmdIndex).cmd = tokens (0)
		cmds (cmdIndex).t = Val (tokens(1))
		cmds (cmdIndex).o = tokens(2)
		cmds (cmdIndex).v = Val (tokens(3))
		cmdIndex = cmdIndex + 1
	End If
	i = i + 1
Wend

If cmdIndex > 0 Then Print "~ " & cmdIndex & " commands found ";

If Not empty Then 
	fIn = FreeFile
	Open Command (1) For Binary As #fIn
End If 

fOut = FreeFile
Open Command (2) For binary As #fOut

' Header
If Not empty Then 
	dummy = Input (256, fIn)
	Get #fIn, , d: mapW = d
	Get #fIn, , d: mapH = d
	Get #fIn, , d: Get #fIn, , d
	Get #fIn, , d: nEnems = d
End If

mapPants = mapW * mapH

first = -1
For i = 1 To mapPants
	enoffsIndex (i-1) = nonEmptyEnems
	For j = 1 To nEnems

		If empty Then 
			t = 0
			x = 0
			y = 0
			xx = 0
			yy = 0
			mn = 0
			s1 = 0
			s2 = 0
		Else
			Get #fIn, , t
			Get #fIn, , x
			Get #fIn, , y
			Get #fIn, , xx
			Get #fIn, , yy 
			Get #fIn, , mn
			Get #fIn, , s1
			Get #fIn, , s2
		End If

		outX = 16*x: outY = 16*y

		enTypeCounters (t) = enTypeCounters (t) + 1

		' New logic to ensure x1 < x2, y1 < y2
		sx = Sgn (xx - x)
		sy = Sgn (yy - y)

		If dontswitch = DS_NONE Or _ 
			(dontswitch = DS_LIGHT And (t < 5 Or (t > 6 And t < 15))) Or _ 
			(dontswitch = DS_ALL And t < 5) Then
			If x > xx Then Swap x, xx 
			If y > yy Then Swap y, yy
		End If

		outX1 = 16*x: outY1 = 16*y
		outX2 = 16*xx: outY2 = 16*yy
		outMX = mn*sx: outMY = mn*sy
		outT = t

		' Marrullers
		If marrullers And t >= 11 And t <= 14 Then 
			outX1 = 16: outX2 = 13 * 16
			outY1 = 16: outY2 = 8 * 16
		End If

		' Run commands
		For k = 0 To cmdIndex - 1
			If cmds (k).t = t Then 
				Select Case cmds (k).cmd
					Case "S":
						' Setter
						Select Case cmds (k).o
							Case "X": outX = cmds (k).v
							Case "Y": outY = cmds (k).v
							Case "X1": outX1 = cmds (k).v: x = cmds (k).v
							Case "Y1": outY1 = cmds (k).v: y = cmds (k).v
							Case "X2": outX2 = cmds (k).v: xx = cmds (k).v
							Case "Y2": outY2 = cmds (k).v: yy = cmds (k).v
							Case "MX": outMX = cmds (k).v
							Case "MY": outMY = cmds (k).v
							Case "T": outT = cmds (k).v
						End Select
				End Select
			End If
		Next k

		If Not indexed Or outT <> 0 Then
		
			d = outX: Put #fOut, , d
			d = outY: Put #fOut, , d

			bytecounter = bytecounter + 2

			If compacted Then
				d = (16*(outX1/16) + (outY1/16)): Put #fOut, , d 
				d = (16*(outX2/16) + (outY2/16)): Put #fOut, , d
				bytecounter = bytecounter + 2
			Else
				d = outX1: Put #fOut,, d
				d = outY1: Put #fOut,, d
				d = outX2: Put #fOut,, d
				d = outY2: Put #fOut,, d
				bytecounter = bytecounter + 4
			End If

			d = outMX: Put #fOut,, d
			d = outMY: Put #fOut,, d
						
			d = outT: Put #fOut,, d
			bytecounter = bytecounter + 3

			If exportLife Then
				d = 0: Put #fOut,, d
				bytecounter = bytecounter + 1
			End If

			nonEmptyEnems = nonEmptyEnems + 1
		End If
	Next j

Next i

Print "Enemies = " & bytecounter & " bytes, ";
bytecounter = 0

' New: Index
If indexed Then
	For j = 0 To mapH - 1
		
		For i = 0 To mapW - 1
			d = enoffsIndex(k) And 255: Put #fOut,, d
			d = enoffsIndex(k)  \  256: Put #fOut,, d
			bytecounter = bytecounter + 2
		Next i
	Next j

	Print "Index = " & bytecounter & " bytes, ";
	bytecounter = 0
End If

For i = 1 To mapPants
	If empty Then
		xy = 0
		t = 0
	Else 
		If use2bytes Then
			Get #fIn, , xy
			Get #fIn, , t
		Else
			Get #fIn, , x
			Get #fIn, , y
			Get #fIn, , t
			xy = (x Shl 4) Or (y And 15)
		End If
	End If

	typeCounters (t) = typeCounters (t) + 1

	d = xy: Put #fOut, , d 
	d = t: Put #fOut, , d
	d = 0: Put #fOut , , d
	bytecounter = bytecounter + 3
Next i

Print "Hotspots = " & bytecounter & " bytes. ";

Close


Print " ~ DONE"
