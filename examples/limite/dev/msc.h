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
unsigned char sc_i, sc_m, sc_x, sc_y, sc_c, sc_n, sc_terminado, sc_continuar, sc_res;
 
void msc_init_all (void) {
    #asm
            ld  hl, _flags
            ld  de, _flags+1
            ld  bc, MAX_FLAGS-1
            xor a
            ld  (hl), a
            ldir
    #endasm
}
 
unsigned char read_byte (void) {
    #asm
            ld  hl, (_script)
            ld  a, (hl)
            inc hl
            ld  (_script), hl
            ld  l, a
            ld  h, 0
   #endasm
}
 
unsigned char read_vbyte (void) {
    #asm
            call _read_byte
            ;ld  a, l
            bit 7, a
            ret z
            and 127
            ld  d, 0
            ld  e, a
            ld  hl, _flags
            add hl, de
            ld  l, (hl)
            ld  h, 0
    #endasm
}
void read_x_y (void) {
    #asm
            call _read_vbyte
            ld  a, l
            ld  (_sc_x), a
            call _read_vbyte
            ld  a, l
            ld  (_sc_y), a
    #endasm
}
 
// Ejecutamos el script apuntado por *script:
unsigned char run_script (void) {
    sc_res = 0;
 
    if (script == 0)
        return; 
 
    script_something_done = 0;
 
    while (1) {
        sc_c = read_byte ();
        if (sc_c == 0xFF) break;
        next_script = script + sc_c;
        sc_terminado = sc_continuar = 0;
        while (0 == sc_terminado) {
            sc_c = read_byte ();
            switch (sc_c) {
                case 0x31:
                    // IF ENEMIES_KILLED_EQUALS n
                    // Opcode: 31 n
                    sc_terminado = (player.killed != read_vbyte ());
                    break;
                case 0x50:
                     // IF NPANT n
                     // Opcode: 50 n
                     sc_terminado = (n_pant != read_vbyte ());
                     break;
                case 0x51:
                     // IF NPANT_NOT n
                     // Opcode: 51 n
                     sc_terminado = (n_pant == read_vbyte ());
                     break;
                case 0xFF:
                    // THEN
                    // Opcode: FF
                    #asm
                        ld  a, 1
                        ld  (_sc_terminado), a
                        ld  (_sc_continuar), a
                        ld  (_script_something_done), a
                    #endasm
                    break;
            }
        }
        if (sc_continuar) {
            sc_terminado = 0;
            while (0 == sc_terminado) {
                sc_c = read_byte ();
                switch (sc_c) {
                    case 0xE0:
                        // SOUND n
                        // Opcode: E0 n
                        peta_el_beeper (read_vbyte ());
                        break;
                    case 0xF1:
                        #asm
                            ld  a, 1
                            ld  (_sc_terminado), a
                            ld  (_script_result), a
                    #endasm
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
