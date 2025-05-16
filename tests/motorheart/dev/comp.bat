set game=motorheart
@echo off

..\utils\mapcnv ..\map\mapa.map 6 5 15 10 15 packed  
..\utils\ts2bin ..\gfx\font.png ..\gfx\work.png ts.bin 5
..\utils\sprcnv ..\gfx\sprites.png sprites.h
..\utils\png2scr ..\gfx\title.png title.scr
..\utils\png2scr ..\gfx\marco.png marco.scr
..\utils\png2scr ..\gfx\ending.png ending.scr
..\utils\png2scr ..\gfx\loading.png loading.scr
..\utils\apack title.scr title.bin
..\utils\apack marco.scr marco.bin
..\utils\apack ending.scr ending.bin
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes

zcc +zx -vn churromain.c -o %game%.bin -lsplib2 -zorg=25000

..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.scr  > nul
..\utils\bin2tap.exe -o %game%.tap -a 25000 -append %game%.bin  > nul

del *.scr > nul 2> nul
del *.bin > nul 2> nul
