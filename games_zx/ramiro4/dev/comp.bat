@echo off

set game=ramiro4

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 6 6 15 10 99 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 23 extra > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\zx0.exe ..\gfx\title.scr title.bin  > nul
..\utils\zx0.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\zx0.exe ..\gfx\ending.scr ending.bin  > nul

echo Making script
..\utils\msc.exe ..\script\script.spt msc.h 36 flipflops shortsettile > nul

echo Making fullery
..\utils\pasmo.exe ..\ogt\buzz.asm buzz.bin
..\utils\zx0.exe buzz.bin buzzc.bin

..\utils\ts2bin.exe font.png ..\gfx\work.png attrs1.bin -1 onlyattrs
..\utils\ts2bin.exe font.png ..\gfx\work_color.png attrs2.bin -1 onlyattrs
..\utils\zx0.exe attrs1.bin attrs1c.bin
..\utils\zx0.exe attrs2.bin attrs2c.bin

zcc +zx -vn churromain.c -m -o %game%.bin -lsplib2f -zorg=24150 -DLANG_ES  > nul
..\utils\printsize.exe %game%.bin

..\utils\imanol.exe ^
    in=loader_128.asm-orig ^
    out=loader.asm ^
    ram1_length=?..\ogt\RAM1.bin ^
    mb_length=?%game%.bin  > nul

..\utils\pasmo.exe loader.asm loader.bin

..\..\..\src\utils\GenTape.exe %game%.tap ^
    basic '%game%' 10 loader.bin ^
    data              loading.bin ^
    data              %game%.bin ^
    data              ..\ogt\RAM1.bin > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del loader.asm > nul
del *.bin >nul
