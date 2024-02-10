{ pkgs, ... }:

let
  username = "gecko";
in
{

  # Programs
  imports = [
    ./programs/devbox.nix
    ./programs/git.nix
    ./programs/volta.nix
    ./programs/zsh.nix
  ];

  # Packages
  home.packages = with pkgs; [

    # CLI Tools
    go-task
    htop

    # Nix Tools
    nil
    nixpkgs-fmt

    # Runtime
    deno
  ];

  # Enable home-manager.
  programs.home-manager.enable = true;

  # Home directory
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
}
