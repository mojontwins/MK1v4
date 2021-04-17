@echo off

cd cwrapper
copy ..\SPconfig.def .
gencompile "zcc +zx -vn -make-lib -I.." sp_c.lst
del SPconfig.def
cd ..

rem cd hashtable
rem copy ..\SPconfig.def .
rem gencompile "zcc +zx -vn -make-lib -I.." sp_c.lst
rem del SPconfig.def
rem cd ..

cd heap
copy ..\SPconfig.def .
gencompile "zcc +zx -vn -make-lib -I.." sp_c.lst
del SPconfig.def
cd ..

z80asm -I. -d -ns -nm -Mo -DFORzx -xsplib2 @sp.lst



cd backgroundtiles
del *.o
cd ..

cd blockmemoryalloc
del *.o
cd ..

cd cwrapper
del *.o
cd ..

cd displaylist
del *.o
cd ..

cd globalvariables
del *.o
cd ..

rem cd hashtable
rem del *.o
rem cd ..

cd heap
del *.o
cd ..

rem cd huffman
rem del *.o
rem cd ..

cd input
del *.o
cd ..

cd interrupts
del *.o
cd ..

cd linkedlist
del *.o
cd ..

cd miscellaneous
del *.o
cd ..

cd screenaddress
del *.o
cd ..

cd sprites
del *.o
cd ..

cd updater
del *.o
cd ..

:end
