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
    ../../features/boot.nix
    ../../features/budgie.nix
    ../../features/appimage.nix
    ../../features/docker.nix
    ../../features/shell.nix
    ../../features/nvidia.nix
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
