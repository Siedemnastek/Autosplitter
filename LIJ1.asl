//Splitting by Siedemnastek, load remover by Tfresh
state("LEGOIndy")
{
    int status : 0x6D39F0;
    int statust : 0x6927D8;
    int newgame : 0x5C43C4;
    int newgamet : 0x6CC7A8;
    int stream : 0x6CC944;
    bool Loading: 0x5C3D24;
    bool Loading2: 0x6CC7A8;
    bool Reset: 0x572DA8;
}

startup
{
    settings.Add("any", true, "Any%/Raiders of the Lost Ark");
    settings.Add("temple", false, "Temple of Doom");
    settings.Add("crusade", false, "Last Crusade");
    settings.Add("fp", false, "FP/AA/100%");
    refreshRate = 255;
}

split
{
    if (current.statust > old.statust && !current.Loading) return true;
    else if (settings["any"] && current.stream == 67 && old.stream == 66) return true;  
    else if (settings["temple"] && current.stream == 126 && old.stream == 125) return true;
    else if (settings["crusade"] && current.stream == 192 && old.stream == 191) return true;
}

start
{
    if (current.newgame > old.newgame && current.newgamet > old.newgamet) return true;
}

reset
{
    if (current.stream == 0 && old.stream == 1) return true;
}

isLoading
{
    return current.Loading || current.Loading2 || current.Reset;
}

exit 
{
timer.IsGameTimePaused = false;
}
