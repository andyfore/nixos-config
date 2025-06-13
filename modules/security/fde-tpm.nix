{ config, pkgs, ... }:
{
  boot.initrd.systemd.enable = true;
  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-partlabel/luks";
  boot.initrd.luks.devices."cryptroot".tpm2 = true;
  # security.tpm2.enable = true;
  # security.tpm2.tss2.enable = true;
  environment.systemPackages = with pkgs; [ tpm2-tools ];
}
