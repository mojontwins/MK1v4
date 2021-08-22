@echo off
cls
echo **************
echo * COMPILANDO *
echo **************
zcc +cpc TileMapConf-%1.asm -create-app -O3 -unsigned -o %1.bin %1.c -lcpcrslib -lcpcwyzlib -zorg=10000

echo.
echo ************
echo * COPIANDO *
echo ************
copy %1.bin ..\..\WinAPE
echo OK!


