state ("LEGO The Incredibles_DX11")
{
    //bool Loading: 0x2BD6DA4;
    //bool Loading2: 0x02C60F60, 0x168;
    bool Loading3: 0x02AA0E48, 0xB8, 0x18, 0x30, 0x0, 0x60, 0x70, 0x168;
}

isLoading
{
    //return current.Loading;
    //return current.Loading2;
    return current.Loading3;
}

exit
{
    timer.IsGameTimePaused = false;
}