{ config, inputs, pkgs, ... }:

{
#  imports = [
#    inputs.niri.homeModules.config
#  ];

  programs.niri = {
    #enable = true;

    settings = {
      prefer-no-csd = true;

      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
        };

        touchpad = {
          tap = true;
          natural-scroll = false;
          click-method = "clickfinger";
        };

        focus-follows-mouse = {
          enable = true;
        };
      };

      outputs = {
        "eDP-1" = {
          scale = 2.0;
        };
      };

      layout = {
        gaps = 8;
        center-focused-column = "never";
        default-column-width = { proportion = 0.5; };
      };

      spawn-at-startup = [
        { command = [ "waybar" ]; }
        { command = [ "mako" ]; }
        { command = [ "xwayland-satellite" ]; }
        { command = [ "nm-applet" "--indicator" ]; }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "alacritty";
        "Mod+D".action = spawn "fuzzel";
        "Mod+Q".action = close-window;
        "Mod+Shift+E".action = quit;
        "Mod+F".action = fullscreen-window;
        "Mod+Left".action = focus-column-left;
      };
    };
  };
}
