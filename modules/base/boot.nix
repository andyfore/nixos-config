{ config, pkgs, lib, ... }:

{
    # Use the systemd-boot EFI boot loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    # Use latest kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
}
