# WSL-only bits.
{ pkgs, ... }:
{
  home.packages = [
    # Copy the Windows-side configs from the dotfiles:
    #   GlazeWM config  -> %USERPROFILE%\.glzr\glazewm\config.yaml
    #   Flow theme      -> %APPDATA%\FlowLauncher\Themes\
    # Then Super+Shift+R reloads GlazeWM.
    (pkgs.writeShellScriptBin "glaze-sync" ''
      set -eu
      winenv() { wslpath "$(/mnt/c/Windows/System32/cmd.exe /c "echo %$1%" 2>/dev/null | tr -d '\r')"; }

      glaze="$(winenv USERPROFILE)/.glzr/glazewm"
      mkdir -p "$glaze"
      cp "$HOME/.config/glazewm/config.yaml" "$glaze/config.yaml"
      echo "glazewm -> $glaze/config.yaml (Super+Shift+R to reload)"

      flow="$(winenv APPDATA)/FlowLauncher/Themes"
      mkdir -p "$flow"
      cp "$HOME/.config/flow-launcher/Catppuccin Frappe.xaml" "$flow/"
      echo "flow theme -> $flow (pick 'Catppuccin Frappe' in Flow > Appearance)"
    '')
  ];
}
