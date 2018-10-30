#include "..\..\script_macros.hpp"
/*
	HACK THE BANK!
	Autor: stolzerrabe
	modify by: Kuchenplatte.com
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	Based on Tonic´s FedCam
	
*/

disableSerialization;
private["_lappi","_uip","_progress","_pgText","_cP","_upp","_chancetobreakfirewall","_chancetohackATM","_chanceWantedAdd","_RANDHACKMONEY","_xx"];
if(isNil "HackOnceTimerBank") then {HackOnceTimerBank = 0;};
if(isNil "HackBankCam")	then {HackBankCam = 0;};

_lappi = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],5] select 0;

if(!(_lappi isKindOf "Land_Laptop_unfolded_F")) exitWith {};

//if(_cops <= 2) exitWith{hint format["Es müssen min. 3 Polizisten Online sein!"]; };
if(playerside != civilian) exitWith { hint "Du willst die Bank Hacken? Du bist dafür da sie zu beschützen du Idiot!"; };
if(life_action_inUse) exitWith {};
if(HackOnceTimerBank == 1) exitWith { hint "Du kannst den Rechner nur einmal hacken"; };
if(life_ATMhacked == 1) exitWith { hint "Die Zentralbank wurde bereits gehackt! Es zur Zeit kein Hackangriff möglich"; };

_random = {
	_var1 = _this select 0;
	_var2 = _this select 1;
	_ret = _var1 + random (_var2 - _var1);
	_ret = round _ret;
	_ret;
};

_chancetobreakfirewall = round(random 100);  // Chance die Firewall zu durchbrechen
_chancetohackATM = round(random 100);  // Chance die Wantedliste zu finden
_chanceWantedAdd = round(random 100); // Chance dass das Hacking zurückverfolgt wurde
_RANDHACKMONEY = [400000,900000] call _random; // GELD was erhackt wurde

HackOnceTimerBank = 1;
life_action_inUse = true;

[2,"<!> Die Zentralbank wird gehackt! <!>",false] remoteExecCall ["life_fnc_broadcast",0];

_upp = "Hacke Zentralbank...";
5 cutRsc ["life_progress","PLAIN"];
_uip = uiNameSpace getVariable "life_progress";
_progress = _uip displayCtrl 38201;
_pgText = _uip displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
	
while{true} do
{
	sleep 0.5; //3.0
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {life_action_inUse = false;}; 
	if(player distance _lappi > 5) exitWith {life_action_inUse = false;}; 
	if(life_istazed) exitWith {life_action_inUse = false;};
};

5 cutText ["","PLAIN"];
if(player distance _lappi > 5) exitWith { HackOnceTimerBank = 0; hint "Du hast dich zu weit entfernt!"; life_action_inUse = false;};  
if(!alive player) exitWith { HackOnceTimerBank = 0; life_action_inUse = false;};

if(_chancetobreakfirewall > 75) then {

	hint "Du hast die Firewall ausgeschaltet! Super! Du hast nun Zugriff aufs Banking und die Überwachungkameras der Zentralbank";
	HackBankCam = 1;
	sleep 3;

	_upp = "Installiere Banking Exploid...";
	5 cutRsc ["life_progress","PLAIN"];
	_uip = uiNameSpace getVariable "life_progress";
	_progress = _uip displayCtrl 38201;
	_pgText = _uip displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;	
	
	while{true} do
	{
		sleep 1.2; //3.0
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {life_action_inUse = false;}; 
		if(player distance _lappi > 2) exitWith {life_action_inUse = false;}; 
		if(life_istazed) exitWith {life_action_inUse = false;};
	};
	
	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	if(player distance _lappi > 2) exitWith { HackOnceTimerBank = 0; hint "Du hast dich zu weit entfernt!"; life_action_inUse = false;}; 
	if(!alive player) exitWith { HackOnceTimerBank = 0; life_action_inUse = false;};

	
	if(_chancetohackATM > 75) then {
		hint "Exploiting erfolgreich!";
		sleep 3;
		_xx = 20;
		for "_i" from 1 to 20 do
		{
			_xx = _xx - 1;
			titleText[format["Geld transfer gestartet ... %1 sek verbleibend",_xx],"PLAIN DOWN"];
			sleep 2;
			if(player distance _lappi > 2) exitWith { hint "Du hast dich zu weit entfernt! Das wars für heute!"; life_action_inUse = false; }; 
			if(life_istazed) exitWith {life_action_inUse = false;};
		};

		life_atmbank = life_atmbank + _RANDHACKMONEY;
		
		_text = format["Du konntest dir %1 Euro auf dein Konto überweisen!",_RANDHACKMONEY];
		hint _text;
		sleep 3;
		life_ATMhacked = 1;
		publicVariable "life_ATMhacked";
		life_action_inUse = false;
		
		sleep 1;

		if(_chanceWantedAdd < 65) then {
			[getPlayerUID player,name player,"1002",false] remoteExec ["life_fnc_wantedAdd"];
			[0,format["Der Hacker hat Spuren hinterlassen! %1 hat in den Computer der Notenbank eingegriffen!",name player],false] remoteExec ["life_fnc_broadcast",west];
		} else {
			[0,"Der Hacker hat keine Spuren hinterlassen!",false] remoteExec ["life_fnc_broadcast",west];
		};
		
	} else {
	
		life_action_inUse = false;
		hint "Der angegriffene Computer hat die Verbindung abgebrochen!";
		sleep 2;
		HackBankCam = 0;
		[] call life_fnc_packupLappi;
		
		if(_chanceWantedAdd < 65) then {
			[getPlayerUID player,name player,"1003",false] remoteExec ["life_fnc_wantedAdd"];
			[0,format["%1 hat versucht den Notenbank Computer zu hacken!",name player],false] remoteExec ["life_fnc_broadcast",west];
			hint "Du hast zuviele Spuren hinterlassen! Die Polizei weiss wer du bist!";
		} else {						
			[0,"Der Hacker hat keine Spuren hinterlassen!",false] remoteExec ["life_fnc_broadcast",west];
		};
	};
	
	deleteVehicle _lappi;
} else {

	life_action_inUse = false;
	HackOnceTimerBank = 0;		
	hint "Du konntest die Firewall nicht durchbrechen";
	sleep 2;
	[] call life_fnc_packupLappi;
	
	if(_chanceWantedAdd < 65) then {
		[getPlayerUID player,name player,"1003",false] remoteExec ["life_fnc_wantedAdd"];
		[0,format["%1 hat versucht den Notenbank Computer zu hacken!",name player],false] remoteExecCall ["life_fnc_broadcast",west];
		hint "Du hast zuviele Spuren hinterlassen! Die Polizei weiss wer du bist!";
	} else {
		hint "Du hast keine Spuren hinterlassen!";
	};
	
	deleteVehicle _lappi;
};