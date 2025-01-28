let
  colors = {
    color00 = "#45475a"; # Dark gray
    color01 = "#f38ba8"; # Red
    color02 = "#a6e3a1"; # Green
    color03 = "#f9e2af"; # Yellow
    color04 = "#89b4fa"; # Blue
    color05 = "#f5c2e7"; # Pink
    color06 = "#94e2d5"; # Cyan
    color07 = "#bac2de"; # Light gray
    color08 = "#585b70"; # Darker gray
    color09 = "#f38ba8"; # Red (duplicate)
    color10 = "#a6e3a1"; # Green (duplicate)
    color11 = "#f9e2af"; # Yellow (duplicate)
    color12 = "#89b4fa"; # Blue (duplicate)
    color13 = "#f5c2e7"; # Pink (duplicate)
    color14 = "#94e2d5"; # Cyan (duplicate)
    color15 = "#a6adc8"; # Light blue-gray
    color16 = "#1e1e2e";
    color17 = "#cdd6f4";
    color18 = "#f5e0dc";
    color19 = "#353749";
    color20 = "#cdd6f4";
  };
in
{

  #wallpaper = "";
  #wallpaperSha256 = "";

  ghostty = ''
    palette = 0=${colors.color00}
    palette = 1=${colors.color01}
    palette = 2=${colors.color02}
    palette = 3=${colors.color03}
    palette = 4=${colors.color04}
    palette = 5=${colors.color05}
    palette = 6=${colors.color06}
    palette = 7=${colors.color07}
    palette = 8=${colors.color08}
    palette = 9=${colors.color09}
    palette = 10=${colors.color10}
    palette = 11=${colors.color11}
    palette = 12=${colors.color12}
    palette = 13=${colors.color13}
    palette = 14=${colors.color14}
    palette = 15=${colors.color15}
    background = ${colors.color16}
    foreground = ${colors.color17}
    cursor-color = ${colors.color18}
    selection-background = ${colors.color19}
    selection-foreground = ${colors.color20}
  '';
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
}
