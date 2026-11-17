// Sword custom hit
// Manage your sword hit youself!

if (_en_t == 1) {
	// Pilgrim!

	// Extasy: raise bit 3
	_en_t |= 8;

	// Change sprite
	enems_en_an_calc (4);

	// Deplete hostias
	player.sword_g --;
}
