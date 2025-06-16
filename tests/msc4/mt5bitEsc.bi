' 5 bit escaped text encoder by na_th_an
' Copyleft 2025 by the Mojon Twins
'
' Doc in .bas file

Declare Function encode5BitEsc (text As String, wrap As Integer) As String
Declare Sub prettyPrintEncodedString (encoded As String)
Declare Function decodeBin (mainBin () As uByte, offset As Integer) As String
