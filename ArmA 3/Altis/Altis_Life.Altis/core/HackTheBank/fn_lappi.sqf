#include "..\..\script_macros.hpp"
/*
	HACK THE BANK!
	Autor: stolzerrabe
	modify by: Kuchenplatte.com
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	-- This Code based on Tonic´s "fn_SpikeTrip.sqf"
	
	It let you deploy a Laptop on to a Table
*/

private["_Lappi","_table"];
if(isNil "HackBankCam")	then {HackBankCam = 0;};
_Lappi = "Land_Laptop_unfolded_F" createVehicle position player;
_Lappi attachTo [player,[0,1.5,1.1]];
_Lappi setDir 180;
_Lappi setVariable["LappiDragged","Dragged",true];


life_action_placeLappi = player addAction["Laptop platzieren",{if(!isNull life_theLappi) then 
		{ 
		
		
			_table = nearestObject[player, "Land_TablePlastic_01_F"]; 			
			detach life_theLappi;
			life_theLappi attachTo[_table,[0,0.4,0.61]];
			life_theLappi setDir 180;
			life_theLappi = ObjNull;
			
		};	
		player removeAction life_action_placeLappi; 
		life_action_placeLappi = nil;
		},"",999,false,false,"",'!isNull life_theLappi'];
		
		life_theLappi = _Lappi;
		waitUntil {isNull life_theLappi};
		if(!isNil "life_action_placeLappi") then {player removeAction life_action_placeLappi;};
		if(isNull _Lappi) exitWith {life_theLappi = ObjNull;};
	
_Lappi enablesimulation false;
_Lappi setDamage 0;
_Lappi allowDamage false;


	life_action_pickupLappi = player addAction["<t color='#00FF00'>Laptop einpacken</t>",life_fnc_packupLappi,"",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
	life_action_HTBNow = player addAction["<t color='#FF0000'>Hacke die Bank</t>",life_fnc_hackthebank,"",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			

[]spawn 
{
		waitUntil {HackBankCam == 1};
		if(HackBankCam == 1)then
		{
			life_action_BankCamHacked1 = player addAction["<t color='#c70099'>BankCam Haupteingang</t>",life_fnc_fedCamHacked,"front",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			life_action_BankCamHacked2 = player addAction["<t color='#c70099'>BankCam Seiteneingang</t>",life_fnc_fedCamHacked,"side",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			life_action_BankCamHacked3 = player addAction["<t color='#c70099'>BankCam Hintereingang</t>",life_fnc_fedCamHacked,"back",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			life_action_BankCamHacked4 = player addAction["<t color='#c70099'>BankCam Innen</t>",life_fnc_fedCamHacked,"vault",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			life_action_BankCamHacked5 = player addAction["<t color='#c70099'>BankCam Ausschalten</t>",life_fnc_fedCamHacked,"off",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
		};
};			
			


