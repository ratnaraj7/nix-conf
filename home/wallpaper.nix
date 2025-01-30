{
  user,
  pkgs,
  ...
}:
let
  wallpaperFile = pkgs.fetchurl {
    url = user.rice.wallpaper or "https://images.pexels.com/photos/1876876/pexels-photo-1876876.jpeg";
    sha256 = user.rice.wallpaperSha256 or "1ljgq3n01kfcffic2wal476r07ga6b3s9hljggwnndgbsx7spd7b";
  };
  genWallpaper = pkgs.writeShellScriptBin "genWallpaper" ''
    systemd-run --user swww-daemon
    if [ -e "$XDG_CONFIG_HOME/${user.rice.wallpaperName}" ]; then
      echo "Wallpaper file ${user.rice.wallpaperName} already exists."
      swww img $XDG_CONFIG_HOME/${user.rice.wallpaperName}
      exit 0
    fi

    # Get the mime type of the wallpaper file
    mimeType=$(file --mime-type -b ${wallpaperFile})
    if [[ "$mimeType" =~ video/* ]]; then
      echo "Converting video to GIF using gifski..."
      ${pkgs.gifski}/bin/gifski -o $XDG_CONFIG_HOME/${user.rice.wallpaperName} ${wallpaperFile}
    elif [[ "$mimeType" =~ image/* ]]; then
      echo "File is an image. No conversion needed."
      cp ${wallpaperFile} $XDG_CONFIG_HOME/${user.rice.wallpaperName}
    else
      echo "Unsupported file type: $mimeType"
      exit 1
    fi

    # Create the symlink to the wallpaper file
    swww img $XDG_CONFIG_HOME/${user.rice.wallpaperName}
    chmod +w $XDG_CONFIG_HOME/${user.rice.wallpaperName}
  '';
in
{
  home.packages = with pkgs; [
    genWallpaper
  ];
}
