{ config, pkgs, lib, ... }:

{
  home.username = "adamh";
  home.homeDirectory = "/home/adamh";
  home.stateVersion = "26.05";

  targets.genericLinux.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  # Gnome App Grid & Icon Sync
  home.activation.syncNixDesktopAndIcons = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.local/share/applications
    find $HOME/.local/share/applications -name "nix-*.desktop" -delete
    if [ -d "$HOME/.nix-profile/share/applications" ]; then
      for app in $HOME/.nix-profile/share/applications/*.desktop; do
        [ -f "$app" ] && ln -sf "$app" "$HOME/.local/share/applications/nix-$(basename "$app")"
      done
    fi
    
    mkdir -p $HOME/.local/share/icons/hicolor
    if [ -d "$HOME/.nix-profile/share/icons/hicolor" ]; then
      cd $HOME/.nix-profile/share/icons/hicolor
      find . -type f -exec sh -c '
        mkdir -p "$HOME/.local/share/icons/hicolor/$(dirname "{}")"
        ln -sf "$HOME/.nix-profile/share/icons/hicolor/{}" "$HOME/.local/share/icons/hicolor/{}"
      ' \;
      gtk-update-icon-cache -f -t $HOME/.local/share/icons/hicolor || true
    fi
    update-desktop-database $HOME/.local/share/applications || true
    touch $HOME/.local/share/applications
  '';

  # Declarative Flatpaks
  services.flatpak = {
    enable = true;
    packages = [

    ];
  };

  # GTK Styling
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Gnome System Settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close"; 
    };
  };

  # User Packages
  home.packages = with pkgs; [
    cubeb
    python3Packages.ds4drv
    galaxy-buds-client
    neovim
    fastfetch 
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  
  programs.fish = {
    enable = true;
    shellAbbrs = {
      v = "nvim";
      vim = "nvim";
      hms = "home-manager switch --flake ~/.config/home-manager/#adamh";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      fish_add_path ~/.nix-profile/bin 
      fastfetch --logo none
    '';
  };
}
