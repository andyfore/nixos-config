{ config, pkgs, ... }:
{
  services.fwupd.enable = true;
  services.tlp.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
}
