{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      rm = "rip";
      vi = "nvim";
      ls = "exa --icons -F -H --group-directories-first --git -1";
      lt = "exa --tree --level=2 --long --icons --git";
    };
  };
}
