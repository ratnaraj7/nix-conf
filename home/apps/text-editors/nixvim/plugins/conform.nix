{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    prettierd
    stylua
    isort
    black
  ];
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        python = [
          "isort"
          "black"
        ];
        javascript = [ "prettierd" ];
        html = [ "prettierd" ];
      };
      format_on_save = ''
        function(bufnr)
          -- Disable "format_on_save lsp_fallback" for lanuages that don't
          -- have a well standardized coding style. You can add additional
          -- lanuages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
          }
        end
      '';
    };
  };
}
