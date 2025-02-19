state("LEGONINJAGO_DX11")
{
    bool Loading : 0x245ADF0;
    bool ChapterScreen: 0x024BC300, 0x40, 0x90, 0xC8, 0x38, 0x24;
    bool MainMenu: 0x24A83A8;
}
startup
{
    vars.Prologue = 0;
    vars.splitDelay = new Stopwatch();
}
onStart
{
    vars.Prologue = 0;
    vars.splitDelay.Reset();
}
split
{
    if (current.ChapterScreen && !old.ChapterScreen && !current.MainMenu && vars.Prologue == 0) 
    {
        vars.Prologue = 1;
        vars.splitDelay.Start();
    }
    if (current.ChapterScreen && !old.ChapterScreen && !current.MainMenu && vars.Prologue == 1 && vars.splitDelay.ElapsedMilliseconds >= 10000) return true;
}
isLoading
{
    return current.Loading;
}