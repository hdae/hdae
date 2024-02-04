let
  username = "gecko";
in
{
  imports = [

    # Groups
    ./applications.nix
    ./tools.nix

    # Programs
    ./programs/devbox.nix
    ./programs/fontconfig.nix
    ./programs/git.nix
    ./programs/volta.nix
    ./programs/zsh.nix
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
