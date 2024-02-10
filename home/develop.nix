{ pkgs, ... }: {

  # Programs
  imports = [

    # Node.js
    ./programs/volta.nix
  ];

  # Packages
  home.packages = with pkgs; [

    # Rust
    rust-bin.stable.latest.default

    # Nix
    nil
    nixpkgs-fmt

    # TypeScript
    deno
  ];
}
