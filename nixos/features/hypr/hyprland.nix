{ pkgs, ... }: {

  # Enable hyprland
  programs.hyprland = {
    enable = true;
  };

  # Additional packages
  packages = with pkgs; [
    # temporary
    kitty
    wofi
  ];
}
