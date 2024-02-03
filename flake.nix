{
  inputs = {

    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # NixOS Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Disk Manager
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self
    , nixpkgs
    , nixos-hardware
    , home-manager
    , disko
    }@inputs: {

      # NixOS Configurations
      nixosConfigurations = {

        # x270
        x270 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.lenovo-thinkpad-x270
            ./nixos/common.nix
            ./nixos/hardware/x270.nix
            ./nixos/hosts/x270.nix
          ];
        };

        # trx
        trx = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.common-pc-ssd
            nixos-hardware.nixosModules.common-cpu-intel
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
            ./nixos/common.nix
            ./nixos/hardware/trx.nix
            ./nixos/hosts/trx.nix
          ];
        };

        # srv01
        srv01 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.common-pc-ssd
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd
            ./nixos/common.nix
            ./nixos/hardware/srv01.nix
            ./nixos/hosts/srv01.nix
          ];
        };
      };

      # User configurations
      homeConfigurations = {

        # Normal user
        gecko = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit inputs;
          };

          modules = [
            ./home/gecko.nix
          ];
        };
      };
    };
}
