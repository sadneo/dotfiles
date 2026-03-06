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
}
