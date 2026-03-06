{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";

      modules-left = [ "niri/workspaces" "niri/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];
    }];
  };
}
