{ pkgs, ... }: {

  # Rust packages
  home.packages = with pkgs; [
    clang
    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" ];
    })
  ];

  # Set session variable
  home.sessionVariables = {

    # Rust: https://github.com/rust-lang/rust-bindgen#environment-variables
    LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
  };
}
