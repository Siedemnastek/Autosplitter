state ("LEGOIndy2")
{
    int Room : 0xC5B598;
    int Cutscene: 0xC9A8B0;
    int Start: 0xB0B6CC;
    bool Load1: 0xB0F5C8;
    bool Load2: 0xACBF08;
    bool Load3: 0xC5B838;
}
//1.3
startup
{
    vars.splitDelay = new Stopwatch();
    vars.Count = 0;
    settings.Add("n", true, "N0CUT5");
    settings.Add("s", false, "Standard");
    refreshRate = 60;
}

onStart {
    vars.splitDelay.Reset();
    vars.Count = 0;
}

start
{
    if (current.Start > old.Start) return true;
}

split {
    //CS1
    if (current.Room==94) 
    {
        vars.Count=0;
        vars.splitDelay.Reset();
    }
    if (current.Room==96 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Hangar Havoc
    if (current.Room==96 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;   
    }
    if (current.Room==98 && old.Room==97) return true; //Doom Town
    if (current.Room==92 && old.Room==100) return true; //Cafe Chaos
    if (current.Room==102 && current.Cutscene==1 && old.Cutscene==0) return true; //Motorbike Mayhem
    if (current.Room==106 && old.Room==105) return true; //Crane Train

    //CS2
    if (current.Room==109) 
    {
        vars.Count=0;
        vars.splitDelay.Reset();
    }
    if (current.Room==110 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Peru Cell Perusal
    if (current.Room==110 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==112 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Tomb Doom
    if (current.Room==112 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) 
    {
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==112 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 20000 && current.Room==112 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    if (current.Room==112 && current.Cutscene==1 && vars.Count==3)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==114 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Mac Attack
    if (current.Room==114 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==119 && current.Cutscene==1 && old.Cutscene==0) return true; //Rainforest Rumble
    if (current.Room==116 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Dovchenko Duel
    if (current.Room==116 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    
    //CS3
    if (current.Room==121) 
    {
        vars.Count=0;
        vars.splitDelay.Reset();
    }
    if (current.Room==122 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0) //Repair Scare
    {
        vars.Count++; 
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==122 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 30000 && current.Room==122 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    if (current.Room==122 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==124 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //River Ruckus
    if (current.Room==124 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==126 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Temple Tangle
    if (current.Room==126 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
     {
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==126 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 38000 && current.Room==126 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    if (current.Room==126 && current.Cutscene==1 && vars.Count==3)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==128 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Ugha Struggle
    if (current.Room==128 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==131 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) //Akator Ambush
    {
        vars.Count++;
        vars.splitDelay.Start(); 
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==131 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
    {
        vars.splitDelay.Reset();
        vars.Count++;
        vars.splitDelay.Start();
    }
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 10000 && current.Room==131 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
    {
        vars.splitDelay.Reset();
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==131 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 25000 && current.Room==131 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    if (current.Room==131 && current.Cutscene==1 && vars.Count==3)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }

    //Raiders
    if (current.Room==54) 
    {
        vars.Count=0;
        vars.splitDelay.Reset();
    }
    if (current.Room==55 && vars.Count==0) vars.Count++; //Raven Rescue
    if (current.Room==55 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==57 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0) //Market Mayhem
    {
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==57 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 25000 && current.Room==57 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    if (current.Room==57 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==60 && old.Room==59) return true; //Map Room Mystery
    if (current.Room==62 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //After The Ark
    if (current.Room==62 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    } 
    if (current.Room==64 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0) //Belloq Battle
    {
        vars.Count++; 
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==64 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++; 
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 65000 && current.Room==64 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    if (current.Room==64 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }

    //Temple of Doom
    if (current.Room==67) vars.splitDelay.Reset();
    if (current.Room==67 && old.Room !=73 && current.Cutscene==0) vars.Count=0;
    if (current.Room==68 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Lao Chase
    if (current.Room==68 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==71 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0)  //Monkey Mischief
    {
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==71 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 35000 && current.Room==71 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
       if (current.Room==71 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==73 && current.Cutscene==0 && old.Cutscene==1) vars.Count++; //Malice at the Palace
    if (current.Room==67 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) 
    {
        vars.Count=0;
        return true; 
    }
    if (current.Room==75 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0) //Temple Tantrum
    {
        vars.Count++;
        vars.splitDelay.Start();
    } 
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==75 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 30000 && current.Room==75 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    if (current.Room==75 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==67 && old.Room == 75 && current.Cutscene==1 && old.Cutscene==0) return false;
    if (current.Room==77 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Mola Rampage
    if (current.Room==77 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }

    //The Last Crusade
    if (current.Room==80) 
    {
        vars.Count=0;
        vars.splitDelay.Reset();
    }
    if (current.Room==81 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++;  //Coronado Caper
    if (current.Room==81 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
    {
        vars.Count++;
        vars.splitDelay.Start();
    } 
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 4000 && current.Room==81 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 16000 && current.Room==81 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    if (current.Room==81 && current.Cutscene==1 && vars.Count==3)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (current.Room==83 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Brunwald Blaze
    if (current.Room==83 && current.Cutscene==1 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (current.Room==85 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0) //Berlin Brawl
    {
        vars.Count++;
        vars.splitDelay.Start();
    } 
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 5000 && current.Room==85 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 25000 && current.Room==85 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    if (current.Room==85 && current.Cutscene==1 && vars.Count==2)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    if (settings["s"] && current.Room==87 && current.Cutscene==0 && old.Cutscene==1 && vars.Count==0) vars.Count++; //Cannon Canyon
    else if (settings["n"] && current.Room==87 && vars.Count==0) vars.Count++;
    if (current.Room==87 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
    {
        vars.Count=0;
        return true;
    }
    if (settings["s"] && current.Room==89 && vars.Count==0) vars.Count++; //Trial&Terror
    if (settings["s"] && current.Room==89 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1)
     {
        vars.Count++;
        vars.splitDelay.Start();
    }
    else if(settings["n"] && current.Room==89 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==0)
    {
        vars.Count++;
        vars.splitDelay.Start();
    }
    if (settings["n"] && vars.splitDelay.ElapsedMilliseconds >= 4000 && current.Room==89 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==1) vars.Count++;
    else if (settings["s"] && vars.splitDelay.ElapsedMilliseconds >= 23000 && current.Room==89 && current.Cutscene==1 && old.Cutscene==0 && vars.Count==2) vars.Count++;
    if (settings ["n"] && current.Room==89 && current.Cutscene==1 && vars.Count==2)
     {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }
    else if (settings ["s"] && current.Room==89 && current.Cutscene==1 && vars.Count==3)
    {
        vars.splitDelay.Reset();
        vars.Count=0;
        return true;
    }


}

isLoading
{
    return current.Load1 || current.Load2 || current.Load3;
}
