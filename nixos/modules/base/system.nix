{ lib, ... }:

{

  # System
  system.stateVersion = lib.mkDefault "23.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Nix settings
  nix.settings = lib.mkDefault {

    # Optimize nix store
    auto-optimise-store = lib.mkDefault true;

    # Enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Enable GC
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 14d";
  };
}
