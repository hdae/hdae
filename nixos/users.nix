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
      ];

      # TODO: Migrate to homemanager
      packages = with pkgs; [
        vscode
        google-chrome
        wezterm

        # Nix tools
        nixpkgs-fmt
        rnix-lsp
      ];
    };
  };
}
