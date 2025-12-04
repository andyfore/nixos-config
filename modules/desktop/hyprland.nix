{ pkgs, ... }:
{
    programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";

        # --- XDG Specifications ---
            XDG_SESSION_TYPE = "wayland";
            XDG_CURRENT_DESKTOP = "Hyprland";
            XDG_SESSION_DESKTOP = "Hyprland";
        
        # --- Qt Applications ---
            QT_QPA_PLATFORM = "wayland";
            QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
            QT_AUTO_SCREEN_SCALE_FACTOR = "0";
            QT_SCALE_FACTOR = "1";
            QT_QPA_PLATFORMTHEME = "qt6ct";
        
        # --- GTK Applications ---
            GDK_SCALE = "1";
            GDK_DPI_SCALE = "1";
            GDK_BACKEND = "wayland";
        
        # --- SDL (for some games) ---
            SDL_VIDEODRIVER = "wayland";
        
        # --- Electron / Firefox / General Wayland Hints ---
            OZONE_PLATFORM = "wayland";
            MOZ_ENABLE_WAYLAND = "1";
            ELECTRON_OZONE_PLATFORM_HINT = "auto";
        
        # NixOS-specific hint for Ozone/Electron
            NIXOS_OZONE_WL = "1";
        
        # --- Rendering ---
            LIBGL_ALWAYS_SOFTWARE = "0"; # Avoid software rendering fallbacks
        
        # --- Cursors ---
            XCURSOR_SIZE = "24";
            HYPRCURSOR_SIZE = "24";
            WLR_NO_HARDWARE_CURSORS = "1";
        
        # --- Preferred DRM devices (if uncommented) ---
            # AQ_DRM_DEVICES = "/dev/dri/card1";
            # DRI_PRIME = "0";
        
        # --- Editor preference (optional, often better in shell config) ---
            EDITOR = "nvim";
            VISUAL = "nvim";
    };

    services.dbus.enable = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    hardware.graphics.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
    };
}
