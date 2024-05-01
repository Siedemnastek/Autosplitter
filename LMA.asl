state("LEGOMARVELAvengers")
{
    bool Load: 0x1E4A95C;
}
state("LEGOMARVELAvengers_DX11")
{
    bool Load: 0x2416208;
}
isLoading
{
    return !current.Load;
}