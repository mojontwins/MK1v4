@echo off
                                                                                                                  
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