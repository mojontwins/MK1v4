@echo off

set game=hobbit

echo Making %game%
..\utils\rle53map_sp.exe in=..\map\mapa.map out=mapa.bin size=7,5 scrsize=15,10 tlock=15 mk1h=mapa.h  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h > nul
..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 4 > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn churromain.c -o %game%.bin -lsplib2f -zorg=24200  > nul
..\utils\printsize.exe %game%.bin
..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
