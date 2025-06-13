{ config, lib, ... }:
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          esp = {
            label = "EFI";
            type = "EF00";
            size = "512M";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          luks = {
            label = "luks";
            size = "100%";
            content = {
              type = "luks";
              name = "cryptroot";
              settings.allowDiscards = true;
              passwordFile = "/tmp/luks-pass";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountOptions = [ "compress=zstd:3" "noatime" ];
                subvolumes = {
                  "@root" = { mountpoint = "/"; };
                  "@home" = { mountpoint = "/home"; };
                  "@nix" = { mountpoint = "/nix"; };
                  "@snapshots" = { mountpoint = "/.snapshots"; };
                  "@swap" = {
                    mountpoint = "/.swapvol";
                    mountOptions = [ "noatime" "nodatacow" "compress=none" ];
                    swap.swapfile.size = "16G";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
