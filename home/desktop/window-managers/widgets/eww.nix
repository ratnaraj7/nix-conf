{pkgs, user,...}: {
  xdg.configFile."eww" = {
    source = user.rice.ewwConfigDir;
    recursive = true;
  };
  home.packages = [
    pkgs.eww
  ];
}