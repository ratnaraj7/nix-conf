{
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = {
          query = "@class.inner";
          desc = "Select inner part of a class region";
        };
        "as" = {
          query = "@scope";
          queryGroup = "locals";
          desc = "Select language scope";
        };
      };
      selectionModes = {
        "@parameter.outer" = "v"; # charwise
        "@function.outer" = "V"; # linewise
        "@class.outer" = "<c-v>"; # blockwise
      };
      includeSurroundingWhitespace = false;
    };
  };
}
