# Terminal core: shell, prompt, nvim + everything it needs, CLI tools.
# Shared by every machine (desktop, laptop, WSL). No GUI, no Wayland.
# Username / home directory are set per host in flake.nix.
{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./apps/fish.nix
    ./apps/nvim.nix
    ./apps/scripts.nix
    ./apps/direnv.nix
    ./apps/git.nix
    ./rice/starship.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # basics (these lived in NixOS systemPackages on the desktop)
    curl
    wget
    git-lfs
    fzf
    fd
    jq # used by the `fs` script
    yq-go
    tmux
    lazygit
    zip
    unzip
    gnumake

    # nicer coreutils
    eza # `ls` alias
    rm-improved # `rm` alias (rip)
    ripgrep
    bottom

    # nvim build deps: treesitter parsers, blink.cmp, markdown-preview
    gcc
    tree-sitter
    nodejs
    python3
    luajitPackages.luarocks
    inputs.fenix.packages.${system}.minimal.toolchain

    # formatters / LSPs the nvim config calls if present
    prettierd
    nixpkgs-fmt
    nil

    claude-code
  ];

  home.stateVersion = "22.11"; # do not change
  programs.home-manager.enable = true;
}
