NixOS Configuration with Flakes
-------------------------------

This repository includes NixOS system and home configurations managed using Flakes.

### Usage

To rebuild and apply your NixOS configuration, use:

```bash
sudo nixos-rebuild switch --flake path:.
```

### Known Issue: Untracked Files in Flakes

Using the command:

```bash
sudo nixos-rebuild switch --flake .
```

can result in the following error due to untracked files:

```bash
error: path '/nix/store/xyz-source/home/default.nix' does not exist
```

See more details here:

*   [GitHub Issue](https://github.com/NixOS/nix/issues/7107)
*   [Discourse Thread](https://discourse.nixos.org/t/path-nix-store-does-not-exist/55413)

**Temporary Fix**:  
Use this command to work around the issue until it's resolved:

```bash
sudo nixos-rebuild switch --flake path:.
```