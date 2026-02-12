{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
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

    libreoffice-qt6-fresh
    gimp
    losslesscut-bin
    piper

    vscode
    chromium
    arduino-ide
    pkgs-unstable.godot-mono

    # Theme stuff
    papirus-icon-theme
    bibata-cursors

    # CLI dev tools
    gh
    tmux
    cloc
    tree-sitter
    lua-language-server
    ruff
    nixfmt-rfc-style
    clippy
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
