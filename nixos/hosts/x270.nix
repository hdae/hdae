{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Fix iwlwifi issue, see: https://github.com/NixOS/nixpkgs/issues/85377
  hardware.enableRedistributableFirmware = true;

  # Networking
  networking.hostName = "x270";
  networking.useDHCP = lib.mkDefault true;

  # Platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
