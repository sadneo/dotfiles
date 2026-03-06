{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  imports = [
    ./status.nix
  ];

  home.username = "aidan";
  home.homeDirectory = "/home/aidan";
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Applications (grouped by importance)
    librewolf
    obsidian
    discord
    moonlight-qt

    pavucontrol
    nemo
    seahorse
    mission-center
    opensnitch-ui

    libreoffice-qt6-fresh
    gimp
    losslesscut-bin
    piper

    vscode
    chromium
    arduino-ide
    (pkgs-unstable.symlinkJoin {
      name = "godot-wrapped";
      paths = [ pkgs-unstable.godot_4-mono ];
      buildInputs = [ pkgs-unstable.makeWrapper ];
      postBuild = ''
        # 1. Wrap the binary
        wrapProgram $out/bin/godot4-mono \
          --add-flags "--single-window" \
          --set WLR_NO_HARDWARE_CURSORS "1"

        # 2. Fix the .desktop file
        # Remove the read-only symlink created by symlinkJoin
        rm $out/share/applications/*.desktop

        # Copy the actual file into our wrapper's directory
        cp ${pkgs-unstable.godot_4-mono}/share/applications/*.desktop $out/share/applications/

        # Nix copies inherit read-only permissions; we must make it writable before sed can edit it
        chmod +w $out/share/applications/*.desktop

        # Overwrite the Exec line
        sed -i "s|^Exec=.*|Exec=$out/bin/godot4-mono|g" $out/share/applications/*.desktop
      '';
    })

    # Theme stuff
    papirus-icon-theme
    bibata-cursors
    yaru-theme

    # CLI dev tools
    gh
    tmux
    cloc
    tree-sitter
    lua-language-server
    ruff
    nixfmt-rfc-style
    shfmt
    distrobox
    pkgs-unstable.opencode
    tectonic
    texliveFull

    # CLI miscellaneous tools
    wf-recorder
    ffmpeg
    jq
    fzf
    imagemagick
    alsa-utils
    playerctl
    macchina
    pfetch-rs
    neofetch
    btop
    speedtest-cli
  ];

  # Programs
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Aporetic Serif Mono:size=14,Symbols Nerd Font Mono:size=14";
        include = "${pkgs.foot.themes}/share/foot/themes/solarized-light";
        gamma-correct-blending = "yes";
        resize-delay-ms = 0;
        utmp-helper = "none";
      };

      csd = {
        size = 0;
      };
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "foot";
    shortcut = "j";
    baseIndex = 1;
    mouse = true;

    keyMode = "vi";

    extraConfig = ''
      # --- General Settings ---
      bind c new-window -c "#{pane_current_path}"
      set-option -sa terminal-overrides ",foot:Tc"
      set -s set-clipboard on
      set -sg escape-time 0

      bind L \
          rename-window -t 1 'code' \; \
          new-window -t 2 -n 'util' \; \
          new-window -t 3 -n 'agent' 'opencode' \; \
          select-window -t 1

      # --- Solarized Light Theme (Flexoki Logic) ---
      # Backgrounds: bg_1=#fdf6e3, bg_2=#eee8d5
      # Text: tx_1=#52676f, tx_2=#657b83
      # Accents: Red=#d70000, Green=#5f8700, Yellow=#af8700, Blue=#0087ff

      set -g status-style "bg=#fdf6e3,fg=#52676f"
      set -g status-justify "left"
      set -g status-left-length "100"
      set -g status-right-length "100"

      # Messages & Panes
      set -g message-style "fg=#52676f,bg=#eee8d5,align=centre"
      set -g pane-border-style "fg=#e9e2cb"
      set -g pane-active-border-style "fg=#0087ff"

      # Status Left: [Prefix Indicator] [Session]
      set -g status-left "#[fg=#fdf6e3]#{?client_prefix,#[bg=#d70000],#[bg=#5f8700]}  #S "

      # Status Right: [Branch Symbol] [Branch Name]
      set -g status-right "#[fg=#fdf6e3,bg=#af8700]  #(git -C #{pane_current_path} branch --show-current 2>/dev/null) "

      # Window Formats
      setw -g window-status-format "#[bg=#eee8d5,fg=#657b83] #I[#W] "
      setw -g window-status-current-format "#[bg=#fdf6e3,fg=#52676f,bold] #I[#W] "

      # Modes & Selection
      setw -g mode-style "fg=#fdf6e3,bg=#af8700,bold"
    '';
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;

    nix-direnv.enable = true;

    config.global = {
      warn_timeout = 0;
      hide_env_diff = true;
    };
  };

  # User Services
  ## Desktop capabilities
  services.network-manager-applet.enable = true;
  services.kanshi = {
    enable = true;
    systemdTarget = "";
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
        profile.exec = [
          "swaymsg output eDP-1 bg ~/Media/wallpapers/oil_flowers.jpg fill"
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "HDMI-A-2";
            status = "enable";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
        ];
        profile.exec = [
          "swaymsg output HDMI-A-2 bg ~/Media/wallpapers/oil_flowers.jpg fill"
        ];
      }
    ];
  };

  ## Auto mount
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nemo}/bin/nemo";
      };
    };
  };

  ## Battery check
  systemd.user.services.battery-check = {
    Unit = {
      Description = "Check battery level and send notification";
    };
    Service = {
      Type = "oneshot";
      Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin";
      ExecStart = "%h/.local/bin/battery-check";
    };
  };

  systemd.user.timers.battery-check = {
    Unit = {
      Description = "Run battery-check every minute";
    };
    Timer = {
      OnBootSec = "30s";
      OnUnitActiveSec = "1m";
      AccuracySec = "10s";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

  # Preferences
  ## GTK theme
  gtk = {
    enable = true;
    theme.name = "Orchis";
    iconTheme.name = "Papirus";
  };

  ## Gnome
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = [
        "caps:escape_shifted_capslock"
        "lv3:ralt_switch"
      ];
    };
  };

  ## XDG mime types
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # add applications here like
      # "image/jpeg" = "librewolf.desktop";
    }
    // (lib.genAttrs [
      "image/jpeg"
      "image/png"
      "image/gif"
      "image/webp"
      "image/svg+xml"
      "image/bmp"
      "image/tiff"
      "image/avif"
      "image/x-icon"

      "text/html"
      "application/x-ipynb+json"
      "application/pdf"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"

      # Videos
      "video/mp4" # .mp4 (Most common)
      "video/webm" # .webm (Modern web standard)
      "video/ogg" # .ogv (Open standard)
      "video/x-matroska" # .mkv (Common for high-quality local rips)
      "video/quicktime" # .mov (Apple devices)
      "video/x-msvideo" # .avi (Legacy windows)
    ] (_: "librewolf.desktop"));
  };
}
