{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../home-common.nix
    ../../modules/gnome-settings-pc.nix
  ];

  # Add Laptop-only packages
  home.packages = [

  ];
}