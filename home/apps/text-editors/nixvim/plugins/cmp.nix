{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      codeium-nvim
      plenary-nvim
      # prevent using nixvim to manage lspkind,
      # conflicts with cmp formatting
      lspkind-nvim
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
      require("codeium").setup({})
    '';
    plugins = {
      friendly-snippets.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
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
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          sources = [
            { name = "codeium"; }
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
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-j>" = "cmp.mapping.scroll_docs(4)";
            "<C-k>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";

            # luasnip
            "<C-l>" = ''
              cmp.mapping(function()
                if require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                end
              end, { 'i', 's' })
            '';
            "<C-h>" = ''
              cmp.mapping(function()
                if require("luasnip").locally_jumpable(-1) then
                  require("luasnip").jump(-1)
                end
              end, { 'i', 's' })
            '';
          };
          experimental = {
            ghost_text = {
              hl_group = "LspCodeLens";
            };
          };
          formatting.format = ''
            function(entry, vim_item)
              vim_item = require("tailwindcss-colorizer-cmp").formatter(entry,vim_item)
              local lspkind_f = require("lspkind").cmp_format({
                menu = {
                  codeium = "[Codeium]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[api]",
                  path = "[path]",
                  luasnip = "[snip]",
                  buffer = "[buffer]"
                }
              })
              return lspkind_f(entry,vim_item)
            end
          '';
          window = {
            completion = {
              border = "rounded";
            };
            documentation = {
              border = "rounded";
            };
          };
          enabled = {
            __raw = ''
              function()
                    local files = {
                      "oil",
                    }
                    local buffer = vim.bo.filetype
                    for _, f in ipairs(files) do
                      if buffer == f then
                        return false
                      end
                    end
                    return true
              end
            '';
          };
        };
      };
    };
  };
}
