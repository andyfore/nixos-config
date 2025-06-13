{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/base/boot.nix
    ../../modules/base/networking.nix
#    ../../modules/base/nix-settings.nix
    ../../modules/base/users.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/sddm.nix
    ../../modules/hardware/amd-laptop.nix
  ];

  networking.hostName = "terminus";

  _module.args = {
    disko.devices = config.disko.devices;
  };

}

