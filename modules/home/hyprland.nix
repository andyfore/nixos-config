{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # Important with UWSM
    systemd.enable = false;

    settings = {
      monitor = [
        "eDP-1,preferred,auto,1.6"
      ];

      exec-once = [
        "waybar"
        "mako"
        "nm-applet --indicator"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, alacritty"
        "$mod, D, exec, fuzzel"
        "$mod, Q, killactive,"
        "$mod SHIFT, E, exit,"
        "$mod, F, fullscreen,"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
          tap-to-click = true;
          clickfinger_behavior = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
      };
    };
  };
}
