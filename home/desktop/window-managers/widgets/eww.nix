{pkgs, user,...}: {
  xdg.configFile."eww/eww.yuck".text = user.rice.ewwYuck;
  xdg.configFile."eww/eww.css".text = user.rice.ewwCss;
  home.packages = [
    pkgs.eww
  ];
}