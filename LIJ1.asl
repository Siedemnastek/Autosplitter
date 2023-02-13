//By Siedemnastek
state("LEGOIndy")
{
    int status : 0x6D39F0;
    int statust : 0x6927D8;
    int newgame : 0x6C1664;
    int newgamet : 0x6CC7A8;
    int stream : 0x6CC944;
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
    if (current.status > old.status && current.statust != old.statust) return true;
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