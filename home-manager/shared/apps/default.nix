{ pkgs, inputs, ... }:
{
  imports = [
    ./fish.nix
    ./nvim.nix
    ./scripts.nix
    ./direnv.nix
    ./git.nix
  ];

  nixpkgs.config =
    {
      allowUnfree = true;
    };

  home.packages = with pkgs;
    [
      adwaita-icon-theme
      brightnessctl
      git-credential-manager
      xfce.thunar
      bluetuith

      google-chrome
      discord
      spotify
      neofetch
      feh
      obsidian
      slack
      ripgrep
      zlib
      yq-go
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

      htop-vim
      prettierd

      eza # better ls (exa)
      rm-improved # safer rm (rip)
      # unstable.kdenlive
      obs-studio
      pgmodeler
      pulseeffects-legacy

      ytfzf
      ueberzugpp
      mpv
      python3
      luajitPackages.luarocks
      unzip
      pavucontrol
      earbuds
      openal


      kitty
      ripgrep

      inputs.zen-browser.packages.${pkgs.system}.default
    ];
}
