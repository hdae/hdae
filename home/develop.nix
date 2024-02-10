{ pkgs, ... }: {

  # Programs
  imports = [

    # Node.js
    ./programs/volta.nix
  ];

  # Packages
  home.packages = with pkgs; [

    # Rust
    clang
    rust-bin.stable.latest.default

    # Nix
    nil
    nixpkgs-fmt

    # TypeScript
    deno
  ];

  home.sessionVariables = {

    # Rust: https://github.com/rust-lang/rust-bindgen#environment-variables
    LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
  };
}
