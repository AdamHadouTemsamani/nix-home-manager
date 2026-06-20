{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "toggle-audio" (builtins.readFile ../scripts/toggle-audio.sh))
    papirus-icon-theme
    kdePackages.breeze
    konsave
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "";
      colorScheme = "CachyOS-Nord";
      iconTheme = "Papirus-Light";
    };

    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "Switch to Next Keyboard Layout" = "Meta+Alt+K";
      };
      "kaccess" = {
        "Toggle Screen Reader On and Off" = "Meta+Alt+S";
      };
      "kmix" = {
        "decrease_microphone_volume" = "Microphone Volume Down";
        "decrease_volume" = "Volume Down";
        "decrease_volume_small" = "Shift+Volume Down";
        "increase_microphone_volume" = "Microphone Volume Up";
        "increase_volume" = "Volume Up";
        "increase_volume_small" = "Shift+Volume Up";
        "mic_mute" = ["Microphone Mute" "Meta+Volume Mute"];
        "mute" = "Volume Mute";
      };
      "ksmserver" = {
        "Lock Session" = ["Screensaver" "Meta+L"];
        "Log Out" = "Ctrl+Alt+Del";
      };
      "kwin" = {
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Edit Tiles" = "Meta+T";
        "Expose" = ["Ctrl+F9" "Meta+F9"];
        "ExposeAll" = ["Launch (C)" "Ctrl+F10" "Meta+F10"];
        "ExposeClass" = ["Ctrl+F7" "Meta+F7"];
        "Grid View" = "Meta+G";
        "Kill Window" = "Meta+Ctrl+Esc";
        "KrohnkiteDecrease" = "Meta+D";
        "KrohnkiteFloatAll" = "Meta+F";
        "KrohnkiteFocusDown" = "Meta+Down";
        "KrohnkiteFocusNext" = "Meta+.";
        "KrohnkiteFocusPrev" = "Meta+\\";
        "KrohnkiteFocusUp" = "Meta+Up";
        "KrohnkiteGrowHeight" = "Meta+Ctrl+J";
        "KrohnkiteIncrease" = "Meta+I";
        "KrohnkiteNextLayout" = "Meta+\\\\,none";
        "KrohnkitePreviousLayout" = "Meta+|";
        "KrohnkiteRotate" = "Meta+R";
        "KrohnkiteRotatePart" = "Meta+Shift+R";
        "KrohnkiteSetMaster" = "Meta+Return";
        "KrohnkiteShiftDown" = "Meta+Ctrl+Down";
        "KrohnkiteShiftLeft" = "Meta+Ctrl+Left";
        "KrohnkiteShiftRight" = "Meta+Ctrl+Right";
        "KrohnkiteShiftUp" = "Meta+Ctrl+Up";
        "KrohnkiteShrinkHeight" = "Meta+Ctrl+K";
        "KrohnkiteShrinkWidth" = "Meta+Ctrl+H";
        "KrohnkiteTileLayout" = "Meta+T";
        "KrohnkitegrowWidth" = "Meta+Ctrl+L";
        "Move MouseToCenter" = "Meta+F6";
        "Move MouseToFocus" = "Meta+F5";
        "Overview" = "Meta+W";
        "Show Desktop" = "Meta+D";
        "Switch Window Down" = "Meta+Alt+Down";
        "Switch Window Left" = ["Meta+Left" "Meta+Alt+Left"];
        "Switch Window Right" = ["Meta+Right" "Meta+Alt+Right"];
        "Switch Window Up" = "Meta+Alt+Up";
        "Switch to Desktop 1" = ["Ctrl+F1" "Meta+F1"];
        "Switch to Desktop 2" = ["Ctrl+F2" "Meta+F2"];
        "Switch to Desktop 3" = ["Ctrl+F3" "Meta+F3"];
        "Switch to Desktop 4" = ["Ctrl+F4" "Meta+F4"];
        "Walk Through Windows" = ["Alt+Tab" "Meta+Tab"];
        "Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" "Meta+Shift+Tab"];
        "Walk Through Windows of Current Application" = ["Alt+`" "Meta+`"];
        "Walk Through Windows of Current Application (Reverse)" = ["Alt+~" "Meta+~"];
        "Window Close" = ["Alt+F4" "Meta+Q"];
        "Window Maximize" = ["Meta+M" "Meta+PgUp"];
        "Window Minimize" = "Meta+PgDown";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window Operations Menu" = "Alt+F3";
        "Window Restore" = "Meta+Backspace";
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Screen" = "Meta+Shift+Left";
        "disableInputCapture" = "Meta+Shift+Esc";
        "view_actual_size" = "Meta+0";
        "view_zoom_in" = ["Meta++" "Meta+="];
        "view_zoom_out" = "Meta+-";
      };
      "mediacontrol" = {
        "nextmedia" = "Media Next";
        "pausemedia" = "Media Pause";
        "playpausemedia" = "Media Play";
        "previousmedia" = "Media Previous";
        "seekbackwardmedia" = "Media Rewind";
        "seekforwardmedia" = "Media Fast Forward";
        "stopmedia" = "Media Stop";
      };
      "org_kde_powerdevil" = {
        "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        "Hibernate" = "Hibernate";
        "Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        "PowerDown" = "Power Down";
        "PowerOff" = "Power Off";
        "Sleep" = "Sleep";
        "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "powerProfile" = ["Battery" "Meta+B"];
      };
      "plasmashell" = {
        "activate application launcher" = ["Meta" "Alt+F1"];
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "clipboard_action" = "Meta+Ctrl+X";
        "cycle-panels" = "Meta+Alt+P";
        "next activity" = "Meta+A";
        "previous activity" = "Meta+Shift+A";
        "show dashboard" = "Ctrl+F12";
        "show-on-mouse-pos" = "Meta+V";
      };
    };

    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "dolphinrc"."KFileDialog Settings" = {
        "Places Icons Auto-resize" = false;
        "Places Icons Static Size" = 22;
      };
      "kdeglobals" = {
        "General"."BrowserApplication" = "brave-origin.desktop";
        "KDE" = {
          "AnimationDurationFactor" = 0.25;
          "contrast" = 4;
          "frameContrast" = 0.2;
        };
      };
      "krunnerrc" = {
        "General" = {
          "FreeFloating" = true;
          "historyBehavior" = "ImmediateCompletion";
        };
        "Plugins"."helprunnerEnabled" = true;
        "Plugins/Favorites"."plugins" = "krunner_sessions,krunner_powerdevil,krunner_services,krunner_systemsettings";
      };
      "plasmarc"."Theme"."name" = "CachyOS-Nord";
      "plasma-localerc"."Formats"."LANG" = "en_DK.UTF-8";
      "kwinrc" = {
        "Desktops" = { "Number" = 1; "Rows" = 1; };
        "Plugins" = { "blurEnabled" = false; "krohnkiteEnabled" = true; };
        "Script-krohnkite" = {
          "dockOrderLeft" = 4;
          "screenGapBetween" = 8;
          "screenGapBottom" = 8;
          "screenGapLeft" = 8;
          "screenGapRight" = 8;
          "screenGapTop" = 8;
        };
        "TabBox" = { "LayoutName" = "thumbnail_grid"; "HighlightWindows" = true; };
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = { name = "Papirus-Light"; package = pkgs.papirus-icon-theme; };
  };
}