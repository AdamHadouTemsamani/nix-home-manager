{ config, pkgs, lib, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    gcc
    wl-clipboard
    viu
  ];

  # Declaratively bootstrap LazyVim on first run without locking the folder
  home.activation.bootstrapLazyVim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -d "$HOME/.config/nvim" ]; then
      ${pkgs.git}/bin/git clone https://github.com/LazyVim/starter $HOME/.config/nvim
      rm -rf $HOME/.config/nvim/.git
    fi
  '';
}