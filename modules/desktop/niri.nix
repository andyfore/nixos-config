{ pkgs, ... }:
{
  # Install the niri session for SDDM
  environment.systemPackages = with pkgs; [ niri ];

  # Wayland/XDG bits (match what you had for Hypr)
  services.dbus.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];

  # Xwayland for legacy apps
  programs.xwayland.enable = true;

  # Wayland-friendly env
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  # Optional: auto-select niri at login; otherwise pick it in SDDM
  # services.displayManager.defaultSession = "niri";
}
