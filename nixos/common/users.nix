{ pkgs, ... }:

{
  users.users = {
    gecko = {

      # Zsh with starship.
      shell = pkgs.zsh;

      # Create as real-user.
      isNormalUser = true;

      # Join group.
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "docker"
      ];
    };
  };
}
