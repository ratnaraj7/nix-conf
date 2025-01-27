{
  midnightcafe = {
    #wallpaper = "";
    #wallpaperSha256 = "";
    nixvimColorscheme = {
      catppuccin = {
        enable = true;
        settings = {
          flavour = "frappe";
        };
      };
    };
    tofiSettings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      font = "monospace";
      background-color = "#000a";
      #selection
      selection-color = "#d95757";
      selection-background = "#0d1017";
      selection-background-padding = 8;
      selection-background-corner-radius = 4;
      selection-match-color = "#ffb454";
    };
    ewwConfigDir = ./eww-midnightcafe;
    hyprland = {
      general = {
        gaps_in = 12;
        gaps_out = 12;
        border_size = 4;
        "col.active_border" = "rgba(e6b673ff) rgba(e6b673ff) 0deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };
      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 4;
          passes = 1;
        };
        #drop_shadow = "yes";
        #shadow_range = 4;
        #shadow_render_power = 3;
        #"col.shadow" = "rgba(1a1a1aee)";
        inactive_opacity = 1;
        active_opacity = 1;
      };
      animations = {
        enabled = false;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
    };
  };
}
