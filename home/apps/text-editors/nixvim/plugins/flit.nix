{
  programs.nixvim.plugins = {
    leap.enable = true;
    repeat.enable = true;
    flit = {
      enable = true;
      settings = {
        labeled_modes = "nx";
      };
    };
  };
}
