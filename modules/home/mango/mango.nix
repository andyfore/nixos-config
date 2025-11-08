{ config, lib, pkgs, ... }:
{
  wayland.windowManager.mango = {
    enable = true;

    # Optional: export session env to systemd/dbus so apps pick it up
    systemd.enable = true;
    systemd.variables = [
      "DISPLAY" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP" "XDG_SESSION_TYPE"
      "NIXOS_OZONE_WL" "XCURSOR_THEME" "XCURSOR_SIZE"
    ];
    systemd.extraCommands = [
      "systemctl --user reset-failed"
      "systemctl --user start mango-session.target"
    ];

    # Minimal working config; expand as you migrate binds/workflows
    settings = ''
      # Super is Mod4
      modifier Mod4

      # basic navigation
      bind Mod4+h focus left
      bind Mod4+l focus right
      bind Mod4+j focus down
      bind Mod4+k focus up

      # spawn
      bind Mod4+Return exec ${pkgs.alacritty}/bin/alacritty
      bind Mod4+d      exec ${pkgs.wofi}/bin/wofi --show drun

      # session
      bind Mod4+Shift+q quit
      bind Mod4+Shift+r reload

      # Example output (adjust to your ASUS panel connector)
      # output eDP-1 scale 1.0 mode 1920x1200@60 position 0,0
    '';

    autostart_sh = ''
      # Clipboard history
      ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store &
      ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store &

      # Panel (optional)
      if command -v waybar >/dev/null 2>&1; then waybar & fi

      # Wallpaper example with swww:
      # ${pkgs.swww}/bin/swww init
      # ${pkgs.swww}/bin/swww img ~/Pictures/walls/current.jpg
    '';
  };

  home.packages = with pkgs; [
    waybar wofi wl-clipboard grim slurp cliphist
    pavucontrol brightnessctl
    # optional: swww mako swayidle swaylock-effects
  ];
}

