state ("LEGOSWTFA_DX11")
{
    int Status : 0x027AA540, 0x60, 0x30, 0x30, 0x60, 0x48, 0x20, 0x468;
    int Newgame : 0x027D3810, 0x80, 0x20, 0x20, 0x20, 0x20, 0x28, 0x258; 
    int Load : 0x2786794;
    bool LessLoad: 0x027AB960, 0x68, 0x68, 0x10, 0x60;
    bool Movement: 0x027BC3A8, 0x100, 0x18, 0x20, 0x1A0;
    string5 Area: 0x27AF660;
    string50 Area2: 0x27AF660;
    string2 Level: 0x027B5A90, 0x40;
    bool Cutscene: 0x2668B0C;
}
startup
{
    settings.Add("ng", true, "Any%/All Minikits/100%");
    settings.Add("fp", false, "Free Play/Replay Story");
    settings.Add("room", false, "Split for every section in Any%");
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

    if (settings["room"] &&
    (current.Area == "01_Th" && old.Area == "01_A2" && current.Level == "01") ||
    (current.Area2 == "01_TheBattleOfEndor_StoryComplete" && old.Area2 == "01_TheBattleOfEndor_TheBattleOfEndor" && current.Level == "01") ||
    (current.Level == "07" && old.Level == "Hu") ||
    (current.Area == "07_AG" && old.Area == "07_A_" && current.Level == "07") ||
    (current.Level == "08" && old.Level == "Hu") ||
    (current.Area == "08_A_" && current.Cutscene && !old.Cutscene && current.Level == "08") ||
    (current.Area == "08_Es" && old.Area == "08_B_" && current.Level == "08") ||
    (current.Level == "09" && old.Level == "Hu") ||
    (current.Area == "09_Ni" && old.Area == "09_A_" && current.Level == "09") ||
    (current.Area == "09_Ni" && old.Area == "09_B_" && current.Level == "09") ||
    (current.Level == "10" && old.Level == "Hu") &&
    (current.Area2 == "10_ChewieWereHome_ChewieWereHome" && current.Cutscene && !old.Cutscene && current.Level == "10") ||
    (current.Area == "10_C_" && old.Area == "10_B_" && current.Level == "10") ||
    (current.Level == "11" && old.Level == "Hu") ||
    (current.Area == "11_Je" && old.Area == "11_B_" && current.Level == "11") ||
    (current.Area == "11_D_" && old.Area == "11_Je" && current.Level == "11") ||
    (current.Level == "12" && old.Level == "Hu") ||
    (current.Area == "12_A_" && current.Cutscene && !old.Cutscene && current.Level == "12") ||
    (current.Level == "13" && old.Level == "Hu") ||
    (current.Area == "13_Th" && old.Area == "13_A_" && current.Level == "13") ||
    (current.Level == "14" && old.Level == "Hu") ||
    (current.Area == "14_B_" && old.Area == "14_A_" && current.Level == "14") ||
    (current.Area == "14_C_" && old.Area == "14_B_" && current.Level == "14") ||
    (current.Level == "15" && old.Level == "Hu") ||
    (current.Area == "15_A2" && current.Cutscene && !old.Cutscene && current.Level == "15") ||
    (current.Area == "15_B" && current.Cutscene && !old.Cutscene && current.Level == "15") ||
    (current.Area == "16_Th" && old.Area == "16_A3" && current.Level == "16") ||
    (current.Level == "21" && old.Level == "Hu")
    ) return true;
    if (current.Area == "21_A_" && current.Cutscene && !old.Cutscene && current.Level == "21") return true;
}
isLoading
{
    return current.Load == 0 && current.Status != 1 || current.Load != 0 && current.Status == 1;
}

