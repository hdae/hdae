{ pkgs, ... }:

{
  imports = [
    ./zsh/config.nix
  ];

  # Home directory
  home = rec {
    username = "gecko";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  # Additional packages
  home.packages = with pkgs; [

    # Applications
    vscode
    google-chrome
    wezterm

    # CLI
    gh
    ghq
    rtx

    # Develop
    deno

    # Nix tools
    nixpkgs-fmt
    rnix-lsp
  ];

  programs = {
    home-manager.enable = true;
  };
}
