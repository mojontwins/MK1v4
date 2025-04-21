' asm2assemblyString.bas

Dim As Integer fIn, fOut
Dim As String block, linea

If Command (2) = "" Then ? "asm2assemblyString.exe in.asm out.bas": End

fIn = FreeFile
Open Command (1) For Input As #fIn
fOut = FreeFile 
Open Command (2) For Output As #fOut 

block = ""
While Not Eof (fIn)
	Line Input #fIn, linea
	linea = Trim(linea, Any Chr(32) & Chr (9))

	If linea = "" Or Eof (fIn) Then 
		Print #fOut, "writeAssemblyString fOut, """ & block & """"
		block = ""
	Else
		If block <> "" then block = block & "|"
		block = block & linea 
	End If
Wend 

Close 
