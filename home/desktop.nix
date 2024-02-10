{ pkgs, ... }: {

  imports = [
    ./minimal.nix

    ./programs/fontconfig.nix
  ];

  home.packages = with pkgs; [
    discord
    vscode-fhs
    google-chrome
    wezterm
  ];
}
