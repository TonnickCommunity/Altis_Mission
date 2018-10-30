/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

if(isDedicated && isNil("life_ATMhacked")) then {
	life_ATMhacked = 0;
	publicVariable "life_ATMhacked";
};

if(isDedicated && isNil("life_market_prices")) then {
	[] call life_fnc_marketconfiguration;
	diag_log "Marktpreise generiert!";
	
	"life_market_prices" addPublicVariableEventHandler {
		diag_log format["Marktpreise geupdatet! %1", _this select 1];
	};

	//Start server fsm
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

if (hasInterface) then {
	[] execVM "briefing.sqf"; //Load Briefing
	[] execVM "KRON_Strings.sqf";
};

StartProgress = true;