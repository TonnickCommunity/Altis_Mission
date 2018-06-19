/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateMonat.sqf
	Beschreibung:
		Dient mit zur Überprüfung ob Schaltjahr sowie der Freigabe der Tage am Ende
		
	Nutzungsbedindungen, siehe "License-FvS.txt"
*/
disableSerialization;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler";};
_display = findDisplay 60000;
_lb_bdayTagList = _display displayCtrl 60007;
_lb_bdayMonatList = _display displayCtrl 60008;
lbClear _lb_bdayMonatList;
lbClear _lb_bdayTagList;
for "_bM" from 1 to 12 do
{
	_lb_bdayMonatList lbAdd format["%1",_bM];
	_lb_bdayMonatList lbSetValue [(lbSize _lb_bdayMonatList)-1,_bM];
};
lbSetCurSel [60008,0];
