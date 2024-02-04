{ pkgs, ... }: {

  # Home directory
  home.packages = with pkgs; [

    # CLI Tools
    ghq
    go-task
    htop

    # Nix Tools
    nil
    nixpkgs-fmt

    # Runtime
    deno
  ];
}
