/*
	HACK THE BANK!
	Autor: stolzerrabe
	modify by: Kuchenplatte.com
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	-- This Code based on Tonic´s "fn_packupSpikes.sqf"
	
*/
private["_laptop"];
_laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0;
if(isNil "_laptop") exitWith {};

if(([true,"lappi",1] call life_fnc_handleInv)) then
{
	player removeAction life_action_pickupLappi; life_action_pickupLappi = nil;
	player removeAction life_action_HTBNow;	life_action_HTBNow = nil;
	
	if(!isNil "life_action_BankCamHacked1") then {player removeAction life_action_BankCamHacked1; life_action_BankCamHacked1 = nil;};
	if(!isNil "life_action_BankCamHacked2") then {player removeAction life_action_BankCamHacked2; life_action_BankCamHacked2 = nil;};
	if(!isNil "life_action_BankCamHacked3") then {player removeAction life_action_BankCamHacked3; life_action_BankCamHacked3 = nil;};
	if(!isNil "life_action_BankCamHacked4") then {player removeAction life_action_BankCamHacked4; life_action_BankCamHacked4 = nil;};
	if(!isNil "life_action_BankCamHacked5") then {player removeAction life_action_BankCamHacked5; life_action_BankCamHacked5 = nil;};
	
	deleteVehicle _laptop;
};