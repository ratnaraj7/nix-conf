{
  gitEditor ? "nvim",
  ...
}:
{
  imports = [
    ./nixvim
    ./vscode.nix
  ];
  programs.git = {
    extraConfig = {
      core.editor = "nvim";
    };
  };
}
