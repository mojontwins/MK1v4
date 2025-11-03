@echo off 
echo Copying %1.* to all games in games_old
for /d %%f in (..\..\games_old\*) do copy %1.* %%f\utils > nul
