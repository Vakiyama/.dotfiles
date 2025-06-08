{ ... }:
{
  programs = {
    bash = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      extraConfig = {
        credential.helper = "store";
      };
    };

    # dconf.settings = {
    #   "org/gnome/desktop/interface" = {
    #     color-scheme = "prefer-dark";
    #   };
    # };
  };
}
