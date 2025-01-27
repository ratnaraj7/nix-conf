{ user, nixvim, ... }:
{
  imports = [
    ./plugins
    nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes = user.rice.nixvimColorscheme;
  };
}
