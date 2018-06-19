/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoRequest.sqf
	Beschreibung:
		Sucht in der DB nach Einträgen für den Personalausweis je nach Fraktion.
		
	Nutzungsbedindungen, siehe "License-FvS.txt"
*/
params [
	["_uid","",[""]],
	["_side",sideUnknown,[sideUnknown]],
	["_player",objNull,[objNull]]
];

if(isNull _player) exitWith {}; // Gibt's nicht

_query = switch(_side) do
{
	case west:
	{
		format["SELECT persoCop FROM perso WHERE pid='%1'",_uid];
	};
	case independent:
	{
		format["SELECT persoMed FROM perso WHERE pid='%1'",_uid];
	};
	case civilian:
	{
		format["SELECT persoCiv FROM perso WHERE pid='%1'",_uid];
	};
	case east:
	{
		format["SELECT persoEast FROM perso WHERE pid='%1'",_uid];
	};
};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_ergebnis = [_queryResult select 0] call DB_fnc_mresToArray;

// Existiert ein EIntrag oder nicht
if(count _queryResult == 0) exitWith {
	_query_2 = format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	[_query_2,_player] spawn {
		[_this select 0,1] call DB_fnc_asyncCall;
		[] remoteExecCall ["fvs_fnc_persoNeu",(owner (_this select 1))];
	};
};
[_ergebnis] remoteExecCall ["fvs_fnc_persoErgebnis",(owner _player)];