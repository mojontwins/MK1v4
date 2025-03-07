XDEF scripts_e 
XDEF scripts_f 
XDEF script_get_coin
XDEF script_kill_enemy
XDEF script_e_any
XDEF script_e_game
XDEF script_f_any

.scripts_e 
	defw script_e_00

.scripts_f 
	defw script_f_00 

.script_get_coin
	defb $FF 

.script_kill_enemy 
	defb $FF 

.script_e_any 
	defb $FF 

.script_e_game 
	defb $FF 

.script_f_any 
	defb $FF

.script_e_00
	defb $FF

.script_f_00
	defb $FF
