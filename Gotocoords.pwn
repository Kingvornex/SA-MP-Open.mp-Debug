
#include <a_samp>
#include <zcmd>
#include <sscanf2>

#define FILTERSCRIPT

#define COLOR_LIGHTNBLUE 0xabcdef66
#define COLOR_INDIGO 0x4B00B0AA

enum pLastpos
{
	pLastVW = 0,
	pLastInt = 0,
	Float:pLastposx,
	Float:pLastposy,
	Float:pLastposz,
}

new PlayerLastPos[MAX_PLAYERS][pLastpos];

public OnFilterScriptInit()
{
	print("Advanced GotoCoords Golimad's script loaded.");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

CMD:coordhelp(playerid, params[])
{
    SendClientMessage(playerid, 0xFF0000AA, "----- Gotocoord Golimad's Script Help -----");
    SendClientMessage(playerid, 0xFF0000AA, "-----      /gotocoord and /goback     -----");
	return 1;
}

CMD:goback(playerid, params[])
{
	SetPlayerPos(playerid, PlayerLastPos[playerid][pLastposx], PlayerLastPos[playerid][pLastposy], PlayerLastPos[playerid][pLastposz]);
	SetPlayerVirtualWorld(playerid, PlayerLastPos[playerid][pLastVW]);
	SetPlayerInterior(playerid, PlayerLastPos[playerid][pLastInt]);
    SendClientMessage(playerid, COLOR_LIGHTNBLUE, "Your position has been reset back to the last position.");
	return 1;
}
CMD:gotocoord(playerid, params[])
{
    if(IsPlayerAdmin(playerid))
	{
		new Float:lastx, Float:lasty, Float:lastz;
        GetPlayerPos(playerid, lastx, lasty, lastz);
        PlayerLastPos[playerid][pLastposx] = lastx;
        PlayerLastPos[playerid][pLastposy] = lasty;
        PlayerLastPos[playerid][pLastposz] = lastz;
        PlayerLastPos[playerid][pLastVW] = GetPlayerVirtualWorld(playerid);
		PlayerLastPos[playerid][pLastInt] = GetPlayerInterior(playerid);
        
		new Float:x, Float:y, Float:z, virtualw, interior;
		if (!sscanf(params, "fffD(0)D(0)", x, y, z, virtualw, interior))
		{
	 		new string[128];
	    	SetPlayerPos(playerid, x, y, z);
			SetPlayerVirtualWorld(playerid, virtualw);
	    	format(string, sizeof(string), "Coords changed to : {ffff00}%f, %f, %f, {ffffff}VW : %d, Interior : %d.", x, y, z, virtualw, interior);
	    	SendClientMessage(playerid, COLOR_LIGHTNBLUE, string);
	    	return 1;
		}
		else SendClientMessage(playerid, 0xFF0000AA, "{ffffff}=>Usage: {ffff00}/gotocoord <X> <Y> <Z> {ffffff} <VirtualWorld(Optional)> <Interior(Optional)>");
	}
	else SendClientMessage(playerid, 0xFF0000AA, "You're not allowed to use this command.");
 	return 1;
}

