{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/base/boot.nix
    ../../modules/base/networking.nix
    ../../modules/base/nix.nix
    ../../modules/base/users.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/hardware/pc-laptop.nix
  ];
}
