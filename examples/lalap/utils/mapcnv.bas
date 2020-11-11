' Map converter
' Cutrecode by na_th_an

' Estos programas son tela de optimizables, pero me da igual porque tengo un dual core.
' ¡OLE!

Sub WarningMessage ()
	Print "** WARNING **"
	Print "   MapCnv convierte un archivo raw de mappy (mapa.map, por ejemplo)"
	Print "   a un array directamente usable por los juegos de la MTE MK1."
	Print "   Si metes mal los parámetros ocurrirán cosas divertidas."
	Print
End Sub

sub usage () 
	Print "** USO **"
	Print "   MapCnv mapa.map mapa.h ancho_mapa alto_mapa ancho_pantalla alto_pantalla tile_cerrojo packed"
	Print
	Print "   - archivo.map : Archivo de entrada exportado con mappy en formato raw."
	Print "   - ancho_mapa : Ancho del mapa en pantallas."
	Print "   - alto_mapa : Alto del mapa en pantallas."
	Print "   - ancho_pantalla : Ancho de la pantalla en tiles."
	Print "   - alto_pantalla : Alto de la pantalla en tiles."
	Print "   - tile_cerrojo : # del tile que representa el cerrojo."
	Print "   - packed : mapas de la MTE MK1 de 16 tiles."
	Print
	Print "Si el mapa es 'packed' y se encuentra un tile > 15 se hace mod 16."
	Print
	Print "Por ejemplo, para un mapa de 6x5 pantallas para la MTE MK1:"
	Print
	Print "   MapCnv mapa.map 6 5 15 10 15 packed"
end sub

Dim As Integer map_w, map_h, scr_w, scr_h, bolt
Dim As Integer x, y, xx, yy, i, j, f, packed, ac, ct
Dim As Byte d
Dim As String o

Type MyBolt
	np As Integer
	x As Integer
	y As Integer
End Type

Dim As MyBolt Bolts (100)

Print "Mapcnv v2.0 20201022a (fix) (2 sets native)"

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
		If packed <> 0 And d > 15 And d < 64 Then d = d And 15
		BigOrigMap (y, x) = d
	Next x
Next y

close f

' Construimos el nuevo mapa mientras rellenamos el array de cerrojos

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
	Print "Se escribió mapa.h con " + trim(str(map_h*map_w)) + " pantallas (" + trim(str(map_h*map_w*scr_h*scr_w)) + " bytes)."
else
	Print "Se escribió mapa.h con " + trim(str(map_h*map_w)) + " pantallas empaquetadas (" + trim(str(map_h*map_w*scr_h*scr_w / 2)) + " bytes)."
end if
Print "Se encontraron " + trim(str(i)) + " cerrojos."
print " "
end
