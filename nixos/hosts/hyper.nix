{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # Networking
  networking.hostName = "hyper";

  # Xserver 
  services.xserver = {
    modules = [ pkgs.xorg.xf86videofbdev ];
    videoDrivers = [ "hyperv_fb" ];
  };

  # OpenSSH
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
}
