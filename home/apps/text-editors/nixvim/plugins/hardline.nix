{ user, pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "hardline";
        src = pkgs.fetchFromGitHub {
          owner = "ojroques";
          repo = "nvim-hardline";
          rev = "9b85ebfba065091715676fb440c16a37c465b9a5";
          hash = "sha256-BY5uo5Fo9bAg0cy1GZLMglcc4lVt22q15PKIRIJgqd8=";
        };
      })
    ];
    extraConfigLua = ''
      require('hardline').setup {
        ${user.rice.hardlineSetupStringLua}
      }
    '';
  };
}
