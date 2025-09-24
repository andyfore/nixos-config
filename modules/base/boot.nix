{ config, pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.kernelModules = [ "kvm-amd" ];
}
