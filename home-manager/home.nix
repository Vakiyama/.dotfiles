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
    (pkgs.writeShellScriptBin "xrandr-setup" ''
        xrandr --output HDMI-0 --auto --rate 165 --primary
        sudo virsh net-start default
        feh --bg-scale ../bg.jpg
    '')
    (pkgs.writeShellScriptBin "scream-setup" ''
        scream -i virbr0 -p 4011 -u -v
    '')
    (pkgs.writeShellScriptBin "replace-background" ''
        feh --bg-scale ../bg.jpg
    '')
    (pkgs.writeShellScriptBin "default-network" ''
        sudo virsh net-start default
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
    home.sessionVariables = {
        EDITOR = "nvim";
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
