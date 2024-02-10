{ pkgs, ... }:

{

  # Minimal programs for system management.
  programs = {

    # My favorite tools.
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
