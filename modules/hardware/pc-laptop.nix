{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = [ "kvm-amd" "amdgpu" ];
  services.fwupd.enable = true;
  services.tlp.enable = true;
}
