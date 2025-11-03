{
  description = "Standalone Home Manager config for andyfore";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    # Single-user, single-host setup
    homeConfigurations."andyfore" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/andyfore.nix
      ];
    };

    # If you later want a “host profile”, you can add:
    # homeConfigurations."windmill" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #   modules = [ ./home/andyfore.nix ./profiles/desktop.nix ];
    # };
  };
}

