# WSL-only bits.
{ pkgs, ... }:
{
  home.packages = [
    # Copy the GlazeWM config from the dotfiles to the Windows side,
    # then reload it (alt+shift+r in GlazeWM).
    (pkgs.writeShellScriptBin "glaze-sync" ''
      set -eu
      win_home=$(wslpath "$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERPROFILE%' 2>/dev/null | tr -d '\r')")
      dest="$win_home/.glzr/glazewm"
      mkdir -p "$dest"
      cp "$HOME/.config/glazewm/config.yaml" "$dest/config.yaml"
      echo "synced -> $dest/config.yaml (alt+shift+r to reload)"
    '')
  ];
}
