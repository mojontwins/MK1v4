@echo off
..\utils\SongToAkm.exe m0_blank.aks m0_blank.asm --exportPlayerConfig
..\utils\SongToAkm.exe m1_ingame.aks m1_ingame.asm --exportPlayerConfig
..\utils\SongToSoundEffects.exe sfx.aks sfx.asm --exportPlayerConfig

