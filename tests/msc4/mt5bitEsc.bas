' 5 bit escaped text encoder by na_th_an
' Copyleft 2025 by the Mojon Twins
'
' Charset is assumed to be
'
'   ! " # $ % & ' ( ) * + , - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ?
' @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z , . ? ! s
'                                                       \_______/
' Note those special characters. s is a blank space.
'
' Output will be:
' n = 0 means ESC
' n = 1-31 represent ASC(n + 64)
' 0 m = ESC m
'   m = 0    = ESC 0 = END OF STRING
'   m = 1-30 = ESC m = ASC(m + 32) 
'   m = 31   = ESC 31 = New line

Function encodeWord (word As String) As String
	Dim As String binaryString
	Dim As String * 1 m
	Dim As Integer i

	For i = 1 To Len (word)
		m = Mid (word, i, 1)

		If m = " " Then 
			binaryString = binaryString & "11111"

		ElseIf m = "," Then 
			binaryString = binaryString & Bin (27, 5)

		ElseIf m = "." Then
			binaryString = binaryString & Bin (28, 5)

		ElseIf m = "?" Then 
			binaryString = binaryString & Bin (29, 5)

		ElseIf m = "!" Then 
			binaryString = binaryString & Bin (30, 5)

		ElseIf m < "?" Then 
			binaryString = binaryString & "00000" & Bin (Asc (m) - 32, 5)

		ElseIf m >= "A" And m <= "Z" Then 
			binaryString = binaryString & Bin (Asc (m) - 64, 5)

		ElseIf m >= "a" And m <= "z" Then 
			binaryString = binaryString & Bin (Asc (Ucase (m)) - 64, 5) 

		End If
	Next i

	Return binaryString
End Function

Function encodeBinaryString (binaryString As String) As String 
	Dim As Integer i
	Dim As String encodedString

	' First add padding 
	If Len (binaryString) Mod 8 <> 0 Then 
		binaryString = binaryString + String (8 - (Len (binaryString) Mod 8), "0")
	End If

	' Now encode 
	For i = 1 to len (binaryString) Step 8
		encodedString = encodedString + Chr (Val ("&B" & Mid (binaryString, i, 8)))		
	Next i

	Return encodedString
End Function 

Function encode5BitEsc (text As String, wrap As Integer) As String
	Dim As Integer i, curLinLen
	Dim As String * 1 m
	Dim As String binaryString
	Dim As String curWord

	text = text & " "
	curWord = ""
	curLinLen = 0

	For i = 1 To Len (text)
		m = Mid (text, i, 1)

		If m = " " Then 
			If curLinLen + Len (curWord) > wrap Then
				binaryString = binaryString & "0000011111" 	' ESC 31 = NL
				curLinLen = 0
			End If

			binaryString = binaryString & encodeWord (curWord)
			curLinLen = curLinLen + Len (curWord)
			curWord = ""

			If i = Len(text) Then 
				binaryString = binaryString & "0000000000"    ' ESC 0 = EOL
			ElseIf curLinLen < wrap Then 
				binaryString = binaryString & "11111"       ' 31 = SPACE
				curLinLen = curLinLen + 1
			End If
		Else
			curWord = curWord & m
		End If
	Next i

	Return encodeBinaryString (binaryString)
End Function

Sub prettyPrintEncodedString (encoded As String)
	Dim As Integer i
	Dim As Integer word
	Dim As Integer escOn
	Dim As String pretty
	Dim As String binaryString

	For i = 1 To Len (encoded) 
		binaryString = binaryString & Bin (Asc (Mid (encoded, i, 1)), 8)
	Next i

	For i = 1 To Len (binaryString) Step 5 
		word = Val ("&B" & Mid (binaryString, i, 5))
		Print Hex(word, 2) & " ";

		pretty = "*WRONG*"

		If escOn Then 
			escOn = 0 

			Select Case word 
				case 0: pretty = "END"
				case 1 To 30: pretty = Chr (32 + word)
				case 31: pretty = "NL"
			End Select

			Print "[" & pretty & "] "
		Else 
			If word = 0 Then 
				escOn = -1
			Else
				Select case word
					case 1 To 26: pretty = Chr (64 + word)
					case 27: pretty = ","
					case 28: pretty = "."
					case 29: pretty = "?"
					case 30: pretty = "!"
					case 31: pretty = "SPACE"
				End Select
				Print "[" & pretty & "] "
			End If 

		End If
	Next i

End Sub

Function decodeBin (mainBin () As uByte, offset As Integer) As String
	' Starts decoding decodeBin from offset
	Dim As Integer index, i
	Dim As Integer d
	Dim As uByte escOn
	Dim As String decoded
	Dim As String binaryString

	index = offset 
	For i = index To uBound (mainBin) 
		binaryString = binaryString & Bin (mainBin (i), 8)
	Next i

	For i = 1 To Len (binaryString) Step 5
		d = Val ("&B" & Mid (binaryString, i, 5))

		If escOn Then
			escOn = 0
			Select Case d
				Case 0: Exit For 
				Case 1 To 30: decoded = decoded & Chr (32 + d)
				Case 31: decoded = decoded & Chr (13) & Chr (10)
			End Select

		Else
			Select case d
				Case 0: escOn = -1 
				Case 1 To 26: decoded = decoded & Chr (64 + d)
				case 27: decoded = decoded & ","
				case 28: decoded = decoded & "."
				case 29: decoded = decoded & "?"
				case 30: decoded = decoded & "!"
				case 31: decoded = decoded & " "
			End Select

		End If
	Next i

	Return decoded
End Function

