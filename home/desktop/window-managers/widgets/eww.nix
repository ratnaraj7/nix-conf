{pkgs, user,...}: {
  xdg.configFile."eww.yuck".text = user.rice.ewwYuck;
  xdg.configFile."eww.css".text = user.rice.ewwCss;
  home.packages = [
    pkgs.eww
  ];
}