{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # Xserver 
  services.xserver = {
    modules = [ pkgs.xorg.xf86videofbdev ];
    videoDrivers = [ "hyperv_fb" ];
  };

  # Networking
  networking.hostName = "hyper"; # Define your hostname.

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  # platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Bootloader
  boot.initrd.availableKernelModules = [ "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ "hv_vmbus" "hv_storvsc" ];
  boot.kernelModules = [ "video=hyperv_fb:1200x800" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "nomodeset" ];

  # fstab
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/9dd268cf-0efb-4b9c-9a4f-8f2190285f39";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/52E6-B38B";
      fsType = "vfat";
    };

  # swapDevices = [ ];

  # HyperV
  virtualisation.hypervGuest.enable = true;
}
