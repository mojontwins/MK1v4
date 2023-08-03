@echo off

set base=0xF000
set basesfx=0xFD00

if [%1]==[justassemble] goto :assemble
if [%1]==[justcompress] goto :compress 

echo Limpiando . . .
del /q bin\*.* >nul 2>nul

echo Convirtiendo . . .
..\utils\AKSToBIN.exe -a %base% "aks\0_title.aks" bin\00_title.bin
..\utils\AKSToBIN.exe -a %base% "aks\1_stage_select.aks" bin\01_select.bin
..\utils\AKSToBIN.exe -a %base% "aks\2_start_stage.aks" bin\02_stage_start.bin
..\utils\AKSToBIN.exe -a %base% "aks\3_stage_1.aks" bin\03_stage_1.bin
..\utils\AKSToBIN.exe -a %base% "aks\4_stage_2.aks" bin\04_stage_2.bin
..\utils\AKSToBIN.exe -a %base% "aks\5_stage_3.aks" bin\05_stage_3.bin
..\utils\AKSToBIN.exe -a %base% "aks\6_stage_4.aks" bin\06_stage_4.bin
..\utils\AKSToBIN.exe -a %base% "aks\7_stage_clear.aks" bin\07_stage_clear.bin
..\utils\AKSToBIN.exe -a %base% "aks\8_final_stage_clear.aks" bin\08_final_stage_clear.bin
..\utils\AKSToBIN.exe -a %base% "aks\9_gover.aks" bin\09_game_over.bin
..\utils\AKSToBIN.exe -a %base% "aks\10_ending.aks" bin\10_ending.bin 
..\utils\AKSToBIN.exe -s -a %basesfx% aks\sfx.aks bin\sfx.bin

:compress
echo Comprimiendo . . .
cd  bin
for %%F in (*.bin) do ..\..\utils\apack.exe %%F %%~nF_c%%~xF  >nul
cd ..

:assemble
echo Ensamblando . . .
..\utils\pasmo.exe atPlayer.speccy.asm RAM1.bin RAM1.map.txt
