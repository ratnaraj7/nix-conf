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

  fonts = [
    "cascadia-code"
  ];

  removeHash = color: builtins.replaceStrings [ "#" ] [ "" ] color;
in
{

  #wallpaper = "";
  #wallpaperSha256 = "";
  inherit fonts;

  ghostty = ''
    font-family = Cascadia Code
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
  ewwCss = ''
    * {
      all: unset;
    }

    .bar {
      background-color: #0d1017;
      font-family: "Cascadia Code";
    }

    .workspace {
      padding: 8px 0;
    }

    .workspace_button {
      padding: 8px 8px;
      color: #565b66;
    }

    .active_workspace {
      color: #ff8f40;
      font-size: 1.5rem;
    }

    .time {
      background-color: #e6b673;
      color: #11111b;
      padding: 8px 4px;
    }

    .date {
      font-size: 0.7rem;
    }

    .hour_minute {
      font-weight: 400;
    }

    .second {
      font-size: 0.7rem;
    }

    .other {
      padding: 8px 0;
    }

    .icon {
      font-size: 1.5rem;
    }

    .high {
      color: #f07178;
    }

    .medium {
      color: #ffb454;
    }

    .low {
      color: #aad94c;
    }
  '';
  ewwYuck = ''
    (defpoll current_workspace :interval "0ms"
      `hyprctl activeworkspace -j | jq '.id'`)

    (defpoll day :interval "1s"
      `TZ=Asia/Kolkata date +%d`)

    (defpoll month :interval "1s"
      `TZ=Asia/Kolkata date +%m`)

    (defpoll hour :interval "1s"
      `TZ=Asia/Kolkata date +%H`)

    (defpoll minute :interval "1s"
      `TZ=Asia/Kolkata date +%M`)

    (defpoll second :interval "1s"
      `TZ=Asia/Kolkata date +%S`)

    (defwindow one
               :monitor 0
               :geometry (geometry :x "0%"
                                   :y "0%"
                                   :width "10px"
                                   :height "100%"
                                   :anchor "right center")
               :exclusive true
      (box :class "bar"
           :orientation "vertical"
            (workspaces)
            (box :orientation "vertical"
                 :valign "end"
                 :space-evenly false
              (other 
                     :icon ""
                     :high 75
                     :medium 50
                     :value "''${round(EWW_RAM.used_mem_perc, 0)}")
              (other
                    :icon ""
                    :high 75
                    :medium 50
                    :value "''${round(EWW_CPU.avg, 0)}")
              (other :icon ""
                     :high 75
                     :medium 50
                     :value  "''${EWW_TEMPS.CORETEMP_PACKAGE_ID_0}")
              (time))))

    (defwindow two
               :monitor 1
               :geometry (geometry :x "0%"
                                   :y "0%"
                                   :width "10px"
                                   :height "100%"
                                   :anchor "right center")
               :exclusive true
      (box :class "bar"
           :orientation "vertical"
            (workspaces)
            (box :orientation "vertical"
                 :valign "end"
                 :space-evenly false
              (other 
                     :icon ""
                     :high 75
                     :medium 50
                     :value "''${round(EWW_RAM.used_mem_perc, 0)}")
              (other
                    :icon ""
                    :high 75
                    :medium 50
                    :value "''${round(EWW_CPU.avg, 0)}")
              (other :icon ""
                     :high 75
                     :medium 50
                     :value  "''${EWW_TEMPS.CORETEMP_PACKAGE_ID_0}")
              (time))))
            
    (defwidget workspaces []
      (box :orientation "vertical"
           :class "workspace"
           :space-evenly false
           :valign "start"
        (workspace_button :workspace_number "1")
        (workspace_button :workspace_number "2")
        (workspace_button :workspace_number "3")
        (workspace_button :workspace_number "4")
        (workspace_button :workspace_number "5")
        (workspace_button :workspace_number "6")
        (workspace_button :workspace_number "7")
        (workspace_button :workspace_number "8")
        (workspace_button :workspace_number "9")
        (workspace_button :workspace_number "10")))



    (defwidget workspace_button [workspace_number]
      (button :class {current_workspace == workspace_number ? "workspace_button active_workspace" : "workspace_button"}
              :onclick "hyprctl dispatch workspace ''${workspace_number}"
        {current_workspace == workspace_number ? "" : ""}))
                                  

    (defwidget time []
      (box :orientation "vertical"
           :class "time"
        (label :text "''${day}/''${month}"
               :class "date"
               :halign "end")
        (label :text "''${hour}:''${minute}"
               :class "hour_minute")
        (label :text "''${second}"
               :halign "end"
               :class "second")))

    (defwidget other [icon high medium value]
      (box :orientation "horizontal"
           :class "other ''${value >= high ? "high" :
                      value >= medium ? "medium" :
                      "low"}"

          (label :text icon
                 :class "icon")
          (label :text value
                :class "other_text")))
  '';
}
