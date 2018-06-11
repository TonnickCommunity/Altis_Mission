/**
 * fn_schiessplatz_start.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @author ProteusSepctrum
 * @copyright 2018 ProteusSepctrum 
 *
 * Dieses Script sorgt dafür, dass die Spieler eine Schiessübung machen müssen, um den Waffenschein zu erhalten
 */
#include "..\..\script_macros.hpp";
hit = 0;

_Statusabfrage = allPlayers select {_x getVariable ["Statusgunrange",false]};
_statusrange = (count _Statusabfrage);
if (license_civ_gun) exitWith {hint "Du hast schon eine Waffenlizenz!";};
if(_statusrange >= 1) exitWith {hint "Es tut uns leid, leider können wir nur eine Person prüfen. Kommen sie ein anderes mal wieder oder warten sie ein paar Minuten";};
if (CASH < 5000 ) exitWith {hint"Du hast nicht genügend Geld um die Prüfung anzutreten! Du benötigst 5000$";};
if (!((handgunWeapon player) isEqualTo "")) exitWith {hint "Lege deine Waffe weg du bist nicht berechtigt diese zu tragen! Dich prüfen wir nicht";};
if (!((primaryWeapon player) isEqualTo "")) exitWith {hint "Lege deine Waffe weg du bist nicht berechtigt diese zu tragen! Dich prüfen wir nicht!";};

player setVariable ["Statusgunrange",true, true];
CASH = CASH - 5000;
hint "Du hast 5000$ für die Waffenschein-Prüfung ausgegeben!";
sleep 2;
hint "Begebe dich auf die Startposition!";
sleep 2;
hint "Du hast 15 Sekunden Zeit um auf die Startposition zu gehen!";
sleep 2;
_timeleft = 15;
while {_timeleft >= 0} do {
 hintsilent format ["Prüfung startet in %1", [((_timeleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
 _timeleft = _timeleft -1;
 sleep 1;
};
if ((player distance (getMarkerPos "start_1")) < 4) then {
 for "_i" from 1 to 2 do {player addMagazine "16Rnd_9x21_Mag";};
 player addWeapon "hgun_P07_khk_F";

 nopop = true;
 trueVar = false;
 timeleft = 20;
 hit = 0;
 target1 animate["terc",1];
 target2 animate["terc",1];
 target3 animate["terc",1];
 target4 animate["terc",1];
 target5 animate["terc",1];
 target6 animate["terc",1];
 target7 animate["terc",1];
 target8 animate["terc",1];
 
 target1 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target2 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target3 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target4 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target5 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target6 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target7 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 target8 addMPEventHandler ["MPHit", {hit = hit + 1;}];
 
 []spawn 
 {
 while {timeleft > 0} do 
 {
 hintsilent format ["Verbleibende Zeit %1", [((timeleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
 timeleft = timeleft - 1;
 sleep 1;
 };
 [] spawn life_fnc_schiessplatz_end;
 };
 []spawn 
 {
 while {timeleft > 0} do 
 {
 _target = [];
 _target = [target1,target2,target3,target4,target5,target6,target7,target8] call BIS_fnc_selectRandom;
 _target animate["terc",0];
 sleep 1.5;
 hint format ["%1 Treffer.",hit];
 _target animate["terc",1];
 };
 };
 
} else {
 _handle = [] spawn life_fnc_schiessplatz_end;
 hint "Du hast warst nicht an der Startposition!"; 
 CASH = CASH + 5000;
};