{ config, pkgs, ... }:

{
  imports = [
    ./firewall.nix
    ./i18n.nix
    ./nix.nix
    ./programs.nix
    ./services.nix
    ./system.nix
    ./users.nix
  ];
}
