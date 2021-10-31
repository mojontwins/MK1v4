@echo off

set game=ramiro3v3

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 7 4 15 10 15 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 24 extra > nul
..\utils\sprcnvbin8.exe ..\gfx\sprites_jumo.png sprite_jumo.bin 1 > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

echo Making music
cd ..\ogt
..\utils\pasmo WYZproPlay47aZXc.ASM ..\dev\RAM1.bin RAM1.map > nul
cd ..\dev
..\utils\printsize.exe RAM1.bin

echo Making script
..\utils\msc.exe ..\script\script.spt msc.h 28 flipflops > nul

zcc +zx -vn -m churromain.c -o %game%.bin -lsplib2f -zorg=24200  > nul
..\utils\printsize.exe %game%.bin

..\utils\imanol.exe ^
    in=loader_128.asm-orig ^
    out=loader.asm ^
    ram1_length=?RAM1.bin ^
    mb_length=?%game%.bin  > nul

..\utils\pasmo.exe loader.asm loader.bin

..\..\..\src\utils\GenTape.exe %game%.tap ^
    basic '%game%' 10 loader.bin ^
    data              loading.bin ^
    data              %game%.bin ^
    data              RAM1.bin > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
