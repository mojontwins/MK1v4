@echo off

rem Cambia "%game%" por el nombre de tu güego.
set game=bootee

if [%1]==[justcompile] goto :compile

echo ### CONVIRTIENDO COSAS QUE HAY QUE CONVERTIR ###
..\utils\mapcnv ..\map\mapa.map mapa.h 6 5 15 10 15 packed > nul 2> nul
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes > nul 2> nul

..\utils\ts2bin ..\gfx\speccy\font.png ..\gfx\speccy\work.png ts.bin 7 > nul 2> nul
..\utils\sprcnv ..\gfx\speccy\sprites.png speccy\sprites.h > nul 2> nul
..\utils\png2scr ..\gfx\speccy\title.png title.scr > nul 2> nul
..\utils\png2scr ..\gfx\speccy\marco.png marco.scr > nul 2> nul
..\utils\png2scr ..\gfx\speccy\ending.png ending.scr > nul 2> nul
..\utils\png2scr ..\gfx\speccy\loading.png loading.scr > nul 2> nul

del title.bin  > nul 2> nul
..\utils\zx0 title.scr title.bin  > nul 2> nul
del marco.bin  > nul 2> nul
..\utils\zx0 marco.scr marco.bin  > nul 2> nul
del ending.bin  > nul 2> nul
..\utils\zx0 ending.scr ending.bin  > nul 2> nul

:compile
echo ### COMPILANDO SCRIPT ###
rem no olvides cambiar NPANT por el nº de pantallas
rem ..\utils\msc ..\script\script.spt msc.h 30

echo ### COMPILANDO GUEGO ###
zcc +zx -a -vn churromain.c -o %game%.asm -lsplib2 -zorg=24200  > nul 2> nul
zcc +zx -m -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200  > nul
if %errorlevel% neq 0 goto :error
..\utils\printsize.exe %game%.bin

echo ### CONSTRUYENDO CINTA ###
rem cambia LOADER por el nombre que quieres que salga en Program:
..\utils\bas2tap -a10 -sBOOTEE speccy\loader.bas loader.tap  > nul 2> nul
..\utils\bin2tap -o screen.tap -a 16384 loading.scr  > nul 2> nul
..\utils\bin2tap -o main.tap -a 24200 %game%.bin  > nul 2> nul
copy /b loader.tap + screen.tap + main.tap %game%.tap  > nul 2> nul
goto :noerror

:error
echo ERROR

:noerror

if [%1]==[noclean] goto :end
if [%2]==[noclean] goto :end

echo ### LIMPIANDO ###

del loader.tap > nul 2> nul
del screen.tap > nul 2> nul
del main.tap > nul 2> nul
del *.scr > nul 2> nul
del *.bin > nul 2> nul
del %game%.bin > nul 2> nul

:end
echo ### DONE ###
