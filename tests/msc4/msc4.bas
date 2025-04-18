' MSC4
' Copyleft 2025 by The Mojon Twins

#include "mtparser.bi"
#include "cmdlineparser.bi"

Dim Shared As Integer debug = -1

Dim Shared As String tokens (63)
Dim Shared As Integer curLineNo

Dim Shared As String aliases (128)
Dim Shared As Integer curAliasIndex = 0

Dim Shared As Integer AU (255), CU (255)

Dim Shared As Integer sectOffs (255)
Dim Shared As UByte sectBinary (16383)
Dim Shared As Integer binIdx

Sub shiftTokens (from As Integer)
	' Moves all tokens from `from` to last one step forward
	' Overwriting what's in `from`.
	Dim As Integer i
	For i = from To uBound (tokens) - 1
		tokens (i) = tokens (i + 1)
	Next i
End Sub

Sub debugPrintTokens
	Dim index As Integer = 0
	While index < 64 And tokens(index) <> ""
		Print "T" & index & "=[" & tokens(index) & "]"
		index = index + 1
	Wend
End Sub

Sub printBinStr (s As String)
	Dim As Integer i
	For i = 1 To Len (s) 
		Print Hex (Asc (Mid (s, i, 1)), 2) & " ";
	Next i
	Print
End Sub

Function addOrResolveAlias (salias As String) As Integer
	Dim i As Integer

	' Find
	For i = 0 To curAliasIndex - 1
		If aliases (i) = salias Then 
			Return i 
		End If 
	Next 

	' Not found, add
	If curAliasIndex < uBound (aliases) Then 
		aliases (curAliasIndex) = salias 
		curAliasIndex = curAliasIndex + 1
		return curAliasIndex - 1
	Else
		Print "Warning! Too many aliases, resolving to 0"
		Return 0
	End If

End Function

Sub parseScriptLine (linea As String)
	Dim As Integer i
	Dim As Integer index
	Dim As Integer quotes
	Dim As String curToken, prefix, sufix
	Dim As String indirec
	Dim As String m

	If debug Then Print "Parsing: " & linea

	' Preprocess so = <= >= < > != <> don't need whitespace.
	quotes = 0
	curToken = ""
	i = 1: While i <= Len (linea) 
		m = Mid (linea, i, 1)
		If Instr ("<>=!", m) Then
			If curToken = "" Then index = i
			curToken = curToken & m
		Else 
			If curToken <> "" Then
				'  12345679
				'     /---- i
				'  A!=B
				'   \------ index'
				prefix = "": If index >1 Then prefix = left (linea, index - 1)
				sufix = Right (linea, Len (linea) - i + 1)
				linea = prefix & " " & curToken & " " & sufix 
				i = i + 2

				curToken = ""
			End If
		End If
		i = i + 1
	Wend

	' Tokenize

	parseTokenizeString linea, tokens (), ",()[]", "#"

	' Process to solve %ALIAS -> $n
	' Also do special vars here
	i = 0: While i < uBound (tokens) And tokens (i) <> ""
		If Len(tokens(i)) > 1 And Left (tokens (i), 1) = "%" Then 
			tokens (i) = "$" & addOrResolveAlias (Right (tokens (i), Len (tokens (i)) - 1))
		ElseIf tokens(i) = "NPANT" Or tokens (i) = "N_PANT" Then
			tokens (i) = "$254"
		ElseIf tokens (i) = "PLAYER_X" Then 
			tokens (i) = "$253"
		ElseIf tokens (i) = "PLAYER_Y" Then 
			tokens (i) = "$252"
		ElseIf tokens (i) = "ENEMS_KILLED" Then 
			tokens (i) = "$251" 
		ElseIf tokens (i) = "OBJS" Then
			tokens (i) = "$250"
		ElseIf tokens (i) = "LIFE" Then
			tokens (i) = "$249"
		End If

		i = i + 1
	Wend		

	' Process to solve FLAG n -> $n
	' This should be made recursively so FLAG FLAG FLAG n -> $$$n

	i = 0: While i < uBound (tokens) And tokens (i) <> "" 
		indirec = ""
		While Ucase (tokens (i)) = "FLAG" And i < uBound (tokens)
			indirec = indirec & "$"
			shiftTokens i
		Wend 
		If indirec <> "" Then tokens (i) = indirec & tokens (i)

		i = i + 1
	Wend

	If debug Then debugPrintTokens
End Sub

Function correctLvalue (s As String) As Integer
	Return s <> "" And Left (s, 1) = "$"
End Function

Function isNumberOrVar (s As String) As Integer
	Dim As Integer i
	Dim As String m 

	If correctLvalue (s) Then Return -1 

	For i = 1 To Len (s)
		m = Mid (s, i, 1)
		If m < "0" Or m > "9" Then return 0 
	Next i 

	Return -1
End Function

Function isComp (s As String) As Integer
	return s = "=" Or s = "!=" Or s = "<>" Or s = "<" Or s =">" Or s = "<=" Or s =">="
End Function

Sub writeAssemblyString (fOut As Integer, s As String)
	Dim As Integer i, index 
	Dim As String m

	For i = lBound (tokens) To uBound (tokens)
		tokens (i) = ""
	Next i

	' Break by |
	s = s & "||[FIN]"

	index = 0: For i = 1 To Len (s) 
		m = Mid (s, i, 1) 
		If m = "|" Then 
			index = index + 1 
		Else 
			tokens (index) = tokens (index) & m 
		End If 
	Next i 

	i = 0: While i < uBound (tokens) And tokens (i) <> "[FIN]"
		If tokens (i) = "" Then 	
			If fOut = 0 Then  
				Print
			Else 
				Print #fOut, ""
			End If
		ElseIf Left (tokens (i), 1) = "." Or Left (tokens (i), 1) = ";" Then
			If fOut = 0 Then
				Print tokens (i) 
			Else 
				Print #fOut, tokens (i)
			End If 
		Else 
			If fOut = 0 Then 
				Print "	" & tokens (i)
			Else 
				Print #fOut, "	" & tokens (i)
			End If 
		End if
		i = i + 1
	Wend
End Sub

Function readNewLine (fIn As Integer) As String
	Dim As String linea
	
	Line Input #fIn, linea 
	linea = Trim (linea, Any chr (32) + chr (9))
	curLineNo = curLineNo + 1

	'If debug Then Print curLineNo & ": " & linea

	Return linea
End Function

Function pVal (expresion As String) As String 
	If Len (expresion) > 1 And Left (expresion, 1) = "$" Then 
		Return Chr (&HFF) & pVal (Right (expresion, Len (expresion) - 1)) 
	Else
		If Val (expresion) <= 240 Then 
			Return Chr (Val (expresion)) 
		Else 
			Print "Wrong value @ " & curLineNo
		End If
	End If
End Function

Function lVal (expresion As String) As String
	' Used for lValues such as $A = B, so first $ is ignored.
	If correctLvalue (expresion) Then 
		Return pVal (Right (expresion, Len (expresion) - 1))
	Else
		Print "Expecting lValue @ " & curLineNo
	End If
End Function

Function makeFlag (encoded As String) As String
	Return Chr (&HFF) & encoded
End Function

Function buildCond CDecl (count As Integer, ...) As String
	Dim As String code = ""
	Dim As Integer i
	Dim As String b

	Dim As Any Ptr arg = VA_First ()

	For i = 1 To count
		b = *VA_Arg (arg, ZString Ptr)

		' This is bollocks, C strings are used for this and they can't contain zeros!
		If b = "" Then b = Chr (0)
		If Len(b) >= 1 And Right (b, 1) = Chr (&HFF) Then b = b & Chr (0)

		code = code & b

		arg = VA_Next (arg, ZString Ptr)
	Next i

	If Len (code) >= 1 Then
		CU (Asc (Left (code, 1))) = -1
	End If

	'If debug Then Print "BuildCond ";: printBinStr (code)

	Return code
End Function

Function buildAction CDecl (ByVal count As Integer, ...) As String
	Dim As String code = ""
	Dim As Integer i
	Dim As String b

	Dim As Any Ptr arg = VA_First ()

	For i = 1 To count
		b = *VA_Arg (arg, ZString Ptr)
		
		' This is bollocks, C strings are used for this and they can't contain zeros!
		If b = "" Then b = Chr (0)
		If Len(b) >= 1 And Right (b, 1) = Chr (&HFF) Then b = b & Chr (0)

		code = code & b

		arg = VA_Next (arg, ZString Ptr)
	Next i

	If Len (code) >= 1 Then
		AU (Asc (Left (code, 1))) = -1
	End If

	'If debug Then Print "BuildAction ";: printBinStr (code)

	Return code
End Function

Sub syntaxError 
	Print "Syntax error at " & curLineNo
End Sub

Function processIf (linea As String) As String
	Dim As String code = ""
	Dim As String cmd
	parseScriptLine linea	

	' Detect numeric conditions IF a OP b 
	If isNumberOrVar (tokens (1)) And isComp (tokens(2)) And isNumberOrVar (tokens (3)) Then
		Select Case tokens (2)
			Case "=" 
				' $01 A B
				code = buildCond (3, Chr(&H01), pVal (tokens (1)), pVal (tokens (3)))

			Case "<":
				' $02 A B
				code = buildCond (3, Chr(&H02), pVal (tokens (1)), pVal (tokens (3)))

			Case ">" 
				' $02 B A 
				code = buildCond (3, Chr(&H02), pVal (tokens (3)), pVal (tokens (1)))

			Case ">="
				' $03 A B
				code = buildCond (3, Chr(&H03), pVal (tokens (1)), pVal (tokens (3)))

			Case "<="
				' $03 B A
				code = buildCond (3, Chr(&H03), pVal (tokens (3)), pVal (tokens (1)))

			Case "<>", "!="
				' $04 A B
				code = buildCond (3, Chr(&H04), pVal (tokens (1)), pVal (tokens (3)))
		End Select

	Else
		cmd = lCase (tokens (1))
		Select Case cmd
			Case "true"
				code = buildCond (1, Chr (&HF0))

			Case "player"
				' Detect player conditions

				Select Case lCase (tokens (2))
					Case "touches"
						' $20 X Y
						code = buildCond (3, Chr (&H20), pVal (tokens (3)), pVal (tokens (4)))

					Case "in_x"
						' $21 X Y
						code = buildCond (3, Chr (&H21), pVal (tokens (3)), pVal (tokens (4)))
					
					Case "in_y"
						' $22 X Y
						code = buildCond (3, Chr (&H22), pVal (tokens (3)), pVal (tokens (4)))
					
					Case "at"
						' $23 X Y
						code = buildCond (3, Chr (&H23), pVal (tokens (3)), pVal (tokens (4)))
					
					Case "falling"
						' $24 X Y
						code = buildCond (1, Chr (&H24))
		
					Case "not_falling"
						' $25 X Y
						code = buildCond (1, Chr (&H25))
					
					Case "still"
						' $26 X Y
						code = buildCond (1, Chr (&H26))
				End Select

			Case "tile"

				Select Case lCase (tokens (2))
					Case "at"
						' $30 X Y T
						code = buildCond (4, Chr (&H30), pVal (tokens (3)), pVal (tokens (4)), pVal (tokens (6)))

				End Select

			Case "beh"

				Select Case lCase (tokens (2))
					Case "at"
						' $31 X Y T
						code = buildCond (4, Chr (&H31), pVal (tokens (3)), pVal (tokens (4)), pVal (tokens (6)))

				End Select

		End Select

	End If

	Return code 
End Function

Function processCommand (linea As String) As String
	Dim As String code = ""
	Dim As String cmd, scmd 

	parseScriptLine linea

	' Detect direct numeric asignation $A = B 
	If tokens (1) = "=" Then 
		If correctLvalue (tokens (0)) And isNumberOrVar (tokens (2)) Then
			code = buildAction (3, Chr(&H00), lVal (tokens(0)), pVal (tokens (2)))
		Else
			syntaxError
		End If
	End If

	cmd = lCase (tokens (0))
	scmd = lCase (tokens (1))

	Select Case cmd
		Case "inc"
			' INC $A B
			' $10 A B
			If correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				code = buildAction (3, Chr(&H10), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If

		Case "dec"
			' DEC $A B
			' $11 A B 
			If correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				code = buildAction (3, Chr(&H11), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If

		Case "add"
			' First deprecated construct add flags x y -> inc $X $Y 
			If scmd = "flags" Then 
				code = buildAction (3, Chr (&H10), pVal (tokens (2)), makeFlag (pVal (tokens (3))))

			ElseIf correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				' Alias for inc 
				code = buildAction (3, Chr(&H10), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If 

		Case "sub"
			' First deprecated construct sub flags x y -> dec $X $Y 
			If scmd = "flags" Then 
				code = buildAction (3, Chr (&H11), pVal (tokens (2)), makeFlag (pVal (tokens (3))))

			ElseIf correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				' Alias for inc 
				code = buildAction (3, Chr(&H11), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If '

		Case "set"
			If scmd = "tile" Then
				' SET TILE X Y = N
				code = buildAction (4, Chr (&H20), pVal (tokens(2)), pVal (tokens (3)), pVal (tokens (5)))

			ElseIf scmd = "beh" Then
				' SET BEH X Y = N
				code = buildAction (4, Chr (&H21), pVal (tokens(2)), pVal (tokens (3)), pVal (tokens (5)))

			ElseIf correctLvalue (tokens (1)) And tokens (2) = "=" And isNumberOrVar (tokens (3)) Then
				' SET $A = B
				code = buildAction (3, Chr(&H00), lVal (tokens(1)), pVal (tokens (3)))
			Else
				syntaxError
			End If

		Case "sound"
			' SOUND N
			' $E0 N
			code = buildAction (2, Chr (&HE0), pVal (tokens(1)))

		Case "show"
			' $E1
			code = buildAction (1, Chr (&HE1))

		Case "recharge"
			' $E2
			code = buildAction (1, Chr (&HE2))

		Case "extern"
			' EXTERN N M
			' $E4 N M'
			code = buildAction (3, Chr (&HE4), pVal (tokens(1)), pVal (tokens (2)))

		Case "pause"
			' PAUSE N
			' $E5 N
			code = buildAction (2, Chr (&HE5), pVal (tokens(1)))

		Case "game"
			If scmd = "over" then 
				code = buildAction (1, Chr (&HF0))
			Else 
				syntaxError
			End If

		Case "win"
			If scmd = "game" Then  
				code = buildAction (1, Chr (&HF1))
			Else 
				syntaxError
			End If

	End Select 

	Return code 
End Function

Function processCurrentSection (fIn As Integer) As String 
	Dim sectionCode As String
	Dim clausule As String
	Dim As Integer terminado
	Dim As Integer wrong
	Dim As Integer state
	Dim As String linea, lineaLc

	terminado = 0
	wrong = 0
	state = 0 			' 0 = fetching, 1 = conditions, 2 = actions

	While Not terminado And Not Eof (fIn)
		linea = readNewLine (fIn)
		lineaLc = lCase (linea)

		If linea = "" Then 
			' Skip 

		ElseIf lineaLc = "end" Then
			' If we are fetching -> this section has ended.
			' If we are reading conditions -> wrong
			' If we are reading actions -> this clausule has ended.'
			If state = 0 Then 
				terminado = -1
			ElseIf state = 1 Then 
				wrong = -1: terminado = -1
				Print "Unexpected END @ " & curLineNo
			Else 
				' Write current clausule
				sectionCode = sectionCode & Chr (Len (clausule) + 1) & clausule
				
				' New clausule
				clausule = ""
				
				' Back to fetching
				state = 0
			End If 

		ElseIf lineaLc = "then" Then
			' If we are fetching or reading actions -> wrong
			' Else  change to state 2
			If state = 1 Then 
				' Write FF to signal "end of section" to the interpreter
				clausule = clausule & Chr (&HFF)

				state = 2
			Else 
				wrong = -1: terminado = -1
				Print "Unexpected THEN @ " & curLineNo
			End If

		ElseIf Len (lineaLc) > 3 And Left (lineaLc, 3) = "if " Then 
			' Only valid when fetching or reading conditions
			If state = 2 Then 
				wrong = -1: terminado = -1
				Print "Unexpected IF @ " & curLineNo
			Else 
				state = 1

				' Process IF
				clausule = clausule & processIf (linea)
			End If

		Else 
			' Commands
			clausule = clausule & processCommand (linea)
		End If
	Wend

	Return sectionCode 
End Function

Function startsWith (haysTack As String, spec As String) Then 
	Dim As Integer i
	Dim As String m, n

	If spec = haysTack Return -1
	If Len (spec) > Len (haysTack) Return 0

	For i = 1 To Len(spec) 
		m = Mid (haysTack, i, 1)
		n = Mid (spec, i, 1)

		If Not (m = n Or ((m = "_" And n = " ") Or (m = " " And n = "_"))) Then
			Return 0
		End If
	Next i

	Return -1
End Function 

Sub copyToBin (String section)
	Dim As Integer i 

	For i = 1 To Len (section) 	
		sectBinary (binIdx) = Asc (Mid (section, i, 1))
		binIdx = binIdx + 1
	Next i

Sub processScript (fIn As Integer)
	Dim As String linea
	Dim As Integer section 

	While Not Eof (fIn) 
		linea = readNewLine (fIn)
		section = -1

		If startsWith (linea, "entering screen") Or startsWith (linea, "press fire at screen") Then 
			' Find comma separated list

		Else
			' Special sections

			If startsWith (linea, "entering game") Then
				section = 0

			ElseIf startsWith (linea, "entering any") Then 
				section = 1
			
			ElseIf startsWith (linea, "press fire at any") Then
				section = 2
			
			ElseIf startsWith (linea, "player gets coin") Then
				section = 3
			
			ElseIf startsWith (linea, "player kills enemy") Then 
				section = 4
			
			End If
		End If
	Wend 
End Sub

curLineNo = 0
binIdx = 0

Dim As Integer fIn
fIn = FreeFile
Open "test1.spt" For Input As #fIn
printBinStr processCurrentSection (fIn)
Close #fIn