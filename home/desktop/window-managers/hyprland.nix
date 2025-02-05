{hyprlandOptions, extraConfig ? {}, wallpaperPath ? "",... }:

{
  imports = [
    ./dmenus/tofi.nix
    ./widgets/eww.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      autogenerated = 0;
      monitor = ",preferred,auto,auto";
      "$mainMod" = "SUPER";
      "$terminal" = hyprlandOptions.terminalEmulatorCommand;
      "$fileManager" = "nautilus";
      "$menu" = "tofi-drun --drun-launch=true";
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "bitdepth,10"
      ];
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
        };
        sensitivity = 0;
      };
      dwindle = {
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes";
      };
      master = {
        #new_is_master = true
      };
      gestures = {
        workspace_swipe = "off";
      };
      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        #disable_hyprland_logo = true
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      cursor = {
        no_hardware_cursors = true;
      };
      windowrulev2 = "suppressevent maximize, class:.*";
      windowrule = "move 70% 0,title:^(Keyboard)(.*)$";
      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod_SHIFT, Q, killactive, "
        "$mainMod_SHIFT, E, exit, "
        "$mainMod, V, togglefloating, "
        "$mainMod, D, exec, $menu"
        "$mainMod, P, pseudo, # dwindle"
        #bind = $mainMod, J, togglesplit, # dwindle

        # Move focus with mainMod + arrow keys bind = $mainMod, left, movefocus, l
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
        "$mainMod, F, fullscreen, 0"
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, R, resizewindow"
        "ALT,mouse:272,movewindow"
      ];
      exec-once = [
        "genWallpaper"

        # eww
        "eww daemon"
        "eww open one"
        "eww open two"

        # others
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      exec = [
        # dark mode gtk apps
        "gsettings set org.gnome.desktop.interface gtk-theme \"Default\"" # for GTK3 apps
        "gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"" # for GTK4 apps
      ];
    } // extraConfig;
  };
}
