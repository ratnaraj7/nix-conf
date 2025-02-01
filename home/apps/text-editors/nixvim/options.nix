{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    clipboard = "unnamedplus";
    termguicolors = true;
    wrap = false;
    guicursor = "n-v-c:block";
    list = true;
    listchars = {
      eol = "¬";
      trail = "·";
      tab = "»·";
      space = "·";
    };
  };
}
