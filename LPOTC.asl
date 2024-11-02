state("LEGOPirates")
{
    bool Loading: 0xA171A4;
    bool Head: 0x00B57874, 0xBB8;
}

split
{
    return current.Head && !old.Head;
}

isLoading
{
    return current.Loading;
}

exit 
{
    timer.IsGameTimePaused = false;
}
