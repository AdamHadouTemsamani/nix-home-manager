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
      palette = "catppuccin_macchiato";
      add_newline = false;
      palettes.catppuccin_macchiato = {
        rosewater = "#f4dbd6"; flamingo = "#f0c6c6"; pink = "#f5bde6"; mauve = "#c6a0f6";
        red = "#ed8796"; maroon = "#ee99a0"; peach = "#f5a97f"; yellow = "#eed49f";
        green = "#a6da95"; teal = "#8bd5ca"; sky = "#91d7e3"; sapphire = "#7dc4e4";
        blue = "#8aadf4"; lavender = "#b7bdf8"; text = "#cad3f5"; subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb"; overlay2 = "#939ab7"; overlay1 = "#8087a2"; overlay0 = "#6e738d";
        surface2 = "#5b6078"; surface1 = "#494d64"; surface0 = "#363a4f"; base = "#24273a";
        mantle = "#1e2030"; crust = "#181926";
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "ghostbsd";
        color = { "1" = "blue"; };
      };
      display = {
        color = {
          keys = "blue";
          title = "green";
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "shell"
        "cpu"
        "gpu"
        "memory"
        "disk"
      ];
    };
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      v = "nvim";
      vim = "nvim";
      hms = "home-manager switch --flake ~/.config/home-manager/#adamh";
      cat = "bat";
      top = "btop";
    };
    interactiveShellInit = ''
      set -gx SSH_ASKPASS ""
      set -gx SSH_ASKPASS_REQUIRE never

      set -g fish_greeting ""
      fish_add_path ~/.nix-profile/bin
      fastfetch
    '';
  };

  programs.ghostty = {
    enable = true;
    # Custom dummy package to silence the getExe warning
    package = pkgs.runCommand "ghostty-dummy" { meta.mainProgram = "ghostty"; } "mkdir $out";
    installBatSyntax = false;
    installVimSyntax = false;
    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      background-opacity = 1;
      window-padding-x = 12;
      window-padding-y = 12;
      window-theme = "system";
      gtk-titlebar = true;
      gtk-titlebar-style = "native";
      resize-overlay = "never";
      background = "24273a";
      foreground = "cad3f5";
      cursor-color = "f4dbd6";
      cursor-text = "24273a";
      selection-background = "5b6078";
      selection-foreground = "cad3f5";
      palette = [
        "0=#494d64"
        "1=#ed8796"
        "2=#a6da95"
        "3=#eed49f"
        "4=#8aadf4"
        "5=#f5bde6"
        "6=#8bd5ca"
        "7=#b8c0e0"
        "8=#5b6078"
        "9=#ed8796"
        "10=#a6da95"
        "11=#eed49f"
        "12=#8aadf4"
        "13=#f5bde6"
        "14=#8bd5ca"
        "15=#a5adcb"
      ];
    };
  };
}