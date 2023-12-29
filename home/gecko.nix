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

  home.sessionVariables = rec {
    DO_NOT_TRACK = 1;
  };

  # Additional packages
  home.packages = with pkgs; [

    # Applications
    vscode
    google-chrome
    wezterm

    # Tools
    htop
    ghq
    go-task

    # Develop
    devbox
    rtx
    deno

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
      config = {
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
