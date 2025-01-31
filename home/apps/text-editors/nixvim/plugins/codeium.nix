{ pkgs, ... }:
let
  options = {
    expr = true;
    silent = true;
  };
in
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      codeium-nvim
      plenary-nvim
    ];
    extraConfigLua = ''
      require("codeium").setup({})
    '';
    plugins.cmp.settings.sources = [ { name = "codeium"; } ];
  };
}
