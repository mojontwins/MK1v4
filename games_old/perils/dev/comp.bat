@echo off

set game=lala3
set om=cpc
set mode=1

echo Making %game%

if [%1]==[justcompile] goto :compile

..\utils\mapcnv.exe ..\map\mapa.map mapa.h 4 6 15 10 15 packed  > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul

if [%om%]==[cpc] goto :cpc

..\utils\ts2bin.exe ..\gfx\%om%\font.png ..\gfx\%om%\work.png tileset.bin 7 > nul
..\utils\sprcnv.exe ..\gfx\%om%\sprites.png speccy\sprites.h  > nul
..\utils\png2scr.exe ..\gfx\%om%\title.png ..\gfx\%om%\title.scr  > nul
..\utils\png2scr.exe ..\gfx\%om%\marco.png ..\gfx\%om%\marco.scr  > nul
..\utils\png2scr.exe ..\gfx\%om%\ending.png ..\gfx\%om%\ending.scr  > nul
..\utils\png2scr.exe ..\gfx\%om%\loading.png loading.bin  > nul
..\utils\zx0.exe ..\gfx\%om%\title.scr titlec.bin  > nul
..\utils\zx0.exe ..\gfx\%om%\marco.scr marcoc.bin  > nul
..\utils\zx0.exe ..\gfx\%om%\ending.scr endingc.bin  > nul
goto :compile

:cpc 
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=chars greyordered in=..\gfx\%om%\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=strait2x2 greyordered in=..\gfx\%om%\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=sprites in=..\gfx\%om%\sprites.png out=sprites.bin mappings=%om%\spriteset_mappings.h max=16 pixelperfectm%mode% silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=sprites in=..\gfx\%om%\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=sprites in=..\gfx\%om%\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=sprites in=..\gfx\%om%\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=palsasassembly in=..\gfx\%om%\pal.png prefix=inks0 out=%om%\pal0.h silent > nul 
..\utils\mkts_om.exe platform=cpc mode=palsasassembly in=..\gfx\%om%\pal_hud.png prefix=pal_hud out=%om%\pal_hud.h silent > nul
..\utils\mkts_om.exe platform=cpc mode=palsasassembly in=..\gfx\%om%\pal_general.png prefix=pal_general out=%om%\pal_general.h silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=superbuffer in=..\gfx\%om%\marco.png out=marco.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=superbuffer in=..\gfx\%om%\ending.png out=ending.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal.png mode=superbuffer in=..\gfx\%om%\title.png out=title.bin silent > nul
..\utils\zx0.exe title.bin titlec.bin > nul
..\utils\zx0.exe marco.bin marcoc.bin > nul
..\utils\zx0.exe ending.bin endingc.bin > nul

:compile 

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

if [%om%]==[cpc] goto :cpc

zcc +zx -m -vn churromain.c -o %game%.bin -lsplib2 -zorg=24200  > nul
zcc +zx -a -vn churromain.c -o %game%.asm -lsplib2 -zorg=24200  > nul
if %errorlevel% neq 0 goto :error

..\utils\printsize.exe %game%.bin
..\utils\bas2tap.exe -q -e -a10 -s"%game%" system/loader.bas %game%.tap  > nul
..\utils\bin2tap.exe -o %game%.tap -a 32768 -append loading.bin  > nul
..\utils\bin2tap.exe -o %game%.tap -a 24200 -append %game%.bin  > nul

echo Output: %game%.tap

goto :noerror

:cpc
..\utils\pasmo.exe system\cpc_TrPixLutM%mode%.asm trpixlut.bin
..\utils\zx0.exe trpixlut.bin trpixlutc.bin > nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm wyz\instrumentos.h

zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.bin system\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
zcc +cpc -a -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.asm system\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
if %errorlevel% neq 0 goto :error

..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\%om%\pal_loading.png mode=scr in=..\gfx\%om%\loading.png out=loading.bin silent > nul
..\utils\zx7.exe loading.bin loading.c.bin > nul
..\utils\zx7.exe %game%.bin %game%.c.bin > nul

..\utils\imanol.exe in=system\loadercpc.asm-orig out=system\loadercpc.asm ^
	scrc_size=?loading.c.bin ^
	mainbin_size=?%game%.c.bin ^
	loading_palette=!..\gfx\%om%\pal_loading.png ^
	loader_mode=0 > nul
..\utils\pasmo.exe system\loadercpc.asm loader.bin  > nul

..\utils\imanol.exe in=system\preloadercpc.asm-orig out=system\preloadercpc.asm ^
	loader_size=?loader.bin ^
	loader_mode=0 > nul
..\utils\pasmo.exe system\preloadercpc.asm preloader.bin  > nul

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

del ..\gfx\%om%\*.scr > nul 2> nul
del *.bin >nul

:end
