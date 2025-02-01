let
  options = {
    noremap = true;
    silent = true;
  };
in
{
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp.enable = true;
      lsp = {
        preConfig = ''
          local border = {
              { '╭', 'FloatBorder' }, -- top-left corner
              { '─', 'FloatBorder' }, -- top border
              { '╮', 'FloatBorder' }, -- top-right corner
              { '│', 'FloatBorder' }, -- right border
              { '╯', 'FloatBorder' }, -- bottom-right corner
              { '─', 'FloatBorder' }, -- bottom border
              { '╰', 'FloatBorder' }, -- bottom-left corner
              { '│', 'FloatBorder' }, -- left border
          }
          vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'white' })
          local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
          function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
          end
        '';
        enable = true;
        capabilities = "require('cmp_nvim_lsp').default_capabilities()";
        servers = {
          nixd.enable = true;
          ts_ls.enable = true;
          templ.enable = true;
          astro.enable = true;
          denols = {
            enable = true;
            rootDir = "require(\"lspconfig\").util.root_pattern(\"deno.json\", \"deno.jsonc\")";
          };
          eslint.enable = true;
          html = {
            enable = true;
            filetypes = [
              "html"
              "templ"
              "htmldjango"
            ];
          };
          htmx = {
            enable = true;
            filetypes = [
              "html"
              "templ"
              "htmldjango"
            ];
          };
          tailwindcss = {
            enable = true;
            filetypes = [
              "html"
              "templ"
              "htmldjango"
              "jsx"
              "typescriptreact"
              "javascriptreact"
              "rust"
              "templ"
            ];
          };
          lua_ls.enable = true;
          clangd.enable = true;
          pylsp.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          terraformls = {
            enable = true;
            filetypes = [
              "terraform"
              "tf"
            ];
          };
          gopls = {
            enable = true;
            cmd = [ "gopls" ];
            filetypes = [
              "go"
              "gomod"
              "gowork"
              "gotmpl"
            ];
            rootDir = "require(\"lspconfig\").util.root_pattern(\"go.work\", \"go.mod\", \".git\")";
            settings = {
              gopls = {
                gofumpt = true;
              };
            };
          };
          #rust_analyzer = {
          #  enable = true;
          #  settings = {
          #    "rust-analyzer" = {
          #      imports = {
          #        granularity = {
          #          group = "module";
          #        };
          #        prefix = "self";
          #      };
          #      cargo = {
          #        buildScripts.enable = true;
          #      };
          #      procMacro.enable = true;
          #      checkOnSave = {
          #        command = "clippy";
          #      };
          #      completion = {
          #        autoimport.enable = true;
          #      };
          #    };
          #  };
          #};
        };
      };
    };
    keymaps = [
      {
        key = "gd";
        mode = [ "n" ];
        action = "<cmd>Telescope lsp_definitions<CR>";
        options = options // {
          desc = "Show LSP definitions";
        };
      }
      {
        key = "gi";
        mode = [ "n" ];
        action = "<cmd>Telescope lsp_implementations<CR>";
        options = options // {
          desc = "Show LSP implementations";
        };
      }
      {
        key = "gt";
        mode = [ "n" ];
        action = "<cmd>Telescope lsp_type_definitions<CR>";
        options = options // {
          desc = "Show LSP type definitions";
        };
      }
      {
        key = "<leader>ca";
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = options // {
          desc = "See available code actions";
        };
      }
      {
        key = "<leader>rn";
        mode = [
          "n"
        ];
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options = options // {
          desc = "Smart rename";
        };
      }
      {
        key = "<leader>D";
        mode = [
          "n"
        ];
        action = "<cmd>Telescope diagnostics bufnr=0<CR>";
        options = options // {
          desc = "Show buffer diagnostics";
        };
      }
      {
        key = "<leader>d";
        mode = [
          "n"
        ];
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options = options // {
          desc = "Show line diagnostics";
        };
      }
      {
        key = "[d";
        mode = [
          "n"
        ];
        action = "<cmd>lua vim.diagnostic.goto_prev({ count = -1, float = true })<CR>";
        options = options // {
          desc = "Go to previous diagnostic";
        };
      }
      {
        key = "]d";
        mode = [
          "n"
        ];
        action = "<cmd>lua vim.diagnostic.goto_next({ count = 1, float = true })<CR>";
        options = options // {
          desc = "Go to next diagnostic";
        };
      }
      {
        key = "K";
        mode = [
          "n"
        ];
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options = options // {
          desc = "Show documentation for what is under cursor";
        };
      }
      {
        key = "<leader>rs";
        mode = [
          "n"
        ];
        action = "<cmd>LspRestart<CR>";
        options = options // {
          desc = "Restart LSP";
        };
      }
      {
        key = "gR";
        mode = [ "n" ];
        action = "<cmd>Telescope lsp_references<CR>";
        options = options // {
          desc = "Show LSP references";
        };
      }
      {
        key = "gD";
        mode = [ "n" ];
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        options = options // {
          desc = "Go to declaration";
        };
      }
    ];
  };
}
