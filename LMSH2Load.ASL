state("LEGOMARVEL2_DX11")
{
    bool AntiLoading: 0x2BC4C4C;
}

isLoading
{
    return !current.AntiLoading;
}

