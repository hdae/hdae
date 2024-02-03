{ lib, ... }:

{

  # System
  system.stateVersion = "23.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Nix settings
  nix.settings = {

    # Optimize nix store
    auto-optimise-store = true;

    # Enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Enable GC
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
