@echo off

set game=ramiro3v1

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 6 4 15 10 15 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h  > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

echo Making script
..\utils\msc.exe ..\script\script.spt msc.h 24 flipflops > nul

zcc +zx -vn -m churromain.c -o %game%.bin -lsplib2 -zorg=24200  > nul
..\utils\printsize.exe %game%.bin
..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
