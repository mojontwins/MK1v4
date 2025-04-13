@echo off

set game=lala3

echo Making %game%

if [%1]==[justcompile] goto :compile

..\utils\mapcnv.exe ..\map\mapa.map mapa.h 6 5 15 10 15 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h  > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\zx0.exe ..\gfx\title.scr titlec.bin  > nul
..\utils\zx0.exe ..\gfx\marco.scr marcoc.bin  > nul
..\utils\zx0.exe ..\gfx\ending.scr endingc.bin  > nul

:compile 

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -m -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200  > nul
zcc +zx -a -vn churromain.c -o %game%.asm -lsplib2 -zorg=24200  > nul
if %errorlevel% neq 0 goto :error

..\utils\printsize.exe %game%.bin
..\utils\bas2tap.exe -q -e -a10 -s"%game%" system/loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

:error
echo ERROR

if [%1]==[noclean] goto :end 
if [%2]==[noclean] goto :end 

del ..\gfx\*.scr > nul
del *.bin >nul
goto :end 

:end
