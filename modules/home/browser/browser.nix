{
  inputs,
  pkgs,
  host,
  ...
}:
let
  userPrefs = import ./userPrefs.nix;
in
{

  programs.librewolf = {
    enable = true;
    settings = userPrefs.settings;
  };

  /* home.packages = (
    with pkgs;
    [
      (
        if (host == "laptop") then
           inputs.zen-browser.packages."${system}".generic
        else
           inputs.zen-browser.packages."${system}".specific
      )
    ]
  ); */
}
