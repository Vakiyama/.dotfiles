{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "xrandr-setup" ''
      xrandr --output HDMI-0 --auto --rate 165 --primary
      sudo virsh net-start default
    '')

    (writeShellScriptBin "cursor" ''
      hyprctl setcursor catppuccin-frappe-dark-cursors 24
    '')

    # (writeShellScriptBin "scream-setup" ''
    #   scream -i virbr0 -p 4011 -u -v
    # '')

    # (writeShellScriptBin "default-network" ''
    #   sudo virsh net-start default
    # '')

    (writeShellScriptBin "gs" ''
      git status
    '')
    (writeShellScriptBin "nd" ''
      nix develop
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
}
