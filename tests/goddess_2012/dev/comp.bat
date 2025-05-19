@echo off

set game=goddess
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
del title.bin >nul
..\utils\zx0 title.scr title.bin
del marco.bin >nul
..\utils\zx0 marco.scr marco.bin
del ending.bin >nul
..\utils\zx0 ending.scr ending.bin
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes

:compile
..\utils\msc ..\script\script.spt msc.h 24
zcc +zx -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200

..\utils\printsize.exe %game%.bin

..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.scr  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

del *.scr > nul 2> nul

if [%1]==[noclean] goto :end
if [%2]==[noclean] goto :end
del *.bin > nul 2> nul

:end
