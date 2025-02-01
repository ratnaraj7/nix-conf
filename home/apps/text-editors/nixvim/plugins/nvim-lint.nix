{ pkgs, ... }:
{
  home.packages = with pkgs; [
    markdownlint-cli
    djlint
    eslint_d
  ];
  programs.nixvim.plugins.lint = {
    enable = true;
    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      event = "BufWritePost";
    };
    lintersByFt = {
      nix = [ "nix" ];
      htmldjango = [ "djlint" ];
      html = [ "djlint" ];
      markdown = [
        "markdownlint"
      ];
      javascriptreact = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      javascript = [ "eslint_d" ];
    };
  };
}
