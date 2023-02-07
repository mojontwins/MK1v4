@echo off

set base=0xF000
set basesfx=0xFD00

if [%1]==[justassemble] goto :assemble
if [%1]==[justcompress] goto :compress 

echo Convirtiendo . . .
..\utils\AKSToBIN.exe -a %base% "aks\01 - ZX Perils - Title_03.aks" bin\00_title.bin 
..\utils\AKSToBIN.exe -a %base% "aks\02 - ZX Perils - Cut Scenes-Ending_01.aks" bin\01_cuts.bin 
..\utils\AKSToBIN.exe -a %base% "aks\04 - ZX Perils - Stage 1_00.aks" bin\02_stage_1.bin
..\utils\AKSToBIN.exe -a %base% "aks\04 - ZX Perils - Stage 2_00.aks" bin\03_stage_2.bin
..\utils\AKSToBIN.exe -a %base% "aks\04 - ZX Perils - Stage 3_00.aks" bin\04_stage_3.bin
..\utils\AKSToBIN.exe -a %base% "aks\06 - ZX Perils - Stage 4_00.aks" bin\05_stage_4.bin
..\utils\AKSToBIN.exe -a %base% "aks\07 - ZX Perils - Stage Clear_00.aks" bin\06_stage_clear.bin
..\utils\AKSToBIN.exe -a %base% "aks\08 - ZX Perils - Final Stage Clear_00.aks" bin\07_final_stage_clear.bin
..\utils\AKSToBIN.exe -a %base% "aks\09 - ZX Perils - Game Over_00.aks" bin\08_game_over.bin
..\utils\AKSToBIN.exe -s -a %basesfx% aks\sfx.aks bin\sfx.bin

:compress
echo Comprimiendo . . .
cd bin
..\..\utils\apack.exe 00_title.bin 00_title_c.bin > nul
..\..\utils\apack.exe 01_cuts.bin 01_cuts_c.bin > nul
..\..\utils\apack.exe 02_stage_1.bin 02_stage_1_c.bin > nul
..\..\utils\apack.exe 03_stage_2.bin 03_stage_2_c.bin > nul
..\..\utils\apack.exe 04_stage_3.bin 04_stage_3_c.bin > nul
..\..\utils\apack.exe 05_stage_4.bin 05_stage_4_c.bin > nul
..\..\utils\apack.exe 06_stage_clear.bin 06_stage_clear_c.bin > nul
..\..\utils\apack.exe 07_final_stage_clear.bin 07_final_stage_clear_c.bin > nul
..\..\utils\apack.exe 08_game_over.bin 08_game_over_c.bin > nul
..\..\utils\apack.exe sfx.bin sfx_c.bin > nul
cd ..

:assemble
echo Ensamblando . . .
..\utils\pasmo.exe atPlayer.speccy.asm RAM1.bin RAM1.map.txt
