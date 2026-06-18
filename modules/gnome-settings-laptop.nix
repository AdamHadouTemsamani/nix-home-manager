{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "toggle-audio" (builtins.readFile ../scripts/toggle-audio.sh))
    gnomeExtensions.hide-top-bar
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.desktop-icons-ng-ding
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.just-perfection
    gnomeExtensions.pop-shell
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "hidetopbar@mathieu.bidon.ca"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
        "ding@rastersoft.com"
        "blur-my-shell@aunetx"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "wack-lockscreen-clock@rinzler69-wastaken.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-indicator@tudmotu.com"
        "rounded-window-corners@fxgn"
        "just-perfection-desktop@just-perfection"
        "app-hider@lynith.dev"
        "pop-shell@system76.com"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      rounded-blur-found = false;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      corner-radius = 0;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
      background-color = "rgb(0,0,0)";
      background-opacity = 0.8;
      custom-background-color = true;
      dance-urgent-applications = false;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      isolate-workspaces = true;
      max-alpha = 0.8;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-icons-notifications-counter = false;
      show-mounts = false;
      show-mounts-only-mounted = false;
      show-trash = false;
      transparency-mode = "FIXED";
    };

    "org/gnome/shell/extensions/ding" = {
      check-x11wayland = true;
      show-home = false;
      show-network-volumes = false;
      show-trash = false;
      show-volumes = false;
    };

    "org/gnome/shell/extensions/gsconnect" = {
      enabled = true;
      missing-openssl = false;
      name = "adamh-laptop";
    };

    "org/gnome/shell/extensions/hidetopbar" = {
      animation-time-overview = 0.2;
      enable-active-window = false;
      enable-intellihide = false;
      keep-round-corners = true;
      mouse-sensitive = false;
      mouse-sensitive-fullscreen-window = false;
      show-in-overview = true;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      support-notifier-showed-version = 36;
      workspace = false;
      workspace-popup = false;
      workspaces-in-app-grid = false;
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = lib.hm.gvariant.mkUint32 9;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      activate-launcher = [ "<Super>space" ];
      active-hint = true;
      active-hint-border-radius = lib.hm.gvariant.mkUint32 20;
      gap-inner = lib.hm.gvariant.mkUint32 2;
      gap-outer = lib.hm.gvariant.mkUint32 2;
      hint-color-rgba = "rgb(160,175,190)";
      log-level = lib.hm.gvariant.mkUint32 0;
      mouse-cursor-focus-location = lib.hm.gvariant.mkUint32 4;
      show-title = true;
      smart-gaps = false;
      snap-to-grid = true;
      tile-by-default = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      control-center = [ "<Super>i" ];
      home = [ "<Super>h" ];
      search = [ "<Alt>space" ];
      volume-down = [ "F7" ];
      volume-mute = [ "F6" ];
      volume-up = [ "F8" ];
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

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      cycle-windows = [ "<Control><Alt>Tab" ];
      cycle-windows-backward = [ "<Shift><Control><Alt>Tab" ];
      maximize = [];
      minimize = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-workspace-left = [ "<Shift><Super>Left" ];
      move-to-workspace-right = [ "<Shift><Super>Right" ];
      show-desktop = [ "<Super>d" ];
      switch-applications = [];
      switch-applications-backward = [];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
      unmaximize = [];
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