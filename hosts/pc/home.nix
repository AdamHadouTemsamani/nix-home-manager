{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../home-common.nix
    ../../modules/plasma.nix
  ];

  # PC-only packages
  home.packages = [
    inputs.nixgl.packages.${pkgs.system}.default
    inputs.eden.packages.${pkgs.system}.default
  ];
}