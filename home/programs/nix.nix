{ pkgs, ... }: {

  # Nix tools
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];
}
