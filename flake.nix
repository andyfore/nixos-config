{
  description = "NixOS configuration for multiple hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mango.url = "github:DreamMaoMao/mango";
  };

  outputs = { self, nixpkgs, home-manager, mango, ... }: {
    nixosConfigurations = {
      asus-amd-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/asus-amd-laptop/default.nix
          ./hosts/asus-amd-laptop/hardware-configuration.nix
  
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.andyfore = {
              imports = [
                (import ./modules/home/andyfore.nix)
                mango.hmModules.mango
                ./modules/home/mango.nix
              ];
            };
          };
        ];
      };
    };
  };

}
