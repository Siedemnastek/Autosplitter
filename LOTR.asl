state("LEGOLOTR")
{
    int Status: 0x011779F0, 0x200, 0x54, 0xB54;
    bool Load: 0x11AECF0;
    int Newgame: 0x011ADA34, 0x208;
    int roomSplit: 0x006A76CC, 0x0;
}
startup
{
    settings.Add("split_status", true, "Split on Status Screens");
    settings.Add("split_room", false, "Split on every room");

    vars.preventSplit = new Stopwatch();
}
update 
{
  if (vars.preventSplit.ElapsedMilliseconds > 8000) vars.preventSplit.Reset();
}

onStart
{
  vars.preventSplit.Start();
}

onReset 
{
    vars.preventSplit.Reset();
}

onSplit 
{
  vars.preventSplit.Start();
}

split
{
    if(settings["split_status"] && !vars.preventSplit.IsRunning && current.Status == 1 && old.Status == 0) return true;
    if(settings["split_room"] && !vars.preventSplit.IsRunning && current.roomSplit != old.roomSplit) return true;
}
start
{
    if (current.Newgame == 1 && old.Newgame == 0) return true;
}
isLoading
{
    return !current.Load && current.Status == 0;
}