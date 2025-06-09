{ pkgs, ... }: {

  home.packages = with pkgs;
    [
      waybar
      playerctl
    ];

  # xdg.configFile."waybar/style.css".source = ./waybar.css;
}
