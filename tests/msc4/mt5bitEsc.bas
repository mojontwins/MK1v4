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

Function encode5BitEsc (text As String, wrap As Integer) As String
	Dim As Integer i
	Dim As String * 1 m

	For i = 1 To Len (text)

	Next i
End Function
