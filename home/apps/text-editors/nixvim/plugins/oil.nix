{
  programs.nixvim = {
    plugins.oil.enable = true;
    keymaps = [
      {
        action = ":Oil<CR>";
        key = "<leader>o";
        options = {
          silent = true;
          noremap = true;
          desc = "Oil Mapping";
        };
      }
    ];
  };
}
