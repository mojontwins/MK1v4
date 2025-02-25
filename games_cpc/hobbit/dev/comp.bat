@echo off

set game=nomos
set lang=ES

echo Making %game%

if [%1]==[justcompile] goto :compile

..\utils\rle53map_sp.exe in=..\map\mapa.map out=mapa.bin size=7,6 scrsize=15,10 tlock=99 mk1h=mapa.h  > nul

..\utils\ene2h.exe ..\enems\enems.ene enems.h compacted 2bytes marrullers  > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars greyordered in=..\gfx\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars greyordered in=..\gfx\poketiles.png out=poketiles.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=17 pixelperfectm0 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\pokemon.png out=pokemon.bin silent > nul
..\utils\zx0.exe title.bin titlec.bin > nul
..\utils\zx0.exe ending.bin endingc.bin > nul
..\utils\zx0.exe work.bin tilesetc.bin > nul
..\utils\zx0.exe pokemon.bin pokemonc.bin > nul
..\utils\zx0.exe poketiles.bin poketilesc.bin > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 cpc > nul

:compile

rem luts
..\utils\pasmo.exe system\cpc_TrPixLutM0.asm trpixlut.bin
del trpixlutc.bin > nul 2> nul
..\utils\zx0.exe trpixlut.bin trpixlutc.bin > nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm wyz\instrumentos.h

zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib_fg -o %game%.bin system\tilemap_conf.asm churromain.c -DLANG_%lang% > nul
rem zcc +cpc -a -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.asm system\tilemap_conf.asm churromain.c -DLANG_%lang% > nul

..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal_loading.png mode=scr in=..\gfx\loading.png out=loading.bin silent > nul
del loading.c.bin > nul
..\utils\zx7.exe loading.bin loading.c.bin > nul
del %game%.c.bin > nul
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

if [%1]==[noclean] goto :end 
if [%2]==[noclean] goto :end 

del *.bin >nul

:end