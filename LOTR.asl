state("LEGOLOTR")
{
    int Status: 0x011779F0, 0x200, 0x54, 0xB54;
    bool Load: 0x11AECF0;
    int Newgame: 0x011ADA34, 0x208;
}
split
{
    if (current.Status == 1 && old.Status == 0) return true;
}
start
{
    if (current.Newgame == 1 && old.Newgame == 0) return true;
}
isLoading
{
    return !current.Load && current.Status == 0;
}