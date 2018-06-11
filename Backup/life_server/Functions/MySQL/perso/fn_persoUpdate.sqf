/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoUpdate.sqf
	Beschreibung:
		Aktualisiert die Personalausweisdaten in der DB.
		
	Nutzungsbedindungen, siehe "License-FvS.txt"
*/
params [
	["_insert",[],[[]]],
	["_uid","",[""]],
	["_side",sideUnknown,[sideUnknown]],
	["_player",objNull,[objNull]]
];

if(isNull _player) exitWith {}; // Spieler gibts nicht

_insert = [_insert] call DB_fnc_mresArray;

_query = switch(_side) do
{
	case west:
	{
		format["UPDATE perso SET persoCop='%1' WHERE pid='%2'",_insert, _uid];
	};
	case independent:
	{
		format["UPDATE perso SET persoMed='%1' WHERE pid='%2'",_insert, _uid];
	};
	case civilian:
	{
		format["UPDATE perso SET persoCiv='%1' WHERE pid='%2'",_insert, _uid];
	};
	case east:
	{
		format["UPDATE perso SET persoeast='%1' WHERE pid='%2'",_insert, _uid];
	};
};
[_query,1] call DB_fnc_asyncCall;