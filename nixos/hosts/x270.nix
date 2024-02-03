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

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Hostname
  networking.hostName = "x270";

  # Platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # Fix iwlwifi issue, see: https://github.com/NixOS/nixpkgs/issues/85377
  hardware.enableRedistributableFirmware = true;
}
