#include "..\..\script_macros.hpp";
/**
 * fn_pkwtheorie.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @author     ProteusSpectrum
 * @copyright  2016 ProteusSpectrum
 */
 disableSerialization;
_frage = 0;
_select = 0;
_startTime = time;
_timer = 0;
punkte = 0;
_fragennr = [];
if(license_civ_driver) exitWith {hint "Du besitzt bereits den PKW-Führerschein!";};
if(CASH < 550) exitWith {hint format ["Du hast nicht genug Geld dabei! Dir fehlen $%1 um an der Prüfung teilzunehmen!!", (550 - CASH)];};
createDialog "life_pkw_theorie";
	if(!dialog) then {
		createDialog "life_pkw_theorie";
	};
	CASH = (CASH - 550);
	while {_select < 10} do
	{
		_startTime = time;
		_frage = (round random 20);
		if(_frage == 0) then {_frage = 1;};
		_frage = (_frage-1);

		while {(_frage in _fragennr)} do
		{
			_frage = (round random 20);
			if(_frage == 0) then {_frage = 1;};
			_frage = (_frage-1);
		};
		_fragennr pushBack _frage;

		waitUntil {!isNull findDisplay 56450};
		_display = findDisplay 56450;
		_aufgabe = _display displayCtrl 56451;	//FRAGE FELD
		_button1 = _display displayCtrl 56452;	//ANTWORT 1
		_button2 = _display displayCtrl 56453;	//ANTWORT 2
		_button3 = _display displayCtrl 56454;	//ANTWORT 3

		_anzeige = _display displayCtrl 56455;	//ANZEIGE FRAGEN
		_punkt = _display displayCtrl 56456;	//ANZEIGE FEHLER
		life_frage = false;
		life_falsch = false;
		life_falsch1 = false;

		lbClear _aufgabe;
		lbClear _button1;
		lbClear _button2;
		lbClear _button3;

		_aufg = _select + 1;
		_anzeige ctrlSetStructuredText parseText format["<t size='1' color='#40FF00' align = 'center'>Frage: %1 / 10</t>",_aufg];
		_punkt ctrlSetStructuredText parseText format["<t size='1' color='#BF0000' align = 'center'>Fehlerpunkte: %1</t>",punkte];

		switch (_frage) do
		{
			case 0:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Welche Verkehrsregel gilt bei einer Kreuzung ohne Verkehrsschilder?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Rechts vor Links</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Links vor Rechts</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Augen zu und durch</t>";
				_button3 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
			};
			case 1:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Schild oben links (Bild 1)?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Kraftfahrzeuge verboten</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>PKW´s verboten</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Fahrzeuge verboten</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 2:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie schnell darf ich innerorts, sofern nichts anderes ausgeschildert, fahren?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>50 km/h</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>100 km/h</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>30 km/h</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
			};
			case 3:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Verkehrsschild unten links (Bild 2)?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>STOP! Sofern Haltelinie vorliegt 3 Sekunden halten, ansonsten 3 Sekunden an der Sichtlinie halten.</t>";
				_button3 buttonSetAction 'life_frage = true; ';

				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Halten und sofort weiterfahren</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Braucht man nicht beachten, einfach ignorieren</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
			case 4:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wann darf ich innerorts die Hupe benutzen?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>um vor Gefahren zu warnen</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>um andere Bürger zu begrüßen</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>um einen Überholvorgang anzukündigen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 5:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Sie nähern sich einem unbeschranktem Bahnübergang und sehen einen Zug anfahren. Wo halten Sie?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Vor dem Andreaskreuz</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Genau vor dem Bahnübergang</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Auf dem Bahnübergang</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 5:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Verkehrsschild oben rechts (Bild 3) ?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>absolutes Parkverbot</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Halten verboten</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Hat keine Bedeutung für mich</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
			case 6:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was muss ich im Winter bei gefrorenen Fenstern machen?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Sie von dem Eis befreien, um ein gutes Sichtfeld in alle Richtungen zu haben</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Teilweise freikratzen, um zumindest nach vorne was zu sehen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Garnichts, denn das Eis geht von alleine weg</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 7:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie schnell dürfen Sie außerhalb geschlossener Ortschaften höchstens fahren?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>100 km/h</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>130 km/h</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>es gibt keine Geschwindigkeitsbegrenzung</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
			};
			case 8:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wann dürfen Sie ihre Nebelscheinwerfer einschalten?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Bei Nebel und einer Sicht von weniger als 50m nach vorne</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Bei Nebel, Regen, Sturm, immer bei schlechtem Wetter</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich darf Sie immer einschalten</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 9:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Schild unten rechts (Bild 4) ?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Durchfahrt verboten</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Hat für mich keine große Bedeutung</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 5;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Zählt für Fahrzeuge über 3,5 Tonnen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 5;';
			};
			case 10:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Bis wieviel Tonnen darf ich mit diesem Führerschein fahren?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>3,5 Tonnen</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>7,5 Tonnen</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>2,8 Tonnen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 11:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was muss ich bevor ich in einen Tunnel fahre, beachten?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Das ich genug Benzin übrig habe, die Sonnenbrille abnehme und das Licht einschalte</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich muss nichts beachten.</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich muss das Licht einschalten</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 12:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wann sollte ich mein Abblendlicht einschalten?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Sobald die Dämmerung beginnt und es Dunkel wird, um immer gut erkennbar zu sein</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Erst wenn es Dunkel ist</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Wofür Licht? Verbraucht doch nur Strom</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
			};
			case 13:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wann darf ich den Warnblinker benutzen?</t>";
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Wenn ich jemanden vor einer Gefahrenzone warnen möchte oder vor einem Stauende</t>";
				_button2 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Darf ich immer benutzen</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Wenn ich meinen Hintermann begrüßen möchte</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
			case 14:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wann muss ich blinken?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich muss immer blinken, wenn ich abbiege</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Der Blinker ist unnötig, braucht kein Mensch</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich muss nur ab und zu blinken</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 15:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wo darf ich parken?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Auf gekennzeichneten Parkflächen</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Auf der gesamten Straße</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 1;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Auf dem Gehweg</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 1;';
			};
			case 16:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie viele Personen darf ich mitnehmen?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich darf soviele Personen mitnehmen, wie ich auch Sicherheitsgurte, die in Ordnung sind, habe</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Soviele wie in mein Auto passen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Soviele wie ich Sitze im Auto habe</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 17:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was muss ich bei einer Polizeikontrolle dabei haben?</t>";
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Führerschein, Personalausweis, Fahrzeugschein</t>";
				_button1 buttonSetAction 'life_frage = true;';

				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Fahrzeugschein, Fahrzeugbrief, Führerschein</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Nichts, denn ich bin dazu nicht verpflichtet</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
			};
			case 18:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie reagieren Sie, wenn Sie als Erstes an einen Unfallort kommen.</t>";
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich halte an, um der Person zu helfen, da ich dazu verpflichtet bin</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich muss nicht helfen und fahre weiter</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich halte an, um ein paar Fotos zu schießen</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
			};
			case 19:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was müssen Sie immer im Auto haben?</t>";
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Warnweste und nicht abgelaufener Verbandskoffer</t>";
				_button3 buttonSetAction 'life_frage = true;';

				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Warnweste</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>abgelaufener Verbandskasten</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
		};

		waitUntil{(life_frage)||(life_falsch)||(life_falsch1)|| ((time - _startTime)  > 30) || (!dialog)};

		if(!dialog) exitWith {
			hint format ["Du hast die theoretische Prüfung abgebrochen!!"];
			license_civ_driver = false;
		};
		if((time - _startTime) > 30) then {punkte = (punkte + 1);};
		_select = _select + 1;
	};

	if(_select == 10) then
	{
		closeDialog 0;
		if(punkte > 10) exitWith {hint format ["Du hast die theoretische Prüfung nicht bestanden, da du %1 Fehlerpunkte zu viel erreichst hast und du maximal 10 Fehlerpunkte haben durftest!!",(punkte - 10)]; license_civ_driver = false;};
		hint format ["Herzlichen Glückwunsch! Du hast die theoretische Prüfung mit %1 Fehlerpunkten bestanden!",punkte];
		license_civ_driver = true;
	};
