{ pkgs, lib, ... }:

{

  # Don't change.
  system.stateVersion = "23.11";

  # Set your time zone.
  time.timeZone = lib.mkDefault "Asia/Tokyo";

  # Locale
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  # Set default hostname
  networking.hostName = lib.mkDefault "nixos";

  # Use network-manager
  networking.networkmanager.enable = lib.mkDefault true;

  # Use DHCP
  networking.useDHCP = lib.mkDefault true;

  # Additional firmware
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # Additional packages
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Nix settings
  nix.settings = {

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
