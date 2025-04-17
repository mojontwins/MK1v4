' MSC4
' Copyleft 2025 by The Mojon Twins

#include "mtparser.bi"
#include "cmdlineparser.bi"

Dim Shared As Integer debug = -1

Dim Shared As String tokens (63)
Dim Shared As Integer curLineNo

Dim Shared As String aliases (128)
Dim Shared As Integer curAliasIndex = 0

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

	parseTokenizeString linea, tokens (), ",", "#"

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

	If debug Then debugPrintTokens: Print
End Sub

Function correctLvalue (s As String) As Integer
	Return s <> "" And Left (s, 1) = "$"
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

parseScriptLine "SET FLAG 5=3"
parseScriptLine "SWAP FLAG 4, FLAG FLAG 5 # Swap these values!"
parseScriptLine "IF %OBJECT = FLAG %ITEM"
parseScriptLine "INC FLAG %OBJECT, 1"
parseScriptLine "IF N_PANT = $2"

writeAssemblyString 0, ";; IF a = b|;; 14 v1 v2|.c_opcode_14|call read_vbyte|ld  b, a|call read_vbyte|cp  b|jr  nz, set_break_and_ret|ret"
