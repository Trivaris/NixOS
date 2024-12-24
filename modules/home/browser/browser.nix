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
    profiles.default = {
      # settings = userPrefs.settings;
      search.engines = {
        "Brave".urls = [{
          template = "https://search.brave.com/search?";
          params = [{
            name = "q";
            value = "{searchTerms}";
          }];
        }];
      };
      search.force = true;
      userChrome = ''  '';
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        proton-pass
        sidebery
        adnauseam
        tab-session-manager
      ];
      
    };
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
