{ pkgs, ghostty, ... }:
{
  home.packages = [ ghostty.packages.${pkgs.system}.default ];
}
