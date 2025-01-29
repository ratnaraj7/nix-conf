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
    url = user.rice.wallpaper or "https://images.pexels.com/photos/1876876/pexels-photo-1876876.jpeg";
    sha256 = user.rice.wallpaperSha256 or "1ljgq3n01kfcffic2wal476r07ga6b3s9hljggwnndgbsx7spd7b";
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
