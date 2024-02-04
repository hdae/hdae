{ pkgs, nixos-hardware, ... }:

{
  imports = [

    # Hardware configuration
    ./hardware.nix

    # Hardware module
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.lenovo-thinkpad-x270

    # Features module
    ../../features/base
    ../../features/budgie

    # Features
    ../../features/docker.nix
    ../../features/programs.nix

    # Users
    ../../users/gecko.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
