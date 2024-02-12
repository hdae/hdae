{ pkgs, ... }: {

  # Add installed script path
  home.sessionPath = [
    "$HOME/.deno/bin"
  ];

  # Add deno package
  home.packages = with pkgs; [
    deno
  ];
}
