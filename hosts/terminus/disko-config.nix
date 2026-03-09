# btrfs/disko-config.nix

{ disks ? [ "/dev/nvme0n1" "/dev/nvme1n1" ], ... }: 
let 
  number_of_disks = if (builtins.length disks < 3) 
                    then builtins.length disks 
                    else throw "Error. Too many disks passed to disko.";
in
{
  disko.devices = {
    disk = {
      vda = {
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
              };
            };
            root = {
              # name = "root";
              start = "2048MiB";
              end = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                extraOpenArgs = [ "--allow-discards" ];
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ]; # Override existing partition
                  subvolumes = 
                    if (number_of_disks == 1) then 
                      { 
                        "@" = { };
                        "@/root" = {
                          mountpoint = "/";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                        "@/home" = {
                          mountpoint = "/home";
                          mountOptions = [ "compress=zstd" ];
                        };
                        "@/nix" = {
                          mountpoint = "/nix";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                        "@/persist" = {
                          mountpoint = "/persist";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                        "@/var-lib" = {
                          mountpoint = "/var/lib";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                        "@/var-log" = {
                          mountpoint = "/var/log";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                        "@/var-tmp" = {
                          mountpoint = "/var/tmp";
                          mountOptions = [ "compress=zstd" "noatime" ];
                        };
                      }
                    else
                      {
#                        "@" = { };
#                        "@/root" = {
#                          mountpoint = "/";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
#                        "@/nix" = {
#                          mountpoint = "/nix";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
#                        "@/persist" = {
#                          mountpoint = "/persist";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
#                        "@/var-lib" = {
#                          mountpoint = "/var/lib";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
#                        "@/var-log" = {
#                          mountpoint = "/var/log";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
#                        "@/var-tmp" = {
#                          mountpoint = "/var/tmp";
#                          mountOptions = [ "compress=zstd" "noatime" ];
#                        };
                      };
                };
            };
          };
        };
      };

      vdb = if (number_of_disks == 1) then {}
      else
      {
        type = "disk";
        device = builtins.elemAt disks 1;
        content = {
          type = "gpt";
          partitions = {
            DATA = {
              # name = "DATA";
              start = "1MiB";
              end = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                subvolumes = {
                  "@" = { 
                    mountpoint = "/DATA";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@/games" = {
                    mountpoint = "/games";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "@/code" = {
                    mountpoint = "/code";
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
