{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "toggle-audio" (builtins.readFile ../scripts/toggle-audio.sh))
    papirus-icon-theme
    kdePackages.breeze
    konsave
  ];

  xdg.desktopEntries."custom-toggle-audio" = {
    name = "Toggle Audio";
    exec = "toggle-audio";
    noDisplay = true;
    startupNotify = false;
  };

  programs.plasma = {
    enable = true;

    workspace = {
      iconTheme = "Papirus-Light";
    };

    shortcuts = {
      "custom-toggle-audio.desktop" = {
        "_launch" = "Ctrl+Shift+End";
      };
      "services/net.local.pavucontrol.desktop" = {
        "_launch" = "Meta+G";
      };
      "services/net.local.plasma-systemmonitor.desktop" = {
        "_launch" = "Meta+R";
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
        "Kill Window" = "Meta+Ctrl+Esc";
        "KrohnkiteDecrease" = "Meta+D";
        "KrohnkiteFloatAll" = "Meta+F";
        "KrohnkiteFocusUp" = "Meta+Up";
        "KrohnkiteFocusLeft" = "Meta+Left";
        "KrohnkiteFocusRight" = "Meta+Right";
        "KrohnkiteFocusDown" = "Meta+Down";
        "KrohnkiteFocusNext" = "Meta+.";
        "KrohnkiteFocusPrev" = "Meta+,";
        "KrohnkiteGrowHeight" = "Meta+Ctrl+J";
        "KrohnkiteIncrease" = "Meta+I";
        "KrohnkiteNextLayout" = "Meta+\\\\";
        "KrohnkitePreviousLayout" = "Meta+|";
        "KrohnkiteRotatePart" = "Meta+Shift+R";
        "KrohnkiteSetMaster" = "Meta+Return";
        "KrohnkiteShiftDown" = "Meta+Ctrl+Down";
        "KrohnkiteShiftLeft" = "Meta+Ctrl+Left";
        "KrohnkiteShiftRight" = "Meta+Ctrl+Right";
        "KrohnkiteShiftUp" = "Meta+Ctrl+Up";
        "KrohnkiteShrinkHeight" = "Meta+Ctrl+K";
        "KrohnkiteShrinkWidth" = "Meta+Ctrl+H";
        "KrohnkiteTileLayout" = "Meta+T";
        "KrohnkiteToggleFloat" = "Meta+F";
        "KrohnkitegrowWidth" = "Meta+Ctrl+L";
        "MoveMouseToCenter" = "Meta+F6";
        "MoveMouseToFocus" = "Meta+F5";
        "Overview" = "Meta+W";
        "Show Desktop" = "Meta+D";
        "Window Quick Tile Bottom" = [ ];
        "Window Quick Tile Left" = [ ];
        "Window Quick Tile Right" = [ ];
        "Window Quick Tile Top" = [ ];
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch Window Down" = "Meta+Alt+Down";
        "Switch Window Left" = "Meta+Alt+Left";
        "Switch Window Right" = "Meta+Alt+Right";
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
        "Window Minimize" = ["Meta+N" "Meta+PgDown"];
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
      };
    };

    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kdeglobals" = {
        "General"."BrowserApplication" = "brave-origin.desktop";
        "KDE" = {
          "AnimationDurationFactor" = 0.25;
          "contrast" = 4;
          "frameContrast" = 0.2;
        };
      };
      "plasma-localerc"."Formats"."LANG" = "en_DK.UTF-8";
      "kwinrc" = {
        "Desktops" = { "Number" = 1; "Rows" = 1; };
        "Plugins" = { "blurEnabled" = false; "krohnkiteEnabled" = true; };
        
        "Script-krohnkite" = {
          "dockOrderLeft" = 4;
          "screenGapBetween" = 4;
          "screenGapBottom" = 4;
          "screenGapLeft" = 4;
          "screenGapRight" = 4;
          "screenGapTop" = 4;
        };
        "TabBox" = {
          "LayoutName" = "thumbnail_grid";
          "HighlightWindows" = false;
        };
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