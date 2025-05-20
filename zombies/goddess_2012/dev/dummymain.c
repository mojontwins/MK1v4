#include "config.h"
#include "definitions.h"
#include "msc-config.h"
#include "zx0.h"
#include "churrera_cpc/cpc.h"

void main (void) {
	system_init ();
	BORDER(0x55);
	while (1) {
		#asm
			halt
		#endasm
	}
}
