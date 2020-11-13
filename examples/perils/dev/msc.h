// msc.h
// Generado por Mojon Script Compiler de MTE MK1 v4
// Copyleft 2011 The Mojon Twins
 
// Script data & pointers
extern unsigned char mscce_0 [];
extern unsigned char msccf_0 [];
 
unsigned char *e_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, mscce_0, 0, 0, 0, 0, 0, 0
};
 
unsigned char *f_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, msccf_0
};
 
#asm
._mscce_0
    defb 0x0B, 0x30, 0xFF, 0x20, 0x02, 0x07, 0x00, 0x20, 0x02, 0x08, 0x00, 0xFF, 0xFF
._msccf_0
    defb 0x0B, 0x30, 0xFF, 0x20, 0x02, 0x07, 0x00, 0x20, 0x02, 0x08, 0x00, 0xFF, 0xFF
#endasm
 
unsigned char *script;
unsigned char *next_script;
unsigned char sc_i, sc_m, sc_x, sc_y, sc_c, sc_n, sc_terminado, sc_continuar;
 
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
void run_script (void) {
    script_result = 0;
 
    if (script == 0)
        return; 
 
    script_something_done = 0;
 
    while (0 == script_result) {
        sc_c = read_byte ();
        if (sc_c == 0xFF) break;
        next_script = script + sc_c;
        sc_terminado = sc_continuar = 0;
        while (0 == sc_terminado) {
            sc_c = read_byte ();
            switch (sc_c) {
                case 0x30:
                    // IF ALL_ENEMIES_DEAD
                    // Opcode: 30
                    sc_terminado = (player.killed != BADDIES_COUNT);
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
                    case 0x20:
                        // SET TILE (x, y) = n
                        // Opcode: 20 x y n
                        set_map_tile (read_vbyte (), read_vbyte (), sc_n = read_vbyte (), comportamiento_tiles [sc_n]);
                        break;
                    case 0xFF:
                        sc_terminado = 1;
                        break;
                }
            }
        }
        script = next_script;
    }
}
