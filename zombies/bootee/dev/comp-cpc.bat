@echo off

rem Cambia "%game%" por el nombre de tu güego.
set game=bootee
set mode=0

if [%1]==[justcompile] goto :compile

echo ### CONVIRTIENDO COSAS QUE HAY QUE CONVERTIR ###
..\utils\mapcnv ..\map\mapa.map mapa.h 6 5 15 10 15 packed > nul 2> nul
..\utils\ene2h ..\enems\enems.ene enems.h 2bytes > nul 2> nul

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=chars greyordered in=..\gfx\cpc\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=strait2x2 greyordered in=..\gfx\cpc\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites.png out=sprites.bin max=16 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=sprites in=..\gfx\cpc\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=palsasassembly in=..\gfx\cpc\pal.png prefix=my_inks out=cpc\pal.h silent > nul 

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\marco.png out=marco.scr silent
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\ending.png out=ending.scr silent
..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal.png mode=superbuffer in=..\gfx\cpc\title.png out=title.scr silent
..\utils\zx0.exe title.scr.bin title.bin > nul
..\utils\zx0.exe marco.scr.bin marco.bin > nul
..\utils\zx0.exe ending.scr.bin ending.bin > nul

:compile
echo ### COMPILANDO SCRIPT ###
rem no olvides cambiar NPANT por el nº de pantallas
rem ..\utils\msc ..\script\script.spt msc.h 30

echo ### COMPILANDO GUEGO ###
..\utils\pasmo.exe cpc\cpc_TrPixLutM%mode%.asm trpixlut.bin
..\utils\zx0.exe trpixlut.bin trpixlutc.bin > nul 2> nul
..\utils\wyzTrackerParser.exe ..\ogt\instrumentos.asm cpc\instrumentos.h

zcc +cpc -a -vn -zorg=1024 -lcpcrslib_mt -o %game%.asm cpc\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
zcc +cpc -m -vn -zorg=1024 -lcpcrslib_mt -o %game%.bin cpc\tilemap_conf.asm churromain.c -DCPC -DMODE_%mode% > nul
if %errorlevel% neq 0 goto :error
..\utils\printsize.exe %game%.bin

echo ### CONSTRUYENDO SNA Y CDT ###
del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

..\utils\mkts_om.exe platform=cpc cpcmode=%mode% pal=..\gfx\cpc\pal_loading.png mode=scr in=..\gfx\cpc\loading.png out=loading.bin silent > nul
..\utils\zx7.exe loading.bin loading.c.bin > nul
..\utils\zx7.exe %game%.bin %game%.c.bin > nul

..\utils\imanol.exe in=cpc\loadercpc.asm-orig out=cpc\loadercpc.asm ^
	scrc_size=?loading.c.bin ^
	mainbin_size=?%game%.c.bin ^
	loading_palette=!..\gfx\cpc\pal_loading.png ^
	loader_mode=0 > nul
..\utils\pasmo.exe cpc\loadercpc.asm loader.bin  > nul

..\utils\imanol.exe in=cpc\preloadercpc.asm-orig out=cpc\preloadercpc.asm ^
	loader_size=?loader.bin ^
	loader_mode=0 > nul
..\utils\pasmo.exe cpc\preloadercpc.asm preloader.bin  > nul

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

echo ### LIMPIANDO ###

del *.scr > nul 2> nul
del *.bin > nul 2> nul

:end
echo ### DONE ###
