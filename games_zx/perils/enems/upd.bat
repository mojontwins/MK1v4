@echo off 

if [%1]==[] goto help

:do
@copy ..\gfx\mappy%1.png mappy.png
@copy ..\map\mapa.MAP
goto :done

:help
echo upd.exe N, con N = 0, 1, 2

:done
