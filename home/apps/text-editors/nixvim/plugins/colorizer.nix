{
  programs.nixvim = {
    plugins.colorizer = {
      enable = true;
      settings = {
        filetypes = [ "*" ];
        user_default_options = {
          tailwind = true;
        };
      };
    };
    autoCmd = [{
      command = "ColorizerAttachToBuffer";
      event = [
        "BufRead"
      ];
    }];
  };
}
