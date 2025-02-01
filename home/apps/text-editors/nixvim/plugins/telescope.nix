{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
    plugins = {
      telescope = {
        enable = true;
        settings = { };
      };
      mini = {
        enable = true;
        modules.icons.enable = true;
        mockDevIcons = true;
      };
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!node_modules/*,--glob,!dist/*,--glob,!build/*,--glob,!*.lock,--glob,!.git/*,--glob,!*target/<cr>";
        key = "<leader>ff";
        mode = [ "n" ];
      }
      {
        action = "<cmd>Telescope live_grep<cr>";
        key = "<leader>lg";
        mode = [ "n" ];
      }
      {
        action = "<cmd>Telescope buffers<cr>";
        key = "<leader><space>";
        mode = [ "n" ];
      }
    ];
  };
}
