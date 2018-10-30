class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText {
			colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.293822 * safezoneW + safezoneX;
			y = 0.233902 * safezoneH + safezoneY;
			w = 0.412357 * safezoneW;
			h = 0.0219915 * safezoneH;
		};

		class MainBackground: Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.293822 * safezoneW + safezoneX;
			y = 0.255894 * safezoneH + safezoneY;
			w = 0.412357 * safezoneW;
			h = 0.604768 * safezoneH;
		};

		class etn_committedCrimes: Life_RscText {
			idc = -1;
			text = "$STR_Wanted_CommittedCrimes";
			x = 0.298976 * safezoneW + safezoneX;
			y = 0.673733 * safezoneH + safezoneY;
			w = 0.195869 * safezoneW;
			h = 0.0219915 * safezoneH;
		};
	};

	class controls {
		class Title: Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.293822 * safezoneW + safezoneX;
			y = 0.231703 * safezoneH + safezoneY;
			w = 0.412357 * safezoneW;
			h = 0.0219915 * safezoneH;
		};

		class WantedConnection: Life_RscText {
			idc = 2404;
			style = 1;
			text = "";
			x = 0.58144 * safezoneW + safezoneX;
			y = 0.231589 * safezoneH + safezoneY;
			w = 0.114512 * safezoneW;
			h = 0.0199068 * safezoneH;
		};

		class WantedList: Life_RscListBox {
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "0 spawn life_fnc_wantedGrab";
			x = 0.298976 * safezoneW + safezoneX;
			y = 0.297678 * safezoneH + safezoneY;
			w = 0.195869 * safezoneW;
			h = 0.362861 * safezoneH;
		};

		class PlayerList: Life_RscListBox {
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "";
			x = 0.500558 * safezoneW + safezoneX;
			y = 0.298719 * safezoneH + safezoneY;
			w = 0.200467 * safezoneW;
			h = 0.360776 * safezoneH;
		};

		class WantedDetails: Life_RscListBox {
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			x = 0.298976 * safezoneW + safezoneX;
			y = 0.700121 * safezoneH + safezoneY;
			w = 0.195869 * safezoneW;
			h = 0.098962 * safezoneH;

		colorBackground[] = {0.28,0.28,0.28,0.28};
		
		};

		class BountyPrice: Life_RscText {
			idc = 2403;
			text = "";
			x = 0.298976 * safezoneW + safezoneX;
			y = 0.80568 * safezoneH + safezoneY;
			w = 0.0824714 * safezoneW;
			h = 0.0439831 * safezoneH;

		colorBackground[] = {0.28,0.28,0.28,0.28};

		};

		class WantedAddL: Life_RscCombo {
			idc = 2407;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.700123 * safezoneH + safezoneY;
			w = 0.201024 * safezoneW;
			h = 0.025000 * safezoneH;
		};

		class PardonButtonKey: Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "call life_fnc_pardon; closeDialog 0;";
			x = 0.3732 * safezoneW + safezoneX;
			y = 0.862861 * safezoneH + safezoneY;
			w = 0.0721624 * safezoneW;
			h = 0.0219915 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.85,0.1,0.1,0.9};
		};

		class ButtonWantedAdd: Life_RscButtonMenu {
			idc = 9800;
			text = "$STR_Wanted_Add";
			onButtonClick = "call life_fnc_wantedAddP;";
			colorBackground[] = {0.1,0.85,0.1,0.8};
			x = 0.446393 * safezoneW + safezoneX;
			y = 0.862861 * safezoneH + safezoneY;
			w = 0.0721624 * safezoneW;
			h = 0.0219915 * safezoneH;
		};

		class wantedText: Life_RscText {
			idc = 1000;
			text = "$STR_Wanted_People";
			x = 0.298976 * safezoneW + safezoneX;
			y = 0.269089 * safezoneH + safezoneY;
			w = 0.195869 * safezoneW;
			h = 0.0219915 * safezoneH;
		};

		class citizensText: Life_RscText {
			idc = 1001;
			text = "$STR_Wanted_Citizens";
			x = 0.500557 * safezoneW + safezoneX;
			y = 0.271288 * safezoneH + safezoneY;
			w = 0.201959 * safezoneW;
			h = 0.0199068 * safezoneH;
		};

		class crimesText: Life_RscText {
			idc = 1002;
			text = "$STR_Wanted_Crimes";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.673733 * safezoneH + safezoneY;
			w = 0.201024 * safezoneW;
			h = 0.0219915 * safezoneH;
		};
 
		class etn_CloseHeader: Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "X";
			x = 0.69587 * safezoneW + safezoneX;
			y = 0.236101 * safezoneH + safezoneY;
			w = 0.0103089 * safezoneW;
			h = 0.0219915 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			colorBackgroundActive[] = {-1,-1,-1,-1};
			colorText[]= {1,0,0,1};
		};

		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.293822 * safezoneW + safezoneX;
			y = 0.862861 * safezoneH + safezoneY;
			w = 0.0773169 * safezoneW;
			h = 0.0219915 * safezoneH;
		};
	};
};