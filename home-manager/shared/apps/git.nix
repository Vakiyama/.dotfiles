{ ... }:
{
  programs.bash = {
    enable = true;
    git = {
      enable = true;
      extraConfig = {
        credential.helper = "store";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
