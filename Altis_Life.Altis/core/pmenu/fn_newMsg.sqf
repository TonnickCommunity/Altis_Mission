#include "..\..\script_macros.hpp"
/*
file: fn_newMsg.sqf	
Author: Silex	
*/
private["_to","_type","_playerData","_msg"];
disableSerialization;
_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;
switch(_type) do{	
 case 0:	{ 
 life_smartphoneTarget = call compile format["%1",_playerData];
 ctrlSetText[88886, format["message: %1",name life_smartphoneTarget]];
 if((FETCH_CONST(life_adminlevel) < 1)) then {
 ctrlShow[888897,false];
 };
 };
 //normal message	
 case 1:	{ 
 if(isNUll life_smartphoneTarget) exitWith {hint format["Du hast keine Bürger ausgwählt!"];
};
 ctrlShow[88885, false];
 if(_msg == "") exitWith {hint "Du muss eine Nachricht zum senden eingeben!";
 ctrlShow[88885, true];
};
[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
 hint format["Du hast %1 eine Nachricht gesendet: %2",name life_smartphoneTarget,_msg];
 ctrlShow[88885, true];
 closeDialog 88883;
 };
 //copmessage	
 case 2:	{ if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Momentan ist die Polizei nicht erreichbar. Bitte versuche es später erneut!"];
};
 ctrlShow[888895,false];
 if(_msg == "") exitWith {hint "Du musst eine Nachricht zum senden eingeben!";
 ctrlShow[888895,true];
};
[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
 _to = "Police";
 hint format["Du hast %1 eine Nachricht gesendet: %2",_to,_msg];
 ctrlShow[888895,true];
 closeDialog 887890;
 };
 //msgadmin	
 case 3:	{ ctrlShow[888896,false];
 if(_msg == "") exitWith {hint "Du muss eine Nachricht zum senden eingeben!";
 ctrlShow[888896,true];
};
[ObjNull,_msg,player,2] remoteExec ["TON_fnc_handleMessages",2];
 _to = "The Admins";
 hint format["Du hast %1 eine Nachricht geschrieben: %2",_to,_msg];
 ctrlShow[888896,true];
 closeDialog 887890;
 };
 //emsrequest	
 case 4:	{ if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Momentan ist der Rettungsdienst nicht erreichbar. Bitte versuche es später erneut!"];
};
 ctrlShow[888899,false];
 if(_msg == "") exitWith {hint "Du musst eine Nachricht zum senden eingeben!";
 ctrlShow[888899,true];
};
[ObjNull,_msg,player,3] remoteExec ["TON_fnc_handleMessages",2];
 hint format["Du hast einen Notruf an den Rettungsdienst abgesendet",_msg];
 ctrlShow[888899,true];
 closeDialog 887890;
 };
 //adminToPerson	
 case 5:	{ if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Administrator!";
};
 if(isNULL life_smartphoneTarget) exitWith {hint format["Du hast keinen Bürger ausgewählt!"];
 };
 if(_msg == "") exitWith {hint "Du musst eine Nachricht zum senden eingeben!";
 };
[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages",2];
 hint format["Admin nachricht gesendet von: %1 - Nachricht: %2",name life_smartphoneTarget,_msg];
 closeDialog 88883;
 };
 //emergencyloading	
 case 6:	{ if((FETCH_CONST(life_adminlevel) < 1)) then {
 ctrlShow[888898,false];
 ctrlShow[888896,true];
 } else { 
 ctrlShow[888898,true];
 ctrlShow[888896,false];
 };
 };
 //adminMsgAll	
 case 7:	{ if((FETCH_CONST(life_adminlevel) < 1)) exitWith {hint "Du bist kein Admin!";
};
 if(_msg == "") exitWith {hint "Du musst eine Nachricht zum senden eingeben!";
 };
[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages",2];
 hint format["A message sent to all admins: %1",_msg];
 closeDialog 887890;
 };
};