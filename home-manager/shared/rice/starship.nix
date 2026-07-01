{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format = "$username$hostname$all";
      username = {
        format = "\\[[$user](bold #ca9ee6)";
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[@](bold #babbf1)[$hostname](bold #ca9ee6)\\]";
      };
      directory = {
        format = "\\[[$read_only]($read_only_style)[$path]($style)\\]";
        read_only = " ";
      };
      time = {
        format = "\\[[$time]($style)\\]";
      };
      battery = {
        full_symbol = "🔋 ";
        charging_symbol = "⚡️ ";
        discharging_symbol = "💀 ";
      };
      os = { format = "\\[[$symbol]($style)\\]"; };
      package = {
        format = "\\[[󱍵 $version](bold #81c8be)\\]";
      };
      # package = { format = "\\[[$symbol$version]($style)\\]"; };
      sudo = { format = "\\[[as $symbol]($style)\\]"; };
      cmd_duration = {
        format = "\\[[⏱ $duration]($style)\\]";
        min_time = 10000;
      };
      git_branch = { format = "\\[[$symbol$branch]($style)\\]"; };
      git_status = { format = "([\\[[󰊢 $all_status$ahead_behind](bold #eebebe)\\]](#c6d0f5))"; };
      lua = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "lua";
      };
      nix_shell = {
        format = "\\[[$symbol$state]($style)\\]";
        symbol = "nix ";
      };
      python = {
        format = "\\[[$symbol$pyenv_prefix($version)(\\($virtualenv\\))]($style)\\]";
        symbol = "py ";
      };
      rust = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "rust ";
      };
      bun = {
        format = "\\[[$symbol($version)](bold #ca9ee6)\\]";
        symbol = "bun ";
      };
      nodejs = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "node ";
      };
      java = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "java ";
      };
      ocaml = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "ocaml ";
      };
      golang = {
        format = "\\[[$symbol($version)]($style)\\]";
        symbol = "go ";
      };
      dotnet = {
        format = "\\[[$symbol($version)](bold #85c1dc)\\]";
        symbol = "dotnet ";
      };
      php = {
        format = "\\[[$symbol($version)](bold #85c1dc)\\]";
        symbol = "php ";
      };
      gleam = { 
        format = "\\[[$symbol($version)](bold #ca9ee6)\\]";
        symbol = "gleam ";
      };
      terraform = { 
        format = "\\[[$symbol($version)](bold #ca9ee6)\\]";
        symbol = "terraform ";
      };
      aws = {
        disabled = true;
      };
    };
  };
}
