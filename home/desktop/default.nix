{
  pkgs,
  user,
  lib,
  swww,
  ...
}:
let
  hyprlandOptions = lib.head (lib.filter (wm: wm.name == "Hyprland") user.wms);
  #i3Options = lib.head(lib.filter (wm: wm.name == "i3") user.wms);
in
{
  home.packages = [
    swww.packages.${pkgs.system}.swww
  ];
  imports = [
    (
      if hyprlandOptions != null then
        import ./window-managers/hyprland.nix {
          inherit hyprlandOptions;
          extraConfig = user.rice.hyprland;
        }
      else
        null
    )
    #(if i3Options != null then import ./i3.nix { inherit i3Options; } else null)
  ];
}
