@echo off

set game=bosquee

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 5 5 15 10 15  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv.exe ..\gfx\sprites.png sprites.h > nul
..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 4 > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\png2scr.exe ..\gfx\preloading.png preloading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn churromain.c -o %game%.bin -lsplib2f -zorg=24200  > nul
..\utils\printsize.exe %game%.bin

echo Preparing tape 
del loadingc.bin > nul 2> nul
..\utils\zx7 loading.bin loadingc.bin > nul
del preloadingc.bin > nul 2> nul
..\utils\zx7 preloading.bin preloadingc.bin > nul
del gamec.bin > nul 2> nul 
..\utils\zx7 %game%.bin gamec.bin > nul 

..\utils\imanol.exe ^
    in=loader_48.asm-orig ^
    out=loader.asm ^
    preloadingcomplength=?preloadingc.bin ^
    loadingcomplength=?loadingc.bin ^
    mainbincomplength=?gamec.bin > nul

..\utils\pasmo.exe loader.asm loader.bin > nul

..\utils\GenTape.exe %game%.tap ^
    basic 'BOSQUE' 10 loader.bin ^
    data              preloadingc.bin ^
    data              loadingc.bin ^
    data              gamec.bin > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
