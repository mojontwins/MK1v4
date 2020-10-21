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

    defb 0x0B, 0x31, 0x82, 0x51, 0x1D, 0xFF, 0xE0, 0x0B, 0xE0, 0x02, 0xD0, 0xFF, 0x0B, 0x31, 0x82, 0x50
    defb 0x1D, 0xFF, 0xE0, 0x0B, 0xE0, 0x02, 0xF1, 0xFF, 0xFF

#endasm
 
unsigned char *script;
 
void msc_init_all () {
    unsigned char i;
    for (i = 0; i < MAX_FLAGS; i ++)
        flags [i] = 0;
}
 
unsigned char read_byte () {
    unsigned char c;
    c = script [0];
    script ++;
    return c;
}
 
unsigned char read_vbyte () {
    unsigned char c;
    c = read_byte ();
    if (c & 128) return flags [c & 127];
    return c;
}
 
// Ejecutamos el script apuntado por *script:
unsigned char run_script () {
    unsigned char res = 0;
    unsigned char terminado = 0;
    unsigned char continuar = 0;
    unsigned char x, y, n, m, c;
    unsigned char *next_script;
 
    if (script == 0)
        return; 
 
    script_something_done = 0;
 
    while (1) {
        c = read_byte ();
        if (c == 0xFF) break;
        next_script = script + c;
        terminado = continuar = 0;
        while (!terminado) {
            c = read_byte ();
            switch (c) {
                case 0x31:
                    // IF ENEMIES_KILLED_EQUALS n
                    // Opcode: 31 n
                    n = read_vbyte ();
                    if (player.killed != n)
                        terminado = 1;
                    break;
                case 0x50:
                     // IF NPANT n
                     // Opcode: 50 n
                     n = read_vbyte ();
                     if (n_pant != n)
                         terminado = 1;
                     break;
                case 0x51:
                     // IF NPANT_NOT n
                     // Opcode: 51 n
                     n = read_vbyte ();
                     if (n_pant == n)
                         terminado = 1;
                     break;
                case 0xFF:
                    // THEN
                    // Opcode: FF
                    terminado = 1;
                    continuar = 1;
                    script_something_done = 1;
                    break;
            }
        }
        if (continuar) {
            terminado = 0;
            while (!terminado) {
                c = read_byte ();
                switch (c) {
                    case 0xD0:
                        // NEXT_LEVEL
                        // Opcode: D0
                        n_pant ++;
                        init_player_values ();
                        draw_scr ();
                        break;
                    case 0xE0:
                        // SOUND n
                        // Opcode: E0 n
                        n = read_vbyte ();
                        peta_el_beeper (n);
                        break;
                    case 0xF1:
                        script_result = 1;
                        terminado = 1;
                        break;
                    case 0xFF:
                        terminado = 1;
                        break;
                }
            }
        }
        script = next_script;
    }
 
    return res;
}
