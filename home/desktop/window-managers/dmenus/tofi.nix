{ user, ... }:
let
  settings = user.rice.tofiSettings or {};
in
{
  programs.tofi = {
    enable = true;
    inherit settings;
  };
}
