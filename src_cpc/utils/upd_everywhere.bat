@echo off 
echo Copying %1.* to all games in games_cpc
for /d %%f in (..\..\games_cpc\*) do copy %1.* %%f\utils > nul
echo Copying %1.* to all games in games_old
for /d %%f in (..\..\games_old\*) do copy %1.* %%f\utils > nul
echo Copying %1.* to src_old
copy %1.* ..\..\src_old\utils > nul
