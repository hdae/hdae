{ pkgs, ... }:

{
  imports = [
    # Hardware
    ../hardwares/x270.nix

    # Features
    ../features/base.nix
    ../features/docker.nix
    ../features/gui.nix
    ../features/programs.nix

    # Users
    ../users/gecko.nix
  ];

  # Hostname
  networking.hostName = "x270";

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
