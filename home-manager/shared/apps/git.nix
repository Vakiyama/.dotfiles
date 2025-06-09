{ ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      credential.helper = "store";
      safe.directory = "/etc/nixos";
    };
  };
}
