{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          snippet.expand = ''
            function(args)
              luasnip.lsp_expand(args.body)
            end
          '';
          completion.completeopt = "menu,menuone,noinsert";
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
            "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-j>" = "cmp.mapping.scroll_docs(4)";
            "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          };
          experimental = {
            ghost_text = {
              hl_group = "LspCodeLens";
            };
          };
          formatting.format = ''
            require("tailwindcss-colorizer-cmp").formatter
          '';
          window = {
            completion = {
              border = "rounded";
            };
            documentation = {
              border = "rounded";
            };
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      luasnip = {
        enable = true;
        filetypeExtend = {
          javascript = [ "html" ];
          javascriptreact = [ "html" ];
          typescriptreact = [ "html" ];
          htmldjango = [ "html" ];
          templ = [ "html" ];
        };
        fromVscode = [ { } ];
      };
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tailwindcss-colorizer-cmp";
        src = pkgs.fetchFromGitHub {
          owner = "roobert";
          repo = "tailwindcss-colorizer-cmp.nvim";
          rev = "3d3cd95e4a4135c250faf83dd5ed61b8e5502b86";
          hash = "sha256-PIkfJzLt001TojAnE/rdRhgVEwSvCvUJm/vNPLSWjpY=";
        };
      })
    ];
    extraConfigLua = ''
      require("tailwindcss-colorizer-cmp").setup({
      	color_square_width = 2,
      })
    '';
  };
}
