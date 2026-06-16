{ config, pkgs, lib, ... }:

{
  # Packages
  home.packages = with pkgs; [
    cubeb
    python3Packages.ds4drv
    galaxy-buds-client
    papirus-icon-theme
  ];

  home.activation.linkDesktopFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ~/.local/share/applications
    mkdir -p ~/.local/share/icons
    
    # 1. Clear old Home Manager desktop symlinks
    rm -f ~/.local/share/applications/hm-*.desktop
    
    # 2. Link desktop files
    for f in ~/.nix-profile/share/applications/*.desktop; do
      ln -sf "$f" ~/.local/share/applications/hm-$(basename "$f")
    done
    
    # 3. Recursively symlink Nix icons into the local GNOME folder
    if [ -d "$HOME/.nix-profile/share/icons" ]; then
      cp -rsf $HOME/.nix-profile/share/icons/* $HOME/.local/share/icons/ 2>/dev/null || true
      chmod -R u+w $HOME/.local/share/icons/ 2>/dev/null || true
      gtk-update-icon-cache -q -f -t $HOME/.local/share/icons/hicolor 2>/dev/null || true
    fi
    
    # 4. Trigger GNOME refresh
    update-desktop-database ~/.local/share/applications || true
  ''; 

  # Declarative Flatpaks (Add valid Flathub IDs here if needed)
  services.flatpak = {
    enable = true;
    packages = [];
  };

  # Styling
  dconf.settings = {
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
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          rm -rf $out/share/icons/*/symbolic
        '';
      });
    };
  };
}
