{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fastfetch
    btop
    nerd-fonts.jetbrains-mono
  ];

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Macchiato";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      palettes.catppuccin_macchiato = {
        rosewater = "#f4dbd6"; flamingo = "#f0c6c6"; pink = "#f5bde6"; mauve = "#c6a0f6";
        red = "#ed8796"; maroon = "#ee99a0"; peach = "#f5a97f"; yellow = "#eed49f";
        green = "#a6da95"; teal = "#8bd5ca"; sky = "#91d7e3"; sapphire = "#7dc4e4";
        blue = "#8aadf4"; lavender = "#b7bdf8"; text = "#cad3f5"; subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb"; overlay2 = "#939ab7"; overlay1 = "#8087a2"; overlay0 = "#6e738d";
        surface2 = "#5b6078"; surface1 = "#494d64"; surface0 = "#363a4f"; base = "#24273a";
        mantle = "#1e2030"; crust = "#181926";
      };
      palette = "catppuccin_macchiato";
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      v = "nvim";
      vim = "nvim";
      hms = "home-manager switch --flake ~/.config/home-manager/#adamh";
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      cat = "bat";
      top = "btop";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      fish_add_path ~/.nix-profile/bin 
      fastfetch --logo none --color-keys blue --color-title green
    '';
  };
}