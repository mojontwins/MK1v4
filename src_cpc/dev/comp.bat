@echo off

set game=cheril

echo Making %game%
..\utils\mapcnv.exe ..\map\mapa.map mapa.h 5 5 15 10 15 packed fixmappy > nul
..\utils\ene2h.exe ..\enems\enems.ene enems.h 2bytes  > nul

..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=chars in=..\gfx\font.png out=font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=strait2x2 in=..\gfx\work.png out=work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=sprites.bin mappings=spriteset_mappings.h max=16 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=sprites_extra.bin max=2 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=sprites_bullet.bin metasize=1,1 max=1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=0 pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_sword.png out=sprites_sword.bin metasize=1,1 max=4 silent > nul
..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=pal.h silent > nul

..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=marco.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=ending.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=title.bin silent > nul
..\utils\apack.exe title.bin titlec.bin > nul
..\utils\apack.exe marco.bin marcoc.bin > nul
..\utils\apack.exe ending.bin endingc.bin > nul

rem echo Making script
rem ..\utils\msc.exe ..\script\script.spt msc.h 25 > nul

rem luts
..\utils\pasmo.exe cpc_TrPixLutM0.asm trpixlut.bin
..\utils\apack.exe trpixlut.bin trpixlutc.bin > nul
rem ..\utils\wyzTrackerParser.exe ..\mus\instrumentos.asm assets\instrumentos.h

zcc +cpc -m -vn -unsigned -zorg=1024 -lcpcrslib -o %game%.bin tilemap_conf.asm churromain.c > nul

..\utils\printsize.exe %game%.bin

del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna
echo Output: %game%.sna

del *.bin >nul
