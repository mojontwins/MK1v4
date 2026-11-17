' motorlutgen.bas

Const PI = 3.1415926535897932

Sub usage
	Print "usage:"
	Print
	Print "motorlutgen.exe MAX_V out.h"
End Sub

Dim As Integer i, j, fOut
Dim As Integer maxV
Dim As Integer rowV
Dim As Double angle, valT

If Len (Command (2)) = 0 Then usage: End

maxV = Val (Command (1))

fOut = FreeFile
Open Command (2) For Output As #fOut

Print #fOut, "// MotorLUT! Generated for max V = " & maxV
Print #fOut, "// Copyleft 2025 by The Mojon Twins"
Print #fOut, ""
Print #fOut, "extern signed char motor_lut [0];"
Print #fOut, "#asm"
Print #fOut, "	._motor_lut"

' Scale 0..15 -> 0..MAX_V
' v = i * MAX_V/15

For i = 0 To 15

	rowV = i * maxV / 15

	Print #fOut, "	defw ";

	For j = 0 To 15
		' Angle is (2*PI / 16) * j
		angle = 2 * PI * j / 16
		valT = rowV * sin (angle)

		' Output valT as 10.6 fixed signed.

		Print #fOut, "0x" & Hex (Int (valT), 4);
		if j < 15 Then Print #fOut, ", ";

	Next j

	Print #fOut, "	// For V = " & rowV

Next i

Print #fOut, "#endasm"

Close
