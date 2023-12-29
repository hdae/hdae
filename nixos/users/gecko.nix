{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    gecko = {
      isNormalUser = true;
      description = "User";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];

      # 
      packages = with pkgs; [
        vscode
        firefox
      ];
    };
  };
}
