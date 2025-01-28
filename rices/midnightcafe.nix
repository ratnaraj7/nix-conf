{ lib, ... }:
let
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
  color16 = "#1e1e2e"; # Dark gray
  color17 = "#cdd6f4"; # Light blue
  color18 = "#f5e0dc"; # Peach
  color19 = "#353749"; # Slate
  color20 = "#cdd6f4"; # Light blue

  removeHash = color: builtins.replaceStrings [ "#" ] [ "" ] color;
in
{

  #wallpaper = "";
  #wallpaperSha256 = "";

  ghostty = ''
    window-padding-x = 32
    window-padding-y = 32
    palette = 0=${color00}
    palette = 1=${color01}
    palette = 2=${color02}
    palette = 3=${color03}
    palette = 4=${color04}
    palette = 5=${color05}
    palette = 6=${color06}
    palette = 7=${color07}
    palette = 8=${color08}
    palette = 9=${color09}
    palette = 10=${color10}
    palette = 11=${color11}
    palette = 12=${color12}
    palette = 13=${color13}
    palette = 14=${color14}
    palette = 15=${color15}
    background = ${color16}
    foreground = ${color17}
    cursor-color = ${color18}
    selection-background = ${color19}
    selection-foreground = ${color20}
    background-opacity = 0.8
  '';
  nixvimColorscheme = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
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
    selection-background-padding = 8;
    selection-background-corner-radius = 4;
    #colors
    background-color = "#000a";
    selection-color = color17;
    selection-background = color19;
    selection-match-color = color01;
  };
  ewwConfigDir = ./eww-midnightcafe;
  hyprland = {
    general = {
      gaps_in = 12;
      gaps_out = 12;
      border_size = 1;
      "col.active_border" = "rgba(${removeHash color01}ff) rgba(${removeHash color01}ff) 0deg";
      "col.inactive_border" = "rgba(${removeHash color08}ff)";
      layout = "dwindle";
      allow_tearing = false;
    };
    decoration = {
      rounding = 4;
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
  starshipSettings = {
    format = lib.concatStrings [
      "$line_break"
      "$line_break"
      "$directory"
      "$git_branch"
      "$git_status"
      "$fill"
      "$deno"
      "$golang"
      "$lua"
      "$nodejs"
      "$python"
      "$rust"
      "$nix_shell"
      "$cmd_duration"
      "$line_break"
      "$character"
    ];
    add_newline = true;
    character = {
      success_symbol = "[ 󱞩](bold green)";
      error_symbol = "[ 󱞩](bold red)";
    };
    directory = {
      style = "none fg:" + color04;
      format = "[$path ]($style)";
      truncation_length = 3;
      truncation_symbol = ".../";
      truncate_to_repo = false;
    };
    fill = {
      symbol = " ";
    };
    git_branch = {
      symbol = " ";
      format = "[on](white) [$symbol$branch ]($style)";
    };
    cmd_duration = {
      min_time = 0;
    };
    python = {
      style = "teal";
      symbol = " ";
      format = "[$symbol$pyenv_prefix($version )(\($virtualenv\) )]($style)";
      pyenv_version_name = true;
      pyenv_prefix = "";
    };
    lua = {
      symbol = " ";
    };
    nodejs = {
      style = "blue";
      symbol = " ";
    };
    golang = {
      style = "blue";
      symbol = " ";
    };
    haskell = {
      style = "blue";
      symbol = " ";
    };
    rust = {
      style = "orange";
      symbol = " ";
    };
    ruby = {
      style = "blue";
      symbol = " ";
    };
  };
}
