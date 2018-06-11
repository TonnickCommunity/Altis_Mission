//LKW-Theorie-Info
class life_info_theorie {
    idd = 56440;
    name = "life_info_theorie";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscText
        {
            idc = -1;
            text = "";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.6 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls {
        class Title: Life_RscText
        {
            idc = -1;
            text = "Informationen zur Theoretischen Prüfung - PKW";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.07 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_One: Life_RscText
        {
            idc = -1;
            text = "1. Die Theoretische Prüfung kostet 550$ und ist bei Beginn der Prüfung zu bezahlen. ";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.23 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Two: Life_RscText
        {
            idc = -1;
            text = "2. Das Geld wird nicht zurückerstattet, falls Sie die Prüfung abbrechen oder versuchen zu betrügen. ";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Three: Life_RscText
        {
            idc = -1;
            text = "3. Jeder Versuch, sich mit illegalen Mitteln einen Vorteil zu verschaffen ist zwecklos und wird mit einem Ausschluss bestraft";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.36 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Four: Life_RscText
        {
            idc = -1;
            text = "4. Sollten Sie mehr als 10 Fehlerpunkte haben, wird die Prüfung als Nichtbestanden gekennzeichnet";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.44 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Five: Life_RscText
        {
            idc = -1;
            text = "5. Sie müssen jede Frage nacheinander beantworten. Sie haben keine Chance, noch einmal zu der letzten Frage zurückzukehren!";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.52 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Six: Life_RscText
        {
            idc = -1;
            text = "6. Sie haben für jede Frage 30 Sekunden Zeit, um Sie zu beantworten!";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Prufung_start: Life_RscButtonMenu
        {
            idc = -1;
            text = "Ich habe die Informationen gelesen und fühle mich bereit.";
            x = 0.42 * safezoneW + safezoneX;
            y = 0.69 * safezoneH + safezoneY;
            w = 0.37 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {0,0.501960,0,1};
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; [] spawn life_fnc_pkwtheorie;";
        };
        class Abbruch_button: Life_RscButtonMenu
        {
            idc = -1;
            text = "Prüfung abbrechen";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.69 * safezoneH + safezoneY;
            w = 0.17 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {1,0,0,1};
			onButtonClick = "closeDialog 0; hint ""Du hast nicht an der Prüfung teilgenommen!"";";
            ColorText[] = {1,1,1,1};
        };
    };
};
//LKW-Theorie-Info
class life_info_theorie2 {
    idd = 56470;
    name = "life_info_theorie2";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscText
        {
            idc = -1;
            text = "";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.6 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls {
        class Title: Life_RscText
        {
            idc = -1;
            text = "Informationen zur Theoretischen Prüfung - LKW";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.07 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_One: Life_RscText
        {
            idc = -1;
            text = "1. Die Theoretische Prüfung kostet 1.550$ und ist bei Beginn der Prüfung zu bezahlen.";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.23 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Two: Life_RscText
        {
            idc = -1;
            text = "2. Das Geld wird nicht zurückerstattet, falls Sie die Prüfung abbrechen oder versuchen zu betrügen. ";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Three: Life_RscText
        {
            idc = -1;
            text = "3. Jeder Versuch, sich mit illegalen Mitteln einen Vorteil zu verschaffen ist zwecklos und wird mit einem Ausschluss bestraft";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.36 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Four: Life_RscText
        {
            idc = -1;
            text = "4. Sollten Sie 10 oder mehr Fehlerpunkte haben, wird die Prüfung als Nichtbestanden gekennzeichnet";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.44 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Five: Life_RscText
        {
            idc = -1;
            text = "5. Sie müssen jede Frage nacheinander beantworten. Sie haben keine Chance, noch einmal zu der letzten Frage zurückzukehren!";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.52 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Text_Six: Life_RscText
        {
            idc = -1;
            text = "6. Sie haben für jede Frage 30 Sekunden Zeit, um Sie zu beantworten!";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.08 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {1,1,1,1};
        };
        class Prufung_start: Life_RscButtonMenu
        {
            idc = -1;
            text = "Ich habe die Informationen gelesen und fühle mich bereit.";
            x = 0.42 * safezoneW + safezoneX;
            y = 0.69 * safezoneH + safezoneY;
            w = 0.37 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {0,0.501960,0,1};
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; [] spawn life_fnc_lkwtheorie;";
            colorFocused[] = {0.678431,1,0.184313,1};
            colorDisabled[] = {0,0,0,1};
        };
        class Abbruch_button: Life_RscButtonMenu
        {
            idc = -1;
            text = "Prüfung abbrechen";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.69 * safezoneH + safezoneY;
            w = 0.17 * safezoneW;
            h = 0.05 * safezoneH;
            ColorBackground[] = {1,0,0,1};
			onButtonClick = "closeDialog 0; hint ""Du hast nicht an der Prüfung teilgenommen!"";";
            ColorText[] = {1,1,1,1};
            colorFocused[] = {0.647058,0.164705,0.164705,1};
            colorDisabled[] = {0,0,0,1};
        };
    };
};

