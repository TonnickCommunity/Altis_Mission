/**
 * fn_schiessplatz_end.sqf
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
nopop = false;
trueVar = false;
out = false;
player setVariable ["Statusgunrange",false, true];
if (hit >= 8) then {
 hint "Du hast deine Prüfung bestanden und besitzt nun den Waffenschein!"; 
 license_civ_gun = true;
} else {
 hint "Du hast deine Prüfung nicht bestanden bitte übe noch etwas!"; 
};
hit = 0;
player removeWeapon "hgun_P07_khk_F";
player removeMagazines "16Rnd_9x21_Mag";
timeleft = 20;
target1 animate["terc",0];
target2 animate["terc",0];
target3 animate["terc",0];
target4 animate["terc",0];
target5 animate["terc",0];
target6 animate["terc",0];
target7 animate["terc",0];
target8 animate["terc",0];

target1 removeAllMPEventHandlers "MPHit";
target2 removeAllMPEventHandlers "MPHit";
target3 removeAllMPEventHandlers "MPHit";
target4 removeAllMPEventHandlers "MPHit";
target5 removeAllMPEventHandlers "MPHit";
target6 removeAllMPEventHandlers "MPHit";
target7 removeAllMPEventHandlers "MPHit";
target8 removeAllMPEventHandlers "MPHit";