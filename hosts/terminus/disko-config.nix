# btrfs/disko-config.nix

{
  disks ? [
    "/dev/nvme0n1"
    "/dev/nvme1n1"
  ],
  ...
}:
let
  number_of_disks =
    if (builtins.length disks < 3) then
      builtins.length disks
    else
      throw "Error. Too many disks passed to disko.";
in
{
  disko.devices = {
    disk = {
      disk1 = {
        type = "disk";
        device = builtins.elemAt disks 0;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              # name = "ESP";
              start = "1MiB";
              end = "2048MiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              }; # end ESP content
            }; # end ESP
            root = {
              # name = "root";
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                extraOpenArgs = [ "--allow-discards" ];
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ]; # Override existing partition
                  subvolumes = {
                    "@" = { };
                    "@/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" ];
                    };
                    "@/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/var-lib" = {
                      mountpoint = "/var/lib";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/var-log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/var-tmp" = {
                      mountpoint = "/var/tmp";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    }; # end var-tmp
                  }; # subvolumes
                }; # end content btrfs
              }; # end luks content
            }; # end root
          };
        };
      };

      disk2 = {
        type = "disk";
        device = builtins.elemAt disks 1;
        content = {
          type = "gpt";
          partitions = {
            DATA = {
              # name = "DATA";
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                subvolumes = {
                  "@" = {
                    mountpoint = "/data";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "@/games" = {
                    mountpoint = "/data/games";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "@/code" = {
                    mountpoint = "/data/code";
                    mountOptions = [ "compress=zstd" ];
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
