{ config, pkgs, ... }:

{
  services.xserver.enable = false;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu = {
    # load the amdgpu driver earlier
    initrd.enable = true;
    # rocm clr drivers
    opencl.enable = true;
  };

  services.libinput.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
