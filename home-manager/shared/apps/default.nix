{ pkgs, inputs, ... }:
{
  imports = [
    ./bash.nix
    ./nvim.nix
    ./scripts.nix
  ];

  home.packages = with pkgs; [
    xborders
    # vm stuff
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    hyprpaper
    brightnessctl
    wl-clipboard
    git-credential-manager
    xfce.thunar
    bluetuith
    deno

    inputs.zen-browser.packages.${pkgs.system}.specific

  ];
}
