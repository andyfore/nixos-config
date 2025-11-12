{
  description = "NixOS configuration for multiple hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Ulauncher v6 (their main branch is v6-dev)
    ulauncher.url = "github:Ulauncher/Ulauncher";
  };

  outputs = { self, nixpkgs, home-manager, ulauncher, ... }: {
    nixosConfigurations = {
      asus-amd-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/asus-amd-laptop/default.nix
          ./hosts/asus-amd-laptop/hardware-configuration.nix
  
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.andyfore = import ./modules/home/andyfore.nix;
          }
        ];
      };
    };
  };

}
