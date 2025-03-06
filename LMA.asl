state("LEGOMARVELAvengers")
{
    bool Load: 0x1E4A95C;
    bool Status: 0x01E753E8, 0x4, 0x24, 0x8, 0x11C, 0x14C;
}
state("LEGOMARVELAvengers_DX11")
{
    bool Load: 0x2416208;
    bool Status: 0x22E6A30;
}
split
{
    if (current.Status && !old.Status) return true;
}
isLoading
{
    return !current.Load && !current.Status;
}

