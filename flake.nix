{

  outputs =
    { self
    , nixpkgs
    , nixos-hardware
    , home-manager
    }@inputs:
    let

      # Host specific configuration
      hosts = {

        # Main laptop
        x270 = { };

        # Main desktop, but portable ssd.
        trx = { };

        # Primary server
        srv01 = { };

        # Raspberry Pi 4
        rpi01 = {
          system = "aarch64-linux";
        };
      };

      # Generate configuration
      nixosConfig = hostName: config: nixpkgs.lib.nixosSystem (

        # Merge input config
        {

          # Default is x86_64
          system = config.system or "x86_64-linux";

          # Load host specific modules
          modules = [
            { networking.hostName = hostName; }
            ./nixos/hosts/${hostName}
          ];

          # Give inputs as specialArgs
          specialArgs = inputs;
        }
      );

      homeConfig = hostName: config: home-manager.lib.homeManagerConfiguration ({
        pkgs = import nixpkgs {
          system = config.system or "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home ];
      });
    in
    {

      # NixOS Configurations
      nixosConfigurations = nixpkgs.lib.mapAttrs nixosConfig hosts;

      # User configurations
      homeConfigurations = nixpkgs.lib.mapAttrs homeConfig hosts;
    };

  inputs = {

    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # NixOS Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # # Disk Manager
    # disko.url = "github:nix-community/disko";
    # disko.inputs.nixpkgs.follows = "nixpkgs";
  };
}
