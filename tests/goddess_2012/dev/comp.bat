@echo off

set game=goddess2012
set om=speccy
set mode=0

if [%1]==[justcompile] goto :compile

..\utils\rle44map_sp.exe in=..\map\mapa.map out=mapa.bin size=8,3 scrsize=15,10 tlock=15 mk1h=mapa.h mk1locks fixmappy > nul
..\utils\ts2bin ..\gfx\speccy\font.png ..\gfx\speccy\work.png ts.bin 7
..\utils\sprcnv ..\gfx\speccy\sprites.png sprites.h
..\utils\png2scr ..\gfx\speccy\title.png title.scr
..\utils\png2scr ..\gfx\speccy\marco.png marco.scr
..\utils\png2scr ..\gfx\speccy\ending.png ending.scr
..\utils\png2scr ..\gfx\speccy\loading.png loading.scr
..\utils\zx0 title.scr title.bin
..\utils\zx0 marco.scr marco.bin
..\utils\zx0 ending.scr ending.bin
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes
..\utils\msc ..\script\script.spt msc.h 24

zcc +zx -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200

..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.scr  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

del *.scr > nul 2> nul
del *.bin > nul 2> nul
