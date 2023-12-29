{
  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Disk Manager
    # disko.url = "github:nix-community/disko"
  };

  outputs =
    { self
    , nixpkgs
    , nixos-hardware
    , home-manager
    }@inputs: {
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

      homeConfigurations = {
        gecko = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit inputs;
          };

          modules = [
            ./home/mod.nix
          ];
        };
      };
    };
}
