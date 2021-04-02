// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// Mojon Twin Asm Lib (auxiliary functions)

#asm
	#if defined MODE_128K_DUAL
		.SetRAMBank
			ld	a, b
			or	a
			jp	z, restISR
			xor	a
			ld	i, a
			jp	SetRAMBankKeepGoing
		.restISR
			ld	a, $f0
			ld	i, a
		.SetRAMBankKeepGoing
			ld	a, 16
			or	b
			ld	bc, $7ffd
			out (C), a			
			ret 

		#ifdef ENABLE_ARKOS
			// ARKOS initialization
			.arkos_address_call
				ld b, ARKOS_RAM
				call SetRAMBank
				call ARKOS_ADDRESS_MT_INIT				
				ld b, 0
				jp SetRAMBank					
		#endif
	#endif

	.HLshr6_A
		// HL shr 6 -> CCBBBBBB AAxxxxxx -> BBBBBBAA
		sla h 
		sla h 			// BBBBBB00

		ld  a, l 
		rlca
		rlca 
		and 0x03 		// 000000AA

		or  h 			// BBBBBBAA
		ret 
#endasm
