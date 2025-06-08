{ pkgs
, ...
}:
{
  home.pointerCursor = {
    name = "Catppuccin-Frappe-Dark-Cursors";
    package = pkgs.catppuccin-cursors.frappeDark;
    size = 24;
  };
}
