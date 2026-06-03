{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      credential.helper = "store";
      safe.directory = "/etc/nixos";
    };
  };
}
