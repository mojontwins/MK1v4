#include "mtparser.bi"

Type WordEntry
	word As String
	count As Integer
End Type

Sub usage ()
	Print "usage:"
	print "$ import_text input output [min]"
End Sub

Dim Shared As WordEntry wordsWithCount (32767)
Dim Shared As String tokens (255)

Sub parseTokenizeStringIncludeIgnore (inString As String, tokens () As String, ignore As String, break As String)
	Dim As String m
	Dim As Integer i, l, windex, quotes

	parseCleanTokens tokens ()

	inString = inString + " "
	l = Len (inString)
	windex = 0: quotes = 0
	For i = 1 To l 
		m = Mid (inString, i, 1)
		If quotes Then
			If m = Chr (34) Then 
				quotes = 0
			Else
				tokens (windex) = tokens (windex) & m 
			End If 
		Else 
			If Instr (break, m) Then
				Exit For
			'ElseIf Instr (ignore, m) Then
				' ignore
			ElseIf m = Chr (34) Then
				quotes = -1
			'ElseIf m = " " Then
			ElseIf m = " " Or Instr (ignore, m) Then
				If m = " " Then tokens(windex) = tokens (windex) & m
				If tokens (windex) <> "" Then 
					If windex < uBound (tokens) Then
						windex = windex + 1
					End If
				End If

				If m <> " " Then 
					tokens(windex) = m					
				End If
			Else
				tokens (windex) = tokens (windex) & m 
			End If
		End If
	Next i
End Sub

Function encode (lineIn As String, maxI As Integer) As String
	Dim As String res, word
	Dim As Integer tokenIdx, i, found

	res = ""
	parseCleanTokens tokens ()
	parseTokenizeStringIncludeIgnore lineIn, tokens (), ",.:!", "*"

	tokenIdx = 0
	While tokens(tokenIdx) <> ""
		word = Trim(tokens(tokenIdx))
		found = 0
		For i = 0 To maxI
			If wordsWithCount (i).word = word Then 
				' Found: add 56 + i
				res = res & Chr(56 + i)
				? "W(" & i & ") ";
				found = -1
			End If
		Next i
		If found = 0 Then
			' Not Found: spell (encoded)
			For i = 1 To Len (tokens (tokenIdx))
				res = res & Mid(tokens (tokenIdx), i, 1)				
			Next i 
			? tokens(tokenIdx);
		End If

		tokenIdx = tokenIdx + 1
	Wend
?
	return res
End Function

Dim As Integer fIn, fOut
Dim As String fileNameIn, fileNameOut
Dim As String lineIn, lineOut, wAux
Dim As Integer tokenIdx
Dim As Integer wordIdx, i, j, found, cAux, maxI, nLines, minL
Dim As Single percent, tPercent

Print "import_text v0.1.20231004 ~ ";

' Parse params

fileNameIn = Command (1)
fileNameOut = Command (2)
minL = Val(Command(3)): If minL < 2 Then minL = 2
If fileNameOut = "" Then usage: End

' Step 1: read & count all words

wordIdx = 0

fIn = FreeFile
Open fileNameIn For Input As #fIn
While Not Eof (fIn)
	Line Input #fIn, lineIn
	parseCleanTokens tokens ()
	parseTokenizeString lineIn, tokens (), ",.:!", "*"

	tokenIdx = 0
	While tokens(tokenIdx) <> ""
		If(Len(tokens(tokenIdx)) >= minL) Then
			found = 0
			For i = 0 To wordIdx - 1
				If wordsWithCount (i).word = tokens (tokenIdx) Then 
					wordsWithCount (i).count = wordsWithCount (i).count + 1
					found = -1
				End If
			Next i
			If found = 0 Then
				wordsWithCount (wordIdx).word = tokens (tokenIdx)
				wordsWithCount (wordIdx).count = 1
				wordIdx = wordIdx + 1
			End If
		End If

		tokenIdx = tokenIdx + 1
	Wend
Wend
Close #fIn

' Step 2: order
For i = 0 To wordIdx - 1
	For j = i + 1 to wordIdx - 1
		If wordsWithCount(j).count > wordsWithCount(i).count Then
			cAux = wordsWithCount(i).count
			wAux = wordsWithCount(i).word 
			wordsWithCount(i).count = wordsWithCount(j).count
			wordsWithCount(i).word = wordsWithCount(j).word 
			wordsWithCount(j).count = cAux 
			wordsWithCount(j).word = wAux 
		End If 
	Next j 
Next i

maxI = wordIdx - 1
If (maxI > 199) Then maxI = 199 

fIn = FreeFile
Open fileNameIn For Input As #fIn
While Not Eof (fIn)
	Line Input #fIn, lineIn
	lineOut = encode(lineIn, maxI)
	percent = (len (lineOut) * 100 / len(lineIn))
	tPercent = tPercent + percent
	nLines = nLines + 1
	? "IN: " & Len(lineIn) & " - OUT: " & len(lineOut) & " %=" & percent
Wend
Close #fIn

?"Percent : " & (tPercent / nLines)

