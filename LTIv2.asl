state ("LEGO The Incredibles_DX11")
{
    bool Load: 0x2BF395C;
    bool Load2: 0x02AA0E48, 0xB8, 0x18, 0x30, 0x0, 0x60, 0x70, 0x168;
    int Status: 0x02D08600, 0x50, 0x28, 0x90, 0x30, 0x30, 0x8, 0x78;
}
startup
{
    vars.Split = new Stopwatch();
    refreshRate=240;
}
onStart
{
    vars.Split.Reset();
}
isLoading
{
    return !current.Load && current.Status==0 || !current.Load && current.Status>=1 && current.Load2;
}
split
{
    if (current.Status>=1 && old.Status==0) vars.Split.Start();
    
    if (vars.Split.ElapsedMilliseconds >= 1400) 
    {
        vars.Split.Reset();
        return true;
    }
}
exit
{
    timer.IsGameTimePaused = false;
}


