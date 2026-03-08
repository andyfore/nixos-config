{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    waybar
    fuzzel
    mako
    wl-clipboard
    grim
    slurp
    swaybg
    xwayland-satellite
    networkmanagerapplet
    pavucontrol
    brightnessctl
    playerctl
    brave
  ];
}
