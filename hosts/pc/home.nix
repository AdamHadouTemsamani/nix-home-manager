{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../home-common.nix
    ../../modules/gnome-settings-pc.nix
  ];

  # Add PC-only packages
  home.packages = [
    inputs.nixgl.packages.${pkgs.system}.default
    inputs.eden.packages.${pkgs.system}.default
  ];
}