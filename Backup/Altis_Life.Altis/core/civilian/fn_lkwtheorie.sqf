#include "..\..\script_macros.hpp";
/**
 * fn_lkwtheorie.sqf
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
if(!license_civ_driver) exitWith {hint "Du brauchst zuerst den PKW-Führerschein!";};
if(license_civ_trucking) exitWith {hint "Du besitzt bereits den LKW-Führerschein!";};
if(CASH < 1550) exitWith {hint format ["Du hast nicht genug Geld dabei! Dir fehlen $%1 um an der Prüfung teilzunehmen!!", (1550 - CASH)];};
createDialog "life_lkw_theorie";
	if(!dialog) then {
		createDialog "life_lkw_theorie";
	};
	CASH = (CASH - 1550);
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
		
		waitUntil {!isNull findDisplay 56460};
		_display = findDisplay 56460;
		_aufgabe = _display displayCtrl 56461;	//FRAGE FELD
		_button1 = _display displayCtrl 56462;	//ANTWORT 1
		_button2 = _display displayCtrl 56463;	//ANTWORT 2
		_button3 = _display displayCtrl 56464;	//ANTWORT 3
		
		_anzeige = _display displayCtrl 56465;	//ANZEIGE FRAGEN
		_punkt = _display displayCtrl 56467;	//ANZEIGE FEHLER
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
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Müssen Sie als Unfallbeteiligter ihr Fahrzeug beiseite fahren?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Ja, bei geringfügigem Schaden</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Ja, auf jeden Fall</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Nein, in keinem Fall</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 1:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Schild oben links (Bild 1)?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Durchfahrt für Kraftfahrzeuge über 3,5 Tonnen verboten</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>LKW´s ab 7,5 Tonnen verboten</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Durchfahrt trotz allem erlaubt</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
			};
			case 2:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='2' align='center'>Sie fahren mit 30 km/h. Dabei beträgt der Bremsweg bei einer normalen Bremsung 9 Meter nach der Faustformel. Wie lang ist der Bremsweg unter gleichen Bedingungen bei 60 km/h?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>36 Meter</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>18 Meter</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>27 Meter</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
			};
			case 3:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Verkehrsschild unten links (Bild 2)?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich muss einen Sicherheitsabstand von mindestens 70m einhalten</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Ein optionaler Sicherheitsabstand</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Braucht man nicht beachten, einfach ignorieren</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
			};
			case 4:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='2' align='center'>Sie planen ihre Route und müssen an zwei Stationen umladen. Was ist zu beachten?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Startort, Zielort, Reihenfolge der Zwischenstationen, Ladezeiten, Fahrtunterbrechungen</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Startort, Zielort, Höchstgeschwindigkeit</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Startort, Zielort, Fahrgeschwindigkeit, Ladezeiten</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 5:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wo müssen Sie an einer Ampel mit einem grünen Pfeil anhalten?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>An der Haltelinie</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Es muss nicht gehalten werden</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Sofern keine Haltelinie vorhanden ist, darf ich bis zur Kreuzung vor fahren</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 5:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Verkehrsschild oben rechts (Bild 3) ?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Durchfahrt verboten für Lastwagen, die schwerer als 5,5 Tonnen tatsächliches Gewicht sind.</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Alle Lastwagen die schwerer sein dürfen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Jeder darf durchfahren</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 6:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Worauf stellen Sie sich ein, wenn am Fahrbahnrand ein halber Meter Schnee liegt?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Die Fahrbahn ist vergengt, Fußgänger laufen auf der Fahrbahn</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Fußgänger laufen nur außerhalb der Fahrbahn</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Auf Fußgänger brauche ich hier nicht beachten</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
			case 7:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie schnell dürfen Sie (Solo-Fahrzeug) außerhalb geschlossener Ortschaften höchstens fahren?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>80 km/h</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>100 km/h</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>70 km/h</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 3;';
			};
			case 8:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie verhalten Sie sich bei einem geschlossenen Bahnübergang?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich halte vor dem Andreas-Kreuz und lasse Einmündungen frei und schalte bei Dunkelheit auf Standlicht</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Nutze den Freiraum aus und halte direkt an der Schranke</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich schalte mein Fernlicht an, um mit anderen zu kommunizieren</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 3;';
			};
			case 9:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was bedeutet das Schild unten rechts (Bild 4) ?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Ab hier muss mit Schneeketten gefahren werden</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Eine optionale Sicherheitsangabe</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Zählt nur für Fahrzeuge über 7,5 Tonnen</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 4;';
			};
			case 10:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was müssen Sie beim Transport von Ladung beachten?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Sie darf beim Bremsen nicht nach vorne rutschen und mich nicht behindern</t>";
				_button2 buttonSetAction 'life_frage = true; ';
				
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Sie darf nicht nach vorne hinaus ragen</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 5;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich darf keine Ladung transportieren</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 5;';
			};
			case 11:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Warum darf man nicht unnötig langsam fahren?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Weil der Verkehrsfluss behindert wird, die Gefahr von Auffahrunfällen wird erhöht und Nachfolgende zum gefährlichen Überholen angeregt werden</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>Verkehrsfluss wird nicht behindert</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Um Sprit zu sparen</t>";
				_button3 buttonSetAction 'life_falsch1 = true; punkte = punkte + 4;';
			};
			case 12:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wodurch kann man auch mit Abblendlicht geblendet werden?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='1' align='center'>Falsche Beladung, falsch eingesetzte Glühlampen, zu hoch eingestellte Scheinwerfer</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button2 ctrlSetStructuredText parseText "<t size='1' align='center'>falsche Glühlampen</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>zu hoch eingestellte Scheinwerfer</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 13:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Warum sollten die Reifen regelmäßig kontrolliert werden?</t>";	
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Da diese bei einer Vollbremsung zum Verhängnis werden können</t>";
				_button2 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Braucht man nicht kontrollieren</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 5;';
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Es ist gesetzlich vorgeschrieben</t>";
				_button3 buttonSetAction 'life_falsch1 = true; punkte = punkte + 5;';
			};
			case 14:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Ein Teil der Straße ist vor ihnen vereißt. Was sollten Sie vermeiden?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Bremsen, ruckartiges Lenken, Beschleunigen</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Beschleunigen, Bremsen</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>kann alles wie gewohnt machen</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
			};
			case 15:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Was muss beim Antrag einer Fahrerkarte vorgelegt werden?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Kartenführerschein, Passbild</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Kartenführerschein</t>";
				_button1 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich brauche nichts vorlegen</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 16:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='2' align='center'>Welche Höhe einschließlich Ladung darf nicht überschritten werden (ausgenommen Landwirtschaft)?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>4,0 Meter</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>4,5 Meter</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Es gibt keine maximale Höhe</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 1;';
			};
			case 17:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Welche Bedeutung hat ein 'A'-Schild auf einem LKW?</t>";	
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Es steht für Abfalltransport</t>";
				_button1 buttonSetAction 'life_frage = true;';
				
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>Es hat keine weitere Bedeutung</t>";
				_button3 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Es steht für Abgasarm</t>";
				_button2 buttonSetAction 'life_falsch = true; punkte = punkte + 2;';
			};
			case 18:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='2' align='center'>Sie möchten eine Vorfahrtsstraße überqueren, nur die Sicht ist auf beiden Seiten durch parkende Fahrzeuge stark beschränkt. Wie verhalten Sie sich?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='1' align='center'>Ich taste mich ganz langsam und vorsichtig in die Kreuzung hinein</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich überquere die Kreuzung zügig</t>";
				_button1 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Ich warne den möglichen Verkehr durch Hupen</t>";
				_button2 buttonSetAction 'life_falsch1 = true; punkte = punkte + 2;';
			};
			case 19:
			{
				_aufgabe ctrlSetStructuredText parseText "<t size='3' align='center'>Wie soll man schalten, um möglichst umweltbewusst zu fahren?</t>";	
				_button3 ctrlSetStructuredText parseText "<t size='2' align='center'>möglichst früh hochschalten</t>";
				_button3 buttonSetAction 'life_frage = true;';
				
				_button1 ctrlSetStructuredText parseText "<t size='2' align='center'>so spät wie möglich hochschalten</t>";
				_button1 buttonSetAction 'life_falsch = true;';
				_button2 ctrlSetStructuredText parseText "<t size='2' align='center'>Gang bis zum obersten Drehzahlbereich ausfahren</t>";
				_button2 buttonSetAction 'life_falsch = true;';
			};
		};
		
		waitUntil{(life_frage)||(life_falsch)||(life_falsch1)|| ((time - _startTime)  > 30) || (!dialog)};
				
		if(!dialog) exitWith {
			hint format ["Du hast die theoretische Prüfung abgebrochen!!"];
			license_civ_trucking = false;
		};
		if((time - _startTime) > 30) then {punkte = (punkte + 1);};
		_select = _select + 1;
	};
	
	if(_select == 10) then 
	{	
		closeDialog 0;
		if(punkte > 10) exitWith {hint format ["Du hast die theoretische Prüfung nicht bestanden, da du %1 Fehlerpunkte zu viel erreichst hast und du maximal 10 Fehlerpunkte haben durftest!!",(punkte - 10)]; license_civ_trucking = false;};
		hint format ["Herzlichen Glückwunsch! Du hast die theoretische Prüfung mit %1 Fehlerpunkten bestanden!",punkte];
		license_civ_trucking = true;
	};
