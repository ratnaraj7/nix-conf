{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      ts_ls.enable = true;
    };
  };
}