// msc.h
// Generado por Mojon Script Compiler de la Churrera
// Copyleft 2011 The Mojon Twins
 
// Script data & pointers
extern unsigned char msccf_0 [];
 
unsigned char *e_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
 
unsigned char *f_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, msccf_0
};
 
#asm
._msccf_0
    defb 0x0A, 0x31, 0x82, 0x51, 0x1D, 0xFF, 0xE0, 0x0B, 0xE0, 0x02, 0xFF, 0x0B, 0x31, 0x82, 0x50, 0x1D, 0xFF, 0xE0, 0x0B, 0xE0, 0x02, 0xF1, 0xFF, 0xFF
#endasm
 
unsigned char *script;
unsigned char *next_script;
unsigned char sc_i, sc_x, sc_y, sc_c, sc_n, sc_m, sc_terminado, sc_continuar, sc_res;
 
void msc_init_all () {
    for (sc_i = 0; sc_i < MAX_FLAGS; sc_i ++)
        flags [sc_i] = 0;
}
 
unsigned char read_byte () {
    sc_c = script [0];
    script ++;
    return sc_c;
}
 
unsigned char read_vbyte () {
    sc_c = read_byte ();
    if (sc_c & 128) return flags [sc_c & 127];
    return sc_c;
}
 
// Ejecutamos el script apuntado por *script:
unsigned char run_script () {
    sc_res = 0;
    sc_terminado = 0;
    sc_continuar = 0;
 
    if (script == 0)
        return; 
 
    script_something_done = 0;
 
    while (1) {
        sc_c = read_byte ();
        if (sc_c == 0xFF) break;
        next_script = script + sc_c;
        sc_terminado = sc_continuar = 0;
        while (!sc_terminado) {
            sc_c = read_byte ();
            switch (sc_c) {
                case 0x31:
                    // IF ENEMIES_KILLED_EQUALS n
                    // Opcode: 31 n
                    sc_n = read_vbyte ();
                    if (player.killed != sc_n)
                        sc_terminado = 1;
                    break;
                case 0x50:
                     // IF NPANT n
                     // Opcode: 50 n
                     sc_n = read_vbyte ();
                     if (n_pant != sc_n)
                         sc_terminado = 1;
                     break;
                case 0x51:
                     // IF NPANT_NOT n
                     // Opcode: 51 n
                     sc_n = read_vbyte ();
                     if (n_pant == sc_n)
                         sc_terminado = 1;
                     break;
                case 0xFF:
                    // THEN
                    // Opcode: FF
                    sc_terminado = 1;
                    sc_continuar = 1;
                    script_something_done = 1;
                    break;
            }
        }
        if (sc_continuar) {
            sc_terminado = 0;
            while (!sc_terminado) {
                sc_c = read_byte ();
                switch (sc_c) {
                    case 0xE0:
                        // SOUND n
                        // Opcode: E0 n
                        sc_n = read_vbyte ();
                        peta_el_beeper (sc_n);
                        break;
                    case 0xF1:
                        script_result = 1;
                        sc_terminado = 1;
                        break;
                    case 0xFF:
                        sc_terminado = 1;
                        break;
                }
            }
        }
        script = next_script;
    }
 
    return sc_res;
}
