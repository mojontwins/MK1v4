@echo off

set game=perils
set lang=ES

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 12 8 15 10 15 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes dsall CMD=S,15,Y2,0 > nul
..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 18 extra > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\zx0.exe ..\gfx\title.scr title.bin  > nul
..\utils\zx0.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\zx0.exe ..\gfx\ending.scr ending.bin  > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn -m churromain.c -o %game%.bin -lsplib2f -zorg=24200 -DLANG_%lang% > nul
..\utils\printsize.exe %game%.bin

..\utils\imanol.exe ^
    in=loader_128.asm-orig ^
    out=loader.asm ^
    ram1_length=?..\ogt\RAM1.bin ^
    mb_length=?%game%.bin > nul

..\utils\pasmo.exe loader.asm loader.bin

..\..\..\src\utils\GenTape.exe %game%_%lang%.tap ^
    basic 'PERILS' 10 loader.bin ^
    data              loading.bin ^
    data              %game%.bin ^
    data              ..\ogt\RAM1.bin > nul

echo Output: %game%_%lang%.tap

del ..\gfx\*.scr > nul
del loader.asm > nul
del *.bin >nul
