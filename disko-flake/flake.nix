{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.disko.url = "github:nix-community/disko";

  outputs = { self, nixpkgs, disko, ... }: {
    nixosConfigurations.asus-amd-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./disko.nix
        disko.nixosModules.disko
      ];
    };
  };
}

