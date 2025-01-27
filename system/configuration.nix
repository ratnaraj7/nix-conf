{
  config,
  pkgs,
  user,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  networking.hostName = user.hostName;
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
  services.locate.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };
  programs = {
    fish.enable = true;
    zsh.enable = true;
  };
  environment.systemPackages = with pkgs; [
    nushell
    zsh
    fish
  ];
  # set /etc/shells to allow specified shell as login shell
  environment.shells = with pkgs; [
    pkgs.${user.loginShell}
  ];
  users.users.${user.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.${user.loginShell};
    packages = with pkgs; [
    ];
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
  # Add flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # todo: move to home manager
  programs.firefox.enable = true;
}
