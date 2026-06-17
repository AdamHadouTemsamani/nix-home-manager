{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "toggle-audio" (builtins.readFile ../scripts/toggle-audio.sh))
  ];

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Toggle Audio (Home)";
      command = "toggle-audio";
      binding = "<Ctrl><Shift>Home";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Toggle Audio (End)";
      command = "toggle-audio";
      binding = "<Ctrl><Shift>End";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Volume Control";
      command = "pavucontrol";
      binding = "<Super>g";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Resources";
      command = "resources";
      binding = "<Super>r";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  # Ghostty Settings
  xdg.dataFile."icons/hicolor/scalable/apps/com.mitchellh.ghostty.svg".source = ../assets/ghostty.svg;
  xdg.desktopEntries."com.mitchellh.ghostty" = {
    name = "Ghostty";
    genericName = "Terminal Emulator";
    exec = "ghostty"; 
    terminal = false;
    categories = [ "System" "TerminalEmulator" ];
    icon = "com.mitchellh.ghostty";
    settings = {
      StartupWMClass = "com.mitchellh.ghostty";
    };
  };
}