@echo off

set game=helmet

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 8 8 15 10 15 packed  > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin 7 > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul
..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 20 extra  > nul
..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 2 > nul
..\utils\sprcnvbin8.exe ..\gfx\sprite_alarm.png sprite_alarm.bin 1 > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn -O3 churromain.c -o %game%.bin -lsplib2f -zorg=24200 -DDEMO -DENABLE_CHEAT > nul
..\utils\printsize.exe %game%.bin

rem ..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
rem ..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
rem ..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

del tape\scrc.bin > nul
..\utils\zx7.exe loading.bin tape\scrc.bin
del tape\gamec.bin > nul
..\utils\zx7.exe %game%.bin tape\gamec.bin

..\utils\imanol.exe ^
    in=tape\loaderzx48_zx7.asm-orig ^
    out=tape\loader.asm ^
    loadingcomplength=?tape\scrc.bin ^
    mainbincomplength=?tape\gamec.bin

..\utils\pasmo.exe tape\loader.asm tape\loader.bin tape\loader.txt

..\utils\GenTape.exe %game%.tap ^
    basic 'S.HELMET_2' 10 .\tape\loader.bin ^
    data              .\tape\scrc.bin ^
    data              .\tape\gamec.bin

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
