{ config, pkgs, lib, ... }:

{
  home.username = "adamh";
  home.homeDirectory = "/home/adamh";
  home.stateVersion = "26.05";

  imports = [
    ./modules/desktop.nix
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/editor.nix
  ];

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}