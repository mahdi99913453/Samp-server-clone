#include <a_samp>

// MAX_PLAYERS „⁄„Ê·  ·ﬁ«∆Ì« ›Ì a_samp ó „«›Ì‘ œ«⁄Ì · ⁄—Ì›Â

// Job IDs
#define JOB_NONE        0
#define JOB_MEDIC       1
#define JOB_PIZZABOY    2
#define JOB_MECHANIC    3
#define JOB_HITMAN      4
#define JOB_FAN         5

// Variables
new PlayerJob[MAX_PLAYERS];

// GameModeInit
public OnGameModeInit()
{
    // Your init code here if needed
    return 1;
}

// Commands
public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/job", true) == 0)
    {
        ShowPlayerDialog(playerid, 1000, DIALOG_STYLE_LIST, "Choose your Job",
        "Medic\nPizzaboy\nMechanic\nHitman\nFan", "Select", "Cancel");
        return 1;
    }
    if (strcmp(cmdtext, "/quitjob", true) == 0)
    {
        PlayerJob[playerid] = JOB_NONE;
        SendClientMessage(playerid, -1, "You have quit your job.");
        return 1;
    }
    if (strcmp(cmdtext, "/heal", true) == 0)
    {
        if(PlayerJob[playerid] != JOB_MEDIC) return SendClientMessage(playerid, -1, "You are not a Medic!");
        SetPlayerHealth(playerid, 100.0);
        SendClientMessage(playerid, -1, "You have healed yourself!");
        return 1;
    }
    if (strcmp(cmdtext, "/deliverpizza", true) == 0)
    {
        if(PlayerJob[playerid] != JOB_PIZZABOY) return SendClientMessage(playerid, -1, "You are not a Pizzaboy!");
        SendClientMessage(playerid, -1, "You delivered a hot pizza!");
        return 1;
    }
    if (strcmp(cmdtext, "/repair", true) == 0)
    {
        if(PlayerJob[playerid] != JOB_MECHANIC) return SendClientMessage(playerid, -1, "You are not a Mechanic!");
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid == 0) return SendClientMessage(playerid, -1, "You are not in a vehicle!");
        RepairVehicle(vehicleid);
        SendClientMessage(playerid, -1, "You repaired your vehicle!");
        return 1;
    }
    if (strcmp(cmdtext, "/assassinate", true) == 0)
    {
        if(PlayerJob[playerid] != JOB_HITMAN) return SendClientMessage(playerid, -1, "You are not a Hitman!");
        SendClientMessage(playerid, -1, "You assassinated a target (placeholder).");
        return 1;
    }
    if (strcmp(cmdtext, "/cheer", true) == 0)
    {
        if(PlayerJob[playerid] != JOB_FAN) return SendClientMessage(playerid, -1, "You are not a Fan!");
        SendClientMessageToAll(-1, "A fan in the stadium is cheering loudly!");
        return 1;
    }
    return 0;
}

// Dialog Response
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1000)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    PlayerJob[playerid] = JOB_MEDIC;
                    SendClientMessage(playerid, -1, "You are now a Medic!");
                }
                case 1:
                {
                    PlayerJob[playerid] = JOB_PIZZABOY;
                    SendClientMessage(playerid, -1, "You are now a Pizzaboy!");
                }
                case 2:
                {
                    PlayerJob[playerid] = JOB_MECHANIC;
                    SendClientMessage(playerid, -1, "You are now a Mechanic!");
                }
                case 3:
                {
                    PlayerJob[playerid] = JOB_HITMAN;
                    SendClientMessage(playerid, -1, "You are now a Hitman!");
                }
                case 4:
                {
                    PlayerJob[playerid] = JOB_FAN;
                    SendClientMessage(playerid, -1, "You are now a Fan in the stadium!");
                }
            }
        }
        return 1;
    }
    return 0;
}

