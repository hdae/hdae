{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    # disko.url = "github:nix-community/disko"
  };

  outputs = { nixpkgs, nixos-hardware, disko }: {
    nixosConfigurations = {

      # Hyper-V
      hyper = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/mod.nix
          ./nixos/hosts/hyper.nix
          ./nixos/hardware/hyper.nix
        ];
      };

      # x270
      x270 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.lenovo-thinkpad-x270
          ./nixos/mod.nix
          ./nixos/hosts/x270.nix
          ./nixos/hardware/x270.nix
        ];
      };
    };
  };
}
