' Map withverter
' Cutrecode by na_th_an

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

sub usage () 
	Print "** USO **"
	Print "   MapCnv mapa.map mapa.h map_w map_h scr_w scr_h t_lock [packed] [fixmappy]"
	Print
	Print "   - mapa.map : Input filename from Mappy in .MAP format (raw)"
	Print "   - mapa.h   : Output filname"
	Print "   - map_w    : Map width in rooms."
	Print "   - map_h    : Map height in rooms."
	Print "   - scr_w    : Room width in tiles."
	Print "   - scr_h    : Room height in tiles."
	Print "   - tlock    : Tile number for locks (use out of bounds to ignore)."
	Print "   - packed   : MTE MK1 packed maps."
	Print	
	Print "If `fixmappy` is on, tile t is read as `t - 1`, then ..."
	Print "If `packed` is on and a tile t > 15 is found, `t mod 16` is read instead."
	
end sub

Dim As Integer map_w, map_h, scr_w, scr_h, bolt
Dim As Integer x, y, xx, yy, i, j, f, packed, ac, ct, fixmappy
Dim As Byte d
Dim As String o

Type MyBolt
	np As Integer
	x As Integer
	y As Integer
End Type

Dim As MyBolt Bolts (100)

fixmappy = inCommand ("fixmappy")

Print "Mapcnv v2.1 20210527a (fix) (2 sets native)"
If fixmappy Then Print "Correcting mappy offset (-1 to all bytes read)"

if 	Command (7) = "" Then
	usage ()
	end
End If

map_w = Val (Command (3))
map_h = Val (Command (4))
scr_w = Val (Command (5))
scr_h = Val (Command (6))
bolt = Val (Command (7))

if lcase(Command (8)) = "packed" then
	print lcase(command(8))
	packed = 1
else
	packed = 0
end if

Dim As Integer BigOrigMap (map_h * scr_h - 1, map_w * scr_w - 1)

' Leemos el mapa original

f = FreeFile
Open Command (1) for binary as #f

For y = 0 To (map_h * scr_h - 1)
	For x = 0 To (map_w * scr_w - 1)
		get #f , , d
		If fixmappy Then d = d - 1
		If packed <> 0 And d > 15 And d < 64 Then d = d And 15
		BigOrigMap (y, x) = d
	Next x
Next y

close f

' withstruimos el nuevo mapa mientras rellenamos el array de cerrojos

open Command (2) for output as #f

print #f, "// Mapa.h "
print #f, "// Generado por MapCnv de la MTE MK1"
print #f, "// Copyleft 2010 The Mojon Twins"
print #f, " "

print #f, "unsigned char mapa [] = {"

i = 0

for yy = 0 To map_h - 1
	for xx = 0 To map_w - 1
		o = "    "
		ac = 0
		ct = 0
		for y = 0 to scr_h - 1
			for x = 0 to scr_w - 1
				
				if BigOrigMap (yy * scr_h + y, xx * scr_w + x) = bolt then
					Bolts (i).x = x
					Bolts (i).y = y
					Bolts (i).np = yy * map_w + xx
					i = i + 1
				end if
				
				if packed = 0 then
					o = o + "0x" + Hex (BigOrigMap (yy * scr_h + y, xx * scr_w + x), 2)
					if yy < map_h - 1 Or xx < map_w - 1 Or y < scr_h -1 Or x < scr_w -1 then
						o = o + ", "
					end if
				else
					if ct = 0 then
						ac = BigOrigMap (yy * scr_h + y, xx * scr_w + x) * 16
					else
						ac = ac + BigOrigMap (yy * scr_h + y, xx * scr_w + x) 
						o = o + "0x" + Hex (ac, 2)
						
						if yy < map_h - 1 Or xx < map_w - 1 Or y < scr_h - 1 Or x < scr_w - 1 then
							o = o + ", "
						end if
					end if
					ct = 1 - ct
				end if
				
			next x
		next y		
		print #f, o
	next xx
	if yy < map_h - 1 then print #f, "    "
next yy
print #f, "};"

print #f, " "

' Escribimos el array de cerrojos
print #f, "#define MAX_CERROJOS " + trim(str(i))
print #f, " "
print #f, "typedef struct {"
print #f, "    unsigned char np, x, y, st;"
print #f, "} CERROJOS;"
print #f, " "
if i > 0 Then
	print #f, "CERROJOS cerrojos [MAX_CERROJOS] = {"
	
	for j = 0 to i - 1
		o = "    {" + trim(str(bolts(j).np)) + ", " + trim(str(bolts(j).x)) + ", " + trim(str(bolts(j).y)) + ", 0}"
		if j < i - 1 then o = o + ","
		print #f, o
	next j
	
	print #f, "};"
else
	print #f, "CERROJOS *cerrojos;"
end if
print #f, " "
close f

if packed = 0 then 
	Print "Wrote mapa.h with " + trim(str(map_h*map_w)) + " rooms (" + trim(str(map_h*map_w*scr_h*scr_w)) + " bytes)."
else
	Print "Wrote mapa.h with " + trim(str(map_h*map_w)) + " packed rooms (" + trim(str(map_h*map_w*scr_h*scr_w / 2)) + " bytes)."
end if
Print trim(str(i)) + " locks found."
print " "
end
