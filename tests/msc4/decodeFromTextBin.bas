#include "mt5bitEsc.bi"

Redim As ubyte mainBin (0)
Dim As Integer fIn, idx, offset

If Command (2) = "" Then 
	Print "Usage: decodeFromTextBin.exe text.bin offset"
	End
End If

fIn = FreeFile
Open Command (1) For Binary As #fIn

Redim As uByte mainBin (Lof (fIn))

While Not Eof (fIn)
	Get #fIn, , mainBin (idx): idx = idx + 1
Wend

Close #fIn

offset = Val(Command (2))

Print "Text in bin from " & offset
Print "[" & decodeBin (mainBin (), offset) & "]"
Print "[" & decodeBinDebug (mainBin (), offset) & "]"

