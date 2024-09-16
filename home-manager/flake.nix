{
  description = "Home Manager configuration of Root";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";

    # Add your Zen Browser flake
    zen-flake = {
      # Replace '~/zen-flake' with the actual path to your Zen Browser flake
      url = "/home/Root/.config/home-manager/zen";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.Root = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Pass the inputs to your Home Manager configuration
        extraSpecialArgs = {
          # Access 'inputs' via 'self.inputs'
          inputs = self.inputs;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
      };
    };
}

