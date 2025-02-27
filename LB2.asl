state ("LEGOBatman2")
{
    bool Load: 0xF8BAE0;
    bool Status: 0x00F60BD8, 0x160, 0xA30;
    bool Newgame: 0x00F8985C, 0x1E8;
}
start
{
    if (current.Newgame && !old.Newgame) return true;
}
split
{
    if (current.Status && !old.Status) return true;
}
isLoading
{
    return !current.Load && !current.Status;
}
