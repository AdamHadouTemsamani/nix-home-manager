{ config, pkgs, lib, ... }:

{
  home.username = "adamh";
  home.homeDirectory = "/home/adamh";
  home.stateVersion = "26.05";

  imports = [
    ./modules/terminal.nix
    ./modules/packages.nix
    ./modules/editor.nix
    ./modules/gnome-settings.nix
  ];

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
  
  home.sessionVariables = {
    SSH_ASKPASS = "";
    SSH_ASKPASS_REQUIRE = "never";
  };

}