    ; Existing entry point (indexed mode) still acts as
    ; the entry point for general scripts.
    ._script_do
        ld  a, (_script_n)
        cp  ENTERING_INDEX_OFFSET ; Fill with the right value!
        jr  nc, get_from_jump_table

    .get_from_index
        ; Point to offset in script index
        ld  hl, (_script_n)
        add hl, hl
        ld  bc, script_bytecode
        add hl, bc

        ; Read offset
        ld  a, (hl)
        inc hl 
        ld  h, (hl)
        ld  l, a 

        ;  If zero do abort
        or  h 
        ret z

        jr make_pointer

    .get_from_jump_table
        call script_jump_table

        ; If no script, A = 0xff
        cp 0xff
        ret z 

    .make_pointer
        ; Make & store pointer

        ld  bc, script_bytecode
        add hl, bc
        ld  (script), hl
        