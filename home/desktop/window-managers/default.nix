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

  wallpaperFile = pkgs.fetchurl {
    url = user.rice.wallpaper or "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWJta2k1aml4NXc1emJ3djl5MWJucnB3MzBlbnduOGpydnBqa2UyOSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/KWcGnX2iz0G1fMMHrO/giphy.gif";
    sha256 = "035aq7fhsnxiggp2kdz5y3n9420x63qgi9y8rl4arh1x3d4zqd84";
  };
in
{
  home.packages = [
    swww.packages.${pkgs.system}.swww
  ];
  xdg.configFile."wallpaper".source = wallpaperFile;
  imports = [
    (
      if hyprlandOptions != null then
        import ./hyprland.nix {
          inherit hyprlandOptions;
          extraConfig = user.rice.hyprland;
        }
      else
        null
    )
    #(if i3Options != null then import ./i3.nix { inherit i3Options; } else null)
  ];
}
