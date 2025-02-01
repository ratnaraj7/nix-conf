{ user, nixvim, ... }:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
    ./globals.nix
    nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes = user.rice.nixvimColorscheme;
  };
}
