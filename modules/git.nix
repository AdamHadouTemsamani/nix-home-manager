{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "AdamHadouTemsamani";
    userEmail = "adamhaddoutemsamani@gmail.com";
    aliases = {

    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };
  };
}