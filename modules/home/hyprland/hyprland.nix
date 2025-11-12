{ config, lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "exec-once" = [
        "uwsm app -- nm-applet"
        "waypaper --restore"
        "uwsm app -- hyprpm reload"
        "uwsm app -- blueman-applet"
        "uwsm app -- kdeconnectd"
        "uwsm app -- swayosd-server"
      ];
    };
  };
}
