{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    vscode-fhs
    google-chrome
    wezterm
  ];
}
