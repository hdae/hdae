{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # Network
  networking.hostName = "x270";
  networking.useDHCP = lib.mkDefault true;

  # Platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
