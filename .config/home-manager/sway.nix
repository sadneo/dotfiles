{
  config,
  lib,
  pkgs,
  host,
  ...
}:

let
  isLaptop = host == "nile";
in
{
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      # top level settings
      settings = {
        icons_format = "{icon}";
        theme.theme = "native";
        icons = {
          icons = "material-nf";
          overrides.backlight = [ "" ];
        };
      };

      # block definitions
      blocks =
        (
          if isLaptop then
            [
              {
                block = "backlight";
                device = "intel_backlight";
                missing_format = "";
                cycle = [ 20 ];
              }
              {
                block = "battery";
                device = "DisplayDevice";
                driver = "upower";
                format = " $icon $percentage ";
                charging_format = " $icon $percentage ";
                not_charging_format = " $icon $percentage ";
                missing_format = "";
              }
            ]
          else
            [ ]
        )
        ++ [
          {
            block = "net";
            format = " $icon ";
          }
          {
            block = "sound";
            step_width = 2;
            click = [
              {
                button = "left";
                cmd = "pavucontrol";
              }
              {
                button = "right";
                cmd = "wpctl set-mute @DEFAULT_SINK@ toggle";
              }
            ];
          }
          {
            block = "time";
            format = " $icon $timestamp.datetime(f:'%a %m/%d %l:%M:%S') ";
            interval = 1;
          }
        ];
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Aporetic Serif Mono:size=14";
        icon-theme = "Papirus";
        icons-enabled = "yes";
        image-size-ratio = 1;
        hide-before-typing = "yes";
        lines = 10;
        width = 25;
        horizontal-pad = 10;
        dpi-aware = "no";
        gamma-correct = "yes";
      };
      border = {
        radius = 0;
      };
      colors = {
        background = "FFFCF0FF";
        text = "100F0FFF";
        prompt = "6F6E69FF";
        input = "100F0FFF";
        selection = "E6E4D9FF";
        selection-text = "100F0FFF";
        match = "24837BFF";
        selection-match = "24837BFF";
        border = "CECDC3FF";
      };
    };
  };
}
