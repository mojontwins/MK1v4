// msc.h
// Generado por Mojon Script Compiler de la Churrera
// Copyleft 2011 The Mojon Twins
 
// Script data & pointers
extern unsigned char mscce_0 [];
extern unsigned char mscce_1 [];
extern unsigned char mscce_2 [];
extern unsigned char msccf_0 [];
 
unsigned char *e_scripts [] = {
    0, 0, mscce_1, 0, 0, 0, 0, 0, 0, 0, 0, mscce_2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, mscce_0, 0
};
 
unsigned char *f_scripts [] = {
    0, 0, msccf_0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
 
#asm
._mscce_0
    defb 0x04, 0xF0, 0xFF, 0xA1, 0xFF, 0xFF
._mscce_1
    defb 0x0D, 0xF0, 0xFF, 0xA0, 0x20, 0x0A, 0x02, 0x1B, 0x51, 0x91, 0x11, 0xAF, 0x2F, 0xFF, 0xFF
._mscce_2
    defb 0x0B, 0xB1, 0xFF, 0x20, 0x03, 0x07, 0x00, 0x20, 0x03, 0x08, 0x00, 0xFF, 0xFF
._msccf_0
    defb 0x28, 0x20, 0x0A, 0x02, 0xA0, 0xFF, 0xE3, 0x39, 0x21, 0x00, 0x34, 0x25, 0x00, 0x28, 0x25, 0x00, 0x21, 0x22, 0x29, 0x25, 0x32, 0x34, 0x2F, 0x00, 0x2C, 0x21, 0x00, 0x30, 0x35, 0x25, 0x32, 0x34, 0x21, 0x00, 0x29, 0x33, 0x28, 0xEE, 0xB1, 0xB0, 0xFF, 0xFF
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
            and 0xF0
            ld  (_sc_i), a
            ld  a, l
            and 0x0f
            ld  (_sc_m), a
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
            if (sc_i == 0xa0) { sc_terminado = flags [sc_m]; }
            else if (sc_i == 0xb0) { sc_terminado = (! flags [sc_m]); }
            else switch (sc_c) {
                case 0x20:
                    // IF PLAYER_TOUCHES x, y
                    // Opcode: 20 x y
                    read_x_y ();
                    sc_terminado = (! ((player.x >> 6) >= (sc_x << 4) - 15 && (player.x >> 6) <= (sc_x << 4) + 15 && (player.y >> 6) >= (sc_y << 4) - 15 && (player.y >> 6) <= (sc_y << 4) + 15));
                    break;
                case 0xF0:
                     // IF TRUE
                     // Opcode: F0
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
                if (sc_i == 0xa0) { flags [sc_m & 0x0f] = 0; }
                else if (sc_i == 0xb0) { flags [sc_m & 0x0f] = 1; }
                else switch (sc_c) {
                    case 0x20:
                        // SET TILE (x, y) = n
                        // Opcode: 20 x y n
                        read_x_y ();
                        sc_n = read_vbyte ();
                        map_buff [sc_x + (sc_y << 4) - sc_y] = sc_n;
                        map_attr [sc_x + (sc_y << 4) - sc_y] = comportamiento_tiles [sc_n];
                        draw_coloured_tile (VIEWPORT_X + sc_x + sc_x, VIEWPORT_Y + sc_y + sc_y, sc_n);
                        break;
                    case 0x51:
                        // SET_FIRE_ZONE x1, y1, x2, y2
                        // Opcode: 51 x1 y1 x2 y2
                        fzx1 = read_byte ();
                        fzy1 = read_byte ();
                        fzx2 = read_byte ();
                        fzy2 = read_byte ();
                        f_zone_ac = 1;
                        break;
                    case 0xE3:
                        sc_x = 0;
                        while (1) {
                           sc_n = read_byte ();
                           if (sc_n == 0xEE) break;
                           sp_PrintAtInv (LINE_OF_TEXT, LINE_OF_TEXT_X + sc_x, LINE_OF_TEXT_ATTR, sc_n);
                           sc_x ++;
                        }
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
