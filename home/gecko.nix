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

  home.sessionPath = [
    "$HOME/.volta/bin"
  ];

  # 
  home.sessionVariables = rec {
    # devbox
    DO_NOT_TRACK = 1;
  };

  # Additional packages
  home.packages = with pkgs; [

    # Applications
    discord
    vscode-fhs
    google-chrome
    wezterm

    # Fonts
    hack-font
    ibm-plex

    # Tools
    htop
    ghq
    go-task

    # Develop
    devbox
    # rtx
    deno
    volta

    # Nix tools
    nixpkgs-fmt
    rnix-lsp
  ];

  # Programs config
  programs = {

    # Enable home-manager.
    home-manager.enable = true;

    # Configure Git and GHQ
    git = {
      enable = true;

      extraConfig = {
        user = {
          name = "Hedudae";
          email = "98353469+hdae@users.noreply.github.com";
        };
        credential = {
          "https://github.com" = {
            helper = "!gh auth git-credential";
          };
        };
        credential = {
          "https://gist.github.com" = {
            helper = "!gh auth git-credential";
          };
        };
        ghq = {
          "root" = "~/repo";
        };
      };
    };

    # Configure GitHub CLI
    gh = {
      enable = true;
      gitCredentialHelper.enable = false;
    };
  };
}
