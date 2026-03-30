{pkgs, ...}:

{
  home.packages = 
    # Core System Utilities
    (with pkgs; [
      libnotify          # Desktop notifications
      pwvucontrol        # PipeWire volume control
      btop               # System monitor
      lm_sensors         # Hardware sensors
      #nvtopPackages.nvidia # GPU monitoring for btop
      udiskie
    ]) ++

    # File Manager
    (with pkgs; [
      xfce.thunar              # GUI file manager with drag-and-drop
      xfce.thunar-volman       # Automatic device management
      xfce.thunar-archive-plugin  # Archive file support
    ]) ++
    
    # CLI Tools - themed with Catppuccin
    (with pkgs; [
      eza                # Modern 'ls' replacement
      bat                # Modern 'cat' with syntax highlighting
      fzf                # Fuzzy finder
      zoxide             # Smart 'cd' command
      gh                 # GitHub CLI
    ]) ++
    
    # Fonts and Themes
    (with pkgs; [
      nerd-fonts.jetbrains-mono  # Programming font with icons
      papirus-icon-theme
      libsForQt5.qtstyleplugin-kvantum # Qt theme engine for Catppuccin
      qt6Packages.qtstyleplugin-kvantum # Qt6 theme engine
    ]) ++
    
    
    # Essential Development Tools
    (with pkgs; [
      claude-code        # AI coding assistant
      python3            # Python interpreter
      uv                 # Python tool runner (pipx alternative)
      nodejs             # JavaScript runtime
    ]) ++
    
    # Media and Screenshot Tools
    (with pkgs; [
      grim               # Wayland screenshot tool
      slurp              # Screen area selection
      wl-clipboard       # Wayland clipboard
      cliphist           # Clipboard history manager
      loupe              # Image viewer
      cider              # Apple Music client
    ]) ++
    
    # Gaming
    (with pkgs; [
      steam              # Gaming platform
      protonup-qt        # Proton version manager
      gamemode           # Game performance optimization
      gamescope          # Gaming compositor
      vulkan-tools       # Graphics debugging tools
      #prismlauncher      # Minecraft launcher (maintained alternative)
      wowup-cf           # World of Warcraft addon manager (CurseForge)
      #r2modman           # Thunderstore mod manager (Risk of Rain 2, Lethal Company, etc.)
    ]) ++
    
    # Productivity Applications
    (with pkgs; [
      obsidian           # Note-taking and knowledge management
    ]) ++
    
    # Communication (Unstable)
    (with pkgs; [
      discord            # Voice and text chat
    ]) ++
    
    # Audio Production Tools
    (with pkgs; [
      audacity           # Free audio editor
      sox                # Sound processing library
      alsa-utils         # ALSA utilities (PipeWire compatible)
      reaper             # Professional DAW
      ffmpeg-full        # Comprehensive media conversion
      vlc                # Media player with codec support
    ]);
}
