@echo off

set game=ninjajarll

echo Making %game%

if [%1]==[justcompile] goto :compile

rem Multilevel: no map (left empty) and empty enems with space for the biggest level
..\utils\ene2h.exe empty=10,2,3 enems.h compacted 2bytes  > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars greyordered in=..\gfx\font.png out=font.bin silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work0.png out=work0.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work1.png out=work1.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 greyordered in=..\gfx\work2.png out=work2.bin silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=16 pixelperfectm0 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\ss0.png out=ss0.bin max=8 pixelperfectm0 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\ss1.png out=ss1.bin max=8 pixelperfectm0 silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=2,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul

..\utils\genempty.exe work.bin 3072

echo Compressing graphics

..\utils\zx0.exe work0.bin work0c.bin > nul
..\utils\zx0.exe work1.bin work1c.bin > nul
..\utils\zx0.exe work2.bin work2c.bin > nul

..\utils\zx0.exe ss0.bin ss0c.bin > nul
..\utils\zx0.exe ss1.bin ss1c.bin > nul

..\utils\zx0.exe title.bin titlec.bin > nul
..\utils\zx0.exe marco.bin marcoc.bin > nul
..\utils\zx0.exe ending.bin endingc.bin > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 cpc > nul

rem map data
..\utils\rle44map_sp.exe in=..\map\level0.map out=mapa0.bin size=10,2 scrsize=15,10 tlock=99 fixmappy > nul
..\utils\rle44map_sp.exe in=..\map\level1.map out=mapa1.bin size=10,2 scrsize=15,10 tlock=99 fixmappy > nul
..\utils\rle44map_sp.exe in=..\map\level2.map out=mapa2.bin size=12,1 scrsize=15,10 tlock=99  > nul

rem enems_data
..\utils\ene2bin_mk1v4.exe ..\enems\level0orig.ene enems_hotspots0.bin 2bytes compacted > nul
..\utils\ene2bin_mk1v4.exe ..\enems\level1orig.ene enems_hotspots1.bin 2bytes compacted > nul
..\utils\ene2bin_mk1v4.exe ..\enems\level2orig.ene enems_hotspots2.bin 2bytes compacted > nul

..\utils\zx0.exe enems_hotspots0.bin enems_hotspots0c.bin > nul
..\utils\zx0.exe enems_hotspots1.bin enems_hotspots1c.bin > nul
..\utils\zx0.exe enems_hotspots2.bin enems_hotspots2c.bin > nul

:compile

rem luts
..\utils\pasmo.exe system\cpc_TrPixLutM0.asm trpixlut.bin
del trpixlutc.bin > nul 2> nul
..\utils\zx0.exe trpixlut.bin trpixlutc.bin > nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm wyz\instrumentos.h

zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.bin system\tilemap_conf.asm churromain.c > nul
zcc +cpc -a -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.asm system\tilemap_conf.asm churromain.c > nul
if %errorlevel% neq 0 goto :error

..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal_loading.png mode=scr in=..\gfx\loading.png out=loading.bin silent > nul
del loading.c.bin >nul 2>nul
del %game%.c.bin >nul 2>nul
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

if [%1]==[noclean] goto :end 
if [%2]==[noclean] goto :end 

del *.bin >nul
goto :end 

:error
echo ERROR

:end
