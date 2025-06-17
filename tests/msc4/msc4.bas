' MSC4
' Copyleft 2025 by The Mojon Twins

#include "mtparser.bi"
#include "cmdlineparser.bi"
#include "mt5bitEsc.bi"

Const SPECCY = 0
Const CPC = 1

Const ENTERING_INDEX_OFFSET = 16
Const PRESS_FIRE_INDEX_OFFSET = 17

Dim Shared As Integer debug = -1
Dim Shared As Integer textDebug = 0

Dim Shared As String tokens (255)
Dim Shared As Integer curLineNo

Dim Shared As String aliases (128)
Dim Shared As Integer curAliasIndex = 0

Dim Shared As Integer AU (255), CU (255), LV (255), RV (255)

Dim Shared As Integer sectOffs (255)
Dim Shared As UByte sectBinary (16383)
Dim Shared As UByte mainBinary (18000)
Dim Shared As Integer sectBinIdx, mainBinIdx

Dim Shared As Integer outV = 3
Dim Shared AS Integer outT = SPECCY

Dim Shared As String interpreterFn
Dim Shared As Integer maxPants
Dim Shared As Integer noIndexed
Dim Shared As Integer fastNPant

Dim Shared As Integer itemSlot
Dim Shared As Integer itemEmpty = 0

Dim Shared As Integer textWidth
Dim Shared As Integer textPoolIndex
Dim Shared As Integer lastTextOffset 
Dim Shared As String textPool (16384)
Dim Shared As Integer textOffsets (16384)

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

Sub resetAliases () 
	Dim i As Integer

	For i = 0 To uBound (aliases)
		aliases (i) = ""
	Next i 
End Sub

Function addOrResolveAlias (salias As String) As Integer
	Dim i As Integer

	salias = lCase (salias)

	' Find
	For i = 0 To uBound (aliases)
		If aliases (i) = salias Then 
			Return i 
		End If 
	Next 

	' Not found, add to 1st unused slot
	For i = 0 To uBound (aliases)
		If aliases (i) = "" Then
			aliases (i) = salias 
			Return i 
		End If 
	Next 

	Print "Warning! Too many aliases, resolving to 0"
	
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
		If quotes Then 
			' Ignore...
			If m = Chr(34) Then quotes = 0
		Else
			If m = Chr(34) Then 
				quotes = -1
			ElseIf Instr ("<>=!", m) Then
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
		End If
		i = i + 1
	Wend

	' Trim prepended ON

	If Len(linea) > 3 And Left (Ucase (linea), 3) = "ON " Then
		linea = Right (linea, Len (linea) - 3)
	End If

	' Tokenize

	parseTokenizeString linea, tokens (), ",()[]", "#"

	' Process to solve %ALIAS -> $n
	' Also do special vars here
	i = 0: While i < uBound (tokens) And tokens (i) <> ""
		If Len(tokens(i)) > 1 And Left (tokens (i), 1) = "%" Then 
			tokens (i) = "$" & addOrResolveAlias (Right (tokens (i), Len (tokens (i)) - 1))
		ElseIf Ucase(tokens(i)) = "NPANT" Or Ucase(tokens (i)) = "N_PANT" Then
			tokens (i) = "$254"
		ElseIf Ucase(tokens (i)) = "PX" Then 
			tokens (i) = "$253"
		ElseIf Ucase(tokens (i)) = "PY" Then 
			tokens (i) = "$252"
		ElseIf Ucase(tokens (i)) = "KILLED" Then 
			tokens (i) = "$251" 
		ElseIf Ucase(tokens (i)) = "OBJS" Then
			tokens (i) = "$250"
		ElseIf Ucase(tokens (i)) = "LIFE" Then
			tokens (i) = "$249"
		ElseIf Ucase(tokens (i)) = "TX" then 
			tokens (i) = "$248"
		ElseIf Ucase(tokens (i)) = "TY" Then 
			tokens (i) = "$247"
		ElseIf Ucase(tokens (i)) = "TN" Then 
			tokens (i) = "$246"
		ElseIf Ucase(tokens (i)) = "HOTSPOT" Then
			tokens (i) = "$245"
		ElseIf Ucase(tokens (i)) = "HIDE_HOTSPOTS" Then 
			tokens (i) = "$240"
		ElseIf Ucase(tokens (i)) = "DONT_MAKE_FANTIES" Then
			tokens (i) = "$239"
		ElseIf Ucase(tokens (i)) = "EN_T" Then
			tokens (i) = "$238"
		ElseIf Ucase(tokens (i)) = "EN_N" Then
			tokens (i) = "$237"
		ElseIf Ucase(tokens (i)) = "EN_X" Then
			tokens (i) = "$236"
		ElseIf Ucase(tokens (i)) = "EN_Y" Then
			tokens (i) = "$235"
		End If

		' Static identifiers
		If Ucase(tokens (i)) = "EMPTY" Then 
			tokens (i) = Trim(Str(itemEmpty))
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

Function isNumber (s As String) As Integer
	' there're better ways but this is safe
	Dim As Integer i
	Dim As String m 
	
	For i = 1 To Len (s)
		m = Mid (s, i, 1)
		If m < "0" Or m > "9" Then return 0 
	Next i 

	Return -1
End Function

Function isNumberOrVar (s As String) As Integer

	If correctLvalue (s) Then Return -1 
	If isNumber (s) Then Return -1

	Return 0
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
		If Val (expresion) <= 254 Then 
			RV (Val (expresion)) = -1
			Return Chr (Val (expresion)) 
		Else 
			Print "Wrong value @ " & curLineNo
		End If
	End If
End Function

Function lValR(expresion As String) As String 
	If Len (expresion) > 1 And Left (expresion, 1) = "$" Then 
		Return Chr (&HFF) & pVal (Right (expresion, Len (expresion) - 1)) 
	Else
		If Val (expresion) <= 254 Then 
			Return Chr (Val (expresion)) 
		Else 
			Print "Wrong value @ " & curLineNo
		End If
	End If
End Function

Function lVal (expresion As String) As String
	Dim As String value
	' Used for lValues such as $A = B, so first $ is ignored.
	If correctLvalue (expresion) Then
		value = lValR (Right (expresion, Len (expresion) - 1))
		LV (Asc (Right (value, 1))) = -1
		Return value
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

Function getTextOffset (text As String) As String
	Dim As String encodedText
	Dim As Integer offset, i

	' encode this text
	encodedText = encode5BitEsc (text, textWidth)

	' return offset
	offset = -1

	For i = 0 To textPoolIndex - 1
		If textPool (i) = text Then 
			offset = textOffsets (i)
			Exit For
		End If
	Next i

	If offset = -1 Then
		' New text! store offset, add text, return offset 
		offset = lastTextOffset 
		textOffsets (textPoolIndex) = lastTextOffset 
		textPool (textPoolIndex) = encodedText

		If textdebug Then
			Print "Encoded text: " & encodedText
			Print "Pretty Print: "
			prettyPrintEncodedString encodedText
		End If

		lastTextOffset = lastTextOffset + Len (encodedText)
		textPoolIndex = textPoolIndex + 1
	End If 

	Return Chr (offset Mod 256) & Chr (offset \ 256)

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
	Dim As Integer v1, v2
	parseScriptLine linea	

	' First of all, override IF NPANT if desired
	If fastNPant And lCase (tokens (1)) = "$254" And tokens (2) = "=" Then 
		code = buildCond (2, Chr(&H05), pVal (tokens (3)))

	' Detect numeric conditions IF a OP b 
	ElseIf isNumberOrVar (tokens (1)) And isComp (tokens(2)) And isNumberOrVar (tokens (3)) Then
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

					Case "in_x"
						' $21 X Y
						' Otherwise use special OPCODE 20
						code = buildCond (3, Chr (&H21), pVal (tokens (3)), pVal (tokens (4)))
					
					Case "in_y"
						' $22 X Y
						code = buildCond (3, Chr (&H22), pVal (tokens (3)), pVal (tokens (4)))
					
					Case "touches", "at"
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
			' $01 A B
			If correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				code = buildAction (3, Chr(&H01), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If

		Case "dec"
			' DEC $A B
			' $02 A B 
			If correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				code = buildAction (3, Chr(&H02), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If

		Case "add"
			' First deprecated construct add flags x y -> inc $X $Y 
			If scmd = "flags" Then 
				code = buildAction (3, Chr (&H01), pVal (tokens (2)), makeFlag (pVal (tokens (3))))

			ElseIf correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				' Alias for inc 
				code = buildAction (3, Chr(&H01), lVal (tokens (1)), pVal (tokens (2)))
			Else
				syntaxError
			End If 

		Case "sub"
			' First deprecated construct sub flags x y -> dec $X $Y 
			If scmd = "flags" Then 
				code = buildAction (3, Chr (&H02), pVal (tokens (2)), makeFlag (pVal (tokens (3))))

			ElseIf correctLvalue (tokens(1)) And isNumberOrVar (tokens (2)) Then
				' Alias for dec 
				code = buildAction (3, Chr(&H02), lVal (tokens (1)), pVal (tokens (2)))
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

		Case "get"
			If scmd = "item" Then
				' GET ITEM SET f
				' $30 F (lvalue)
				code = buildAction (2, Chr (&H30), lVal (tokens(3)))
			End If

		Case "print"
			If scmd = "tile" Then 
				' PRINT TILE X Y = T
				' $50 X Y T
				code = buildAction (4, Chr (&H50), pVal (tokens (2)), pVal (tokens (3)), pVal (tokens (5)))
			End If

		Case "warp"
			If scmd = "to" And isNumberOrVar (tokens (2)) And isNumberOrVar (tokens (3))And isNumberOrVar (tokens (4)) Then
				' WARP TO N, X, Y
				' $6D N X Y
				code = buildAction (4, Chr (&H6D), pVal (tokens (2)), pVal (tokens (3)), pVal (tokens (4)))
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

		Case "text"

			If scmd = "box" Then
				' $E6 LSB MSB
				code = buildAction (1, Chr (&HE6)) & getTextOffset (tokens (2))

			Else
				' $E3 L <TEXT> 0
				code = buildAction (1, Chr (&HE3)) & Chr(1 + Len(tokens (1))) & tokens (1) & Chr (0)
			End If
				
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
				code = buildAction (1, Chr (&HF1))
			Else 
				syntaxError
			End If

		Case "win"
			If scmd = "game" Then  
				code = buildAction (1, Chr (&HF0))
			Else 
				syntaxError
			End If

		Case "break"
			' BREAK
			' $F2
			code = buildAction (1, Chr (&HF2))'

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
	Dim As Integer deco(255)

	terminado = 0
	wrong = 0
	state = 0 			' 0 = fetching, 1 = conditions, 2 = actions, 3 = decos

	While Not terminado And Not Eof (fIn)
		linea = readNewLine (fIn)
		lineaLc = lCase (linea)

		If linea = "" Then 
			' Skip 

		ElseIf lineaLc = "end" Then
			' If we are fetching -> this section has ended.
			' If we are reading conditions -> wrong
			' If we are reading actions -> this clausule has ended.
			' If we are reading decos -> decos ended.
			If state = 0 Then 
				terminado = -1
			ElseIf state = 1 Then 
				wrong = -1: terminado = -1
				Print "Unexpected END @ " & curLineNo
			ElseIf state = 3 Then 
				' End decos
				clausule = clausule & Chr (&HFF)

				' Back to read actions
				state = 2

				If debug Then Print "Stopped parsing decos"
			Else
				' Write  END to current clausule
				clausule = clausule & Chr (&HFF)

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

		ElseIf lineaLc = "decos" Then
			' Only valid when reading actions
			If state = 2 Then 
				state = 3
				clausule = clausule & Chr (&H22)
				AU (&H22) = -1
				If debug Then Print "Began parsing decos"

			Else
				wrong = -1: terminado = -1
				Print "Unexpected DECOS @ " & curLineNo
			End If
		Else
			If state = 3 Then 
				' Read & add a decoration
				parseCoordinatesString linea, deco ()
				clausule = clausule & Chr (deco (2) And &HFF) & Chr ((deco(1) And &HF) * 16 + (deco (0) And &HF))
				If debug Then Print "Parsed deco " & deco (0) & " " & deco (1) & " " & deco (2)

			ElseIf state = 2 Then
				' Commands
				clausule = clausule & processCommand (linea)

			ElseIf Left (linea, 1) <> "#" Then 
				wrong = -1: terminado = -1
				Print "Unexpected command @ " & curLineNo

			Else 
				' ignoring comment

			End If
		End If
	Wend

	' End of section code.
	sectionCode = sectionCode & Chr (&HFF)

	Return sectionCode 
End Function

Function startsWith (haysTack () As String, spec As String) As Integer 
	Dim as String specTokens (uBound (tokens))
	Dim as Integer i 

	parseTokenizeString spec, specTokens (), "", ""

	While i < uBound(tokens) And specTokens (i) <> ""
		If tokens (i) <> specTokens (i) Then Return 0

		i = i + 1
	Wend

	Return -1
End Function 

Sub writeToSectBinary (section As String)
	Dim As Integer i 

	For i = 1 To Len (section) 	
		sectBinary (sectBinIdx) = Asc (Mid (section, i, 1))
		sectBinIdx = sectBinIdx + 1
	Next i
End Sub 

Sub WriteToMainBin (b As uByte)
	mainBinary (mainBinIdx) = b
	mainBinIdx = mainBinIdx + 1
End Sub

Sub processScript (fIn As Integer)
	Dim As String linea
	Dim As String sectionBytecode
	Dim As Integer section, i
	Dim As Integer listToken, cError
	Dim As Integer sectOffset
	Dim As String listRooms (127)

	sectBinIdx = 0
	
	For i = 0 To uBound (sectOffs)
		sectOffs (i) = -1
	Next i

	While Not Eof (fIn) 
		linea = readNewLine (fIn)
		parseTokenizeString lcase (linea), tokens (), ",_()[]", "#"
		
		If linea <> "" And tokens (0) <> "" Then
			If debug Then 
				Print "==========================================" 
				Print "LINEA " & linea
				debugPrintTokens
			End If

			For i = 0 To uBound (listRooms) 
				listRooms (i) = ""
			Next i
			cError = 0

			If tokens (0) = "rooms" Then 
				' ROOMS = N
				maxPants = Val(tokens (2))

			ElseIf tokens (0) = "alias" Then 
				' ALIAS %A = B
				If Len (tokens (1)) > 0 And Left (tokens (1), 1) = "%" Then tokens (1) = Right (tokens (1), Len (tokens (1)) - 1)
				If Len (tokens (1)) > 0 And tokens (2) = "=" And isNumber (tokens (3)) Then
					aliases (Val (tokens (3))) = lCase (tokens (1))
					If debug Then Print "Set alias %" & tokens (1) & " for flag $" & tokens (3)
				Else
					Print "Wrong alias definition at " & curLineNo
				End If

			ElseIf tokens(0) = "noindexed" Then 
				noIndexed = -1
				If debug Then Print "No indexed script. Beware!"

			ElseIf tokens(0) = "fastnpant" Then 
				fastNPant = -1
				If debug Then Print "IF NPANT = N will generate its own opcode!"

			ElseIf startsWith (tokens (), "item slot") And tokens (2) = "=" And isNumber (tokens (3)) Then
				If debug Then Print "Item slot set to " & Val (tokens (3))
				itemSlot = Val (tokens (3))

			ElseIf startsWith (tokens (), "item empty") And tokens (2) = "=" And isNumber (tokens (3)) Then
				If debug Then Print "Item empty set to " & Val (tokens (3))
				itemEmpty = Val (tokens (3))

			ElseIf startsWith (tokens (), "text width") And tokens (2) = "=" And isNumber (tokens (3)) Then 
				If debug Then Print "Text width set to " & Val (tokens (3))
				textWidth = Val (tokens (3))

			Else
				If startsWith (tokens (), "entering screen") Or startsWith (tokens (), "press fire at screen") Then 
					' Find comma separated list
					If tokens (0) = "entering" Then 
						listToken = 2 
						sectOffset = ENTERING_INDEX_OFFSET
					Else 
						listToken = 4
						sectOffset = PRESS_FIRE_INDEX_OFFSET
					End If

					' Now adjust. 
					' Enter is ENTERING_INDEX_OFFSET + N * 2
					' Fire is PRESS_FIRE_INDEX_OFFSET + N * 2
					i = 0: While i + listToken < uBound (tokens) And tokens (i + listToken) <> ""
						listRooms (i) = tokens (i + listToken)
						If isNumber (listRooms (i)) Then 
							listRooms (i) = Str (Val (listRooms (i)) * 2 + sectOffset)
						End If
						i = i + 1
					Wend
				Else
					' Special sections
					section = -1

					If startsWith (tokens (), "entering game") Then
						section = 0

					ElseIf startsWith (tokens (), "entering any") Then 
						section = 1
					
					ElseIf startsWith (tokens (), "press fire at any") Then
						section = 2
					
					ElseIf startsWith (tokens (), "player got something") Then
						section = 3
					
					ElseIf startsWith (tokens (), "player kills enemy") Then 
						section = 4

					ElseIf startsWith (tokens (), "special tile touched") Then
						section = 5
					
					ElseIf startsWith (tokens (), "enemy touched") Then
						section = 8

					End If

					listRooms (0) = Str(section)
					listRooms (1) = ""
				End If

				' Write current binary address to index
				i = 0: While i < uBound (listRooms) And listRooms (i) <> ""
					If isNumber (listRooms (i)) Then
						section = Val (listRooms (i))
						If debug Then Print "Adding " & sectBinIdx & " @ sect " & section
						sectOffs (section) = sectBinIdx
					Else
						Print "Wrong section at " & curLineNo
						cError = -1
					End If

					i = i + 1
				Wend

				If Not cError Then 
					' Parse current section
					sectionBytecode = processCurrentSection (fIn)
					If debug Then Print "Bytecode: ";: printBinStr sectionBytecode

					' Write to binary
					writeToSectBinary sectionBytecode
				End If
			End If
		End If
	Wend

	' Output binary = index with adjusted offsets, then main binary 
	' Index size = 2 * (16 + max_pants). Also write index

	mainBinIdx = 0

	If maxPants = 0 And noIndexed = 0 Then Print "WARNING! undefined # of rooms! The script won't work!"

	For i = 0 To ENTERING_INDEX_OFFSET + maxPants * 2 - 1
		If sectOffs (i) < 0 Then 
			sectOffs (i) = 0 
		Else 
			sectOffs (i) = sectOffs (i) + (ENTERING_INDEX_OFFSET + maxPants * 2) * 2
		End If
		WriteToMainBin sectOffs (i) Mod 256
		WriteToMainBin sectOffs (i) \ 256
	Next i 

	Print "Index section: " & mainBinIdx & " bytes"

	' Copy binary
	For i = 0 To sectBinIdx - 1
		WriteToMainBin sectBinary (i)
	Next i

	Print "Bytecode section: " & sectBinIdx & " bytes"

End Sub

Sub writeScript (fName As String)
	Dim As Integer i, fOut 

	fOut = FreeFile
	Kill fName
	Open fName For Binary As #fOut

	For i = 0 To mainBinIdx - 1
		Put #fOut, , mainBinary (i)
	Next i 

	Print "Wrote " & mainBinIdx & " bytes to " & fName
	Close fOut
End Sub

Sub writeTexts (fName As String)
	Dim As Integer i, j, fOut, adjustedOffset, binSize
	Dim As uByte d

	fOut = FreeFile
	Kill fName
	Open fName for Binary As #fOut 

	binSize = 0

	' Write index
	'For i = 0 To textPoolIndex - 1
	'	adjustedOffset = 2 * textPoolIndex + textOffsets (i)
	'	d = adjustedOffset Mod 256: Put #fOut, , d
	'	d = adjustedOffset \ 256: Put #fOut, , d
	'	binSize = binSize + 2
	'Next i

	' Write texts
	For i = 0 To textPoolIndex - 1
		For j = 1 To Len (textPool (i))
			d = Asc (Mid (textPool (i), j, 1)): Put #fOut, , d
		Next j
		binSize = binSize + Len (textPool (i))
	Next i 

	Print "Wrote " & binSize & " bytes to " & fName
	Close fOut
End Sub

Sub usage
	Print "usage:"
	Print ""
	Print "msc4.exe in=f1.spt[,f2.spt,...] v=3|4|5 target=cpc|zx rooms=N "
	Print "         [interpreter=msci.asm] [noindexed] [fastnpant] [text=text.bin]"
	Print "         in is [a list of|the] input filename."
	Print "           msc4 will generate a f.bin per input,"
	Print "           but only one common interpreter."
	Print "         v is the MK1 base version, 3, 4, or 5"
	Print "         target is the target OM (zx or cpc)"
	Print "         rooms is the total of rooms in the map"
	Print "         interpreter for custom interpreter filename"
	Print "         noindexed if you are only using general sections (ANY, etc)"
	Print "         fastnpant generates a (faster) special opcode for IF NPANT"
End Sub

'' Interfaz
'' in=f1,f2,f3 ... genera f1.bin, f2.bin... pero el mismo intérprete
'' v=3|4|5
'' target=cpc|zx


Dim As String mandatory (2) = { "in", "v", "target" }
Dim As Integer fIn, fOut, i
Dim As String fileIns(127)
Dim As String fileText

Print "msc v4.1.20250604 ~ ";

sclpParseAttrs
If Not sclpCheck (mandatory ()) Then usage: End 

debug = (sclpGetValue ("debug") <> "")
textdebug = (sclpGetValue ("textdebug") <> "")
parseCommaSeparatedString sclpGetValue ("in"), fileIns ()

interpreterFn = sclpGetValue("interpreter")
If interpreterFn = "" Then interpreterFn = "msci.asm"

outV = Val(sclpGetValue("v"))
outT = SPECCY: If sclpGetValue("target") = "cpc" Then outT = CPC
noIndexed = (sclpGetValue("noindexed") <> "")
fastNPant = (sclpGetValue("fastnpant") <> "")

fileText = sclpGetValue ("text")
If fileText = "" Then fileText = "text.bin"

lastTextOffset = 0
textPoolIndex = 0
textWidth = 24

i = 0: While i < 127 And fileIns(i) <> ""
	curLineNo = 0
	resetAliases 
	maxPants = Val (sclpGetValue ("rooms"))

	fIn = FreeFile
	Open fileIns(i) For Input As #fIn
	Print "Processing " & fileIns(i)
	processScript (fIn)
	Close #fIn
	writeScript fileIns(i) & ".bin"

	i = i + 1
Wend 

'' Export encoded texts (if any)
If textPoolIndex > 0 Then 
	Print "Exporting encoded text"
	writeTexts fileText
End If

'' GENERATE INTERPRETER
'' Only output conditions & actios for opcodes in AU and CU.

Print "Writing interpreter"

fOut = FreeFile
Open interpreterFn For Output As #fOut

writeAssemblyString fOut, "defc PLAYER_LIFE=99 ;; Find a way to solve this"
writeAssemblyString fOut, "; Imports|XREF _flags|XREF _n_pant|XREF _gpx|XREF _gpy|XREF _tpx|XREF _tpy|XREF _tat|XREF _tqt|XREF _player|XREF _attr_2|XREF qtile_do|XREF set_map_tile_do|XREF _draw_coloured_tile|XREF __x|XREF __y|XREF __t|XREF __n|XREF _comportamiento_tiles|XREF _map_attr|XREF _peta_el_beeper|XREF _do_extern_action|XREF draw_line_of_text|XREF _hotspot_t|XREF _scenery_info|XREF __en_t|XREF _en_it|XREF __en_x|XREF __en_y|XREF _decode_text"

writeAssemblyString fOut, "XREF script_bytecode"

If outT = SPECCY Then
	writeAssemblyString fOut, "; Target SPECCY|LIB SPUpdateNow"
Else
	writeAssemblyString fOut, "; Target CPC|XREF _cpc_UpdateNow"
End If

writeAssemblyString fOut, "; Exports|XDEF _script_do|XDEF _script_n|XDEF _script_result"
writeAssemblyString fOut, "._script_n|defw 0|._script_result|defb 0"
writeAssemblyString fOut, "; Script pointer|.script|defw 0"
writeAssemblyString fOut, "; Skip to next clausule|.skip|defw 0"
writeAssemblyString fOut, "; Coordinate pair|.sc_x|defb 0|.sc_y|defb 0"
writeAssemblyString fOut, "; From the engine|._script_tx|defb 0|._script_ty|defb 0|._script_tn|defb 0"
writeAssemblyString fOut, "; Control|.sc_terminado|defb 0"
writeAssemblyString fOut, "._script_do"
writeAssemblyString fOut, "; Point to offset in script index|ld  hl, (_script_n)|add hl, hl|ld  bc, script_bytecode|add hl, bc"
writeAssemblyString fOut, "; Read offset|ld  a, (hl)|inc hl|ld  h, (hl)|ld  l, a"
writeAssemblyString fOut, ";  If zero do abort|or  h|ret z"
writeAssemblyString fOut, "; Make & store pointer|add hl, bc|ld  (script), hl"
writeAssemblyString fOut, ".script_loop|; Calculate address of next clausule"
writeAssemblyString fOut, "ld  hl, (script)|push hl"
writeAssemblyString fOut, "call read_byte 		; A = clausule size|ld  b, 0|ld  c, a"
writeAssemblyString fOut, "pop hl|add hl, bc|ld  (skip), hl"
writeAssemblyString fOut, "cp  0xFF 			; End of section?|ret z"
writeAssemblyString fOut, "; Process conditions|.script_clausule|call read_byte 		;A = opcode"
writeAssemblyString fOut, "; If we get to 0xFF (THEN), jump to actions|cp  0xFF|jp  z, script_actions"
writeAssemblyString fOut, ";;; Decode OPCODE & jump to interpreter"

'' Generate interpreter for IFS

If CU(&H01) Then writeAssemblyString fOut, ";; OPCODE 0x01|;; IF A = B|cp  0x01|jr  nz, copcode_01_end|.copcode_01|call read_vbyte|ld  b, a|call read_vbyte|cp  b|jp  nz, skip_clausule|jp  script_clausule|.copcode_01_end"
If CU(&H02) Then writeAssemblyString fOut, ";; OPCODE 0x02|;; IF A < B|cp  0x02|jr  nz, copcode_02_end|.copcode_02|call read_vbyte|ld  c, a|call read_vbyte|ld  b, a|ld  a, c|cp  b|jp  nc, skip_clausule|jp  script_clausule|.copcode_02_end"
If CU(&H03) Then writeAssemblyString fOut, ";; OPCODE 0x03|;; IF A >= B|cp  0x03|jr  nz, copcode_03_end|.copcode_03|call read_vbyte|ld  c, a|call read_vbyte|ld  b, a|ld  a, c|cp  b|jp  c, skip_clausule|jp  script_clausule|.copcode_03_end"
If CU(&H04) Then writeAssemblyString fOut, ";; OPCODE 0x04|;; IF A <> B|cp  0x04|jr  nz, copcode_04_end|.copcode_04|call read_vbyte|ld  b, a|call read_vbyte|cp  b|jp  z, skip_clausule|jp  script_clausule|.copcode_04_end"
If CU(&H05) Then writeAssemblyString fOut, ";; OPCODE 0x05|;; IF NPANT = N|cp  0x05|jr  nz, copcode_05_end|.copcode_05|call read_vbyte|ld  b, a|ld  a, (_n_pant)|cp  b|jr  nz, skip_clausule|jp script_clausule|.copcode_05_end"
If CU(&H21) Then writeAssemblyString fOut, ";; OPCODE 0x21|;; IF PLAYER IN_X (X1, X2)|cp  0x21|jr  nz, copcode_21_end|.copcode_21|;; gpx < X1 -> exit|call read_vbyte|ld  c, a|ld  a, (_gpx)|cp  c|jp  c, skip_clausule|;; X2 < gpx -> exit|ld  a, (_gpx)|ld  c, a|call read_vbyte|cp  c|jp  c, skip_clausule|jp  script_clausule|.copcode_21_end"
If CU(&H22) Then writeAssemblyString fOut, ";; OPCODE 0x22|;; IF PLAYER IN_Y (Y1, Y2)|cp  0x22|jr  nz, copcode_22_end|.copcode_22|;; gpy < Y1 -> exit|call read_vbyte|ld  c, a|ld  a, (_gpy)|cp  c|jp  c, skip_clausule|;; Y2 < gpy -> exit|ld  a, (_gpy)|ld  c, a|call read_vbyte|cp  c|jp  c, skip_clausule|jp  script_clausule|.copcode_22_end"
If CU(&H23) Then writeAssemblyString fOut, ";; OPCODE 0x23|;; IF PLAYER AT (X, Y)|cp  0x23|jr  nz, copcode_23_end|.opcode23|;; (gpx + 8) >> 4 != X -> exit|ld  a, (_tpx)|ld  c, a|call read_vbyte|cp  c|jp  nz, skip_clausule|;; (gpy + 8) >> 4 != Y -> exit|ld  a, (_tpy)|ld  c, a|call read_vbyte|cp  c|jp  nz, skip_clausule|jp  script_clausule|.copcode_23_end"
If CU(&H24) Then writeAssemblyString fOut, ";; OPCODE 0x24|;; IF PLAYER FALLING|cp  0x24|jr  nz, copcode_24_end|.copcode_24|;; Player falling if not possee|ld  a, (_player + 26) 	; player.possee|or  a|jp  z, skip_clausule|jp  script_clausule|.copcode_24_end"
If CU(&H25) Then writeAssemblyString fOut, ";; OPCODE 0x25|;; IF PLAYER NOT FALLING|cp  0x25|jr  nz, copcode_25_end|.copcode_25|;; Player not falling if possee|ld  a, (_player + 16)	; player.possee|or  a|jp  nz, skip_clausule|jp  script_clausule|.copcode_25_end"
If CU(&H26) Then writeAssemblyString fOut, ";; OPCODE 0x26|;; PLAYER_STILL|cp  0x26|jr  nz, copcode_26_end|.copcode_26|ld  a, (_player + 6) 	; player.vx LSB|ld  hl, (_player + 7)	; player.vx MSB|or  (hl)|ld  hl, (_player + 8) 	; player.vy LSB|or  (hl)|ld  hl, (_player + 9) 	; player.vy MSB|or  (hl)|jp  nz, skip_clausule|jp  script_clausule|.copcode_26_end"
If CU(&H30) Then writeAssemblyString fOut, ";; OPCODE 0x30|;; TILE AT (X, Y) = T|cp  0x30|jr  nz, copcode_30_end|.copcode_30|call read_x_y|ld  a, (sc_x)|ld  c, a|ld  a, (sc_y)|call _attr_2|ld  c, l|call read_vbyte|cp  c|jp  nz, skip_clausule|jp  script_clausule|.copcode_30_end"
If CU(&H31) Then writeAssemblyString fOut, ";; OPCODE 0x31|;; BEH AT (X, Y) = T|cp  0x31|jr  nz, copcode_31_end|.copcode_31|call read_x_y|ld  a, (sc_x)|ld  c, a|ld  a, (sc_y)|call qtile_do|ld  c, l|call read_vbyte|cp  c|jp  nz, skip_clausule|jp  script_clausule|.copcode_31_end"
'If CU(&HF0) Then writeAssemblyString fOut, ";; OPCODE 0xF0|;; TRUE|cp  0xf0|jr  z, script_clausule"

''

writeAssemblyString fOut, ";; UNKNOWN|jp  script_clausule"
writeAssemblyString fOut, ".skip_clausule|ld  hl, (skip)|ld  (script), hl|jp  script_loop"
writeAssemblyString fOut, "; Process actions|.script_actions|call read_byte 		;A = opcode"
writeAssemblyString fOut, "; If we get to 0xFF (END), jump to next clausule|cp  0xFF|jp  z, script_loop"
writeAssemblyString fOut, ";;; Decode OPCODE & jump to interpreter"

'' Generate interpreter for ACTIONS

If AU(&H00) Then writeAssemblyString fOut, ";; OPCODE 0x00|;; FLAGS[N] = V|cp  0x00|jr  nz, aopcode_00_end|.aopcode_00|call read_i_v		; HL -> FLAGS[N], A -> V|ld  (hl), a|jp  script_actions|.aopcode_00_end"
If AU(&H01) Then writeAssemblyString fOut, ";; OPCODE 0x01|;; FLAGS[N] += V|cp  0x01|jr  nz, aopcode_01_end|.aopcode_01|call read_i_v		; HL -> FLAGS[N], A -> V|ld  b, (hl)|add b|ld  (hl), a|jp  script_actions|.aopcode_01_end"
If AU(&H02) Then writeAssemblyString fOut, ";; OPCODE 0x02|;; FLAGS[N] -= V|cp  0x02|jr  nz, aopcode_02_end|.aopcode_02|call read_i_v		; HL -> FLAGS[N], A -> V|ld  b, a|ld  a, (hl)|sub b|ld  (hl), a|jp  script_actions|.aopcode_02_end"
If AU(&H20) Then writeAssemblyString fOut, ";; OPCODE 0x20|;; SET TILE (X, Y) = T|cp  0x20|jr  nz, aopcode_20_end|.aopcode_20|call read_x_y|call read_vbyte|ld  (__t), a|ld  b, 0|ld  c, a|ld  hl, _comportamiento_tiles|add hl, bc|ld  a, (hl)|ld  (__n), a|ld  a, (sc_x)|ld  (__x), a|ld  c, a|ld  a, (sc_y)|ld  (__y), a|call set_map_tile_do|jp  script_actions|.aopcode_20_end"
If AU(&H21) Then writeAssemblyString fOut, ";; OPCODE 0x21|;; SET BEH (X, Y) = B|cp  0x21|jr  nz, aopcode_21_end|.aopcode_21|call read_x_y|ld  a, (sc_x)|ld  c, a|ld  a, (sc_y)|ld  b, a|sla a|sla a|sla a|sla a|sub b|add c|ld  b, 0|ld  c, a|call read_vbyte|ld  hl, _map_attr|add hl, bc|ld  (hl), a|jp  script_actions|.aopcode_21_end"
If AU(&H22) Then writeAssemblyString fOut, ";; OPCODE 0x22|;; DECOS XY T XY T ... 0xFF|cp  0x22|jr  nz, aopcode_22_end|.aopcode_22|call read_byte|cp  0xff|jr  z, aopcode_22_end|ld  (__t), a|ld  b, 0|ld  c, a|ld  hl, _comportamiento_tiles|add hl, bc|ld  a, (hl)|ld  (__n), a|call read_byte|ld  b, a|and 0xf|ld  c, a|ld  (__x), a|ld  a, b|srl a|srl a|srl a|srl a|ld  (__y), a|call set_map_tile_do|jr  aopcode_22|.aopcode_22_end"
If AU(&H30) Then writeAssemblyString fOut, ";; OPCODE 0x30|;; GET ITEM SET $F <- [FILL I]|cp  0x30|jr  nz, aopcode_30_end|.aopcode_30|;; Get LValue: Flag to modify|call read_vbyte|ld  b, 0|ld  c, a|ld  hl, _flags|add hl, bc|; No item in slot?|ld  a, (_flags + " & itemSlot & ")|cp  " & itemEmpty & "|jr  nz, aopcode_30_end|; Write 1 to LValue|inc a|ld  (hl), a|; Assign item|ld  a, (_tqt)|ld  (_flags + " & itemSlot & "), a|; Clear from screen|xor a|ld  (__n), a|ld  (__t), a|ld  a, (_tpx)|ld  c, a|ld  (__x), a|ld  a, (_tpy)|ld  (__y), a|call set_map_tile_do|jp  script_actions|.aopcode_30_end"
If AU(&H50) Then writeAssemblyString fOut, ";; OPCODE 0x50|;; PRINT TILE (X, Y) = N|cp  0x50|jr  nz, aopcode_50_end|.aopcode_50|call read_vbyte|ld  h, 0|ld  l, a|push hl|call read_vbyte|ld  h, 0|ld  l, a|push hl|call read_vbyte|ld  h, 0|ld  l, a|push hl|call _draw_coloured_tile|pop bc|pop bc|pop bc|jp  script_actions|.aopcode_50_end"
If AU(&H6D) Then writeAssemblyString fOut, ";; OPCODE 0x6D|;; WARP TO N, X, Y|cp  0x6D|jr  nz, aopcode_6D_end|.aopcode_6D|call read_vbyte|ld  (_n_pant), a|call read_vbyte|sla a|sla a|sla a|sla a|ld  (_gpx), a|call read_vbyte|sla a|sla a|sla a|sla a|ld  (_gpy), a|jp  script_actions|.aopcode_6D_end"
If AU(&HE0) Then writeAssemblyString fOut, ";; OPCODE 0xE0|;; SOUND N|cp  0xE0|jr  nz, aopcode_E0_end|.aopcode_E0|call read_vbyte|ld  h, 0|ld  l, a|call _peta_el_beeper|jp  script_actions|.aopcode_E0_end"
If AU(&HE1) Then 
	If outT = SPECCY Then
		writeAssemblyString fOut, ";; OPCODE 0xE1|;; SHOW|cp  0xE1|jr  nz, aopcode_E1_end|.aopcode_E1|ld  hl, 1|push hl|call SPUpdateNow|pop bc|jp  script_actions|.aopcode_E1_end"
	Else
		writeAssemblyString fOut, ";; OPCODE 0xE1|;; SHOW|cp  0xE1|jr  nz, aopcode_E1_end|.aopcode_E1|ld  hl, 1|push hl|call _cpc_UpdateNow|pop bc|jp  script_actions|.aopcode_E1_end"
	End If
End If
If AU(&HE2) Then writeAssemblyString fOut, ";; OPCODE 0xE2|;; RECHARGE|cp  0xE2|jr  nz, aopcode_E2_end|.aopcode_E2|ld  a, PLAYER_LIFE|ld  (_player + 29), a 	; player.life LSB|xor a|ld  (_player + 30), a 	; player.life MSB|jp script_actions|.aopcode_E2_end"
If AU(&HE3) Then writeAssemblyString fOut, ";; OPCODE 0xE3|;; TEXT L <CHARS> 0|cp  0xE3|jr  nz, aopcode_E3_end|.aopcode_E3|call read_byte 			; String length|ld  b, 0|ld  c, a|add hl, bc 				; Move after the string|push hl|ld  hl, (script)|call draw_line_of_text|pop hl|ld  (script), hl 		; Get past the string|jp script_actions|.aopcode_E3_end"
If AU(&HE4) Then writeAssemblyString fOut, ";; OPCODE 0xE4|;; EXTERN N M|cp  0xE4|jr  nz, aopcode_E4_end|.aopcode_E4|call read_x_y|ld  a, (sc_x)|ld  h, 0|ld  l, a|push hl|ld  a, (sc_y)|ld  h, 0|ld  l, a|push hl|call _do_extern_action|pop bc|pop bc|jp script_actions|.aopcode_E4_end"
If AU(&HE5) Then writeAssemblyString fOut, ";; OPCODE 0xE5|;; PAUSE N|cp  0xE5|jr  nz, aopcode_E5_end|.aopcode_E5|call read_vbyte|ld  b, a|.aopcode_E5_loop|halt|djnz aopcode_E5_loop|jp script_actions|.aopcode_E5_end"
If AU(&HE6) Then writeAssemblyString fOut, ";; OPCODE 0xE6|;; TEXT BOX LSB MSB|cp  0xE6|jr  nz, aopcode_E6_end|.aopcode_E6|call read_x_y|ld  a, (sc_x)|ld  l, a|ld  a, (sc_y)|ld  h, a|call _decode_text|jp script_actions|.aopcode_E6_end"
If AU(&HF0) Then writeAssemblyString fOut, ";; OPCODE 0xF0|;; WIN GAME|cp  0xf0|jr  nz, aopcode_F0_end|.aopcode_F0|ld  a, 1|ld  (_script_result), a|ret|.aopcode_F0_end"
If AU(&HF1) Then writeAssemblyString fOut, ";; OPCODE 0xF1|;; GAME OVER|cp  0xf1|jr  nz, aopcode_F1_end|.aopcode_F1|ld  a, 2|ld  (_script_result), a|ret|.aopcode_F1_end"
If AU(&HF2) Then writeAssemblyString fOut, ";; OPCODE 0xF2|;; BREAK|cp  0xf2|jr  nz, aopcode_F2_end|.aopcode_F2|ret|.aopcode_F2_end"

''

writeAssemblyString fOut, ";; UNKNOWN|jp script_actions"
writeAssemblyString fOut, ";; Reads a byte from pointer, inc pointer, return value in A|.read_byte|ld  hl, (script)|ld  a, (hl)|inc hl|ld  (script), hl|ret"
writeAssemblyString fOut, ";; Reads a value (may be recursive flag), inc pointer, return value in A|;; New flags encoding is $FF means next value is flag (can be $FF, etc)|.read_vbyte|call read_byte|cp  0xff|jr  z, read_vbyte_rec|ret"
writeAssemblyString fOut, ".read_vbyte_rec|call read_vbyte"
If RV(&HFE) Then writeAssemblyString fOut, "; NPANT RVALUE|cp  0xFE|jr  nz, rvb_set_n_pant_done|ld  a, (_n_pant)|ret|.rvb_set_n_pant_done"
If RV(&HFD) Then writeAssemblyString fOut, "; PX RVALUE|cp  0xFD|jr  nz, rvb_set_gpx_done|ld  a, (_gpx)|ret|.rvb_set_gpx_done"
If RV(&HFC) Then writeAssemblyString fOut, "; PY RVALUE|cp  0xFC|jr  nz, rvb_set_gpy_done|ld  a, (_gpy)|ret|.rvb_set_gpy_done"
If RV(&HFB) Then writeAssemblyString fOut, "; KILLED RVALUE|cp  0xFB|jr  nz, rvb_set_player_killed_done|ld  a, (_player + 32) 	; player.killed|ret|.rvb_set_player_killed_done"
If RV(&HFA) Then writeAssemblyString fOut, "; OBJS RVALUE|cp  0xFA|jr  nz, rvb_set_player_objs_done|ld  a, (_player + 27) 	; player.objs|ret|.rvb_set_player_objs_done"
If RV(&HF9) Then writeAssemblyString fOut, "; LIFE RVALUE|cp  0xF9|jr  nz, rvb_set_player_life_done|ld  a, (_player + 29) 	; player.life MSB|ret|.rvb_set_player_life_done"
If RV(&HF8) Then writeAssemblyString fOut, "; TX RVALUE|cp  0xF8|jr  nz, rvb_set_tx_done|ld  a, (_tpx)|ret|.rvb_set_tx_done"
If RV(&HF7) Then writeAssemblyString fOut, "; TY RVALUE|cp  0xF7|jr  nz, rvb_set_ty_done|ld  a, (_tpy)|ret|.rvb_set_ty_done"
If RV(&HF6) Then writeAssemblyString fOut, "; TN RVALUE|cp  0xF6|jr  nz, rvb_set_tile_done|ld  a, (_tqt)|ret|.rvb_set_tile_done"
If RV(&HF5) Then writeAssemblyString fOut, "; HOTSPOT RVALUE|cp  0xF5|jr  nz, rvb_set_tile_done|ld  a, (_hotspot_t)|ret|.rvb_set_tile_done"
If RV(&HF0) Then writeAssemblyString fOut, "; HIDE_HOTSPOTS RVALUE|cp  0xF0|jr  nz, rvb_set_hide_hotspots_done|ld  a, (_scenery_info + 0)|ret|.rvb_set_set_hide_hotspots"
If RV(&HEF) Then writeAssemblyString fOut, "; DONT_MAKE_FANTIES RVALUE|cp  0xEF|jr  nz, rvb_set_dont_make_fanties_done|ld  a, (_scenery_info + 1)|ret|.rvb_set_dont_make_fanties_done"
If RV(&HEE) Then writeAssemblyString fOut, "; EN_T RVALUE|cp  0xEE|jr  nz, rvb_set_en_t_done|ld  a, (__en_t)|ret|.rvb_set_en_t_done"
If RV(&HED) Then writeAssemblyString fOut, "; EN_N RVALUE|cp  0xED|jr  nz, rvb_set_en_n_done|ld  a, (_en_it)|ret|.rvb_set_en_n_done"
If RV(&HEC) Then writeAssemblyString fOut, "; EN_X RVALUE|cp  0xEC|jr  nz, rvb_set_en_x_done|ld  a, (__en_x)|ret|.rvb_set_en_x_done"
If RV(&HEB) Then writeAssemblyString fOut, "; EN_Y RVALUE|cp  0xEB|jr  nz, rvb_set_en_y_done|ld  a, (__en_y)|ret|.rvb_set_en_y_done"

writeAssemblyString fOut, "ld  d, 0|ld  e, a|ld  hl, _flags|add hl, de|ld  a, (hl)|ret"
writeAssemblyString fOut, ".read_x_y|call read_vbyte|ld  (sc_x), a|call read_vbyte|ld  (sc_y), a|ret"
writeAssemblyString fOut, ";; Read flag index and value, returns pointer in HL and value in A.|.read_i_v|call read_vbyte  		; Read flag index|ld  c, a|call read_vbyte 		; Read value|ld  (sc_y), a"
writeAssemblyString fOut, "ld  a, c  				; C = flag index"
If LV(&HFE) Then writeAssemblyString fOut, "; NPANT LVALUE|cp  0xFE|jr  nz, riv_set_n_pant_done|ld  hl, _n_pant|jr  read_i_v_cont|.riv_set_n_pant_done"
If LV(&HFD) Then writeAssemblyString fOut, "; PX LVALUE|cp  0xFD|jr  nz, riv_set_gpx_done|ld  hl, _gpx|jr  read_i_v_cont|.riv_set_gpx_done"
If LV(&HFC) Then writeAssemblyString fOut, "; PY LVALUE|cp  0xFC|jr  nz, riv_set_gpy_done|ld  hl, _gpy|jr  read_i_v_cont|.riv_set_gpy_done"
If LV(&HFB) Then writeAssemblyString fOut, "; KILLED LVALUE|cp  0xFB|jr  nz, riv_set_player_killed_done|ld  hl, _player + 32	; player.killed|jr  read_i_v_cont|.riv_set_player_killed_done"
If LV(&HFA) Then writeAssemblyString fOut, "; OBJS LVALUE|cp  0xFA|jr  nz, riv_set_player_objs_done|ld  hl, _player + 27	; player.objs|jr  read_i_v_cont|.riv_set_player_objs_done"
If LV(&HF9) Then writeAssemblyString fOut, "; LIFE LVALUE|cp  0xF9|jr  nz, riv_set_player_life_done|ld  hl, _player + 29	; player.life LSB|jr  read_i_v_cont|.riv_set_player_life_done"
If LV(&HF0) Then writeAssemblyString fOut, "; HIDE_HOTSPOTS LVALUE|cp  0xF0|jr  nz, riv_set_hide_hotspots_done|ld  hl, _scenery_info + 0	; scenery_info.hide_hotspots|jr  read_i_v_cont|.riv_set_hide_hotspots_done"
If LV(&HEF) Then writeAssemblyString fOut, "; DONT_MAKE_FANTIES LVALUE|cp  0xEF|jr  nz, riv_set_dont_make_fanties_done|ld  hl, _scenery_info + 1	; scenery_info.dont_make_rr|jr  read_i_v_cont|.riv_set_dont_make_fanties_done"
If LV(&HEE) Then writeAssemblyString fOut, "; EN_T LVALUE|cp  0xEE|jr  nz, riv_set_player_life_done|ld  hl, __en_t|jr  read_i_v_cont|.riv_set_player_life_done"
If LV(&HEC) Then writeAssemblyString fOut, "; EN_X LVALUE|cp  0xEC|jr  nz, riv_set_player_life_done|ld  hl, __en_x|jr  read_i_v_cont|.riv_set_player_life_done"
If LV(&HEB) Then writeAssemblyString fOut, "; EN_Y LVALUE|cp  0xEB|jr  nz, riv_set_player_life_done|ld  hl, __en_y|jr  read_i_v_cont|.riv_set_player_life_done"

writeAssemblyString fOut, "ld  b, 0 				; BC = flag index|ld  hl, _flags|add hl, bc 				; HL -> FLAGS [X]"
writeAssemblyString fOut, ".read_i_v_cont|ld  a, (sc_y) 			; A = value|ret"

Close #fOut

Print "DONE!"
