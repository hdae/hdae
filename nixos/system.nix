{ lib, ... }:

{
  # System
  system.stateVersion = "23.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = lib.mkDefault "nixos";
  networking.networkmanager.enable = true;
}