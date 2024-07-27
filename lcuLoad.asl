state("LEGOLCUR_DX11")
{
	byte circ : 0x01198868, 0xABC; //this is the byte that determines if you are in the loading screen with a rotating disk icon. (is not always 1, it seemingly randomly alternates between positive numbers 1-3 while loading, but always 0 when not loading.)
	
	byte load : 0x01C3F098, 0x628, 0x10, 0x10, 0xE0, 0x100; //this is the byte that determines if you are in the level loading screen. (1 when in loading screen, 0 when not)
}

isLoading
{
	return (current.load == 1 || current.circ > 0);
}