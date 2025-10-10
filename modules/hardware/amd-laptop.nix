{ config, pkgs, ... }:
{
    services.fwupd.enable = true;
    services.tlp.enable = true;

}
