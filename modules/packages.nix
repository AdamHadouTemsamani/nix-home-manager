{ config, pkgs, lib, ... }:

{
  # Packages
  home.packages = with pkgs;
  [
    python3Packages.ds4drv
    galaxy-buds-client
  ];

  # Declarative Flatpaks (Add valid Flathub IDs here if needed)
  services.flatpak = {
    enable = true;
    packages = [  
    ];
  };
}
