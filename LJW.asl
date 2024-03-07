state ("LEGOJurassicWorld_DX11")
{
    bool Load : 0x2248474;
    bool Status : 0x02203750, 0x174; 
}
split
{
    if (!current.Status && old.Status) return true;
}
isLoading
{
    return !current.Load && !current.Status;
}