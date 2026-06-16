{ config, pkgs, lib, ... }:

{
  # Packages
  home.packages = with pkgs; [
    cubeb
    python3Packages.ds4drv
    galaxy-buds-client
    papirus-icon-theme
  ];

  home.activation.syncNixDesktopAndIcons = lib.hm.dag.entryAfter ["writeBoundary"] ''
    find $HOME/.local/share/applications -name "nix-*.desktop" -type l -delete

    # Re-create links only for what is currently in the Nix profile
    mkdir -p $HOME/.local/share/applications
    if [ -d "$HOME/.nix-profile/share/applications" ]; then
      for app in $HOME/.nix-profile/share/applications/*.desktop; do
        if [ -f "$app" ]; then
          ln -sf "$app" "$HOME/.local/share/applications/nix-$(basename "$app")"
        fi
      done
    fi
    
    # Icon sync
    mkdir -p $HOME/.local/share/icons/hicolor
    if [ -d "$HOME/.nix-profile/share/icons/hicolor" ]; then
      cd $HOME/.nix-profile/share/icons/hicolor
      find . -type f -exec sh -c '
        mkdir -p "$HOME/.local/share/icons/hicolor/$(dirname "{}")"
        ln -sf "$HOME/.nix-profile/share/icons/hicolor/{}" "$HOME/.local/share/icons/hicolor/{}"
      ' \;
      gtk-update-icon-cache -f -t $HOME/.local/share/icons/hicolor || true
    fi
    
    # Cleanup broken links and refresh database
    find $HOME/.local/share/applications -xtype l -delete
    update-desktop-database $HOME/.local/share/applications || true
    touch $HOME/.local/share/applications
  '';

  # Declarative Flatpaks (Add valid Flathub IDs here if needed)
  services.flatpak = {
    enable = true;
    packages = [];
  };

  # Gnome Styling
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
  };
}