// msc.h
// Generado por Mojon Script Compiler de la Churrera
// Copyleft 2010 The Mojon Twins
 
#define MSC_MAXITEMS    1
#define MSC_MAXFLAGS    1
 
// Script data & pointers
extern unsigned char mscce_20 [];
extern unsigned char msccf_20 [];
 
unsigned char *e_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, mscce_20, 0, 0, 0
};
 
unsigned char *f_scripts [] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, msccf_20, 0, 0, 0
};
 
#asm
._mscce_20
    defb 0x0C, 0x30, 0xFF, 0x20, 0x02, 0x07, 0x00, 0x20, 0x02, 0x08, 0x00, 0xFF
._msccf_20
    defb 0x0C, 0x30, 0xFF, 0x20, 0x02, 0x07, 0x00, 0x20, 0x02, 0x08, 0x00, 0xFF
#endasm
 
unsigned char *script;
 
typedef struct {
    unsigned char status;
    unsigned char supertile;
    unsigned char n_pant;
    unsigned char x, y;
} ITEM;
ITEM items [MSC_MAXITEMS];
 
unsigned char flags [MSC_MAXFLAGS]; 
void msc_init_all () {
    unsigned char i;
    for (i = 0; i < MSC_MAXITEMS; i ++)
        items [i].status = 0;
    for (i = 0; i < MSC_MAXFLAGS; i ++)
        flags [i] = 0;
}
 
unsigned char read_byte () {
    unsigned char c;
    c = script [0];
    script ++;
    return c;
}
 
// Ejecutamos el script apuntado por *script:
unsigned char run_script () {
    unsigned char res = 0;
    unsigned char terminado = 0;
    unsigned char continuar = 0;
    unsigned char x, y, n, c;
 
    if (script == 0)
        return; 
 
    while (!terminado) {
        c = read_byte ();
        switch (c) {
            case 0x30:
                // IF ALL_ENEMIES_DEAD
                // Opcode: 30
                if (player.killed != BADDIES_COUNT)
                    terminado = 1;
                break;
            case 0xFF:
                // THEN
                // Opcode: FF
                terminado = 1;
                continuar = 1;
                break;
        }
    }
    if (continuar) {
        terminado = 0;
        while (!terminado) {
            c = read_byte ();
            switch (c) {
                case 0x20:
                    // SET TILE (x, y) = n
                    // Opcode: 20 x y n
                    x = read_byte ();
                    y = read_byte ();
                    n = read_byte ();
                    map_buff [x + (y << 4) - y] = n;
                    map_attr [x + (y << 4) - y] = comportamiento_tiles [n];
                    draw_coloured_tile (VIEWPORT_X + x + x, VIEWPORT_Y + y + y, n);
                    break;
                case 0xFF:
                    terminado = 1;
                    break;
            }
        }
    }
 
    return res;
}
