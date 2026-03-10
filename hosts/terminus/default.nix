{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix

    ../../modules/nixos/boot.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/graphics.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/greetd.nix
#    ../../modules/nixos/niri.nix
    ../../modules/nixos/hyprland.nix
  ];

  networking.hostName = "terminus";
  time.timeZone = "America/New_York";

  system.stateVersion = "25.11";
}
