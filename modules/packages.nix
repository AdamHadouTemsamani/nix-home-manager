{ config, pkgs, lib, ... }:

{
  # Packages
  home.packages = with pkgs;
  [
    python3Packages.ds4drv
    galaxy-buds-client
  ];

  home.activation.linkDesktopFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Sync desktop files exactly as they are named
    mkdir -p ~/.local/share/applications
    ${pkgs.rsync}/bin/rsync -a --delete ~/.nix-profile/share/applications/ ~/.local/share/applications/
    
    # Sync icons
    mkdir -p ~/.local/share/icons
    if [ -d "$HOME/.nix-profile/share/icons" ]; then
      ${pkgs.rsync}/bin/rsync -a --copy-unsafe-links ~/.nix-profile/share/icons/ ~/.local/share/icons/
      chmod -R u+w ~/.local/share/icons/
      ${pkgs.gtk3}/bin/gtk-update-icon-cache -q -f -t ~/.local/share/icons/hicolor 2>/dev/null || true
    fi
    
    # Trigger GNOME refresh
    ${pkgs.desktop-file-utils}/bin/update-desktop-database ~/.local/share/applications || true
  '';

  # Declarative Flatpaks (Add valid Flathub IDs here if needed)
  services.flatpak = {
    enable = true;
    packages = [];
  };
}
