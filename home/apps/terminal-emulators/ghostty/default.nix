{ user, pkgs, ghostty, ... }:
{
  home.packages = [ ghostty.packages.${pkgs.system}.default ];
  xdg.configFile."ghostty/config".text = ''
    command = /etc/profiles/per-user/${user.username}/bin/nu
  '' + user.rice.ghostty;
}
