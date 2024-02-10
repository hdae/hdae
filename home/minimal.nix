{ pkgs, ... }:

let
  username = "gecko";
in
{

  # Programs
  imports = [
    ./programs/git.nix
    ./programs/zsh.nix
  ];

  # Packages
  home.packages = with pkgs; [

    # CLI Tools
    go-task
    htop
    unar
  ];

  programs = {

    # Enable home-manager.
    home-manager.enable = true;
  };

  # Home directory
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
}
