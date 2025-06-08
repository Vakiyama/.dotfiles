{ pkgs, inputs, ... }:

{
  imports = [
    ./starship.nix
  ];
  home.username = "Root";
  home.homeDirectory = "/home/Root";

  home.stateVersion = "22.11"; # do not change

  home.pointerCursor = {

    name = "Catppuccin-Frappe-Dark-Cursors";

    package = pkgs.catppuccin-cursors.frappeDark;

    size = 24;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    # migrate from configuration.nix when you have time/patience

    # scripts
    (writeShellScriptBin "xrandr-setup" ''
      xrandr --output HDMI-0 --auto --rate 165 --primary
      sudo virsh net-start default
    '')
    (writeShellScriptBin "cursor" ''
      hyprctl setcursor catppuccin-frappe-dark-cursors 24
    '')
    (writeShellScriptBin "scream-setup" ''
      scream -i virbr0 -p 4011 -u -v
    '')
    (writeShellScriptBin "replace-background" ''
      feh --bg-scale ~/.config/bg.png
    '')
    (writeShellScriptBin "default-network" ''
      sudo virsh net-start default
    '')
    (writeShellScriptBin "gs" ''
      git status
    '')
    (writeShellScriptBin "nd" ''
      nix develop
    '')
    (writeShellScriptBin "pulseshitter" ''
      bash ~/pulseshitter
    '')
    (writeShellScriptBin "power" ''
      cat /sys/class/power_supply/BAT0/capacity
    '')
    (writeShellScriptBin "fs" ''
          # ANSI color codes
      RED='\033[0;31m'
      GREEN='\033[0;32m'
      YELLOW='\033[1;33m'
      NC='\033[0m' # No Color

      # Path to package.json
      PACKAGE_JSON="./package.json"

      # Check if package.json exists in the current directory
      if [ -f "$PACKAGE_JSON" ]; then
    
          # Check if scripts are defined
          if jq -e '.scripts' "$PACKAGE_JSON" > /dev/null; then
              # Process each script entry
              jq -r '.scripts | to_entries | .[] | .key + ": " + .value' "$PACKAGE_JSON" | while IFS= read -r line; do
                  KEY=$(echo "$line" | cut -d ':' -f 1)
                  VALUE=$(echo "$line" | cut -d ':' -f 2-)
                  echo -e "$GREEN $KEY: $NC $VALUE"
              done
          else
              echo -e " $RED No scripts are defined in package.json. $NC"
          fi
      else
          echo -e " $RED package.json not found in the current directory. $NC"
      fi
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/Root/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  systemd.user.sessionVariables = {
    EDITOR = "nvim";
    FZF_DEFAULT_OPTS = " \
          --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
          --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
          --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284";
  };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };


  programs = {
    bash = {
      enable = true;
      bashrcExtra = ''
        # tmux autostart
        if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
            if tmux has-session &>/dev/null; then
                tmux attach-session
            else
                tmux new-session
            fi
        fi

        # launch starship prompt
        eval "$(starship init bash)"

        # graveyard for rm-improved (rip)
        export GRAVEYARD=$HOME/graveyard
      '';
    };
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

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

  services.mako = {
    enable = true;
    defaultTimeout = 4000;
    settings = {
      background-color = "#303446";
      text-color = "#c6d0f5";
      border-color = "#ca9ee6";
      progress-color = "over #414559";
      border-radius = 10;
      border-size = 2;
      padding = 8;
      # on-notify=exec makoctl menu wofi -d -p 'Choose Action: '
    };
    # ''

    #   [urgency=high]
    #   border-color=#ef9f76

    # '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
