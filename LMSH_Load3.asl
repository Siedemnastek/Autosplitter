state("LEGOMARVEL")
{
    //bool HubWarps: 0x01599974, 0x30, 0x20, 0x24, 0x1A0;
    bool CornerLoads: 0x015B3BA8, 0x34, 0x20, 0xC, 0x30, 0x3C, 0x40, 0x64;
    bool IntoHub: 0x015665B0, 0x24, 0x18, 0x34, 0x34, 0x18, 0xC, 0x844;
    bool OpenGame: 0x1013F14;
    bool Fade: 0x1105C28;
    bool Fade2: 0x15B095C;
}

isLoading
{
    return current.CornerLoads | current.IntoHub | current.OpenGame | current.Fade | current.Fade2;
}

exit 
{
timer.IsGameTimePaused = false;
}
