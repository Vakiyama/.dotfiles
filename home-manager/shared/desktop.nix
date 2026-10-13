# GUI apps + Wayland rice. Only imported by the desktop/laptop config,
# never by WSL.
{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./apps/opencode.nix
    ./rice/cursor.nix
    ./rice/fuzzel.nix
    ./rice/mako.nix
    ./rice/waybar.nix
  ];

  home.packages = with pkgs;
    [
      adwaita-icon-theme
      brightnessctl
      git-credential-manager
      thunar
      bluetuith

      google-chrome
      discord
      spotify
      feh
      obsidian
      slack
      zlib
      pciutils
      tridactyl-native
      steam
      steam-run
      vulkan-tools
      mysql-workbench
      shutter
      lutris
      ngrok
      r2modman

      # unstable.kdenlive
      obs-studio
      pgmodeler
      pulseeffects-legacy

      ytfzf
      ueberzugpp
      mpv
      pavucontrol
      earbuds
      openal

      kitty

      inputs.zen-browser.packages.${system}.default
      dolphin-emu
      graphite-cli
      prismlauncher
    ];
}
