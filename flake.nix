{
  description = "NixOS configuration for multiple hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

outputs = { self, nixpkgs, disko, home-manager, ... }: {
  nixosConfigurations = {
    asus-amd-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/asus-amd-laptop/default.nix
        ./hosts/asus-amd-laptop/hardware-configuration.nix
        ./hosts/asus-amd-laptop/disko.nix
        disko.nixosModules.disko

        ./modules/base/locale.nix
        ./modules/base/networking.nix
        ./modules/base/nix.nix
        ./modules/base/users.nix
        ./modules/desktop/hyprland.nix
        ./modules/desktop/sddm.nix
        ./modules/hardware/amd.nix
        ./modules/security/fde-tpm.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.andyfore = import ./home/andyfore.nix;
        }
      ];
    };

    homelab-server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/homelab-server/configuration.nix
        ./hosts/homelab-server/hardware-configuration.nix
        ./modules/base/locale.nix
        ./modules/base/networking.nix
        ./modules/base/nix.nix
        ./modules/base/users.nix
        ./modules/hardware/intel.nix
        ./modules/security/fde-none.nix
      ];
    };
  };
};

}
