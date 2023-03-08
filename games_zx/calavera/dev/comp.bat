@echo off

set game=calavera

echo Making %game%
rem ..\utils\mapcnv.exe ..\map\mapa.map mapa.h 10 6 15 10 15 > nul
..\utils\rle62map_sp.exe in=..\map\mapa.MAP out=mapa.h size=10,6 tlock=99 scrsize=15,10 mk1h=mapa.h nodecos > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png tileset.bin inverted:0 > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work.png ts_attr_0.bin inverted:0 onlyattrs > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work1.png ts_attr_1.bin inverted:0 onlyattrs > nul
..\utils\ts2bin.exe ..\gfx\font.png ..\gfx\work2.png ts_attr_2.bin inverted:0 onlyattrs > nul
..\utils\apack.exe ts_attr_0.bin ts_attr_0c.bin > nul
..\utils\apack.exe ts_attr_1.bin ts_attr_1c.bin > nul
..\utils\apack.exe ts_attr_2.bin ts_attr_2c.bin > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes dsall compacted > nul
..\utils\sprcnv2.exe ..\gfx\sprites.png sprites.h 23 extra nomask > nul
rem ..\utils\sprcnvbin8.exe ..\gfx\sprite_sword.png sprite_sword.bin 4 > nul
..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr  > nul
..\utils\png2scr.exe ..\gfx\marco.png ..\gfx\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\ending.png ..\gfx\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\loading.png loading.bin  > nul
..\utils\apack.exe ..\gfx\title.scr title.bin  > nul
..\utils\apack.exe ..\gfx\marco.scr marco.bin  > nul
..\utils\apack.exe ..\gfx\ending.scr ending.bin  > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

zcc +zx -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200  > nul
..\utils\printsize.exe %game%.bin
..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

del ..\gfx\*.scr > nul
del *.bin >nul
