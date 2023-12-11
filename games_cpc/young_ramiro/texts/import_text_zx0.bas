#include "mtparser.bi"

Type WordEntry
	word As String
	count As Integer
End Type

Sub usage ()
	Print "usage:"
	print "$ import_text_zx0 input output [min]"
End Sub

Function processAndOutput(lineIn As String, fOut As Integer) As Integer
	Dim sizeOut As Integer
	Dim fTemp As Integer
	Dim code As Long
	Dim b As Byte

	fTemp = FreeFile
	kill "temp"
	Open "temp" For Binary As fTemp 
	Put #fTemp, , lineIn 
	Close fTemp

	kill "tempbin"
	code = Exec ("zx0.exe", "temp tempbin")

	Open "tempbin" for Binary As fTemp
	While Not Eof(fTemp) 
		Get #fTemp, , b
		Put #fOut, , b 
		sizeOut = sizeOut + 1
	Wend
	Close fTemp 

	return sizeOut 
End Function

Dim As Integer fIn, fOut
Dim As String fileNameIn, fileNameOut
Dim As String lineIn, lineOut, wAux
Dim As Integer tokenIdx
Dim As Integer wordIdx, i, j, found, cAux, maxI, nLines, minL
Dim As Single percent, tPercent
Dim As Integer offsets(255), curOffset
Dim As Integer sizeIn, sizeOut

Print "import_text_zx0 v0.1.20231004 ~ ";

' Parse params

fileNameIn = Command (1)
fileNameOut = Command (2)
minL = Val(Command(3)): If minL < 2 Then minL = 2
If fileNameOut = "" Then usage: End

curOffset = 0
sizeIn = 0
sizeOut = 0

fIn = FreeFile
open fileNameIn For Input as #fIn

kill filenameOut
fOut = Freefile
open filenameOut for Binary as #fOut

While Not Eof(fIn)
	Line Input #fIn, lineIn 
	sizeIn = sizeIn + Len (lineIn)
	sizeOut = sizeOut + processAndOutput (lineIn, fOut)
Wend

Close

Print "SizeIn " & sizeIn & " SizeOut " & sizeOut & " Ratio " & (sizeOut * 100 / sizeIn)
