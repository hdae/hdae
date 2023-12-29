{ pkgs, ... }:

{

  # Additional packages
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # Minimal programs for system management.
  programs = {

    # My favorite things.
    git.enable = true;
    starship.enable = true;
    zsh.enable = true;

    # Use neovim alternative to vi/vim.
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
  };
}
