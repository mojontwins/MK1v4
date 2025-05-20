@echo off

set game=goddess
set om=cpc
set mode=0

if [%1]==[justcompile] goto :compile

..\utils\mapcnv.exe ..\map\mapa.map mapa.h 8 3 15 10 99 packed  
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes

if [%om%]==[cpc] goto :cpc

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
goto :compile

:cpc
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=chars greyordered in=..\gfx\cpc\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=strait2x2 greyordered in=..\gfx\cpc\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites.png out=sprites.bin max=16 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=palsasassembly in=..\gfx\cpc\pal.png prefix=my_inks out=churrera_cpc\pal.h silent > nul 

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\marco.png out=marco.scr silent
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\ending.png out=ending.scr silent
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\title.png out=title.scr silent
..\utils\zx0.exe title.scr.bin title.bin > nul
..\utils\zx0.exe marco.scr.bin marco.bin > nul
..\utils\zx0.exe ending.scr.bin ending.bin > nul


:compile
..\utils\msc ..\script\script.spt msc.h 24

if [%om%]==[cpc] goto :cpc

zcc +zx -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200
if %errorlevel% neq 0 goto :error
..\utils\printsize.exe %game%.bin

..\utils\bas2tap.exe -q -e -a10 -s"%game%" loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.scr  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

del *.scr > nul 2> nul
goto :noerror

:cpc
..\utils\pasmo.exe churrera_cpc\cpc_TrPixLutM%mode%.asm trpixlut.bin
..\utils\zx0.exe trpixlut.bin trpixlutc.bin > nul 2> nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm churrera_cpc\instrumentos.h

zcc +cpc -a -vn -unsigned -zorg=1024 -lcpcrslib_mt -o %game%.asm churrera_cpc\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib_mt -o %game%.bin churrera_cpc\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
if %errorlevel% neq 0 goto :error
..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal_loading.png mode=scr in=..\gfx\%om%\loading.png out=loading.bin silent > nul
..\utils\zx7.exe loading.bin loading.c.bin > nul
..\utils\zx7.exe %game%.bin %game%.c.bin > nul

..\utils\imanol.exe in=churrera_cpc\loadercpc.asm-orig out=churrera_cpc\loadercpc.asm ^
	scrc_size=?loading.c.bin ^
	mainbin_size=?%game%.c.bin ^
	loading_palette=!..\gfx\%om%\pal_loading.png ^
	loader_mode=0 > nul
..\utils\pasmo.exe churrera_cpc\loadercpc.asm loader.bin  > nul

..\utils\imanol.exe in=churrera_cpc\preloadercpc.asm-orig out=churrera_cpc\preloadercpc.asm ^
	loader_size=?loader.bin ^
	loader_mode=0 > nul
..\utils\pasmo.exe churrera_cpc\preloadercpc.asm preloader.bin  > nul

del %game%.cdt > nul
..\utils\cpc2cdt.exe -r %game% -m cpc -l 1024 -x 1024 -p 2000 preloader.bin %game%.cdt > nul
..\utils\cpc2cdt.exe -r LOADER -m raw1full -rl 740 -p 2000 loader.bin %game%.cdt > nul
..\utils\cpc2cdt.exe -r SCR -m raw1full -rl 740 -p 2000 loading.c.bin %game%.cdt > nul
..\utils\cpc2cdt.exe -r MAIN -m raw1full -rl 740 -p 2000 %game%.c.bin %game%.cdt > nul
echo Output: %game%.cdt

goto :noerror

:error
echo ERROR

:noerror

if [%1]==[noclean] goto :end
if [%2]==[noclean] goto :end
del *.bin > nul 2> nul

:end
