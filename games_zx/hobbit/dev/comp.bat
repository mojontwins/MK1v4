@echo off

set game=hobbit
set lang=ES

echo Making %game%
..\utils\rle53map_sp.exe in=..\map\mapa.map out=mapa.bin size=7,5 scrsize=15,10 tlock=15 mk1h=mapa.h  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h > nul
..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 4 > nul
..\utils\png2scr.exe ..\gfx\title%lang%.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\preloading.png preloading.bin  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

echo Making music
cd ..\ogt
..\utils\pasmo WYZproPlay47aZXc.ASM ..\dev\RAM1.bin RAM1.map > nul
cd ..\dev
..\utils\printsize.exe RAM1.bin

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn churromain.c -o %game%.bin -lsplib2f -zorg=24200 -DLANG_%lang% > nul
..\utils\printsize.exe %game%.bin

echo Preparing tape 
del preloadingc.bin > nul 2> nul
..\utils\zx7 preloading.bin preloadingc.bin > nul
del loadingc.bin > nul 2> nul
..\utils\zx7 loading.bin loadingc.bin > nul
del gamec.bin > nul 2> nul 
..\utils\zx7 %game%.bin gamec.bin > nul 

..\utils\imanol.exe ^
    in=loader_128.asm-orig ^
    out=loader.asm ^
    ram1_length=?RAM1.bin ^
    preloadingcomplength=?preloadingc.bin ^
    loadingcomplength=?loadingc.bin ^
    mainbincomplength=?gamec.bin > nul

echo Output: %game%_%lang%.tap

..\utils\pasmo.exe loader.asm loader.bin

..\utils\GenTape.exe %game%_%lang%.tap ^
    basic 'HOBBIT' 10 loader.bin ^
    data              preloadingc.bin ^
    data              loadingc.bin ^
    data              gamec.bin ^
    data              RAM1.bin > nul

del ..\gfx\*.scr > nul
del *.bin >nul