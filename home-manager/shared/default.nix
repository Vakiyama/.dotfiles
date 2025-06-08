{ ... }:

{
  imports = [
    ./apps
    ./rice
  ];
  home.username = "Root";
  home.homeDirectory = "/home/Root";

  home.stateVersion = "22.11"; # do not change

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };



  programs.home-manager.enable = true;
}

