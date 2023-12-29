{
  nix = {

    # Nix settings
    settings = {

      # Optimize nix store
      auto-optimise-store = true;

      # Features
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    # Use GC
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
