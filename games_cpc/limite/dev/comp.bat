@echo off

set game=limite

echo Making %game%
rem ..\utils\mapcnv.exe ..\map\mapa.map mapa.h 6 5 15 10 15 packed  > nul
..\utils\rle53map_sp in=..\map\mapa.map out=mapa.bin size=6,5 scrsize=15,10 tlock=99 mk1h=mapa.h > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars greyordered in=..\gfx\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=16 pixelperfectm0 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
..\utils\apack.exe title.bin titlec.bin > nul
..\utils\apack.exe marco.bin marcoc.bin > nul
..\utils\apack.exe ending.bin endingc.bin > nul

echo Making script
..\utils\msc.exe ..\script\script.spt msc.h 30 cpc > nul

rem luts
..\utils\pasmo.exe system\cpc_TrPixLutM0.asm trpixlut.bin
..\utils\apack.exe trpixlut.bin trpixlutc.bin > nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm wyz\instrumentos.h

zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.bin system\tilemap_conf.asm churromain.c > nul
rem zcc +cpc -a -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.asm system\tilemap_conf.asm churromain.c > nul

..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal_loading.png mode=scr in=..\gfx\loading.png out=loading.bin silent > nul
..\utils\zx7.exe loading.bin loading.c.bin > nul
..\utils\zx7.exe %game%.bin %game%.c.bin > nul

..\utils\imanol.exe in=system\loadercpc.asm-orig out=system\loadercpc.asm ^
	scrc_size=?loading.c.bin ^
	mainbin_size=?%game%.c.bin ^
	loading_palette=!..\gfx\pal_loading.png ^
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

del *.bin >nul
