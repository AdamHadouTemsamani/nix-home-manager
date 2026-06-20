{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../home-common.nix
    ../../modules/plasma.nix
  ];

  # Add Laptop-only packages
  home.packages = [

  ];
}