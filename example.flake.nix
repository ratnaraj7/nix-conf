{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    swww = {
      url = "github:LGFae/swww";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, nixvim, ghostty, swww,... }:
    let
      rices = import ./rices;
      system = "x86_64-linux";
      user = {
        username = "john";
        gitUsername = "johndoe@example.com";
        gitEmail = "johndoe@example.com";
        hostName = "nixos";
        loginShell = "zsh"; # "zsh" | "fish" | "nushell".
        # Note: nushell not working properly as login shell while setting XDG envs.
        # Use POSIX compliant shell as login shell for better support.
        rice = rices.midnightcafe;
        wms = [
          {
            name = "Hyprland";
            terminalEmulatorCommand = "ghostty"; # "kitty" | "ghostty" | "alacritty"
            browserCommand = "firefox"; # "chrome" | "firefox" | "zen"
          }
        ];
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit user;
          };
          inherit system;
          modules = [
            ./system/configuration.nix
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "backup";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user.username} = import ./home;
              home-manager.extraSpecialArgs = {
                inherit user;
                inherit swww;
                inherit nixvim;
                inherit ghostty;
              };
            }
          ];
        };
      };
    };
}
