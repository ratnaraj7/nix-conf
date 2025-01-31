{
  programs.nixvim.plugins.lsp = {
    enable = true;
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
}
