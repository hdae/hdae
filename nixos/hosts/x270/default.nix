{ pkgs, nixos-hardware, ... }:

{
  imports = [

    # Hardware configuration
    ./hardware.nix

    # Hardware module
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.lenovo-thinkpad-x270

    # Features
    ../../features/base.nix
    ../../features/binary.nix
    ../../features/boot.nix
    ../../features/budgie.nix
    ../../features/docker.nix
    ../../features/shell.nix
    ../../features/flatpak.nix

    # Users
    ../../users/gecko.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
