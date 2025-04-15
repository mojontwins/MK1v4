// MTE MK1 v3.2
// Copyleft 2010-2013, 2020-2025 by The Mojon Twins

// Points to set palette routines per each screen in the map

#asm
	.palmap
		defw inks0, inks2, inks2, inks2
		defw inks2, inks2, inks1, inks1
		defw inks0, inks2, inks0, inks0
		defw inks1, inks1, inks0, inks3
		defw inks1, inks1, inks0, inks3
		defw inks0, inks0, inks0, inks3
		defw inks0, inks0, inks0, inks3
#endasm
		