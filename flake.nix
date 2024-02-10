{

  outputs =
    { self
    , nixpkgs
    , nixos-hardware
    , home-manager
    , rust-overlay
    }@inputs:
    let

      # Host specific configuration
      hosts = {

        # Main laptop
        x270 = {
          features = [
            ./home/desktop.nix
            ./home/develop.nix
          ];
        };

        # Main desktop, but portable ssd.
        trx = {
          features = [
            ./home/desktop.nix
            ./home/develop.nix
          ];
        };

        # Primary server
        srv01 = { };

        # Raspberry Pi 4
        rpi01 = {
          system = "aarch64-linux";
        };
      };

      # Generate nixos configuration
      nixosConfig = hostName: config: nixpkgs.lib.nixosSystem {

        # Default is x86_64
        system = config.system or "x86_64-linux";

        # Load host specific modules
        modules = [
          { networking.hostName = hostName; }
          ./nixos/hosts/${hostName}
        ];

        # Give inputs as specialArgs
        specialArgs = inputs;
      };

      # Generate home configuration
      homeConfig = hostName: config: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = config.system or "x86_64-linux";
          config.allowUnfree = true;
          overlays = [
            (import inputs.rust-overlay)
          ];
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/minimal.nix ] ++ config.features or [ ];
      };
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

    # Rust overlay
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
}
