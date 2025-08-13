{ config, pkgs,

lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      scan_timeout = 10;
      add_newline = true;
      character = {
        format = "$symbol ";
        success_symbol = "[ 󱓟](green)";
        error_symbol = "[ 󱓟](red)";
      };
      directory = {
        home_symbol = "";
        format = "[$path ](lavender)[$read_only](red)";
        read_only = " ";
      };
      # ~/.config/starship.toml

      sudo = { symbol = ""; };
      golang = {
        symbol = "  ";
        format = "[$symbol$version](sky)";
      };
      zig = {
        symbol = "  ";
        format = "[$symbol$version](yellow)";
      };
      c = {
        symbol = "  ";
        format = "[$symbol$version]($style)";
        style = "blue";
      };
      python = {
        format = "[$symbol$version](yellow)";
        symbol = "  ";
      };
      bun = {
        format = "[$symbol$version](yellow)";
        symbol = "  ";
      };
      nodejs = {
        format = "[$symbol$version](yellow)";
        symbol = "  ";
      };
      java = {
        symbol = " 󰬷 ";
        format = "[$symbol$version]($style)";
        style = "red";
      };
      rust = {
        format = "[$symbol$version]($style)";
        symbol = "  ";
        style = "bold peach";
      };
      lua = {
        symbol = "  ";
        format = "[$symbol$version]($style)";
      };
      # custom = {
      #   symbol = "  ";
      #   detect_extensions = [ "nix" ];
      #   style = "bold cyan";
      #   command = "nix --version 2>/dev/null | awk '{print $3}'";
      #   format = "[$symbol($output)]($style)";
      # };
      nix_shell = {
        symbol = "  ";
        format = "[$symbol$version](bold cyan)";
      };

      jobs = {
        format = "[$symbol$number]($style) ";
        style = "text";
        symbol = "[ 󱃐 ](mauve italic)";
      };
      aws = {
        format = "[$symbol $profile $region]($style)";
        style = "bold peach";
        symbol = " ";

      };
      docker_context = {
        symbol = " ";
        format = "[$symbol$context]($style)";
        only_with_files = true;
        detect_files =
          [ "docker-compose.yml" "docker-compose.yaml" "Dockerfile" ];
      };

      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$sudo"
        "$jobs"
        "$golang"
        "$lua"
        "$python"
        "$c"
        "$rust"
        "$nix_shell"
        "$zig"
        "$nodejs"
        "$bun"
        "$line_break"
        "$character"
      ];
      right_format = lib.concatStrings [ "$aws" "$docker_context" ];
    };
  };
}
