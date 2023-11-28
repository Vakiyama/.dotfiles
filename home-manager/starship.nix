{ home, ... }:

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
            os = { format = "\\[[$symbol]($style)\\]"; };
            sudo = { format = "\\[[as $symbol]($style)\\]"; };
            cmd_duration = { 
                format = "\\[[⏱ $duration]($style)\\]"; 
                min_time = 10000;
            };
            git_branch = { format = "\\[[$symbol$branch]($style)\\]"; };
            git_status = { format = "([\\[$all_status$ahead_behind\\]]($style))"; };
            lua = { 
                format = "\\[[$symbol($version)]($style)\\]"; 
                symbol = "lua";
            };
            nix_shell = { 
                format = "\\[[$symbol$state( \\($name\\))]($style)\\]"; 
                symbol = "nix ";
            };
            package = { format = "\\[[$symbol$version]($style)\\]"; };
            python = { 
                format = "\\[[$symbol$pyenv_prefix($version)(\\($virtualenv\\))]($style)\\]"; 
                symbol = "py ";
            };
            rust = { 
                format = "\\[[$symbol($version)]($style)\\]"; 
                symbol = "rs ";
            };
            bun = { 
                format = "\\[[$symbol($version)](bold #ca9ee6)\\]";
                symbol = "bun ";
            };
            nodejs = { 
                format = "\\[[$symbol($version)]($style)\\]";
                symbol = "node ";
            };
        };
    };
}
