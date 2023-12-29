{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # Networking
  networking.hostName = "hyper"; # Define your hostname.

  # Xserver 
  services.xserver = {
    modules = [ pkgs.xorg.xf86videofbdev ];
    videoDrivers = [ "hyperv_fb" ];
  };
}
