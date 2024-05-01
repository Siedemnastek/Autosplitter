state("LEGOEMMET")
{
    bool Load: 0x16C04E4;
}
isLoading
{
    return !current.Load;
}