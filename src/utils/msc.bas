' Parser y compilador para los scripts de MTE MK1 v4.
' Copyleft 2010, 2011 The Mojon Twins, los masters del código guarro.
' Compilar con freeBasic (http://www.freebasic.net).

Const LIST_WORDS_SIZE = 20
Const LIST_CLAUSULES_SIZE = 100
Dim Shared lP (LIST_WORDS_SIZE) As String
Dim Shared listaClausulasEnter (LIST_CLAUSULES_SIZE) As Integer
Dim Shared listaClausulasFire (LIST_CLAUSULES_SIZE) As Integer
Dim Shared clausulasUsed (255) As Integer
Dim Shared actionsUsed (255) As Integer
Dim Shared maxItem As Integer
Dim Shared maxFlag As Integer
Dim Shared maxNPant As Integer
Dim Shared clausulasEnterIdx As Integer
Dim Shared clausulasFireIdx As Integer
Dim Shared clausulasEnter (LIST_CLAUSULES_SIZE) As String
Dim Shared clausulasFire (LIST_CLAUSULES_SIZE) As String
Dim AddTo (LIST_WORDS_SIZE) As Integer
Dim AddToIdx As Integer
Dim Shared As Integer useFlipFlops
Dim Shared As Integer useShortSetTile

Sub dump ()
	Dim i As Integer
	For i = 0 to LIST_WORDS_SIZE
		Print "["+lP (i) + "]";
	next i
	print
end sub

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

Sub stringToArray (in As String)
	Dim m as Integer
	Dim index as Integer
	Dim character as String * 1
	Dim As Integer comillas, hadComillas
	
	for m = 1 to LIST_WORDS_SIZE: lP (m) = "": Next m
	
	index = 0
	lP (index) = ""
	in = in + " "
	comillas = 0
	hadComillas = 0
	
	For m = 1 To Len (in)
		character = Ucase (Mid (in, m, 1))
		If character = Chr (34) Then
			comillas = Not comillas
			hadComillas = -1
		ElseIf comillas Then 
			lP (index) = lP (index) + character
		ElseIf (character >= "A" and character <= "Z") or (character >= "0" and character <="9") or character = "#" or character = "_" or character = "'" or character="<" or character=">" Then
			lP (index) = lP (index) + character
		Else
			If Not hadComillas Then lP (index) = Ltrim (Rtrim (lP (index)))
			hadComillas = 0
			If lP (index) <> "" Then
				index = index + 1
			End If
			If character <> " " Then 
				lP (index) = character
				index = index + 1
			End If
			lP (index) = ""
		End If
	Next m
End Sub

Sub displayMe (clausula As String) 
	Dim i As Integer
	Dim p As String
	
	For i = 1 To Len (clausula)
		p = Str (asc (mid (clausula, i, 1)))
		if Len (p) = 1 Then p = "00" + p
		If Len (p) = 2 Then p = "0" + p
		? p; 
		If i < Len (clausula) Then ? ", ";
	Next i
	Print
End Sub

Function writeMe (clausula As String) As String
	Dim res As String
	Dim i As Integer
	
	For i = 1 To Len (clausula)
		res = res + "0x" + hex (asc (mid (clausula, i, 1)), 2)
		
		If i < Len (clausula) Then res = res + ", "
	Next i
	writeMe = res
End Function

Function pval (s as string) as integer
	Dim res as integer
	if (left(s, 1) = "#") Then
		res = 128 + val (right (s, len(s) - 1))
	Else
		res = val (s)
	End If
	pval = res
end function

Function procesaClausulas (f As integer, nPant As Integer) As String
	' Lee cláusulas de la pantalla nPant del archivo abierto f
	Dim linea As String
	Dim terminado As Integer
	Dim estado As integer
	Dim clausulas As String
	Dim clausula As String
	Dim numclausulas As Integer
	Dim longitud As Integer
	Dim ai As Integer

	Dim As Integer fzx1, fzx2, fzy1, fzy2
	
	terminado = 0
	estado = 0
	numclausulas = 0
	longitud = 0
	clausulas = ""
	clausula = ""
	
	While not terminado And Not eof (f)
		Line input #f, linea
		linea = Trim (linea, Any chr (32) + chr (9))
		'?estado & " " & linea
		'?linea ;"-";:displayMe clausula
		stringToArray (linea)
		
		if estado <> 1 then
			' Leyendo cláusulas
			Select Case lP (0)
				case "IF":
					Select Case lP (1)
						Case "PLAYER_HAS_ITEM":
							clausula = clausula + chr (&H1) + chr (pval (lP (2)))
							numClausulas = numClausulas + 1
							clausulasUsed (&H1) = -1
						Case "PLAYER_HASN'T_ITEM":
							clausula = clausula + chr (&H2) + chr (pval (lP (2)))
							numClausulas = numClausulas + 1
							clausulasUsed (&H2) = -1
						Case "FLAG":
							' Autodetect flipflops
							If useFlipFlops Then
								' 0  1    2 3 4
								' IF FLAG x = 1

								If Val (lP (2)) < 16 And _
									Val (lP (4)) < 2 And _
									(lP (3) = "=" Or lP (3) = "<>" Or lP (3) = "!=") Then

									If (lP (3) = "=" And Val (lP (4)) = 0) Or _
										((lP (3) = "<>" Or lP (3) = "!=") And Val (lP (4)) = 1) Then
										clausula = clausula + chr (&HA0 + Val (lP (2)))
										numclausulas = numclausulas + 1
										clausulasUsed (&HA0) = -1
										Print "IF FLAG " & lP (2) & " = 0 -> 0x" & Hex (&HA0 + Val (lP (2)),2)
									End If

									If (lP (3) = "=" And Val (lP (4)) = 1) Or _
										((lP (3) = "<>" Or lP (3) = "!=") And Val (lP (0)) = 1) Then
										clausula = clausula + chr (&HB0 + Val (lP (2)))
										numclausulas = numclausulas + 1
										clausulasUsed (&HA0) = -1
										Print "IF FLAG " & lP (2) & " = 0 -> 0x" & Hex (&HB0 + Val (lP (2)),2)
									End If

									Exit Select
								End If
							End If

							Select Case lP (3)
								Case "=":
									if lP (4) = "FLAG" Then
										clausula = clausula + chr (&H14) + chr (pval (lP (2))) + chr (pval(lP (5)))
										clausulasUsed (&H14) = -1
									Else
										clausula = clausula + chr (&H10) + chr (pval (lP (2))) + chr (pval(lP (4)))
										clausulasUsed (&H10) = -1
									End If
								Case "<":
									If lP (4) = "FLAG" Then
										clausula = clausula + chr (&H15) + chr (pval (lP (2))) + chr (pval(lP (5)))
										clausulasUsed (&H15) = -1
									Else
										clausula = clausula + chr (&H11) + chr (pval (lP (2))) + chr (pval(lP (4)))
										clausulasUsed (&H11) = -1
									End If
								Case ">":
									If lP (4) = "FLAG" Then
										clausula = clausula + chr (&H16) + chr (pval (lP (2))) + chr (pval(lP (5)))
										clausulasUsed (&H16) = -1
									Else
										clausula = clausula + chr (&H12) + chr (pval (lP (2))) + chr (pval(lP (4)))
										clausulasUsed (&H12) = -1
									End If
								Case "<>", "!=":
									If lP (4) = "FLAG" Then
										clausula = clausula + chr (&H17) + chr (pval (lP (2))) + chr (pval(lP (5)))
										clausulasUsed (&H17) = -1
									Else
										clausula = clausula + chr (&H13) + chr (pval (lP (2))) + chr (pval(lP (4)))
										clausulasUsed (&H13) = -1
									End If
							End Select
							numClausulas = numClausulas + 1
						Case "PLAYER_TOUCHES":
							clausula = clausula + chr (&H20) + chr (pval (lP (2))) + chr (pval (lP (4)))
							clausulasUsed (&H20) = -1
							numClausulas = numClausulas + 1
						Case "PLAYER_IN_X":
							clausula = clausula + chr (&H21) + chr (val (lP (2))) + chr (val (lP (4)))
							clausulasUsed (&H21) = -1
							numClausulas = numClausulas + 1
						Case "PLAYER_IN_X_TILES":
							fzx1 = val (lP (2)) * 16 - 15
							If fzx1 < 0 Then fzx1 = 0
							fzx2 = val (lP (4)) * 16 + 15
							If fzx2 > 255 Then fzx2 = 255
							clausula = clausula + chr (&H21) + chr (fzx1) + chr (fzx2)
							clausulasUsed (&H21) = -1
							numClausulas = numClausulas + 1
						Case "PLAYER_IN_Y":
							clausula = clausula + chr (&H22) + chr (val (lP (2))) + chr (val (lP (4)))
							clausulasUsed (&H22) = -1
							numClausulas = numClausulas + 1
						Case "PLAYER_IN_Y_TILES":
							fzx1 = val (lP (2)) * 16 - 15
							If fzx1 < 0 Then fzx1 = 0
							fzx2 = val (lP (4)) * 16 + 15
							If fzx2 > 191 Then fzx2 = 191
							clausula = clausula + chr (&H22) + chr (fzx1) + chr (fzx2)
							clausulasUsed (&H22) = -1
							numClausulas = numClausulas + 1
						Case "ALL_ENEMIES_DEAD"
							clausula = clausula + chr (&H30)
							clausulasUsed (&H30) = -1
							numClausulas = numClausulas + 1
						Case "ENEMIES_KILLED_EQUALS"
							clausula = clausula + chr (&H31) + chr (pval (lP (2)))
							clausulasUsed (&H31) = -1
							numClausulas = numClausulas + 1
						Case "PLAYER_HAS_OBJECTS"
							clausula = clausula + chr (&H40)
							clausulasUsed (&H40) = -1
							numClausulas = numClausulas + 1
						Case "OBJECT_COUNT"
							clausula = clausula + chr (&H41) + chr (pval (lP (3)))
							clausulasUsed (&H41) = -1
							numClausulas = numClausulas + 1
						Case "NPANT"
							clausula = clausula + chr (&H50) + chr (pval (lP (2)))
							clausulasUsed (&H50) = -1
							numClausulas = numClausulas + 1
						Case "NPANT_NOT"
							clausula = clausula + chr (&H51) + chr (pval (lP (2)))
							clausulasUsed (&H51) = -1
							numClausulas = numClausulas + 1
						Case "TRUE"
							clausula = clausula + chr (&HF0)
							clausulasUsed (&HF0) = -1
							numClausulas = numClausulas + 1
					End Select
				case "THEN":
					clausula = clausula + Chr (255)
					if numclausulas = 0 Then Print "ERROR: THEN sin cláusulas": terminado = -1
					estado = 1
				case "END":
					if estado = 0 then
					terminado = -1
					end if	
			end select
		else
			' Leyendo acciones
			Select Case lP (0)
				Case "SET":
					Select Case lP (1)
						Case "ITEM":
							clausula = clausula + Chr (&H0) + Chr (pval (lP (2))) + chr (pval (lP (4)))
							actionsUsed (&H0) = -1
						Case "FLAG":
							' Autodetect flipflops
							If useFlipFlops Then
								' 0   1    2 3 4
								' SET FLAG x = 1

								If Val (lP (2)) < 16 And _
									Val (lP (4)) < 2 And _
									(lP (3) = "=" Or lP (3) = "<>" Or lP (3) = "!=") Then

									If Val (lP (4)) = 0 Then
										clausula = clausula + chr (&HA0 + Val (lP (2)))
										numclausulas = numclausulas + 1
										actionsUsed (&HA0) = -1
										Print "SET FLAG " & lP (2) & " = 0 -> 0x" & Hex (&HA0 + Val (lP (2)),2)
									Else
										clausula = clausula + chr (&HB0 + Val (lP (2)))
										numclausulas = numclausulas + 1
										actionsUsed (&HB0) = -1
										Print "SET FLAG " & lP (2) & " = 1 -> 0x" & Hex (&HB0 + Val (lP (2)),2)
									End If

									Exit Select
								End If
							End If
							clausula = clausula + Chr (&H1) + Chr (pval (lP (2))) + chr (pval (lP (4)))	
							actionsUsed (&H1) = -1
						Case "TILE":
							If useShortSetTile then
								clausula = clausula + Chr (&H20) + Chr (16*(Val (lP (3)) And 15) + (Val (lP (5)) And 15)) + Chr (pval (lP (8)))
							Else
								clausula = clausula + Chr (&H20) + Chr (pval (lP (3))) + Chr (pval (lP (5))) + Chr (pval (lP (8)))
							End If
							actionsUsed (&H20) = -1
						Case "BEH":
							clausula = clausula + Chr (&H21) + Chr (pval (lP (3))) + Chr (pval (lP (5))) + Chr (pval (lP (8)))
							actionsUsed (&H21) = -1
					End Select
				Case "INC":
					Select Case lP (1)
						Case "FLAG":
							clausula = clausula + Chr (&H10) + Chr (pval (lP (2))) + chr (pval (lP (4)))	
							actionsUsed (&H10) = -1
						Case "LIFE":
							clausula = clausula + Chr (&H30) + Chr (pval (lP (2)))
							actionsUsed (&H30) = -1
						Case "OBJECTS":
							clausula = clausula + Chr (&H40) + Chr (pval (lP (2)))
							actionsUsed (&H40) = -1
					End Select
				Case "DEC":
					Select Case lP (1)
						Case "FLAG":
							clausula = clausula + Chr (&H11) + Chr (pval (lP (2))) + chr (pval (lP (4)))						
							actionsUsed (&H11) = -1
						Case "LIFE":
							clausula = clausula + Chr (&H31) + Chr (pval (lP (2)))
							actionsUsed (&H31) = -1
						Case "OBJECTS":
							clausula = clausula + Chr (&H41) + Chr (pval (lP (2)))
							actionsUsed (&H41) = -1
					End Select
				Case "ADD":
					clausula = clausula + Chr (&H12) + Chr (pval (lP (2))) + chr (pval (lP (4)))						
					actionsUsed (&H12) = -1
				Case "SUB":
					clausula = clausula + Chr (&H13) + Chr (pval (lP (2))) + chr (pval (lP (4)))						
					actionsUsed (&H13) = -1
				Case "SWAP":
					clausula = clausula + Chr (&H14) + Chr (pval (lP (1))) + chr (pval (lP (3)))
					actionsUsed (&H14) = -1
				Case "FLIPFLOP":
					clausula = clausula + Chr (&H15) + Chr (pval (lP (1)))
					actionsUsed (&H15) = -1		
				Case "FLICKER":
					clausula = clausula + Chr (&H32)
					actionsUsed (&H32) = -1
				Case "DIZZY":
					clausula = clausula + Chr (&H33)
					actionsUsed (&H33) = -1
				Case "PRINT_TILE_AT":
					clausula = clausula + Chr (&H50) + Chr (pval (lP (2))) + Chr (pval (lP (4))) + Chr (pval (lP (7)))
					actionsUsed (&H50) = -1
				Case "SET_FIRE_ZONE":
					clausula = clausula + Chr (&H51) + Chr (pval (lP (1))) + Chr (pval (lP (3))) + Chr (pval (lP (5))) + Chr (pval (lP (7)))
					actionsUsed (&H51) = -1
				Case "SET_FIRE_ZONE_TILES":
					fzx1 = pval (lP (1)) * 16 - 15
					If fzx1 < 0 Then fzx1 = 0
					fzy1 = pval (lP (3)) * 16 - 15
					If fzy1 < 0 Then fzy1 = 0
					fzx2 = pval (lP (5)) * 16 + 15
					If fzx2 > 254 Then fzx2 = 254
					fzy2 = pval (lP (7)) * 16 + 15
					If fzy2 > 175 Then fzy2 = 175
					
					clausula = clausula + Chr (&H51) + Chr (fzx1) + Chr (fzy1) + Chr (fzx2) + Chr (fzy2)
					actionsUsed (&H51) = -1
				Case "SHOW_COINS":
					clausula = clausula + Chr (&H60)
					actionsUsed (&H60) = -1
				Case "HIDE_COINS":
					clausula = clausula + Chr (&H61)
					actionsUsed (&H61) = -1
				Case "ENABLE_KILL_SLOWLY"
					clausula = clausula + Chr (&H62)
					actionsUsed (&H62) = -1
				Case "DISABLE_KILL_SLOWLY"
					clausula = clausula + Chr (&H63)
					actionsUsed (&H63) = -1
				Case "ENABLE_TYPE_6"
					clausula = clausula + Chr (&H64)
					actionsUsed (&H64) = -1
				Case "DISABLE_TYPE_6"
					clausula = clausula + Chr (&H65)
					actionsUsed (&H65) = -1
				Case "ENABLE_MAKE_TYPE_6"
					clausula = clausula + Chr (&H66)
					actionsUsed (&H66) = -1
				Case "DISABLE_MAKE_TYPE_6"
					clausula = clausula + Chr (&H67)
					actionsUsed (&H67) = -1
				Case "SETY"
					clausula = clausula + Chr (&H6A) + Chr (pval (lP (1)))
					actionsUsed (&H6A) = -1	
				Case "SETX"
					clausula = clausula + Chr (&H6B) + Chr (pval (lP (1)))
					actionsUsed (&H6B) = -1
				Case "REPOSTN"
					clausula = clausula + Chr (&H6C) + Chr (pval (lP (1))) + Chr (pval (lP (3)))
					actionsUsed (&H6C) = -1
				Case "WARP_TO"
					clausula = clausula + Chr (&H6D) + Chr (pval (lP (1))) + Chr (pval (lP (3))) + Chr (pval (lP (5)))
					actionsUsed (&H6D) = -1
				Case "REDRAW"
					clausula = clausula + Chr (&H6E)
					actionsUsed (&H6E) = -1
				Case "REENTER"
					clausula = clausula + Chr (&H6F)
					actionsUsed (&H6F) = -1
				Case "NEXT_LEVEL":
					clausula = clausula + Chr (&HD0)
					actionsUsed (&HD0) = -1
				Case "SOUND":
					clausula = clausula + Chr (&HE0) + Chr (pval (lP (1)))
					actionsUsed (&HE0) = -1
				Case "SHOW":
					clausula = clausula + Chr (&HE1)
					actionsUsed (&HE1) = -1
				Case "RECHARGE":
					clausula = clausula + Chr (&HE2)
					actionsUsed (&HE2) = -1
				Case "TEXT":
					If Len (lP (1)) > 30 Then lP (1) = Left (lP (1), 30)
					clausula = clausula + Chr (&HE3) + Chr (Len (lP (1)))
					for ai = 1 To Len (lP (1))
						If Mid (lP (1), ai, 1) = "_" Then
							clausula = clausula + Chr (32)
						Else
							clausula = clausula + Chr (Asc(Mid (lP (1), ai, 1)))
						End If
					Next ai
					clausula = clausula + Chr (0)
					actionsUsed (&HE3) = -1
				Case "EXTERN":
					clausula = clausula + Chr (&HE4) + Chr (pval (lP (1)))
					actionsUsed (&HE4) = -1
				Case "GAME":
					clausula = clausula + Chr (240)
					actionsUsed (240) = -1
				Case "WIN":
					clausula = clausula + Chr (241)
					actionsUsed (241) = -1
				Case "END":
					clausula = clausula + Chr (255)
					clausula = Chr (len (clausula)) + clausula
					clausulas = clausulas + clausula
					numclausulas = 0
					estado = 0
					clausula = ""				
			End Select
		End if
	wend
	procesaClausulas = Clausulas + Chr (255)
End Function

Dim f As Integer
Dim i As Integer
Dim nPant As Integer
Dim linea As String
Dim clausulas As String
dim o as String

Dim inFileName As String
Dim outFileName As String
Dim maxpants As Integer

' TODO: Comprobación de la entrada
'inFileName = "test.spt"
'outFileName = "msc.h"
inFileName = command (1)
outFileName = command (2)
maxpants = pval (command (3))

useFlipFlops = inCommand ("flipflops")
useShortSetTile = inCommand ("shortsettile")

print "msc para MTE MK1 v4"

if command (2) = "" or maxpants = 0 then
	print "uso: msc input output maxpants [flipflops] [shortsettile]"
	system
end if

maxItem = 0
maxFlag = 0
maxNPant = 0

For i = 0 to LIST_CLAUSULES_SIZE
	listaClausulasEnter (i) = -1
	listaClausulasFire (i) = -1
Next i

' Abrimos el archivo de entrada
f = Freefile
Open inFileName for input as #f

' Esto es una máquina de estados.

While not eof (f)

	Line input #f, linea
	linea = Trim (linea, Any chr (32) + chr (9))
	stringToArray (linea)
	
	' ESTADO 1: Buscando ENTERING SCREEN x ó PRESS_FIRE AT SCREEN x
	Select Case lP (0)
		Case "ENTERING":
			If lP (1) = "GAME" Then
				AddToIdx = 1
				AddTo (0) = maxpants
			ElseIf lP (1) = "ANY" Then
				AddToIdx = 1
				AddTo (0) = maxpants + 1
			Else
				AddToIdx = 0
				For i = 2 to LIST_WORDS_SIZE
					If lP (i) <> "" And lP (i) <> "," Then
						AddTo (AddToIdx) = val (lP (i))
						AddToIdx = AddToIdx + 1
					End If
				Next i
			End If
			clausulas = procesaClausulas (f, 0)
			clausulasEnter (clausulasEnterIdx) = clausulas	
			For i = 0 To AddToIdx - 1
				listaClausulasEnter (AddTo(i)) = clausulasEnterIdx
				'?"listaClausulasEnter (" & AddTo(i) & ") = " & clausulasEnterIdx
			Next i
			
			clausulasEnterIdx = clausulasEnterIdx + 1
		Case "PRESS_FIRE":
			If lP (2) = "ANY" Then
				AddToIdx = 1
				AddTo (0) = maxpants
			Else
				AddToIdx = 0
				For i = 3 to LIST_WORDS_SIZE
					If lP (i) <> "" And lP (i) <> "," Then
						AddTo (AddToIdx) = val (lP (i))
						AddToIdx = AddToIdx + 1
					End If
				Next i
			End If
			clausulas = procesaClausulas (f, 0)
			clausulasFire (clausulasFireIdx) = clausulas
			
			For i = 0 To AddToIdx - 1
				listaClausulasFire (AddTo(i)) = clausulasFireIdx
			Next i
			
			clausulasFireIdx = clausulasFireIdx + 1

		Case "PLAYER_GETS_COIN":
			clausulas = procesaClausulas (f, 0)
			clausulasFire (clausulasFireIdx) = clausulas
			listaClausulasFire (maxpants + 1) = clausulasFireIdx
			clausulasFireIdx = clausulasFireIdx + 1
		
		Case "PLAYER_KILLS_ENEMY":
			clausulas = procesaClausulas (f, 0)
			clausulasFire (clausulasFireIdx) = clausulas
			listaClausulasFire (maxpants + 2) = clausulasFireIdx
			clausulasFireIdx = clausulasFireIdx + 1
		

	End Select
Wend

' Fin
Close #f

' Y cuando tenemos todo esto lleno, tenemos que sacar 
' el código que interpreta los scripts y los scripts
' en sí en #asm con etiquetas y luego un array de etiquetas.

' Esta es, en realidad, la parte complicada y eso. Pero
' tampoco es demasiado moco de pavo.

f = FreeFile
open "msc-config.h" for output as #f

print #f, "// msc.h"
print #f, "// Generado por Mojon Script Compiler de MTE MK1 v4"
print #f, "// Copyleft 2011 The Mojon Twins"
print #f, " "
If clausulasUsed (&H1) Or clausulasUsed (&H2) Then
	print #f, "#define MSC_MAXITEMS    " + str (32)
	print #f, " "
	print #f, "typedef struct {"
	print #f, "    unsigned char status;"
	print #f, "    unsigned char supertile;"
	print #f, "    unsigned char n_pant;"
	print #f, "    unsigned char x, y;"
	print #f, "} ITEM;"
	print #f, "ITEM items [MSC_MAXITEMS];"
	print #f, " "
End If
print #f, "unsigned char script_result = 0;"
print #f, "unsigned char script_something_done = 0;"
print #f, " "
close #f

open outFileName for output as #f
print #f, "// msc.h"
print #f, "// Generado por Mojon Script Compiler de MTE MK1 v4"
print #f, "// Copyleft 2011 The Mojon Twins"
print #f, " "
print #f, "// Script data & pointers"

for i = 0 to clausulasEnterIdx - 1
	print #f, "extern unsigned char mscce_"+trim(str(i))+" [];"
Next i
	
For i = 0 To clausulasFireIdx - 1
	print #f, "extern unsigned char msccf_"+trim(str(i))+" [];"
next i

print #f, " "
print #f, "unsigned char *e_scripts [] = {"
o = ""
for i = 0 to maxpants + 1
	if listaClausulasEnter (i) <> -1 Then
		o = o + "mscce_"+trim(str(listaClausulasEnter (i)))
	else
		o = o + "0"
	end if
	if i < maxpants + 1 then o = o +", "
next i
print #f, "    " + o
print #f, "};"

print #f, " "
print #f, "unsigned char *f_scripts [] = {"
o = ""
for i = 0 to maxpants + 2
	if listaClausulasFire (i) <> -1 Then
		o = o + "msccf_"+trim(str(listaClausulasFire (i)))
	else
		o = o + "0"
	end if
	if i < maxpants + 2 then o = o +", "
next i
print #f, "    " + o
print #f, "};"

print #f, " "
print #f, "#asm"
For i = 0 to clausulasEnterIdx - 1
	print #f, "._mscce_" + Trim (Str (i))
	print #f, "    defb " + writeMe (clausulasEnter (i))
Next i
For i = 0 To clausulasFireIdx - 1
	print #f, "._msccf_" + Trim (Str (i))
	print #f, "    defb " + writeMe (clausulasFire (i))
Next i

print #f, "#endasm"

print #f, " "
print #f, "unsigned char *script;"
print #f, "unsigned char *next_script;"
print #f, "unsigned char sc_i, sc_m, sc_x, sc_y, sc_c, sc_n, sc_terminado, sc_continuar;"
print #f, " "
print #f, "void msc_init_all (void) {"
If clausulasUsed (&H1) Or clausulasUsed (&H2) Then
	print #f, "    for (sc_i = 0; sc_i < MSC_MAXITEMS; sc_i ++)"
	print #f, "        items [sc_i].status = 0;"
End If
print #f, "    #asm"
print #f, "            ld  hl, _flags"
print #f, "            ld  de, _flags+1"
print #f, "            ld  bc, MAX_FLAGS-1"
print #f, "            xor a"
print #f, "            ld  (hl), a"
print #f, "            ldir"
print #f, "    #endasm"
print #f, "}"
print #f, " "
print #f, "unsigned char read_byte (void) {"
print #f, "    #asm"
print #f, "            ld  hl, (_script)"
print #f, "            ld  a, (hl)"
print #f, "            inc hl"
print #f, "            ld  (_script), hl"
print #f, "            ld  l, a"
print #f, "            ld  h, 0"
If useFlipFlops Or useShortSetTile Then
	print #f, "            and 0xF0"
	print #f, "            ld  (_sc_i), a"
	print #f, "            ld  a, l"
	print #f, "            and 0x0f"
	print #f, "            ld  (_sc_m), a"
End If
print #f, "   #endasm"
print #f, "}"
print #f, " "
print #f, "unsigned char read_vbyte (void) {"
print #f, "    #asm"
print #f, "            call _read_byte"
print #f, "            ;ld  a, l"
print #f, "            bit 7, a"
print #f, "            ret z"
print #f, "            and 127"
print #f, "            ld  d, 0"
print #f, "            ld  e, a"
print #f, "            ld  hl, _flags"
print #f, "            add hl, de"
print #f, "            ld  l, (hl)"
print #f, "            ld  h, 0"
print #f, "    #endasm"
print #f, "}"
print #f, "void read_x_y (void) {"
print #f, "    #asm"
print #f, "            call _read_vbyte"
print #f, "            ld  a, l"
print #f, "            ld  (_sc_x), a"
print #f, "            call _read_vbyte"
print #f, "            ld  a, l"
print #f, "            ld  (_sc_y), a"
print #f, "    #endasm"
print #f, "}"
print #f, " "
print #f, "// Ejecutamos el script apuntado por *script:"
print #f, "void run_script (void) {"
print #f, "    script_result = 0;"
print #f, " "
print #f, "    if (script == 0)"
print #f, "        return; "
print #f, " "
print #f, "    script_something_done = 0;"
print #f, " "
print #f, "    while (0 == script_result) {"
print #f, "        sc_c = read_byte ();"
print #f, "        if (sc_c == 0xFF) break;"
print #f, "        next_script = script + sc_c;"
print #f, "        sc_terminado = sc_continuar = 0;"
print #f, "        while (0 == sc_terminado) {"
print #f, "            sc_c = read_byte ();"
If useFlipFlops Then
	print #f, "            if (sc_i == 0xa0) { sc_terminado = flags [sc_m]; }"
	print #f, "            else if (sc_i == 0xb0) { sc_terminado = (! flags [sc_m]); }"
	print #f, "            else switch (sc_c) {"
Else
	print #f, "            switch (sc_c) {"
End If

if clausulasUsed (&H1) Then
	print #f, "                case 0x01:"
	print #f, "                    // IF PLAYER_HAS_ITEM x"
	print #f, "                    // Opcode: 01 x"
	print #f, "                    sc_terminado = (items [read_vbyte ()].status == 0);"
	print #f, "                    break;"
end if

if clausulasUsed (&H2) Then
	print #f, "                case 0x02:"
	print #f, "                    // IF PLAYER_HASN'T_ITEM x"
	print #f, "                    // Opcode: 02 sc_x"
	print #f, "                    sc_terminado =  items [read_vbyte ()].status;"
	print #f, "                    break;"
end if

if clausulasUsed (&H10) Then
	print #f, "                case 0x10:"
	print #f, "                    // IF FLAG x = n"
	print #f, "                    // Opcode: 10 x n"
	print #f, "                    sc_terminado = (flags [read_vbyte ()] != read_vbyte ());"
	print #f, "                    break;"
end if

if clausulasUsed (&H11) Then
	print #f, "                case 0x11:"
	print #f, "                    // IF FLAG x < n"
	print #f, "                    // Opcode: 11 x n"	
	print #f, "                    sc_terminado =  (flags [read_vbyte ()] >= read_vbyte ());"
	print #f, "                    break;"
end if

if clausulasUsed (&H12) Then
	print #f, "                case 0x12:"
	print #f, "                    // IF FLAG x > n"
	print #f, "                    // Opcode: 12 x n"
	print #f, "                    sc_terminado =  (flags [read_vbyte ()] <= read_vbyte ());"
	print #f, "                        sc_terminado = 1;"
	print #f, "                    break;"
end if

if clausulasUsed (&H13) Then
	print #f, "                case 0x13:"
	print #f, "                    // IF FLAG x <> n"
	print #f, "                    // Opcode: 13 x n"	
	print #f, "                    sc_terminado =  (flags [read_vbyte ()] == read_vbyte ());"
	print #f, "                    break;"
end if

if clausulasUsed (&H14) Then
	print #f, "                case 0x14:"
	print #f, "                    // IF FLAG x = FLAG y"
	print #f, "                    // Opcode: 14 x n"
	print #f, "                    sc_terminado =  (flags [read_vbyte ()] != flags [read_vbyte ()];"
	print #f, "                    break;"
end if

if clausulasUsed (&H15) Then
	print #f, "                case 0x15:"
	print #f, "                    // IF FLAG x < FLAG y"
	print #f, "                    // Opcode: 15 x n"
	print #f, "                    sc_terminado = if (flags [read_vbyte ()] >= flags [read_vbyte ()]);"
	print #f, "                    break;"
end if

if clausulasUsed (&H16) Then
	print #f, "                case 0x16:"
	print #f, "                    // IF FLAG x > FLAG y"
	print #f, "                    // Opcode: 16 x n"
	print #f, "                    sc_terminado = (flags [read_vbyte ()] <= flags [read_vbyte ()]);"
	print #f, "                    break;"
end if

if clausulasUsed (&H17) Then
	print #f, "                case 0x17:"
	print #f, "                    // IF FLAG x <> FLAG y"
	print #f, "                    // Opcode: 17 x n"
	print #f, "                    sc_terminado = (flags [read_vbyte ()] == flags [read_vbyte ()]);"
	print #f, "                    break;"
end if

if clausulasUsed (&H20) Then
	print #f, "                case 0x20:"
	print #f, "                    // IF PLAYER_TOUCHES x, y"
	print #f, "                    // Opcode: 20 x y"
	print #f, "                    read_x_y ();"	
	print #f, "                    sc_terminado = (! ((player.x >> 6) >= (sc_x << 4) - 15 && (player.x >> 6) <= (sc_x << 4) + 15 && (player.y >> 6) >= (sc_y << 4) - 15 && (player.y >> 6) <= (sc_y << 4) + 15));"
	print #f, "                    break;"
end if

if clausulasUsed (&H21) Then
	print #f, "                case 0x21:"
	print #f, "                    // IF PLAYER_IN_X x1, x2"
	print #f, "                    // Opcode: 21 x1 x2"
	print #f, "                    sc_x = read_byte ();"
	print #f, "                    sc_y = read_byte ();"	
	print #f, "                    sc_terminado = (! ((player.x >> 6) >= sc_x && (player.x >> 6) <= sc_y));"
	print #f, "                    break;"
end if
	
if clausulasUsed (&H22) Then
	print #f, "                case 0x22:"
	print #f, "                    // IF PLAYER_IN_Y y1, y2"
	print #f, "                    // Opcode: 22 y1 y2"
	print #f, "                    sc_x = read_byte ();"
	print #f, "                    sc_y = read_byte ();"	
	print #f, "                    sc_terminado = (! ((player.y >> 6) >= sc_x && (player.y >> 6) <= sc_y));"
	print #f, "                    break;"
end if

if clausulasUsed (&H30) Then
	print #f, "                case 0x30:"
	print #f, "                    // IF ALL_ENEMIES_DEAD"
	print #f, "                    // Opcode: 30"
	print #f, "                    sc_terminado = (player.killed != BADDIES_COUNT);"
	print #f, "                    break;"
end if

if clausulasUsed (&H31) Then
	print #f, "                case 0x31:"
	print #f, "                    // IF ENEMIES_KILLED_EQUALS n"
	print #f, "                    // Opcode: 31 n"
	print #f, "                    sc_terminado = (player.killed != read_vbyte ());"
	print #f, "                    break;"
End If

if clausulasUsed (&H40) Then
	print #f, "                case 0x40:"
	print #f, "                     // IF PLAYER_HAS_OBJECTS"
	print #f, "                     // Opcode: 40"
	print #f, "                     sc_terminado = (player.objs == 0);"
	print #f, "                     break;"
End If

If clausulasUsed (&H41) Then
	print #f, "                case 0x41:"
	print #f, "                     // IF OBJECT_COUNT = n"
	print #f, "                     // Opcode: 41 n"
	print #f, "                     sc_terminado = (player.objs != read_vbyte ());"
	print #f, "                     break;"
End If

If clausulasUsed (&H50) Then
	print #f, "                case 0x50:"
	print #f, "                     // IF NPANT n"
	print #f, "                     // Opcode: 50 n"
	print #f, "                     sc_terminado = (n_pant != read_vbyte ());"
	print #f, "                     break;"
End If

If clausulasUsed (&H51) Then
	print #f, "                case 0x51:"
	print #f, "                     // IF NPANT_NOT n"
	print #f, "                     // Opcode: 51 n"
	print #f, "                     sc_terminado = (n_pant == read_vbyte ());"
	print #f, "                     break;"
End If

if clausulasUsed (&HF0) Then
	print #f, "                case 0xF0:"
	print #f, "                     // IF TRUE"
	print #f, "                     // Opcode: F0"
	print #f, "                     break;"
End If

print #f, "                case 0xFF:"
print #f, "                    // THEN"
print #f, "                    // Opcode: FF"
'print #f, "                    sc_terminado = 1;"
'print #f, "                    sc_continuar = 1;"
'print #f, "                    script_something_done = 1;"
print #f, "                    #asm" 
print #f, "                        ld  a, 1"
print #f, "                        ld  (_sc_terminado), a"
print #f, "                        ld  (_sc_continuar), a"
print #f, "                        ld  (_script_something_done), a"
print #f, "                    #endasm"
print #f, "                    break;"

print #f, "            }"
print #f, "        }"

print #f, "        if (sc_continuar) {"
print #f, "            sc_terminado = 0;"
print #f, "            while (0 == sc_terminado) {"
print #f, "                sc_c = read_byte ();"
If useFlipFlops Then
	print #f, "                if (sc_i == 0xa0) { flags [sc_m & 0x0f] = 0; }"
	print #f, "                else if (sc_i == 0xb0) { flags [sc_m & 0x0f] = 1; }"
	print #f, "                else switch (sc_c) {"
Else
	print #f, "                switch (sc_c) {"
End If
if actionsUsed (&H0) Then
	print #f, "                    case 0x00:"
	print #f, "                        // SET ITEM x n"
	print #f, "                        // Opcode: 00 x n"
	print #f, "                        items [read_vbyte ()].status = read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H1) Then
	print #f, "                    case 0x01:"
	print #f, "                        // SET FLAG x = n"
	print #f, "                        // Opcode: 01 x n"
	print #f, "                        flags [read_vbyte ()] = read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H10) Then
	print #f, "                    case 0x10:"
	print #f, "                        // INC FLAG x, n"
	print #f, "                        // Opcode: 10 x n"
	print #f, "                        flags [read_vbyte ()] += read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H11) Then
	print #f, "                    case 0x11:"
	print #f, "                        // DEC FLAG x, n"
	print #f, "                        // Opcode: 11 x n"
	print #f, "                        flags [read_vbyte ()] -= read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H12) Then
	print #f, "                    case 0x12:"
	print #f, "                        // ADD FLAGS x, y"
	print #f, "                        // Opcode: 12 x y"
	print #f, "                        flags [read_vbyte ()] += flags [read_vbyte ()];"
	print #f, "                        break;"
End If

if actionsUsed (&H13) Then
	print #f, "                    case 0x13:"
	print #f, "                        // SUB FLAGS x, y"
	print #f, "                        // Opcode: 13 x y"
	print #f, "                        flags [read_vbyte ()] -= flags [read_vbyte ()];"
	print #f, "                        break;"
End If

if actionsUsed (&H14) Then
	print #f, "                    case 0x14:"
	print #f, "                        // SWAP FLAGS x, y"
	print #f, "                        // Opcode: 14 x y"
	print #f, "                        read_x_y ();"
	print #f, "                        sc_n = flags [sc_x];"
	print #f, "                        flags [sc_x] = flags [sc_y];"
	print #f, "                        flags [sc_y] = sc_n;"
	print #f, "                        break;"
End If

if actionsUsed (&H20) Then
	print #f, "                    case 0x20:"
	print #f, "                        // SET TILE (x, y) = n"
	If useShortSetTile Then
		print #f, "                        // Opcode: 20 XY n"
		print #f, "                        read_byte ();  // fills sc_i = X0, sc_m = Y"
		print #f, "                        set_map_tile (sc_i >> 4, sc_m, sc_n = read_vbyte (), comportamiento_tiles [sc_n]);"
	Else
		print #f, "                        // Opcode: 20 x y n"
		'print #f, "                        read_x_y ();"
		'print #f, "                        sc_n = read_vbyte ();"
		'print #f, "                        map_buff [sc_x + (sc_y << 4) - sc_y] = sc_n;"
		'print #f, "                        map_attr [sc_x + (sc_y << 4) - sc_y] = comportamiento_tiles [sc_n];"
		'print #f, "                        draw_coloured_tile (VIEWPORT_X + sc_x + sc_x, VIEWPORT_Y + sc_y + sc_y, sc_n);"
		print #f, "                        set_map_tile (read_vbyte (), read_vbyte (), sc_n = read_vbyte (), comportamiento_tiles [sc_n]);"
	End If
	print #f, "                        break;"
End If

if actionsUsed (&H21) Then
	print #f, "                    case 0x21:"
	print #f, "                        // SET BEH (x, y) = n"
	print #f, "                        // Opcode: 21 x y n"
	print #f, "                        read_x_y ();"
	print #f, "                        map_attr [sc_x + (sc_y << 4) - sc_y] = read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H30) Then
	print #f, "                    case 0x30:"
	print #f, "                        // INC LIFE n"
	print #f, "                        // Opcode: 30 n"
	print #f, "                        player.life += read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H31) Then
	print #f, "                    case 0x31:"
	print #f, "                        // DEC LIFE n"
	print #f, "                        // Opcode: 31 n"
	print #f, "                        player.life -= read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H32) Then
	print #f, "                    case 0x32:"
	print #f, "                        // FLICKER"
	print #f, "                        // Opcode: 32"
	print #f, "                        player.estado |= EST_PARP;"
	print #f, "                        player.ct_estado = 32;"
	print #f, "                        break;"
End If

if actionsUsed (&H33) Then
	print #f, "                    case 0x33:"
	print #f, "                        // DIZZY"
	print #f, "                        // Opcode: 33"
	print #f, "                        player.estado |= EST_DIZZY;"
	print #f, "                        player.ct_estado = 32;"
	print #f, "                        break;"
End If

if actionsUsed (&H40) Then
	print #f, "                    case 0x40:"
	print #f, "                        // INC OBJECTS n"
	print #f, "                        // Opcode: 40 n"
	print #f, "                        player.objs += read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H41) Then
	print #f, "                    case 0x41:"
	print #f, "                        // DEC OBJECTS n"
	print #f, "                        // Opcode: 41 n"
	print #f, "                        player.objs -= read_vbyte ();"
	print #f, "                        break;"
End If

if actionsUsed (&H50) then
	print #f, "                    case 0x50:"
	print #f, "                        // PRINT_TILE_AT (X, Y) = N"
	print #f, "                        // Opcode: 50 x y n"
	print #f, "                        draw_coloured_tile (read_vbyte (), read_vbyte (), read_vbyte ());"
	print #f, "                        break;"
end if

if actionsUsed (&H51) Then
	print #f, "                    case 0x51:"
	print #f, "                        // SET_FIRE_ZONE x1, y1, x2, y2"
	print #f, "                        // Opcode: 51 x1 y1 x2 y2"
	print #f, "                        fzx1 = read_byte ();"
	print #f, "                        fzy1 = read_byte ();"
	print #f, "                        fzx2 = read_byte ();"
	print #f, "                        fzy2 = read_byte ();"
	print #f, "                        f_zone_ac = 1;"
	print #f, "                        break;"
End If

if actionsUsed (&H60) Then
	print #f, "                    case 0x60:"
	print #f, "                        // SHOW_COINS"
	print #f, "                        // Opcode: 60"
	print #f, "                        scenery_info.show_coins = 1;"
	print #f, "                        break;"
End If

if actionsUsed (&H61) Then
	print #f, "                    case 0x61:"
	print #f, "                        // HIDE_COINS"
	print #f, "                        // Opcode: 61"
	print #f, "                        scenery_info.show_coins = 0;"
	print #f, "                        break;"
End If

If actionsUsed (&H62) Then
	print #f, "                    case 0x62:"
	print #f, "                        // ENABLE_KILL_SLOWLY"
	print #f, "                        // Opcode: 62"
	print #f, "                        scenery_info.evil_kills_slowly = 1;"
	print #f, "                        break;"
End If

If actionsUsed (&H63) Then
	print #f, "                    case 0x63:"
	print #f, "                        // DISABLE_KILL_SLOWLY"
	print #f, "                        // Opcode: 63"
	print #f, "                        scenery_info.evil_kills_slowly = 0;"
	print #f, "                        break;"
End If

If actionsUsed (&H64) Then
	print #f, "                    case 0x64:"
	print #f, "                        // ENABLE_TYPE_6"
	print #f, "                        // Opcode: 64"
	print #f, "                        scenery_info.allow_type_6 = 1;"
	print #f, "                        break;"
End If

If actionsUsed (&H65) Then
	print #f, "                    case 0x65:"
	print #f, "                        // DISABLE_TYPE_6"
	print #f, "                        // Opcode: 65"
	print #f, "                        scenery_info.allow_type_6 = 0;"
	print #f, "                        break;"
End If

If actionsUsed (&H66) THen 
	print #f, "                    case 0x66:"
	print #f, "                        // ENABLE_MAKE_TYPE_6"
	print #f, "                        // Opcode: 66"
	print #f, "                        scenery_info.make_type_6 = 1;"
	print #f, "                        break;"
End If

If actionsUsed (&H67) THen 
	print #f, "                    case 0x67:"
	print #f, "                        // DISABLE_MAKE_TYPE_6"
	print #f, "                        // Opcode: 67"
	print #f, "                        scenery_info.make_type_6 = 0;"
	print #f, "                        break;"
End If

If actionsUsed (&H6A) Then
	print #f, "                    case 0x6A:"
	print #f, "                        // SETY y"
	print #f, "                        // Opcode: 6B y"
	print #f, "                        player.y = read_vbyte () << 10;"
	Print #f, "                        stop_player ();"
	print #f, "                        break;"
End If

If actionsUsed (&H6B) Then
	print #f, "                    case 0x6B:"
	print #f, "                        // SETX x"
	print #f, "                        // Opcode: 6B sc_x"
	print #f, "						   player.x = read_vbyte () << 10;"
	Print #f, "                        stop_player ();"
	print #f, "                        break;"
End If

If actionsUsed (&H6C) Then
	print #f, "                    case 0x6C:"
	print #f, "                        // REPOSTN x y"
	print #f, "                        // Opcode: 6C x y"
	print #f, "                        player.x = read_vbyte () << 10;"
	print #f, "                        player.y = read_vbyte () << 10;"
	print #f, "                        player.vx = player.vy = 0;"
	print #f, "                        script_result = 3; sc_terminado = 1;"
	print #f, "                        break;"
End If

If actionsUsed (&H6D) Then
	print #f, "                    case 0x6D:"
	print #f, "                        // WARP_TO n"
	print #f, "                        // Opcode: 6D n"
	print #f, "                        n_pant = read_vbyte ();"
	print #f, "                        player.x = read_vbyte () << 10;"
	print #f, "                        player.y = read_vbyte () << 10;"
	print #f, "                        script_result = 3; sc_terminado = 1;"
	print #f, "                        break;"
End If

if actionsUsed (&H6E) Then
	print #f, "                    case 0x6E:"
	print #f, "                        // REDRAW"
	print #f, "                        // Opcode: 6E"
	print #f, "                        draw_scr_background ();"
	print #f, "                        break;"
End If

if actionsUsed (&H6F) Then
	print #f, "                    case 0x6F:"
	print #f, "                        // REENTER"
	print #f, "                        // Opcode: 6F"
	print #f, "                        script_result = 3; sc_terminado = 1;"
	print #f, "                        break;"
End If

if actionsUsed (&HD0)  Then
	print #f, "                    case 0xD0:"
	print #f, "                        // NEXT_LEVEL"
	print #f, "                        // Opcode: D0"
	print #f, "                        n_pant ++;"
	print #f, "                        init_player_values ();"
	print #f, "                        break;"
End If

if actionsUsed (&HE0) Then
	print #f, "                    case 0xE0:"
	print #f, "                        // SOUND n"
	print #f, "                        // Opcode: E0 n"
	print #f, "                        play_sfx (read_vbyte ());"
	print #f, "                        break;"
End If

If actionsUsed (&HE1) Then
	print #f, "                    case 0xE1:"
	print #f, "                        // SHOW"
	print #f, "                        // Opcode: E1"
	print #f, "                        sp_UpdateNow ();"
	print #f, "                        break;"
End If

if actionsUsed (&HE2) Then
	print #f, "                    case 0xE2:"
	print #f, "                        // RECHARGE"
	print #f, "                        player.life = PLAYER_LIFE;"
	print #f, "                        break;"
End If

if actionsUsed (&HE3) Then
	print #f, "                    case 0xE3:"
	'print #f, "                        sc_x = 0;"
	'print #f, "                        while (1) {"
	'print #f, "                           sc_n = read_byte ();"
	'print #f, "                           if (sc_n == 0xEE) break;"
	'print #f, "                           sp_PrintAtInv (LINE_OF_TEXT, LINE_OF_TEXT_X + sc_x, LINE_OF_TEXT_ATTR, sc_n);"
	'print #f, "                           sc_x ++;"
	'print #f, "                        }"
	print #f, "                        sc_n = read_byte ();"
	print #f, "                        draw_text (LINE_OF_TEXT_X, LINE_OF_TEXT, LINE_OF_TEXT_ATTR, script);"
	print #f, "                        script += sc_n;"
	print #f, "                        break;"
End If

if actionsUsed (&HE4) Then
	print #f, "                    case 0xE4:"
	print #f, "                        // EXTERN n"
	print #f, "                        // Opcode: E4 n"
	print #f, "                        do_extern_action (read_byte ());"
	print #f, "                        break;"
End If

if actionsUsed (&HF0) Then
	print #f, "                    case 0xF0:"
	print #f, "                        script_result = 2;"
	print #f, "                        sc_terminado = 1;"
	print #f, "                        break;"
End If

if actionsUsed (&HF1) Then
	print #f, "                    case 0xF1:"
	print #f, "                        #asm" 
	print #f, "                            ld  a, 1"
	print #f, "                            ld  (_sc_terminado), a"
	print #f, "                            ld  (_script_result), a"
	print #f, "                        #endasm"
	print #f, "                        break;"
End If

print #f, "                    case 0xFF:"
print #f, "                        sc_terminado = 1;"
print #f, "                        break;"
print #f, "                }"
print #f, "            }"
print #f, "        }"
print #f, "        script = next_script;"
print #f, "    }"
print #f, "}"

' Fin
Close #f

' Joer, qué guarrada, pero no veas cómo funciona... Incredibly evil.
' Po eso. 

Print "DONE: CE " & clausulasEnterIdx & ", CF " & clausulasFireIdx