{
  # Enable programs
  programs = {
    git.enable = true;
    starship.enable = true;
    zsh.enable = true;

    # Vim
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
  };
}
