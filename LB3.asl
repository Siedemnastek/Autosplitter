state ("LEGOBatman3_DX11")
{
    bool Load: 0x236E808;
    bool StatusDLC: 0x241CC6C;
    bool Status: 0x241C9FC;
}
startup
{
    settings.Add("DLC", false, "If you have DLC installed, check this box to fix load removing. It is however recommended to uninstall DLC instead if you are not planning to use it.");
}
isLoading 
{
    if (settings["DLC"]) return !current.Load && !current.StatusDLC;
    if (!settings["DLC"]) return !current.Load && !current.Status;
}
exit 
{
timer.IsGameTimePaused = false;
}