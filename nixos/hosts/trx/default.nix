{ pkgs, nixos-hardware, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.common-pc-ssd
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-gpu-intel
    nixos-hardware.nixosModules.common-gpu-nvidia-nonprime

    # Feature
    ../../features/base.nix
    ../../features/binary.nix
    ../../features/boot.nix
    ../../features/budgie.nix
    ../../features/docker.nix
    ../../features/flatpak.nix
    ../../features/nvidia.nix
    ../../features/shell.nix

    # Users
    ../../users/gecko.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
