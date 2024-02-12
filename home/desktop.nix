{ pkgs, ... }: {

  imports = [
    ./minimal.nix

    ./programs/fontconfig.nix
  ];

  home.packages = with pkgs; [
    discord
    gimp
    google-chrome
    vscode-fhs
    wezterm
    wireshark
  ];
}
