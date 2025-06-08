{ pkgs
, ...
}:
{
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    cursorTheme = {
      name = "catppuccin-cursors.frappeDark";
      package = pkgs.catppuccin-cursors.frappeDark;
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode:size=16";
        icons-enabled = true;
      };
      border = {
        width = 4;
      };
      colors = {
        background = "303446dd";
        text = "c6d0f5ff";
        match = "ca9ee6ff";
        selection = "626880ff";
        selection-match = "ca9ee6ff";
        selection-text = "c6d0f5ff";
        border = "babbf1ff";
      };
    };
  };
}
