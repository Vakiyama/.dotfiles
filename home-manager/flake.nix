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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs"; # avoid a second nixpkgs copy
    };
    # Claude Code tracks upstream releases within hours, unlike nixpkgs.
    # Bump just this:  nix flake update claude-code
    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHome = { username, modules }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inputs = self.inputs; };
          modules = [
            ./shared/default.nix
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            }
          ] ++ modules;
        };
    in
    {
      # desktop / laptop: everything
      homeConfigurations.Root = mkHome {
        username = "Root";
        modules = [ ./shared/desktop.nix ];
      };

      # WSL: terminal core only
      #   home-manager switch --flake ~/.config/home-manager#wsl
      homeConfigurations.wsl = mkHome {
        username = "Root";
        modules = [ ./shared/wsl.nix ];
      };
    };
}
