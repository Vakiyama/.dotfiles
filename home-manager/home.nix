{ config, pkgs, ... }:

{
    imports = [
        ./starship.nix
    ];
    home.username = "Root";
    home.homeDirectory = "/home/Root";

    home.stateVersion = "22.11"; # do not change

# The home.packages option allows you to install Nix packages into your
# environment.
    home.packages = with pkgs; [
    # migrate from configuration.nix when you have time/patience

    # scripts
    (writeShellScriptBin "xrandr-setup" ''
        xrandr --output HDMI-0 --auto --rate 165 --primary
        sudo virsh net-start default
    '')
    (writeShellScriptBin "scream-setup" ''
        scream -i virbr0 -p 4011 -u -v
    '')
    (writeShellScriptBin "replace-background" ''
        feh --bg-scale ~/.config/bg.jpg
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
        FZF_DEFAULT_OPTS=" \
          --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
          --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
          --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284";
    };

    programs.bash = {
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

    programs = {
        git = {
          enable = true;
          userName  = "Vakiyama";
          userEmail = "vakiyama@outlook.com";
          extraConfig = {
              credential.helper = "store";
          };
        };
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
