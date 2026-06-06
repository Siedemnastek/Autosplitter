state("LEGOBatmanLotDK-Win64-Shipping")
{
    bool Load: 0x0B758D08, 0x178;
}
isLoading
{
    return current.Load;
}
exit 
{
    timer.IsGameTimePaused = true;
}