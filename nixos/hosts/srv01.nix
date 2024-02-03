{ config, lib, pkgs, modulesPath, ... }:

{
  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Networking
  networking.hostName = "srv01";
  networking.useDHCP = false;
  networking.interfaces.enp9s0 = {
    useDHCP = false;
    wakeOnLan.enable = true;
    ipv4.addresses = [{
      address = "10.10.1.10";
      prefixLength = 16;
    }];
  };
  networking.defaultGateway = "10.10.1.1";
  networking.nameservers = [ "10.10.1.1" ];

  # Platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}