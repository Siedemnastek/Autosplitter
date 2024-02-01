state ("LEGOSWTFA_DX11")
{
    int Status : 0x027AA540, 0x60, 0x30, 0x30, 0x60, 0x48, 0x20, 0x468;
    int Newgame : 0x027D3810, 0x80, 0x20, 0x20, 0x20, 0x20, 0x28, 0x258; 
    int Load : 0x2786794;
    bool LessLoad: 0x027AB960, 0x68, 0x68, 0x10, 0x60;
    bool Movement: 0x027BC3A8, 0x100, 0x18, 0x20, 0x1A0;
}
startup
{
    settings.Add("ng", true, "Any%/All Minikits/100%");
    settings.Add("fp", false, "Free Play/Replay Story");
    vars.FP=0;
    vars.Stopwatch = new Stopwatch();
}
onStart {
    vars.Stopwatch.Reset();
    vars.FP = 0;
}
start
{
    if (settings["ng"] && current.Newgame == 1 && old.Newgame == 0) return true;
    if (settings["fp"] && !current.Movement && current.Load == 0 && vars.FP == 0) 
    {
        vars.Stopwatch.Start();
    }
    if (settings["fp"] && !current.Movement && current.Load == 0 && !current.LessLoad && vars.FP == 0 && vars.Stopwatch.ElapsedMilliseconds > 1000) vars.FP++;
    if (settings["fp"] && !current.Movement && current.Load == 0 && current.LessLoad && vars.FP == 1) vars.FP = 0;
    if (settings["fp"] && !current.Movement && current.Load == 1 && vars.FP == 1) vars.FP++;
    if (settings["fp"] && !current.Movement && current.Load == 2) vars.FP=0;
    if (settings["fp"] && current.Movement && vars.FP == 2)
    {
        vars.FP = 0;
        return true; 
    } 
    if (settings["fp"] && current.Movement && vars.FP != 2) vars.FP = 0;

}
split
{
    if (current.Status == 1 && old.Status == 0 && current.Load == 0) return true;  
}
isLoading
{
    return current.Load == 0 && current.Status != 1 || current.Load != 0 && current.Status == 1;
}
/v1.1

