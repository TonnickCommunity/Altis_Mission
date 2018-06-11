//PKW-Theorie
class life_pkw_theorie {
    idd = 56450;
    name = "life_pkw_theorie";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscText
        {
            idc = -1;
            text = "";
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
            ColorBackground[] = {0.458823,0.949019,0.458823,1};
        };
    };
    class controls {
        class Title: Life_RscText
        {
            idc = -1;
            text = "Theoretische Prüfung - PKW";
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 0.08 * safezoneH;
            ColorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
        };
        class Close_Button: Life_RscButtonMenu
        {
            idc = -1;
            text = "X";
            x = 0.95 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.08 * safezoneH;
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; hint ""Du hast die Prüfung beendet!"";";
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,0.7};
        };
        class frage_field: Life_RscStructuredText
        {
            idc = 56451;
            text = "Hier wird die Frage stehen";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.3 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.25 * safezoneH;
            ColorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
        };
        class Antwort_1: Life_RscButtonMenu
        {
            idc = 56452;
            text = "Antwort 1";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.579567 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class Antwort_2: Life_RscButtonMenu
        {
            idc = 56453;
            text = "Antwort 2";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.66 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class Antwort_3: Life_RscButtonMenu
        {
            idc = 56454;
            text = "Antwort 3";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.74 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            ColorText[] = {1,1,1,1};
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class fragenanzahl_field: Life_RscStructuredText
        {
            idc = 56455;
            text = "Frage 10 von 10";
			colorBackground[] = {0,0,0,0.7};
            x = 0.2 * safezoneW + safezoneX;
            y = 0.152 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            ColorText[] = {1,1,1,1};
        };
        class fehlerpunkte_field: Life_RscStructuredText
        {
            idc = 56456;
            text = "Fehlerpunkte: 10";
			colorBackground[] = {0,0,0,0.7};
            x = 0.645 * safezoneW + safezoneX;
            y = 0.152 * safezoneH + safezoneY;
            w = 0.155 * safezoneW;
            h = 0.03 * safezoneH;
            ColorText[] = {1,1,1,1};
        };
        class abbruch_button: Life_RscButtonMenu
        {
            idc = -1;
            text = "Prüfung abbrechen";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.935 * safezoneH + safezoneY;
            w = 0.166 * safezoneW;
            h = 0.06 * safezoneH;
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; hint ""Du hast die Prüfung beendet!"";";
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class pic_1: Life_RscPicture
        {
            idc = -1;
            text = "textures\kraft_verboten.jpg";
            x = 0.025 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };
        class pic_3: Life_RscPicture
        {
            idc = -1;
            text = "textures\parkverbot.jpg";
            x = 0.825 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_one: Life_RscText
        {
            idc = -1;
            text = "Bild 1";
            x = 0.07 * safezoneW + safezoneX;
            y = 0.365 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class pic_2: Life_RscPicture
        {
            idc = -1;
            text = "textures\stopp.jpg";
            x = 0.025 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_two: Life_RscText
        {
            idc = -1;
            text = "Bild 2";
            x = 0.07 * safezoneW + safezoneX;
            y = 0.745 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class bild_three: Life_RscText
        {
            idc = -1;
            text = "Bild 3";
            x = 0.875 * safezoneW + safezoneX;
            y = 0.365 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class pic_4: Life_RscPicture
        {
            idc = -1;
            text = "textures\durchfahrt_verboten.jpg";
            x = 0.825 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_four: Life_RscText
        {
            idc = -1;
            text = "Bild 4";
            x = 0.875 * safezoneW + safezoneX;
            y = 0.745 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
    };
};
class life_lkw_theorie {
    idd = 56460;
    name = "life_lkw_theorie";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: Life_RscText
        {
            idc = -1;
            text = "";
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
            ColorBackground[] = {0.458823,0.949019,0.458823,1};
        };
    };
    class controls {
        class Title: Life_RscText
        {
            idc = -1;
            text = "Theoretische Prüfung - LKW";
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 0.08 * safezoneH;
            ColorText[] = {1,0.980392,0.980392,1};
			colorBackground[] = {0,0,0,0.7};
        };
        class Close_Button: Life_RscButtonMenu
        {
            idc = -1;
            text = "X";
            x = 0.95 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.08 * safezoneH;
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; hint ""Du hast die Prüfung beendet!"";";
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,0.7};
        };
        class frage_field: Life_RscStructuredText
        {
            idc = 56461;
            text = "Hier wird die Frage stehen";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.3 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.25 * safezoneH;
            ColorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
        };
        class Antwort_1: Life_RscButtonMenu
        {
            idc = 56462;
            text = "Antwort 1";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.579567 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class Antwort_2: Life_RscButtonMenu
        {
            idc = 56463;
            text = "Antwort 2";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.66 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class Antwort_3: Life_RscButtonMenu
        {
            idc = 56464;
            text = "Antwort 3";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.74 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.055 * safezoneH;
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class fragenanzahl_field: Life_RscStructuredText
        {
            idc = 56465;
            text = "Frage 10 von 10";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.152 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
        };
        class fehlerpunkte_field: Life_RscStructuredText
        {
            idc = 56467;
            text = "Fehlerpunkte: 0";
            x = 0.645 * safezoneW + safezoneX;
            y = 0.152 * safezoneH + safezoneY;
            w = 0.155 * safezoneW;
            h = 0.03 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
        };
        class abbruch_button: Life_RscButtonMenu
        {
            idc = -1;
            text = "Prüfung abbrechen";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.935 * safezoneH + safezoneY;
            w = 0.166 * safezoneW;
            h = 0.06 * safezoneH;
            ColorText[] = {1,1,1,1};
			onButtonClick = "closeDialog 0; hint ""Du hast die Prüfung beendet!"";";
            colorFocused[] = {0.501960,0.501960,0.501960,1};
            colorDisabled[] = {0,0,0,1};
        };
        class pic_1: Life_RscPicture
        {
            idc = -1;
            text = "textures\lkw_verboten.jpg";
            x = 0.025 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class pic_3: Life_RscPicture
        {
            idc = -1;
            text = "textures\tatgewicht.jpg";
            x = 0.825 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_one: Life_RscText
        {
            idc = -1;
            text = "Bild 1";
            x = 0.07 * safezoneW + safezoneX;
            y = 0.365 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class pic_2: Life_RscPicture
        {
            idc = -1;
            text = "textures\sicherheits.jpg";
            x = 0.025 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_two: Life_RscText
        {
            idc = -1;
            text = "Bild 2";
            x = 0.07 * safezoneW + safezoneX;
            y = 0.745 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class bild_three: Life_RscText
        {
            idc = -1;
            text = "Bild 3";
            x = 0.875 * safezoneW + safezoneX;
            y = 0.365 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
        class pic_4: Life_RscPicture
        {
            idc = -1;
            text = "textures\schnee.jpg";
            x = 0.825 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            ColorBackground[] = {1,1,1,1};
        };
        class bild_four: Life_RscText
        {
            idc = -1;
            text = "Bild 4";
            x = 0.875 * safezoneW + safezoneX;
            y = 0.745 * safezoneH + safezoneY;
            w = 0.055 * safezoneW;
            h = 0.04 * safezoneH;
            ColorBackground[] = {0,0,0,0};
            ColorText[] = {0,0,0,1};
        };
    };
};
////////////////////////////////////////////////////////////////////////////
