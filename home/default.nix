{
  config,
  pkgs,
  user,
  ...
}:

{
  imports = [
    ./shells.nix
    ./display-managers
    ./desktop
    ./apps
  ];
  home.username = user.username;
  home.homeDirectory = "/home/" + user.username;
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    plocate
    ripgrep
    jq
    eza
    fzf
    nixfmt-rfc-style

    # misc
    file
    which
    tree
    nautilus

    # remove these fonts, and use
    # fonts according to themes
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
  fonts.fontconfig.enable = true;
  programs.git = {
    enable = true;
    userName = user.gitUsername;
    userEmail = user.gitEmail;
  };
  programs.gh.enable = true;
  # bash required for xdg.enable
  programs.bash.enable = true;
  xdg.enable = true;
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
