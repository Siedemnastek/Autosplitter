state("LEGO DC Super-villains_DX11")
{
    bool Status : 0x2DB02B0;
    bool Load : 0x2C3AB8C;
}

split
{
    if  (current.Status && !old.Status && !current.Load) return true;
}

isLoading 
{
    return !current.Load && !current.Status;
}
