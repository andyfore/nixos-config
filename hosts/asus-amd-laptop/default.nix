{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/base/boot.nix
    ../../modules/base/networking.nix
    ../../modules/base/nix.nix
    ../../modules/base/packages.nix
    ../../modules/base/users.nix
    ../../modules/desktop/hyprland/
    ../../modules/desktop/sddm.nix
    ../../modules/hardware/amd-laptop.nix
  ];

  networking.hostName = "windmill";

}
