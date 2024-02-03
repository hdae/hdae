{ pkgs, ... }:

{
  imports = [
    # Hardware
    ../hardwares/srv01.nix

    # Features
    ../features/base.nix
    ../features/docker.nix
    ../features/programs.nix

    # Users
    ../users/gecko.nix
  ];

  # Hostname
  networking.hostName = "srv01";

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Networking
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
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

  # OpenSSH
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "no";
  };
}
