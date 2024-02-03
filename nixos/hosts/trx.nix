{ pkgs, ... }:

{
  imports = [
    # Hardware
    ../hardwares/trx.nix

    # Features
    ../features/base.nix
    ../features/docker.nix
    ../features/gui.nix
    ../features/programs.nix

    # Users
    ../users/gecko.nix
  ];

  # Hostname
  networking.hostName = "trx";

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # Nvidia 32bit driver
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Nvidia driver
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
  };

  # Nvidia container
  virtualisation.docker.enableNvidia = true;
}
